--[[
    ShopControl
    Author: SleepSoul (Discord: sleepsoul)
    Dependencies: ModUtil, RCLib
    Force the contents of shops and Wells.
]]
ModUtil.Mod.Register( "ShopControl" )

local config = {
    Enabled = true,
	CheckEligibility = true,
    FillWithEligible = true,
    SortWells = true,
}
ShopControl.config = config

ShopControl.CurrentRunData = {}

ShopControl.WellRerollNum = 1

function ShopControl.CheckItemEligibility( item, lookupTable, args )
    args = args or {}
    item = item or {}
    local itemName = item.Item
    local itemCode = lookupTable[itemName]
    local itemType = RCLib.InferItemType( itemCode )
    local overrides = item.Overrides or {}

    if not itemCode then return false end

    if item.AlwaysEligible or not ShopControl.config.CheckEligibility then
        return true
    end

    if itemType == "Trait" then
        return IsTraitEligible( CurrentRun, TraitData[itemCode] )
    end

    if overrides.ReplaceRequirements == nil and not ( StoreItemEligible( RCLib.InferItemData( itemCode ), args ) or overrides.SkipRequirements ) then
        return false
    elseif overrides.ReplaceRequirements and not IsGameStateEligible( CurrentRun, overrides.ReplaceRequirements ) then
        return false
    end

    return true
end

function ShopControl.BuildShopList( forced, lookupTable, args )
    local output = {}

    for index, data in pairs( forced ) do
        local forcedItem = {}
        local itemCode = lookupTable[data.Item]
        local itemType = RCLib.InferItemType( itemCode )
        local overrides = data.Overrides or {}

        if ShopControl.CheckItemEligibility( data, lookupTable, args ) then
            forcedItem = { Name = itemCode, Type = itemType }
            if data.Item == "Boon" or data.Item == "UpgradedBoon" then
                forcedItem.Args = {
                    BoughtFromShop = true,
                    DoesNotBlockExit = true,
                    Cost = GetProcessedValue( ConsumableData[itemCode].Cost )
                }

                local godCode = RCLib.EncodeBoonSet( data.GodName )
                if LootData[godCode] and ( RCLib.CheckGodEligibility( godCode ) or data.AlwaysEligible or not ShopControl.config.CheckEligibility ) then
                    forcedItem.Args.ForceLootName = godCode
                else
                    forcedItem.Args.ForceLootName = GetEligibleInteractedGod()
                end
            end

            ModUtil.Table.Merge( forcedItem, overrides )
            output[index] = forcedItem
        end
    end

    return output
end

ModUtil.Path.Wrap( "StartRoom", function( baseFunc, ... )
	ShopControl.WellRerollNum = 1 -- Always 1 at the start of a room. Added to when a menu is rerolled
	baseFunc( ... )
end, ShopControl )

ModUtil.Path.Wrap( "FillInShopOptions", function( baseFunc, args )
    if not ShopControl.config.Enabled then return baseFunc( args ) end

    local store = {}
    local forced = RCLib.GetFromList( ShopControl.CurrentRunData, { dataType = "shop", rerollNum = ShopControl.WellRerollNum } )
    local lookupTable = RCLib.NameToCode.WellItems
    if CurrentRun.CurrentRoom.ChosenRewardType == "Shop" then
        lookupTable = RCLib.NameToCode.ShopRewards
    end

    local options = ShopControl.BuildShopList( forced, lookupTable, args )

    if ShopControl.config.FillWithEligible then
        local baseStore = baseFunc( args )

        for index, data in pairs( baseStore.StoreOptions ) do
            if options[index] == nil and not ModUtil.IndexArray.Get( forced, { index, "EmptySlot" } ) then
                options[index] = data
            end
        end
    end

    if ShopControl.config.SortWells and CurrentRun.CurrentRoom.ChosenRewardType ~= "Shop" then
        options = CollapseTableOrderedByKeys( options )
    end
    
    store.StoreOptions = options

    return store
end, ShopControl )

ModUtil.Path.Wrap( "CreateStoreButtons", function( baseFunc ) -- Twists
    baseFunc()

    if not ShopControl.config.Enabled
    or CurrentRun.CurrentRoom.ChosenRewardType == "Shop"
    then return end

    local forced = RCLib.GetFromList( ShopControl.CurrentRunData, { dataType = "shop", rerollNum = ShopControl.WellRerollNum } )

    for index, data in pairs( forced ) do
        if data.Item == "FatefulTwist" and data.Contents then
            local forcedContents = RCLib.EncodeWellItem( data.Contents )
            local contentsType = RCLib.InferItemType( forcedContents )
            local forcedArgs = { Traits = {}, Consumables = {} }

            if contentsType == "Trait" then
                table.insert( forcedArgs.Traits, forcedContents )
            end
            if contentsType == "Consumable" then
                table.insert( forcedArgs.Consumables, forcedContents )
            end

            if ModUtil.IndexArray.Get( CurrentRun, { "CurrentRoom", "Store", "StoreOptions", index } ) then
                CurrentRun.CurrentRoom.Store.StoreOptions[index].UseFunctionArgs = forcedArgs
            end
        end
    end
end, ShopControl )

ModUtil.Path.Context.Wrap( "UnwrapRandomLoot", function( spawnId ) -- Random bags
    ModUtil.Path.Wrap( "GiveLoot", function( baseFunc, args )
        args = args or {}
        local shopItems = ModUtil.Path.Get( "CurrentRoom.Store.SpawnedStoreItems", CurrentRun ) or {}
        local forcedShopData = RCLib.GetFromList( ShopControl.CurrentRunData, { dataType = "shop" } )

        if ShopControl.config.Enabled then
            for i, itemData in pairs( shopItems ) do
                if itemData.ObjectId == spawnId then
                    local randomBagData = forcedShopData[i] or {}
                    args.ForceLootName = RCLib.EncodeBoonSet( randomBagData.Contents ) or args.ForceLootName
                    break
                end
            end
        end

        return baseFunc( args )
    end, ShopControl )
end, ShopControl )

ModUtil.Path.Context.Wrap( "AttemptPanelReroll", function( )
	ModUtil.Path.Wrap( "UpdateRerollUI", function( baseFunc, ... )
		local locals = ModUtil.Locals.Stacked()
        local screenName = ModUtil.Path.Get( "screen.Name", locals )

		if screenName == "Store" then
			ShopControl.WellRerollNum = CurrentRun.CurrentRoom.SpentRerolls[screenName] + 1
        end
		baseFunc( ... )
	end, ShopControl )
end, ShopControl )

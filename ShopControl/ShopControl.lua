--[[
    ShopControl
    Author: SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Force the contents of shops.
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

ModUtil.Path.Wrap( "StartRoom", function( baseFunc, ... )
	ShopControl.WellRerollNum = 1 -- Always 1 at the start of a room. Added to when a menu is rerolled
	baseFunc( ... )
end, ShopControl )

ModUtil.Path.Wrap( "FillInShopOptions", function( baseFunc, args )
    if not ShopControl.config.Enabled then
        return baseFunc( args )
    end

    local store = {}
    local options = {}
    local forced = RCLib.GetFromList( ShopControl.CurrentRunData, { dataType = "shop", rerollNum = ShopControl.WellRerollNum } )
    local lookupTable = RCLib.NameToCode.WellItems
    if CurrentRun.CurrentRoom.ChosenRewardType == "Shop" then
        lookupTable = RCLib.NameToCode.ShopRewards
    end

    for index, data in ipairs( forced ) do
        local forcedItem = {}
        local itemCode = lookupTable[data.Item] or nil
        local itemType = RCLib.InferItemType( itemCode )
        local godCode = RCLib.EncodeBoonSet( data.Name ) or GetEligibleInteractedGod()
        local isValid = false
        local overrides = data.Overrides or {}

        if forcedItem.AlwaysEligible or not ShopControl.config.CheckEligibility then
            isValid = true
        elseif Contains( args.ExclusionNames, itemCode ) then
            isValid = false
        elseif itemType == "Trait" then
            isValid = IsTraitEligible( CurrentRun, TraitData[itemCode] )
        else
            isValid = ( overrides.ReplaceRequirements == nil and ( StoreItemEligible( RCLib.InferItemData( itemCode ), args ) or overrides.SkipRequirements ))
            or ( overrides.ReplaceRequirements and IsGameStateEligible( CurrentRun, overrides.ReplaceRequirements) )
        end

        if isValid then
            forcedItem = { Name = itemCode, Type = itemType }
            if data.Item == "Boon" then
                forcedItem.Type = "Boon"
                forcedItem.Args = {
                    ForceLootName = godCode,
                    BoughtFromShop = true,
                    DoesNotBlockExit = true,
                    Cost = GetProcessedValue( ConsumableData.RandomLoot.Cost )
                }
            end

            ModUtil.Table.Merge( forcedItem, overrides )
            options[index] = forcedItem
        end
    end

    if ShopControl.config.FillWithEligible then
        local baseStore = baseFunc( args )

        for index, data in ipairs( baseStore.StoreOptions ) do
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

ModUtil.Path.Wrap( "CreateStoreButtons", function( baseFunc )
    baseFunc()

    if not ShopControl.config.Enabled
    or CurrentRun.CurrentRoom.ChosenRewardType == "Shop"
    then return end

    local forced = RCLib.GetFromList( ShopControl.CurrentRunData, { dataType = "shop", rerollNum = ShopControl.WellRerollNum } )

    for index, data in ipairs( forced ) do
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

            CurrentRun.CurrentRoom.Store.StoreOptions[index].UseFunctionArgs = forcedArgs
        end
    end
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

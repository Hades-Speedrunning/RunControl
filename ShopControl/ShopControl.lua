--[[
    ShopControl
    Author: SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Force the contents of shops.
]]
ModUtil.Mod.Register( "ShopControl" )

local config = {
    Enabled = true,
}
ShopControl.config = config

ShopControl.CurrentRunData = {}

ShopControl.WellRerollNum = 1

ModUtil.Path.Wrap( "StartRoom", function( baseFunc, currentRun, currentRoom )
	ShopControl.WellRerollNum = 1 -- Always 1 at the start of a room. Added to when a menu is rerolled
	baseFunc( currentRun, currentRoom )
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
        local overrides = data.Overrides or {}

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
    store.StoreOptions = options

    if IsEmpty( store.StoreOptions ) then
        return baseFunc( args )
    end
    
    return store
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

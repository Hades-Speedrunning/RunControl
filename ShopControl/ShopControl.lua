--[[
    ShopControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Force the contents of shops.
]]
ModUtil.Mod.Register("ShopControl")

local config = {
    Enabled = true,
}
ShopControl.config = config

ShopControl.CurrentRunData = {}

ShopControl.StoreRerollNum = 1

ModUtil.Path.Wrap( "StartRoom", function( baseFunc, currentRun, currentRoom )
	ShopControl.StoreRerollNum = 1 -- Always 1 at the start of a room. Added to when a menu is rerolld
	baseFunc( currentRun, currentRoom )
end, ShopControl )

ModUtil.Path.Wrap( "FillInShopOptions", function( baseFunc, args )
    if not ShopControl.config.Enabled then
        return baseFunc( args )
    end

    local store = {}
    local options = {}
    local forced = RCLib.GetFromList( ShopControl.CurrentRunData, { rerollNum = ShopControl.StoreRerollNum } )
    local lookupTable = RCLib.NameToCode.WellItems
    if CurrentRun.CurrentRoom.ChosenRewardType == "Shop" then
        lookupTable = RCLib.NameToCode.ShopRewards
    end

    for index, data in ipairs( forced ) do
        local itemCode = lookupTable[data.Item] or nil
        local itemType = RCLib.InferItemType( itemCode )
        local godCode = RCLib.EncodeBoonSet( data.Name ) or GetEligibleInteractedGod()

        options[index] = { Name = itemCode, Type = itemType }
        if data.Item == "Boon" then
            options[index].Type = "Boon"
            options[index].Args = {
                ForceLootName = godCode,
                BoughtFromShop = true,
                DoesNotBlockExit = true,
                Cost = GetProcessedValue( ConsumableData.RandomLoot.Cost )
            }
        end
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

		if locals.screen.Name == "Store" then
			local godCode = locals.screen.SubjectName
			local godRerollId = locals.button.RerollId
			ShopControl.StoreRerollNum = CurrentRun.CurrentRoom.SpentRerolls.Store + 1
		end
		baseFunc( ... )
	end, ShopControl )
end, ShopControl )

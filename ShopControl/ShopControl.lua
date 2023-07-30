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

ModUtil.Path.Wrap( "FillInShopOptions", function( baseFunc, args )
    if not ShopControl.config.Enabled then
        return baseFunc( args )
    end

    local store = {}
    local options = {}
    local forced = RCLib.GetFromList( ShopControl.CurrentRunData )

    for index, data in ipairs( forced ) do
        local rewardCode = RCLib.EncodeShopReward( data.Reward ) or nil
        local godCode = RCLib.EncodeBoonSet( data.Name ) or GetEligibleInteractedGod()

        options[index] = { Name = rewardCode, Type = "Consumable" }
        if data.Reward == "Boon" then
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

    return store
end, ShopControl )

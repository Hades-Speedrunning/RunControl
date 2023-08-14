--[[
    SellControl
    Author: SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Force the contents of sell wells.
]]
ModUtil.Mod.Register( "SellControl" )

local config = {
    Enabled = true,
    FillIfEmpty = false, -- If true, will default to a vanilla sell well if you define an empty one
}
SellControl.config = config

SellControl.CurrentRunData = {}

SellControl.SellWellRerollNum = 1

ModUtil.Path.Wrap( "StartRoom", function( baseFunc, currentRun, currentRoom )
    SellControl.SellWellRerollNum = 1 -- Always 1 at the start of a room. Added to when a menu is rerolled
	baseFunc( currentRun, currentRoom )
end, SellControl )

ModUtil.Path.Wrap( "GenerateSellTraitShop", function( baseFunc, currentRun, currentRoom, args )
    local forced = RCLib.GetFromList( SellControl.CurrentRunData, { rerollNum = SellControl.SellWellRerollNum } )
    
    if not SellControl.config.Enabled or IsEmpty( forced ) then
        return baseFunc( currentRun, currentRoom, args )
    end

	GenerateSellTraitValues( currentRun, currentRoom, args )
    local sellOptions = {}
    for index, data in ipairs( forced ) do
        if TableLength( sellOptions ) >= 3 then break end

        local boonName = data.Name
        local boonCode = RCLib.EncodeBoon( boonName )
        local boonValue = data.Value or 0

        if HeroHasTrait( boonCode ) then
            table.insert( sellOptions, { Name = boonCode, Value = boonValue } )
        end
    end
    currentRoom.SellOptions = sellOptions

    if IsEmpty( currentRoom.SellOptions ) and SellControl.config.FillIfEmpty then
        currentRoom.SellOptions = nil
        return baseFunc( currentRun, currentRoom, args )
    end
end, SellControl )

ModUtil.Path.Context.Wrap( "AttemptPanelReroll", function( )
	ModUtil.Path.Wrap( "UpdateRerollUI", function( baseFunc, ... )
		local locals = ModUtil.Locals.Stacked()
        local screenName = ModUtil.Path.Get( "screen.Name", locals )
        
		if screenName == "SellTraitScript" then
			SellControl.SellWellRerollNum = CurrentRun.CurrentRoom.SpentRerolls[screenName] + 1
		end

		baseFunc( ... )
	end, SellControl )
end, SellControl )

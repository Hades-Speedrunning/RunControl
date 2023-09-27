--[[
    SellControl
    Author: SleepSoul (Discord: sleepsoul)
    Dependencies: ModUtil, RCLib
    Force the contents of Pools of Purging.
]]
ModUtil.Mod.Register( "SellControl" )

local config = {
    Enabled = true,
    FillWithEligible = true,
}
SellControl.config = config

SellControl.CurrentRunData = {}

SellControl.SellWellRerollNum = 1

ModUtil.Path.Wrap( "StartRoom", function( baseFunc, currentRun, currentRoom )
    SellControl.SellWellRerollNum = 1 -- Always 1 at the start of a room. Added to when a menu is rerolled
	baseFunc( currentRun, currentRoom )
end, SellControl )

ModUtil.Path.Wrap( "GenerateSellTraitShop", function( baseFunc, currentRun, currentRoom, args )
    local forced = RCLib.GetFromList( SellControl.CurrentRunData, { dataType = "sellWell", rerollNum = SellControl.SellWellRerollNum } )
    
    if not SellControl.config.Enabled or IsEmpty( forced ) then
        return baseFunc( currentRun, currentRoom, args )
    end

    local sellOptions = {}
    local maxOptions = 3 -- TODO possible LootChoiceExt compat
    for index, data in ipairs( forced ) do
        if TableLength( sellOptions ) >= maxOptions then break end

        local boonName = data.Name
        local boonCode = RCLib.EncodeBoon( boonName )
        local boonValue = data.Value or 0

        if HeroHasTrait( boonCode ) then
            table.insert( sellOptions, { Name = boonCode, Value = boonValue } )
        end
    end

    if SellControl.config.FillWithEligible then
        GenerateSellTraitValues( currentRun, currentRoom, args )
        local neededEmptySlots = 0
        for index, trait in ipairs( forced ) do
            if trait.EmptySlot then
                neededEmptySlots = neededEmptySlots + 1
            end
        end

		for i = 1, maxOptions do
			if IsEmpty( currentRoom.SellValues ) or TableLength( sellOptions ) + neededEmptySlots >= maxOptions then
                break
            end

			local baseSellOption = RemoveRandomValue( currentRoom.SellValues )

            local isValid = true
            for index, trait in ipairs( sellOptions ) do
                if trait.Name == baseSellOption.Name then
                    isValid = false
                end
            end

            if isValid then table.insert( sellOptions, baseSellOption ) end
		end
    end

    currentRoom.SellOptions = sellOptions
end, SellControl )

ModUtil.Path.Context.Wrap( "AttemptPanelReroll", function()
	ModUtil.Path.Wrap( "UpdateRerollUI", function( baseFunc, ... )
		local locals = ModUtil.Locals.Stacked()
        local screenName = ModUtil.Path.Get( "screen.Name", locals )
        
		if screenName == "SellTraitScript" then
			SellControl.SellWellRerollNum = CurrentRun.CurrentRoom.SpentRerolls[screenName] + 1
		end

		baseFunc( ... )
	end, SellControl )
end, SellControl )

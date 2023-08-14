--[[
    RoomControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Force certain rooms to be offered on each chamber door.
]]
ModUtil.Mod.Register("RoomControl")

local config = {
    Enabled = true,
    RequireForcedSpecials = true, -- Will not spawn special objects (Chaos gates, wells, etc) unless they are forced
}
RoomControl.config = config

RoomControl.CurrentRunData = {}

ModUtil.Path.Context.Wrap( "LeaveRoom", function( baseFunc, ... )
    local roomData = RCLib.GetFromList( RoomControl.CurrentRunData, { chamberNum = GetRunDepth( CurrentRun ) + 1 } )

    ModUtil.Path.Wrap( "RunShopGeneration", function( baseFunc, ... )
        CurrentRun.CurrentRoom.Flipped = roomData.Flipped or CurrentRun.CurrentRoom.Flipped
        baseFunc( ... )
    end, RoomControl )
end, RoomControl )

ModUtil.Path.Wrap( "DoUnlockRoomExits", function( baseFunc, run, room )
    local forcedDoors = RCLib.GetFromList( RoomControl.CurrentRunData ).Doors or {}

    if not IsEmpty( forcedDoors ) then
        run.CurrentRoom.FirstAppearanceNumExitOverrides = nil
    end

    return baseFunc( run, room )
end, RoomControl )

ModUtil.Path.Context.Wrap( "DoUnlockRoomExits", function( baseFunc, run, room )
    local forcedDoors = RCLib.GetFromList( RoomControl.CurrentRunData ).Doors or {}

    ModUtil.Path.Wrap( "ChooseNextRoomData", function( baseFunc, currentRun, args )
        args = args or {}

        local doorIndex = ModUtil.Locals.Stacked().index
        if forcedDoors[doorIndex] and forcedDoors[doorIndex].RoomName then
            args.ForceNextRoom = forcedDoors[doorIndex].RoomName
        end

        return baseFunc( currentRun, args )
    end, RoomControl )

    ModUtil.Path.Wrap( "CreateRoom", function( baseFunc, roomData, args)
        local room = baseFunc( roomData, args )

        local doorIndex = ModUtil.Locals.Stacked().index
        if forcedDoors[doorIndex] and forcedDoors[doorIndex].IsMinibossWing then
            room.UseOptionalOverrides = true
            for key, value in pairs( room.OptionalOverrides ) do
                room[key] = value
            end
        end

        return room
    end, RoomControl )
end, RoomControl )

ModUtil.Path.Context.Wrap( "HandleSecretSpawns", function( baseFunc, ... )
    local roomData = RCLib.GetFromList( RoomControl.CurrentRunData )

    ModUtil.Path.Wrap( "IsSecretDoorEligible", function( baseFunc, ... ) -- Chaos gate spawn
        local isChaosForced = ModUtil.Path.Get( "Special.ChaosGate.Force", roomData )
        if RoomControl.config.RequireForcedSpecials then
            return isChaosForced or false
        end
        return isChaosForced or baseFunc( ... )
    end, RoomControl )
    
    ModUtil.Path.Wrap( "ChooseNextRoomData", function( baseFunc, currentRun, args ) -- Chaos room choice
        args = args or {}

        local forcedRoomName = ModUtil.Path.Get( "Special.ChaosGate.RoomName", roomData )
        args.ForceNextRoom = forcedRoomName or args.ForceNextRoom

        return baseFunc( currentRun, args )
    end, RoomControl )

    ModUtil.Path.Wrap( "IsShrinePointDoorEligible", function( baseFunc, ... ) -- Erebus gate spawn
        local isErebusForced = ModUtil.Path.Get( "Special.ErebusGate.Force", roomData )
        if RoomControl.config.RequireForcedSpecials then
            return isErebusForced or false
        end
        return isErebusForced or baseFunc( ... )
    end, RoomControl )

    ModUtil.Path.Wrap( "IsChallengeSwitchEligible", function( baseFunc, ... ) -- Trove spawn
        local isTroveForced = ModUtil.Path.Get( "Special.Trove.Force", roomData )
        if RoomControl.config.RequireForcedSpecials then
            return isTroveForced or false
        end
        return isTroveForced or baseFunc( ... )
    end, RoomControl )
    
    ModUtil.Path.Wrap( "IsWellShopEligible", function( baseFunc, ... ) -- Well spawn
        local isWellForced = ModUtil.Path.Get( "Special.Well.Force", roomData )
        if RoomControl.config.RequireForcedSpecials then
            return isWellForced or false
        end
        return isWellForced or baseFunc( ... )
    end, RoomControl )
        
    ModUtil.Path.Wrap( "IsSellTraitShopEligible", function( baseFunc, ... ) -- Sell well spawn
        local isSellWellForced = ModUtil.Path.Get( "Special.SellWell.Force", roomData )
        if RoomControl.config.RequireForcedSpecials then
            return isSellWellForced or false
        end
        return isSellWellForced or baseFunc( ... )
    end, RoomControl )
end, RoomControl )

ModUtil.Path.Wrap( "HandleBreakableSwap", function( baseFunc, currentRoom )
    local roomData = RCLib.GetFromList( RoomControl.CurrentRunData )
    local goldPotNum = ModUtil.Path.Get( "Special.GoldPotNum", roomData )
    if not goldPotNum and RoomControl.config.RequireForcedSpecials then
        return
    elseif not goldPotNum then
        return baseFunc( currentRoom )
    end

	local roomBreakableData = currentRoom.BreakableValueOptions
	local legalBreakables = FindAllSwappableBreakables()
	if IsEmpty( legalBreakables ) then
		return
	end

    goldPotNum = math.min( goldPotNum, TableLength( legalBreakables ) )

    for index = 1, goldPotNum, 1 do
		local breakableData = RemoveRandomValue( legalBreakables )
		if breakableData == nil then
			return
		end
		local valueOptions = breakableData.ValueOptions
		for k, swapOption in ipairs( valueOptions ) do
			if swapOption.GameStateRequirements == nil or IsGameStateEligible( CurrentRun, swapOption, swapOption.GameStateRequirements ) then
                SetAnimation({ DestinationId = breakableData.ObjectId, Name = swapOption.Animation, OffsetY = swapOption.OffsetY or 0 })
                RecordObjectState( currentRoom, breakableData.ObjectId, "Animation", swapOption.Animation )
                breakableData.MoneyDropOnDeath = swapOption.MoneyDropOnDeath
                RecordObjectState( currentRoom, breakableData.ObjectId, "MoneyDropOnDeath", breakableData.MoneyDropOnDeath )
                DebugPrint({ Text = "HandleBreakableSwap: an up-valued breakable has spawned somewhere in this room." })
                OverwriteTableKeys(breakableData, swapOption.DataOverrides)
                break
			end
		end
    end
end, RoomControl )

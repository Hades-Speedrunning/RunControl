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
        local flipped = roomData.Flipped
        CurrentRun.CurrentRoom.Flipped = flipped or CurrentRun.CurrentRoom.Flipped
        baseFunc( ... )
    end, RoomControl )
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
end, RoomControl )

ModUtil.Path.Context.Wrap( "HandleSecretSpawns", function( baseFunc, ... )
    local roomData = RCLib.GetFromList( RoomControl.CurrentRunData )

    ModUtil.Path.Wrap( "IsSecretDoorEligible", function( baseFunc, ... ) -- Chaos gate spawn
        local isChaosForced = ModUtil.Path.Get( "Special.ChaosGate.Force", roomData )
        if RoomControl.config.RequireForcedSpecials then
            isChaosForced = isChaosForced or false
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
            isErebusForced = isErebusForced or false
        end
        return isErebusForced or baseFunc( ... )
    end, RoomControl )

    ModUtil.Path.Wrap( "IsChallengeSwitchEligible", function( baseFunc, ... ) -- Trove spawn
        local isTroveForced = ModUtil.Path.Get( "Special.Trove.Force", roomData )
        if RoomControl.config.RequireForcedSpecials then
            isTroveForced = isTroveForced or false
        end
        return isTroveForced or baseFunc( ... )
    end, RoomControl )
    
    ModUtil.Path.Wrap( "IsWellShopEligible", function( baseFunc, ... ) -- Well spawn
        local isWellForced = ModUtil.Path.Get( "Special.Well.Force", roomData )
        if RoomControl.config.RequireForcedSpecials then
            isWellForced = isWellForced or false
        end
        return isWellForced or baseFunc( ... )
    end, RoomControl )
        
    ModUtil.Path.Wrap( "IsSellTraitShopEligible", function( baseFunc, ... ) -- Sell well spawn
        local isSellWellForced = ModUtil.Path.Get( "Special.SellWell.Force", roomData )
        if RoomControl.config.RequireForcedSpecials then
            isSellWellForced = isSellWellForced or false
        end
        return isSellWellForced or baseFunc( ... )
    end, RoomControl )
end, RoomControl )
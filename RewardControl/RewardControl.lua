--[[
    RewardControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Force certain rewards to appear, per-chamber.
]]
ModUtil.Mod.Register("RewardControl")

local config = {
    Enabled = true,
}
RewardControl.config = config

RewardControl.CurrentRunData = {}

ModUtil.Path.Context.Wrap( "DoUnlockRoomExits", function( baseFunc, run, room )
    local forcedDoors = RCLib.GetFromList( RewardControl.CurrentRunData, { dataType = "exitDoors" } )

    ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, ... )
        local doorIndex = ModUtil.Locals.Stacked().index
        local doorReward
        local baseReward = baseFunc( ... )

        if forcedDoors[doorIndex] and forcedDoors[doorIndex].Reward then
            doorReward = RCLib.EncodeRoomReward( forcedDoors[doorIndex].Reward )
        end

        return doorReward or baseReward
    end, RewardControl )

    ModUtil.Path.Wrap( "SetupRoomReward", function( baseFunc, currentRun, room, previouslyChosenRewards, args )
        local doorIndex = ModUtil.Locals.Stacked().index

        if room.ChosenRewardType == "Boon" and not room.ForceLootName and forcedDoors[doorIndex] and forcedDoors[doorIndex].GodName then
            room.ForceLootName = RCLib.EncodeBoonSet( forcedDoors[doorIndex].GodName )
        end
        
        baseFunc( currentRun, room, previouslyChosenRewards, args )
    end, RewardControl )
end, RewardControl )

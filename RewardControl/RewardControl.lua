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
    local forcedRewards = RCLib.GetFromList( RewardControl.CurrentRunData )

    ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, ... )
        local doorIndex = ModUtil.Locals.Stacked().index
        if forcedRewards[doorIndex] and forcedRewards[doorIndex].Reward then
            local doorReward = RCLib.EncodeRoomReward( forcedRewards[doorIndex].Reward )
        end
        return doorReward or baseFunc( ... )
    end, RewardControl )

    ModUtil.Path.Wrap( "SetupRoomReward", function( baseFunc, currentRun, room, previouslyChosenRewards, args )
        local doorIndex = ModUtil.Locals.Stacked().index
        if room.ChosenRewardType == "Boon" and not room.ForceLootName and forcedRewards[doorIndex] and forcedRewards[doorIndex].Name then
            room.ForceLootName = RCLib.EncodeBoonSet( forcedRewards[doorIndex].Name )
        end
        baseFunc( currentRun, room, previouslyChosenRewards, args )
    end, RewardControl )
end, RewardControl )

--[[
    RewardControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Force certain rewards to appear, per-chamber.
]]
ModUtil.Mod.Register( "RewardControl" )

local config = {
    Enabled = true,
}
RewardControl.config = config

RewardControl.CurrentRunData = {}

ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, run, room, rewardStoreName, previouslyChosenRewards, args ) -- c1 reward
    local rewardToUse = baseFunc( run, room, rewardStoreName, previouslyChosenRewards, args )
    local forcedReward = RCLib.GetFromList( RewardControl.CurrentRunData, { dataType = "startingReward" } )

    if not ( RewardControl.config.Enabled ) then
		return rewardToUse
	end
    if room.Name ~= "RoomOpening" then -- Other rewards are handled separately
		return rewardToUse
	end
    
    if forcedReward.Reward then
        rewardToUse = RCLib.EncodeRoomReward( forcedReward.Reward ) or rewardToUse
    end
    if forcedReward.Name then
        room.ForceLootName = RCLib.EncodeBoonSet( forcedReward.Name )
    end

    return rewardToUse
end, RewardControl)

ModUtil.Path.Context.Wrap( "DoUnlockRoomExits", function( baseFunc, run, room ) -- All other rewards
    local forcedDoors = RCLib.GetFromList( RewardControl.CurrentRunData, { dataType = "exitDoors" } )

    ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, ... )
        local doorIndex = ModUtil.Locals.Stacked().index
        local doorReward
        local baseReward = baseFunc( ... )

        if RewardControl.config.Enabled and forcedDoors[doorIndex] and forcedDoors[doorIndex].Reward then
            doorReward = RCLib.EncodeRoomReward( forcedDoors[doorIndex].Reward )
        end

        return doorReward or baseReward
    end, RewardControl )

    ModUtil.Path.Wrap( "SetupRoomReward", function( baseFunc, currentRun, room, previouslyChosenRewards, args )
        local doorIndex = ModUtil.Locals.Stacked().index
        local forcedGodName = ModUtil.IndexArray.Get( forcedDoors, { doorIndex, "GodName" } )

        if RewardControl.config.Enabled and room.ChosenRewardType == "Boon" and not room.ForceLootName and forcedGodName then
            room.ForceLootName = RCLib.EncodeBoonSet( forcedGodName )
        end
        
        baseFunc( currentRun, room, previouslyChosenRewards, args )
    end, RewardControl )
end, RewardControl )

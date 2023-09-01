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

    return rewardToUse
end, RewardControl)

ModUtil.Path.Context.Wrap( "DoUnlockRoomExits", function( baseFunc, run, room ) -- All other rewards
    local forcedDoors = RCLib.GetFromList( RewardControl.CurrentRunData, { dataType = "exitDoors" } )

    ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, run, room, rewardStoreName, previouslyChosenRewards, args )
        local doorIndex = ModUtil.Locals.Stacked().index
        local forcedReward = ModUtil.IndexArray.Get( forcedDoors, { doorIndex } ) or {}
        local rewardName

        if RewardControl.config.Enabled and forcedReward.Reward then
            rewardName = RCLib.EncodeRoomReward( forcedReward.Reward )
            if forcedReward.IsEliteRoom then
                forcedReward.Overrides = forcedReward.Overrides or {}
                local eliteOverrides = RCLib.EliteRewardOverrides[forcedReward.Reward] or {}

                ModUtil.Table.Merge( forcedReward.Overrides, eliteOverrides )
            end
            room.RewardOverrides = forcedReward.Overrides
        end

        return rewardName or baseFunc( run, room, rewardStoreName, previouslyChosenRewards, args )
    end, RewardControl )

    ModUtil.Path.Wrap( "SetupRoomReward", function( baseFunc, currentRun, room, previouslyChosenRewards, args )
        baseFunc( currentRun, room, previouslyChosenRewards, args )
        
        if not RewardControl.config.Enabled then return end
        
        local doorIndex = ModUtil.Locals.Stacked().index
        local forcedGodName = ModUtil.IndexArray.Get( forcedDoors, { doorIndex, "GodName" } )
        local forcedFirstGodName = ModUtil.IndexArray.Get( forcedDoors, { doorIndex, "FirstGodName" } )
        local forcedSecondGodName = ModUtil.IndexArray.Get( forcedDoors, { doorIndex, "SecondGodName" } )

        if room.ChosenRewardType == "Boon" and forcedGodName then
            room.ForceLootName = RCLib.EncodeBoonSet( forcedGodName )
        end

        if room.ChosenRewardType == "Devotion" then
            if forcedFirstGodName then
                room.Encounter.LootAName = RCLib.EncodeBoonSet( forcedFirstGodName )
            end
            if forcedSecondGodName then
                room.Encounter.LootBName = RCLib.EncodeBoonSet( forcedSecondGodName )
            end
        end
    end, RewardControl )
end, RewardControl )

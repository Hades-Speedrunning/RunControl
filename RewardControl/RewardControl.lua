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
    CheckEligibility = true,
}
RewardControl.config = config

RewardControl.CurrentRunData = {}

ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, run, room, ... ) -- c1 reward
    local rewardToUse = baseFunc( run, room, ... )
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

ModUtil.Path.Context.Wrap( "DoUnlockRoomExits", function() -- All other rewards
    local forcedDoors = RCLib.GetFromList( RewardControl.CurrentRunData, { dataType = "exitDoors" } )

    ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, run, room, rewardStoreName, previouslyChosenRewards, args )
        local doorIndex = ModUtil.Locals.Stacked().index
        local forcedReward = forcedDoors[doorIndex] or {}
        local rewardName = RCLib.EncodeRoomReward( forcedReward.Reward )
        local isValid = true

        if not RewardControl.config.Enabled or not forcedReward.Reward then
            return baseFunc( run, room, rewardStoreName, previouslyChosenRewards, args )
        end

        if not rewardName then
            isValid = false
        end
        if not IsRoomRewardEligible( run, room, RCLib.InferItemData( rewardName ), previouslyChosenRewards, args ) and not ( forcedReward.AlwaysEligible or not RewardControl.config.CheckEligibility ) then
            isValid = false
        end

        if isValid then
            local overrides = forcedReward.Overrides or {}

            if forcedReward.Reward == "Trial" then
                ModUtil.Table.Merge( overrides, { RewardPreviewIcon = "RoomElitePreview", RewardBoostedAnimation = "RoomRewardAvailableRareSparkles" } )
            end

            if forcedReward.IsEliteRoom then
                local eliteOverrides = RCLib.EliteRewardOverrides[forcedReward.Reward] or {}
                ModUtil.Table.Merge( overrides, eliteOverrides )
            end

            room.RewardOverrides = overrides
            return rewardName
        end

        return baseFunc( run, room, rewardStoreName, previouslyChosenRewards, args )
    end, RewardControl )

    ModUtil.Path.Wrap( "SetupRoomReward", function( baseFunc, run, room, ... )
        baseFunc( run, room, ... )

        if not RewardControl.config.Enabled then return end

        local doorIndex = ModUtil.Locals.Stacked().index
        local forcedDoor = forcedDoors[doorIndex] or {}
        local forcedGodName = forcedDoor.GodName
        local forcedFirstGodName = forcedDoor.FirstGodName
        local forcedSecondGodName = forcedDoor.SecondGodName

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

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

    ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, run, room, ... )
        local doorIndex = ModUtil.Locals.Stacked().index
        local forcedReward = ModUtil.IndexArray.Get( forcedDoors, { doorIndex } ) or {}
        local rewardName

        if RewardControl.config.Enabled and forcedReward.Reward then
            rewardName = RCLib.EncodeRoomReward( forcedReward.Reward )
            local overrides = forcedReward.Overrides or {}

            if forcedReward.Reward == "Trial" then
                ModUtil.Table.Merge( overrides, { RewardPreviewIcon = "RoomElitePreview", RewardBoostedAnimation = "RoomRewardAvailableRareSparkles" })
            end

            if forcedReward.IsEliteRoom then
                local eliteOverrides = RCLib.EliteRewardOverrides[forcedReward.Reward] or {}
                ModUtil.Table.Merge( overrides, eliteOverrides )
            end

            room.RewardOverrides = overrides
        end

        return rewardName or baseFunc( run, room, ... )
    end, RewardControl )

    ModUtil.Path.Wrap( "SetupRoomReward", function( baseFunc, run, room, ... )
        baseFunc( run, room, ... )

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

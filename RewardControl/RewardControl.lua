--[[
    RewardControl
    Author: SleepSoul (Discord: sleepsoul)
    Dependencies: ModUtil, RCLib
    Force certain door rewards to appear.
]]
ModUtil.Mod.Register( "RewardControl" )

local config = {
    Enabled = true,
    CheckEligibility = true,
    PrioritiseKeepsakes = true, -- If true, keepsakes that force a god will take priority over what we force
}
RewardControl.config = config

RewardControl.CurrentRunData = {}

function RewardControl.CheckRewardEligibility( run, room, reward, previouslyChosenRewards, args )
    args = args or {}
    reward = reward or {}
    local rewardName = reward.Reward
    local rewardCode = RCLib.EncodeRoomReward( rewardName )
    local rewardData = RCLib.InferItemData( rewardCode )
    
    if not rewardCode then return false end

    if reward.AlwaysEligible or not RewardControl.config.CheckEligibility then
        return true
    end

    local hammerNum = ( ModUtil.Path.Get( "LootTypeHistory.WeaponUpgrade", run ) or 0 ) + 1
    hammerNum = math.min( hammerNum, 2 )
    if rewardName == "DaedalusHammer" then
        rewardData.GameStateRequirements = RCLib.HammerRequirements[hammerNum]
    else
        rewardData.GameStateRequirements = RCLib.RewardRequirements[rewardName]
    end

    if room.NoReward or ( room.ForcedReward and room.ForcedReward ~= rewardCode ) then
        return false
    end

    if not IsRoomRewardEligible( run, room, rewardData, previouslyChosenRewards, args ) then
        return false
    end

    return true
end

ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, run, room, rewardStoreName, previouslyChosenRewards, args ) -- c1 reward
    local rewardToUse = baseFunc( run, room, rewardStoreName, previouslyChosenRewards, args )
    local forcedReward = RCLib.GetFromList( RewardControl.CurrentRunData, { dataType = "startingReward" } )

    if not ( RewardControl.config.Enabled ) then
		return rewardToUse
	end
    if room.Name ~= "RoomOpening" then -- Other rewards are handled separately
		return rewardToUse
	end

    if RewardControl.CheckRewardEligibility( run, room, forcedReward, previouslyChosenRewards, args ) then
        rewardToUse = RCLib.EncodeRoomReward( forcedReward.Reward ) or rewardToUse
    end

    return rewardToUse
end, RewardControl )

ModUtil.Path.Context.Wrap( "DoUnlockRoomExits", function() -- All other rewards
    local forcedDoors = RCLib.GetFromList( RewardControl.CurrentRunData, { dataType = "exitDoors" } )
    local doorNumOffset = 0

    ModUtil.Path.Wrap( "wait", function( baseFunc, time )
        local door = ModUtil.Locals.Stacked().door
        if ModUtil.Path.Get( "Room.RoomSetName", door ) == "Secrets" then
            doorNumOffset = doorNumOffset + 1
        end
        return baseFunc( time )
    end, RewardControl )

    ModUtil.Path.Wrap( "ChooseRoomReward", function( baseFunc, run, room, rewardStoreName, previouslyChosenRewards, args )
        local doorIndex = ModUtil.Locals.Stacked().index - doorNumOffset
        local forcedReward = forcedDoors[doorIndex] or {}
        local rewardName = RCLib.EncodeRoomReward( forcedReward.Reward )
        local isValid = RewardControl.CheckRewardEligibility( run, room, forcedReward, previouslyChosenRewards, args )

        if not RewardControl.config.Enabled or not isValid then
            return baseFunc( run, room, rewardStoreName, previouslyChosenRewards, args )
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
    end, RewardControl )

    ModUtil.Path.Wrap( "SetupRoomReward", function( baseFunc, run, room, previouslyChosenRewards, args )
        baseFunc( run, room, previouslyChosenRewards, args )

        if not RewardControl.config.Enabled then return end

        local doorIndex = ModUtil.Locals.Stacked().index - doorNumOffset
        local forcedDoor = forcedDoors[doorIndex] or {}

        if RewardControl.config.PrioritiseKeepsakes and not args.IgnoreForceLootName then -- Overwriting forced gods with keepsake, if applicable
            local excludedGods = RCLib.BuildExcludedGodList( previouslyChosenRewards )
            keepsakeGod = RCLib.GetKeepsakeGod( excludedGods )
        end

        if room.ChosenRewardType == "Boon" then
            local godCode = RCLib.EncodeBoonSet( forcedDoor.GodName )

            if not keepsakeGod and LootData[godCode]
            and ( RCLib.CheckGodEligibility( godCode, previouslyChosenRewards ) or forcedDoor.AlwaysEligible or not RewardControl.config.CheckEligibility ) then
                room.ForceLootName = godCode
            end
        elseif room.ChosenRewardType == "Devotion" then
            local firstGodCode = RCLib.EncodeBoonSet( forcedDoor.FirstGodName )
            local secondGodCode = RCLib.EncodeBoonSet( forcedDoor.SecondGodName )

            if not keepsakeGod and LootData[firstGodCode]
            and ( Contains( GetInteractedGodsThisRun(), firstGodCode ) or forcedDoor.AlwaysEligible or not RewardControl.config.CheckEligibility ) then
                room.Encounter.LootAName = firstGodCode
            end
            if LootData[secondGodCode]
            and ( Contains( GetInteractedGodsThisRun( room.Encounter.LootAName ), secondGodCode ) or forcedDoor.AlwaysEligible or not RewardControl.config.CheckEligibility ) then
                room.Encounter.LootBName = secondGodCode
            end
        end
    end, RewardControl )
end, RewardControl )

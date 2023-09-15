--[[
    RoomControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Force certain rooms to be offered on each chamber door.
]]
ModUtil.Mod.Register( "RoomControl" )

local config = {
    Enabled = true,
    CheckEligibility = true,
    RequireForcedFeatures = true, -- Will not spawn special objects (Chaos gates, wells, etc) unless they are forced
}
RoomControl.config = config

RoomControl.CurrentRunData = {}

function RoomControl.GetNextRoomSet( currentRun, args )
    local currentRoom = currentRun.CurrentRoom
    local roomSetName = currentRun.CurrentRoom.RoomSetName or "Tartarus"
    if args.ForceNextRoomSet ~= nil then
        roomSetName = args.ForceNextRoomSet
    elseif currentRoom.NextRoomSet ~= nil then
        roomSetName = GetRandomValue( currentRoom.NextRoomSet )
    elseif currentRoom.UsePreviousRoomSet then
        local previousRoom = GetPreviousRoom(currentRun) or currentRoom
        roomSetName = previousRoom.RoomSetName or "Tartarus"
    elseif currentRoom.NextRoomSetNoGenerate ~= nil then
        roomSetName = GetRandomValue( currentRoom.NextRoomSetNoGenerate )
    end

    return args.RoomDataSet or RoomSetData[roomSetName] or {}
end

ModUtil.Path.Wrap( "DoUnlockRoomExits", function( baseFunc, run, room )
    local forcedDoors = RCLib.GetFromList( RoomControl.CurrentRunData, { dataType = "exitDoors" } ) or {}

    if not IsEmpty( forcedDoors ) then
        run.CurrentRoom.FirstAppearanceNumExitOverrides = nil
    end

    return baseFunc( run, room )
end, RoomControl )

ModUtil.Path.Context.Wrap( "DoUnlockRoomExits", function()
    local forcedDoors = RCLib.GetFromList( RoomControl.CurrentRunData, { dataType = "exitDoors" } )
    RoomControl.DumpDoors = forcedDoors

    ModUtil.Path.Wrap( "ChooseNextRoomData", function( baseFunc, currentRun, args )
        if not RoomControl.config.Enabled then
            return baseFunc( currentRun, args )
        end

        args = args or {}

        local doorIndex = ModUtil.Locals.Stacked().index
        local forcedRoom = forcedDoors[doorIndex] or {}
        if forcedRoom.RoomName then
            local roomDataSet = RoomControl.GetNextRoomSet( currentRun, args )
            if IsRoomEligible( currentRun, currentRoom, roomDataSet[forcedRoom.RoomName], args ) or forcedRoom.AlwaysEligible or not RoomControl.config.CheckEligibility then
                args.ForceNextRoom = forcedRoom.RoomName
            end
        end

        return baseFunc( currentRun, args )
    end, RoomControl )

    ModUtil.Path.Context.Wrap( "ChooseNextRoomData", function()
        ModUtil.Path.Wrap( "IsRoomEligible", function( baseFunc, currentRun, currentRoom, nextRoomData, args )
            if not RoomControl.config.Enabled then
                return baseFunc( currentRun, currentRoom, nextRoomData, args )
            end

            if nextRoomData == nil then
                return false
            end

            local doorIndex = ModUtil.Locals.Stacked().index
            local eligibleRoomSet = ModUtil.IndexArray.Get( forcedDoors, { doorIndex, "EligibleRooms" } )

            if not IsEmpty( eligibleRoomSet ) and not Contains( eligibleRoomSet, nextRoomData.Name ) then
                return false
            end

            return baseFunc( currentRun, currentRoom, nextRoomData, args )
        end, RoomControl )

        ModUtil.Path.Wrap( "IsRoomForced", function( baseFunc, currentRun, currentRoom, nextRoomData, args )
            if not RoomControl.config.Enabled then
                return baseFunc( currentRun, currentRoom, nextRoomData, args )
            end

            local doorIndex = ModUtil.Locals.Stacked().index
            local forcedRoomSet = ModUtil.IndexArray.Get( forcedDoors, { doorIndex, "ForcedRooms" } )

            if not IsEmpty( forcedRoomSet ) and Contains( forcedRoomSet, nextRoomData.Name ) then
                return true
            end
            if not IsEmpty( forcedRoomSet ) and not Contains( forcedRoomSet, nextRoomData.Name ) then
                return false
            end

            return baseFunc( currentRun, currentRoom, nextRoomData, args )
        end, RoomControl )
    end, RoomControl )

    ModUtil.Path.Wrap( "CreateRoom", function( baseFunc, roomData, args )
        if not RoomControl.config.Enabled then
            return baseFunc( roomData, args)
        end

        local room = baseFunc( roomData, args )
        local doorIndex = ModUtil.Locals.Stacked().index
        local forcedRoom = forcedDoors[doorIndex] or {}

        if forcedRoom.IsMinibossWing then
            room.UseOptionalOverrides = true
            for key, value in pairs( room.OptionalOverrides ) do
                room[key] = value
            end
        end
        if forcedRoom.Laurel then
            room.ForcedRewardStore = RCLib.EncodeLaurel( forcedRoom.Laurel )
        elseif forcedRoom.Reward then
            room.ForcedRewardStore = RCLib.RewardLaurels[forcedRoom.Reward]
        end

        return room
    end, RoomControl )
end, RoomControl )

ModUtil.Path.Context.Wrap( "HandleSecretSpawns", function()
    local roomData = RCLib.GetFromList( RoomControl.CurrentRunData, { dataType = "roomFeatures" } )

    ModUtil.Path.Wrap( "IsSecretDoorEligible", function( baseFunc, ... ) -- Chaos gate spawn
        local isChaosForced = ModUtil.Path.Get( "ChaosGate.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return HasHeroTraitValue( "ForceSecretDoor" ) or isChaosForced or false
        end
        if isChaosForced == nil then
            return baseFunc( ... )
        end
        return isChaosForced
    end, RoomControl )

    ModUtil.Path.Wrap( "ChooseNextRoomData", function( baseFunc, currentRun, args ) -- Chaos room choice
        args = args or {}

        local forcedRoomName = ModUtil.Path.Get( "ChaosGate.RoomName", roomData )
        args.ForceNextRoom = forcedRoomName or args.ForceNextRoom

        return baseFunc( currentRun, args )
    end, RoomControl )

    ModUtil.Path.Wrap( "IsShrinePointDoorEligible", function( baseFunc, ... ) -- Erebus gate spawn
        local isErebusForced = ModUtil.Path.Get( "ErebusGate.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return isErebusForced or false
        end
        if isErebusForced == nil then
            return baseFunc( ... )
        end
        return isErebusForced
    end, RoomControl )

    ModUtil.Path.Wrap( "IsChallengeSwitchEligible", function( baseFunc, ... ) -- Trove spawn
        local isTroveForced = ModUtil.Path.Get( "Trove.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return HasHeroTraitValue( "ForceChallengeSwitch" ) or isTroveForced or false
        end
        if isTroveForced == nil then
            return baseFunc( ... )
        end
        return isTroveForced
    end, RoomControl )

    ModUtil.Path.Wrap( "IsWellShopEligible", function( baseFunc, ... ) -- Well spawn
        local isWellForced = ModUtil.Path.Get( "Well.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return isWellForced or false
        end
        if isWellForced == nil then
            return baseFunc( ... )
        end
        return isWellForced
    end, RoomControl )

    ModUtil.Path.Wrap( "IsSellTraitShopEligible", function( baseFunc, ... ) -- Sell well spawn
        local isSellWellForced = ModUtil.Path.Get( "SellWell.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return isSellWellForced or false
        end
        if isSellWellForced == nil then
            return baseFunc( ... )
        end
        return isSellWellForced
    end, RoomControl )

    ModUtil.Path.Wrap( "IsFishingEligible", function( baseFunc, ... ) -- Fishing point spawn
        local isFishingPointForced = ModUtil.Path.Get( "FishingPoint.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return HasHeroTraitValue( "ForceFishingPoint" ) or isFishingPointForced or false
        end
        if isFishingPointForced == nil then
            return baseFunc( ... )
        end
        return isFishingPointForced
    end, RoomControl )
end, RoomControl )

ModUtil.Path.Wrap( "HandleBreakableSwap", function( baseFunc, currentRoom )
    local roomData = RCLib.GetFromList( RoomControl.CurrentRunData, { dataType = "roomFeatures" } )
    local goldPotNum = ModUtil.Path.Get( "GoldPotNum", roomData )
    if RoomControl.config.Enabled and not goldPotNum and RoomControl.config.RequireForcedFeatures then
        return
    elseif not RoomControl.config.Enabled or not goldPotNum then
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

ModUtil.Path.Override( "LeaveRoom", function( currentRun, door ) -- This overrides the code that normally determines whether a room is flipped or not

	local nextRoom = door.Room

	ZeroSuperMeter()
	ClearEffect({ Id = currentRun.Hero.ObjectId, All = true, BlockAll = true, })
	StopCurrentStatusAnimation( currentRun.Hero )
	currentRun.Hero.BlockStatusAnimations = true
	AddTimerBlock( currentRun, "LeaveRoom" )
	SetPlayerInvulnerable( "LeaveRoom" )

	local ammoIds = GetIdsByType({ Name = "AmmoPack" })
	SetObstacleProperty({ Property = "Magnetism", Value = 3000, DestinationIds = ammoIds })
	SetObstacleProperty({ Property = "MagnetismSpeedMax", Value = currentRun.Hero.LeaveRoomAmmoMangetismSpeed, DestinationIds = ammoIds })
	StopAnimation({ DestinationIds = ammoIds, Name = "AmmoReturnTimer" })

	RunUnthreadedEvents( currentRun.CurrentRoom.LeaveUnthreadedEvents, currentRun.CurrentRoom )

	if IsRecordRunDepth( currentRun ) then
		thread( PlayVoiceLines, GlobalVoiceLines.RecordRunDepthVoiceLines )
	end

	ResetObjectives()

	if currentRun.CurrentRoom.ChallengeEncounter ~= nil and currentRun.CurrentRoom.ChallengeEncounter.InProgress then
		currentRun.CurrentRoom.ChallengeEncounter.EndedEarly = true
		currentRun.CurrentRoom.ChallengeEncounter.InProgress = false
		thread( PlayVoiceLines, HeroVoiceLines.FleeingEncounterVoiceLines, false )
	end

	if currentRun.CurrentRoom.CloseDoorsOnUse then
		CloseDoorForRun( currentRun, door )
	end

	RemoveRallyHealth()
	if not nextRoom.BlockDoorHealFromPrevious then
		CheckDoorHealTrait( currentRun )
	end
	local removedTraits = {}
	for _, trait in pairs( currentRun.Hero.Traits ) do
		if trait.RemainingUses ~= nil and trait.UsesAsRooms ~= nil and trait.UsesAsRooms then
			UseTraitData( currentRun.Hero, trait )
			if trait.RemainingUses ~= nil and trait.RemainingUses <= 0 then
				table.insert( removedTraits, trait )
			end
		end
	end
	for _, trait in pairs( removedTraits ) do
		RemoveTraitData( currentRun.Hero, trait )
	end

	local exitFunctionName = currentRun.CurrentRoom.ExitFunctionName or door.ExitFunctionName or "LeaveRoomPresentation"
	local exitFunction = _G[exitFunctionName]
	exitFunction( currentRun, door )

	TeardownRoomArt( currentRun, currentRoom )
	if not currentRun.Hero.IsDead then
		--On Zag death cleanup is already processed
		CleanupEnemies()
	end
	killTaggedThreads( RoomThreadName )
	killWaitUntilThreads( "RequiredKillEnemyKilledOrSpawned" )
	killWaitUntilThreads( "AllRequiredKillEnemiesDead" ) -- Can exist for a TimeChallenge encounter
	killWaitUntilThreads( "RequiredEnemyKilled" ) -- Can exist for a TimeChallenge encounter

	RemoveTimerBlock( currentRun, "LeaveRoom" )
	if currentRun.CurrentRoom.TimerBlock ~= nil then
		RemoveTimerBlock( currentRun, currentRun.CurrentRoom.TimerBlock )
	end
	SetPlayerVulnerable( "LeaveRoom" )

	if currentRun.CurrentRoom.SkipLoadNextMap then
		return
	end

	MoneyObjects = {}
	OfferedExitDoors = {}

    -- CHANGES MADE HERE
    local forcedRoomData = RCLib.GetFromList( RoomControl.CurrentRunData, { dataType = "roomFeatures", chamberNum = GetRunDepth( CurrentRun ) + 1 } )
    if RoomControl.config.Enabled and forcedRoomData.Flipped ~= nil then
        nextRoom.Flipped = forcedRoomData.Flipped
    else
        local flipMap = false
        if currentRun.CurrentRoom.ExitDirection ~= nil and nextRoom.EntranceDirection ~= nil and nextRoom.EntranceDirection ~= "LeftRight" then
            flipMap = nextRoom.EntranceDirection ~= currentRun.CurrentRoom.ExitDirection
        else
            flipMap = RandomChance( nextRoom.FlipHorizontalChance or 0.5 )
        end
        nextRoom.Flipped = flipMap
    end
    -- END CHANGES

	if nextRoom.Encounter == nil then
		nextRoom.Encounter = ChooseEncounter( CurrentRun, nextRoom )
		RecordEncounter( CurrentRun, nextRoom.Encounter )
	end

	currentRun.CurrentRoom.EndingHealth = currentRun.Hero.Health
	currentRun.CurrentRoom.EndingAmmo = GetWeaponProperty({ Id = currentRun.Hero.ObjectId, WeaponName = "RangedWeapon", Property = "Ammo" })
	table.insert( currentRun.RoomHistory, currentRun.CurrentRoom )
	UpdateRunHistoryCache( currentRun, currentRun.CurrentRoom )
	local previousRoom = currentRun.CurrentRoom
	currentRun.CurrentRoom = nextRoom

	RunShopGeneration( currentRun.CurrentRoom )

	GameState.LocationName = nextRoom.LocationText
	RandomSetNextInitSeed()
	if not nextRoom.SkipSave then
		SaveCheckpoint({ StartNextMap = nextRoom.Name, SaveName = "_Temp", DevSaveName = CreateDevSaveName( currentRun ) })
		ValidateCheckpoint({ Value = true })

	end

	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })
	AddInputBlock({ Name = "MapLoad" })

	LoadMap({ Name = nextRoom.Name, ResetBinks = previousRoom.ResetBinksOnExit or currentRun.CurrentRoom.ResetBinksOnEnter, LoadBackgroundColor = currentRun.CurrentRoom.LoadBackgroundColor })

end, RoomControl )

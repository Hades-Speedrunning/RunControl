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
    RequireForcedFeatures = true, -- Will not spawn special objects (Chaos gates, wells, etc) unless they are forced
}
RoomControl.config = config

RoomControl.CurrentRunData = {}

ModUtil.Path.Wrap( "DoUnlockRoomExits", function( baseFunc, run, room )
    local forcedDoors = RCLib.GetFromList( RoomControl.CurrentRunData, { dataType = "exitDoors" } ) or {}

    if not IsEmpty( forcedDoors ) then
        run.CurrentRoom.FirstAppearanceNumExitOverrides = nil
    end

    return baseFunc( run, room )
end, RoomControl )

ModUtil.Path.Context.Wrap( "DoUnlockRoomExits", function( baseFunc, run, room )
    local forcedDoors = RCLib.GetFromList( RoomControl.CurrentRunData, { dataType = "exitDoors" } ) or {}

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
        local forcedRoom = ModUtil.IndexArray.Get( forcedDoors, { doorIndex } ) or {}

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

ModUtil.Path.Context.Wrap( "HandleSecretSpawns", function( baseFunc, ... )
    local roomData = RCLib.GetFromList( RoomControl.CurrentRunData, { dataType = "roomFeatures" } )

    ModUtil.Path.Wrap( "IsSecretDoorEligible", function( baseFunc, ... ) -- Chaos gate spawn
        local isChaosForced = ModUtil.Path.Get( "ChaosGate.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return HasHeroTraitValue( "ForceSecretDoor" ) or isChaosForced or false
        end
        return isChaosForced or baseFunc( ... )
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
        return isErebusForced or baseFunc( ... )
    end, RoomControl )

    ModUtil.Path.Wrap( "IsChallengeSwitchEligible", function( baseFunc, ... ) -- Trove spawn
        local isTroveForced = ModUtil.Path.Get( "Trove.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return HasHeroTraitValue( "ForceChallengeSwitch" ) or isTroveForced or false
        end
        return isTroveForced or baseFunc( ... )
    end, RoomControl )
    
    ModUtil.Path.Wrap( "IsWellShopEligible", function( baseFunc, ... ) -- Well spawn
        local isWellForced = ModUtil.Path.Get( "Well.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return isWellForced or false
        end
        return isWellForced or baseFunc( ... )
    end, RoomControl )
        
    ModUtil.Path.Wrap( "IsSellTraitShopEligible", function( baseFunc, ... ) -- Sell well spawn
        local isSellWellForced = ModUtil.Path.Get( "SellWell.Force", roomData )
        if RoomControl.config.RequireForcedFeatures then
            return isSellWellForced or false
        end
        return isSellWellForced or baseFunc( ... )
    end, RoomControl )
end, RoomControl )

ModUtil.Path.Wrap( "HandleBreakableSwap", function( baseFunc, currentRoom )
    local roomData = RCLib.GetFromList( RoomControl.CurrentRunData, { dataType = "roomFeatures" } )
    local goldPotNum = ModUtil.Path.Get( "GoldPotNum", roomData )
    if not goldPotNum and RoomControl.config.RequireForcedFeatures then
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
    local printFlipped = tostring( forcedRoomData.Flipped ) or "NIL"
    DebugPrint({ Text = "Should be flipped? " .. printFlipped })
    if forcedRoomData.Flipped ~= nil then
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

--[[
    EncounterControl
    Author: SleepSoul (Discord: sleepsoul)
    Dependencies: ModUtil, RCLib
    Define the events of an in-game encounter.
]]
ModUtil.Mod.Register( "EncounterControl" )

local config = {
    Enabled = true,
    CheckEligibility = true,
    RequireForcedSpecialEncounters = true, -- Than and Survival will only appear if forced
}
EncounterControl.config = config

EncounterControl.DefaultStartDelays = { 0, 1, 1 }
EncounterControl.RoomEncounters = {
    RoomOpening = "OpeningGenerated",
    D_Mini09 = "GeneratedStyxMiniSingle",
}
EncounterControl.RoomSetEncounters = {
    Tartarus = "GeneratedTartarus",
    Asphodel = "GeneratedAsphodel",
    Elysium = "GeneratedElysium",
    Styx = "GeneratedStyxMini",
}

EncounterControl.CurrentRunData = {}

function EncounterControl.GetEncounterData( room )
    local chamberNumOverride = GetRunDepth( CurrentRun )
    local roomName = ModUtil.Path.Get( "Name", room )
    if roomName ~= "RoomOpening" then -- All rooms other than chamber 1 generate their encounter while GetRunDepth is still returning the previous chamber number
        chamberNumOverride = chamberNumOverride + 1
    end
    local output = RCLib.GetFromList( EncounterControl.CurrentRunData, { dataType = "encounter", chamberNum = chamberNumOverride } )

    local currentBiome = ModUtil.Path.Get( "RoomSetName", room )
    output.Name = output.Name or EncounterControl.RoomEncounters[roomName] or EncounterControl.RoomSetEncounters[currentBiome]

    return output
end

function EncounterControl.CreateWaves( encounterData, waveSet )
    local output = {}

    for waveIndex, waveData in ipairs( waveSet ) do
        for enemyIndex, enemyData in ipairs( waveData ) do
            local enemyCode = RCLib.EncodeEnemy( enemyData.Enemy )
            if enemyCode then
                ModUtil.IndexArray.Set( output, { waveIndex, "Spawns", enemyIndex },  { Name = enemyCode, TotalCount = enemyData.Num or 1 } )
            end
        end

        if ModUtil.IndexArray.Get( output, { waveIndex, "Spawns", 1 } ) then
            local baseStartDelay = ModUtil.IndexArray.Get( encounterData, { "SpawnWaves", waveIndex, "StartDelay" } )
            local defaultStartDelay = EncounterControl.DefaultStartDelays[waveIndex] or 1
            ModUtil.IndexArray.Set( output, { waveIndex, "StartDelay" }, baseStartDelay or defaultStartDelay )
        end
    end

    return output
end

ModUtil.Path.Wrap( "IsEncounterEligible", function( baseFunc, currentRun, room, nextEncounterData )
    local data = EncounterControl.GetEncounterData( room )

    local isThanatos = Contains( EncounterSets.ThanatosEncounters, nextEncounterData.Name )
    local isSurvival = nextEncounterData.EncounterType == "SurvivalChallenge"

    if ( isThanatos or isSurvival )
    and EncounterControl.config.Enabled
    and EncounterControl.config.RequireForcedSpecialEncounters
    and nextEncounterData.Name ~= data.Name then
        return false
    end

    return baseFunc( currentRun, room, nextEncounterData )
end, EncounterControl )

ModUtil.Path.Wrap( "FillEnemyTypes", function( baseFunc, encounter, wave, room )
    local data = EncounterControl.GetEncounterData( room )
    local forcedTypes = ModUtil.IndexArray.Get( data, { "EnemyTypes", wave.WaveIndex } )

    if not EncounterControl.config.Enabled or IsEmpty( forcedTypes ) then
        return baseFunc( encounter, wave, room )
    end

    wave.Spawns = {}

    for i, enemyName in ipairs( forcedTypes ) do
        local enemyCode = RCLib.EncodeEnemy( enemyName )
        if enemyCode then AddToSpawnTable( wave.Spawns, enemyCode ) end
    end
end, EncounterControl )

ModUtil.Path.Wrap( "SetupEncounter", function( baseFunc, encounterData, room )
    local data = EncounterControl.GetEncounterData( room )

    if not EncounterControl.config.Enabled or IsEmpty( data ) then
        return baseFunc( encounterData, room )
    end

    local newEncounterData = EncounterData[data.Name]
    if room and newEncounterData and ( IsEncounterEligible( CurrentRun, room, newEncounterData ) or data.AlwaysEligible or not EncounterControl.config.CheckEligibility ) then
        encounterData = newEncounterData

        local waves = data.Waves or {}
        local overrides = data.Overrides or {}
        local forcedWaves = EncounterControl.CreateWaves( encounterData, waves )
        local forcedWaveCount = data.WaveCount

        if not IsEmpty( forcedWaves ) then
            encounterData.SpawnWaves = forcedWaves
            forcedWaveCount = TableLength( forcedWaves )
        end

        encounterData.MinWaves = forcedWaveCount or encounterData.MinWaves
        encounterData.MaxWaves = forcedWaveCount or encounterData.MaxWaves
        encounterData.WaveCount = forcedWaveCount or encounterData.WaveCount

        ModUtil.Table.Merge( encounterData, overrides )
    end
    return baseFunc( encounterData, room )
end, EncounterControl )

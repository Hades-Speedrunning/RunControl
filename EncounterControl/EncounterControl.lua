--[[
    EncounterControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Define the events of an in-game encounter.
]]
ModUtil.Mod.Register("EncounterControl")

local config = {
    Enabled = true,
    DefaultStartDelays = { 0, 1, 1 },
}
EncounterControl.config = config

EncounterControl.CurrentRunData = {}

function EncounterControl.CreateWaves( waveSet )
    local output = {}

    for waveIndex, waveData in ipairs( waveSet ) do
        DebugPrint({ Text = "EncounterControl: Creating wave "..waveIndex })

        for enemyIndex, enemyData in ipairs( waveData ) do
            DebugPrint({ Text = "Adding "..( enemyData.Num or "1" ).." of "..enemyData.Enemy })
            local enemyCode = RCLib.EncodeEnemy( enemyData.Enemy )
            ModUtil.IndexArray.Set( output, { waveIndex, "Spawns", enemyIndex },  { Name = enemyCode, TotalCount = enemyData.Num or 1 } )
        end

        local baseStartDelay = ModUtil.IndexArray.Get( encounterData, { "SpawnWaves", waveIndex, "StartDelay" } )
        local defaultStartDelay = EncounterControl.config.DefaultStartDelays[waveIndex]
        ModUtil.IndexArray.Set( output, { waveIndex, "StartDelay" }, baseStartDelay or defaultStartDelay )
    end

    return output
end

ModUtil.Path.Wrap( "SetupEncounter", function( baseFunc, encounterData, room )
    local chamberNumOverride = GetRunDepth( CurrentRun )
    local roomName = ModUtil.Path.Get( "Name", room )
    if roomName ~= "RoomOpening" then -- All rooms other than chamber 1 generate their encounter while GetRunDepth is still returning the previous chamber number
        chamberNumOverride = chamberNumOverride + 1
    end
    local data = RCLib.GetFromList( EncounterControl.CurrentRunData, { dataType = "encounter", chamberNum = chamberNumOverride } )

    if not EncounterControl.config.Enabled or IsEmpty( data ) then
        return baseFunc( encounterData, room )
    end

    if data.Name then
        encounterData = EncounterData[data.Name]
    end

    local waves = data.Waves or {}
    local overrides = data.Overrides or {}
    local forcedWaves = EncounterControl.CreateWaves( waves )

    if not IsEmpty( forcedWaves ) then
        encounterData.SpawnWaves = forcedWaves
        local forcedWaveCount = TableLength( forcedWaves )
        encounterData.WaveCount = forcedWaveCount or encounterData.WaveCount
        encounterData.MinWaves = forcedWaveCount or encounterData.MinWaves
        encounterData.MaxWaves = forcedWaveCount or encounterData.MaxWaves
    end

    ModUtil.Table.Merge( encounterData, overrides )
    return baseFunc( encounterData, room )
end, EncounterControl)

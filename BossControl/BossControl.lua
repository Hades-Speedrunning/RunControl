--[[
    BoonControl
    Author: SleepSoul (Discord: sleepsoul)
    Dependencies: ModUtil, RCLib
    Control various boss mechanics.
]]
ModUtil.Mod.Register( "BossControl" )

local config = {
    Enabled = true,
    CheckTheseusGodEligibility = true,
}
BossControl.config = config

BossControl.CurrentRunData = {}

function BossControl.PickLernie( eventSource, args ) -- Copy of vanilla code to pick Lernie variant
    local eligibleOptions = {}
    for k, variantName in pairs(args.Options) do
        if IsEnemyEligible( variantName, eventSource.Encounter ) then
            table.insert( eligibleOptions, variantName )
        end
    end
    return GetRandomValue( eligibleOptions )
end

function BossControl.PickLernieHeads( eventSource, args ) -- Copy of vanilla code to choose Lernie heads
    eventSource.Encounter.EnemySet = ShallowCopyTable( EnemySets.HydraHeads )
    for k, removeValue in pairs( eventSource.Encounter.BlockHeadsByHydraVariant[eventSource.HydraVariant] ) do
        RemoveAllValues( eventSource.Encounter.EnemySet, removeValue )
    end
    while TableLength( eventSource.Encounter.EnemySet ) > args.MaxSideHeadTypes do
        RemoveRandomValue( eventSource.Encounter.EnemySet )
    end
end

function BossControl.CheckTheseusGodEligibility( godCode ) -- Based on function GetUninteractedGodThisRun()
    if not godCode then return false end
    if not BossControl.CheckTheseusGodEligibility then return true end

    local notInteractedGods = {}
    for godName, godData in pairs( LootData ) do
        if godData.GodLoot and not godData.DebugOnly and CurrentRun.LootTypeHistory[godName] == nil and IsGameStateEligible( CurrentRun, godData ) then
            table.insert( notInteractedGods, godData.Name )
        end
    end
    return Contains( notInteractedGods, godCode )
end

ModUtil.Path.Wrap( "PickHydraVariant", function( baseFunc, eventSource, args )
    local lernieData = RCLib.GetFromList( BossControl.CurrentRunData, { dataType = "lernieEncounter" } )
    local forcedSideHeads = lernieData.SideHeads or {}

    if not BossControl.config.Enabled or IsEmpty( lernieData ) then
        return baseFunc( eventSource, args )
    end

    eventSource.HydraVariant = RCLib.EncodeBoss( lernieData.MainHead ) or BossControl.PickLernie( eventSource, args )

    eventSource.Encounter.EnemySet = {}
    for _, headName in ipairs( forcedSideHeads ) do
        table.insert( eventSource.Encounter.EnemySet, RCLib.EncodeBoss( headName ) )
    end

    if IsEmpty( eventSource.Encounter.EnemySet ) then
        BossControl.PickLernieHeads( eventSource, args )
    end

    -- Set up encounter (included in base func)
    CancelSpawnsOnKill = { eventSource.HydraVariant }
	eventSource.Encounter.WipeEnemiesOnKill = eventSource.HydraVariant

	for k, enemyName in pairs( eventSource.Encounter.EnemySet ) do -- Loads visuals for Lernie heads. Included in base function and needs replicating
		PreLoadBinks({ Names = EnemyData[enemyName].Binks })
	end
end, BossControl )

ModUtil.Path.Wrap( "SelectTheseusGod", function( baseFunc, enemy, ... )
    local data = RCLib.GetFromList( BossControl.CurrentRunData, { dataType = "theseusEncounter" } )
    local forcedGod = RCLib.EncodeBoonSet( data.God )
    local isValid = data.AlwaysEligible or BossControl.CheckTheseusGodEligibility( forcedGod )

    if not isValid or not BossControl.config.Enabled then
        return baseFunc( enemy, ... )
    end
    
	enemy.TheseusGodName = forcedGod
	LoadPackages({ Names = enemy.TheseusGodName })
end, BossControl )

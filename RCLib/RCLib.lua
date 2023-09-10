--[[
    RCLib/RunControlLibrary
    Author: SleepSoul (Discord: SleepSoul#6006)
    A set of common utility functions used to modify run events and game content in mods like ChaosControl, EnemyControl, etc.
]]
ModUtil.Mod.Register( "RCLib" )

RCLib.CurrentBiome = "Tartarus" -- TODO

function RCLib.GetEligible( inputTable, lookupTable ) -- Read a table of bools, returning a table of the names of all that are true. Optionally use a lookup table to convert the names in inputTable.
    local eligible = {}
    for name, bool in pairs( inputTable ) do
        if bool then
            if lookupTable ~= nil then
                table.insert( eligible, lookupTable[name] )
            else
                table.insert( eligible, name )
            end
        end
    end
    return eligible
end

function RCLib.RemoveIneligibleBools( inputTable, baseTable, lookupTable ) -- Read two tables of bools, returning a table with all the values set to true in baseTable minus all the values set to false in inputTable. Optionally use a lookup table to convert the names in inputTable.
    local eligible = {}
    local match = false
    for name, bool in pairs( baseTable ) do
        match = false
        if bool then
            if next( inputTable ) == nil then
                table.insert( eligible, name )
            else
                for name2, bool2 in pairs( inputTable ) do
                    if lookupTable ~= nil and lookupTable[name2] == name and not bool2 then
                        match = true
                    elseif name2 == name and not bool2 then
                        match = true
                    end
                end
                if match == false then
                    table.insert( eligible, name )
                end
            end
        end
    end
    return eligible
end

function RCLib.RemoveIneligibleStrings( inputTable, baseTable, lookupTable ) -- Read a table of bools and a table of strings, returning a table with all the strings in baseTable minus all the values set to false in inputTable. Optionally use a lookup table to convert the names in inputTable.
    local eligible = {}
    local match = false
    for _, name in ipairs( baseTable ) do
        match = false
        if next( inputTable ) == nil then
            table.insert( eligible, name )
        else
            for name2, bool in pairs( inputTable ) do
                if lookupTable ~= nil and lookupTable[name2] == name and not bool then
                    match = true
                elseif name2 == name and not bool then
                    match = true
                end
            end
            if match == false then
                table.insert( eligible, name )
            end
        end
    end
    return eligible
end

function RCLib.PopulateMinLength( targetTable, inputTable, minLength ) -- Populates a target table with the contents of an input table, repeatedly inserting until a minimum length is reached.
    local i = 0
    while i < minLength do
        for _, name in pairs( inputTable ) do
            table.insert( targetTable, name )
            i = i + 1
        end
    end
end

function RCLib.BuildEligibleList( sourceList, inheritList, inheritBool, lookupTable )
    local eligible = {}
    if sourceList ~= nil then
        if inheritBool then
            eligible = RCLib.RemoveIneligibleStrings( sourceList, inheritList, lookupTable )
        else
            eligible = RCLib.GetEligible( sourceList, lookupTable )
        end
    else
        eligible = inheritList
    end
    return eligible
end

function RCLib.GetAspectName()
    for aspect, name in pairs( RCLib.CodeToName.Aspects ) do
		if HeroHasTrait( aspect ) then
            return name
        end
    end
end

function RCLib.GetAspectCode()
    for aspect, name in pairs( RCLib.CodeToName.Aspects ) do
		if HeroHasTrait( aspect ) then
            return aspect
        end
    end
end

function RCLib.GetKeepsakeCharges()
    local keepsakeCharges = 0
    for k, data in ipairs( CurrentRun.Hero.Traits ) do
        if data.Name == GameState.LastAwardTrait and data.Uses then
            keepsakeCharges = data.Uses
        end
    end
    return keepsakeCharges
end

function RCLib.InferItemType( item )
    local itemType = nil
    if TraitData[item] then
        itemType = "Trait"
    end
    if ConsumableData[item] then
        itemType = "Consumable"
    end
    if item == "RandomLoot" then
        itemType = "Boon"
    end
    return itemType
end

function RCLib.InferItemData( item )
    return TraitData[item] or ConsumableData[item] or {}
end

function RCLib.GetFromList( list, conditions )
    list = list or {}
    conditions = conditions or {}
    conditions.aspect = conditions.aspect or RCLib.GetAspectName()
	conditions.biome = conditions.biome or RCLib.CurrentBiome
	conditions.chamberNum = conditions.chamberNum or GetRunDepth( CurrentRun )
    conditions.keepsakeCharges = conditions.keepsakeCharges or RCLib.GetKeepsakeCharges()
    conditions.roomName = conditions.roomName or ModUtil.Path.Get( "CurrentRun.CurrentRoom.Name" )

    conditions.listsToIgnore = conditions.listsToIgnore or 0

    if list.IndexedBy then
        return RCLib.GetFromIndexedList( list.List, list.IndexedBy, conditions ) or {}
    end
    return {}
end

function RCLib.GetFromIndexedList( list, indexedBy, conditions )
    indexedBy = indexedBy or {}
    conditions = conditions or {}
    local force = list or {}
    local output = {}

    for _, condition in ipairs( indexedBy ) do
        if condition == "priority" then return RCLib.GetFromPrioritisedList( force, conditions ) end
        if force.Data then break end
        if force.IndexedBy then return RCLib.GetFromList( force, conditions ) end
        force = force[conditions[condition]] or {}
    end
    if RCLib.CheckConditions( force.NeededConditions, conditions ) then
        output = force.Data or {}
    end

    return output
end

function RCLib.GetFromPrioritisedList( list, conditions )
    list = list or {}
    conditions = conditions or {}
    local output = {}
    local ignore = conditions.listsToIgnore or 0

    for i, sublist in ipairs( list ) do
        local currentList = RCLib.GetFromList( sublist, conditions )
        if not IsEmpty( currentList ) and ignore <= 0 then
            output = currentList
            break
        end
        if not IsEmpty( currentList ) then
            ignore = ignore - 1
        end
    end

    return output
end

function RCLib.CheckConditions( table, conditions ) -- TODO
    table = table or {}
    conditions = conditions or {}
    return true
end

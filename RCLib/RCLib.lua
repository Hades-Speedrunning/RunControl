--[[
    RCLib/RunControlLibrary
    Author: SleepSoul (Discord: sleepsoul)
    A set of common utility functions used to modify run events and game content in mods like ChaosControl, EnemyControl, etc.
]]
ModUtil.Mod.Register( "RCLib" )

-- see RCLib.GetFromList
-- currently unused, might be useful later
RCLib.CurrentBiome = "Styx"

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

function RCLib.GetKeepsakeGod( excludedGods )
    for k, trait in pairs( CurrentRun.Hero.Traits ) do
        if trait ~= nil and trait.ForceBoonName ~= nil and trait.Uses > 0 and not Contains( excludedGods, trait.ForceBoonName ) then
            return trait.ForceBoonName
        end
    end
    return nil
end

function RCLib.CheckGodEligibility( god, previouslyChosenRewards )
    local excludedGods = RCLib.BuildExcludedGodList( previouslyChosenRewards )
    local eligibleGods = GetEligibleLootNames( excludedGods )

    if LootData[god] and Contains( eligibleGods, god ) then
        return true
    end

    return false
end

function RCLib.BuildExcludedGodList( previouslyChosenRewards )
    local output = {}
    if previouslyChosenRewards ~= nil then
        for i, data in pairs( previouslyChosenRewards ) do
            if data.RewardType == "Boon" then
                table.insert( output, data.ForceLootName )
            end
        end
    end
    return output
end

function RCLib.InferItemType( item )
    local itemType = nil
    if TraitData[item] then
        itemType = "Trait"
    end
    if ConsumableData[item] then
        itemType = "Consumable"
    end
    if item == "RandomLoot" or item == "BoostedRandomLoot" then
        itemType = "Boon"
    end
    return itemType
end

function RCLib.InferItemData( item )
    return TraitData[item] or ConsumableData[item] or {}
end

function RCLib.IsChaos(chambername) -- the game calls Chaos chambers "secret"s internally
    if string.find(chambername, "Secret") then
        return true
    end
    return false
end

function RCLib.GetExtensionSum()
    local res = 0
    for _, biome in ipairs(RCLib.Biomes) do
        if biome == "Styx" then
            break
        end
        res = res + RCLib.BiomeExtensions[biome]
    end
    return res
end

function RCLib.GetBiome(chambernumber, extensions)
    for _, biome in ipairs(RCLib.Biomes) do
        --[[
        ipairs is, as far as I can tell, deterministic as long as the order (keys, value) pairs in the used table stays the same.
        this means that this will always retrieve elements in the same order.
        
        the moment that the upperbound no longer exceeds the current chamber, the current biome no longer gets updated.

        if zagreus is in tartarus, it will (in order):
        - check tartarus and break out of the loop

        if zagreus is in asphodel, it will (in order):
        - check tartarus, fail the second condition
        - check asphodel and break out of the loop

        if zagreus is in elysium, it will (in order):
        - check tartarus, fail the second condition
        - check asphodel, fail the second condition
        - check elysium and break out of the loop

        if zagreus is in styx, it will (in order):
        - check tartarus, fail the second condition
        - check asphodel, fail the second condition
        - check elysium, fail the second condition
        - check styx, and fail the first condition. "Styx" was assigned before the loop, so it keeps that value.

        This only works as intended because of the specific order of elements in the RCLib.Biomes table.
        ]]

        if biome == "Styx" or RCLib.BiomeEnds[biome] + extensions > chambernumber then
            return biome
        end
    end
end

function RCLib.GetFromList( list, conditions )
    local extensions = RCLib.GetExtensionSum()
    local chambernumber = GetRunDepth(CurrentRun)
    RCLib.CurrentBiome = RCLib.GetBiome(chambernumber, extensions)

    list = list or {}
    conditions = conditions or {}

    conditions.chamberNum = conditions.chamberNum or chambernumber
	conditions.biome = conditions.biome or RCLib.CurrentBiome
    conditions.roomName = conditions.roomName or ModUtil.Path.Get("CurrentRun.CurrentRoom.Name")

    conditions.aspect = conditions.aspect or RCLib.GetAspectName()
    conditions.keepsakeCharges = conditions.keepsakeCharges or RCLib.GetKeepsakeCharges()

    conditions.listsToIgnore = conditions.listsToIgnore or 0
    conditions.dataTypeChecked = conditions.dataTypeChecked or false

    if list.IndexedBy then
        if
        (
            conditions.chamberNum == RCLib.BiomeEnds["Tartarus"] + extensions or
            conditions.chamberNum == RCLib.BiomeEnds["Asphodel"] + extensions or
            conditions.chamberNum == RCLib.BiomeEnds["Elysium"] + extensions
        )
        and RCLib.IsChaos(conditions.roomName) then
            --[[
            TODO
            currently just generating randomly, and pushing the rest "extensions" amount of chambers further along.
            a cleaner fix would be to rework the RC-routefile-structure to have like a "extensions" subtable which lets the router define roomdata for these alternate paths
            ]]

            RCLib.BiomeExtensions[RCLib.CurrentBiome] = RCLib.BiomeExtensions[RCLib.CurrentBiome] + 1
            return {} -- let the game do its thing
        end

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
        if condition == "dataType" then
            conditions.dataTypeChecked = true
        end

        if condition == "priority" then
            return RCLib.GetFromPrioritisedList( force, conditions )
        end

        if force.Data then
            break
        end

        local currentroom = RCLib.GetFromList( force, conditions )
        if force.IndexedBy then
            return currentroom
        end

        force = force[conditions[condition]] or {}
    end
    if RCLib.CheckConditions( force.NeededConditions, conditions ) and conditions.dataTypeChecked then
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

function RCLib.CheckConditions( table, conditions ) -- TODO 1.1.0
    table = table or {}
    conditions = conditions or {}
    return true
end

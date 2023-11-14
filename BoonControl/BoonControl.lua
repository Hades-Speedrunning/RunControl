--[[
    BoonControl
    Author: SleepSoul (Discord: sleepsoul)
    Dependencies: ModUtil, RCLib
    Force Olympians and Hammers to provide certain options.
]]
ModUtil.Mod.Register( "BoonControl" )

local config = {
    Enabled = true,
	CheckEligibility = true,
	FillWithEligible = true, -- If true, any empty slots in a forced boon screen will be automatically filled with eligible boons
	UseSpareWealth = false, -- Use spare wealth as a fallback instead of using the vanilla boon screen
	DefaultRarity = "Common", -- Default rarity when not specified per-boon. If set to "Random", rarity will be rolled each time
	CheckRarityEligibility = true, -- Only use a certain rarity if a higher one is not guaranteed
	InferReplaces = false, -- If true, any boon that would take up an occupied slot will be offered as a replace. If false, boons will not appear as replaces unless you specify Replace = true.
}
BoonControl.config = config

BoonControl.CurrentRunData = {}

BoonControl.GodAppearances = {}
BoonControl.GodRerollNums = {}

function BoonControl.BuildEligibleSet( lootData, upgradeChoiceData, lookupTable ) -- Return a list of eligible boons, including any we've overridden the requirements for
	-- This whole function is kind of a refactor of GetEligibleUpgrades() to implement requirement overrides
	local eligible = {}

	if lootData.StackOnly then
		local upgradeableGodTraitsKVPs = CollapseTableAsOrderedKeyValuePairs(GetAllUpgradeableGodTraits())
		for i, kvp in ipairs( upgradeableGodTraitsKVPs ) do
			table.insert( eligible, kvp.Key )
		end
	else
		local weaponUpgrades = GetEligibleWeaponTraits( upgradeChoiceData.WeaponUpgrades )
		local traitUpgrades = GetEligibleTraitUpgrades( upgradeChoiceData )
		local consumables = upgradeChoiceData.Consumables
		eligible = ModUtil.Array.Join( eligible, weaponUpgrades, traitUpgrades, consumables )
	end

	local toRemove = {}
	for i, boonCode in ipairs( eligible ) do
		local boonName = lookupTable[boonCode]
		local requirements = BoonControl.OverrideRequirements[boonName] or RCLib.InferItemData( boonCode )

		if not lootData.StackOnly and RCLib.InferItemType( boonCode ) == "Trait" and HeroHasTrait( boonCode ) then
			table.insert( toRemove, boonCode )
		elseif not lootData.StripRequirements and not IsGameStateEligible( CurrentRun, requirements ) then
			table.insert( toRemove, boonCode )
		end
	end

	for i, value in ipairs( toRemove ) do
		RemoveValue( eligible, value )
	end

	local output = {}
	for k, trait in pairs( eligible ) do
		table.insert( output, lookupTable[trait] )
	end
	return output
end

function BoonControl.GetReplaceData( boon ) -- If a boon can be used as a replace, get the data for that replace. Otherwise, return nil
	local boonCode = RCLib.EncodeBoon( boon )
	local boonData = RCLib.InferItemData( boonCode )

	if not IsGameStateEligible( CurrentRun, boonData )
	or HeroHasTrait( boonCode )
	or not boonData.Slot then
		return nil
	end

	for i, existingBoon in pairs( CurrentRun.Hero.Traits ) do
		if existingBoon.Slot == boonData.Slot then
			local oldRarity = existingBoon.Rarity
			local newRarity = GetUpgradedRarity( oldRarity )
			return {
				ItemName = boonCode,
				Type = "Trait",
				TraitToReplace = existingBoon.Name,
				OldRarity = oldRarity,
				Rarity = newRarity,
			}
		end
	end

	return nil
end

function BoonControl.BuildEligibleReplaceSet( traitNames ) -- Return a list of the eligible replaces for a god
	if traitNames == nil then
		return {}
	end

	local priorityOptions = {}
	local occupiedSlots = {}

	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
		if traitData.Slot then
			if not occupiedSlots[traitData.Slot] then
				occupiedSlots[traitData.Slot] = { TraitName = traitData.Name, Rarity = "Common" }
			end
			if  traitData.Rarity ~= nil and GetRarityValue( traitData.Rarity ) > GetRarityValue( occupiedSlots[traitData.Slot].Rarity ) then
				occupiedSlots[traitData.Slot].Rarity = traitData.Rarity
			end
		end
	end

	for index, traitName in ipairs( traitNames ) do
		local slot = TraitData[traitName].Slot
		if IsGameStateEligible( CurrentRun, TraitData[traitName] ) and not HeroHasTrait( traitName ) and occupiedSlots[slot] and GetUpgradedRarity( occupiedSlots[slot].Rarity ) ~= nil then
			table.insert( priorityOptions, traitName )
		end
	end
	return priorityOptions
end

function BoonControl.GetValidRarities( boonCode )
	local validRarities = {
		Common = false,
		Rare = false,
		Epic = false,
		Heroic = false,
		Legendary = false,
	}
	local rarityLevels = RCLib.InferItemData( boonCode ).RarityLevels

	if rarityLevels == nil then
		rarityLevels = { Common = true }
	end

	for key, value in pairs( rarityLevels ) do
		if value ~= nil then
			validRarities[key] = true
		end
	end

	return validRarities
end

function BoonControl.RollRarityForBoon( boonCode, rarityChances )
	local validRarities = BoonControl.GetValidRarities( boonCode )

	local chosenRarity = "Common"
	if validRarities.Legendary and rarityChances.Legendary and RandomChance( rarityChances.Legendary ) then
		chosenRarity = "Legendary"
	elseif validRarities.Heroic and rarityChances.Heroic and RandomChance( rarityChances.Heroic ) then
		chosenRarity = "Heroic"
	elseif validRarities.Epic and rarityChances.Epic and RandomChance( rarityChances.Epic ) then
		chosenRarity = "Epic"
	elseif validRarities.Rare and rarityChances.Rare and RandomChance( rarityChances.Rare ) then
		chosenRarity = "Rare"
	end
	return chosenRarity
end

function BoonControl.GetMinRarityForBoon( boonCode, rarityChances )
	local validRarities = BoonControl.GetValidRarities( boonCode )
	local minRarity = "Common"

	for index, rarity in ipairs( BoonControl.IndexToRarity ) do
		local rarityBelow = BoonControl.IndexToRarity[index - 1] or "Common"
		local chanceOfRarity = rarityChances[rarity] or 0
		local chanceOfRarityBelow = rarityChances[rarityBelow] or 0
		if validRarities[rarity] and ( chanceOfRarity >= 1 or chanceOfRarityBelow <= 0 ) then
			minRarity = rarity
		end
	end
	DebugPrint({ Text = "Min rarity is " .. minRarity })
	return minRarity
end

function BoonControl.BuildTraitList( forced, eligible, eligibleReplaces, rarityTable, lookupTable )
	local traitOptions = {}
	local maxOptions = GetTotalLootChoices() -- TODO possible LootChoiceExt compat

	for i, trait in ipairs( forced ) do
		local traitName = trait.Name
		local boonCode = lookupTable[traitName]

		local validAsNew = Contains( eligible, traitName )
		if boonCode and not trait.Replace and ( trait.AlwaysEligible or not BoonControl.config.CheckEligibility ) then
			validAsNew = true
		end

		local validAsReplace = Contains( eligibleReplaces, boonCode )
		if boonCode and ( trait.AlwaysEligible or not BoonControl.config.CheckEligibility ) then
			validAsReplace = true
		end

		if TableLength( traitOptions ) < maxOptions then
			if validAsNew then
				local boonType = RCLib.InferItemType( boonCode )
				local rarityToUse = trait.ForcedRarity or BoonControl.config.DefaultRarity or "Common"
				local minRarity = BoonControl.GetMinRarityForBoon( boonCode, rarityTable )
				if rarityToUse == "Random" then
					rarityToUse = BoonControl.RollRarityForBoon( traitName, rarityTable, lookupTable )
				end
				if BoonControl.config.CheckRarityEligibility and BoonControl.RarityToIndex[minRarity] > BoonControl.RarityToIndex[rarityToUse] then
					rarityToUse = minRarity
				end

				table.insert( traitOptions,
					{
						ItemName = boonCode,
						Type = boonType,
						Rarity = rarityToUse,
					}
				)
			elseif validAsReplace and ( trait.Replace or BoonControl.config.InferReplaces ) then
				local replaceData = BoonControl.GetReplaceData( traitName )
				if replaceData then
					table.insert( traitOptions, replaceData )
				end
			end
		end
	end

	return traitOptions
end

function BoonControl.BuildEligibleTransformingSet( traitCodes, lookupTable ) -- Return a list of eligible Chaos boons, including any we've overridden the requirements for
	local output = {}
	for i, traitCode in pairs( traitCodes ) do
		local traitName = lookupTable[traitCode] or traitCode
		local requirements = BoonControl.OverrideRequirements[traitName] or TraitData[traitCode]
		if IsGameStateEligible( CurrentRun, requirements ) then
			table.insert( output, traitName )
		end
	end
	return output
end

function BoonControl.BuildTransformingTraitList( forced, eligible, rarityTable, lookupTable ) -- Used for Chaos
	local traitOptions = {}
	local isValid = false
	local maxOptions = GetTotalLootChoices() -- TODO possible LootChoiceExt compat

	for i, trait in ipairs( forced ) do
		local currentTemporaryTrait = trait.CurseName
		local currentPermanentTrait = trait.BlessingName
		local temporaryCode = lookupTable.Temporary[currentTemporaryTrait]
		local permanentCode = lookupTable.Permanent[currentPermanentTrait]

		isValid = ( Contains( eligible.Temporary, currentTemporaryTrait ) and Contains( eligible.Permanent, currentPermanentTrait ) )
		or ( currentTemporaryTrait and currentPermanentTrait and trait.AlwaysEligible )
		or not BoonControl.config.CheckEligibility
		or false

		if isValid and TableLength( traitOptions ) < maxOptions then
			local rarityToUse = trait.ForcedRarity or BoonControl.config.DefaultRarity or "Common"
			if rarityToUse == "Random" then
				rarityToUse = BoonControl.RollRarityForBoon( traitName, rarityTable, lookupTable.Permanent )
			end

			table.insert( traitOptions, 
				{
					ItemName = permanentCode,
					SecondaryItemName = temporaryCode,
					Type = "TransformingTrait",
					Rarity = rarityToUse,
					BoonControlData = trait,
				}
			)
		end
	end

	return traitOptions
end

function BoonControl.FillTraitListFromBase( list, forced, base ) -- Fill list with the contents of base, ensuring no traits are duplicated
	local neededEmptySlots = 0
	for index, trait in ipairs( forced ) do
		if trait.EmptySlot then
			neededEmptySlots = neededEmptySlots + 1
		end
	end

	for index, trait in ipairs( base ) do
		if TableLength( list ) + neededEmptySlots >= GetTotalLootChoices() then break end

		local isValid = true
		for _, forcedTrait in ipairs( list ) do
			if trait.ItemName == forcedTrait.ItemName then
				isValid = false
			end
		end

		if ModUtil.IndexArray.Get( forced, { index, "EmptySlot" } ) then
			isValid = false
		end

		if isValid then
			local insertIndex = math.min( index, #list + 1 )
			table.insert( list, insertIndex, trait )
		end
	end

	return list
end

ModUtil.Path.Wrap( "StartRoom", function( baseFunc, currentRun, currentRoom )
	BoonControl.GodAppearances = ModUtil.Table.Copy( currentRun.LootTypeHistory )
	-- LootTypeHistory is always accurate at the start and end of a room, but increments at an unpredictable time.
	-- We need to replicate its functionality in a more consistent way
	BoonControl.GodRerollNums = {} -- Always empty at the start of a room. Added to when a god is rerolled
	baseFunc( currentRun, currentRoom )
end, BoonControl )

ModUtil.Path.Wrap( "SetTraitsOnLoot", function( baseFunc, lootData, args )
	local godCode = lootData.Name
	local upgradeChoiceData = LootData[godCode]

	local conditions = {}
	conditions.dataType = "boonMenu"
	conditions.godName = RCLib.DecodeBoonSet( godCode )
	conditions.appearanceNum = ( BoonControl.GodAppearances[godCode] or 0 ) + 1
	conditions.rerollNum = ( BoonControl.GodRerollNums[godCode] or 0 ) + 1

	local forcedBoons = RCLib.GetFromList( BoonControl.CurrentRunData, conditions )

	if not BoonControl.config.Enabled
	or IsEmpty( forcedBoons )
	or upgradeChoiceData.TransformingTraits then -- Chaos is handled in a separate function, which baseFunc will call
		return baseFunc( lootData, args )
	end

	local tableName = "Boons"
	if godCode == "WeaponUpgrade" then
		tableName = "Hammers"
	end
	local eligibleBoons = BoonControl.BuildEligibleSet( lootData, upgradeChoiceData, RCLib.CodeToName[tableName] )
	local eligibleReplaces = BoonControl.BuildEligibleReplaceSet( lootData.PriorityUpgrades )

	local boonOptions = BoonControl.BuildTraitList( forcedBoons, eligibleBoons, eligibleReplaces, lootData.RarityChances, RCLib.NameToCode[tableName] )

	if BoonControl.config.FillWithEligible then
		local baseData = ModUtil.Table.Copy( lootData )
		baseFunc( baseData, args )

		boonOptions = BoonControl.FillTraitListFromBase( boonOptions, forcedBoons, baseData.UpgradeOptions )
	end
	if IsEmpty( boonOptions ) and BoonControl.config.UseSpareWealth then -- Failsafe; can be triggered by errors in presets but also by no forced boons being eligible
		table.insert( boonOptions, RCLib.SpareWealth )
	elseif IsEmpty( boonOptions ) then
		return baseFunc( lootData, args )
	end

	lootData.UpgradeOptions = boonOptions
end, BoonControl )

ModUtil.Path.Wrap( "SetTransformingTraitsOnLoot", function( baseFunc, lootData, args ) -- Used for Chaos
	local godCode = lootData.Name
	local upgradeChoiceData = LootData[godCode]

	local conditions = {}
	conditions.dataType = "boonMenu"
	conditions.godName = RCLib.DecodeBoonSet( godCode )
	conditions.appearanceNum = ( BoonControl.GodAppearances[godCode] or 0 ) + 1
	conditions.rerollNum = ( BoonControl.GodRerollNums[godCode] or 0 ) + 1
	
	local forcedBoons = RCLib.GetFromList( BoonControl.CurrentRunData, conditions ) or {}

	if not BoonControl.config.Enabled
	or IsEmpty( forcedBoons ) then
		return baseFunc( lootData, args )
	end

	local eligibleList = {}
	eligibleList.Temporary = BoonControl.BuildEligibleTransformingSet( upgradeChoiceData.TemporaryTraits, RCLib.CodeToName.ChaosCurses )
	eligibleList.Permanent = BoonControl.BuildEligibleTransformingSet( upgradeChoiceData.PermanentTraits, RCLib.CodeToName.ChaosBlessings )

	local lookupTables = {}
	lookupTables.Temporary = RCLib.NameToCode.ChaosCurses
	lookupTables.Permanent = RCLib.NameToCode.ChaosBlessings

	local boonOptions = BoonControl.BuildTransformingTraitList( forcedBoons, eligibleList, lootData.RarityChances, lookupTables )

	if BoonControl.config.FillWithEligible then
		local baseData = ModUtil.Table.Copy( lootData )
		baseFunc( baseData, args )

		boonOptions = BoonControl.FillTraitListFromBase( boonOptions, forcedBoons, baseData.UpgradeOptions )
	end
	if IsEmpty( boonOptions ) and BoonControl.config.UseSpareWealth then -- Failsafe; can be triggered by errors in presets but also by no forced boons being eligible
		table.insert( boonOptions, RCLib.SpareWealth )
	elseif IsEmpty( boonOptions ) then
		return baseFunc( lootData, args )
	end

	lootData.UpgradeOptions = boonOptions
end, BoonControl )

ModUtil.Path.Context.Wrap( "CreateBoonLootButtons", function()
	ModUtil.Path.Context.Wrap( "GetProcessedTraitData", function()
		ModUtil.Path.Wrap( "ProcessTraitData", function( baseFunc, args )
			local processedData = baseFunc( args )

			local locals = ModUtil.Locals.Stacked()
			local boonOptions = locals.upgradeOptions
			local boonIndex = locals.itemIndex
			local forcedBoonData = boonOptions[boonIndex].BoonControlData or {}

			if RCLib.DecodeChaosBlessing( processedData.Name ) == forcedBoonData.BlessingName then
				local pathToSet = BoonControl.PathsToSet.ChaosBlessings[forcedBoonData.BlessingName]
				if forcedBoonData.BlessingValue then ModUtil.IndexArray.Set( processedData, pathToSet, forcedBoonData.BlessingValue ) end
			end

			if RCLib.DecodeChaosCurse( processedData.Name ) == forcedBoonData.CurseName then
				local pathToSet = BoonControl.PathsToSet.ChaosCurses[forcedBoonData.CurseName]
				if forcedBoonData.CurseLength then processedData.RemainingUses = forcedBoonData.CurseLength end
				if forcedBoonData.CurseValue then ModUtil.IndexArray.Set( processedData, pathToSet, forcedBoonData.CurseValue ) end
			end

			return processedData
		end, BoonControl )
	end, BoonControl )
end, BoonControl )

ModUtil.Path.Context.Wrap( "AttemptPanelReroll", function()
	ModUtil.Path.Wrap( "UpdateRerollUI", function( baseFunc, ... )
		local locals = ModUtil.Locals.Stacked()
		local godCode = locals.screen.SubjectName
		local godRerollId = locals.button.RerollId

		if godCode and godRerollId then
			BoonControl.GodRerollNums[godCode] = CurrentRun.CurrentRoom.SpentRerolls[godRerollId]
		end

		baseFunc( ... )
	end, BoonControl )
end, BoonControl )

ModUtil.Path.Wrap( "HandleUpgradeChoiceSelection", function( baseFunc, screen, button )
	local upgradeName = button.UpgradeName
	BoonControl.GodAppearances[upgradeName] = ( BoonControl.GodAppearances[upgradeName] or 0 ) + 1
	BoonControl.GodRerollNums[upgradeName] = 0
	
	for itemId, item in pairs( LootObjects ) do
		if item.Name == upgradeName then
			-- If there are multiple of the same god in one room (i.e. Styx shop), they'll initially be set with the same appearanceNum, and need resetting
			item.UpgradeOptions = nil
		end
	end

    baseFunc( screen, button )
end, BoonControl )

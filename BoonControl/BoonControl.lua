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
	InferReplaces = false, -- If true, any boon that would take up an occupied slot will be offered as a replace. If false, boons will not appear as replaces unless you specify Replace = true.
}
BoonControl.config = config

BoonControl.CurrentRunData = {}

BoonControl.GodAppearances = {}
BoonControl.GodRerollNums = {}

function BoonControl.GetEligibleReplaceList( traitNames )
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

function BoonControl.GetReplaceData( boon ) -- If a boon can be used as a replace, get the data for that replace. Otherwise, return nil.
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
				local rarityToUse = BoonControl.config.DefaultRarity or "Common"
				if trait.ForcedRarity ~= nil then
					rarityToUse = trait.ForcedRarity
				elseif BoonControl.config.DefaultRarity == "Random" then
					rarityToUse = BoonControl.RollRarityForBoon( traitName, rarityTable, lookupTable )
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

function BoonControl.BuildTransformingTraitList( forced, eligible, rarityTable, lookupTable ) -- Chaos
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
			local rarityToUse = BoonControl.config.DefaultRarity or "Common"
			if trait.ForcedRarity ~= nil then
				rarityToUse = trait.ForcedRarity
			elseif not BoonControl.config.DefaultRarity then
				rarityToUse = BoonControl.RollRarityForBoon( currentPermanentTrait, rarityTable, lookupTable.Permanent )
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

function BoonControl.RollRarityForBoon( boon, rarityChances, lookupTable )
	local boonName = lookupTable[boon]
	local validRarities = {
		Common = false,
		Rare = false,
		Epic = false,
		Heroic = false,
		Legendary = false,
	}
	local rarityLevels = RCLib.InferItemData( boonName ).RarityLevels

	if rarityLevels == nil then
		rarityLevels = { Common = true }
	end

	for key, value in pairs( rarityLevels ) do
		if value ~= nil then
			validRarities[key] = true
		end
	end

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

ModUtil.Path.Wrap( "StartRoom", function( baseFunc, currentRun, currentRoom )
	BoonControl.GodAppearances = ModUtil.Table.Copy( currentRun.LootTypeHistory )
	-- LootTypeHistory is always accurate at the start and end of a room, but increments at an unpredictable time.
	-- We need to replicate its functionality in a more consistent way
	-- TODO 1.0.1 edge case: in Styx shop, when multiple of one god can appear in the same room, they will be counted as the same appearance so you can't set them individually
	BoonControl.GodRerollNums = {} -- Always empty at the start of a room. Added to when a god is rerolled
	baseFunc( currentRun, currentRoom )
end, BoonControl )

ModUtil.Path.Wrap( "SetTraitsOnLoot", function( baseFunc, lootData, args )
	args = args or {}

	local godCode = lootData.Name
	local upgradeChoiceData = LootData[godCode]
	local forcedBoons = {}
	local boonOptions = {}

	if not BoonControl.config.Enabled
	or IsEmpty( BoonControl.CurrentRunData )
	or upgradeChoiceData.TransformingTraits then -- Chaos is handled in a separate function, which baseFunc will call
		return baseFunc( lootData, args )
	end

	local conditions = {}
	conditions.dataType = "boonMenu"
	conditions.godName = RCLib.DecodeBoonSet( godCode )
	conditions.appearanceNum = ( BoonControl.GodAppearances[godCode] or 0 ) + 1
	conditions.rerollNum = ( BoonControl.GodRerollNums[godCode] or 0 ) + 1

	forcedBoons = RCLib.GetFromList( BoonControl.CurrentRunData, conditions )

	local eligibleUpgradeSet = GetEligibleUpgrades( boonOptions, lootData, upgradeChoiceData )
	local tableName = "Boons"
	if conditions.godName == "Hammer" then
		tableName = "Hammers"
	end
	local eligibleList = {}
	for key, trait in pairs( eligibleUpgradeSet ) do
		table.insert( eligibleList, RCLib.CodeToName[tableName][trait.ItemName] )
	end
	local eligibleReplaces = BoonControl.GetEligibleReplaceList( lootData.PriorityUpgrades )

	boonOptions = BoonControl.BuildTraitList( forcedBoons, eligibleList, eligibleReplaces, lootData.RarityChances, RCLib.NameToCode[tableName] )

	if BoonControl.config.FillWithEligible then
		local baseData = ModUtil.Table.Copy( lootData )
		baseFunc( baseData, args )
		
		local neededEmptySlots = 0
		for key, trait in ipairs( forcedBoons ) do
			if trait.EmptySlot then
				neededEmptySlots = neededEmptySlots + 1
			end
		end

		for key, trait in ipairs( baseData.UpgradeOptions ) do
			if TableLength( boonOptions ) + neededEmptySlots >= GetTotalLootChoices() then break end

			local isValid = true
			for _, forcedTrait in ipairs( boonOptions ) do
				if trait.ItemName == forcedTrait.ItemName then
					isValid = false
				end
			end

			if ModUtil.IndexArray.Get( forcedBoons, { key, "EmptySlot" } ) then
				isValid = false
			end

			if isValid then
				table.insert( boonOptions, key, trait )
			end
		end
	end
	if IsEmpty( boonOptions ) and BoonControl.config.UseSpareWealth then -- Failsafe; can be triggered by errors in presets but also by no forced boons being eligible
		table.insert( boonOptions, RCLib.SpareWealth )
	elseif IsEmpty( boonOptions ) then
		return baseFunc( lootData, args )
	end

	lootData.UpgradeOptions = boonOptions
end, BoonControl )

ModUtil.Path.Wrap( "SetTransformingTraitsOnLoot", function( baseFunc, lootData, args )
	args = args or {}
	local conditions = {}

	local godCode = lootData.Name
	local upgradeChoiceData = LootData[godCode]
	local forcedBoons = {}
	local boonOptions = {}

	if not BoonControl.config.Enabled
	or IsEmpty( BoonControl.CurrentRunData ) then
		return baseFunc( lootData, args )
	end

	conditions.dataType = "boonMenu"
	conditions.godName = RCLib.DecodeBoonSet( godCode )
	conditions.appearanceNum = ( BoonControl.GodAppearances[godCode] or 0 ) + 1
	conditions.rerollNum = ( BoonControl.GodRerollNums[godCode] or 0 ) + 1
	
	forcedBoons = RCLib.GetFromList( BoonControl.CurrentRunData, conditions ) or {}

	local eligibleUpgradeSet = {}
	eligibleUpgradeSet.Temporary = GetEligibleTransformingTrait( upgradeChoiceData.TemporaryTraits )
	eligibleUpgradeSet.Permanent = GetEligibleTransformingTrait( upgradeChoiceData.PermanentTraits )

	local eligibleList = {}
	eligibleList.Temporary = {}
	eligibleList.Permanent = {}
	for index, trait in ipairs( eligibleUpgradeSet.Temporary ) do
		table.insert( eligibleList.Temporary, RCLib.CodeToName.ChaosCurses[trait] )
	end
	for index, trait in ipairs( eligibleUpgradeSet.Permanent ) do
		table.insert( eligibleList.Permanent, RCLib.CodeToName.ChaosBlessings[trait] )
	end

	local lookupTables = {}
	lookupTables.Temporary = RCLib.NameToCode.ChaosCurses
	lookupTables.Permanent = RCLib.NameToCode.ChaosBlessings

	boonOptions = BoonControl.BuildTransformingTraitList( forcedBoons, eligibleList, lootData.RarityChances, lookupTables )

	if BoonControl.config.FillWithEligible then
		local baseData = ModUtil.Table.Copy( lootData )
		baseFunc( baseData, args )
		
		local neededEmptySlots = 0
		for key, trait in ipairs( forcedBoons ) do
			if trait.EmptySlot then
				neededEmptySlots = neededEmptySlots + 1
			end
		end

		for key, trait in ipairs( baseData.UpgradeOptions ) do
			if TableLength( boonOptions ) + neededEmptySlots >= GetTotalLootChoices() then break end

			local isValid = true
			for _, forcedTrait in ipairs( boonOptions ) do
				if trait.ItemName == forcedTrait.ItemName then
					isValid = false
				end
			end

			if ModUtil.IndexArray.Get( forcedBoons, { key, "EmptySlot" } ) then
				isValid = false
			end

			if isValid then
				table.insert( boonOptions, key, trait )
			end
		end
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

    baseFunc( screen, button )
end, BoonControl )

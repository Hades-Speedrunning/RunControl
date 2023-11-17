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
            local minRarity = BoonControl.GetMinRarityForBoon( permanentCode, rarityTable )
            local maxRarity = BoonControl.GetMaxRarityForBoon( permanentCode, rarityTable )
			if rarityToUse == "Random" then
				rarityToUse = BoonControl.RollRarityForBoon( permanentCode, rarityTable, lookupTable.Permanent )
			end
			if BoonControl.config.CheckRarityEligibility and BoonControl.RarityToIndex[minRarity] > BoonControl.RarityToIndex[rarityToUse] then
				rarityToUse = minRarity
			end
			if BoonControl.config.CheckRarityEligibility and BoonControl.RarityToIndex[maxRarity] < BoonControl.RarityToIndex[rarityToUse] then
				rarityToUse = maxRarity
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

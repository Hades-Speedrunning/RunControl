--[[
    BoonControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Force Olympians and Hammers to provide certain options, either based on how many times they've appeared thus far, or overall.
]]
ModUtil.Mod.Register("BoonControl")

local config = {
    Enabled = true,
	DefaultRarity = "Common", -- Default rarity when not specified per-boon. If set to false, rarity will be rolled each time
	UseSpareWealth = false, -- Use spare wealth as a fallback instead of using the vanilla boon screen
	DisallowedGods = {} -- Prevent certain gods from being affected
}
BoonControl.config = config

BoonControl.CurrentRunData = {}

BoonControl.GodAppearances = {}
BoonControl.GodRerollNums = {}

function BoonControl.BuildTraitList( forced, eligible, rarityTable, lookupTable )
	local traitOptions = {}
	local isValid = false
	local maxOptions = GetTotalLootChoices() -- TODO possible LootChoiceExt compat

	for trait, _ in pairs( forced ) do
		local currentBoon = forced[trait]
		local currentBoonName = currentBoon.Name
		isValid = Contains( eligible, currentBoonName ) or currentBoon.OverridePrereqs

		if isValid and TableLength( traitOptions ) < maxOptions then
			local boonCode = lookupTable[currentBoonName]
			local boonType = RCLib.InferItemType( boonCode )
			DebugPrint({ Text = boonCode })
			DebugPrint({ Text = boonType })
			local rarityToUse = BoonControl.config.DefaultRarity or "Common"
			if currentBoon.ForcedRarity ~= nil then
				rarityToUse = currentBoon.ForcedRarity
			elseif not BoonControl.config.DefaultRarity then
				rarityToUse = BoonControl.RollRarityForBoon( currentBoonName, rarityTable, lookupTable )
			end

			table.insert( traitOptions, 
				{
					ItemName = boonCode,
					Type = boonType,
					Rarity = rarityToUse,
				}
			)
		end
	end

	return traitOptions
end

function BoonControl.BuildTransformingTraitList( forced, eligible, rarityTable, lookupTable ) -- Chaos
	local traitOptions = {}
	local isValid = false
	local maxOptions = GetTotalLootChoices() -- TODO possible LootChoiceExt compat

	for trait, _ in pairs( forced ) do
		local currentBoon = forced[trait]
		local currentTemporaryTrait = currentBoon.CurseName
		local currentPermanentTrait = currentBoon.BlessingName

		isValid = ( Contains( eligible.Temporary, currentTemporaryTrait ) and Contains( eligible.Permanent, currentPermanentTrait ) ) or currentBoon.OverridePrereqs

		DebugPrint({ Text = currentTemporaryTrait .. " " .. currentPermanentTrait .. " is valid? " .. tostring(isValid) })

		if isValid and TableLength( traitOptions ) < maxOptions then
			local rarityToUse = BoonControl.config.DefaultRarity or "Common"
			if currentBoon.ForcedRarity ~= nil then
				rarityToUse = currentBoon.ForcedRarity
			elseif not BoonControl.config.DefaultRarity then
				rarityToUse = BoonControl.RollRarityForBoon( currentPermanentTrait, rarityTable, lookupTable.Permanent )
			end

			table.insert( traitOptions, 
				{
					ItemName = lookupTable.Permanent[currentPermanentTrait],
					SecondaryItemName = lookupTable.Temporary[currentTemporaryTrait],
					Type = "TransformingTrait",
					Rarity = rarityToUse,
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
	local rarityLevels = RCLib.InferItemData( boonName )

	if TraitData[boonName] ~= nil and TraitData[boonName].RarityLevels ~= nil then
		rarityLevels = TraitData[boonName].RarityLevels
	end
	if ConsumableData[boonName] ~= nil and ConsumableData[boonName].RarityLevels ~= nil then
		rarityLevels = ConsumableData[boonName].RarityLevels
	end

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
	-- TODO edge case: in Styx shop, when multiple of one god can appear in the same room, they will be counted as the same appearance so you can't set them individually
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
	or Contains( config.DisallowedGods, godCode )
	or upgradeChoiceData.TransformingTraits then -- Chaos is handled in a separate function, which baseFunc will call
		return baseFunc( lootData, args )
	end

	local conditions = {}
	conditions.dataType = "boonMenu"
	conditions.godName = RCLib.DecodeBoonSet( godCode )
	conditions.appearanceNum = ( BoonControl.GodAppearances[godCode] or 0 ) + 1
	conditions.rerollNum = ( BoonControl.GodRerollNums[godCode] or 0 ) + 1

	forcedBoons = RCLib.GetFromList( BoonControl.CurrentRunData, conditions ) or {}

	BoonControl.DumpForced = forcedBoons

	local eligibleUpgradeSet = GetEligibleUpgrades( upgradeOptions, lootData, upgradeChoiceData )
	local tableName = "Boons"
	if conditions.godName == "Hammer" then
		tableName = "Hammers"
	end
	local eligibleList = {}
	for key, trait in pairs( eligibleUpgradeSet ) do
		table.insert( eligibleList, RCLib.CodeToName[tableName][trait.ItemName] )
	end

	BoonControl.DumpEligibleSet = eligibleUpgradeSet
	BoonControl.DumpEligibleList = eligibleList

	boonOptions = BoonControl.BuildTraitList( forcedBoons, eligibleList, lootData.RarityChances, RCLib.NameToCode[tableName] )

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
	or IsEmpty( BoonControl.CurrentRunData )
	or Contains( config.DisallowedGods, godCode ) then
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
	BoonControl.DumpSet = eligibleUpgradeSet

	local eligibleList = {}
	eligibleList.Temporary = {}
	eligibleList.Permanent = {}
	for index, trait in ipairs( eligibleUpgradeSet.Temporary ) do
		table.insert( eligibleList.Temporary, RCLib.CodeToName.ChaosCurses[trait] )
	end
	for index, trait in ipairs( eligibleUpgradeSet.Permanent ) do
		table.insert( eligibleList.Permanent, RCLib.CodeToName.ChaosBlessings[trait] )
	end
	BoonControl.DumpList = eligibleList
	local lookupTables = {}
	lookupTables.Temporary = RCLib.NameToCode.ChaosCurses
	lookupTables.Permanent = RCLib.NameToCode.ChaosBlessings

	boonOptions = BoonControl.BuildTransformingTraitList( forcedBoons, eligibleList, lootData.RarityChances, lookupTables )

	if IsEmpty( boonOptions ) and BoonControl.config.UseSpareWealth then -- Failsafe; can be triggered by errors in presets but also by no forced boons being eligible
		table.insert( boonOptions, RCLib.SpareWealth )
	elseif IsEmpty( boonOptions ) then
		return baseFunc( lootData, args )
	end

	lootData.UpgradeOptions = boonOptions
end, BoonControl )

ModUtil.Path.Context.Wrap( "AttemptPanelReroll", function( )
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

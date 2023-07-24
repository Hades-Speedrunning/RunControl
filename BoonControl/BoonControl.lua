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
}
BoonControl.config = config

BoonControl.CurrentRunData = {}

BoonControl.GodAppearances = {}
BoonControl.GodRerollNums = {}

function BoonControl.BuildTraitList( forced, eligible, rarityTable, lookupTable )
	local traitOptions = {}
	local currentTraitName = ""
	local isValid = false
	local maxOptions = GetTotalLootChoices() -- TODO possible LootChoiceExt compat

	for trait, _ in pairs( forced ) do
		currentTrait = forced[trait]
		currentTraitName = currentTrait.Name
		isValid = Contains( eligible, currentTraitName ) or currentTrait.OverridePrereqs

		if isValid and TableLength( traitOptions ) < maxOptions then
			local rarityToUse = BoonControl.config.DefaultRarity or "Common"
			if currentTrait.ForcedRarity ~= nil then
				rarityToUse = currentTrait.ForcedRarity
			elseif not BoonControl.config.DefaultRarity then
				rarityToUse = BoonControl.RollRarityForBoon( currentTraitName, rarityTable, lookupTable )
			end

			table.insert( traitOptions, 
				{
					ItemName = lookupTable[currentTraitName],
					Type = "Trait",
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
	local rarityLevels = nil

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
	conditions = {}

	if not BoonControl.config.Enabled or IsEmpty( BoonControl.CurrentRunData ) then
		return baseFunc( lootData, args )
	end

	local godCode = lootData.Name
	local upgradeChoiceData = LootData[godCode]
	local forcedBoons = {}
	local boonOptions = {}

	conditions.godName = RCLib.DecodeBoonSet( godCode )
	conditions.appearanceNum = ( BoonControl.GodAppearances[godCode] or 0 ) + 1
	conditions.rerollNum = ( BoonControl.GodRerollNums[godCode] or 0 ) + 1

	forcedBoons = RCLib.GetFromList( BoonControl.CurrentRunData, conditions )

	local eligibleUpgradeSet = GetEligibleUpgrades( upgradeOptions, lootData, upgradeChoiceData )
	local tableName = "Boons"
	if conditions.godName == "Hammer" then
		tableName = "Hammers"
	end
	local eligibleList = {}
	for key, trait in pairs( eligibleUpgradeSet ) do
		table.insert( eligibleList, RCLib.CodeToName[tableName][trait.ItemName] )
	end

	boonOptions = BoonControl.BuildTraitList( forcedBoons, eligibleList, lootData.RarityChances, RCLib.NameToCode[tableName] )

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
		BoonControl.GodRerollNums[godCode] = CurrentRun.CurrentRoom.SpentRerolls[godRerollId]
		baseFunc( ... )
	end, BoonControl )
end, BoonControl )

ModUtil.Path.Wrap( "HandleUpgradeChoiceSelection", function( baseFunc, screen, button )
	local upgradeName = button.UpgradeName
	BoonControl.GodAppearances[upgradeName] = ( BoonControl.GodAppearances[upgradeName] or 0 ) + 1
	BoonControl.GodRerollNums[upgradeName] = 0

    baseFunc( screen, button )
end, BoonControl )

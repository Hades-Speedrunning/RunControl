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
		local chanceOfRarityBelow = rarityChances[rarityBelow] or 1
		if validRarities[rarity] and ( chanceOfRarity >= 1 or chanceOfRarityBelow <= 0 or not validRarities[rarityBelow] ) then
			minRarity = rarity
		end
	end
	return minRarity
end

function BoonControl.GetMaxRarityForBoon( boonCode, rarityChances )
	local validRarities = BoonControl.GetValidRarities( boonCode )
	local maxRarity = "Common"

	for index, rarity in ipairs( BoonControl.IndexToRarity ) do
		local rarityBelow = BoonControl.IndexToRarity[index - 1] or "Common"
		local chanceOfRarity = rarityChances[rarity] or 0
		if validRarities[rarity] and chanceOfRarity > 0 then
			maxRarity = rarity
		end
	end
	return maxRarity
end

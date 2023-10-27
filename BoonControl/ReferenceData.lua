BoonControl.PathsToSet = {
    ChaosBlessings = {
        Strike = { "AddOutgoingDamageModifiers", "ValidWeaponMultiplier" },
        Flourish = { "AddOutgoingDamageModifiers", "ValidWeaponMultiplier" },
        Shot = { "AddOutgoingDamageModifiers", "ValidWeaponMultiplier" },
        Lunge = { "AddOutgoingDamageModifiers", "ValidWeaponMultiplier" },
        Assault = { "AddOutgoingDamageModifiers", "HitMaxHealthMultiplier" },
        Ambush = { "AddOutgoingDamageModifiers", "HitVulnerabilityMultiplier" },
        Grasp = { "PropertyChanges", 1, "ChangeValue" },
        Soul = { "PropertyChanges", 1, "ChangeValue" },
        Favor = { "RarityBonus", "RareBonus" },
        Affluence = { "MoneyMultiplier" },
        Eclipse = { "MetaPointMultiplier" },
    },
    ChaosCurses = {
        Slippery = { "AmmoDropUseDelay" },
        Excruciating = { "AddIncomingDamageModifiers", "NonTrapDamageTakenMultiplier" },
        Abyssal = { "AddIncomingDamageModifiers", "TrapDamageTakenMultiplier" },
        Atrophic = { "PropertyChanges", 1, "ChangeValue" },
        Halting = { "PropertyChanges", 1, "ChangeValue" },
        Slothful = { "PropertyChanges", 1, "ChangeValue" },
        Roiling = { "SpawnMultiplier" },
        Maimed = { "DamageOnFireWeapons", "Damage" },
        Flayed = { "DamageOnFireWeapons", "Damage" },
        Addled = { "DamageOnFireWeapons", "Damage" },
    },
}

BoonControl.OverrideRequirements = {
    Defiance = {
        RequiredOneOfTraits = {
            "ChaosBlessingMeleeTrait",
            "ChaosBlessingRangedTrait",
            "ChaosBlessingAmmoTrait",
            "ChaosBlessingMaxHealthTrait",
            "ChaosBlessingBoonRarityTrait",
            "ChaosBlessingMoneyTrait",
            "ChaosBlessingMetapointTrait",
            "ChaosBlessingSecondaryTrait",
            "ChaosBlessingDashAttackTrait",
            "ChaosBlessingBackstabTrait",
            "ChaosBlessingAlphaStrikeTrait",
        },
    },
    RareCrop = {
		RequiredUpgradeableGodTraits = 1,
		RequiredFalseTrait = "HarvestBoonTrait",
	},
}

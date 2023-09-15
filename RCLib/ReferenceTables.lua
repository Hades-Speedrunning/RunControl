RCLib.GodKeepsakes = { -- Find the keepsake used to force a given god
    ZeusUpgrade = "ForceZeusBoonTrait",
    PoseidonUpgrade = "ForcePoseidonBoonTrait",
    AphroditeUpgrade = "ForceAphroditeBoonTrait",
    ArtemisUpgrade = "ForceArtemisBoonTrait",
    DionysusUpgrade = "ForceDionysusBoonTrait",
    AthenaUpgrade = "ForceAthenaBoonTrait",
    AresUpgrade = "ForceAresBoonTrait",
    DemeterUpgrade = "ForceDemeterBoonTrait",
}

RCLib.KeepsakeGods = ModUtil.Table.Transpose( RCLib.GodKeepsakes )

RCLib.RewardLaurels = { -- Check what laurel a given reward has assigned to it
    Darkness = "MetaProgress",
    Gemstones = "MetaProgress",
    ChthonicKey = "MetaProgress",
    Nectar = "MetaProgress",
    Food = "MetaProgress",

    PitchBlackDarkness = "MetaProgress",
    BrilliantGemstones = "MetaProgress",
    FatedKey = "MetaProgress",
    VintageNectar = "MetaProgress",

    Boon = "RunProgress",
    CentaurHeart = "RunProgress",
    DaedalusHammer = "RunProgress",
    Hermes = "RunProgress",
    CharonsObol = "RunProgress",
    PomOfPower = "RunProgress",
    Trial = "RunProgress",
}

RCLib.EliteRewardOverrides = { -- The overrides used when a given reward is an elite room
    Darkness = {
        MakeHardEncounter = true,
        RewardPreviewIcon = "RoomElitePreview",
        RewardPreviewFx = "RoomRewardAvailableRareSparkles",
        RewardBoostedAnimation = "RoomRewardAvailableRareSparkles",
        AddResources =
        {
            MetaPoints = 25,
        },
    },
    Gemstones = {
        MakeHardEncounter = true,
        RewardPreviewIcon = "RoomElitePreview",
        RewardPreviewFx = "RoomRewardAvailableRareSparkles",
        RewardBoostedAnimation = "RoomRewardAvailableRareSparkles",
        AddResources =
        {
            Gems = 10,
        },
    },
    ChthonicKey = {
        MakeHardEncounter = true,
        RewardPreviewIcon = "RoomElitePreview",
        RewardPreviewFx = "RoomRewardAvailableRareSparkles",
        RewardBoostedAnimation = "RoomRewardAvailableRareSparkles",
        AddResources =
        {
            LockKeys = 2,
        },
    },
    PitchBlackDarkness = {
        MakeHardEncounter = true,
        RewardPreviewIcon = "RoomElitePreview",
        RewardPreviewFx = "RoomRewardAvailableRareSparkles",
        RewardBoostedAnimation = "RoomRewardAvailableRareSparkles",
        AddResources =
        {
            MetaPoints = 30,
        },
    },
    BrilliantGemstones = {
        MakeHardEncounter = true,
        RewardPreviewIcon = "RoomElitePreview",
        RewardPreviewFx = "RoomRewardAvailableRareSparkles",
        RewardBoostedAnimation = "RoomRewardAvailableRareSparkles",
        AddResources =
        {
            Gems = 15,
        },
    },
    FatedKeys = {
        MakeHardEncounter = true,
        RewardPreviewIcon = "RoomElitePreview",
        RewardPreviewFx = "RoomRewardAvailableRareSparkles",
        RewardBoostedAnimation = "RoomRewardAvailableRareSparkles",
        AddResources =
        {
            LockKeys = 2,
        },
    },
}

RCLib.SpareWealth = { -- The spare wealth consumable used ingame as a fallback
    ItemName = "FallbackMoneyDrop",
    Type = "Consumable",
    Rarity = "Common"
}

RCLib.StyxHermes = {
    Cost = 500,
    UpgradeChance = 1.0,
    UpgradedCost = 500,
    ReplaceRequirements = { RequiredTextLines = {  "HermesFirstPickUp" } }
}

RCLib.StandardCombats = { -- Every room (in the first 3 biomes) that contains normal encounters and has no special visuals attached
    -- Tartarus
    "RoomSimple01",
    "A_Combat01",
    "A_Combat02",
    "A_Combat03",
    "A_Combat04",
    "A_Combat05",
    "A_Combat06",
    "A_Combat07",
    "A_Combat08A",
    "A_Combat08B",
    "A_Combat09",
    "A_Combat10",
    "A_Combat11",
    "A_Combat12",
    "A_Combat13",
    "A_Combat14",
    "A_Combat15",
    "A_Combat16",
    "A_Combat17",
    "A_Combat18",
    "A_Combat19",
    "A_Combat20",
    "A_Combat21",
    "A_Combat24",

    -- Asphodel
    "B_Combat01",
    "B_Combat02",
    "B_Combat03",
    "B_Combat04",
    "B_Combat05",
    "B_Combat06",
    "B_Combat07",
    "B_Combat08",
    "B_Combat09",
    "B_Combat10",
    "B_Combat21",
    "B_Combat22",

    -- Elysium
    "C_Combat01",
    "C_Combat02",
    "C_Combat03",
    "C_Combat04",
    "C_Combat05",
    "C_Combat06",
    "C_Combat08",
    "C_Combat09",
    "C_Combat10",
    "C_Combat11",
    "C_Combat12",
    "C_Combat13",
    "C_Combat14",
    
}

RCLib.Minibosses = { -- Every midboss room from the first 3 biomes (excluding unused, including barge)
    "A_MiniBoss01",
    "A_MiniBoss02",
    "A_MiniBoss03",
    "A_MiniBoss04",
    "B_Wrapping01",
    "B_MiniBoss01",
    "B_MiniBoss02",
    "C_MiniBoss01",
    "C_MiniBoss02",
}

RCLib.RewardRequirements = {
    -- Blue Laurels
    Darkness = {
        RequiredFalseCosmetics = { "RoomRewardMetaPointDropRunProgress", },
    },
    Gemstones = {
        RequiredFalseCosmetics = { "GemDropRunProgress", },
        RequiredMinCompletedRuns = 4,
    },
    ChthonicKey = {
        RequiredFalseCosmetics = { "LockKeyDropRunProgress", },
    },
    Nectar = {
        RequiredFalseCosmetics = { "GiftDropRunProgress", },
        RequiredMinDepth = 3,
        RequiredMinCompletedRuns = 2,
    },

    -- Upgraded Blue Laurels
    PitchBlackDarkness = {
        RequiredCosmetics = { "RoomRewardMetaPointDropRunProgress", },
    },
    BrilliantGemstones = {
        RequiredCosmetics = { "GemDropRunProgress", },
    },
    FatedKey = {
        RequiredCosmetics = { "LockKeyDropRunProgress", },
    },
    VintageNectar = {
        RequiredCosmetics = { "GiftDropRunProgress", },
        RequiredUpgradeableGodTraits = 1,
    },

    -- Gold Laurels
    Boon = {
        -- None
    },
    CentaurHeart = {
        -- None
    },
    CharonsObol = {
        -- None
    },
    DaedalusHammer = {
        RequiredMaxWeaponUpgrades = 0,
        RequiredNotInStore = "WeaponUpgradeDrop",
        RequiredMinCompletedRuns = 3,
    },
    PomOfPower = {
        RequiredUpgradeableGodTraits = 1,
    },
    Hermes = {
        RequiredMaxHermesUpgrades = 1,
        RequiredNotInStore = "HermesUpgradeDrop",
        RequiredMinCompletedRuns = 3,
        RequiredMinDepth = 13,
    },
    Trial = {
        RequiredMinDepth = 5,
        RequiredMinCompletedRuns = 3,
        RequiredInteractedGodsThisRun = 2,
        RequiredMinRoomsSinceDevotion = 15,
        RequiredMinExits = 2,
        RequiredMaxDepth = 34,
        RequiredFalseBiome = "Styx",
        RequiredMinBiomeDepth = 3,
    }
}

RCLib.EliteRewardRequirements = {
    Darkness = {
        RequiredFalseCosmetics = { "RoomRewardMetaPointDropRunProgress", },
        RequiredMinCompletedRuns = 1,
        RequiredMinExits = 2,
        RequiredMinBiomeDepth = 3,
    },
    Gemstones = {
        RequiredFalseCosmetics = { "GemDropRunProgress", },
        RequiredMinCompletedRuns = 1,
        RequiredMinExits = 2,
        RequiredMinBiomeDepth = 3,
    },
    ChthonicKey = {
        RequiredFalseCosmetics = { "LockKeyDropRunProgress", },
        RequiredMinCompletedRuns = 1,
        RequiredMinExits = 2,
        RequiredMinBiomeDepth = 3,
    },
    Nectar = {
        Skip = true, -- Nectar cannot be elite legitimately
    },
    PitchBlackDarkness = {
        RequiredCosmetics = { "RoomRewardMetaPointDropRunProgress", },
        RequiredMinExits = 2,
        RequiredMinBiomeDepth = 3,
    },
    BrilliantGemstones = {
        RequiredCosmetics = { "GemDropRunProgress", },
        RequiredMinExits = 2,
        RequiredMinBiomeDepth = 3,
    },
    FatedKey = {
        RequiredCosmetics = { "LockKeyDropRunProgress", },
        RequiredMinExits = 2,
        RequiredMinBiomeDepth = 3,
    },
    VintageNectar = {
        Skip = true, -- Nectar cannot be elite legitimately
    },
    Boon = {
        Skip = true, -- Gold laurels cannot be elite legitimately
    },
    CentaurHeart = {
        Skip = true, -- Gold laurels cannot be elite legitimately
    },
    CharonsObol = {
        Skip = true, -- Gold laurels cannot be elite legitimately
    },
    PomOfPower = {
        Skip = true, -- Gold laurels cannot be elite legitimately
    },
    DaedalusHammer = {
        Skip = true, -- Gold laurels cannot be elite legitimately
    },
    Hermes = {
        Skip = true, -- Gold laurels cannot be elite legitimately
    },
    Trial = {
        Skip = true, -- Gold laurels cannot be elite legitimately. Trials are a separate mechanic with their own overrides
    }
}

RCLib.HammerRequirements = {
    {
        RequiredMaxWeaponUpgrades = 0,
        RequiredNotInStore = "WeaponUpgradeDrop",
        RequiredMinCompletedRuns = 3,
    },
    {
        RequiredFalseConsumablesThisRun = { "ChaosWeaponUpgrade" },
        RequiredMaxWeaponUpgrades = 1,
        RequiredNotInStoreNames = { "ChaosWeaponUpgrade", "WeaponUpgradeDrop" },
        RequiredMinCompletedRuns = 3,
        RequiredMinDepth = 26,
    },
}
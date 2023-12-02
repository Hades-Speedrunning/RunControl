RunControl.Runs.CherryDad541Gilgamesh = {
    Metadata = {
        Name = "5:41.89 Gilgamesh by Cherry",
        Description = "The Gilgamesh aspect world record, played on the 23rd of October, 2023."
        .. " It returned Cherry to the WR spot shortly after it was claimed by bablo's 6:00, and finally pushed the aspect over the sub-6 line-"
        .. " The last to reach the milestone."
        .. "\\n\\n Paws up!",
        OriginalTime = "05:41.89",
        OriginalHeat = 9,
        CreatedFor = "1.2.0",
        Tags = { Aspect = "Gilgamesh", Weapon = "Fists", Category = "Modded Any Heat" },
    },
    IndexedBy = { "chamberNum", "dataType", "rerollNum" },
    List = {
        [1] = {
            startingReward = {
                Data = {
                    Reward = "Boon",
                },
            },
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer" }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfAgony" },
                        { Name = "CurseOfPain" },
                        { Name = "SlicingShot" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "CurseOfAgony", ForcedRarity = "Epic" },
                        { Name = "BladeDash" },
                        { Name = "AresAid", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat16", Reward = "PitchBlackDarkness" },
                },
            },
        },
        [2] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 4 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat03", Reward = "DaedalusHammer" },
                    { RoomName = "A_Combat03", Reward = "CharonsObol" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 2 }},
                        {{ Enemy = "Lout" }, { Enemy = "Skullomat" }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "BreachingCross" },
                    { EmptySlot = true },
                    { EmptySlot = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat09", Reward = "Boon", GodName = "Athena" },
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Pest", Num = 3 }, { Enemy = "Skullomat", Num = 3 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DivineFlourish" },
                        { Name = "PhalanxShot" },
                        { Name = "BronzeSkin", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CentaurHeart" },
                    { RoomName = "A_Combat04", Reward = "PomOfPower" },
                },
            },
        },
        [5] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 4 }},
                        {{ Enemy = "Brimstone", Num = 4 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Reprieve01", Reward = "BrilliantGemstones" },
                },
            },
        },
        [6] = {
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CharonsObol" },
                    { RoomName = "A_MiniBoss03", Reward = "Boon", GodName = "Dionysus" },
                },
            },
        },
        [7] = { -- Sneak
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DrunkenStrike", Replace = true },
                        { Name = "TrippyShot", ForcedRarity = "Epic" },
                        { Name = "PositiveOutlook", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat01", Reward = "CentaurHeart" },
                    { RoomName = "A_Combat01", Reward = "PomOfPower" },
                },
            },
        },
        [8] = {
            encounter = {
                Data = {
                    Name = "SurvivalTartarus",
                    EnemyTypes = {{ "ArmoredThug", "Skullomat", "Lout" }},
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat19", Reward = "PomOfPower" },
                },
            },
        },
        [9] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer", Num = 3 }},
                        {{ Enemy = "Wringer" }, { Enemy = "ArmoredNumbskull" }},
                        {{ Enemy = "Wringer", Num = 3 }, { Enemy = "ArmoredBrimstone", Num = 2 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Shop01" },
                    { Reward = "FatedKey" },
                },
            },
        },
        [10] = { -- Tart Midshop
            shop = {
                Data = {
                    { Item = "RandomBag" },
                    { Item = "Darkness" },
                    { Item = "Hermes" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "AutoReload", ForcedRarity = "Epic" },
                        { Name = "SwiftFlourish" },
                        { Name = "GreaterHaste" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "SideHustle" },
                        { Name = "HyperSprint" },
                        { Name = "GreaterHaste" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat11", Reward = "Boon", GodName = "Demeter" },
                },
            },
        },
        [11] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 9 }},
                        {{ Enemy = "Pest", Num = 5 }, { Enemy = "Brimstone", Num = 4 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Trove = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "MistralDash" },
                        { Name = "DemetersAid", ForcedRarity = "Epic" },
                        { Name = "RareCrop" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Story01" },
                    { Reward = "CentaurHeart" },
                },
            },
        },
        [13] = { -- Tart Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "Darkness" },
                    { Item = "CentaurHeart" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "BladeDash" },
                        { Name = "BloodFrenzy", ForcedRarity = "Rare" },
                        { Name = "MercifulEnd", ForcedRarity = "Legendary" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Boss02" },
                },
            },
        },
        [15] = { -- Pre-Aspho Midbiome
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    SellWell = { Force = true },
                },
            },
            shop = {
                [1] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "NightSpindle" },
                        { Item = "NailOfTalos" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "HyperSprint", Value = 45 },
                        { Name = "DivineFlourish", Value = 40 },
                        { Name = "MercifulEnd", Value = 405 },
                    },
                },
            },
        },
        [16] = { -- Aspho Intro
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret02" },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CentaurHeart" },
                },
            },
        },
        [17] = {
            roomFeatures = {
                Data = {
                    FishingPoint = { Force = true },
                    Flipped = false,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Strike",
                            CurseLength = 4,
                            CurseValue = 4.89,
                            BlessingValue = 1.45,
                            ForcedRarity = "Rare",
                        },
                        {
                            CurseName = "Halting",
                            BlessingName = "Eclipse",
                            CurseLength = 4,
                            CurseValue = .52,
                            BlessingValue = 1.67,
                        },
                        {
                            CurseName = "Maimed",
                            BlessingName = "Assault",
                            CurseLength = 3,
                            CurseValue = 4,
                            BlessingValue = 1.34,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat04", Reward = "CharonsObol" },
                    { RoomName = "B_Combat04", Reward = "Boon" },
                    { RoomName = "B_Combat04", Reward = "PomOfPower" },
                },
            },
        },
        [18] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "BurnFlinger", Num = 3 }},
                        {{ Enemy = "BurnFlinger", Num = 2 }, { Enemy = "SlamDancer" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DivineDash", ForcedRarity = "Epic" },
                        { Name = "BlindingFlash", ForcedRarity = "Rare" },
                        { Name = "SureFooting" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Shop01" },
                    { Reward = "Hermes" },
                },
            },
        },
        [19] = { -- Aspho Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Dionysus" },
                    { Item = "Darkness" },
                    { Item = "PomOfPower" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_MiniBoss01", Reward = "Boon", GodName = "Athena" },
                },
            },
        },
        [20] = { -- Power Couple
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "BlindingFlash", ForcedRarity = "Rare" },
                        { Name = "HolyShield", ForcedRarity = "Rare" },
                        { Name = "BrilliantRiposte", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat03", Reward = "Hermes" },
                },
            },
        },
        [21] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredInfernoBomber", Num = 2 }},
                        {{ Enemy = "ArmoredInfernoBomber", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    Flipped = false,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "GreatestReflex" },
                        { Name = "GreaterEvasion" },
                        { Name = "QuickRecovery" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "QuickRecovery" },
                        { Name = "GreaterEvasion" },
                        { Name = "SideHustle" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Reprieve01", Reward = "CharonsObol" },
                    { RoomName = "B_Story01" },
                },
            },
        },
        [23] = { -- Aspho Endshop
            shop = {
                Data = {
                    { Item = "RandomBag", Contents = "Demeter" },
                    { Item = "Darkness" },
                    { Item = "CentaurHeart" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "RavenousWill", ForcedRarity = "Epic" },
                        { Name = "FrozenTouch", ForcedRarity = "Epic" },
                        { Name = "NourishedSoul" },
                    },
                },
            },
        },
        [24] = { -- Lernie
            lernieEncounter = {
                Data = {
                    MainHead = "LavaLernie",
                    SideHeads = { "GreenLernieHead", "BlueLernieHead" },
                },
            },
        },
        [25] = { -- Pre-Ely Midbiome
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    SellWell = { Force = true },
                },
            },
            shop = {
                [1] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "ErisBangle" },
                        { Item = "LightOfIxion" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "BrilliantRiposte", Value = 150 },
                        { Name = "DivineFlourish", Value = 140 },
                        { Name = "DivineDash", Value = 150 },
                    },
                },
            },
        },
        [26] = { -- Ely Intro
            roomFeatures = {
                Data = {
                    ChaosGate = { RoomName = "RoomSecret02" },
                },
            },
        },
        [27] = {
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Flourish",
                            CurseLength = 4,
                            CurseValue = 4.38,
                            BlessingValue = 1.54,
                        },
                        {
                            CurseName = "Caustic",
                            BlessingName = "Defiance",
                            CurseLength = 3,
                            ForcedRarity = "Legendary",
                        },
                        {
                            CurseName = "Addled",
                            BlessingName = "Shot",
                            CurseLength = 3,
                            CurseValue = 4,
                            BlessingValue = 1.36,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat14", Reward = "BrilliantGemstones" },
                    { RoomName = "C_Combat14", Reward = "PitchBlackDarkness" },
                    { RoomName = "C_Combat14", Reward = "VintageNectar" },
                },
            },
        },
        [28] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Longspear", Num = 2 }},
                        {{ Enemy = "Longspear" }},
                        {{ Enemy = "Longspear", Num = 3 }, { Enemy = "Splitter" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CentaurHeart" },
                    { RoomName = "C_Shop01" },
                },
            },
        },
        [29] = { -- Ely Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Demeter" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfAgony" },
                        { Name = "DivineFlourish" },
                        { Name = "TrippyShot" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Reprieve01", Reward = "DaedalusHammer" },
                    { RoomName = "C_MiniBoss01", Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [30] = {
            boonMenu = {
                Data = {
                    { Name = "DrainingCutter" },
                    { Name = "ConcentratedKnuckle" },
                    { Name = "ExplosiveUpper" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss02", Reward = "Boon", GodName = "Zeus" },
                    { Reward = "PomOfPower" },
                },
            },
        },
        [31] = { -- Butterfly Ball
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ZeusAid", ForcedRarity = "Epic" },
                        { Name = "HeavensVengeance", ForcedRarity = "Rare" },
                        { Name = "LightningReflexes", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat11", Reward = "Boon", GodName = "Ares" },
                    { RoomName = "C_Combat11", Reward = "PomOfPower" },
                    { Reward = "CharonsObol" },
                },
            },
        },
        [32] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredSplitter", Num = 2 }},
                        {{ Enemy = "ArmoredSplitter" }},
                        {{ Enemy = "ArmoredSplitter" }, { Enemy = "ArmoredFlamewheel", Num = 4 }, { Enemy = "Longspear", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Trove = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfVengeance" },
                        { Name = "ImpendingDoom" },
                        { Name = "UrgeToKill", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Trial", FirstGodName = "Demeter", SecondGodName = "Athena" },
                    { RoomName = "C_Combat10", Reward = "Boon", GodName = "Athena" },
                },
            },
        },
        [33] = {
            encounter = {
                Data = {
                    Name = "ThanatosElysium",
                    Waves = {
                        {{ Enemy = "Chariot", Num = 4 }},
                        {{ Enemy = "Chariot", Num = 2 }},
                        {{ Enemy = "Chariot", Num = 2 }, { Enemy = "ArmoredBrightsword", Num = 4 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    SellWell = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeathlessStand", ForcedRarity = "Epic" },
                        { Name = "BlindingFlash" },
                        { Name = "SureFooting", ForcedRarity = "Epic" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "HolyShield" },
                        { Name = "BronzeSkin" },
                        { Name = "BlindingFlash" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Story01" },
                    { Reward = "PomOfPower" },
                },
            },
        },
        [34] = {
            exitDoors = {
                Data = {
                    [2] = { Reward = "CentaurHeart" },
                },
            },
        },
        [35] = { -- Ely Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Demeter" },
                    { Item = "Darkness" },
                    { Item = "CentaurHeart" },
                },
            },
        },
        [37] = { -- Pre-Styx Midbiome
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    SellWell = { Force = true },
                },
            },
            shop = {
                [1] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "NightSpindle" },
                        { Item = "YarnOfAriadne" },
                    },
                },
            },
        },
        [38] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
        },
        [39] = { -- Styx Hub (First entry)
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Athena" },
                    { Item = "CentaurHeart" },
                    { Item = "TitansBlood" },
                    { Item = "UpgradedBoon", GodName = "Demeter" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "AnvilOfFates" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini04", Reward = "PomOfPower" },
                    { RoomName = "D_Mini04", Reward = "Boon", GodName = "Dionysus", IsMinibossWing = true },
                    { RoomName = "D_Mini04", Reward = "CharonsObol" },
                    { RoomName = "D_Mini04", Reward = "CentaurHeart", IsMinibossWing = true },
                    { RoomName = "D_Mini04", Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [40] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 2 }, { Enemy = "Bother" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini03" },
                },
            },
        },
        [41] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 2 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini04" },
                },
            },
        },
        [42] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Snakestone", Num = 2 }, { Enemy = "Bother" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 3,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini11" },
                },
            },
        },
        [43] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Satyr", Num = 2 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_MiniBoss01" },
                },
            },
        },
        [44] = { -- Mega-Satyr
            roomFeatures = {
                Data = {
                    Flipped = true,
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "HighTolerance", ForcedRarity = "Rare" },
                        { Name = "AfterParty" },
                        { Name = "PositiveOutlook", ForcedRarity = "Rare" },
                    },
                },
            },
        },
        [45] = { -- Styx Hub (Second entry)
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini01" },
                    { RoomName = "D_Mini01" },
                    { RoomName = "D_Mini01" },
                    { RoomName = "D_Mini01" },
                },
            },
        },
        [46] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Snakestone" }, { Enemy = "Satyr" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    SellWell = { Force = true },
                    GoldPotNum = 3,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini11" },
                },
            },
        },
        [47] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 2 }, { Enemy = "Snakestone" }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini01" },
                },
            },
        },
        [48] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat" }, { Enemy = "Bother", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Reprieve01" },
                },
            },
        },
        [49] = { -- Styx Fountain
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfAgony" },
                        { Name = "DivineFlourish" },
                        { Name = "ImpendingDoom" },
                    },
                },
            },
        },
    },
}

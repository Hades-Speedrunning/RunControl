RunControl.Runs.ocaml526Rama = {
    Metadata = {
        Name = "5:26.16 Rama by ocaml",
        Description = "The former Any Heat world record, played on the 29th of December, 2021."
        .. " It ended a long community push to beat Croven's (in)famous 5:32 Beowulf run,"
        .. " surprising many, as Rama has not held the world record before or since."
        .. " Croven would reclaim his record 5 days later.",
        OriginalTime = "05:26.16",
        OriginalHeat = 9,
        CreatedFor = "1.1.0",
        Tags = { Aspect = "Rama", Weapon = "Bow", Category = "Unmodded Any Heat" },
    },
    IndexedBy = { "chamberNum", "dataType", "rerollNum" },
    List = {
        [1] = {
            startingReward = {
                Data = { Reward = "DaedalusHammer" },
            },
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret03" },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "ChainShot" },
                    { Name = "PointBlankShot" },
                    { Name = "TwinShot" },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "PitchBlackDarkness" },
                },
            },
        },
        [2] = {
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        {
                            CurseName = "Slothful",
                            BlessingName = "Grasp",
                            CurseLength = 3,
                            CurseValue = .4,
                        },
                        {
                            CurseName = "Flayed",
                            BlessingName = "Lunge",
                            CurseLength = 3,
                            CurseValue = 3,
                            BlessingValue = 1.88,
                            ForcedRarity = "Rare",
                        },
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Assault",
                            CurseLength = 3,
                            CurseValue = 3.18,
                            BlessingValue = 1.63,
                            ForcedRarity = "Epic",
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat01", Reward = "PitchBlackDarkness" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 2 }, { Enemy = "Skullomat", Num = 2 }},
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
                    { RoomName = "A_Combat19", Reward = "CentaurHeart" }
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 2 }},
                        {{ Enemy = "Brimstone", Num = 1 }},
                        {{ Enemy = "Brimstone", Num = 2 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat09", Reward = "Boon", GodName = "Zeus" },
                    { RoomName = "A_Combat09", Reward = "CharonsObol" },
                },
            },
        },
        [5] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 3 }},
                        {{ Enemy = "Brimstone" }, { Enemy = "ArmoredWitch" }},
                        {{ Enemy = "Brimstone", Num = 3 }, { Enemy = "ArmoredLout" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ThunderFlourish", ForcedRarity = "Epic" },
                        { Name = "ElectricShot", ForcedRarity = "Rare" },
                        { Name = "ThunderDash" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat05", Reward = "FatedKey" },
                },
            },
        },
        [6] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Skullomat", Num = 3 }, { Enemy = "ArmoredWringer", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    ErebusGate = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", GodName = "Artemis" },
                    { Reward = "Boon", GodName = "Demeter", ForcedRooms = { "A_MiniBoss01", "A_MiniBoss03" } },
                    { RoomName = "A_Shop01" },
                },
            },
        },
        [7] = { -- Tart Midshop
            shop = {
                Data = {
                    { Item = "RandomBag", Contents = "Zeus" },
                    { Item = "ChthonicKey" },
                    { Item = "CentaurHeart" },
                },
            },
            roomFeatures = {
                Data = {
                    FishingPoint = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ElectricShot" },
                        { Name = "ThunderDash", ForcedRarity = "Epic" },
                        { Name = "StaticDischarge", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", GodName = "Artemis", RoomName = "A_MiniBoss04" },
                },
            },
        },
        [8] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeadlyStrike", ForcedRarity = "Epic" },
                        { Name = "HunterDash", ForcedRarity = "Epic" },
                        { Name = "ArtemisAid", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Story01" },
                },
            },
        },
        [9] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat02", Reward = "CentaurHeart" },
                },
            },
        },
        [10] = {
            encounter = {
                Data = {
                    Name = "SurvivalTartarus",
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                    Well = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat08B", Reward = "PomOfPower" },
                },
            },
        },
        [11] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 3 }},
                        {{ Enemy = "Lout" }, { Enemy = "ArmoredThug" }},
                        {{ Enemy = "Lout", Num = 2 }, { Enemy = "ArmoredThug" }, { Enemy = "Brimstone" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret02" },
                },
            },
            exitDoors = {
                Data = {
                    { EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [12] = {
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Caustic",
                            BlessingName = "Soul",
                            CurseLength = 4,
                            BlessingValue = 34,
                        },
                        {
                            CurseName = "Roiling",
                            BlessingName = "Flourish",
                            CurseLength = 4,
                            CurseValue = 1.62,
                            BlessingValue = 1.38,
                        },
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Affluence",
                            CurseLength = 3,
                            CurseValue = 3.99,
                            BlessingValue = 1.45,
                        },
                    },
                },
                [2] = {
                    Data = {
                        {
                            CurseName = "Excruciating",
                            BlessingName = "Favor",
                            CurseLength = 4,
                            CurseValue = 1.26,
                            BlessingValue = .14,
                        },
                        {
                            CurseName = "Atrophic",
                            BlessingName = "Shot",
                            CurseLength = 4,
                            CurseValue = -32,
                            BlessingValue = 1.39,
                        },
                        {
                            CurseName = "Halting",
                            BlessingName = "Lunge",
                            CurseLength = 4,
                            CurseValue = .57,
                            BlessingValue = 2,
                            ForcedRarity = "Epic",
                        },
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
                    [2] = { Reward = "PomOfPower" },
                    [3] = { Reward = "CentaurHeart" },
                },
            },
        },
        [13] = { -- Tart Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Zeus" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ThunderDash", ForcedRarity = "Epic" },
                        { Name = "HighVoltage" },
                        { Name = "HeavensVengeance", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Boss01" },
                },
            },
        },
        [15] = { -- Pre-Aspho Midbiome
            shop = {
                [1] = {
                    Data = {
                        { Item = "HydraLite" },
                        { Item = "NemesisCrest" },
                        { Item = "SkeletalLure" },
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    SellWell = { Force = true },
                },
            },
        },
        [16] = { -- Aspho Intro
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat04", Reward = "PomOfPower" },
                },
            },
        },
        [17] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "BurnFlinger", Num = 2 }},
                        {{ Enemy = "BurnFlinger" }},
                        {{ Enemy = "BurnFlinger" }, { Enemy = "ArmoredSkullomat" }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeadlyStrike" },
                        { Name = "HeavensVengeance" },
                        { Name = "StaticDischarge" },
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
                    { RoomName = "B_Story01" },
                    { Reward = "Boon", EligibleRooms = RCLib.StandardCombats },
                    { EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [18] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat02", Reward = "PomOfPower" },
                },
            },
        },
        [19] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredDracon", Num = 2 }},
                        {{ Enemy = "ArmoredDracon" }},
                        {{ Enemy = "ArmoredDracon", Num = 2 }, { Enemy = "BoneRaker", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeadlyStrike" },
                        { Name = "StaticDischarge" },
                        { Name = "HeavensVengeance" },
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", ForcedRooms = { "B_MiniBoss02", "B_Wrapping01" } },
                    { RoomName = "B_Shop01" },
                },
            },
        },
        [20] = {
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Poseidon" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FloodShot", ForcedRarity = "Rare" },
                        { Name = "TidalDash", ForcedRarity = "Rare"  },
                        { Name = "OceansBounty", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_MiniBoss01", Reward = "Boon" },
                },
            },
        },
        [21] = {
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret02" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "TidalDash", ForcedRarity = "Rare" },
                        { Name = "RazorShoals", ForcedRarity = "Rare"  },
                        { Name = "BreakingWave", ForcedRarity = "Epic" },
                    },
                },
            },
        },
        [22] = {
            roomFeatures = {
                Data = {
                    Flipped = false,
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Flayed",
                            BlessingName = "Flourish",
                            CurseLength = 3,
                            CurseValue = 3,
                            BlessingValue = 1.66,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Shot",
                            CurseLength = 3,
                            CurseValue = 4.03,
                            BlessingValue = 1.76,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Atrophic",
                            BlessingName = "Soul",
                            CurseLength = 4,
                            CurseValue = -43,
                            BlessingValue = 54,
                            ForcedRarity = "Rare",
                        },
                    },
                },
                [2] = {
                    Data = {
                        {
                            CurseName = "Maimed",
                            BlessingName = "Soul",
                            CurseLength = 4,
                            CurseValue = 4,
                            BlessingValue = 72,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Assault",
                            CurseLength = 3,
                            CurseValue = 4.03,
                            BlessingValue = 1.70,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Atrophic",
                            BlessingName = "Flourish",
                            CurseLength = 3,
                            CurseValue = -40,
                            BlessingValue = 1.89,
                            ForcedRarity = "Epic",
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "PomOfPower" },
                    [3] = { Reward = "Boon", GodName = "Poseidon" },
                },
            },
        },
        [23] = { -- Aspho Preboss
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "TidalDash", ForcedRarity = "Epic" },
                        { Name = "RazorShoals" },
                        { Name = "OceansBounty", ForcedRarity = "Rare" },
                    },
                },
            },
        },
        [24] = { -- Lernie
            lernieEncounter = {
                Data = {
                    MainHead = "PinkLernie",
                    SideHeads = { "OrangeLernieHead", "LavaLernieHead" },
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
        },
        [26] = { -- Ely Intro
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat10", Reward = "CentaurHeart" },
                    { RoomName = "C_Combat10", Reward = "CharonsObol" },
                },
            },
        },
        [27] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Longspear", Num = 2 }},
                        {{ Enemy = "Longspear" }},
                        {{ Enemy = "Longspear", Num = 2 }, { Enemy = "SoulCatcher" }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat03", Reward = "CharonsObol" },
                    { RoomName = "C_Combat03", Reward = "PomOfPower" },
                },
            },
        },
        [28] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Chariot", Num = 3 }},
                        {{ Enemy = "Chariot" }, { Enemy = "SoulCatcher", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "DeadlyStrike" },
                    { Name = "StaticDischarge" },
                    { Name = "RazorShoals" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat12", Reward = "Boon", GodName = "Artemis" },
                    { RoomName = "C_Combat12", Reward = "Trial", FirstGodName = "Zeus", SecondGodName = "Poseidon" },
                },
            },
        },
        [29] = {
            encounter = {
                Data = {
                    Name = "ThanatosElysium",
                    Waves = {
                        {{ Enemy = "Longspear", Num = 4 }},
                        {{ Enemy = "ArmoredSplitter" }, { Enemy = "Longspear" }},
                        {{ Enemy = "ArmoredGreatshield", Num = 2 }, { Enemy = "Longspear", Num = 4 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                    Trove = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeadlyFlourish", Replace = true },
                        { Name = "HunterDash" },
                        { Name = "ExitWounds" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Shop01" },
                    { RoomName = "C_MiniBoss01", Reward = "Boon", GodName = "Demeter" },
                },
            },
        },
        [30] = { -- Ely Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Zeus" },
                    { Item = "Food" },
                    { Item = "CentaurHeart" },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "LightningStrike", Replace = true },
                        { Name = "DoubleStrike" },
                        { Name = "HighVoltage" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Story01" },
                    { Reward = "Boon", GodName = "Zeus", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [31] = {
            exitDoors = {
                Data = {
                    { RoomName = "C_Reprieve01", Reward = "DaedalusHammer" },
                    { Reward = "CentaurHeart", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [32] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                Data = {
                    { Name = "PerfectShot" },
                    { Name = "RelentlessVolley" },
                    { Name = "RepulseShot" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss02", Reward = "Boon", GodName = "Demeter" },
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [33] = {
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret03" },
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "SnowBurst", ForcedRarity = "Epic" },
                        { Name = "RavenousWill", ForcedRarity = "Rare" },
                        { Name = "NourishedSoul", ForcedRarity = "Rare" },
                    },
                },
            },
        },
        [34] = {
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        {
                            CurseName = "Maimed",
                            BlessingName = "Strike",
                            CurseLength = 3,
                            CurseValue = 3,
                            BlessingValue = 1.7,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Slothful",
                            BlessingName = "Flourish",
                            CurseLength = 4,
                            CurseValue = .45,
                            BlessingValue = 1.58,
                        },
                        {
                            CurseName = "Flayed",
                            BlessingName = "Affluence",
                            CurseLength = 4,
                            CurseValue = 5,
                            BlessingValue = 1.3,
                        },
                    },
                },
            },
        },
        [35] = { -- Ely Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Artemis" },
                    { Item = "Food" },
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
                        { Item = "HydraLite" },
                        { Item = "FatefulTwist", Contents = "YarnOfAriadne" },
                        { Item = "PrometheusStone" },
                    },
                },
            },
        },
        [38] = { -- Styx Intro
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
        },
        [39] = { -- Styx Hub (First entry)
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Demeter" },
                    { Item = "CentaurHeart" },
                    { Item = "TitansBlood" },
                    { Item = "UpgradedBoon", GodName = "Zeus" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "AnvilOfFates" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini05", Reward = "CharonsObol", IsMinibossWing = true },
                    { RoomName = "D_Mini05", Reward = "Hermes" },
                    { RoomName = "D_Mini05", Reward = "PomOfPower" },
                    { RoomName = "D_Mini05", Reward = "CentaurHeart" },
                    { RoomName = "D_Mini05", Reward = "Boon", GodName = "Zeus", IsMinibossWing = true },
                },
            },
        },
        [40] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 2 }},
                    },
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
                        {{ Enemy = "Snakestone", Num = 2 }, { Enemy = "TinyRat", Num = 3 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 2,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini13" },
                },
            },
        },
        [42] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 3 }}
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini01" },
                },
            },
        },
        [43] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 2 }}
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_MiniBoss04" },
                },
            },
        },
        [44] = {
            roomFeatures = {
                Data = {
                    SellWell = { Force = true },
                    GoldPotNum = 2,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ZeusAid", ForcedRarity = "Rare" },
                        { Name = "LightningReflexes", ForcedRarity = "Epic" },
                        { Name = "HighVoltage", ForcedRarity = "Rare" },
                    },
                },
            },
        },
        [45] = { -- Styx Hub (Second entry)
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini10" },
                    { RoomName = "D_Mini10" },
                    { RoomName = "D_Mini10" },
                    { RoomName = "D_Mini10" },
                },
            },
        },
        [46] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 2 }, { Enemy = "Snakestone" }}
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
                    { RoomName = "D_Mini13" },
                },
            },
        },
        [47] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 2 }},
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
        [48] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 2 }, { Enemy = "Satyr" }}
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
                    { RoomName = "D_Reprieve01" },
                },
            },
        },
        [49] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 2,
                },
            },
        },
    },
}

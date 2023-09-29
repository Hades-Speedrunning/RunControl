RunControl.Runs.DrkFrst504Beowulf = {
    Metadata = {
        Name = "5:04.33 Beowulf by DrkFrst",
        Description = "The Any Heat world record as of this pack's creation, played on the 5th of April, 2023."
        .. " It ended an unusually long string of bad luck that kept Drk from the top spot,"
        .. " as well as Croven's monstrous 15-month reign as record holder."
        .. "\\n\\n We ride at dawn!",
        OriginalTime = "05:04.33",
        OriginalHeat = 9,
        CreatedFor = "1.0.0",
        Tags = { Aspect = "Beowulf", Weapon = "Shield", Category = "Unmodded Any Heat" },
    },
    IndexedBy = { "chamberNum", "dataType", "rerollNum" },
    List = {
        [1] = {
            startingReward = {
                Data = {
                    Reward = "DaedalusHammer",
                },
            },
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Numbskull", Num = 4 }}
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ChargedShot" },
                        { Name = "UnyieldingDefense" },
                        { Name = "MinotaurRush" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat03", Reward = "FatedKey" },
                },
            },
        },
        [2] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Witch", Num = 3 }},
                        {{ Enemy = "Witch", Num = 2 }, { Enemy = "Thug" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    FishingPoint = { Force = true },
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat10", Reward = "Boon" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Witch", Num = 9 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "TempestStrike" },
                        { Name = "TempestFlourish" },
                        { Name = "TidalDash" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "FloodShot" },
                        { Name = "TidalDash" },
                        { Name = "HydraulicMight" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat12", Reward = "CentaurHeart" },
                    { RoomName = "A_Combat12", Reward = "Boon", GodName = "Artemis" },
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Thug", Num = 3 }, { Enemy = "Numbskull", Num = 9 }},
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
                        { Name = "DeadlyStrike" },
                        { Name = "DeadlyFlourish" },
                        { Name = "ArtemisAid" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat05", Reward = "PomOfPower" },
                    { RoomName = "A_Combat05", Reward = "CentaurHeart" },
                },
            },
        },
        [5] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 3 }, { Enemy = "Wringer", Num = 2 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "PitchBlackDarkness", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "A_Shop01" },
                },
            },
        },
        [6] = { -- Tart Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Zeus" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_MiniBoss03", Reward = "Boon", GodName = "Dionysus" },
                },
            },
        },
        [7] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DrunkenDash", ForcedRarity = "Rare" },
                        { Name = "DionysusAid", ForcedRarity = "Epic" },
                        { Name = "StrongDrink", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat16", Reward = "CharonsObol" },
                    { RoomName = "A_Combat16", Reward = "PomOfPower" },
                },
            },
        },
        [8] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Pest", Num = 12 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    Well = { Force = true },
                    ChaosGate = { Force = true, RoomName = "RoomSecret02" },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "Trial", FirstGodName = "Artemis", SecondGodName = "Poseidon", EligibleRooms = RCLib.StandardCombats },
                    [3] = { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [9] = {
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Caustic",
                            BlessingName = "Shot",
                            CurseLength = 4,
                            BlessingValue = 1.33,
                        },
                        {
                            CurseName = "Addled",
                            BlessingName = "Assault",
                            CurseLength = 4,
                            CurseValue = 5,
                            BlessingValue = 1.34,
                        },
                        {
                            CurseName = "Paupers",
                            BlessingName = "Grasp",
                            CurseLength = 4,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Story01" },
                    { Reward = "CentaurHeart", EligibleRooms = RCLib.StandardCombats },
                    { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [10] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat14", Reward = "BrilliantGemstones" },
                },
            },
        },
        [11] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredWringer", Num = 4 }},
                        {{ Enemy = "ArmoredWringer", Num = 2 }, { Enemy = "Pest", Num = 4 }},
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
                    { Reward = "PomOfPower" },
                    { RoomName = "A_Combat02", Reward = "Boon", GodName = "Dionysus" },
                },
            },
        },
        [12] = {
            encounter = {
                Data = {
                    Name = "SurvivalTartarus",
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DrunkenDash" },
                        { Name = "AfterParty" },
                        { Name = "PremiumVintage" },
                    },
                },
            },
        },
        [13] = { -- Tart Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Zeus" },
                    { Item = "Darkness" },
                    { Item = "Hermes" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "HyperSprint" },
                        { Name = "GreaterEvasion" },
                        { Name = "SwiftStrike" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Boss02", AlwaysEligible = true },
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
                        { Item = "NailOfTalos" },
                        { Item = "CyclopsJerky" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "StrongDrink", Value = 75 },
                        { Name = "DeadlyStrike", Value = 65 },
                        { Name = "FloodShot", Value = 120 },
                    },
                },
            },
        },
        [16] = { -- Aspho Intro
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat05", Reward = "CentaurHeart" },
                },
            },
        },
        [17] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "SlamDancer", Num = 3 }},
                        {{ Enemy = "SlamDancer", Num = 2 }, { Enemy = "Bloodless", Num = 3 }},
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
                    { RoomName = "B_Story01" },
                    { Reward = "Hermes", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [18] = {
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat07", Reward = "Boon" },
                },
            },
        },
        [19] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "BoneRaker", Num = 3 }},
                        {{ Enemy = "BoneRaker" }, { Enemy = "WaveMaker" }},
                        {{ Enemy = "BoneRaker", Num = 2 }, { Enemy = "SlamDancer", Num = 2 }, { Enemy = "Spreader" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                    FishingPoint = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeadlyFlourish", ForcedRarity = "Rare" },
                        { Name = "HuntersMark", ForcedRarity = "Epic" },
                        { Name = "HideBreaker", ForcedRarity = "Rare" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "HunterDash", ForcedRarity = "Rare" },
                        { Name = "HuntersMark", ForcedRarity = "Rare" },
                        { Name = "MirageShot", ForcedRarity = "Legendary" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", GodName = "Zeus", ForcedRooms = { "B_MiniBoss01", "B_Wrapping01" } },
                    { RoomName = "B_MiniBoss02", Reward = "Boon", GodName = "Poseidon" },
                },
            },
        },
        [20] = { -- Witches
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "TidalDash", ForcedRarity = "Epic" },
                        { Name = "RazorShoals", ForcedRarity = "Rare" },
                        { Name = "BreakingWave", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Reprieve01", Reward = "CentaurHeart" },
                },
            },
        },
        [21] = {
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat22", Reward = "PomOfPower" },
                },
            },
        },
        [22] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Spreader", Num = 5 }},
                        {{ Enemy = "Bloodless" }, { Enemy = "Spreader", Num = 2 }},
                        {{ Enemy = "Bloodless", Num = 2 }, { Enemy = "Spreader", Num = 3 }, { Enemy = "InfernoBomber", Num = 2 }},
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
                    [2] = { Reward = "Hermes" },
                },
            },
        },
        [23] = { -- Aspho Preboss
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "GreaterEvasion", ForcedRarity = "Rare" },
                        { Name = "SwiftFlourish", ForcedRarity = "Rare" },
                        { Name = "GreaterHaste", ForcedRarity = "Rare" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "GreaterEvasion", ForcedRarity = "Rare" },
                        { Name = "SwiftStrike", ForcedRarity = "Rare" },
                        { Name = "RushDelivery", ForcedRarity = "Epic" },
                    },
                },
            },
        },
        [24] = {
            lernieEncounter = {
                Data = {
                    MainHead = "BlueLernie",
                    SideHeads = { "PinkLernieHead", "OrangeLernieHead" },
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
                        { Item = "NightSpindle" },
                        { Item = "PrometheusStone" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "RushDelivery", Value = 140 },
                        { Name = "StrongDrink", Value = 70 },
                        { Name = "FloodShot", Value = 140 },
                    },
                },
            },
        },
        [26] = { -- Ely Intro
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret01" },
                },
            },
        },
        [27] = {
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Flourish",
                            CurseLength = 4,
                            CurseValue = 4.9,
                            BlessingValue = 1.59,
                        },
                        {
                            CurseName = "Paupers",
                            BlessingName = "Assault",
                            CurseLength = 3,
                            BlessingValue = 1.37,
                        },
                        {
                            CurseName = "Caustic",
                            BlessingName = "Eclipse",
                            CurseLength = 4,
                            BlessingValue = 1.58,
                        },
                    },
                },
                [2] = {
                    Data = {
                        {
                            CurseName = "Caustic",
                            BlessingName = "Lunge",
                            CurseLength = 4,
                            BlessingValue = 1.59,
                        },
                        {
                            CurseName = "Enshrouded",
                            BlessingName = "Favor",
                            CurseLength = 4,
                            BlessingValue = .13,
                        },
                        {
                            CurseName = "Paupers",
                            BlessingName = "Strike",
                            CurseLength = 3,
                            BlessingValue = 1.35,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat01", Reward = "PitchBlackDarkness" },
                    { RoomName = "C_Combat01", Reward = "BrilliantGemstones" },
                },
            },
        },
        [28] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Longspear", Num = 3 }},
                        {{ Enemy = "Longspear", Num = 3 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat11", Reward = "DaedalusHammer" },
                },
            },
        },
        [29] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredSplitter", Num = 2 }},
                        {{ Enemy = "ArmoredSplitter", Num = 2 }},
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
                        { Name = "EmpoweringFlight" },
                        { Name = "ExplosiveReturn" },
                        { Name = "UnyieldingDefense" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Shop01" },
                    { RoomName = "C_MiniBoss01", Reward = "Boon", GodName = "Poseidon" },
                },
            },
        },
        [30] = { -- Ely Midshop
            shop = {
                Data = {
                    { Item  = "Boon", GodName = "Ares" },
                    { Item  = "Food" },
                    { Item  = "PomOfPower" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss02", Reward = "Boon", GodName = "Athena" },
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [31] = { -- Bball
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DivineDash", ForcedRarity = "Rare" },
                        { Name = "AthenasAid", ForcedRarity = "Rare" },
                        { Name = "BronzeSkin", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat12", Reward = "PomOfPower" },
                    { RoomName = "C_Combat12", Reward = "CharonsObol" },
                    { Reward = "CentaurHeart" },
                },
            },
        },
        [32] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Splitter", Num = 9 }},
                        {{ Enemy = "Splitter", Num = 5 }, { Enemy = "ArmoredVoidstone", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeadlyStrike" },
                        { Name = "FloodShot" },
                        { Name = "DivineDash" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat03", Reward = "PomOfPower" },
                    { RoomName = "C_Combat03", Reward = "Trial", FirstGodName = "Poseidon", SecondGodName = "Dionysus" },
                },
            },
        },
        [33] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredBrightsword", Num = 4 }},
                        {{ Enemy = "ArmoredBrightsword" }, { Enemy = "ArmoredVoidstone", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FloodShot" },
                        { Name = "DivineDash" },
                        { Name = "RazorShoals" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "C_Story01" },
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
                        { Item = "GaeasTreasure" },
                        { Item = "PrometheusStone" },
                    },
                },
                [2] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "TingeOfErebus" },
                        { Item = "YarnOfAriadne" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "HyperSprint", Value = 40 },
                        { Name = "MirageShot", Value = 400 },
                        { Name = "RazorShoals", Value = 85 },
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
                    { Item = "Boon", GodName = "Artemis" },
                    { Item = "PomOfPower" },
                    { Item = "TitansBlood" },
                    { Item = "UpgradedBoon", GodName = "Artemis" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "AnvilOfFates" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini13", Reward = "PomOfPower", IsMinibossWing = true },
                    { RoomName = "D_Mini13", Reward = "CharonsObol" },
                    { RoomName = "D_Mini13", Reward = "Boon", GodName = "Poseidon" },
                    { RoomName = "D_Mini13", Reward = "Boon", GodName = "Dionysus", IsMinibossWing = true },
                    { RoomName = "D_Mini13", Reward = "Boon", GodName = "Athena" },
                },
            },
        },
        [40] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "TinyRat" }, { Enemy = "Satyr" }},
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
                    { RoomName = "D_Mini02" },
                },
            },
        },
        [41] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Snakestone", Num = 2 }},
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
        [42] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Satyr", Num = 2 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_MiniBoss01", AlwaysEligible = true },
                },
            },
        },
        [43] = { -- Mega-Satyr
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FloodShot" },
                        { Name = "DivineDash" },
                        { Name = "RazorShoals" },
                    },
                },
            },
        },
        [44] = { -- Styx Hub (Second entry)
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini10" },
                    { RoomName = "D_Mini10" },
                    { RoomName = "D_Mini10" },
                    { RoomName = "D_Mini10" },
                },
            },
        },
        [45] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Satyr", Num = 2 }},
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
                    { RoomName = "D_Mini01" },
                },
            },
        },
        [46] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Satyr" }, { Enemy = "Rat" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    GoldPotNum = 2,
                },
            },
            shop = {
                [1] = {
                    Data = {
                        { Item = "EyeOfLamia" },
                        { Item = "FatefulTwist", Contents = "ErisBangle" },
                        { Item = "ErisBangle" },
                    },
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
                        {{ Enemy = "Bother" }, { Enemy = "TinyRat", Num = 6 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Reprieve01" },
                },
            },
        },
        [48] = { -- Styx Fountain
            roomFeatures = {
                Data = {
                    GoldPotNum = 2,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DrunkenFlourish", ForcedRarity = "Rare" },
                        { Name = "PositiveOutlook", ForcedRarity = "Rare" },
                        { Name = "AfterParty", ForcedRarity = "Rare" },
                    },
                },
            },
        },
    },
}

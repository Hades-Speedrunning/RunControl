RunControl.Runs["185549Achilles"] = {
    Metadata = {
        Name = "5:49.63 Achilles by 185",
        Description = "The former Any Heat world record, played on the 2nd of July, 2021."
        .. " It was the first world record in over a year not to be set on Eris, dethroning the aspect to this day,"
        .. " and remained the world record until it was beaten by Croven the following month.",
        OriginalTime = "05:49.63",
        OriginalHeat = 9,
        CreatedFor = "1.2.0",
        Tags = { Aspect = "Achilles", Weapon = "Spear", Category = "Unmodded Any Heat" },
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
                        {{ Enemy = "Thug" }, { Enemy = "Numbskull", Num = 3 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "FlurryJab" },
                    { Name = "BreachingSkewer" },
                    { Name = "QuickSpin" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat21", Reward = "PitchBlackDarkness" },
                },
            },
        },
        [2] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 2 }},
                        {{ Enemy = "Brimstone" }},
                        {{ Enemy = "Brimstone" }, { Enemy = "Lout" }},
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
                    { RoomName = "A_Combat04", Reward = "Boon" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Thug", Num = 3 }, { Enemy = "Wringer" }},
                    },
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
                        { Name = "TempestStrike", ForcedRarity = "Epic" },
                        { Name = "TempestFlourish" },
                        { Name = "TidalDash" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat12", Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 7 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                    ChaosGate = { Force = true, RoomName = "RoomSecret03" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "LightningStrike" },
                        { Name = "ElectricShot", ForcedRarity = "Epic" },
                        { Name = "HeavensVengeance" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                    { Reward = "Boon", GodName = "Aphrodite", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [5] = {
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Roiling",
                            BlessingName = "Strike",
                            CurseLength = 3,
                            CurseValue = 1.35,
                            BlessingValue = 1.34,
                        },
                        {
                            CurseName = "Caustic",
                            BlessingName = "Shot",
                            CurseLength = 3,
                            BlessingValue = 1.33,
                        },
                        {
                            CurseName = "Slothful",
                            BlessingName = "Affluence",
                            CurseLength = 4,
                            CurseValue = .51,
                            BlessingValue = 1.45,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat15", Reward = "CentaurHeart" },
                },
            },
        },
        [6] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredWringer", Num = 2 }},
                        {{ Enemy = "ArmoredWringer" }},
                        {{ Enemy = "ArmoredWringer" }, { Enemy = "Lout" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    FishingPoint = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Shop01" },
                    { Reward = "FatedKey", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [7] = { -- Tart Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "Food" },
                    { Item = "CentaurHeart" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_MiniBoss03", Reward = "Boon", GodName = "Athena" },
                },
            },
        },
        [8] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DivineFlourish", ForcedRarity = "Rare" },
                        { Name = "AthenasAid", ForcedRarity = "Rare" },
                        { Name = "SureFooting", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat14", Reward = "PomOfPower" },
                    { RoomName = "A_Combat14", Reward = "Boon", GodName = "Athena" },
                },
            },
        },
        [9] = {
            encounter = {
                Data = {
                    Name = "SurvivalTartarus",
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                },
            },
            shop = {
                [1] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "NailOfTalos" },
                        { Item = "IgnitedIchor" },
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "LightningStrike" },
                        { Name = "DivineFlourish" },
                        { Name = "TidalDash" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat16", Reward = "PomOfPower" },
                },
            },
        },
        [10] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer", Num = 7 }, { Enemy = "ArmoredNumbskull", Num = 6 }},
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
                        { Name = "LightningStrike" },
                        { Name = "DivineFlourish" },
                        { Name = "TidalDash" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "PitchBlackDarkness", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "A_Story01" },
                },
            },
        },
        [11] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Reprieve01", Reward = "CharonsObol" },
                },
            },
        },
        [12] = {
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "CentaurHeart" },
                },
            },
        },
        [13] = { -- Tart Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Aphrodite" },
                    { Item = "Food" },
                    { Item = "Hermes" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "GreaterHaste" },
                        { Name = "SideHustle", ForcedRarity = "Epic" },
                        { Name = "HyperSprint", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Boss03" },
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
                        { Item = "ChimaeraJerky" },
                        { Item = "PrometheusStone" },
                    },
                },
            },
        },
        [16] = { -- Aspho Intro
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat05", Reward = "Hermes" },
                },
            },
        },
        [17] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "WaveMaker", Num = 2 }},
                        {{ Enemy = "WaveMaker" }},
                        {{ Enemy = "WaveMaker", Num = 2 }, { Enemy = "ArmoredSkullomat" }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "SwiftFlourish", ForcedRarity = "Epic" },
                        { Name = "GreatestReflex" },
                        { Name = "QuickRecovery" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "RushDelivery" },
                        { Name = "SwiftFlourish" },
                        { Name = "GreaterEvasion" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat06", Reward = "CharonsObol" },
                    { RoomName = "B_Combat06", Reward = "CentaurHeart" },
                },
            },
        },
        [18] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredDracon", Num = 2 }},
                        {{ Enemy = "ArmoredDracon" }},
                        {{ Enemy = "ArmoredDracon", Num = 2 }, { Enemy = "ArmoredSkullomat" }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Shop01" },
                    { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [19] = { -- Aspho Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Artemis" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_MiniBoss01" },
                },
            },
        },
        [20] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ThunderFlourish", Replace = true },
                        { Name = "LightningReflexes", ForcedRarity = "Epic" },
                        { Name = "StaticDischarge", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat04", Reward = "PomOfPower" },
                },
            },
        },
        [21] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredSlamDancer", Num = 3 }},
                        {{ Enemy = "ArmoredSlamDancer" }, { Enemy = "Bloodless", Num = 8 }},
                    },
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
                        { Name = "DivineFlourish" },
                        { Name = "TidalDash" },
                        { Name = "StaticDischarge" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Story01" },
                    { EligibleRooms = RCLib.StandardCombats },
                    { Reward = "FatedKey", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [23] = { -- Aspho Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Demeter" },
                    { Item = "Food" },
                    { Item = "CentaurHeart" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CrystalBeam" },
                        { Name = "SnowBurst" },
                        { Name = "RavenousWill" },
                    },
                },
            },
        },
        [24] = { -- Lernie
            lernieEncounter = {
                Data = {
                    MainHead = "LavaLernie",
                    SideHeads = { "OrangeLernieHead", "BlueLernieHead" },
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
                        { Item = "EyeOfLamia" },
                        { Item = "BraidOfAtlas" },
                        { Item = "StygianShard" },
                    },
                },
            },
        },
        [26] = { -- Ely Intro
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat09", Reward = "DaedalusHammer" },
                    { RoomName = "C_Combat09", Reward = "CharonsObol" },
                },
            },
        },
        [27] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Flamewheel", Num = 6 }},
                        {{ Enemy = "Flamewheel" }, { Enemy = "Chariot" }},
                        {{ Enemy = "Flamewheel", Num = 5 }, { Enemy = "SoulCatcher", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "ExtendingJab" },
                    { Name = "BreachingSkewer" },
                    { Name = "ViciousSkewer" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat13", Reward = "CentaurHeart" },
                    { RoomName = "C_Combat13", Reward = "PomOfPower" },
                },
            },
        },
        [28] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Chariot", Num = 3 }},
                        {{ Enemy = "Chariot", Num = 2 }, { Enemy = "SoulCatcher" }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "LightningStrike" },
                        { Name = "TidalDash" },
                        { Name = "StaticDischarge" },
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
        [29] = {
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss01", Reward = "Boon", GodName = "Zeus" },
                    { RoomName = "C_Shop01" },
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
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ElectricShot" },
                        { Name = "CloudedJudgment" },
                        { Name = "HeavensVengeance" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "BillowingStrength" },
                        { Name = "LightningReflexes" },
                        { Name = "CloudedJudgment" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", GodName = "Demeter", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "C_MiniBoss02", Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [31] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ElectricShot", ForcedRarity = "Rare" },
                        { Name = "StormLightning", ForcedRarity = "Epic" },
                        { Name = "CloudedJudgment", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat14", Reward = "CharonsObol" },
                    { RoomName = "C_Combat14", Reward = "CentaurHeart" },
                },
            },
        },
        [32] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Splitter", Num = 5 }},
                        {{ Enemy = "Chariot" }, { Enemy = "Splitter", Num = 2 }},
                        {{ Enemy = "Splitter", Num = 4 }, { Enemy = "ArmoredBrightsword", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                },
            },
            shop = {
                [1] = {
                    Data = {
                        { Item = "EyeOfLamia" },
                        { Item = "GaeasTreasure" },
                        { Item = "AetherNet" },
                    },
                },
                [2] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "NightSpindle" },
                        { Item = "NemesisCrest" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat04", Reward = "Trial", FirstGodName = "Poseidon", SecondGodName = "Demeter" },
                    { RoomName = "C_Combat04", Reward = "PomOfPower" },
                },
            },
        },
        [33] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Longspear", Num = 6 }},
                        {{ Enemy = "Longspear", Num = 3 }, { Enemy = "Splitter", Num = 5 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    ChaosGate = { Force = true, RoomName = "RoomSecret02" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "LightningStrike" },
                        { Name = "TidalDash" },
                        { Name = "StormLightning" },
                    },
                },
            },
        },
        [34] = {
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Maimed",
                            BlessingName = "Flourish",
                            CurseLength = 4,
                            CurseValue = 4,
                            BlessingValue = 1.6,
                        },
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Ambush",
                            CurseLength = 3,
                            CurseValue = 4.83,
                            BlessingValue = 1.74,
                        },
                        {
                            CurseName = "Roiling",
                            BlessingName = "Eclipse",
                            CurseLength = 4,
                            CurseValue = 1.34,
                            BlessingValue = 1.75,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "PomOfPower" },
                    [3] = { Reward = "Boon", GodName = "Demeter" },
                },
            },
        },
        [35] = { -- Ely Preboss
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "LightningStrike" },
                        { Name = "DivineFlourish" },
                        { Name = "StormLightning" },
                    },
                },
            },
        },
        [36] = { -- Heroes
            theseusEncounter = {
                Data = {
                    God = "Ares",
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
                        { Item = "KissOfStyx" },
                        { Item = "StygianShard" },
                        { Item = "CyclopsJerky" },
                    },
                },
            },
        },
        [38] = { -- Styx Intro
            roomFeatures = {
                Data = {
                    GoldPotNum = 2,
                },
            },
        },
        [39] = { -- Styx Hub (First entry)
            shop = {
                Data = {
                    { Item = "CentaurHeart" },
                    { Item = "PomOfPower" },
                    { Item = "TitansBlood" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "Hermes", Overrides = RCLib.StyxHermes },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "SwiftFlourish", ForcedRarity = "Epic" },
                        { Name = "GreaterHaste", ForcedRarity = "Rare" },
                        { Name = "QuickRecovery", ForcedRarity = "Epic" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "GreaterHaste", ForcedRarity = "Rare" },
                        { Name = "QuickRecovery", ForcedRarity = "Rare" },
                        { Name = "SecondWind", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini04", Reward = "CharonsObol" },
                    { RoomName = "D_Mini04", Reward = "CentaurHeart" },
                    { RoomName = "D_Mini04", Reward = "Boon", GodName = "Demeter" },
                    { RoomName = "D_Mini04", Reward = "PomOfPower", IsMinibossWing = true },
                    { RoomName = "D_Mini04", Reward = "Boon", GodName = "Athena", IsMinibossWing = true },
                },
            },
        },
        [40] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 2 }, { Enemy = "Satyr" }},
                    },
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
                    { RoomName = "D_Mini06" },
                },
            },
        },
        [42] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Snakestone" }, { Enemy = "Bother", Num = 2 }},
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
                    { RoomName = "D_Mini12" },
                },
            },
        },
        [43] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 2 }},
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
                    { RoomName = "D_MiniBoss02" },
                },
            },
        },
        [44] = { -- Anthony
            roomFeatures = {
                Data = {
                    Flipped = false,
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DivineDash", Replace = true },
                        { Name = "BlindingFlash", ForcedRarity = "Epic" },
                        { Name = "HolyShield", ForcedRarity = "Rare" },
                    },
                },
            },
        },
        [45] = { -- Styx Hub (Second entry)
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini02" },
                    { RoomName = "D_Mini02" },
                    { RoomName = "D_Mini02" },
                    { RoomName = "D_Mini02" },
                },
            },
        },
        [46] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother" }, { Enemy = "Satyr" }},
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
                    { RoomName = "D_Mini11" },
                },
            },
        },
        [47] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 3 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    SellWell = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini07" },
                },
            },
        },
        [48] = {
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
                        { Name = "TidalDash" },
                        { Name = "BlindingFlash" },
                        { Name = "StormLightning" },
                    },
                },
            },
        },
    },
}

RunControl.Runs.Croven516Hera = {
    Metadata = {
        Name = "5:16.87 Hera by Croven",
        Description = "The former Any Heat world record, played on the 3rd of January, 2022."
        .. " It returned Croven to the top spot after a mere 5 days,"
        .. " and would go on to stand for an absolutely staggering 15 months, until finally being dethroned the following April by DrkFrst.",
        OriginalTime = "05:16.87",
        OriginalHeat = 9,
        CreatedFor = "1.0.0",
        Tags = { Aspect = "Hera", Weapon = "Bow", Category = "Unmodded Any Heat" },
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
                        {{ Enemy = "Pest", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "ConcentratedVolley" },
                    { Name = "FlurryShot" },
                    { Name = "TwinShot" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat08A", Reward = "FatedKey" },
                },
            },
        },
        [2] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Thug" }},
                        {{ Enemy = "Thug" }},
                        {{ Enemy = "Thug" }, { Enemy = "Skullomat" }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat15", Reward = "CharonsObol" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 2 }},
                        {{ Enemy = "Lout" }, { Enemy = "Witch", Num = 2 }},
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
                    [2] = { RoomName = "A_Combat07", Reward = "Boon" },
                    [3] = { RoomName = "A_Combat07", Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 2 }},
                        {{ Enemy = "Brimstone" }},
                        {{ Enemy = "Brimstone", Num = 2 }, { Enemy = "Skullomat", Num = 2 }},
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
                        { Name = "HeartbreakStrike" },
                        { Name = "CrushShot", ForcedRarity = "Epic" },
                        { Name = "PassionDash", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat12", Reward = "CharonsObol" },
                },
            },
        },
        [5] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredWitch", Num = 3 }},
                        {{ Enemy = "ArmoredWitch", Num = 2 }, { Enemy = "Lout" }},
                    },
                },
            },
            shop = {
                Data = {
                    { Item = "HydraLite" },
                    { Item = "FatefulTwist", Contents = "CyclopsJerky" },
                    { Item = "LightOfIxion" }
                }
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                    Well = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Shop01" },
                    { Reward = "CentaurHeart", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [6] = { -- Tart Midshop
            shop = {
                Data = {
                    { Item = "RandomBag", Contents = "Demeter" },
                    { Item = "Darkness" },
                    { Item = "CentaurHeart" },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 2,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FrostFlourish", ForcedRarity = "Epic" },
                        { Name = "MistralDash" },
                        { Name = "FrozenTouch", ForcedRarity = "Epic" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "FrostStrike", ForcedRarity = "Epic" },
                        { Name = "DemetersAid", ForcedRarity = "Epic" },
                        { Name = "RavenousWill" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_MiniBoss04", Reward = "Boon", GodName = "Demeter" }
                },
            },
        },
        [7] = {
            roomFeatures = {
                Data = {
                    ChaosGate = { RoomName = "RoomSecret02" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FrostFlourish", ForcedRarity = "Rare" },
                        { Name = "DemetersAid", ForcedRarity = "Epic" },
                        { Name = "RavenousWill", ForcedRarity = "Rare" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "MistralDash", ForcedRarity = "Epic" },
                        { Name = "SnowBurst", ForcedRarity = "Rare" },
                        { Name = "NourishedSoul", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "PitchBlackDarkness" },
                },
            },
        },
        [8] = {
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Slippery",
                            BlessingName = "Flourish",
                            CurseLength = 3,
                            CurseValue = 10.5,
                            BlessingValue = 1.44,
                        },
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Shot",
                            CurseLength = 4,
                            CurseValue = 3.85,
                            BlessingValue = 1.39,
                        },
                        {
                            CurseName = "Caustic",
                            BlessingName = "Eclipse",
                            CurseLength = 3,
                            BlessingValue = 1.64,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat02", Reward = "BrilliantGemstones" },
                    { RoomName = "A_Combat02", Reward = "PitchBlackDarkness" },
                    { RoomName = "A_Combat02", Reward = "VintageNectar" },
                },
            },
        },
        [9] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredThug" }, { Enemy = "Lout", Num = 3 }, { Enemy = "Brimstone", Num = 6 }},
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
                    { RoomName = "A_Reprieve01", Reward = "FatedKey" },
                },
            },
        },
        [10] = {
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat20", Reward = "PomOfPower" },
                    { RoomName = "A_Combat20", Reward = "Trial", FirstGodName = "Demeter", SecondGodName = "Aphrodite" },
                },
            },
        },
        [11] = {
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
                        { Name = "FrostStrike" },
                        { Name = "CrushShot" },
                        { Name = "SnowBurst" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "A_Story01" },
                },
            },
        },
        [13] = { -- Tart Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Zeus" },
                    { Item = "ChthonicKey" },
                    { Item = "PomOfPower" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FrostStrike" },
                        { Name = "CrushShot" },
                        { Name = "SnowBurst" },
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
                        { Item = "TroveTracker" },
                        { Item = "IgnitedIchor" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "CrushShot", Value = 205 },
                        { Name = "FrostStrike", Value = 175 },
                        { Name = "SnowBurst", Value = 70 },
                    },
                },
            },
        },
        [16] = { -- Aspho Intro
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat05", Reward = "Hermes" },
                    { Reward = "CharonsObol" },
                },
            },
        },
        [17] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "SkullCrusher" }},
                        {{ Enemy = "SkullCrusher" }, { Enemy = "InfernoBomber", Num =2 }},
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
                        { Name = "QuickReload", ForcedRarity = "Epic" },
                        { Name = "GreatestReflex", ForcedRarity = "Rare" },
                        { Name = "SwiftStrike" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", GodName = "Artemis", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "B_Story01" },
                },
            },
        },
        [18] = {
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat07", Reward = "PomOfPower" },
                },
            },
        },
        [19] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredBloodless", Num = 5 }},
                        {{ Enemy = "ArmoredBloodless", Num = 2 }, { Enemy = "Gorgon", Num = 5 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
        
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FrostStrike" },
                        { Name = "CrushShot" },
                        { Name = "SnowBurst" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Shop01" },
                    { Reward = "Boon", GodName = "Dionysus", ForcedRooms = { "B_MiniBoss02", "B_Wrapping01"} },
                },
            },
        },
        [20] = {
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "BrilliantGemstones" },
                    { Item = "PomSlice" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_MiniBoss01", Reward = "Boon", GodName = "Ares" },
                },
            },
        },
        [21] = {
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret01" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfPain", ForcedRarity = "Rare" },
                        { Name = "BladeDash", ForcedRarity = "Rare" },
                        { Name = "BloodFrenzy", ForcedRarity = "Epic" },
                    },
                },
            },
        },
        [22] = {
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Roiling",
                            BlessingName = "Shot",
                            CurseLength = 4,
                            CurseValue = 1.32,
                            BlessingValue = 1.7,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Halting",
                            BlessingName = "Lunge",
                            CurseLength = 3,
                            CurseValue = .76,
                            BlessingValue = 1.86,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Paupers",
                            BlessingName = "Affluence",
                            CurseLength = 4,
                            BlessingValue = 1.35,
                        },
                    },
                },
                [2] = {
                    Data = {
                        {
                            CurseName = "Roiling",
                            BlessingName = "Affluence",
                            CurseLength = 4,
                            CurseValue = 1.75,
                            BlessingValue = 1.6,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Flayed",
                            BlessingName = "Assault",
                            CurseLength = 3,
                            CurseValue = 4,
                            BlessingValue = 1.45,
                        },
                        {
                            CurseName = "Halting",
                            BlessingName = "Eclipse",
                            CurseLength = 3,
                            CurseValue = .5,
                            BlessingValue = 1.63,
                        },
                    },
                },
                [3] = {
                    Data = {
                        {
                            CurseName = "Slippery",
                            BlessingName = "Grasp",
                            CurseLength = 3,
                            CurseValue = 12.25,
                            ForcedRarity = "Rare",
                        },
                        {
                            CurseName = "Addled",
                            BlessingName = "Assault",
                            CurseLength = 4,
                            CurseValue = 3,
                            BlessingValue = 1.48,
                        },
                        {
                            CurseName = "Caustic",
                            BlessingName = "Shot",
                            CurseLength = 3,
                            BlessingValue = 1.35,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "Hermes" },
                },
            },
        },
        [23] = { -- Aspho Preboss
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "HyperSprint" },
                        { Name = "GreatestReflex", ForcedRarity = "Rare" },
                        { Name = "SwiftFlourish", ForcedRarity = "Epic" },
                    },
                },
            },
        },
        [24] = { -- Lernie
            lernieEncounter = {
                Data = {
                    MainHead = "PinkLernie",
                    SideHeads = { "BlueLernieHead", "LavaLernieHead" },
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
                        { Item = "KissOfStyx" },
                        { Item = "ChimaeraJerky" },
                        { Item = "CyclopsJerky" },
                    },
                },
                [2] = {
                    Data = {
                        { Item = "HydraLite" },
                        { Item = "GaeasTreasure" },
                        { Item = "ErisBangle" },
                    },
                },
            },
            sellWell = {
                Data = {
                    { Name = "BladeDash", Value = 85 },
                    { Name = "QuickReload", Value = 160 },
                    { Name = "SnowBurst", Value = 120 },
                },
            },
        },
        [26] = { -- Ely Intro
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat09", Reward = "DaedalusHammer" },
                    { RoomName = "C_Combat09", Reward = "CentaurHeart" },
                },
            },
        },
        [27] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Chariot", Num = 2 }},
                        {{ Enemy = "Chariot" }},
                        {{ Enemy = "Chariot", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "ChargedVolley" },
                    { Name = "PointBlankShot" },
                    { Name = "TwinShot" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat02", Reward = "PomOfPower" },
                    { RoomName = "C_Combat02", Reward = "CharonsObol" },
                },
            },
        },
        [28] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Chariot", Num = 3 }},
                        {{ Enemy = "Longspear" }, { Enemy = "Chariot", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FrostStrike" },
                        { Name = "CrushShot" },
                        { Name = "SnowBurst" },
                    },
                },
            },
            shop = {
                [1] = {
                    Data = {
                        { Item = "KissOfStyx" },
                        { Item = "LightOfIxion" },
                        { Item = "CyclopsJerky" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Shop01" },
                    { Reward = "Trial", FirstGodName = "Ares", SecondGodName = "Demeter", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [29] = {
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Dionysus" },
                    { Item = "Darkness" },
                    { Item = "PomOfPower" },
                }
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FrostStrike" },
                        { Name = "CrushShot" },
                        { Name = "SnowBurst" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss01", Reward = "Boon", GodName = "Dionysus" },
                    { RoomName = "C_MiniBoss02", Reward = "Boon", GodName = "Ares" },
                },
            },
        },
        [30] = {
            roomFeatures = {
                Data = {
                    ChaosGate = { RoomName = "RoomSecret02" },
                    ErebusGate = { Force = true },
                    GoldPotNum = 2,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfPain", ForcedRarity = "Epic" },
                        { Name = "BladeDash", ForcedRarity = "Epic" },
                        { Name = "BloodFrenzy", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [1] = { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                    [3] = { Reward = "CharonsObol" },
                },
            },
        },
        [31] = {
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Caustic",
                            BlessingName = "Soul",
                            CurseLength = 3,
                            BlessingValue = 38,
                        },
                        {
                            CurseName = "Maimed",
                            BlessingName = "Favor",
                            CurseLength = 3,
                            CurseValue = 3,
                            BlessingValue = .17,
                        },
                        {
                            CurseName = "Addled",
                            BlessingName = "Eclipse",
                            CurseLength = 3,
                            CurseValue = 5,
                            BlessingValue = 1.65,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat01", Reward = "BrilliantGemstones" },
                    { RoomName = "C_Combat01", Reward = "PitchBlackDarkness" },
                    { RoomName = "C_Combat01", Reward = "FatedKey" },
                },
            },
        },
        [32] = {
            encounter = {
                Data = {
                    Name = "ThanatosElysium",
                    Waves = {
                        {{ Enemy = "Splitter", Num = 9 }},
                        {{ Enemy = "ArmoredStrongbow" }, { Enemy = "Splitter", Num = 3 }},
                        {{ Enemy = "Splitter", Num = 4 }, { Enemy = "ArmoredVoidstone", Num = 2 }},
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
                    { RoomName = "C_Reprieve01", Reward = "CentaurHeart" },
                },
            },
        },
        [33] = {
            exitDoors = {
                Data = {
                    { RoomName = "C_Story01" },
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats }
                },
            },
        },
        [34] = {
            exitDoors = {
                Data = {
                    [2] = { Reward = "Boon", GodName = "Artemis" },
                },
            },
        },
        [35] = { -- Ely Preboss
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                }
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeadlyFlourish" },
                        { Name = "HunterDash" },
                        { Name = "ExitWounds" },
                    },
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
                        { Item = "NightSpindle" },
                        { Item = "BraidOfAtlas" },
                    },
                },
                [2] = {
                    Data = {
                        { Item = "HydraLite" },
                        { Item = "BraidOfAtlas" },
                        { Item = "CyclopsJerky" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "HyperSprint", Value = 40 },
                        { Name = "QuickReload", Value = 150 },
                        { Name = "FrostStrike", Value = 205 },
                    },
                },
            },
        },
        [38] = { -- Styx Intro
            roomFeatures = {
                Data = {
                    GoldPotNum = 3,
                },
            },
        },
        [39] = { -- Styx Hub (First entry)
            shop = {
                Data = {
                    { Item = "CentaurHeart" },
                    { Item = "PomOfPower" },
                    { Item = "Diamond" },
                    { Item = "UpgradedBoon", GodName = "Ares" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "AnvilOfFates" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini13", Reward = "PomOfPower" },
                    { RoomName = "D_Mini13", Reward = "CentaurHeart" },
                    { RoomName = "D_Mini13", Reward = "Boon", GodName = "Demeter", IsMinibossWing = true },
                    { RoomName = "D_Mini13", Reward = "Boon", GodName = "Ares", IsMinibossWing = true },
                    { RoomName = "D_Mini13", Reward = "CharonsObol" },
                },
            },
        },
        [40] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 3 }}
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
                    { RoomName = "D_Mini14" },
                },
            },
        },
        [41] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 2 }, { Enemy = "Bother" }}
                    },
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
                        {{ Enemy = "Snakestone", Num = 3 }}
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
                    { RoomName = "D_Mini10" },
                },
            },
        },
        [43] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat" }, { Enemy = "TinyRat", Num = 9 }}
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
                    { RoomName = "D_MiniBoss04" },
                },
            },
        },
        [44] = {
            boonMenu = {
                Data = {
                    { Name = "FrostFlourish", ForcedRarity = "Epic" },
                    { Name = "KillingFreeze", ForcedRarity = "Rare" },
                    { Name = "RareCrop", ForcedRarity = "Rare" },
                },
            },
        },
        [45] = { -- Styx Hub (Second entry)
            exitDoors = { -- Styx Hub (Second entry)
                Data = {
                    { RoomName = "D_Mini09" },
                    { RoomName = "D_Mini09" },
                    { RoomName = "D_Mini09" },
                    { RoomName = "D_Mini09" },
                },
            },
        },
        [46] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredSnakestone" }}
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
                        {{ Enemy = "Rat" }, { Enemy = "Snakestone" }}
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
                    { RoomName = "D_Mini04" },
                },
            },
        },
        [48] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 3 }}
                    },
                },
            },
            shop = {
                [1] = {
                    Data = {
                        { Item = "HydraLite" },
                        { Item = "NightSpindle" },
                        { Item = "TingeOfErebus" },
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini06" },
                },
            },
        },
        [49] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Satyr" }, { Enemy = "Snakestone", Num = 2 }}
                    },
                },
            },
            roomFeatures = {
                Data = {
                    SellWell = { Force = true },
                    GoldPotNum = 2,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Reprieve01" },
                },
            },
        },
        [50] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 2,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfPain", ForcedRarity = "Rare" },
                        { Name = "UrgeToKill" },
                        { Name = "CurseOfVengeance", ForcedRarity = "Rare" },
                    },
                },
            },
        },
    },
}

RunControl.Runs.Croven532Beowulf = {
    Metadata = {
        Name = "5:32.11 Beowulf by Croven",
        Description = "There's a pretty good chance this won't count if the game was newer and more"
        .. " people were paying attention atm. Your lag slowed down the timer and game,"
        .. " giving you more time to input commands. On a run like Beowulf, this is an unbelievable advantage."
        .. "\\n\\n ...Anyway, it remained the world record for 4 months, until it was beaten by ocaml in December of 2021.",
        OriginalTime = "05:32.11",
        OriginalHeat = 9,
        CreatedFor = "1.0.0",
        Tags = { Aspect = "Beowulf", Weapon = "Shield", Category = "Unmodded Any Heat" },
    },
    IndexedBy = { "chamberNum", "dataType", "rerollNum" },
    List = {
        [1] = {
            startingReward = { Data = { Reward = "Boon" } },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "TempestStrike" },
                        { Name = "TempestFlourish", ForcedRarity = "Rare" },
                        { Name = "TidalDash" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "TempestStrike", ForcedRarity = "Epic" },
                        { Name = "TempestFlourish" },
                        { Name = "PoseidonsAid" },
                    },
                },
                [3] = {
                    Data = {
                        { Name = "TempestFlourish" },
                        { Name = "FloodShot" },
                        { Name = "SunkenTreasure" },
                    },
                },
            },
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Witch", Num = 2 }},
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
                    { Reward = "BrilliantGemstones", RoomName = "A_Combat12" },
                },
            },
        },
        [2] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Witch", Num = 6 }},
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
                    { Reward = "DaedalusHammer", RoomName = "A_Combat16" },
                    { Reward = "CentaurHeart", RoomName = "A_Combat16" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 2 }},
                        {{ Enemy = "Brimstone" }},
                        {{ Enemy = "Brimstone", Num = 2 }, { Enemy = "Wringer" }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "DreadFlight" },
                    { Name = "ChargedShot" },
                    { Name = "UnyieldingDefense" },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CharonsObol", RoomName = "A_Combat07" },
                    { Reward = "PomOfPower", RoomName = "A_Combat07" },
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Thug", Num = 3 }},
                        {{ Enemy = "Thug", Num = 2 }, { Enemy = "Witch", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret03" },
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "CentaurHeart", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [5] = {
            encounter = {
                Data = {
                    Waves = {
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Excruciating",
                            BlessingName = "Flourish",
                            CurseValue = 1.3,
                            BlessingValue = 1.38,
                            CurseLength = 4,
                        },
                        {
                            CurseName = "Atrophic",
                            BlessingName = "Affluence",
                            CurseValue = -26,
                            BlessingValue = 1.3,
                            CurseLength = 3,
                        },
                        {
                            CurseName = "Addled",
                            BlessingName = "Assault",
                            CurseValue = 4,
                            BlessingValue = 1.48,
                            CurseLength = 4,
                        },
                    },
                },
                [2] = {
                    Data = {
                        {
                            CurseName = "Paupers",
                            BlessingName = "Eclipse",
                            BlessingValue = 1.64,
                            CurseLength = 3,
                        },
                        {
                            CurseName = "Slothful",
                            BlessingName = "Grasp",
                            CurseValue = 0.42,
                            CurseLength = 3,
                        },
                        {
                            CurseName = "Addled",
                            BlessingName = "Favor",
                            CurseValue = 4,
                            BlessingValue = .18,
                            CurseLength = 3,
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
                    { RoomName = "A_Combat08A", Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [6] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredBrimstone", Num = 2 }},
                        {{ Enemy = "ArmoredBrimstone", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "LightningStrike" },
                        { Name = "ThunderFlourish" },
                        { Name = "ThunderDash", ForcedRarity = "Rare" },
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    Well = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat05", Reward = "PitchBlackDarkness" }
                },
            },
        },
        [7] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredLout", Num = 3 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Shop01" },
                    { Reward = "Boon", GodName = "Artemis", ForcedRooms = { "A_MiniBoss01", "A_MiniBoss04" } },
                },
            },
        },
        [8] = { -- Tart Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "Food" },
                    { Item = "CentaurHeart" },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", GodName = "Zeus", RoomName = "A_MiniBoss03" },
                },
            },
        },
        [9] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "LightningStrike", ForcedRarity = "Rare" },
                        { Name = "ThunderFlourish", ForcedRarity = "Rare" },
                        { Name = "SeaStorm", ForcedRarity = "Legendary" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", GodName = "Athena", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "A_Story01" },
                },
            },
        },
        [10] = {
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat13", Reward = "FatedKey" },
                },
            },
        },
        [11] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 3 }},
                        {{ Enemy = "Lout" }, { Enemy = "ArmoredBrimstone" }},
                        {{ Enemy = "ArmoredNumbskull", Num = 4 }, { Enemy = "Lout", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                    Flipped = false,
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CharonsObol" },
                    { RoomName = "A_Combat19", Reward = "CentaurHeart" },
                },
            },
        },
        [12] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Thug", Num = 7 }},
                        {{ Enemy = "Thug", Num = 2 }, { Enemy = "ArmoredNumbskull", Num = 6 }}
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "PomOfPower" },
                },
            },
        },
        [13] = { -- Tart Endshop
            shop = {
                Data = {
                    { Item = "RandomBag", Contents = "Artemis" },
                    { Item = "Food" },
                    { Item = "CentaurHeart" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeadlyStrike" },
                        { Name = "DeadlyFlourish" },
                        { Name = "ArtemisAid" },
                    }
                }
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
                        { Item = "HydraLite" },
                        { Item = "TingeOfErebus" },
                        { Item = "YarnOfAriadne" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "ThunderDash", Value = 80 },
                        { Name = "SeaStorm", Value = 420 },
                        { Name = "FloodShot", Value = 65 },
                    },
                },
            },
        },
        [16] = { -- Aspho Intro
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat06", Reward = "Boon" },
                },
            },
        },
        [17] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "SkullCrusher" }},
                        {{ Enemy = "SkullCrusher" }, { Enemy = "Spreader", Num = 4 }}
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "HunterDash",  ForcedRarity = "Epic" },
                        { Name = "HuntersMark",  ForcedRarity = "Rare" },
                        { Name = "MirageShot",  ForcedRarity = "Legendary" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Story01" },
                    { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [18] = {
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat04", Reward = "Hermes" },
                },
            },
        },
        [19] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredWaveMaker" }},
                        {{ Enemy = "ArmoredWaveMaker" }},
                        {{ Enemy = "ArmoredWaveMaker" }, { Enemy = "ArmoredSpreader", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "GreaterEvasion", ForcedRarity = "Rare" },
                        { Name = "SideHustle" },
                        { Name = "QuickRecovery" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "GreaterHaste", ForcedRarity = "Rare" },
                        { Name = "HyperSprint" },
                        { Name = "QuickRecovery" },
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
                    { Reward = "Boon", GodName = "Demeter", ForcedRooms = { "B_Wrapping01", "B_MiniBoss02" } },
                    { EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "B_Shop01" },
                },
            },
        },
        [20] = { -- Aspho Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "Food" },
                    { Item = "PomSlice" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_MiniBoss01", Reward = "Boon", GodName = "Artemis" },
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
                        { Name = "DeadlyFlourish", ForcedRarity = "Epic" },
                        { Name = "HuntersMark", ForcedRarity = "Rare" },
                        { Name = "HideBreaker", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { EligibleRooms = RCLib.StandardCombats },
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
                            CurseName = "Addled",
                            BlessingName = "Soul",
                            CurseValue = 3,
                            BlessingValue = 37,
                            CurseLength = 3,
                        },
                        {
                            CurseName = "Atrophic",
                            BlessingName = "Lunge",
                            CurseValue = -34,
                            BlessingValue = 1.57,
                            CurseLength = 4,
                        },
                        {
                            CurseName = "Maimed",
                            BlessingName = "Affluence",
                            CurseValue = 5,
                            BlessingValue = 1.3,
                            CurseLength = 4,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "PomOfPower" },
                },
            },
        },
        [23] = { -- Aspho Preboss
            boonMenu = {
                Data = {
                    { Name = "DeadlyStrike" },
                    { Name = "FloodShot" },
                    { Name = "HuntersMark" },
                }
            }
        },
        [24] = { -- Lernie
            lernieEncounter = {
                Data = {
                    MainHead = "GreenLernie",
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
            shop = {
                [1] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "NightSpindle" },
                        { Item = "PrometheusStone" },
                    },
                },
            },
        },
        [26] = { -- Ely Intro
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat08", Reward = "CharonsObol" },
                    { RoomName = "C_Combat08", Reward = "DaedalusHammer" },
                },
            },
        },
        [27] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Longspear", Num = 3 }},
                        {{ Enemy = "Strongbow" }, { Enemy = "Longspear", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "FerociousGuard" },
                    { Name = "PulverizingBlow" },
                    { Name = "DashingWallop" },
                },
            },
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat06", Reward = "CharonsObol" },
                    { RoomName = "C_Combat06", Reward = "CentaurHeart" },
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
            exitDoors = {
                Data = {
                    { RoomName = "C_Shop01" },
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [29] = { -- Ely Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Aphrodite" },
                    { Item = "Darkness" },
                    { Item = "CentaurHeart" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss01", Reward = "Boon", GodName = "Zeus" },
                    { RoomName = "C_Reprieve01", Reward = "Boon", GodName = "Artemis" },
                },
            },
        },
        [30] = {
            boonMenu = {
                Data = {
                    { Name = "HunterDash" },
                    { Name = "ArtemisAid" },
                    { Name = "PressurePoints", ForcedRarity = "Epic" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss02", Reward = "Boon", GodName = "Zeus" },
                    { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [31] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ThunderDash", ForcedRarity = "Rare" },
                        { Name = "LightningReflexes", ForcedRarity = "Rare" },
                        { Name = "HeavensVengeance", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Story01" },
                    { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [32] = {
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat10", Reward = "Hermes" },
                    { RoomName = "C_Combat10", Reward = "CharonsObol" },
                },
            },
        },
        [33] = {
            encounter = {
                Data = {
                    Name = "ThanatosElysium",
                    Waves = {
                        {{ Enemy = "Splitter", Num = 9 }},
                        {{ Enemy = "ArmoredLongspear" }, { Enemy = "Splitter", Num = 3 }},
                        {{ Enemy = "Splitter", Num = 7 }, { Enemy = "ArmoredLongspear", Num = 4 }, },
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "GreatestReflex", ForcedRarity = "Rare" },
                        { Name = "QuickRecovery" },
                        { Name = "RushDelivery", ForcedRarity = "Epic" },
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
                    [2] = { EligibleRooms = RCLib.StandardCombats },
                    [3] = { EligibleRooms = RCLib.StandardCombats },
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
                            CurseName = "Paupers",
                            BlessingName = "Favor",
                            BlessingValue = .18,
                            CurseLength = 4,
                        },
                        {
                            CurseName = "Slothful",
                            BlessingName = "Affluence",
                            CurseValue = .44,
                            BlessingValue = 1.3,
                            CurseLength = 4,
                        },
                        {
                            CurseName = "Slippery",
                            BlessingName = "Assault",
                            CurseValue = 12.5,
                            BlessingValue = 1.43,
                            CurseLength = 3,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "CentaurHeart" },
                    [3] = { Reward = "Boon", GodName = "Ares" },
                },
            },
        },
        [35] = { -- Ely Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "Gemstones" },
                    { Item = "PomOfPower" },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "FloodShot" },
                    { Name = "ThunderDash" },
                    { Name = "HuntersMark" },
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
                        { Item = "NightSpindle" },
                        { Item = "PrometheusStone" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "HyperSprint" },
                        { Name = "DeadlyStrike" },
                        { Name = "FloodShot" },
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
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "CentaurHeart" },
                    { Item = "Diamond" },
                    { Item = "UpgradedBoon", GodName = "Demeter" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "Hermes", Overrides = RCLib.StyxHermes },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CharonsObol", RoomName = "D_Mini03", IsMinibossWing = true },
                    { Reward = "CentaurHeart", RoomName = "D_Mini03" },
                    { Reward = "PomOfPower", RoomName = "D_Mini03" },
                    { Reward = "Boon", GodName = "Zeus", RoomName = "D_Mini03", IsMinibossWing = true },
                    { Reward = "Boon", GodName = "Ares", RoomName = "D_Mini03" },
                },
            },
        },
        [40] = {
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
                    { RoomName = "D_Mini08" },
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
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini09" },
                },
            },
        },
        [42] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredSnakestone" }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_MiniBoss04" },
                },
            },
        },
        [43] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "LightningStrike", Replace = true },
                        { Name = "BillowingStrength", ForcedRarity = "Rare" },
                        { Name = "StaticDischarge", ForcedRarity = "Rare" },
                    },
                },
            },
        },
        [44] = { -- Styx Hub (Second entry)
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini08" },
                    { RoomName = "D_Mini08" },
                    { RoomName = "D_Mini08" },
                    { RoomName = "D_Mini08" },
                },
            },
        },
        [45] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat" }, { Enemy = "Snakestone", Num = 2 }}
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
                    { RoomName = "D_Mini01" },
                },
            },
        },
        [46] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 2}},
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
        [47] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 3}},
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
                    { RoomName = "D_Mini11" },
                },
            },
        },
        [48] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat" }, { Enemy = "Satyr" }},
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
                        { Item = "KissOfStyx" },
                        { Item = "TingeOfErebus" },
                        { Item = "CyclopsJerky" },
                    },
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

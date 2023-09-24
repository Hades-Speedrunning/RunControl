RunControl.Runs.SleepSoul607Talos = {
    Metadata = {
        Name = "6:07.44 Talos by SleepSoul",
        Description = "The former modded Talos aspect world record, played on the 22nd of March, 2022."
        .. " Dethroning my own 6:28, it was part of a long 4000-attempt grind,"
        .. " and remained the record until it was beaten by Ananke that June."
        .. "\\n\\n It was the first run I used to test this modpack, and thus is now notable for being the first ever rerun."
        .. "\\n On my first attempt, I improved it by 27 seconds, to a 5:40- not half bad."
        .. "\\n\\n - Sleep",
        OriginalTime = "06:07.44",
        CreatedFor = "1.0.0",
        Tags = { Aspect = "Talos", Weapon = "Fists", Category = "Modded Any Heat" },
    },
    IndexedBy = { "chamberNum", "dataType", "rerollNum" },
    List = {
        [1] = {
            startingReward = {
                Data = { Reward = "Boon" },
            },
            encounter = {
                Data = {
                    Name = "OpeningGenerated",
                    Waves = {
                        {{ Enemy = "Skullomat", Num = 1 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret03" },
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "CurseOfAgony" },
                        { Name = "CurseOfPain", ForcedRarity = "Epic" },
                        { Name = "SlicingShot" },
                    },
                },
                [2] = { -- Menu 2 (first reroll)
                    Data = {
                        { Name = "CurseOfAgony", ForcedRarity = "Epic" },
                        { Name = "SlicingShot" },
                        { Name = "UrgeToKill" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "PitchBlackDarkness", EligibleRooms = RCLib.StandardCombats },
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
                            CurseName = "Addled",
                            BlessingName = "Affluence",
                            CurseLength = 3,
                            CurseValue = 3,
                            BlessingValue = 1.7,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Flayed",
                            BlessingName = "Soul",
                            CurseLength = 3,
                            CurseValue = 5,
                            BlessingValue = 30,
                        },
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Assault",
                            CurseLength = 3,
                            CurseValue = 4.35,
                            BlessingValue = 1.65,
                            ForcedRarity = "Epic",
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat19", Reward = "VintageNectar" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 1 }, { Enemy = "Pest", Num = 4 }},
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
                    { RoomName = "RoomSimple01", Reward = "CentaurHeart" },
                    { RoomName = "RoomSimple01", Reward = "DaedalusHammer" },
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Thug", Num = 3 }},
                        {{ Enemy = "Thug", Num = 2 }, { Enemy = "Numbskull", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "BreachingCross"},
                    { EmptySlot = true },
                    { EmptySlot = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat12", Reward = "Boon", GodName = "Ares" },
                },
            },
        },
        [5] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredPest", Num = 4 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "CurseOfPain", ForcedRarity = "Epic" },
                        { Name = "SlicingShot", ForcedRarity = "Epic" },
                        { Name = "AresAid" },
                    }
                },
                [2] = { -- Menu 2 (first reroll)
                    Data = {
                        { Name = "SlicingShot" },
                        { Name = "DireMisfortune", ForcedRarity = "Epic" },
                        { Name = "CurseOfVengeance", ForcedRarity = "Epic" },
                    }
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
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "DivineDash" },
                        { Name = "BronzeSkin" },
                        { Name = "SureFooting" },
                    }
                },
            },
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Athena" },
                    { Item = "Food" },
                    { Item = "CentaurHeart" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat14", Reward = "CharonsObol" },
                },
            },
        },
        [7] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredBrimstone", Num = 5 }},
                    }
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_MiniBoss04", Reward = "Boon", GodName = "Zeus" }
                },
            },
        },
        [8] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ThunderFlourish", ForcedRarity = "Epic" },
                        { Name = "ElectricShot", ForcedRarity = "Rare" },
                        { Name = "ZeusAid", ForcedRarity = "Rare" },
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
                    { RoomName = "A_Combat03", Reward = "FatedKey" },
                },
            },
        },
        [10] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer", Num = 5 }, { Enemy = "Brimstone", Num = 6 }, { Enemy = "ArmoredWitch", Num = 1 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                    Trove = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat10", Reward = "PomOfPower" },
                    { RoomName = "A_Combat10", Reward = "CharonsObol" },
                },
            },
        },
        [11] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredWitch", Num = 5 }},
                        {{ Enemy = "ArmoredWitch", Num = 3 }, { Enemy = "Thug", Num = 2 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat18", Reward = "CentaurHeart" },
                    { RoomName = "A_Combat18", Reward = "PomOfPower" },
                },
            },
        },
        [12] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Thug", Num = 11 }, { Enemy = "ArmoredNumbskull", Num = 5 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfAgony" },
                        { Name = "ElectricShot" },
                        { Name = "DivineDash" },
                    },
                },
            },
        },
        [13] = { -- Tart Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Demeter" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            boonMenu = {
                IndexedBy = { "godName", "rerollNum" },
                List = {
                    Pom = {
                        [1] = {
                            Data = {
                                { Name = "CurseOfAgony" },
                                { Name = "ElectricShot" },
                                { Name = "DivineDash" },
                            },
                        },
                    },
                    Demeter = {
                        [1] = { -- Menu 1
                            Data = {
                                { Name = "FrostFlourish", ForcedRarity = "Epic" },
                                { Name = "FrozenTouch" },
                                { Name = "SnowBurst", ForcedRarity = "Epic" },
                            },
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Boss03", AlwaysEligible = true },
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
                        { Item = "EyeOfLamia" },
                        { Item = "LightOfIxion" },
                        { Item = "ChimaeraJerky" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "SnowBurst", Value = 140 },
                        { Name = "DireMisfortune", Value = 140 },
                        { Name = "ElectricShot", Value = 85 },
                    },
                },
            },
        },
        [16] = { -- Aspho Intro
            roomFeatures = {
                Data = {
                    ChaosGate = { RoomName = "RoomSecret02" },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Hermes", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [17] = {
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
                            CurseName = "Excruciating",
                            BlessingName = "Grasp",
                            CurseLength = 3,
                            CurseValue = 1.21,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Enshrouded",
                            BlessingName = "Flourish",
                            CurseLength = 5,
                            BlessingValue = 1.39,
                        },
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Affluence",
                            CurseLength = 3,
                            CurseValue = 3.02,
                            BlessingValue = 1.8,
                            ForcedRarity = "Epic"
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat07", Reward = "PomOfPower" },
                    { RoomName = "B_Combat07", Reward = "Hermes" },
                    { RoomName = "B_Combat07", Reward = "CharonsObol" },
                },
            },
        },
        [18] = {
            encounter = {
                Data = {
                    Name = "ThanatosAsphodel",
                    Waves = {
                        { { Enemy = "InfernoBomber", Num = 3 } },
                        { { Enemy = "InfernoBomber", Num = 1 }, { Enemy = "ArmoredSpreader", Num = 1 } },
                        { { Enemy = "ArmoredSpreader", Num = 2 }, { Enemy = "InfernoBomber", Num = 4 } },
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    FishingPoint = { Force = true },
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "QuickRecovery" },
                        { Name = "QuickReload" },
                        { Name = "GreatestReflex", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CentaurHeart", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "B_Shop01" },
                },
            },
        },
        [19] = { -- Aspho Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            boonMenu = {
                IndexedBy = { "godName", "rerollNum" },
                List = {
                    Pom = {
                        [1] = {
                            Data = {
                                { Name = "CurseOfAgony" },
                                { Name = "ElectricShot" },
                                { Name = "DivineDash" },
                            },
                        },
                    },
                    Ares = {
                        [1] = { -- Menu 1
                            Data = {
                                { Name = "CurseOfPain" },
                                { Name = "BloodFrenzy" },
                                { Name = "ImpendingDoom", ForcedRarity = "Rare" },
                            },
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_MiniBoss01", Reward = "Boon" },
                },
            },
        },
        [20] = {
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "DivineFlourish", ForcedRarity = "Rare" },
                        { Name = "BlindingFlash", ForcedRarity = "Epic" },
                        { Name = "BrilliantRiposte", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Story01" }
                },
            },
        },
        [21] = {
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat05", Reward = "FatedKey" },
                },
            },
        },
        [22] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "ArmoredBloodless", Num = 5 } },
                        { { Enemy = "ArmoredBloodless", Num = 4 }, { Enemy = "ArmoredSlamDancer", Num = 2 } },
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    Trove = { Force = true },
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "Boon", GodName = "Athena" },
                },
            },
        },
        [23] = { -- Aspho Preboss
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "BlindingFlash", ForcedRarity = "Epic" },
                        { Name = "BrilliantRiposte", ForcedRarity = "Epic" },
                        { Name = "MercifulEnd", ForcedRarity = "Legendary" },
                    },
                },
            },
        },
        [24] = { -- Lernie
            lernieEncounter = {
                Data = {
                    MainHead = "PinkLernie",
                    SideHeads = { "LavaLernieHead", "BlueLernieHead" },
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
                        { Item = "FatefulTwist", Contents = "CyclopsJerky" },
                        { Item = "NemesisCrest" },
                    },
                },
                [2] = {
                    Data = {
                        { Item = "KissOfStyx" },
                        { Item = "LightOfIxion" },
                        { Item = "CyclopsJerky" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "ElectricShot", Value = 70 },
                        { Name = "DivineFlourish", Value = 70 },
                        { Name = "DivineDash", Value = 45 },
                    },
                },
            },
        },
        [26] = { -- Ely Intro
            roomFeatures = {
                Data = {
                    ChaosGate = { RoomName = "RoomSecret03" },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                    { Reward = "DaedalusHammer", EligibleRooms = RCLib.StandardCombats },
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
                            CurseName = "Caustic",
                            BlessingName = "Affluence",
                            CurseLength = 4,
                            BlessingValue = 1.85,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Addled",
                            BlessingName = "Strike",
                            CurseLength = 3,
                            CurseValue = 3,
                            BlessingValue = 1.59,
                            ForcedRarity = "Rare",
                        },
                        {
                            CurseName = "Enshrouded",
                            BlessingName = "Flourish",
                            CurseLength = 4,
                            BlessingValue = 2.18,
                            ForcedRarity = "Epic",
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat13", Reward = "CentaurHeart" },
                },
            },
        },
        [28] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "Longspear", Num = 4 } },
                        { { Enemy = "Greatshield" }, { Enemy = "Longspear", Num = 3 } },
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                    Well = { Force = true },
                },
            },
            shop = {
                [1] = {
                    Data = {
                        { Item = "CentaurSoul" },
                        { Item = "SkeletalLure" },
                        { Item = "BraidOfAtlas" },
                    },
                },
                [2] = {
                    Data = {
                        { Item = "KissOfStyx" },
                        { Item = "NailOfTalos" },
                        { Item = "BraidOfAtlas" },
                    },
                },
            },
            boonMenu = {
                Data = {
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Trial", FirstGodName = "Demeter", SecondGodName = "Athena", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "C_Shop01" },
                },
            },
        },
        [29] = { -- Ely Midshop
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Zeus" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            boonMenu = {
                Data = {
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", GodName = "Demeter", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "C_MiniBoss02", Reward = "Boon", GodName = "Athena" }
                },
            },
        },
        [30] = {
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "BlindingFlash", ForcedRarity = "Rare" },
                        { Name = "LastStand", ForcedRarity = "Epic" },
                        { Name = "DeathlessStand", ForcedRarity = "Epic" },
                    },
                },
                [2] = { -- Menu 2
                    Data = {
                        { Name = "SureFooting", ForcedRarity = "Epic" },
                        { Name = "BlindingFlash", ForcedRarity = "Rare" },
                        { Name = "ProudBearing", ForcedRarity = "Epic" },
                    }
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat02", Reward = "CentaurHeart" },
                    { RoomName = "C_Combat02", Reward = "DaedalusHammer" },
                    { Reward = "CharonsObol" },
                },
            },
        },
        [31] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "ArmoredGreatshield", Num = 3 } },
                        { { Enemy = "ArmoredGreatshield", Num = 2 }, { Enemy = "ArmoredSplitter", Num = 1 } },
                    },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                Data = {
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Story01" },
                    { Reward = "Boon", GodName = "Athena", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [32] = {
            exitDoors = {
                Data = {
                    { Reward = "Hermes", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "C_Reprieve01", Reward = "DaedalusHammer" },
                },
            },
        },
        [33] = {
            boonMenu = {
                Data = {
                    { Name = "LongKnuckle" },
                    { Name = "ColossusKnuckle" },
                    { Name = "ConcentratedKnuckle" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat14", Reward = "PomOfPower" },
                    { RoomName = "C_Combat14", Reward = "Boon", GodName = "Ares" },
                },
            },
        },
        [34] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "Longspear", Num = 4 } },
                        { { Enemy = "Longspear", Num = 2 } },
                        { { Enemy = "Longspear", Num = 3 }, { Enemy = "SoulCatcher", Num = 2 }, { Enemy = "ArmoredSplitter", Num = 1 } },
                    },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                    Trove = { Force = true },
                    FishingPoint = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DivineFlourish" },
                        { Name = "ImpendingDoom" },
                        { Name = "ProudBearing" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "PomOfPower" },
                },
            },
        },
        [35] = { -- Ely Preboss
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "ElectricShot" },
                        { Name = "DivineDash" },
                        { Name = "ProudBearing" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "ElectricShot" },
                        { Name = "DivineDash" },
                        { Name = "ImpendingDoom" },
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
                        { Item = "LifeEssence" },
                        { Item = "GaeasTreasure" },
                        { Item = "TingeOfErebus" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "ElectricShot", Value = 75 },
                        { Name = "DivineDash", Value = 50 },
                        { Name = "CurseOfAgony", Value = 250 },
                    },
                },
            },
        },
        [39] = { -- Styx Hub (First entry)
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "CentaurHeart" },
                    { Item = "TitansBlood" },
                    { Item = "Boon", GodName = "Athena" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "Hermes", Overrides = RCLib.StyxHermes },
                },
            },
            roomFeatures = {
                Data = {
                    FishingPoint = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini09", Reward = "PomOfPower" },
                    { RoomName = "D_Mini09", Reward = "CharonsObol" },
                    { RoomName = "D_Mini09", Reward = "CentaurHeart", IsMinibossWing = true },
                    { RoomName = "D_Mini09", Reward = "Boon", GodName = "Ares", IsMinibossWing = true },
                    { RoomName = "D_Mini09", Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [40] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "ArmoredRat", Num = 1 } },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini06" },
                },
            },
        },
        [41] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "Rat", Num = 3 } },
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
        [42] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "TinyRat", Num = 18 } },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini13" },
                },
            },
        },
        [43] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "Snakestone", Num = 2 }, { Enemy = "Bother", Num = 1 } },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_MiniBoss02", AlwaysEligible = true },
                },
            },
        },
        [44] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
        },
        [45] = { -- Styx Hub (Second entry)
            roomFeatures = {
                Data = {
                    FishingPoint = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini11" },
                    { RoomName = "D_Mini11" },
                    { RoomName = "D_Mini11" },
                    { RoomName = "D_Mini11" },
                },
            },
        },
        [46] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "Rat", Num = 3 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini06" },
                },
            },
        },
        [47] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "Satyr", Num = 2 }},
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
        [48] = {
            encounter = {
                Data = {
                    Waves = {
                        { { Enemy = "Satyr", Num = 2 }},
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

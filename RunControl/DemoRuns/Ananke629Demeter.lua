RunControl.Runs.Ananke629Demeter = {
    Metadata = {
        Name = "6:29.39 Demeter by Ananke",
        Description = "This was the first Hades speedrun I ever watched."
        .. " The vod is soundtracked with top runners joking around, blowing off steam, getting excited for the 4th Hyper Delivery race."
        .. " I remember being blown away by Ananke's gameplay, but more than that, struck by how fun and relaxed this community seemed."
        .. " I joined the Hades Speedrunning Discord soon after, and was immediately welcomed with open arms, by the very same runners I'd seen showing off their skills a few days prior."
        .. "\\n\\n It's been over two years since then, and to this day I feel I've never belonged anywhere quite like I belong in Hades speedrunning."
        .. "\\n I'm very lucky to have friends like these."
        .. "\\n\\n - Sleep",
        OriginalTime = "06:29.39",
        OriginalHeat = 9,
        CreatedFor = "1.0.0",
        Tags = { Aspect = "Demeter", Weapon = "Fists", Category = "Unmodded Any Heat" },
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
                        {{ Enemy = "Lout" }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfAgony", ForcedRarity = "Epic" },
                        { Name = "CurseOfPain", ForcedRarity = "Rare" },
                        { Name = "SlicingShot", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat15", Reward = "PitchBlackDarkness" },
                },
            },
        },
        [2] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Numbskull", Num = 3 }},
                        {{ Enemy = "Numbskull" }, { Enemy = "Skullomat" }},
                        {{ Enemy = "Numbskull" }, { Enemy = "Lout" }},
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
                    { Reward = "Boon", GodName = "Aphrodite" },
                    { RoomName = "A_Combat12", Reward = "Boon", GodName = "Artemis" },
                    { RoomName = "A_Combat12", Reward = "CentaurHeart" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 2 }, { Enemy = "Numbskull", Num = 4 }},
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
                        { Name = "DeadlyStrike", Replace = true },
                        { Name = "DeadlyFlourish" },
                        { Name = "PressurePoints", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat10", Reward = "CharonsObol" },
                    { RoomName = "A_Combat10", Reward = "PomOfPower" },
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 2 }},
                        {{ Enemy = "Lout" }},
                        {{ Enemy = "Lout" }, { Enemy = "Thug", Num = 2 }},
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
                    { RoomName = "A_Combat19", Reward = "FatedKey", IsEliteRoom = true },
                    { RoomName = "A_Combat19", Reward = "PitchBlackDarkness" },
                },
            },
        },
        [5] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredLout" }, { Enemy = "ArmoredWitch", Num = 3 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Trial", FirstGodName = "Artemis", SecondGodName = "Ares", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "A_Shop01" },
                },
            },
        },
        [6] = { -- Tart Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Athena" },
                    { Item = "Food" },
                    { Item = "DaedalusHammer" },
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
                        { Name = "DivineFlourish" },
                        { Name = "PhalanxShot", ForcedRarity = "Epic" },
                        { Name = "AthenasAid", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_MiniBoss01", Reward = "Boon", GodName = "Poseidon" },
                },
            },
        },
        [7] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FloodShot", ForcedRarity = "Epic" },
                        { Name = "SunkenTreasure", ForcedRarity = "Rare" },
                        { Name = "HydraulicMight", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat02", Reward = "Boon", GodName = "Athena" },
                },
            },
        },
        [8] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer", Num = 5 }, { Enemy = "ArmoredWitch", Num = 3 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                    Well = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "PhalanxShot" },
                        { Name = "BlindingFlash", ForcedRarity = "Epic" },
                        { Name = "SureFooting" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "PhalanxShot", ForcedRarity = "Epic" },
                        { Name = "SureFooting" },
                        { Name = "BrilliantRiposte", ForcedRarity = "Epic" },
                    },
                },
                [3] = {
                    Data = {
                        { Name = "BlindingFlash" },
                        { Name = "LastStand", ForcedRarity = "Epic" },
                        { Name = "BrilliantRiposte" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat18", Reward = "PomOfPower" },
                },
            },
        },
        [9] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Thug", Num = 4 }},
                        {{ Enemy = "Thug" }, { Enemy = "Wringer" }},
                        {{ Enemy = "Lout" }, { Enemy = "Thug", Num = 3 }, { Enemy = "Pest", Num = 3 }},
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
                        { Name = "BlindingFlash" },
                        { Name = "HydraulicMight" },
                        { Name = "PressurePoints" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Story01" },
                },
            },
        },
        [10] = {
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat07", Reward = "PitchBlackDarkness" },
                },
            },
        },
        [11] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer", Num = 4 }},
                        {{ Enemy = "Wringer" }, { Enemy = "ArmoredNumbskull", Num = 2 }},
                        {{ Enemy = "Wringer", Num = 2 }, { Enemy = "ArmoredNumbskull", Num = 4 }, { Enemy = "Witch", Num = 5 }},
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
                    { RoomName = "A_Combat20", Reward = "CharonsObol" },
                },
            },
        },
        [12] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer", Num = 7 }},
                        {{ Enemy = "ArmoredBrimstone" }, { Enemy = "Wringer", Num = 5 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                    Well = { Force = true },
                    ErebusGate = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    [3] = { Reward = "DaedalusHammer" },
                },
            },
        },
        [13] = { -- Tart Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "Darkness" },
                    { Item = "PomOfPower" },
                },
            },
            boonMenu = {
                IndexedBy = { "godName", "rerollNum" },
                List = {
                    Ares = {
                        [1] = {
                            Data = {
                                { Name = "BladeDash", ForcedRarity = "Epic" },
                                { Name = "AresAid", ForcedRarity = "Epic" },
                                { Name = "MercifulEnd", ForcedRarity = "Legendary" },
                            },
                        },
                    },
                    Pom = {
                        [1] = {
                            Data = {
                                { Name = "BlindingFlash" },
                                { Name = "PressurePoints" },
                                { Name = "HydraulicMight" },
                            },
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Boss01", AlwaysEligible = true },
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
                        { Item = "ErisBangle" },
                        { Item = "BraidOfAtlas" },
                    },
                },
            },
            sellWell = {
                [1] = {
                    Data = {
                        { Name = "BlindingFlash", Value = 35 },
                        { Name = "HydraulicMight", Value = 85 },
                        { Name = "MercifulEnd", Value = 440 },
                    },
                },
            },
        },
        [16] = { -- Aspho Intro
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat01", Reward = "Hermes" },
                },
            },
        },
        [17] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "SlamDancer", Num = 2 }},
                        {{ Enemy = "SlamDancer" }},
                        {{ Enemy = "SlamDancer" }, { Enemy = "Bloodless", Num = 4 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "SwiftFlourish" },
                        { Name = "GreatestReflex", ForcedRarity = "Epic" },
                        { Name = "AutoReload" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat06", Reward = "CentaurHeart" },
                    { RoomName = "B_Combat06", Reward = "PomOfPower" },
                },
            },
        },
        [18] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "SlamDancer", Num = 4 }},
                        {{ Enemy = "SlamDancer" }, { Enemy = "Gorgon", Num = 5 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfAgony" },
                        { Name = "PressurePoints" },
                        { Name = "BlindingFlash" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Shop01" },
                    { Reward = "Hermes", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [19] = { -- Aspho Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Ares" },
                    { Item = "Darkness" },
                    { Item = "CentaurHeart" },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_MiniBoss02", Reward = "Boon" },
                },
            },
        },
        [20] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "PhalanxShot", ForcedRarity = "Epic" },
                        { Name = "BronzeSkin", ForcedRarity = "Epic" },
                        { Name = "BrilliantRiposte", ForcedRarity = "Epic" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "DivineDash", ForcedRarity = "Rare" },
                        { Name = "AthenasAid", ForcedRarity = "Epic" },
                        { Name = "SureFooting", ForcedRarity = "Epic" },
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
                    { RoomName = "B_Combat02", Reward = "BrilliantGemstones" },
                },
            },
        },
        [22] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredDracon", Num = 4 }},
                        {{ Enemy = "ArmoredDracon", Num = 2 }, { Enemy = "ArmoredSkullomat" }},
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
                    [2] = { Reward = "PomOfPower" },
                },
            },
        },
        [23] = { -- Aspho Preboss
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfAgony" },
                        { Name = "HydraulicMight" },
                        { Name = "PressurePoints" },
                    },
                },
            },
        },
        [24] = { -- Lernie
            lernieEncounter = {
                Data = {
                    MainHead = "BlueLernie",
                    SideHeads = { "LavaLernieHead", "PinkLernieHead" },
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
                        { Item = "BraidOfAtlas" },
                    },
                },
            },
        },
        [26] = { -- Ely Intro
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat12", Reward = "CharonsObol" },
                    { RoomName = "C_Combat12", Reward = "DaedalusHammer" },
                    { Reward = "PomOfPower" },
                },
            },
        },
        [27] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Splitter", Num = 5 }},
                        {{ Enemy = "Splitter", Num = 2 }, { Enemy = "Longspear", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "LongKnuckle" },
                    { Name = "ColossusKnuckle" },
                    { Name = "HeavyKnuckle" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat10", Reward = "CharonsObol" },
                    { RoomName = "C_Combat10", Reward = "Hermes" },
                },
            },
        },
        [28] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Chariot", Num = 2 }},
                        {{ Enemy = "Chariot" }},
                        {{ Enemy = "Chariot", Num = 2 }, { Enemy = "SoulCatcher" }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "C_Shop01" },
                },
            },
        },
        [29] = { -- Ely Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Athena" },
                    { Item = "Darkness" },
                    { Item = "PomSlice" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DivineStrike", Replace = true },
                        { Name = "DeathlessStand", ForcedRarity = "Epic" },
                        { Name = "LastStand", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss01", Reward = "Boon", GodName = "Poseidon" },
                    { RoomName = "C_Combat14", Reward = "DaedalusHammer" },
                },
            },
        },
        [30] = {
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
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                Data = {
                    { Name = "ColossusKnuckle" },
                    { Name = "HeavyKnuckle" },
                    { Name = "KineticLauncher" },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Trial", FirstGodName = "Artemis", SecondGodName = "Athena", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "C_MiniBoss02", Reward = "Boon", GodName = "Athena" },
                },
            },
        },
        [31] = {
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret03" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "PhalanxShot", ForcedRarity = "Rare" },
                        { Name = "BronzeSkin", ForcedRarity = "Epic" },
                        { Name = "SureFooting", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { EligibleRooms = RCLib.StandardCombats },
                    [3] = { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [32] = {
            boonMenu = {
                [1] = {
                    Data = {
                        {
                            CurseName = "Enshrouded",
                            BlessingName = "Assault",
                            CurseLength = 4,
                            BlessingValue = 1.47,
                        },
                        {
                            CurseName = "Addled",
                            BlessingName = "Grasp",
                            CurseLength = 3,
                            CurseValue = 3,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Maimed",
                            BlessingName = "Strike",
                            CurseLength = 3,
                            CurseValue = 3,
                            BlessingValue = 1.66,
                            ForcedRarity = "Epic",
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat13", Reward = "CharonsObol" },
                },
            },
        },
        [33] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredSplitter", Num = 2 }},
                        {{ Enemy = "ArmoredSplitter" }},
                        {{ Enemy = "ArmoredSplitter" }, { Enemy = "Flamewheel", Num = 10 }, { Enemy = "Strongbow", Num = 2 }},
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
                        { Name = "", ForcedRarity = "" },
                        { Name = "", ForcedRarity = "" },
                        { Name = "", ForcedRarity = "" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat04", Reward = "CentaurHeart" },
                    { RoomName = "C_Combat04", Reward = "Boon", GodName = "Ares" },
                },
            },
        },
        [34] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Longspear", Num = 4 }},
                        {{ Enemy = "Longspear", Num = 2 }},
                        {{ Enemy = "Longspear", Num = 2 }, { Enemy = "ArmoredGreatshield", Num = 2 }, { Enemy = "Splitter", Num = 5 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    Well = { Force = true },
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "CurseOfVengeance" },
                        { Name = "UrgeToKill" },
                        { Name = "ImpendingDoom", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "CentaurHeart" },
                },
            },
        },
        [35] = { -- Ely Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Artemis" },
                    { Item = "Darkness" },
                    { Item = "PomOfPower" },
                },
            },
            boonMenu = {
                IndexedBy = { "godName", "rerollNum" },
                List = {
                    Artemis = {
                        [1] = {
                            Data = {
                                { Name = "HuntersMark" },
                                { Name = "HunterInstinct" },
                                { Name = "HideBreaker" },
                            },
                        },
                    },
                    Pom = {
                        [1] = {
                            Data = {
                                { Name = "CurseOfAgony" },
                                { Name = "ImpendingDoom" },
                                { Name = "BlindingFlash" },
                            },
                        },
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
                        { Item = "EyeOfLamia" },
                        { Item = "CyclopsJerky" },
                        { Item = "IgnitedIchor" },
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
                    { Item = "Boon", GodName = "Poseidon" },
                    { Item = "Diamond" },
                    { Item = "UpgradedBoon", GodName = "Artemis" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "Hermes", Overrides = RCLib.StyxHermes },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini03", Reward = "PomOfPower", IsMinibossWing = true },
                    { RoomName = "D_Mini03", Reward = "Boon", GodName = "Ares" },
                    { RoomName = "D_Mini03", Reward = "CharonsObol", IsMinibossWing = true },
                    { RoomName = "D_Mini03", Reward = "Boon", GodName = "Poseidon" },
                    { RoomName = "D_Mini03", Reward = "Boon", GodName = "Artemis" },
                },
            },
        },
        [40] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 3 }},
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
        [41] = {
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
                    { RoomName = "D_Mini01" },
                },
            },
        },
        [42] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 2 }, { Enemy = "TinyRat", Num = 7 }},
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
                    { RoomName = "D_Mini12" },
                },
            },
        },
        [43] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 3 }},
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
                    { RoomName = "D_MiniBoss04", AlwaysEligible = true },
                },
            },
        },
        [44] = { -- Bother
            roomFeatures = {
                Data = {
                    GoldPotNum = 3,
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
                    { RoomName = "D_Mini07" },
                },
            },
        },
        [47] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 3 }},
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
        [48] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 2 }, { Enemy = "Snakestone" }},
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
                    { RoomName = "D_Reprieve01" },
                },
            },
        },
        [49] = { -- Styx Fountain
            roomFeatures = {
                Data = {
                    GoldPotNum = 2,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "HydraulicMight" },
                        { Name = "HuntersMark" },
                        { Name = "BlindingFlash" },
                    },
                },
            },
        },
    },
}

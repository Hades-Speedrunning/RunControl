RunControl.Runs.Lili557Eris = {
    Metadata = {
        Name = "5:57.03 Eris by Lili",
        Description = "The former Any Heat world record, played on the 10th of January, 2021."
        .. " It was the first sub-6 on the current patch, falling barely behind the previous patch's record of 5:56 (also by Lili)."
        .. " A hallmark of the post-launch Hades speedrunning scene, it remained the world record for 3 months,"
        .. " until being dethroned by Ananke that April.",
        OriginalTime = "05:57.03",
        OriginalHeat = 15,
        CreatedFor = "1.2.0",
        Tags = { Aspect = "Eris", Weapon = "Rail", Category = "Unmodded Any Heat" },
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
                        {{ Enemy = "Numbskull", Num = 4 }},
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
                        { Name = "LightningStrike", ForcedRarity = "Epic" },
                        { Name = "ThunderFlourish" },
                        { Name = "ThunderDash", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat10", Reward = "BrilliantGemstones" },
                },
            },
        },
        [2] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer", Num = 3 }},
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
                    { Reward = "CentaurHeart" },
                    { RoomName = "A_Combat09", Reward = "DaedalusHammer" },
                    { RoomName = "A_Combat09", Reward = "PomOfPower" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout" }},
                        {{ Enemy = "Lout" }},
                        {{ Enemy = "Lout" }, { Enemy = "Pest" }},
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
                    { Name = "SpreadFire" },
                    { Name = "PiercingFire" },
                    { Name = "ClusterBomb" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat02", Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 2 }},
                        {{ Enemy = "Lout", Num = 2 }},
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
                [1] = {
                    Data = {
                        { Name = "ThunderFlourish", ForcedRarity = "Rare" },
                        { Name = "ThunderDash" },
                        { Name = "StaticDischarge", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "RoomSimple01", Reward = "CharonsObol" },
                },
            },
        },
        [5] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Thug", Num = 4 }},
                        {{ Enemy = "Thug", Num = 2 }, { Enemy = "Wringer", Num = 2 }},
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
                    { RoomName = "A_Combat03", Reward = "CentaurHeart" },
                },
            },
        },
        [6] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredWitch", Num = 2 }, { Enemy = "Thug", Num = 4 }},
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
        [7] = {
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
                            BlessingName = "Eclipse",
                            CurseLength = 4,
                            BlessingValue = 1.3,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Atrophic",
                            BlessingName = "Favor",
                            CurseLength = 3,
                            CurseValue = -47,
                            BlessingValue = .15,
                        },
                        {
                            CurseName = "Slothful",
                            BlessingName = "Shot",
                            CurseLength = 3,
                            CurseValue = .42,
                            BlessingValue = 1.53,
                            ForcedRarity = "Rare",
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_MiniBoss03", GodName = "Artemis" },
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                    { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [8] = {
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "TrueShot", ForcedRarity = "Rare" },
                        { Name = "HunterDash", ForcedRarity = "Rare" },
                        { Name = "ArtemisAid", ForcedRarity = "Epic" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "DeadlyStrike", Replace = true },
                        { Name = "DeadlyFlourish", ForcedRarity = "Epic" },
                        { Name = "HunterDash", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat24", Reward = "FatedKey" },
                    { RoomName = "A_Combat24", Reward = "PitchBlackDarkness" },
                },
            },
        },
        [9] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 4 }, { Enemy = "ArmoredPest", Num = 3 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Shop01" },
                    { Reward = "VintageNectar", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [10] = {
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Athena" },
                    { Item = "Food" },
                    { Item = "Hermes" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "GreaterEvasion" },
                        { Name = "SideHustle" },
                        { Name = "HyperSprint" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat08B", Reward = "CharonsObol" },
                },
            },
        },
        [11] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredNumbskull", Num = 19 }},
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
                    { RoomName = "A_Story01" },
                },
            },
        },
        [13] = { -- Tart Endshop
            shop = {
                Data = {
                    { Item = "RandomBag", Contents = "Poseidon" },
                    { Item = "ChthonicKey" },
                    { Item = "PomOfPower" },
                },
            },
            roomFeatures = {
                Data = {
                    GoldPotNum = 1, 
                },
            },
            boonMenu = {
                IndexedBy = { "godName", "rerollNum" },
                List = {
                    Poseidon = {
                        [1] = {
                            Data = {
                                { Name = "TidalDash" },
                                { Name = "SunkenTreasure", ForcedRarity = "Epic"  },
                                { Name = "HydraulicMight", ForcedRarity = "Rare" },
                            },
                        },
                    },
                    Pom = {
                        [1] = {
                            Data = {
                                { Name = "LightningStrike" },
                                { Name = "DeadlyFlourish" },
                                { Name = "TidalDash" },
                            },
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Boss01" },
                },
            },
        },
        [14] = { -- Meg
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
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
        },
        [16] = { -- Aspho Intro
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat10", Reward = "CentaurHeart" },
                },
            },
        },
        [17] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bloodless", Num = 5 }},
                        {{ Enemy = "Bloodless" }, { Enemy = "ArmoredSkullomat" }},
                        {{ Enemy = "Spreader", Num = 3 }, { Enemy = "Bloodless", Num = 4 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Trove = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat07", Reward = "CentaurHeart" },
                    { RoomName = "B_Combat07", Reward = "Boon" },
                },
            },
        },
        [18] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredBurnFlinger", Num = 2 }},
                        {{ Enemy = "ArmoredBurnFlinger" }, { Enemy = "Spreader" }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FloodShot" },
                        { Name = "WavePounding", ForcedRarity = "Rare" },
                        { Name = "MirageShot", ForcedRarity = "Legendary" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "FloodShot", ForcedRarity = "Epic" },
                        { Name = "RazorShoals" },
                        { Name = "BreakingWave" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Story01" },
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [19] = {
            exitDoors = {
                Data = {
                    { RoomName = "B_MiniBoss02", GodName = "Athena" },
                },
            },
        },
        [20] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "" }},
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
                        { Name = "PhalanxShot", ForcedRarity = "Rare" },
                        { Name = "SureFooting", ForcedRarity = "Epic" },
                        { Name = "HolyShield", ForcedRarity = "Epic" },
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
                        {{ Enemy = "Dracon", Num = 5 }},
                        {{ Enemy = "Dracon", Num = 3 }, { Enemy = "SlamDancer", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    ErebusGate = { Force = true },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "DeadlyFlourish" },
                        { Name = "Tidal" },
                        { Name = "StaticDischarge" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat08", Reward = "Trial", FirstGodName = "Zeus", SecondGodName = "Athena" },
                    { RoomName = "B_Combat08", Reward = "PomOfPower" },
                    { RoomName = "B_Combat08", Reward = "Hermes" },
                    { Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [22] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "SkullCrusher" }},
                        {{ Enemy = "SkullCrusher" }, { Enemy = "ArmoredSlamDancer" }},
                        {{ Enemy = "SkullCrusher" }, { Enemy = "ArmoredSlamDancer", Num = 2 }, { Enemy = "ArmoredDracon", Num = 2 }},
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
                        { Name = "SwiftStrike", ForcedRarity = "Epic" },
                        { Name = "SwiftFlourish", ForcedRarity = "Epic" },
                        { Name = "RushDelivery", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { Reward = "CentaurHeart" },
                },
            },
        },
        [23] = {
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Poseidon" },
                    { Item = "Food" },
                    { Item = "CentaurHeart" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "WavePounding", ForcedRarity = "Epic" },
                        { Name = "RazorShoals", ForcedRarity = "Epic" },
                        { Name = "TyphoonsFury", ForcedRarity = "Rare" }, 
                    },
                },
                [2] = {
                    Data = {
                        { Name = "PoseidonsAid", ForcedRarity = "Epic" },
                        { Name = "TyphoonsFury", ForcedRarity = "Rare" }, 
                        { Name = "RazorShoals", ForcedRarity = "Epic" },
                    },
                },
            },
        },
        [24] = {
            lernieEncounter = {
                Data = {
                    MainHead = "PinkLernie",
                    SideHeads = { "LavaLernieHead", "OrangeLernieHead" },
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
                        { Item = "HydraLite" },
                        { Item = "NailOfTalos" },
                        { Item = "TroveTracker" },
                    },
                },
            },
        },
        [26] = { -- Ely Intro
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat05", Reward = "Boon", GodName = "Zeus" },
                    { RoomName = "C_Combat05", Reward = "DaedalusHammer" },
                },
            },
        },
        [27] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brightsword", Num = 3 }},
                        {{ Enemy = "Brightsword", Num = 2 }, { Enemy = "Greatshield" }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            boonMenu = {
                    Data = {
                        { Name = "RocketBomb" },
                        { Name = "SpreadFire" },
                        { Name = "DeltaChamber" },
                    },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat09", Reward = "CharonsObol" },
                    { RoomName = "C_Combat09", Reward = "PomOfPower" },
                },
            },
        },
        [28] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Strongbow", Num = 4 }},
                        {{ Enemy = "SoulCatcher" }, { Enemy = "Strongbow", Num = 2 }},
                    },
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
                        { Name = "DeadlyFlourish" },
                        { Name = "PhalanxShot" },
                        { Name = "TidalDash" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CentaurHeart", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "C_Shop01" },
                },
            },
        },
        [29] = { -- Ely Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Athena" },
                    { Item = "Food" },
                    { Item = "PomSlice" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "BlindingFlash" },
                        { Name = "SureFooting", ForcedRarity = "Rare" },
                        { Name = "ProudBearing" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss02", GodName = "Zeus" },
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [30] = {
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret02" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "BillowingStrength", ForcedRarity = "Epic" },
                        { Name = "CloudedJudgment", ForcedRarity = "Epic" },
                        { Name = "StormLightning", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "PomOfPower", EligibleRooms = RCLib.StandardCombats },
                    { EligibleRooms = RCLib.StandardCombats },
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
                            CurseName = "Halting",
                            BlessingName = "Soul",
                            CurseLength = 3,
                            CurseValue = .7,
                            BlessingValue = 37,
                        },
                        {
                            CurseName = "Maimed",
                            BlessingName = "Eclipse",
                            CurseLength = 3,
                            CurseValue = 3,
                            BlessingValue = 1.49,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Atrophic",
                            BlessingName = "Flourish",
                            CurseLength = 3,
                            CurseValue = -34,
                            BlessingValue = 2.01,
                            ForcedRarity = "Epic",
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Story01" },
                    { Reward = "BrilliantGemstones", EligibleRooms = RCLib.StandardCombats },
                    { Reward = "FatedKey", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [32] = {
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat14", Reward = "CentaurHeart" },
                    { RoomName = "C_Combat14", Reward = "CharonsObol" },
                },
            },
        },
        [33] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredGreatshield", Num = 3 }},
                        {{ Enemy = "ArmoredGreatshield", Num = 2 }, { Enemy = "Brightsword", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Well = { Force = true },
                    Trove = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Reprieve01", Reward = "PomOfPower" },
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [34] = {
            roomFeatures = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "PhalanxShot" },
                        { Name = "TidalDash" },
                        { Name = "BillowingStrength" },
                    },
                },
            },
            exitDoors = {
                [2] = { Reward = "PomOfPower" },
            },
        },
        [35] = { -- Ely Endshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Athena" },
                    { Item = "Food" },
                    { Item = "PomSlice" },
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
                        { Item = "HydraLite" },
                        { Item = "NemesisCrest" },
                        { Item = "BraidOfAtlas" },
                    },
                },
            },
        },
        [39] = { -- Styx Hub (First entry)
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Zeus" },
                    { Item = "CentaurHeart" },
                    { Item = "TitansBlood" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "AnvilOfFates" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini09", Reward = "CentaurHeart", IsMinibossWing = true },
                    { RoomName = "D_Mini09", Reward = "Boon", GodName = "Athena" },
                    { RoomName = "D_Mini09", Reward = "Boon", GodName = "Artemis", IsMinibossWing = true },
                    { RoomName = "D_Mini09", Reward = "CharonsObol" },
                    { RoomName = "D_Mini09", Reward = "PomOfPower" },
                },
            },
        },
        [40] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredRat" }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini07" },
                },
            },
        },
        [41] = {
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
                    { RoomName = "D_Mini04" },
                },
            },
        },
        [42] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Satyr" }, { Enemy = "Snakestone", Num = 2 }},
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
                    { RoomName = "D_MiniBoss01" },
                },
            },
        },
        [44] = { -- Mega-Satyr
            roomFeatures = {
                Data = {
                    Flipped = false,
                    GoldPotNum = 2,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "SupportFire", ForcedRarity = "Rare" },
                        { Name = "CleanKill", ForcedRarity = "Rare" },
                        { Name = "MirageShot", ForcedRarity = "Legendary" },
                    },
                },
            },
        },
        [45] = { -- Styx Hub (Second entry)
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini08" },
                    { RoomName = "D_Mini08" },
                    { RoomName = "D_Mini08" },
                    { RoomName = "D_Mini08" },
                },
            },
        },
        [46] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 3 }},
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
                    { RoomName = "D_Mini05" },
                },
            },
        },
        [47] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat" }, { Enemy = "Satyr" }},
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
                    Well = { Force = true },
                    GoldPotNum = 2,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini10" },
                },
            },
        },
        [49] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Bother", Num = 2 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Reprieve01" },
                },
            },
        },
        [50] = { -- Styx Fountain
            roomFeatures = {
                Data = {
                    GoldPotNum = 3,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "StaticDischarge" },
                        { Name = "ProudBearing" },
                        { Name = "BreakingWave" },
                    },
                },
            },
        }
    },
}

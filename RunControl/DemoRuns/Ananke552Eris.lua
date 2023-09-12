RunControl.Runs.Ananke552Eris = {
    Metadata = {
        Name = "5:52.33 Eris by Ananke",
        Description = "The former Any Heat world record, played on the 6th of April, 2021."
        .. " Only the second sub-6 on the current patch, dethroning long-time record holder Lili-"
        .. " a feat some thought impossible. One of the most beloved runs in the game's history,"
        .. " it remained the world record for 3 months, and remained the Eris world record for a further month.",
        OriginalTime = "5:52.33",
        CreatedFor = "1.0.0",
        Tags = { Aspect = "Eris", Weapon = "Rail", Category = "Unmodded Any Heat" },
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
                        {{ Enemy = "Lout", Num = 1 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ErebusGate = { Force = true },
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "LightningStrike", ForcedRarity = "Epic" },
                        { Name = "ThunderFlourish" },
                        { Name = "ThunderDash", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "CentaurHeart" },
                    { RoomName = "A_Combat10", Reward = "PomOfPower" },
                },
            },
        },
        [2] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Numbskull", Num = 3 }},
                        {{ Enemy = "Numbskull", Num = 2 }},
                        {{ Enemy = "Numbskull", Num = 3 }, { Enemy = "Lout", Num = 1 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    FishingPoint = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "RoomSimple01", Reward = "CentaurHeart" },
                    { RoomName = "RoomSimple01", Reward = "Boon", GodName = "Poseidon" },
                },
            },
        },
        [3] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 3 }},
                        {{ Enemy = "Brimstone", Num = 2 }, { Enemy = "Skullomat", Num = 1 }},
                    },
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "TempestFlourish" },
                        { Name = "TidalDash" },
                        { Name = "SunkenTreasure" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat01", Reward = "PitchBlackDarkness" },
                },
            },
        },
        [4] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer", Num = 5 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Reprieve01", Reward = "CharonsObol" },
                },
            },
        },
        [5] = {
            roomFeatures = {
                Data = {
                    Flipped = true,
                    GoldPotNum = 1,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Shop01" },
                    { RoomName = "A_Story01" },
                },
            },
        },
        [6] = {
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat24", Reward = "PomOfPower" },
                },
            },
        },
        [7] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Wringer", Num = 4 }},
                        {{ Enemy = "Wringer", Num = 1 }, { Enemy = "Pest", Num = 4 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    ChaosGate = { Force = true, RoomName = "RoomSecret01" },
                    Well = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { ForcedRooms = RCLib.Minibosses },
                    [3] = { EligibleRooms = RCLib.StandardCombats },
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
                        {
                            CurseName = "Slothful",
                            BlessingName = "Flourish",
                            CurseValue = 0.57,
                            BlessingValue = 1.38,
                            CurseLength = 4,
                        },
                        {
                            CurseName = "Caustic",
                            BlessingName = "Assault",
                            BlessingValue = 1.42,
                            CurseLength = 4,
                        },
                        {
                            CurseName = "Flayed",
                            BlessingName = "Affluence",
                            CurseValue = 3,
                            BlessingValue = 1.75,
                            CurseLength = 3,
                            ForcedRarity = "Epic",
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat17", Reward = "CharonsObol" },
                    { Reward = "Boon", GodName = "Ares", ForcedRooms = RCLib.Minibosses },
                },
            },
        },
        [9] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Lout", Num = 5 }, { Enemy = "Numbskull", Num = 11 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                    Trove = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { Reward = "Boon", GodName = "Demeter", ForcedRooms = RCLib.Minibosses },
                    { RoomName = "A_Combat14", Reward = "DaedalusHammer" },
                },
            },
        },
        [10] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "ArmoredLout", Num = 2 }},
                        {{ Enemy = "ArmoredLout", Num = 1 }},
                        {{ Enemy = "Witch", Num = 4 }, { Enemy = "Wringer", Num = 1 }, { Enemy = "ArmoredLout", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "SeekingFire" },
                    { Name = "RocketBomb" },
                    { Name = "HazardBomb" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "A_Combat08B", Reward = "VintageNectar" }
                },
            },
        },
        [11] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brimstone", Num = 8 }},
                        {{ Enemy = "Brimstone", Num = 5 }, { Enemy = "ArmoredPest", Num = 1 }},
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
                    { Reward = "CharonsObol" },
                    { RoomName = "A_Combat16", Reward = "PomOfPower" },
                },
            },
        },
        [12] = {
            roomFeatures = {
                Data = {
                    Flipped = true,
                },
            },
            encounter = {
                Data = {
                    Name = "ThanatosTartarus",
                    Waves = {
                        {{ Enemy = "Thug", Num = 10 }},
                        {{ Enemy = "Thug", Num = 1 }, { Enemy = "ArmoredBrimstone", Num = 2 }},
                        {{ Enemy = "ArmoredLout", Num = 2 }, { Enemy = "Thug", Num = 11 }},
                    },
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
                    { Item = "Boon", Name = "Demeter" },
                    { Item = "Food" },
                    { Item = "Hermes" },
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
                    Hermes = {
                        [1] = {
                            Data = {
                                { Name = "SideHustle" },
                                { Name = "SwiftStrike" },
                                { Name = "HyperSprint" },
                            },
                        },
                    },
                    Demeter = {
                        [1] = {
                            Data = {
                                { Name = "CrystalBeam" },
                                { Name = "RavenousWill" },
                                { Name = "SnowBurst", ForcedRarity = "Rare" },
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
        [14] = {-- Tisiphone
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
            shop = {
                [1] = {
                    Data = {
                        { Item = "HydraLite" },
                        { Item = "NightSpindle" },
                        { Item = "FatefulTwist", Contents = "HydraLite" },
                    },
                },
            },
        },
        [16] = {
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat10", Reward = "Hermes" },
                },
            },
        },
        [17] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Dracon", Num = 5 }},
                        {{ Enemy = "Dracon", Num = 2 }, { Enemy = "Spreader", Num = 3 }},
                    },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "GreatestReflex", ForcedRarity = "Epic" },
                        { Name = "QuickRecovery" },
                        { Name = "AutoReload" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat06", Reward = "Boon" },
                    { RoomName = "B_Combat06", Reward = "PomOfPower" },
                },
            },
        },
        [18] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "BurnFlinger", Num = 2 }},
                        {{ Enemy = "BurnFlinger", Num = 1 }},
                        {{ Enemy = "BurnFlinger", Num = 1 }, { Enemy = "BoneRaker", Num = 3 }},
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
                        { Name = "DeadlyFlourish", ForcedRarity = "Epic" },
                        { Name = "TrueShot", ForcedRarity = "Epic" },
                        { Name = "ArtemisAid", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Shop01" },
                    { Reward = "CharonsObol", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [19] = { -- Aspho Midshop
            shop = {
                Data = {
                    { Item = "Boon", Name = "Poseidon" },
                    { Item = "Darkness" },
                    { Item = "PomSlice" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FloodShot" },
                        { Name = "MirageShot", ForcedRarity = "Legendary" },
                        { Name = "HydraulicMight", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_MiniBoss01", Reward = "Boon", GodName = "Poseidon" }
                },
            },
        },
        [20] = {
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "FloodShot", ForcedRarity = "Rare" },
                        { Name = "PoseidonsAid", ForcedRarity = "Rare" },
                        { Name = "TyphoonsFury", ForcedRarity = "Rare" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Combat04", Reward = "CharonsObol" },
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
                    Flipped = true,
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "B_Story01" },
                    { Reward = "FatedKey", EligibleRooms = RCLib.StandardCombats },
                    { Reward = "BrilliantGemstones", IsEliteRoom = true },
                },
            },
        },
        [23] = { -- Aspho Endshop
            shop = {
                Data = {
                    { Item = "Boon", Name = "Poseidon" },
                    { Item = "Gemstones" },
                    { Item = "CentaurHeart" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "MirageShot", ForcedRarity = "Legendary" },
                        { Name = "TyphoonsFury" },
                        { Name = "WavePounding", ForcedRarity = "Rare" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "TyphoonsFury" },
                        { Name = "SeaStorm", ForcedRarity = "Legendary" },
                        { Name = "OceansBounty", ForcedRarity = "Epic" },
                    },
                },
            },
        },
        [24] = { -- Lernie
            lernieEncounter = {
                Data = {
                    MainHead = "GreenLernie",
                    -- SideHeads = { "LavaLernieHead", "BlueLernieHead" },
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
                        { Item = "GaeasTreasure" },
                        { Item = "SkeletalLure" },
                    },
                },
            },
        },
        [26] = {
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat08", Reward = "DaedalusHammer" },
                    { RoomName = "C_Combat08", Reward = "PomOfPower" },
                },
            },
        },
        [27] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Chariot", Num = 2 }},
                        {{ Enemy = "Chariot", Num = 1 }},
                        {{ Enemy = "Chariot", Num = 2 }},
                    },
                },
            },
            boonMenu = {
                Data = {
                    { Name = "ClusterBomb" },
                    { Name = "TargetingSystem" },
                    { Name = "SpreadFire" },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat04", Reward = "Boon", GodName = "Artemis" },
                    { RoomName = "C_Combat04", Reward = "Boon", GodName = "Zeus" },
                },
            },
        },
        [28] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Strongbow", Num = 4 }},
                        {{ Enemy = "Splitter", Num = 2 }, { Enemy = "Strongbow", Num = 2 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false,
                    ChaosGate = { Force = true, RoomName = "RoomSecret02" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "BillowingStrength" },
                        { Name = "StormLightning" },
                        { Name = "HeavensVengeance" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    [2] = { EligibleRooms = RCLib.StandardCombats },
                    [3] = { EligibleRooms = RCLib.StandardCombats },
                }
            },
        },
        [29] = {
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
                            BlessingName = "Shot",
                            CurseValue = 3,
                            BlessingValue = 1.72,
                            CurseLength = 4,
                            ForcedRarity = "Epic",
                        },
                        {
                            CurseName = "Excruciating",
                            BlessingName = "Soul",
                            CurseValue = 1.46,
                            BlessingValue = 32,
                            CurseLength = 4,
                        },
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Defiance",
                            CurseValue = 3.20,
                            CurseLength = 3,
                            ForcedRarity = "Legendary",
                            AlwaysEligible = true,
                        },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_MiniBoss01", Reward = "Boon", GodName = "Zeus" },
                    { Reward = "Boon", GodName = "Demeter", EligibleRooms = RCLib.StandardCombats },
                    { RoomName = "C_MiniBoss02", Reward = "Boon", GodName = "Poseidon" },
                },
            },
        },
        [30] = {
            roomFeatures = {
                Data = {
                    Flipped = false,
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "HeavensVengeance", ForcedRarity = "Rare" },
                        { Name = "LightningReflexes", ForcedRarity = "Epic" },
                        { Name = "StaticDischarge" },
                    },
                },
                [2] = {
                    Data = {
                        { Name = "HeavensVengeance", ForcedRarity = "Rare" },
                        { Name = "StaticDischarge", ForcedRarity = "Epic" },
                        { Name = "CloudedJudgment" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat09", Reward = "CharonsObol" },
                },
            },
        },
        [31] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Brightsword", Num = 4 }},
                        {{ Enemy = "Brightsword", Num = 2 }},
                        {{ Enemy = "Brightsword", Num = 6 }, { Enemy = "Chariot", Num = 1 }},
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
                        { Item = "LifeEssence" },
                        { Item = "FatefulTwist", Contents = "PrometheusStone" },
                        { Item = "ErisBangle" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Shop01" },
                    { Reward = "Trial", FirstGodName = "Demeter", SecondGodName = "Poseidon", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [32] = { -- Ely Midshop
            shop = {
                Data = {
                    { Item = "Boon", Name = "Poseidon" },
                    { Item = "Darkness" },
                    { Item = "CentaurHeart" },
                },
            },
            boonMenu = {
                [1] = {
                    Data = {
                        { Name = "SunkenTreasure", ForcedRarity = "Rare" },
                        { Name = "WavePounding" },
                        { Name = "BreakingWave", ForcedRarity = "Epic" },
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Combat05", Reward = "CharonsObol" },
                    { RoomName = "C_Combat05", Reward = "CentaurHeart" },
                },
            },
        },
        [33] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Strongbow", Num = 5 }},
                        {{ Enemy = "SoulCatcher", Num = 2 }, { Enemy = "Strongbow", Num = 3 }},
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = true,
                    Trove = { Force = true },
                    SellWell = { Force = true },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "C_Story01" },
                    { Reward = "CentaurHeart", EligibleRooms = RCLib.StandardCombats },
                },
            },
        },
        [34] = {
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
                        { Name = "LightningStrike" },
                        { Name = "DeadlyFlourish" },
                        { Name = "HydraulicMight" },
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
                        { Item = "NemesisCrest" },
                        { Item = "PrometheusStone" },
                    },
                },
                [2] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "BraidOfAtlas" },
                        { Item = "IgnitedIchor" },
                    },
                },
            },
        },
        [39] = { -- Styx Hub (First entry)
            shop = {
                Data = {
                    { Item = "Boon", Name = "Demeter" },
                    { Item = "CentaurHeart" },
                    { Item = "Diamond" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "Hermes", Overrides = { Cost = 500, UpgradeChance = 1.0, UpgradedCost = 500, ReplaceRequirements = { RequiredTextLines = {  "HermesFirstPickUp" }, } } },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_Mini05", Reward = "PomOfPower", IsMinibossWing = true },
                    { RoomName = "D_Mini05", Reward = "CentaurHeart", IsMinibossWing = true },
                    { RoomName = "D_Mini05", Reward = "Boon", GodName = "Zeus" },
                    { RoomName = "D_Mini05", Reward = "Boon", GodName = "Poseidon" },
                    { RoomName = "D_Mini05", Reward = "CharonsObol" },
                },
            },
        },
        [40] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Rat", Num = 1 }, { Enemy = "TinyRat", Num = 8 }},
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
                        {{ Enemy = "Rat", Num = 1 }, { Enemy = "Bother", Num = 2 }},
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
        [42] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Snakestone", Num = 1 }, { Enemy = "TinyRat", Num = 6 }},
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
                        {{ Enemy = "Bother", Num = 2 }},
                    },
                },
            },
            exitDoors = {
                Data = {
                    { RoomName = "D_MiniBoss03", AlwaysEligible = true },
                },
            },
        },
        [44] = {
            encounter = {
                Data = {
                    Name = "MiniBossHeavyRangedForked",
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
                        {{ Enemy = "Bother", Num = 2 }, { Enemy = "Snakestone", Num = 1 }},
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
        [47] = {
            encounter = {
                Data = {
                    Waves = {
                        {{ Enemy = "Snakestone", Num = 3 }},
                    },
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
                        {{ Enemy = "Rat", Num = 2 }},
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
                        { Name = "DeadlyFlourish" },
                        { Name = "BillowingStrength" },
                        { Name = "SnowBurst" },
                    },
                },
            },
        },
    },
}

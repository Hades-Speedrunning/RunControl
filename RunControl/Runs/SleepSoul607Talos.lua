--[[
Seed from the 6:07.44 Talos speedrun achieved on 2022-03-22 by SleepSoul in Any Heat (Unseeded, Modded)
Written for RunControl version 0.6.0. Work in progress
]]

RunControl.Runs.SleepSoul607Talos = {
    Boons = {
        IndexedBy = { "godName", "appearanceNum", "rerollNum" },
        List = {
            Ares = {
                [1] = { -- Chamber 1
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
                    }
                },
                [2] = { -- Chamber 5
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
                [3] = { -- Chamber 19
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "CurseOfPain" },
                            { Name = "BloodFrenzy" },
                            { Name = "ImpendingDoom", ForcedRarity = "Rare" },
                        },
                    },
                },
            },
            Athena = {
                [1] = { -- Chamber 6
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "DivineDash" },
                            { Name = "BronzeSkin" },
                            { Name = "SureFooting" },
                        }
                    },
                },
                [2] = { -- Chamber 20
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "DivineFlourish", ForcedRarity = "Rare" },
                            { Name = "BlindingFlash", ForcedRarity = "Epic" },
                            { Name = "BrilliantRiposte", ForcedRarity = "Rare" },
                        }
                    },
                },
                [3] = { -- Chamber 23
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "BlindingFlash", ForcedRarity = "Epic" },
                            { Name = "BrilliantRiposte", ForcedRarity = "Epic" },
                            { Name = "MercifulEnd", ForcedRarity = "Legendary" },
                        }
                    },
                },
                [4] = { -- Chamber 30
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
            },
            Demeter = {
                [1] = { -- Chamber 13
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "FrostFlourish", ForcedRarity = "Epic" },
                            { Name = "FrozenTouch" },
                            { Name = "SnowBurst", ForcedRarity = "Epic" },
                        }
                    },
                },
            },
            Zeus = {
                [1] = { -- Chamber 1
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "ThunderFlourish", ForcedRarity = "Epic" },
                            { Name = "ElectricShot", ForcedRarity = "Rare" },
                            { Name = "ZeusAid", ForcedRarity = "Rare" },
                        }
                    },
                },
            },
            Chaos = {
                [1] = { -- Chaos in Tart
                    [1] = {
                        Data = {
                            { CurseName = "Addled", BlessingName = "Affluence", ForcedRarity = "Epic" },
                            { CurseName = "Flayed", BlessingName = "Soul" },
                            { CurseName = "Abyssal", BlessingName = "Assault", ForcedRarity = "Epic" },
                        },
                    },
                },
                [2] = { -- Chaos in Aspho
                    [1] = {
                        Data = {
                            { CurseName = "Excruciating", BlessingName = "Grasp", ForcedRarity = "Epic" },
                            { CurseName = "Enshrouded", BlessingName = "Flourish" },
                            { CurseName = "Abyssal", BlessingName = "Affluence", ForcedRarity = "Epic" },
                        },
                    },
                },
                [3] = { -- Chaos in Ely
                    [1] = {
                        Data = {
                            { CurseName = "Caustic", BlessingName = "Affluence", ForcedRarity = "Epic" },
                            { CurseName = "Addled", BlessingName = "Strike", ForcedRarity = "Rare" },
                            { CurseName = "Enshrouded", BlessingName = "Flourish", ForcedRarity = "Epic" },
                        },
                    },
                },
            },
            Hermes = {
                [1] = { -- Chamber 18
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "QuickRecovery" },
                            { Name = "QuickReload" },
                            { Name = "GreatestReflex", ForcedRarity = "Epic" },
                        },
                    },
                },
            },
            Hammer = {
                [1] = { -- Chamber 4
                    Data = {
                        { Name = "BreachingCross"},
                    }
                },
                [2] = { -- Chamber 33
                    Data = {
                        { Name = "LongKnuckle" },
                        { Name = "ColossusKnuckle" },
                        { Name = "ConcentratedKnuckle" },
                    }
                }
            },
            Pom = {
                [1] = {
                    [1] = {
                        Data = {
                            { Name = "CurseOfAgony" },
                            { Name = "ElectricShot" },
                            { Name = "DivineDash" },
                        },
                    },
                },
                [2] = {
                    [1] = {
                        Data = {
                            { Name = "CurseOfAgony" },
                            { Name = "ElectricShot" },
                            { Name = "DivineDash" },
                        },
                    },
                },
                [3] = {
                    [1] = {
                        Data = {
                            { Name = "DivineFlourish" },
                            { Name = "ImpendingDoom" },
                            { Name = "ProudBearing" },
                        },
                    },
                },
                [4] = {
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
                [5] = {
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
    },
    Encounters = {
        IndexedBy = { "chamberNum" },
        List = {
            [1] = {
                Data = {
                    Name = "OpeningGenerated",
                    Waves = {
                        {{ Enemy = "Skullomat", Num = 1 }},
                    }
                }
            },
            [3] = {
                Data = {
                    Name = "GeneratedTartarus",
                    Waves = {
                        {{ Enemy = "Lout", Num = 1 }, { Enemy = "Pest", Num = 4 }},
                    }
                }
            },
            [4] = {
                Data = {
                    Name = "GeneratedTartarus",
                    Waves = {
                        {{ Enemy = "Thug", Num = 3 }},
                        {{ Enemy = "Thug", Num = 2 }, { Enemy = "Numbskull", Num = 2 }},
                    }
                }
            },
            [5] = {
                Data = {
                    Name = "GeneratedTartarus",
                    Waves = {
                        {{ Enemy = "ArmoredPest", Num = 4 }},
                    }
                }
            },
            [7] = {
                Data = {
                    Name = "GeneratedTartarus",
                    Waves = {
                        {{ Enemy = "ArmoredBrimstone", Num = 5 }},
                    }
                }
            },
            [10] = {
                Data = {
                    Name = "GeneratedTartarus",
                    Waves = {
                        {{ Enemy = "Wringer", Num = 5 }, { Enemy = "Brimstone", Num = 6 }, { Enemy = "ArmoredWitch", Num = 1 }},
                    }
                }
            },
            [11] = {
                Data = {
                    Name = "GeneratedTartarus",
                    Waves = {
                        {{ Enemy = "ArmoredWitch", Num = 5 }},
                        {{ Enemy = "ArmoredWitch", Num = 3 }, { Enemy = "Thug", Num = 2 }},
                    }
                }
            },
            [12] = {
                Data = {
                    Name = "GeneratedTartarus",
                    Waves = {
                        {{ Enemy = "Thug", Num = 11 }, { Enemy = "ArmoredNumbskull", Num = 5 }},
                    }
                }
            },
            [18] = {
                Data = {
                    Name = "ThanatosAsphodel",
                    Waves = {
                        { { Enemy = "InfernoBomber", Num = 3 } },
                        { { Enemy = "InfernoBomber", Num = 1 }, { Enemy = "ArmoredSpreader", Num = 1 } },
                        { { Enemy = "ArmoredSpreader", Num = 2 }, { Enemy = "InfernoBomber", Num = 4 } },
                    },
                },
            },
            [22] = {
                Data = {
                    Name = "GeneratedAsphodel",
                    Waves = {
                        { { Enemy = "ArmoredBloodless", Num = 5 } },
                        { { Enemy = "ArmoredBloodless", Num = 4 }, { Enemy = "ArmoredSlamDancer", Num = 2 } },
                    },
                },
            },
            [28] = {
                Data = {
                    Name = "GeneratedElysium",
                    Waves = {
                        { { Enemy = "Longspear", Num = 4 } },
                        { { Enemy = "Greatshield" }, { Enemy = "Longspear", Num = 3 } },
                    },
                },
            },
            [31] = {
                Data = {
                    Name = "GeneratedElysium",
                    Waves = {
                        { { Enemy = "ArmoredGreatshield", Num = 3 } },
                        { { Enemy = "ArmoredGreatshield", Num = 2 }, { Enemy = "ArmoredSplitter", Num = 1 } },
                    },
                },
            },
            [34] = {
                Data = {
                    Name = "GeneratedElysium",
                    Waves = {
                        { { Enemy = "Longspear", Num = 4 } },
                        { { Enemy = "Longspear", Num = 2 } },
                        { { Enemy = "Longspear", Num = 3 }, { Enemy = "SoulCatcher", Num = 2 }, { Enemy = "ArmoredSplitter", Num = 1 } },
                    },
                },
            },
            [40] = {
                Data = {
                    Name = "GeneratedStyxMini",
                    Waves = {
                        { { Enemy = "ArmoredRat", Num = 1 } },
                    },
                },
            },
            [41] = {
                Data = {
                    Name = "GeneratedStyxMini",
                    Waves = {
                        { { Enemy = "Rat", Num = 3 } },
                    },
                },
            },
            [42] = {
                Data = {
                    Name = "GeneratedStyxMini",
                    Waves = {
                        { { Enemy = "TinyRat", Num = 18 } },
                    },
                },
            },
            [43] = {
                Data = {
                    Name = "GeneratedStyxMini",
                    Waves = {
                        { { Enemy = "Snakestone", Num = 2 }, { Enemy = "Bother", Num = 1 } },
                    },
                },
            },
            [46] = {
                Data = {
                    Name = "GeneratedStyxMini",
                    Waves = {
                        { { Enemy = "Rat", Num = 3 }},
                    },
                },
            },
            [47] = {
                Data = {
                    Name = "GeneratedStyxMini",
                    Waves = {
                        { { Enemy = "Satyr", Num = 2 }},
                    },
                },
            },
            [48] = {
                Data = {
                    Name = "GeneratedStyxMini",
                    Waves = {
                        { { Enemy = "Satyr", Num = 2 }},
                    },
                },
            },
        },
    },
    Rewards = {
        IndexedBy = { "chamberNum" },
        List = {
            [1] = {
                Data = {
                    [2] = { Reward = "PitchBlackDarkness" },
                }
            },
            [2] = {
                Data = {
                    { Reward = "VintageNectar" },
                }
            },
            [3] = {
                Data = {
                    { Reward = "CentaurHeart" },
                    { Reward = "DaedalusHammer" },
                }
            },
            [4] = {
                Data = {
                    { Reward = "Boon", Name = "Ares" }
                }
            },
            [5] = {
                Data = {
                    { Reward = "PitchBlackDarkness" }
                }
            },
            [6] = {
                Data = {
                    { Reward = "CharonsObol" }
                }
            },
            [7] = {
                Data = {
                    { Reward = "Boon", Name = "Zeus" }
                }
            },
            [9] = {
                Data = {
                    { Reward = "FatedKey" }
                }
            },
            [10] = {
                Data = {
                    { Reward = "PomOfPower" },
                    { Reward = "CharonsObol" }
                }
            },
            [11] = {
                Data = {
                    { Reward = "CentaurHeart" },
                    { Reward = "PomOfPower" }
                }
            },
            [16] = {
                Data = {
                    [2] = { Reward = "Hermes" }
                },
            },
            [17] = {
                Data = {
                    { Reward = "PomOfPower" },
                    { Reward = "Hermes" },
                    { Reward = "CharonsObol" },
                },
            },
            [18] = {
                Data = {
                    { Reward = "CentaurHeart" },
                },
            },
            [19] = {
                Data = {
                    [2] = { Reward = "Boon", Name = "Athena" },
                },
            },
            [21] = {
                Data = {
                    { Reward = "FatedKey" },
                },
            },
            [22] = {
                Data = {
                    { Reward = "Boon", Name = "Athena" },
                },
            },
            [26] = {
                Data = {
                    [2] = { Reward = "DaedalusHammer" },
                    [3] = { Reward = "CharonsObol" },
                },
            },
            [27] = {
                Data = {
                    { Reward = "CentaurHeart" },
                },
            },
            [28] = {
                Data = {
                    { Reward = "Boon", Name = "Demeter" },
                },
            },
            [29] = {
                Data = {
                    { Reward = "Boon", Name = "Demeter" },
                    { Reward = "Boon", Name = "Athena" },
                },
            },
            [30] = {
                Data = {
                    { Reward = "CharonsObol" },
                    { Reward = "CentaurHeart" },
                    { Reward = "DaedalusHammer" },
                },
            },
            [31] = {
                Data = {
                    [2] = { Reward = "Boon", Name = "Athena" },
                },
            },
            [32] = {
                Data = {
                    { Reward = "Hermes" },
                    { Reward = "DaedalusHammer" },
                },
            },
            [33] = {
                Data = {
                    { Reward = "PomOfPower" },
                    { Reward = "Boon", Name = "Ares" },
                },
            },
            [34] = {
                Data = {
                    [2] = { Reward = "PomOfPower" },
                },
            },
            [39] = {
                Data = {
                    { Reward = "PomOfPower" },
                    { Reward = "CharonsObol" },
                    { Reward = "CentaurHeart" },
                    { Reward = "Boon", Name = "Ares" },
                    { Reward = "Boon", Name = "Zeus" },
                },
            },
        },
    },
    Rooms = {
        IndexedBy = { "chamberNum" },
        List = {
            [1] = {
                Data = {
                    Special = {
                        ChaosGate = { Force = true, RoomName = "RoomSecret03" },
                    },
                },
            },
            [2] = {
                Data = {
                    Flipped = false,
                    Doors = {
                        { RoomName = "A_Combat19" },
                    },
                    Special = {
                        Well = { Force = true }
                    }
                }
            },
            [3] = {
                Data = {
                    Flipped = true,
                    Doors = {
                        [2] = { RoomName = "RoomSimple01" },
                    },
                    Special = {
                        GoldPotNum = 1
                    },
                },
            },
            [4] = {
                Data = {
                    Doors = {
                        { RoomName = "A_Combat12" },
                    },
                }
            },
            [5] = {
                Data = {
                    Flipped = true,
                    Doors = {
                        [2] = { RoomName = "A_Shop01" },
                    },
                    Special = {
                        GoldPotNum = 1
                    },
                },
            },
            [6] = {
                Data = {
                    Doors = {
                        { RoomName = "A_Combat14" },
                    },
                }
            },
            [7] = {
                Data = {
                    Doors = {
                        { RoomName = "A_MiniBoss04" },
                    },
                }
            },
            [8] = {
                Data = {
                    Doors = {
                        { RoomName = "A_Story01" },
                    },
                }
            },
            [9] = {
                Data = {
                    Doors = {
                        { RoomName = "A_Combat03" },
                    },
                    Special = {
                        GoldPotNum = 1
                    },
                }
            },
            [10] = {
                Data = {
                    Doors = {
                        [2] = { RoomName = "A_Combat10" },
                    },
                    Special = {
                        ErebusGate = { Force = true },
                        Trove = { Force = true }
                    },
                }
            },
            [11] = {
                Data = {
                    Doors = {
                        [2] = { RoomName = "A_Combat18" },
                    },
                }
            },
            [13] = {
                Data = {
                    Doors = {
                        { RoomName = "A_Boss03" },
                    },
                }
            },
            [15] = {
                Data = {
                    Special = {
                        Well = { Force = true },
                        SellWell = { Force = true },
                    },
                }
            },
            [16] = {
                Data = {
                    Special = {
                        ChaosGate = { Force = true, RoomName = "RoomSecret02", Flipped = false }
                    },
                },
            },
            [17] = {
                Data = {
                    Flipped = false,
                    Doors = {
                        [2] = { RoomName = "B_Combat07" }
                    },
                    Special = {
                        GoldPotNum = 1
                    },
                },
            },
            [18] = {
                Data = {
                    Flipped = true,
                    Doors = {
                        [2] = { RoomName = "B_Shop01" }
                    },
                },
            },
            [19] = {
                Data = {
                    Doors = {
                        { RoomName = "B_MiniBoss01" }
                    },
                },
            },
            [20] = {
                Data = {
                    Doors = {
                        { RoomName = "B_Story01" }
                    },
                },
            },
            [21] = {
                Data = {
                    Doors = {
                        { RoomName = "B_Combat05" }
                    },
                },
            },
            [22] = {
                Data = {
                    Special = {
                        Well = { Force = true },
                        Trove = { Force = true },
                    },
                    GoldPotNum = 1,
                },
            },
            [25] = {
                Data = {
                    Special = {
                        Well = { Force = true },
                        SellWell = { Force = true },
                    },
                }
            },
            [26] = {
                Data = {
                    Special = {
                        ChaosGate = { Force = true, RoomName = "RoomSecret03" },
                    },
                }
            },
            [27] = {
                Data = {
                    Flipped = true,
                    Doors = {
                        { RoomName = "C_Combat13" }
                    },
                },
            },
            [28] = {
                Data = {
                    Flipped = false,
                    Doors = {
                        [2] = { RoomName = "C_Shop01" }
                    },
                    Special = {
                        Well = { Force = true },
                    },
                },
            },
            [29] = {
                Data = {
                    Doors = {
                        [2] = { RoomName = "C_MiniBoss02" }
                    },
                    GoldPotNum = 1,
                },
            },
            [30] = {
                Data = {
                    Doors = {
                        { RoomName = "C_Combat02" }
                    },
                    Special = {
                        ErebusGate = { Force = true },
                    },
                },
            },
            [31] = {
                Data = {
                    Doors = {
                        { RoomName = "C_Story01" }
                    },
                    GoldPotNum = 1,
                },
            },
            [32] = {
                Data = {
                    Doors = {
                        [2] = { RoomName = "C_Reprieve01" }
                    },
                },
            },
            [33] = {
                Data = {
                    Doors = {
                        { RoomName = "C_Combat14" }
                    },
                },
            },
            [34] = {
                Data = {
                    Special = {
                        Trove = { Force = true },
                    },
                    GoldPotNum = 1,
                },
            },
            [37] = {
                Data = {
                    Special = {
                        Well = { Force = true },
                        SellWell = { Force = true },
                    },
                },
            },
            [39] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "D_Mini09" },
                        [2] = { RoomName = "D_Mini09" },
                        [3] = {
                            RoomName = "D_Mini09",
                            IsMinibossWing = true,
                        },
                        [4] = {
                            RoomName = "D_Mini09",
                            IsMinibossWing = true,
                        },
                        [5] = { RoomName = "D_Mini09" },
                    },
                },
            },
            [40] = {
                Data = {
                    Doors = {
                        { RoomName = "D_Mini06" },
                    },
                },
            },
            [41] = {
                Data = {
                    Doors = {
                        { RoomName = "D_Mini11" },
                    },
                    GoldPotNum = 1,
                },
            },
            [42] = {
                Data = {
                    Doors = {
                        { RoomName = "D_Mini13" },
                    },
                },
            },
            [43] = {
                Data = {
                    Doors = {
                        { RoomName = "D_MiniBoss02" },
                    },
                },
            },
            [44] = {
                Data = {
                    GoldPotNum = 1,
                },
            },
            [45] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "D_Mini11" },
                        [2] = { RoomName = "D_Mini11" },
                        [3] = { RoomName = "D_Mini11" },
                        [4] = { RoomName = "D_Mini11" },
                    },
                },
            },
            [46] = {
                Data = {
                    Doors = {
                        { RoomName = "D_Mini06" },
                    },
                },
            },
            [47] = {
                Data = {
                    Doors = {
                        { RoomName = "D_Mini01" },
                    },
                    GoldPotNum = 1,
                },
            },
            [48] = {
                Data = {
                    Doors = {
                        { RoomName = "D_Reprieve01" },
                    },
                },
            },
            [49] = {
                Data = {
                    GoldPotNum = 1,
                },
            },
        },
    },
    Shops = {
        IndexedBy = { "chamberNum", "rerollNum" },
        List = {
            [6] = { -- Tart Midshop
                Data = {
                    { Item = "Boon", Name = "Athena" },
                    { Item = "Food" },
                    { Item = "CentaurHeart" },
                },
            },
            [13] = { -- Tart Endshop
                Data = {
                    { Item = "Boon", Name = "Demeter" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            [15] = { -- Pre-Aspho Midbiome
                [1] = {
                    Data = {
                        { Item = "EyeOfLamia" },
                        { Item = "LightOfIxion" },
                        { Item = "ChimaeraJerky" },
                    },
                },
            },
            [19] = { -- Aspho Midshop
                Data = {
                    { Item = "Boon", Name = "Ares" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            [25] = { -- Pre-Ely Midbiome
                [1] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "FatefulTwist" },
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
            [28] = { -- c28 Well
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
            [29] = { -- Ely Midshop
                Data = {
                    { Item = "Boon", Name = "Zeus" },
                    { Item = "Food" },
                    { Item = "PomOfPower" },
                },
            },
            [37] = { -- Pre-Styx Midbiome
                [1] = {
                    Data = {
                        { Item = "LifeEssence" },
                        { Item = "GaeasTreasure" },
                        { Item = "TingeOfErebus" },
                    },
                },
            },
            [39] = { -- Styx Shop
                Data = {
                    { Item = "Boon", Name = "Ares" },
                    { Item = "CentaurHeart" },
                    { Item = "TitansBlood" },
                    { Item = "Boon", Name = "Athena" },
                    { Item = "UpgradedPomOfPower" },
                    { Item = "Hermes", Overrides = { Cost = 500, UpgradeChance = 1.0, UpgradedCost = 500 }},
                },
            },
        },
    },
    SellWells = {
        IndexedBy = { "chamberNum", "rerollNum" },
        List = {
            [15] = { -- Pre-Aspho Midbiome
                [1] = {
                    { Name = "SnowBurst", Value = 140 },
                    { Name = "DireMisfortune", Value = 140 },
                    { Name = "ElectricShot", Value = 85 },
                },
            },
            [25] = { -- Pre-Aspho Midbiome
                [1] = {
                    { Name = "ElectricShot", Value = 70 },
                    { Name = "DivineFlourish", Value = 70 },
                    { Name = "DivineDash", Value = 45 },
                },
            },
            [37] = { -- Pre-Aspho Midbiome
                [1] = {
                    { Name = "ElectricShot", Value = 75 },
                    { Name = "DivineDash", Value = 50 },
                    { Name = "CurseOfAgony", Value = 250 },
                },
            },
        },
    },
}

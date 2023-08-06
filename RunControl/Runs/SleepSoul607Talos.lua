--[[
Seed from the 6:07.44 Talos speedrun achieved on 2022-03-22 by SleepSoul in Unseeded Modded
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
                [2] = { -- Chamber 23
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "BlindingFlash", ForcedRarity = "Epic" },
                            { Name = "BrilliantRiposte", ForcedRarity = "Epic" },
                            { Name = "MercifulEnd", ForcedRarity = "Legendary" },
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
                }
            },
            Pom = {
                [1] = {
                    [1] = {
                        Data = {
                            { Name = "CurseOfAgony" },
                            { Name = "ElectricShot" },
                            { Name = "DivineDash" },
                        }
                    }
                },
                [2] = {
                    [1] = {
                        Data = {
                            { Name = "CurseOfAgony" },
                            { Name = "ElectricShot" },
                            { Name = "DivineDash" },
                        }
                    }
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
                    [1] = { Reward = "Hermes" },
                    [2] = { Reward = "CharonsObol" },
                    [3] = { Reward = "PomOfPower" },
                },
            },
            [18] = {
                Data = {
                    [2] = { Reward = "CentaurHeart" },
                },
            },
            [19] = {
                Data = {
                    [2] = { Reward = "Boon", Name = "Athena" },
                },
            },
            [21] = {
                Data = {
                    [1] = { Reward = "FatedKey" },
                },
            },
            [22] = {
                Data = {
                    [1] = { Reward = "Boon", Name = "Athena" },
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
                        ChaosGate = { Force = true, RoomName = "RoomSecret03", Flipped = false }
                    },
                }
            },
            [2] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "A_Combat19" },
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
                }
            },
            [4] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "A_Combat12" },
                    },
                }
            },
            [5] = {
                Data = {
                    Flipped = true,
                    Doors = {
                        [2] = { RoomName = "A_Shop01" },
                    },
                }
            },
            [6] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "A_Combat14" },
                    },
                }
            },
            [7] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "A_MiniBoss04" },
                    },
                }
            },
            [8] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "A_Story01" },
                    },
                }
            },
            [9] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "A_Combat03" },
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
                        [1] = { RoomName = "A_Boss03" },
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
                        ChaosGate = { Force = true, RoomName = "RoomSecret01", Flipped = false }
                    },
                },
            },
            [17] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "B_Combat07", Flipped = false }
                    },
                },
            },
            [18] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "B_Shop01" }
                    },
                },
            },
            [19] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "B_Miniboss01" }
                    },
                },
            },
            [20] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "B_Story01" }
                    },
                },
            },
            [21] = {
                Data = {
                    Doors = {
                        [1] = { RoomName = "B_Combat05" }
                    },
                },
            },
            [22] = {
                Data = {
                    Special = {
                        Well = { Force = true },
                        Trove = { Force = true }
                    }
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
                [1] = {
                    Data = {
                        { Item = "Boon", Name = "Ares" },
                        { Item = "Food" },
                        { Item = "PomOfPower" },
                    },
                },
            },
        },
    },
}

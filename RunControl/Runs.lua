RunControl.Runs = {}

RunControl.Runs.SleepSoul607Talos = { -- WIP
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
                        }
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
            Hermes = {
                [1] = { -- Chamber 18
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "QuickRecovery" },
                            { Name = "QuickReload" },
                            { Name = "GreatestReflex", ForcedRarity = "Epic" },
                        }
                    },
                },
            },
            Hammer = {
                [1] = { -- Chamber 4
                    Data = {
                        { Name = "BreachingCross"},
                    }
                }
            }
        }
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
        }
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
        }
    },
    Rooms = {
        IndexedBy = { "chamberNum" },
        List = {
            [1] = {
                Data = {
                    Special = {
                        ChaosGate = { Force = true, RoomName = "RoomSecret03" }
                    },
                }
            },
            [2] = {
                Data = {
                    Flipped = false,
                    Doors = {
                        [1] = { RoomName = "A_Combat19" },
                    },
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
        }
    },
    Shops = {
        IndexedBy = { "roomName" },
        List = {
            A_Shop01 = {
                Data = {
                    { Reward = "Boon", Name = "Athena" },
                    { Reward = "Food" },
                    { Reward = "CentaurHeart" },
                }
            },
            A_PreBoss01 = {
                Data = {
                    { Reward = "Boon", Name = "Demeter" },
                    { Reward = "Food" },
                    { Reward = "PomOfPower" },
                }
            }
        }
    }
}

--[[TEMPLATES
    Boons = {
        IndexedBy = { "godName", "chamberNum", "rerollNum" },
        List = {
            God = {
                [1] = { -- Chamber 1
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "", ForcedRarity = "" },
                            { Name = "", ForcedRarity = "" },
                            { Name = "", ForcedRarity = "" },
                        },
                        NeededConditions = {}
                    },
                    [2] = { -- Menu 2 (first reroll)
                        { Name = "", ForcedRarity = "" },
                        { Name = "", ForcedRarity = "" },
                        { Name = "", ForcedRarity = "" },
                    },
                    [2] = { -- Menu 3 (second reroll)
                        { Name = "", ForcedRarity = "" },
                        { Name = "", ForcedRarity = "" },
                        { Name = "", ForcedRarity = "" },
                    },
                },
            },
        }
    }
]]

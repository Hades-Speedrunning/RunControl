RunControl.Runs = {}

RunControl.Runs.SleepSoul607Talos = { -- WIP
    Boons = {
        ListType = "Indexed",
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
    }
}

--[[TEMPLATES
    Boons = {
        ListType = "Indexed",
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

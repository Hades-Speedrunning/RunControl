--[[
Example run to show the syntax
Written for RunControl version 0.6.0
]]

RunControl.Runs.ExampleRun = {
    Boons = {
        IndexedBy = { "godName", "appearanceNum", "rerollNum" },
        List = {
            Artemis = {
                [1] = { -- First appearance of Artemis
                    [1] = { -- First menu (0 rerolls)
                        Data = {
                            { Name = "DeadlyStrike" },
                            { Name = "DeadlyFlourish" },
                            { Name = "ArtemisAid" },
                        },
                    },
                    [2] = { -- Second menu (first reroll)
                        Data = {
                            { Name = "DeadlyStrike", ForcedRarity = "Epic" },
                            { Name = "DeadlyFlourish" },
                            { Name = "PressurePoints" },
                        },
                    },
                },
            },
        },
    },
    Encounters = {
        IndexedBy = { "chamberNum" },
        List = {
            [1] = { -- Chamber 1
                Data = {
                    Name = "OpeningGenerated",
                    Waves = {
                        {{ Enemy = "Skullomat", Num = 1 }},
                    },
                },
            },
            [2] = { -- Chamber 2
                Data = {
                    Name = "GeneratedTartarus",
                    Waves = {
                        { -- Wave 1
                            { Enemy = "Skullomat", Num = 3 },
                            { Enemy = "Lout", Num = 3 },
                        },
                    },
                },
            },
        },
    },
    Rewards = {
        IndexedBy = { "chamberNum" },
        List = {
            [2] = { -- Chamber 2
                Data = {
                    [1] = { Reward = "Boon", Name = "Artemis" }, -- Door 1 in chamber 2
                },
            },
        },
    },
    Rooms = {
        IndexedBy = { "chamberNum" },
        List = {
            [1] = { -- Chamber 1
                Data = {
                    Special = {
                        ChaosGate = { Force = true, RoomName = "RoomSecret03" } -- Chaos gate in chamber 1
                    },
                },
            },
            [2] = { -- Chamber 2
                Data = {
                    Doors = {
                        [1] = { RoomName = "RoomSimple01" }, -- Door 1 in chamber 2
                    },
                },
            },
        },
    },
    Shops = {
        IndexedBy = { "roomName" },
        List = {
            A_Shop01 = { -- Tartarus Midshop
                Data = {
                    { Item = "Boon", Name = "Poseidon" },
                    { Item = "Food" },
                    { Item = "CentaurHeart" },
                },
            },
        },
    },
}

--[[
To start making a run, you can copy and paste this template.
Replace Template with the name of your run, then fill out the numbers and quotation marks with whatever you want forcing.

RunControl.Runs.Template = {
    Boons = {
        IndexedBy = { "godName", "appearanceNum", "rerollNum" },
        List = {
            God = {
                [1] = {
                    [1] = {
                        Data = {
                            { Name = "" },
                            { Name = "" },
                            { Name = "" },
                        },
                    },
                },
            },
        },
    },
    Encounters = {
        IndexedBy = { "chamberNum" },
        List = {
            [1] = { -- Chamber 1
                Data = {
                    Name = "",
                    Waves = {
                        {{ Enemy = "", Num = 0 }},
                    },
                },
            },
        },
    },
    Rewards = {
        IndexedBy = { "chamberNum" },
        List = {
            [2] = { -- Chamber 2
                Data = {
                    [1] = { Reward = "", Name = "" },
                },
            },
        },
    },
    Rooms = {
        IndexedBy = { "chamberNum" },
        List = {
            [1] = { -- Chamber 1
                Data = {
                    Doors = {
                        [1] = { RoomName = "" },
                    },
                    Special = {
                        ChaosGate = { Force = false, RoomName = "" }
                    },
                },
            },
        },
    },
    Shops = {
        IndexedBy = { "roomName" },
        List = {
            A_Shop01 = {
                Data = {
                    { Reward = "", Name = "" },
                    { Reward = "" },
                    { Reward = "" },
                },
            },
        },
    },
}]]

--[[ This is a commented example run, which you can use to understand the format. It won't appear in-game.]]


local ExampleRun = { -- To get this to show in-game, it would need to be RunControl.Runs.ExampleRun
    Metadata = {
        Name = "Example Run", -- The name that appears in the Select A Run menu
        Description = "This is a description!", -- The description that appears when the run is selected
        OriginalTime = "06:09.69", -- Displayed on the victory screen
        OriginalHeat = 9, -- Displayed on the victory screen
        CreatedFor = "1.0.0", -- If this is different than the version you're playing on, a warning will pop up
    },
    IndexedBy = { "chamberNum", "dataType", "rerollNum" },
    List = {
        [1] = { -- Chamber 1
            startingReward = {
                Data = { -- We don't need to specify a rerollNum for this
                    Reward = "Boon",
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "LightningStrike" }, -- Forces Common Lightning Strike
                        { Name = "BillowingStrength", ForcedRarity = "Epic", AlwaysEligible = true }, -- Forces Epic Billowing Strength, whether it is eligible or not
                        { Name = "DoubleStrike", EmptySlot = true }, -- Forces Common Double Strike, or an empty slot if it is ineligible
                    },
                },
                [2] = { -- Menu 2 (after one reroll)
                    Data = {
                        { Name = "LightningStrike", ForcedRarity = "Epic" }, -- Forces Epic Lightning Strike
                        -- The remaining two slots will be filled with random boons
                    },
                },
            },
            exitDoors = {
                Data = { -- Again, no rerollNum needed
                    { RoomName = "RoomSimple01", Reward = "Boon", GodName = "Poseidon" }, -- Forces the Chamber 1 exit to be 'Athena room' with a Poseidon boon
                },
            },
        },
        [2] = {
            encounter = {
                Data = {
                    -- This is a standard combat, so we don't need to specify a Name for the encounter
                    Waves = {
                        {{ Enemy = "ArmoredLout" }}, -- This will be a 1-wave room with a single Armored Lout
                    },
                },
            },
            roomFeatures = {
                Data = {
                    Flipped = false, -- Room will face to the right
                    GoldPotNum = 4, -- Forces 4 gold pots to appear
                    ChaosGate = { Force = true, RoomName = "RoomSecret02" }, -- Forces a Chaos to appear, as well as what room it is
                },
            },
            boonMenu = {
                [1] = { -- Menu 1
                    Data = {
                        { Name = "TidalDash", ForcedRarity = "Rare" },
                        { Name = "SeaStorm", ForcedRarity = "Legendary" }, -- This won't be eligible, so we'll get Rare Tidal Dash plus two random boons instead
                    },
                },
            },
        },
        [3] = {
            boonMenu = { -- A Chaos menu
                [1] = { -- Menu 1
                    Data = { -- This will always be Epic Abyssal Flourish followed by two empty slots
                        {
                            CurseName = "Abyssal",
                            BlessingName = "Flourish",
                            BlessingValue = 2, -- +100%
                            ForcedRarity = "Epic",
                        },
                        { EmptySlot = true },
                        { EmptySlot = true },
                    },
                },
            },
        },
        [5] = {
            exitDoors = {
                Data = {
                    { RoomName = "A_Shop01" } -- Midshop
                },
            },
        },
        [6] = { -- Tart Midshop
            shop = {
                Data = {
                    { Item = "Boon", GodName = "Artemis" }, -- An Artemis boon, assuming you have not already filled your pool to avoid her
                    { Item = "Boon", GodName = "Zeus" }, -- A random bag which will always contain Zeus
                    -- Third slot will be filled with whatever would be there normally
                },
            },
        },
        [11] = {
            encounter = {
                Data = {
                    Name = "ThanatosTartarus", -- If possible, this will be a Than room with random enemies
                },
            },
        },
        [15] = { -- Pre-Aspho Midbiome
            roomFeatures = {
                Data = { -- There should always be a well and sell well in every midbiome
                    Well = { Force = true },
                    SellWell = { Force = true },
                },
            },
            shop = { -- Wells still use 'shop' data type
                [1] = { -- Menu 1 (before rerolling)
                    Data = {
                        { Item = "KissOfStyx" }, -- A Kiss of Styx, if one is eligible
                        { Item = "FatefulTwist", Contents = "LightOfIxion" }, -- Fateful Twist which will always contain a Light of Ixion
                    }
                },
            },
        },
    },
}
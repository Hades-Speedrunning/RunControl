--[[
    RunControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Central mod used to set the run data for all mods in the RunControl modpack.
]]
ModUtil.Mod.Register("RunControl")

RunControl.CurrentRunData = {
    Boons = {
        ListType = "Indexed",
        IndexedBy = { "godName", "chamberNum", "rerollNum" },
        List = {
            Ares = {
                [1] = { -- Chamber 1
                    [1] = { -- Menu 1
                        Data = {
                            { Name = "CurseOfAgony", ForcedRarity = "Common" },
                            { Name = "CurseOfPain", ForcedRarity = "Epic" },
                            { Name = "SlicingShot", ForcedRarity = "Common" },
                        },
                    },
                    [2] = { -- Menu 2 (first reroll)
                        Data = {
                            { Name = "CurseOfAgony", ForcedRarity = "Epic" },
                            { Name = "SlicingShot", ForcedRarity = "Common" },
                            { Name = "UrgeToKill", ForcedRarity = "Common" },
                        },
                    }
                }
            }
        }
    }
}

ModUtil.LoadOnce( function()
    BoonControl.CurrentRunData = RunControl.CurrentRunData.Boons or {}
end )

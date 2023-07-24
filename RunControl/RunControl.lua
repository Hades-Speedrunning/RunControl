--[[
    RunControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Central mod used to set the run data for all mods in the RunControl modpack.
]]
ModUtil.Mod.Register("RunControl")

RunControl.CurrentRunData = {}

ModUtil.LoadOnce( function()
    RunControl.CurrentRunData = RunControl.Runs.SleepSoul607Talos
    BoonControl.CurrentRunData = RunControl.CurrentRunData.Boons or {}
end )

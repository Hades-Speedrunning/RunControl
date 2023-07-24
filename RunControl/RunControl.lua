--[[
    RunControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Central mod used to set the run data for all mods in the RunControl modpack.
]]
ModUtil.Mod.Register("RunControl")

local config = {
    ModpackVersion = "0.1.0"
}
RunControl.config = config

RunControl.CurrentRunData = {}

function RunControl.DisplayVersion()
    local text_config_table = DeepCopyTable(UIData.CurrentRunDepth.TextFormat)
    local versionString = "RunControl "..RunControl.config.ModpackVersion

    PrintUtil.createOverlayLine(
        "ModpackVersion",
        versionString,
        MergeTables(
            text_config_table,
            {
                x_pos = 1908,
                y_pos = 27,
                color = Color.DimGray
            }
        )
    )
end

ModUtil.LoadOnce( function()
    RunControl.CurrentRunData = RunControl.Runs.SleepSoul607Talos
    BoonControl.CurrentRunData = RunControl.CurrentRunData.Boons or {}
end )

OnAnyLoad{ function()
    RunControl.DisplayVersion()
end }

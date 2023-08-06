--[[
    RunControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Central mod used to set the run data for all mods in the RunControl modpack.
]]
ModUtil.Mod.Register("RunControl")

local config = {
    ModpackVersion = "0.6.0",
    SelectedRun = "SleepSoul607Talos",
}
RunControl.config = config

RunControl.CurrentRunData = {}
RunControl.Runs = {}

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
    RunControl.CurrentRunData = RunControl.Runs[RunControl.config.SelectedRun] or {}
    BoonControl.CurrentRunData = RunControl.CurrentRunData.Boons or {}
    EncounterControl.CurrentRunData = RunControl.CurrentRunData.Encounters or {}
    RewardControl.CurrentRunData = RunControl.CurrentRunData.Rewards or {}
    RoomControl.CurrentRunData = RunControl.CurrentRunData.Rooms or {}
    ShopControl.CurrentRunData = RunControl.CurrentRunData.Shops or {}
end )

OnAnyLoad{ function()
    RunControl.DisplayVersion()
end }

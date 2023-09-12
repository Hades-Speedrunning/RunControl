--[[
    RunControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Central mod used to set the run data for all mods in the RunControl modpack.
]]
ModUtil.Mod.Register( "RunControl" )

local config = {
    ModpackVersion = "0.11.0",
    SelectedRun = "None",
}
RunControl.config = config

RunControl.CurrentRunData = {}
RunControl.Runs = {}
RunControl.DemoRuns = {
    "Lili557Eris",
    "Ananke552Eris",
    "185549Achilles",
    "Croven532Beowulf",
    "ocaml526Rama",
    "Croven516Hera",
    "DrkFrst504Beowulf",

    "BIGP524Beowulf",
    "185455Achilles",
    "Croven449Hera",
    "BIGP448Beowulf",
    "Croven447Hera",
    "Ocke445Beowulf",
    "Croven439Hera",
    "Vorime430Beowulf",

    "paradigmsortBeoRoute",
    "pseudoErisRoute",

    "Ananke629Demeter",
}
RunControl.SortedRuns = {
    "Lili557Eris",
    "Ananke552Eris",
    "185549Achilles",
    "Croven532Beowulf",
    "ocaml526Rama",
    "Croven516Hera",
    "DrkFrst504Beowulf",

    "BIGP524Beowulf",
    "185455Achilles",
    "Croven449Hera",
    "BIGP448Beowulf",
    "Croven447Hera",
    "Ocke445Beowulf",
    "Croven439Hera",
    "Vorime430Beowulf",

    "paradigmsortBeoRoute",
    "pseudoErisRoute",

    "Ananke629Demeter",
}

function RunControl.DisplayVersion()
    local text_config_table = DeepCopyTable( UIData.CurrentRunDepth.TextFormat )
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

function RunControl.UpdateRunData()
    RunControl.CurrentRunData = RunControl.Runs[RunControl.config.SelectedRun] or {}
    BoonControl.CurrentRunData = RunControl.CurrentRunData
    EncounterControl.CurrentRunData = RunControl.CurrentRunData
    RewardControl.CurrentRunData = RunControl.CurrentRunData
    RoomControl.CurrentRunData = RunControl.CurrentRunData
    SellControl.CurrentRunData = RunControl.CurrentRunData
    ShopControl.CurrentRunData = RunControl.CurrentRunData
end

ModUtil.LoadOnce( function() RunControl.UpdateRunData() end )

OnAnyLoad{ function()
    RunControl.DisplayVersion()
end }

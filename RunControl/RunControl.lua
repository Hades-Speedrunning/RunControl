--[[
    RunControl
    Authors:
        SleepSoul (Discord: SleepSoul#6006)
    Dependencies: ModUtil, RCLib
    Central mod used to set the run data for all mods in the RunControl modpack.
]]
ModUtil.Mod.Register( "RunControl" )

local config = {
    ModpackVersion = "1.0.0-beta.2",
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

function RunControl.SaveConfig()
    RunControl.Data.config = {}
    RunControl.Data.config.SelectedRun = RunControl.config.SelectedRun

    BoonControl.Data.config = {}
    for k, v in pairs( BoonControl.config ) do
        BoonControl.Data.config[k] = v
    end

    EncounterControl.Data.config = {}
    for k, v in pairs( EncounterControl.config ) do
        EncounterControl.Data.config[k] = v
    end

    RewardControl.Data.config = {}
    for k, v in pairs( RewardControl.config ) do
        RewardControl.Data.config[k] = v
    end

    RoomControl.Data.config = {}
    for k, v in pairs( RoomControl.config ) do
        RoomControl.Data.config[k] = v
    end

    SellControl.Data.config = {}
    for k, v in pairs( SellControl.config ) do
        SellControl.Data.config[k] = v
    end

    ShopControl.Data.config = {}
    for k, v in pairs( ShopControl.config ) do
        ShopControl.Data.config[k] = v
    end
end

function RunControl.LoadConfig()
    RunControl.config.SelectedRun = ModUtil.Path.Get( "RunControl.Data.config.SelectedRun" ) or RunControl.config.SelectedRun

    if not IsEmpty( ModUtil.Path.Get( "BoonControl.Data.config") ) then
        for k, v in pairs( BoonControl.Data.config ) do
            BoonControl.config[k] = v
        end
    end

    if not IsEmpty( ModUtil.Path.Get( "EncounterControl.Data.config") ) then
        for k, v in pairs( EncounterControl.Data.config ) do
            EncounterControl.config[k] = v
        end
    end

    if not IsEmpty( ModUtil.Path.Get( "RewardControl.Data.config") ) then
        for k, v in pairs( RewardControl.Data.config ) do
            RewardControl.config[k] = v
        end
    end

    if not IsEmpty( ModUtil.Path.Get( "RoomControl.Data.config") ) then
        for k, v in pairs( RoomControl.Data.config ) do
            RoomControl.config[k] = v
        end
    end

    if not IsEmpty( ModUtil.Path.Get( "SellControl.Data.config") ) then
        for k, v in pairs( SellControl.Data.config ) do
            SellControl.config[k] = v
        end
    end

    if not IsEmpty( ModUtil.Path.Get( "ShopControl.Data.config") ) then
        for k, v in pairs( ShopControl.Data.config ) do
            ShopControl.config[k] = v
        end
    end
end

ModUtil.LoadOnce( function()
    RunControl.LoadConfig()
    RunControl.UpdateRunData()
end )

OnAnyLoad{ function()
    RunControl.DisplayVersion()
end }

ModUtil.Path.Wrap( "RunClearMessagePresentation", function( baseFunc, screen, message, args )
    message = message or {}
    message.Name = ModUtil.IndexArray.Get( RunControl.Runs, { RunControl.config.SelectedRun, "Metadata", "Name" } ) or "RunControl"
    baseFunc( screen, message, args )
end, RunControl )

ModUtil.Path.Context.Wrap( "ShowRunClearScreen", function()
    local numTextWrap = 0
    ModUtil.Path.Wrap( "CreateTextBox", function( baseFunc, args )
        numTextWrap = numTextWrap + 1
        local originalTime = ModUtil.IndexArray.Get( RunControl.Runs, { RunControl.config.SelectedRun, "Metadata", "OriginalTime" } )
        if numTextWrap == 4 and originalTime then -- Originally "Best Time:"
            args.Text = "Original Time:"
        end
        if numTextWrap == 41 then
            args.Text = 0
        end
        return baseFunc( args )
    end, RunControl )

    local numTimerWrap = 0
    ModUtil.Path.Wrap( "GetTimerString", function( baseFunc, ... )
        numTimerWrap = numTimerWrap + 1
        if numTimerWrap == 2 then
            local originalTime = ModUtil.IndexArray.Get( RunControl.Runs, { RunControl.config.SelectedRun, "Metadata", "OriginalTime" } )
            return originalTime or baseFunc( ... )
        end
        return baseFunc( ... )
    end, RunControl )
end, RunControl )

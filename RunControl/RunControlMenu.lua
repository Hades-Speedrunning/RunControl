RunControl.MenuPages = {
    { -- Introduction
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            TextboxArgs = { Text = "Introduction" },
        },
        {
            ElementName = "WelcomeBanner",
            ElementType = "Textbox",
            Style = "SubHeading",
            Args = { Y = 180 },
            TextboxArgs = { Text = "Welcome to RunControl!" },
        },
        {
            ElementName = "Introduction",
            ElementType = "Textbox",
            Args = { Y = 240 },
            TextboxArgs = {
                Text = "This modpack allows complete control over the events of a Hades run. Recreate your personal bests, test yourself"
                .. " against world records, or just try out a build you've always wanted- the possibilities are limitless!"
                .. "\\n To the right you'll find a library of historic runs to choose from."
                .. " Further to the right, you can configure how these runs will be applied."
                .. "\\n\\n If you want to load more runs, or even try making some yourself, check out the HOWTO.md file included with the modpack."
                .. " It has the information you'll need to get started."
                .. " If you need any more help, feel free to ask in the Hades Speedrunning Discord (which you can find through our speedrun.com page)- We'll try to help you out."
                .. "\\n\\n Good luck, and have fun! - SleepSoul",
                Justification = "Center",
                Width = 1320,
            },
        },
        {
            ElementName = "VersionBanner",
            ElementType = "Textbox",
            Style = "SubHeading",
            Args = { Y = 570 },
            TextboxArgs = { Text = "You are playing version " .. RunControl.ModpackVersion },
        },
        {
            ElementName = "UpdateNotice",
            ElementType = "Textbox",
            Args = { Y = 630 },
            TextboxArgs = {
                Text = "Please note that runs created on different versions may not play correctly on this one; this will be noted when you select them."
                .. " The most recent release can be found at github.com/Hades-Speedrunning/RunControl/releases- remember to check now and again to make sure you're up to date.",
                Justification = "Center",
                Width = 1320,
            },
        },
        {
            ElementName = "SpecialThanks",
            ElementType = "Textbox",
            Args = { Y = 800 },
            TextboxArgs = {
                Text = "Special thanks to: "
                .. "\\n\\n Lili, Ananke, 185, Croven, ocaml, DrkFrst, BIGP, OckE, Vorime; nnevic, grizz, CardDweeb, c_gull, Tounis; Museus, Magic_Gonads, Zyruvias; Angel1C."
                .. "\\n\\n See you in Hades 2.",
                Color = Color.DimGray,
                Justification = "Center",
                Width = 1320,
            },
        },
    },
    { -- RunControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            TextboxArgs = { Text = "Select a run" },
        },
        {
            ElementType = "ManualElement",
            ElementFunction = function( screen ) RunControl.CreateRunSelector( screen ) end
        }
    },
    { -- BoonControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            TextboxArgs = { Text = "Boons/Hammers" },
        },
        {
            ElementName = "Enabled",
            ElementType = "LabelledCheckbox",
            Args = { Y = 180 },
            TextboxArgs = { Text = "Enable boon and hammer control:" },

            Config = "BoonControl.config.Enabled",
        },
        {
            ElementName = "CheckEligibility",
            ElementType = "LabelledCheckbox",
            Args = { Y = 240 },
            TextboxArgs = { Text = "Only force boons and hammers when eligible:" },

            Config = "BoonControl.config.CheckEligibility",
        },
        {
            ElementName = "FillWithEligible",
            ElementType = "LabelledCheckbox",
            Args = { Y = 300 },
            TextboxArgs = { Text = "Fill empty slots with eligible boons/hammers:" },

            Config = "BoonControl.config.FillWithEligible",
        },
        {
            ElementName = "InferReplaces",
            ElementType = "LabelledCheckbox",
            Args = { Y = 360 },
            TextboxArgs = { Text = "Try to offer ineligible boons as replaces:" },

            Config = "BoonControl.config.InferReplaces",
        },
        {
            ElementName = "UseSpareWealth",
            ElementType = "LabelledCheckbox",
            Args = { Y = 420 },
            TextboxArgs = { Text = "Fill empty menus with spare wealth:" },

            Config = "BoonControl.config.UseSpareWealth",
        },
        {
            ElementName = "DefaultRarity",
            ElementType = "LabelledDropdown",
            Args = { Y = 480 },
            TextboxArgs = { Text = "Default boon rarity:" },

            Config = "BoonControl.config.DefaultRarity",
            Options = {
                { Value = "Common" },
                { Value = "Rare" },
                { Value = "Epic" },
                { Value = "Heroic" },
                { Value = "Random" },
            },
        },
        {
            ElementName = "CheckRarityEligibility",
            ElementType = "LabelledCheckbox",
            Args = { Y = 540 },
            TextboxArgs = { Text = "Only force rarity if eligible:" },

            Config = "BoonControl.config.CheckRarityEligibility",
        }
    },
    { -- RoomControl/RewardControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            TextboxArgs = { Text = "Rooms/Rewards" },
        },
        {
            ElementName = "RoomControlEnabled",
            ElementType = "LabelledCheckbox",
            Args = { Y = 180 },
            TextboxArgs = { Text = "Enable room control:" },

            Config = "RoomControl.config.Enabled",
        },
        {
            ElementName = "RoomControlCheckEligibility",
            ElementType = "LabelledCheckbox",
            Args = { Y = 240 },
            TextboxArgs = { Text = "Only force rooms when eligible:" },

            Config = "RoomControl.config.CheckEligibility",
        },
        {
            ElementName = "CheckGoldPotEligibility",
            ElementType = "LabelledCheckbox",
            Args = { Y = 300 },
            TextboxArgs = { Text = "Only force as many gold pots as are eligible:" },

            Config = "RoomControl.config.CheckGoldPotEligibility",
        },
        {
            ElementName = "RequireForcedFeatures",
            ElementType = "LabelledCheckbox",
            Args = { Y = 360 },
            TextboxArgs = { Text = "Room features only appear when forced:" },

            Config = "RoomControl.config.RequireForcedFeatures",
        },
        {
            ElementName = "RequireForcedSkips",
            ElementType = "LabelledCheckbox",
            Args = { Y = 420 },
            TextboxArgs = { Text = "Special rooms only appear when forced:" },

            Config = "RoomControl.config.RequireForcedSkips",
        },
        {
            ElementName = "RewardControlEnabled",
            ElementType = "LabelledCheckbox",
            Args = { Y = 540 },
            TextboxArgs = { Text = "Enable reward control:" },

            Config = "RewardControl.config.Enabled",
        },
        {
            ElementName = "RewardControlCheckEligibility",
            ElementType = "LabelledCheckbox",
            Args = { Y = 600 },
            TextboxArgs = { Text = "Only force rewards when eligible:" },

            Config = "RewardControl.config.CheckEligibility",
        },
        {
            ElementName = "PrioritiseKeepsakes",
            ElementType = "LabelledCheckbox",
            Args = { Y = 660 },
            TextboxArgs = { Text = "Allow keepsakes to take priority over forced gods:" },

            Config = "RewardControl.config.PrioritiseKeepsakes",
        },
    },
    { -- BossControl/EncounterControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            TextboxArgs = { Text = "Encounters/Bosses" },
        },
        {
            ElementName = "EncounterControlEnabled",
            ElementType = "LabelledCheckbox",
            Args = { Y = 180 },
            TextboxArgs = { Text = "Enable encounter control:" },

            Config = "EncounterControl.config.Enabled",
        },
        {
            ElementName = "EncounterControlCheckEligibility",
            ElementType = "LabelledCheckbox",
            Args = { Y = 240 },
            TextboxArgs = { Text = "Only force encounters when eligible:" },

            Config = "EncounterControl.config.CheckEligibility",
        },
        {
            ElementName = "RequireForcedSpecialEncounters",
            ElementType = "LabelledCheckbox",
            Args = { Y = 300 },
            TextboxArgs = { Text = "Than/survival only appear when forced:" },

            Config = "EncounterControl.config.RequireForcedSpecialEncounters",
        },
        {
            ElementName = "BossControlEnabled",
            ElementType = "LabelledCheckbox",
            Args = { Y = 420 },
            TextboxArgs = { Text = "Allow control of boss mechanics:" },

            Config = "BossControl.config.Enabled",
        },
        {
            ElementName = "CheckTheseusGodEligibility",
            ElementType = "LabelledCheckbox",
            Args = { Y = 480 },
            TextboxArgs = { Text = "Only force Theseus summons when eligible:" },

            Config = "BossControl.config.CheckTheseusGodEligibility",
        },
    },
    { -- ShopControl/SellControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            TextboxArgs = { Text = "Shops/Wells" },
        },
        {
            ElementName = "ShopControlEnabled",
            ElementType = "LabelledCheckbox",
            Args = { Y = 180 },
            TextboxArgs = { Text = "Enable shop and well control:" },

            Config = "ShopControl.config.Enabled",
        },
        {
            ElementName = "CheckEligibility",
            ElementType = "LabelledCheckbox",
            Args = { Y = 240 },
            TextboxArgs = { Text = "Only force shop/well items when eligible:" },

            Config = "ShopControl.config.CheckEligibility",
        },
        {
            ElementName = "ShopControlFillWithEligible",
            ElementType = "LabelledCheckbox",
            Args = { Y = 300 },
            TextboxArgs = { Text = "Fill empty slots with eligible items:" },

            Config = "ShopControl.config.FillWithEligible",
        },
        {
            ElementName = "SortWells",
            ElementType = "LabelledCheckbox",
            Args = { Y = 360 },
            TextboxArgs = { Text = "Sort wells after forcing:" },

            Config = "ShopControl.config.SortWells",
        },
        {
            ElementName = "SellControlEnabled",
            ElementType = "LabelledCheckbox",
            Args = { Y = 480 },
            TextboxArgs = { Text = "Enable sell well control:" },

            Config = "SellControl.config.Enabled",
        },
        {
            ElementName = "SellControlFillWithEligible",
            ElementType = "LabelledCheckbox",
            Args = { Y = 540 },
            TextboxArgs = { Text = "Fill empty sell slots with eligible boons:" },

            Config = "SellControl.config.FillWithEligible",
        },
    },
    { -- UI & QOL
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            TextboxArgs = { Text = "Interface/QOL" },
        },
        {
            ElementName = "ShowChamberNumber",
            ElementType = "LabelledCheckbox",
            Args = { Y = 180 },
            TextboxArgs = { Text = "Always show chamber number:" },

            Config = "RunControl.config.ShowChamberNumber",
        },
        {
            ElementName = "ShowRunName",
            ElementType = "LabelledCheckbox",
            Args = { Y = 240 },
            TextboxArgs = { Text = "Show selected run in top-right while playing:" },

            Config = "RunControl.config.ShowRunName",
        },
    }
}

RunControl.ElementDefaults = {
    Textbox = {
        Style = "Body",
        Args = { X = 960, Y = 60 },
    },
    LabelledCheckbox = {
        Style = "Body",
        Args = { X = 654 },
        
        CheckboxOffsetX = 600,
        CheckboxOffsetY = 10,
    },
    LabelledDropdown = {
        Style = "Body",
        Args = { X = 654 },

        DropdownOffsetX = 600,
        DropdownOffsetY = 10,
        DropdownXScale = .2,
        DropdownYScale = .5,
    },
}

RunControl.TextStyles = {
    Heading = {
        FontSize = 16,
        Color = Color.White,
        Font = "SpectralSCLight",
        ShadowBlur = 0,
        ShadowColor = { 0, 0, 0, 1 },
        ShadowOffset = { 0, 2 },
        Justification = "Center",
        VerticalJustification = "Center",
    },
    SubHeading = {
        FontSize = 16,
        Color = Color.White,
        Font = "AlegreyaSansSCRegular",
        ShadowBlur = 0,
        ShadowColor = { 0, 0, 0, 1 },
        ShadowOffset = { 0, 2 },
        Justification = "Center",
        VerticalJustification = "Center",
    },
    Body = {
        Color = Color.White,
        Font = "AlegrayaSansSCRegular",
        FontSize = 16,
        ShadowBlur = 0,
        ShadowColor = { 0, 0, 0, 1 },
        ShadowOffset = { 0,  2 },
        Justification = "Left",
        VerticalJustification = "Top",
    }
}

RunControl.CurrentPageNum = 1

function RunControl.OpenSettingsMenu()
    CloseAdvancedTooltipScreen()

    local components = {}
    local screen = {
        Components = components,
        CloseAnimation  = "QuestLogBackground_Out"
    }
    OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true})
    FreezePlayerUnit()
    EnableShopGamepadCursor()
    SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
    SetConfigOption({ Name = "FreeFormSelectStepDistance", Value = 8 })

    components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu"})
    components.Background = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu"})
    
    SetAnimation({ DestinationId = components.Background.Id, Name = "QuestLogBackground_In", OffsetY = 30 })

    SetScale({ Id = components.BackgroundDim.Id, Fraction = 4})
    SetColor({ Id = components.BackgroundDim.Id, Color = { 0.090, 0.055, 0.157, 0.9 } })

    components.MenuLeft = CreateScreenComponent({
        Name = "ButtonCodexLeft",
        X = 460,
        Y = 60,
        Scale = 1.0,
        Group = "Combat_Menu"
    })

    components.MenuLeft.OnPressedFunctionName = "RunControl.PreviousPage"

    components.MenuRight = CreateScreenComponent({
        Name = "ButtonCodexRight",
        X = 1460,
        Y = 60,
        Scale = 1.0,
        Group = "Combat_Menu"
    })

    components.MenuRight.OnPressedFunctionName = "RunControl.NextPage"
    
    components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu"})
    Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = -6, OffsetY = 456 })
    components.CloseButton.OnPressedFunctionName = "RunControl.CloseSettingsMenu"
    components.CloseButton.ControlHotkey = "Cancel"
    
    screen.EvergreenComponents = ModUtil.Table.Copy( components )
    RunControl.OpenMenuPage( screen, RunControl.CurrentPageNum )

    thread( HandleWASDInput, screen )
    HandleScreenInput( screen )
end

function RunControl.CloseSettingsMenu( screen )
    DisableShopGamepadCursor()
    SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
    SetConfigOption({ Name = "FreeFormSelectStepDistance", Value = 16 })
    SetConfigOption({ Name = "FreeFormSelectSuccessDistanceStep", Value = 8})
    SetAnimation({ DestinationId = screen.Components.Background.Id, Name = screen.CloseAnimation })
    CloseScreen( GetAllIds( screen.Components ), 0.1)
	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
    UnfreezePlayerUnit()
    OnScreenClosed({ Flag = screen.Name })
    RunControl.SaveConfig()
end

function RunControl.NextPage( screen )
    local pageNum = RunControl.CurrentPageNum
    if RunControl.MenuPages[pageNum + 1] ~= nil then
        pageNum = pageNum + 1
        RunControl.OpenMenuPage( screen, pageNum )
        RunControl.CurrentPageNum = pageNum
    end
end

function RunControl.PreviousPage( screen )
    local pageNum = RunControl.CurrentPageNum
    if RunControl.MenuPages[pageNum - 1] ~= nil then
        pageNum = pageNum - 1
        RunControl.OpenMenuPage( screen, pageNum )
        RunControl.CurrentPageNum = pageNum
    end
end

function RunControl.OpenMenuPage( screen, pageNum )
    RunControl.CloseMenuPage( screen )

    local page = RunControl.MenuPages[pageNum] or {}
    local components = screen.Components

    for index, element in ipairs( page ) do
        RunControl.CreateMenuElement( screen, element )
    end
end

function RunControl.CloseMenuPage( screen )
    local ids = {}
    for name, component in pairs( screen.Components ) do
        if screen.EvergreenComponents[name] == nil then
            screen.Components[name] = nil
            table.insert(ids, component.Id)
        end
    end
    CloseScreen( ids )
end

function RunControl.CreateMenuElement( screen, element )
    local defaults = ModUtil.Table.Copy.Deep( RunControl.ElementDefaults[element.ElementType] or {} )
    local merged = ModUtil.Table.Merge( defaults, element )

    if merged.ElementType == "Textbox" or merged.ElementType == "LabelledCheckbox" or merged.ElementType == "LabelledDropdown" then
        RunControl.CreateTextbox( screen, merged )
    end

    if merged.ElementType == "Checkbox" or merged.ElementType == "LabelledCheckbox" then
        RunControl.CreateCheckbox( screen, merged )
    end

    if merged.ElementType == "Dropdown" or merged.ElementType == "LabelledDropdown" then
        RunControl.CreateDropdown( screen, merged )
    end

    if merged.ElementType == "ManualElement" then
        merged.ElementFunction( screen )
    end
end

function RunControl.CreateTextbox( screen, element )
    local textboxName = element.ElementName .. "Text"
    local args = element.Args or {}
    local textArgs = element.TextboxArgs or {}
    local styleData = RunControl.TextStyles[element.Style] or {}

    local textbox = CreateScreenComponent({
        Name = args.Name or "BlankObstacle",
        Scale = args.Scale or 1,
        X = args.X or 0,
        Y = args.Y or 0,
        Group = "Combat_Menu"
    })
    CreateTextBox({
        Id = textbox.Id,
        Text = textArgs.Text or "",
        Color = textArgs.Color or styleData.Color or Color.White,
        Font = textArgs.Font or styleData.Font or "AlegrayaSansSCRegular",
        ShadowBlur = textArgs.ShadowBlur or styleData.ShadowBlur,
        ShadowColor = textArgs.ShadowColor or styleData.ShadowColor,
        ShadowOffset = textArgs.ShadowOffset or styleData.ShadowOffset,
        Justification = textArgs.Justification or styleData.Justification or "Left",
        VerticalJustification = textArgs.VerticalJustification or styleData.VerticalJustification or "Top",
        Width = textArgs.Width or styleData.Width,
        Group = "Combat_Menu"
    })

    screen.Components[textboxName] = textbox
end

function RunControl.CreateCheckbox( screen, element )
    local checkboxName = element.ElementName .. "Checkbox"
    local args = element.Args or {}
    local offsetX = element.CheckboxOffsetX or 0
    local offsetY = element.CheckboxOffsetY or 0

    local checkbox = CreateScreenComponent({
    Name = "RadioButton",
    Scale = 1,
    X = ( args.X or 0 ) + offsetX,
    Y = ( args.Y or 0 ) + offsetY,
    Group = "Combat_Menu"
    })
    checkbox.Config = element.Config
    checkbox.OnPressedFunctionName = "RunControl.ToggleCheckbox"
    RunControl.UpdateCheckbox( screen, checkbox )

    screen.Components[checkboxName] = checkbox
end

function RunControl.UpdateCheckbox( screen, button )
    local radioButtonValue = "RadioButton_Unselected"
    local configValue = ModUtil.Path.Get( button.Config )
    if ModUtil.Path.Get( button.Config ) then
        radioButtonValue = "RadioButton_Selected"
    end
    SetThingProperty({
        DestinationId = button.Id,
        Property = "Graphic",
        Value = radioButtonValue
    })

    if radioButtonValue == "RadioButton_Unselected" and button.Children ~= nil then
        for _, child in pairs( button.Children ) do
            RunControl.ToggleCheckbox( screen, screen.Components[child.Checkbox], false )
            screen.Components[child.Checkbox].Enabled = false
        end
    elseif button.Children ~= nil then
        for _, child in pairs( button.Children ) do
            screen.Components[child.Checkbox].Enabled = true
        end
    end
end

function RunControl.ToggleCheckbox( screen, button )
    if button.Enabled == false then
        return
    end
    local configPathArray = ModUtil.Path.IndexArray( button.Config )
    local configValue = ModUtil.Path.Get( button.Config )
    if configValue ~= nil then
        ModUtil.IndexArray.Set( _G, configPathArray, not configValue )
        RunControl.UpdateCheckbox( screen, button )
    end
end

function RunControl.CreateDropdown( screen, element )
    local dropdownName = element.ElementName .. "Dropdown"
    local args = element.Args or {}
    local offsetX = element.DropdownOffsetX or 0
    local offsetY = element.DropdownOffsetY or 0
    local xScale = element.DropdownXScale or 1
    local yScale = element.DropdownYScale or 1

    local configPathArray = ModUtil.Path.IndexArray( element.Config )
    local configValue = ModUtil.Path.Get( element.Config )
    local dropdownOptions = {}
    local defaultOption = ModUtil.IndexArray.Get( element, { "Options", "Default" } ) or {}
    dropdownOptions.Default = {
        event = function( dropdown )
            if configValue ~= nil then
                ModUtil.IndexArray.Set( _G, configPathArray, defaultOption.Value or configValue )
            end
        end,
        Text = defaultOption.Text or configValue or "None",
    }
    for index, option in ipairs( element.Options ) do
        table.insert( dropdownOptions, {
            event = function( dropdown )
                if configValue ~= nil then
                    ModUtil.IndexArray.Set( _G, configPathArray, option.Value )
                end
            end,
            Text = option.Text or option.Value or "Nil"
        })
    end

    local dropdown = ErumiUILib.Dropdown.CreateDropdown( screen, {
        Name = dropdownName,
        Group = "Combat_Menu",
        X = ( args.X or 0 ) + offsetX,
        Y = ( args.Y or 0 ) + offsetY,
        Scale = { X = xScale, Y = yScale },
        Padding = { X = 0, Y = 2 },
        Font = "AlegrayaSansSCRegular",
        GeneralFontSize = 16,
        Items = dropdownOptions,
    })

    screen.Components[dropdownName] = dropdown
end

function RunControl.CreateRunSelector( screen )
    local runOptions = {}
    for index, runKey in ipairs( RunControl.SortedRuns ) do
        local runData = RunControl.Runs[runKey] or {}
        if not IsEmpty( runData ) then
            local runName = ModUtil.Path.Get( "Metadata.Name", runData ) or runKey..".lua"
            table.insert( runOptions, {
                Text = runName,
                event = function() RunControl.SelectRun( screen, runKey ) end
            })
        end
    end
    for runKey, runData in pairs( RunControl.Runs ) do
        if not IsEmpty( runData ) and not Contains( RunControl.SortedRuns, runKey ) then
            local runName = ModUtil.Path.Get( "Metadata.Name", runData ) or runKey..".lua"
            table.insert( runOptions, {
                Text = runName,
                event = function() RunControl.SelectRun( screen, runKey ) end
            })
        end
    end

    ErumiUILib.ScrollingList.CreateScrollingList( screen, {
        Name = "RunSelector",
        Group = "Combat_Menu",
        X = 460,
        Y = 293,
        Scale = { X = 0.5, Y = 0.5, },
        Padding = { X = 1, Y = 1, },
        DescriptionOffset = { X = 0, Y = 0, },
        DescriptionColor = Color.White,
        Font = "AlegrayaSansSCRegular",
        GeneralFontSize = 16,
        GeneralOffset = { X = -202 },
        Justification = "Left",
        ItemsPerPage = 10,

        Items = runOptions,

        ArrowStyle = {
            CreationPositions = {
                Style = "TB",
            },
            Offset = { X = 0, Y = 0 },
            UpOffset = { Y = -80 },
            DownOffset = { Y = 80 },
        },
    } )
    RunControl.UpdateRunDisplay( screen )
end

function RunControl.SelectRun( screen, runKey )
    ModUtil.Path.Set( "RunControl.config.SelectedRun", runKey )
    RunControl.UpdateRunData()
    PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })

    local oldTitleId = ModUtil.Path.Get( "Components.SelectedRunTitleText.Id", screen )
    local oldDescId = ModUtil.Path.Get( "Components.SelectedRunDescText.Id", screen )
    local versionWarningId = ModUtil.Path.Get( "Components.VersionWarningText.Id", screen )
    CloseScreen( { oldTitleId, oldDescId, versionWarningId } )
    RunControl.UpdateRunDisplay( screen )
end

function RunControl.UpdateRunDisplay( screen )
    local runMetadata = ModUtil.IndexArray.Get( RunControl.Runs, { RunControl.config.SelectedRun, "Metadata" } ) or {}
    local nameText
    local descText
    local runVersion
    if RunControl.config.SelectedRun == "None" then
        nameText = "None"
        descText = "You have no run selected!"
        runVersion = RunControl.ModpackVersion
    else
        nameText = runMetadata.Name or RunControl.config.SelectedRun..".lua"
        descText = runMetadata.Description or "This run has no description."
        runVersion = runMetadata.CreatedFor or "Unspecified"
    end
    if nameText then
        RunControl.CreateMenuElement( screen, {
            ElementName = "SelectedRunTitle",
            ElementType = "Textbox",
            Style = "SubHeading",
            Args = { X = 780, Y = 180 },
            TextboxArgs = {
                Text = nameText,
                Justification = "Left",
                VerticalJustification = "Top",
                Width = 840,
            },
        })
    end
    if descText then
        RunControl.CreateMenuElement( screen, {
            ElementName = "SelectedRunDesc",
            ElementType = "Textbox",
            Style = "Body",
            Args = { X = 780, Y = 267 },
            TextboxArgs = {
                Text = descText,
                Width = 840,
            },
        })
    end
    if runVersion ~= RunControl.ModpackVersion then
        RunControl.CreateMenuElement( screen, {
            ElementName = "VersionWarning",
            ElementType = "Textbox",
            Style = "Body",
            Args = { X = 780, Y = 735 },
            TextboxArgs = {
                Text = "Note that this run was made for a different RunControl version (" .. runVersion .. "). \\n It may not work correctly!",
                Color = { 255, 20, 20, 255 },
            },
        })
    end
end

ModUtil.Path.Wrap( "CreatePrimaryBacking", function ( baseFunc )
    -- Only show menu between runs
    if not ModUtil.Path.Get( "CurrentDeathAreaRoom" ) then
        return baseFunc()
    end
  
    local components = ScreenAnchors.TraitTrayScreen.Components
    components.ModConfigButton = CreateScreenComponent({
        Name = "ButtonDefault",
        Scale = 0.7,
        Group = "Combat_Menu_TraitTray",
        X = CombatUI.TraitUIStart + 135,
        Y = 185 })
    components.ModConfigButton.OnPressedFunctionName = "RunControl.OpenSettingsMenu"
    CreateTextBox({ Id = components.ModConfigButton.Id,
        Text = "RunControl",
        OffsetX = 0, OffsetY = 0,
        FontSize = 22,
        Color = Color.White,
        Font = "AlegreyaSansSCRegular",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
        Justification = "Center",
        DataProperties =
        {
            OpacityWithOwner = true,
        },
    })
    Attach({ Id = components.ModConfigButton.Id, DestinationId = components.ModConfigButton, OffsetX = 500, OffsetY = 500 })
    baseFunc()
end, RunControl )

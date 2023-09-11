RunControl.MenuPages = {
    { -- Introduction
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            Args = { X = 960, Y = 60 },
            TextboxArgs = { Text = "Introduction" },
        },
        {
            ElementName = "MainMenuText",
            ElementType = "Textbox",
            Style = "BodyText",
            Args = { X = 960, Y = 180 },
            TextboxArgs = {
                Text = "Welcome to RunControl!"
                .. "\\n\\n This modpack allows complete control over the events of a Hades run. Recreate your own personal bests, test yourself"
                .. "\\n against famous world records, or just try out that build you've always wanted- the possibilities are limitless!"
                .. "\\n To the right you'll find an included library of historic runs to get you started."
                .. "\\n After that, go further to the right to configure how these runs will be applied."
                .. "\\n\\n Good luck, and have fun! - SleepSoul",
                Justification = "Center",
            },
        },
    },
    { -- RunControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            Args = { X = 960, Y = 60 },
            TextboxArgs = { Text = "Select a run" },
        },
    },
    { -- BoonControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            Args = { X = 960, Y = 60 },
            TextboxArgs = { Text = "Boons" },
        },
    },
    { -- RoomControl/RewardControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            Args = { X = 960, Y = 60 },
            TextboxArgs = { Text = "Rooms/Rewards" },
        },
    },
    { -- EncounterControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            Args = { X = 960, Y = 60 },
            TextboxArgs = { Text = "Encounters" },
        },
    },
    { -- ShopControl/SellControl
        {
            ElementName = "Title",
            ElementType = "Textbox",
            Style = "Heading",
            Args = { X = 960, Y = 60 },
            TextboxArgs = { Text = "Shops/Wells" },
        },
    },
}

RunControl.MenuTextStyles = {
    Title = {
        FontSize = 36,
        Color = Color.White,
        Font = "SpectralSCLightTitling",
        ShadowBlur = 0,
        ShadowColor = { 0, 0, 0, 1 },
        ShadowOffset = { 0, 2 },
        Justification = "Center",
        VerticalJustification = "Top",
    },
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
    Body = {
        FontSize = 16,
        Color = Color.White,
        Font = "AlegrayaSansSCRegular",
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
    FreezePlayerUnit()

    local components = {}
    local screen = {
        Components = components,
        CloseAnimation  = "QuestLogBackground_Out"
    }

    components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu"})
    components.Background = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu"})
    
    SetAnimation({ DestinationId = components.Background.Id, Name = "QuestLogBackground_In", OffsetY = 30 })

    SetScale({ Id = components.BackgroundDim.Id, Fraction = 4})
    SetColor({ Id = components.BackgroundDim.Id, Color = { 0.090, 0.055, 0.157, 0.8 } })

    components.MenuLeft = CreateScreenComponent({
        Name = "ButtonCodexLeft",
        X = 520,
        Y = 60,
        Scale = 1.0,
        Group = "Combat_Menu"
    })

    components.MenuLeft.OnPressedFunctionName = "RunControl.PreviousPage"

    components.MenuRight = CreateScreenComponent({
        Name = "ButtonCodexRight",
        X = 1400,
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
    SetAnimation({ DestinationId = screen.Components.Background.Id, Name = screen.CloseAnimation })
    CloseScreen( GetAllIds( screen.Components ), 0.1)
    UnfreezePlayerUnit()
    OnScreenClosed({ Flag = screen.Name })
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
        components[element.ElementName] = RunControl.CreateMenuElement( element )
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

function RunControl.CreateMenuElement( element )
    local args = element.Args or {}
    local component = CreateScreenComponent({
        Name = args.Name or "BlankObstacle",
        Scale = args.Scale or 1,
        X = args.X or 0,
        Y = args.Y or 0,
        Group = "Combat_Menu"
    })
    if element.ElementType == "Textbox" then
        local textArgs = element.TextboxArgs or {}
        local styleData = RunControl.MenuTextStyles[element.Style] or {}
        CreateTextBox({
            Id = component.Id,
            Text = textArgs.Text or "",
            Color = textArgs.Color or styleData.Color or Color.White,
            Font = textArgs.Font or styleData.Font or "AlegrayaSansSCRegular",
            ShadowBlur = textArgs.ShadowBlur or styleData.ShadowBlur,
            ShadowColor = textArgs.ShadowColor or styleData.ShadowColor,
            ShadowOffset = textArgs.ShadowOffset or styleData.ShadowOffset,
            Justification = textArgs.Justification or styleData.Justification or "Left",
            VerticalJustification = textArgs.VerticalJustification or styleData.VerticalJustification or "Top",
            Group = "Combat_Menu"
        })
    end
    return component
end

function RunControl.DestroyMenuElement( element )
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
  
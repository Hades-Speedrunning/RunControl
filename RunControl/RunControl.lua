--[[
    RunControl
    Author: SleepSoul (Discord: sleepsoul)
    Dependencies: ModUtil, RCLib
    Central mod used to set the run data for all mods in the RunControl modpack.
]]
ModUtil.Mod.Register( "RunControl" )

local config = {
    SelectedRun = "None",
    ShowChamberNumber = true,
    ShowRunName = true,
}
RunControl.config = config

RunControl.ModpackVersion = "1.2.0-beta.1"

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

RunControl.ModIndex = {
    "BoonControl",
    "BossControl",
    "EncounterControl",
    "RewardControl",
    "RoomControl",
    "SellControl",
    "ShopControl",
}

function RunControl.DisplayVersion()
    local textConfigTable = {
        color = Color.DimGray,
        x_pos = 1908,
        y_pos = 27,
    }
    local versionString = "RunControl " .. RunControl.ModpackVersion
    local runName = ModUtil.IndexArray.Get( RunControl.Runs, { RunControl.config.SelectedRun, "Metadata", "Name" } )

    if RunControl.config.ShowRunName and runName and CurrentDeathAreaRoom == nil then
        versionString = runName
    end

    PrintUtil.createOverlayLine( "ModpackVersion", versionString, textConfigTable )
end

function RunControl.UpdateRunData()
    RunControl.CurrentRunData = RunControl.Runs[RunControl.config.SelectedRun] or {}
    for _, modName in ipairs( RunControl.ModIndex ) do
        if ModUtil.Path.Get( modName ) then
            ModUtil.Path.Set( modName .. ".CurrentRunData", RunControl.CurrentRunData )
        end
    end
end

function RunControl.SaveConfig()
    RunControl.Data.config = {}
    for k, v in pairs( RunControl.config ) do
        RunControl.Data.config[k] = v
    end

    for _, modName in ipairs( RunControl.ModIndex ) do
        local modConfig = ModUtil.Path.Get( modName .. ".config" ) or {}

        if not IsEmpty( modConfig ) and modConfig.SaveToRunControl ~= false then -- We don't want to create a Data.config table to save into unless there's something to save
            ModUtil.IndexArray.Set( _G, { modName, "Data", "config" }, {} ) -- Create (or empty) the Data.config table for this mod
            for k, v in pairs( modConfig ) do
                ModUtil.IndexArray.Set( _G, { modName, "Data", "config", k }, v ) -- Copy from <modName>.config (which is not saved) to <modName>.Data.config (which is)
            end
        end
    end
end

function RunControl.LoadConfig()
    if not IsEmpty( ModUtil.Path.Get( "RunControl.Data.config" ) ) then
        for k, v in pairs( RunControl.Data.config ) do
            RunControl.config[k] = v
        end
    end

    for _, modName in ipairs( RunControl.ModIndex ) do
        local savedModConfig = ModUtil.Path.Get( modName .. ".Data.config" ) or {}
        local useSaveData = ModUtil.Path.Get( modName .. ".config.SaveToRunControl" ) -- Allows mods to opt out of the save data system

        if not IsEmpty( savedModConfig ) and useSaveData ~= false then
            for k, v in pairs( savedModConfig ) do
                ModUtil.IndexArray.Set( _G, { modName, "config", k }, v ) -- Copy from <modName>.Data.config (saved data) to <modName>.config (actively used)
            end
        end
    end
end

ModUtil.LoadOnce( function()
    UIData.CurrentRunDepth.X = 1780 -- Change positioning of chamber number indicator to fit better with our UI
    UIData.CurrentRunDepth.Y = 60
    UIData.CurrentRunDepth.TextFormat.ShadowColor = { 0, 0, 0, 0 }
    RunControl.LoadConfig()
    RunControl.UpdateRunData()
end )

OnAnyLoad{ function()
    RunControl.DisplayVersion()
end }

ModUtil.Path.Wrap( "StartRoom", function( baseFunc, currentRun, currentRoom )
    if RunControl.config.ShowChamberNumber then
        ShowDepthCounter()
    end
    baseFunc( currentRun, currentRoom )
end, RunControl )

ModUtil.Path.Wrap("ShowCombatUI", function( baseFunc, flag )
    if RunControl.config.ShowChamberNumber then
        ShowDepthCounter()
    end
    baseFunc( flag )
end, RunControl)

ModUtil.Path.Wrap( "RunClearMessagePresentation", function( baseFunc, screen, message, args )
    message = message or {}
    message.Name = ModUtil.IndexArray.Get( RunControl.Runs, { RunControl.config.SelectedRun, "Metadata", "Name" } ) or "RunControl"
    baseFunc( screen, message, args )
end, RunControl )

ModUtil.Path.Override( "ShowRunClearScreen", function()

	PlaySound({ Name = "/Leftovers/Menu Sounds/AscensionConfirm" })

	RecordRunCleared()

	thread( PlayVoiceLines, HeroVoiceLines.RunClearedVoiceLines )

	ScreenAnchors.RunClear = { Components = {} }
	local screen = ScreenAnchors.RunClear
	screen.Name = "RunClear"

	if IsScreenOpen( screen.Name ) then
		return
	end
	OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
	FreezePlayerUnit()
	EnableShopGamepadCursor()

	ToggleControl({ Names = { "AdvancedTooltip" }, Enabled = false })
	thread( ShowAdvancedTooltip, { DontDuckAudio = true, DisableTooltips = true, HideCloseButton = true, AutoPin = true, } )

	PlaySound({ Name = "/SFX/Menu Sounds/DialoguePanelIn" })

	CreateGroup({ Name = "Combat_Menu_Overlay2" })
	InsertGroupInFront({ Name = "Combat_Menu_Overlay2", DestinationName = "Combat_Menu_Overlay" })

	local components = screen.Components

	components.Blackout = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_UI_Backing", X = ScreenCenterX, Y = ScreenCenterY })
	SetScale({ Id = components.Blackout.Id, Fraction = 10 })
	SetColor({ Id = components.Blackout.Id, Color = Color.Black })
	SetAlpha({ Id = components.Blackout.Id, Fraction = 0 })
	SetAlpha({ Id = components.Blackout.Id, Fraction = 0.6, Duration = 0.5 })

	components.ShopBackground = CreateScreenComponent({ Name = "EndPanelBox", Group = "Combat_Menu_Overlay2", X = ScreenCenterX + 637, Y = ScreenCenterY - 30 })
	for cosmeticName, status in pairs( GameState.Cosmetics ) do
		local cosmeticData = ConditionalItemData[cosmeticName]
		if cosmeticData ~= nil and cosmeticData.RunClearScreenBacking ~= nil then
			SetAnimation({ DestinationId = components.ShopBackground.Id, Name = cosmeticData.RunClearScreenBacking })
			break
		end
	end
	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Group = "Combat_Menu_TraitTray", Scale = 0.7 })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 3, OffsetY = 480 })
	components.CloseButton.OnPressedFunctionName = "CloseRunClearScreen"
	components.CloseButton.ControlHotkey = "Cancel"

	-- Title
	CreateTextBox(MergeTables({ Id = components.ShopBackground.Id,
		Text = "RunClearScreen_Title",
		FontSize = 32,
		Font = "SpectralSCLightTitling",
		OffsetX = -4, OffsetY = -370,
		Color = Color.White,
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 3}, Justification = "Center",
		}, LocalizationData.RunClearScreen.TitleText))

	local messageOffsetX = -255
	local statOffsetX = 100

	local recordTime = GetFastestRunClearTime( CurrentRun )
	local prevRecordShrinePoints = GetHighestShrinePointRunClear()

	local offsetY = -325

	local lineSpacingLarge = 55
	local lineSpacingSmall = 35

	local mainFontSize = 19
	local titleColor = Color.White
	local dataColor = {0.702, 0.620, 0.345, 1.0}
	local newRecordColor = {1.000, 0.894, 0.231, 1.0}

    local originalTime = ModUtil.IndexArray.Get( RunControl.Runs, { RunControl.config.SelectedRun, "Metadata", "OriginalTime" } )

	-- ClearTime
	offsetY = offsetY + lineSpacingLarge
	CreateTextBox({ Id = components.ShopBackground.Id,
		Text = "RunClearScreen_ClearTime",
		FontSize = mainFontSize,
		OffsetX = messageOffsetX, OffsetY = offsetY,
		Color = titleColor,
		Font = "AlegreyaSansSCRegular",
		ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
		Justification = "Left" })
	CreateTextBox({ Id = components.ShopBackground.Id,
		Text = GetTimerString( CurrentRun.GameplayTime, 2 ),
		FontSize = mainFontSize,
		OffsetX = statOffsetX, OffsetY = offsetY,
		Color = dataColor,
		Font = "AlegreyaSansSCExtraBold",
		ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
		Justification = "Right" })
	if not originalTime and CurrentRun.GameplayTime <= recordTime then
		wait(0.03)
		CreateTextBox(MergeTables({ Id = components.ShopBackground.Id,
			Text = "RunClearScreen_NewRecord",
			FontSize = mainFontSize,
			OffsetX = statOffsetX + 20, OffsetY = offsetY,
			Color = newRecordColor,
			Font = "AlegreyaSansSCExtraBold",
			ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
			Justification = "Left" }, LocalizationData.RunClearScreen.NewRecordText))
	end

	wait(0.05)

	offsetY = offsetY + lineSpacingSmall
	-- Record Clear Time/Original Time
    if originalTime then
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = "Original Time:",
            FontSize = mainFontSize,
            OffsetX = messageOffsetX, OffsetY = offsetY,
            Color = titleColor,
            Font = "AlegreyaSansSCRegular",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Left" })
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = originalTime,
            FontSize = mainFontSize,
            OffsetX = statOffsetX, OffsetY = offsetY,
            Color = dataColor,
            Font = "AlegreyaSansSCExtraBold",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Right" })
    else
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = "RunClearScreen_ClearTimeRecord",
            FontSize = mainFontSize,
            OffsetX = messageOffsetX, OffsetY = offsetY,
            Color = titleColor,
            Font = "AlegreyaSansSCRegular",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Left" })
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = GetTimerString( recordTime, 2 ),
            FontSize = mainFontSize,
            OffsetX = statOffsetX, OffsetY = offsetY,
            Color = dataColor,
            Font = "AlegreyaSansSCExtraBold",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Right" })
    end

    local originalHeat = ModUtil.IndexArray.Get( RunControl.Runs, { RunControl.config.SelectedRun, "Metadata", "OriginalHeat" } )

	-- ShrinePoints
	offsetY = offsetY + lineSpacingLarge
	CreateTextBox({ Id = components.ShopBackground.Id,
		Text = "RunClearScreen_ShrinePoints",
		FontSize = mainFontSize,
		OffsetX = messageOffsetX, OffsetY = offsetY,
		Color = titleColor,
		Font = "AlegreyaSansSCRegular",
		ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
		Justification = "Left" })
	CreateTextBox({ Id = components.ShopBackground.Id,
		Text = CurrentRun.ShrinePointsCache,
		FontSize = mainFontSize,
		OffsetX = statOffsetX, OffsetY = offsetY,
		Color = dataColor,
		Font = "AlegreyaSansSCExtraBold",
		ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
		Justification = "Right" })
	if not originalHeat and CurrentRun.ShrinePointsCache > prevRecordShrinePoints then
		wait(0.03)
		CreateTextBox(MergeTables({ Id = components.ShopBackground.Id,
			Text = "RunClearScreen_NewRecord",
			FontSize = mainFontSize,
			OffsetX = statOffsetX + 20, OffsetY = offsetY,
			Color = newRecordColor,
			Font = "AlegreyaSansSCExtraBold",
			ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
			Justification = "Left" }, LocalizationData.RunClearScreen.NewRecordText))
	end

	wait(0.05)

	-- Record ShrinePoints
	offsetY = offsetY + lineSpacingSmall
    if originalHeat then
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = "{!Icons.ShrinePointSmall_Active} Original:",
            FontSize = mainFontSize,
            OffsetX = messageOffsetX, OffsetY = offsetY,
            Color = titleColor,
            Font = "AlegreyaSansSCRegular",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Left" })
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = originalHeat,
            FontSize = mainFontSize,
            OffsetX = statOffsetX, OffsetY = offsetY,
            Color = dataColor,
            Font = "AlegreyaSansSCExtraBold",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Right" })
    else
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = "RunClearScreen_ShrinePointsRecord",
            FontSize = mainFontSize,
            OffsetX = messageOffsetX, OffsetY = offsetY,
            Color = titleColor,
            Font = "AlegreyaSansSCRegular",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Left" })
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = math.max( CurrentRun.ShrinePointsCache, prevRecordShrinePoints ),
            FontSize = mainFontSize,
            OffsetX = statOffsetX, OffsetY = offsetY,
            Color = dataColor,
            Font = "AlegreyaSansSCExtraBold",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Right" })
    end

	wait(0.03)

	-- Weapon Clears
	offsetY = offsetY + 90

	local columnHeaders =
	{
		{ OffsetX = 0, Text = "RunClearScreen_Header_Weapon", Justification = "Left", },
		{ OffsetX = 254, Text = "RunClearScreen_Header_Clears", Justification = "Right", },
		{ OffsetX = 384, Text = "RunClearScreen_Header_RecordClearTime", Justification = "Right", },
		{ OffsetX = 496, Text = "RunClearScreen_Header_RecordShrinePoints", Justification = "Right", },
	}

	for k, header in ipairs( columnHeaders ) do
		CreateTextBox(MergeTables({ Id = components.ShopBackground.Id,
				Text = header.Text,
				FontSize = mainFontSize,
				OffsetX = messageOffsetX + header.OffsetX, OffsetY = offsetY,
				Color = Color.White,
				Font = "AlegreyaSansSCExtraBold",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = header.Justification }, LocalizationData.RunClearScreen.ColumnHeader))
	end

	offsetY = offsetY + lineSpacingLarge
	wait(0.05)

	for k, weaponName in ipairs( WeaponSets.HeroMeleeWeapons ) do

		local weaponNameFont = "AlegreyaSansSCRegular"
		if CurrentRun.Hero.Weapons[weaponName] then
			-- Currently used weapon
			weaponNameFont = "AlegreyaSansSCExtraBold"
		end

		local weaponText = weaponName
		if not IsWeaponUnlocked( weaponName ) then
			weaponText = "MysteryUpgrade"
		end

		CreateTextBox(MergeTables({ Id = components.ShopBackground.Id,
			Text = weaponText,
			FontSize = mainFontSize,
			OffsetX = messageOffsetX + columnHeaders[1].OffsetX, OffsetY = offsetY,
			Color = {0.569, 0.557, 0.533, 1.0},
			Font = weaponNameFont,
			ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
			Justification = columnHeaders[1].Justification }, LocalizationData.RunClearScreen.WeaponText))

		local weaponClears = GetNumRunsClearedWithWeapon( weaponName )
		CreateTextBox(MergeTables({ Id = components.ShopBackground.Id,
			Text = weaponClears,
			FontSize = mainFontSize,
			OffsetX = messageOffsetX + columnHeaders[2].OffsetX, OffsetY = offsetY,
			Color = dataColor,
			Font = "AlegreyaSansSCExtraBold",
			ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
			Justification = columnHeaders[2].Justification }, LocalizationData.RunClearScreen.WeaponText))

		local weaponTime = GetFastestRunClearTimeWithWeapon( CurrentRun, weaponName )
		if weaponTime ~= nil then
			CreateTextBox(MergeTables({ Id = components.ShopBackground.Id,
				Text = GetTimerString( weaponTime, 2 ),
				FontSize = mainFontSize,
				OffsetX = messageOffsetX + columnHeaders[3].OffsetX, OffsetY = offsetY,
				Color = dataColor,
				Font = "AlegreyaSansSCExtraBold",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = columnHeaders[3].Justification }, LocalizationData.RunClearScreen.WeaponText))
		end

		local weaponShrinePoints = GetHighestShrinePointRunClearWithWeapon( CurrentRun, weaponName )
		if weaponShrinePoints > 0 then
			CreateTextBox(MergeTables({ Id = components.ShopBackground.Id,
				Text = weaponShrinePoints,
				FontSize = mainFontSize,
				OffsetX = messageOffsetX + columnHeaders[4].OffsetX - 10, OffsetY = offsetY,
				Color = dataColor,
				Font = "AlegreyaSansSCExtraBold",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = columnHeaders[4].Justification }, LocalizationData.RunClearScreen.WeaponText))
			end

		offsetY = offsetY + ( lineSpacingSmall * 1.1 )
		wait(0.03)

	end

	wait(0.05)

    local selectedRun = ModUtil.Path.Get( "RunControl.config.SelectedRun" ) or "None"
    local clearsOnThisSeed = 0
    if selectedRun ~= "None" then
        clearsOnThisSeed = ( ModUtil.IndexArray.Get( RunControl.Data, { "RunHistory", selectedRun, "Clears" } ) or 0 ) + 1
        ModUtil.IndexArray.Set( RunControl.Data, { "RunHistory", selectedRun, "Clears" }, clearsOnThisSeed )
    end

	-- Total Clears
	offsetY = offsetY + 67
	CreateTextBox({ Id = components.ShopBackground.Id,
		Text = "RunClearScreen_TotalClears",
		FontSize = mainFontSize,
		OffsetX = messageOffsetX, OffsetY = offsetY,
		Color = titleColor,
		Font = "AlegreyaSansSCRegular",
		ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
		Justification = "Left" })
	CreateTextBox({ Id = components.ShopBackground.Id,
		Text = GameState.TimesCleared,
		FontSize = mainFontSize,
		OffsetX = statOffsetX, OffsetY = offsetY,
		Color = dataColor,
		Font = "AlegreyaSansSCExtraBold",
		ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
		Justification = "Right" })

	-- Clears on this seed
	offsetY = offsetY + lineSpacingSmall
    if selectedRun == "None" then
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = "No Run Selected",
            FontSize = mainFontSize,
            OffsetX = messageOffsetX, OffsetY = offsetY,
            Color = titleColor,
            Font = "AlegreyaSansSCRegular",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Left"
        })
    else
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = "Run Clears:",
            FontSize = mainFontSize,
            OffsetX = messageOffsetX, OffsetY = offsetY,
            Color = titleColor,
            Font = "AlegreyaSansSCRegular",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Left"
        })
        CreateTextBox({ Id = components.ShopBackground.Id,
            Text = clearsOnThisSeed,
            FontSize = mainFontSize,
            OffsetX = statOffsetX, OffsetY = offsetY,
            Color = dataColor,
            Font = "AlegreyaSansSCExtraBold",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Right"
        })
    end

	wait(0.05)

	-- Clear Message
	RunClearMessagePresentation( screen, message )

	HandleScreenInput( screen )

end, RunControl )

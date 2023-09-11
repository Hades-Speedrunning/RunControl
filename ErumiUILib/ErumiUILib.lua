ModUtil.Mod.Register("ErumiUILib")
ErumiUILib = {
    Slider = {},
    Dropdown = {},
    RadialMenu = {},
    Keyboard = {},
    Textbox = {},
    SubScreen = {
        OpenScreens = {}
    },
    ScrollingList = {},
    Misc = {}
}
--[[TODO:
On-screen Keyboard for text fields:
Modifibale size
Able to disable input when opened or not (and then reenable if it disabled it)
Magic's Double Click Lib (will be added very soon)
With OSK an entire lua side debug menu ex: a cheat menu, text-based commands for dialogue???? custom viewing (Very iffy)
Radial Menus (Menu only, overlays later as that could be confusing with input handling)
Slider dragging: Sliding turned on when clicked, follows mouse until mouse clicked again to turn mouse follow off
Creating Sub-menus that dont re-enable input on close, effectively making in menu pop-up systems
]]--
--#region Misc
local buttonDoublePressedTime = setmetatable( { }, { __mode = "k" } )
local buttonDoublePressedId = function( button ) return "ButtonDoublePressed" .. tostring( button ) end
function ErumiUILib.Misc.NewButtonDoublePressedHandler( onPressedFunction, onSinglePressedFunction, onDoublePressedFunction, timeInterval )
    return function ( screen, button, ... )
      local pressedTime = buttonDoublePressedTime[ button ]
      if pressedTime and _screenTime - pressedTime < timeInterval then
        killTaggedThreads( buttonDoublePressedId( button ) )
        buttonDoublePressedTime[ button ] = nil
        return onDoublePressedFunction( screen, button, ... ) -- button was double clicked
      end
      thread( function( )
        waitScreenTime( timeInterval, buttonDoublePressedId( button ) )
        onSinglePressedFunction( screen, button ) -- button was clicked ( and was never double clicked )
      end, buttonDoublePressedId( button ) )
      buttonDoublePressedTime[ button ] = _screenTime
      return onPressedFunction( screen, button, ... ) -- button was clicked ( initial )
    end
  end
--#endregion

--#region Sliders

SliderFunctionValues = {
    --[[Example item
    [sliderId] = {
        lastIndex = any int,
        ["AlwaysUpdate"] = {
            {
                eventIndex = blah, --Not needed
                FunctionName ="Blah Blah always 1"
                args = {}
            }
            {
                eventIndex = blah, --Not needed
                FunctionName ="Blah Blah always 2 now with args"
                args = {Blah = Blah Blah}
            }
        }
        ["onPass"] = {
            {
                eventIndex = "2",
                FunctionName ="Blah Blah when going past 2"
                args = {}
            }
        }
        ["exactResting"] = {
            {
                eventIndex = "57",
                FunctionName = "Blah Blah at exactly 57"
                args = {}
            }
            {
                eventIndex = "50:60",
                FunctionName = "Blah Blah inbetween 50 and 60"
                args = {Blah = Blah Blah}
            }
        }
    }
    All entries are optional:
        "AlwaysUpdate" option will run the function everytime the slider is updated
        "onPass" option is if the slider would go past it, instead of resting on it
        eventIndex is when slider goes on that value do something
        Not having something in onPass means that the option would have to be specifically selected
        X:Y is if the resting point is greater then or equal to X and less then or equal to Y (cant be put in onPass).
            X must ALWAYS be less then then Y
        Functions are always passed the sliders currentValue and the args of the event, only valid function sytax is:
            function myFunction(currentValue, args)
            currentValue is the buttonIndex, not the percentage
        The variables can be named differently, of course
    ]]--
}
SaveIgnores["SliderFunctionValues"] = true

function ErumiUILib.Slider.BaseClickFunc(screen, button)
end
function ErumiUILib.Slider.SinglePressFunc(screen, button)
     ErumiUILib.Slider.UpdatePercentage(screen, button) 
end
function ErumiUILib.Slider.DoublePressFunc(screen, button) 
    button.ParentSlider.isDragging = not button.ParentSlider.isDragging
    ErumiUILib.Slider.UpdatePercentage(screen, button) 
end
ErumiUILib.Slider.OnPressedFunction = ErumiUILib.Misc.NewButtonDoublePressedHandler(ErumiUILib.Slider.BaseClickFunc,ErumiUILib.Slider.SinglePressFunc,ErumiUILib.Slider.DoublePressFunc, 0.2)

function ErumiUILib.Slider.CreateSlider(screen, args)
  	local xPos = (args.X or 0)
    local yPos = (args.Y or 0)
    local components = screen.Components
    local Name = (args.Name or "UnnamedSlider")
    if args.ShowSlider then
        components[Name .. "SliderImage"] = CreateScreenComponent({ Name = args.Image, Group = args.Group .. "SliderImage", Scale = 1, X = (args.X or 0) + 65 + (args.SliderOffsetX or 0), Y = (args.Y or 0) })
        --SetAnimation({ Name = "KeepsakeBarFill", DestinationId = components[Name .. "SliderImage"].Id, Scale = 1 })
        SetAnimationFrameTarget({ Name = args.Image, Fraction = args.StartingFraction or 1, DestinationId = components[Name .. "SliderImage"].Id, Instant = true})
        SetScaleX({ Id = components[Name .. "SliderImage"].Id , Fraction = (args.Scale.ImageX or 1)  })
        SetScaleY({ Id = components[Name .. "SliderImage"].Id , Fraction = (args.Scale.ImageY or 1) })
        if args.Color then
          SetColor({ Id = components[Name .. "SliderImage"].Id , Color = args.Color })
        end
        SliderFunctionValues[components[Name .. "SliderImage"].Id] = {lastIndex = args.StartingFraction * args.ItemAmount}
        components[Name .. "SliderImage"].Children = {}
        components[Name .. "SliderImage"].isDragging = false
        components[Name .. "SliderImage"].screen = screen
        components[Name .. "SliderImage"].isSliderImage = true
        AttachLua({ Id = components[Name .. "SliderImage"].Id, Table = components[Name .. "SliderImage"] })
    end
    for buttonIndex = 1, (args.ItemAmount or 1) do
		components[Name .. "Button" .. buttonIndex] = CreateScreenComponent({ Name = "BoonSlot1", Group = args.Group, Scale = 1, X = xPos, Y = yPos })

        local a = ((buttonIndex - 0.5) / (args.ItemAmount or 1))
        local c = ((args.ItemWidth or 1) / 2)
        local d = ((args.ItemWidth or 1) * (args.ItemAmount or 1))
        components[Name .. "Button" .. buttonIndex].pressedArgs = {sliderPercent = a + ( c / d), name = Name, buttonIndex = buttonIndex, Image = args.Image}

        SetScaleX({ Id = components[Name .. "Button" .. buttonIndex].Id , Fraction = (args.Scale.ButtonsX or 1) * 1.2 })
    		SetScaleY({ Id = components[Name .. "Button" .. buttonIndex].Id , Fraction = (args.Scale.ButtonsY or 1) * 0.8 })
        xPos = xPos + args.ItemWidth
        if args.ShowSlider then
            components[Name .. "SliderImage"].Children[Name .. "Button" .. buttonIndex] = components[Name .. "Button" .. buttonIndex]
            components[Name .. "Button" .. buttonIndex].ParentSlider = components[Name .. "SliderImage"]
            components[Name .. "Button" .. buttonIndex].OnPressedFunctionName = "ErumiUILib.Slider.OnPressedFunction"
            components[Name .. "Button" .. buttonIndex].OnMouseOverFunctionName = "ErumiUILibSliderButtonHoverOn"
            components[Name .. "Button" .. buttonIndex].OnMouseOffFunctionName = "ErumiUILibSliderButtonHoverOff"
        end
        AttachLua({ Id = components[Name .. "Button" .. buttonIndex].Id, Table = components[Name .. "Button" .. buttonIndex] })
    end
    if args.ShowSlider then
        return components[Name .. "SliderImage"]
    end
    return -1
end
function ErumiUILib.Slider.UpdatePercentage(screen, button)
    local components = screen.Components
    SetAnimationFrameTarget({ Name = button.pressedArgs.Image, Fraction = button.pressedArgs.sliderPercent, DestinationId = button.ParentSlider.Id, Instant = true})
    local sliderId = components[button.pressedArgs.name .. "SliderImage"].Id
    if SliderFunctionValues[sliderId]["AlwaysUpdate"] ~= nil then
        for k,v in ipairs(SliderFunctionValues[sliderId]["AlwaysUpdate"]) do
            thread(v.Function,{index = button.pressedArgs.buttonIndex, percentage =  button.pressedArgs.sliderPercent}, v.args, v.Slider)
        end
    end
    if SliderFunctionValues[sliderId]["onPass"] ~= nil then
        local lastIndex = SliderFunctionValues[sliderId].lastIndex
        for k,v in ipairs(SliderFunctionValues[sliderId]["onPass"]) do
            if lastIndex > button.pressedArgs.buttonIndex then
                if tonumber(v.eventIndex) >= button.pressedArgs.buttonIndex and tonumber(v.eventIndex) <= lastIndex then
                    thread(v.Function,{index = button.pressedArgs.buttonIndex, percentage =  button.pressedArgs.sliderPercent}, v.args, v.Slider)
                end
            elseif lastIndex < button.pressedArgs.buttonIndex then
                if tonumber(v.eventIndex) <= button.pressedArgs.buttonIndex and tonumber(v.eventIndex) >= lastIndex then
                    thread(v.Function,{index = button.pressedArgs.buttonIndex, percentage =  button.pressedArgs.sliderPercent}, v.args, v.Slider)
                end
            end
        end
    end
    if SliderFunctionValues[sliderId]["exactResting"] ~= nil then
        for k,v in ipairs(SliderFunctionValues[sliderId]["exactResting"]) do
            if string.find(v.eventIndex, ":") then
                local splitStr = ErumiUILib.mysplit(v.eventIndex, ":")
                if button.pressedArgs.buttonIndex > tonumber(splitStr[1]) and button.pressedArgs.buttonIndex < tonumber(splitStr[2]) then
                    thread(v.Function,{index = button.pressedArgs.buttonIndex, percentage =  button.pressedArgs.sliderPercent}, v.args, v.Slider)
                end
            elseif button.pressedArgs.buttonIndex == tonumber(v.eventIndex) then
                thread(v.Function,{index = button.pressedArgs.buttonIndex, percentage =  button.pressedArgs.sliderPercent}, v.args, v.Slider)
            end
        end
    end
    SliderFunctionValues[sliderId].lastIndex = button.pressedArgs.buttonIndex

end
function ErumiUILibSliderButtonHoverOn(button)
    if button.ParentSlider ~= nil then
        if button.ParentSlider.isDragging then        
            killTaggedThreads( "WaitForSliderSlideDisable" )
            ErumiUILib.Slider.UpdatePercentage(button.ParentSlider.screen, button)
        end
    end
end
function ErumiUILibSliderButtonHoverOff(button)
    if button.ParentSlider ~= nil then
        if button.ParentSlider.isDragging then        
            waitScreenTime( 0.05, "WaitForSliderSlideDisable" )
            button.ParentSlider.isDragging = false
        end
    end
end
--[[Args should be
{
    AlwaysUpdate = true/false (default f)
    onPass = true/false (If both onPass and AlwaysUpdate are true, AlwaysUpdate will take priority) (default f)
    eventIndex = any string (this is when the event should occur) (default -1)
    sliderEvent = any string (the Function Name) (if nil this func will not do anything and imemdiatly stop )
    sliderEventArgs = any table (default empty Table)
}
]]
function ErumiUILib.Slider.CreateListener(slider, args)
    if args.sliderEvent == nil then
        return
    end
    local sliderId = slider.Id
    local isAlways = args.AlwaysUpdate
    local isOnPass = args.onPass
    local eventIndex = args.eventIndex
    local sliderEvent = args.sliderEvent
    local sliderEventArgs = args.sliderEventArgs
    local eventTable = {
        eventIndex = eventIndex,
        Function = sliderEvent,
        args = sliderEventArgs,
        slider = slider
    }

    if isAlways then
        if SliderFunctionValues[sliderId]["AlwaysUpdate"] == nil then
            SliderFunctionValues[sliderId]["AlwaysUpdate"] = {}
        end
        table.insert(SliderFunctionValues[sliderId]["AlwaysUpdate"], eventTable)
    elseif isOnPass then
        if SliderFunctionValues[sliderId]["onPass"] == nil then
            SliderFunctionValues[sliderId]["onPass"] = {}
        end
        table.insert(SliderFunctionValues[sliderId]["onPass"], eventTable)
    else
        if SliderFunctionValues[sliderId]["exactResting"] == nil then
            SliderFunctionValues[sliderId]["exactResting"] = {}
        end
        table.insert(SliderFunctionValues[sliderId]["exactResting"], eventTable)
        --SliderFunctionValues[sliderId][eventIndex] = eventTable
    end
end
function ErumiUILib.Slider.Destroy(slider)
    for _,v in pairs(slider.Children) do
        Destroy({Id = v.Id})
    end
    SliderFunctionValues[slider.Id] = nil
    Destroy({Id = slider.Id})
end
function ErumiUILib.Slider.mysplit (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end
--#endregion

--#region Dropdowns
function ErumiUILib.Dropdown.CreateDropdown(screen, args)
  	local xPos = (args.X or 0)
    local yPos = (args.Y or 0)
    local components = screen.Components
    local Name = (args.Name or "UnnamedDropdown")
    --Create base default text and backingKey
    local dropDownTopBackingKey = Name .. "BaseBacking"
    components[dropDownTopBackingKey] = CreateScreenComponent({ Name = "MarketSlot", Group = args.Group, Scale = 1, X = xPos, Y = yPos })

    SetScaleY({ Id = components[dropDownTopBackingKey].Id , Fraction = args.Scale.Y or 1 })
    SetScaleX({ Id = components[dropDownTopBackingKey].Id , Fraction = args.Scale.X or 1 })

    components[dropDownTopBackingKey].OnPressedFunctionName = "ErumiUILibToggleDropdown"
    components[dropDownTopBackingKey].dropDownPressedArgs = args
    components[dropDownTopBackingKey].isExpanded = false
    components[dropDownTopBackingKey].isEnabled = true
    components[dropDownTopBackingKey].Children = {}

    components[dropDownTopBackingKey].currentItem = args.Items.Default
    components[dropDownTopBackingKey].screen = screen

    ErumiUILib.Dropdown.UpdateBaseText(screen, components[dropDownTopBackingKey])

    if args.Items.Default.event ~= nil then
        args.Items.Default.event(components[dropDownTopBackingKey])
    end
    return components[dropDownTopBackingKey]
end

function ErumiUILibToggleDropdown(screen, button)
    if not button.isEnabled then
      return
    end
    button.isExpanded = not button.isExpanded
    if button.isExpanded then
        ErumiUILib.Dropdown.Expand(screen, button)
    else
        ErumiUILib.Dropdown.Collapse(screen, button)
    end
end
function ErumiUILib.Dropdown.Expand(screen, button)
    local args = button.dropDownPressedArgs
    local components = screen.Components
    ModifyTextBox({Id = components[args.Name .. "BaseTextbox"].Id, Color = {1, 1, 1, 0.2}})
    for k,v in pairs(args.Items) do
        if k ~= "Default" then
            local dropDownItemBackingKey = args.Name .. "DropdownBacking" .. k
            local ySpaceAmount = 102* k * args.Scale.Y + (args.Padding.Y * k)
            components[dropDownItemBackingKey] = CreateScreenComponent({ Name = "MarketSlot", Group = args.Group .. "Dropdown", Scale = 1, X = (args.X or 0), Y = (args.Y or 0) + ySpaceAmount})
            components[dropDownItemBackingKey].dropDownPressedArgs = {Args = args, parent = button, Index = k}
            components[dropDownItemBackingKey].OnPressedFunctionName = "ErumiUILibDropdownButtonPressed"

            SetScaleY({ Id = components[dropDownItemBackingKey].Id , Fraction = args.Scale.Y or 1 })
            SetScaleX({ Id = components[dropDownItemBackingKey].Id , Fraction = args.Scale.X or 1 })
            local offsetX = (args.GeneralOffset or {X = 0}).X
            if v.Offset ~= nil then
                offsetX = v.Offset.X
            end
            local offsetY = (args.GeneralOffset or {Y = 0}).Y
            if v.Offset ~= nil then
                offsetY = v.Offset.Y
            end
            local textColor = Color.White
            if v.IsEnabled == false then
                textColor = {255, 255, 255, .2}
                components[dropDownItemBackingKey].OnPressedFunctionName = nil
                textColor = {1, 1, 1, 0.2}
            end
            CreateTextBox({ Id = components[dropDownItemBackingKey].Id, Text = v.Text,
                FontSize = v.FontSize or args.GeneralFontSize,
                OffsetX = offsetX, OffsetY = offsetY,
                Width = 665,
                Justification = (v.Justification or args.Justification) or "Center",
                VerticalJustification = (v.VerticalJustification or args.VerticalJustification) or "Center",
                LineSpacingBottom = 8,
                Font = (v.Font or args.Font) or "AlegreyaSansSCBold",
                Color = textColor,
                ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                TextSymbolScale = 0.8,
        })
        button.Children[dropDownItemBackingKey] = components[dropDownItemBackingKey]
        end
    end
end
function ErumiUILibDropdownButtonPressed(screen, button)
    local args = button.dropDownPressedArgs.Args
    local components = screen.Components
    local itemToSwapTo = args.Items[button.dropDownPressedArgs.Index]
    local parentButton = button.dropDownPressedArgs.parent

    parentButton.isExpanded = not parentButton.isExpanded
    parentButton.currentItem = itemToSwapTo

    ErumiUILib.Dropdown.UpdateBaseText(screen, parentButton)
    ErumiUILib.Dropdown.Collapse(screen, parentButton)

    if itemToSwapTo.event ~= nil then
        itemToSwapTo.event(parentButton, itemToSwapTo)
    elseif args.GeneralEvent ~= nil then
        args.GeneralEvent(parentButton, itemToSwapTo)
    end
end
function ErumiUILib.Dropdown.Collapse(screen, button)
    local components = screen.Components
    for k,v in pairs(components) do
        if string.find(k, button.dropDownPressedArgs.Name .. "DropdownBacking") then
            Destroy({Id = v.Id})
        end
    end
    ModifyTextBox({ Id = components[button.dropDownPressedArgs.Name .. "BaseTextbox"].Id, Color = {1, 1, 1, 1}})
end
function ErumiUILib.Dropdown.UpdateBaseText(screen, dropdown)
    local args = dropdown.dropDownPressedArgs
    local components = screen.Components
    local itemToSwapTo = dropdown.currentItem

    local offsetX = (args.GeneralOffset or {X = 0}).X
    if itemToSwapTo.Offset ~= nil then
        offsetX = itemToSwapTo.Offset.X
    end
    local offsetY = (args.GeneralOffset or {Y = 0}).Y
    if itemToSwapTo.Offset ~= nil then
        offsetY = itemToSwapTo.Offset.Y
    end

    local textboxContainerName = args.Name .. "BaseTextbox"
    local textboxContainer = components[textboxContainerName]
    if textboxContainer == nil then
      textboxContainer = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = args.X or 0, Y = args.Y or 0})
      SetScaleY({ Id = textboxContainer.Id , Fraction = args.Scale.Y or 1 })
      SetScaleX({ Id = textboxContainer.Id , Fraction = args.Scale.X or 1 })
      CreateTextBox({ Id = textboxContainer.Id, Text = itemToSwapTo.Text,
          FontSize = itemToSwapTo.FontSize or args.GeneralFontSize,
          OffsetX = offsetX, OffsetY = offsetY,
          Width = 665,
          Justification = (itemToSwapTo.Justification or args.Justification) or "Center",
          VerticalJustification = (itemToSwapTo.VerticalJustification or args.VerticalJustification) or "Center",
          LineSpacingBottom = 8,
          Font = (itemToSwapTo.Font or args.Font) or "AlegreyaSansSCBold",
          ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
          TextSymbolScale = 0.8,
      })
    else
      ModifyTextBox({ Id = textboxContainer.Id, Text = itemToSwapTo.Text, Color = {1, 1, 1, 1}})
    end
    components[textboxContainerName] = textboxContainer
end
function ErumiUILib.Dropdown.GetValue(dropdown)
    return dropdown.currentItem
end
function ErumiUILib.Dropdown.SetValue(dropdown, value)
    local itemToSet = nil
    local items = dropdown.dropDownPressedArgs.Items
    if type(value) == "number" then
        if value ~= -1 then
            itemToSet = items[value]
        else
            itemToSet = items.Default
        end
    elseif type(value) == "string" then
        for k,v in pairs(items) do
            if v.Text == value then
                itemToSet = v
                break
            end
        end
    end
    if itemToSet ~= nil then
        dropdown.currentItem = itemToSet
        ErumiUILib.Dropdown.UpdateBaseText(dropdown.screen, dropdown)
    end
end
function ErumiUILib.Dropdown.GetEntries(dropdown)
    local returnItems = {}
    for k,v in pairs(dropdown.dropDownPressedArgs.Items)do
        if v.IsEnabled == true or v.IsEnabled == nil then
            table.insert(returnItems, v)
        end
    end
    return returnItems
end
function ErumiUILib.Dropdown.NewEntry(dropdown, value)
    table.insert(dropdown.dropDownPressedArgs.Items, value)
    local screen = dropdown.screen
    if dropdown.isExpanded then
        ErumiUILib.Dropdown.Collapse(screen, dropdown)
        ErumiUILib.Dropdown.Expand(screen, dropdown)
    end
end
function ErumiUILib.Dropdown.DelEntry(dropdown, value)
    local itemToRemove = nil
    local itemToRemoveIndex = nil
    local items = dropdown.dropDownPressedArgs.Items
    if type(value) == "number" then
        if value > 0 then
            itemToRemove = items[value]
            itemToRemoveIndex = value
        end
    elseif type(value) == "string" then
        for k,v in pairs(items) do
            if v.Text == value then
                itemToRemove = v
                itemToRemoveIndex = k
                break
            end
        end
    end
    if itemToRemove ~= nil and itemToRemove ~= dropdown.currentItem then
        table.remove(dropdown.dropDownPressedArgs.Items, itemToRemoveIndex)
        local screen = dropdown.screen
        if dropdown.isExpanded then
            ErumiUILib.Dropdown.Collapse(screen, dropdown)
            ErumiUILib.Dropdown.Expand(screen, dropdown)
        end
    end
end
function ErumiUILib.Dropdown.DisableEntry(dropdown, value)
    local itemToDisable = nil
    local itemToDisableIndex = nil
    local items = dropdown.dropDownPressedArgs.Items
    if type(value) == "number" then
        if value > 0 then
            itemToDisable = items[value]
            itemToDisableIndex = value
        end
    elseif type(value) == "string" then
        for k,v in pairs(items) do
            if v.Text == value then
                itemToDisable = v
                itemToDisableIndex = k
                break
            end
        end
    end
    if itemToDisable ~= nil and itemToDisable ~= dropdown.currentItem then
        items[itemToDisableIndex].IsEnabled = false
        local screen = dropdown.screen
        if dropdown.isExpanded then
            ErumiUILib.Dropdown.Collapse(screen, dropdown)
            ErumiUILib.Dropdown.Expand(screen, dropdown)
        end
    end
end
function ErumiUILib.Dropdown.EnableEntry(dropdown, value)
    local itemToDisable = nil
    local itemToDisableIndex = nil
    local items = dropdown.dropDownPressedArgs.Items
    if type(value) == "number" then
        if value > 0 then
            itemToDisable = items[value]
            itemToDisableIndex = value
        end
    elseif type(value) == "string" then
        for k,v in pairs(items) do
            if v.Text == value then
                itemToDisable = v
                itemToDisableIndex = k
                break
            end
        end
    end
    if itemToDisable ~= nil and itemToDisable ~= dropdown.currentItem then
        items[itemToDisableIndex].IsEnabled = true
        local screen = dropdown.screen
        if dropdown.isExpanded then
            ErumiUILib.Dropdown.Collapse(screen, dropdown)
            ErumiUILib.Dropdown.Expand(screen, dropdown)
        end
    end
end
function ErumiUILib.Dropdown.EnableDropdown(dropdown)
    dropdown.isEnabled = false
    ModifyTextBox({ Id = dropdown.Id, Color = {1, 1, 1, 1}})
end
function ErumiUILib.Dropdown.DisableDropdown(dropdown)
    dropdown.isEnabled = true
    ModifyTextBox({ Id = dropdown.Id, Color = {1, 1, 1, 0.2}})
end
function ErumiUILib.Dropdown.Destroy(dropdown)
    local components = dropdown.screen.components
    for _,v in pairs(dropdown.Children) do
        if components[v.Id] ~= nil then
            Destroy({Id = v.Id})
        end
    end
    Destroy({Id = dropdown.Id})
end
--#endregion

--#region Radial Menus

function ErumiUILib.RadialMenu.CreateMenu(screen, args)
	local xPos = (args.X or 0)
    local yPos = (args.Y or 0)
    local components = screen.Components
    local Name = (args.Name or "UnnamedRadialMenu")
    components[Name .. "RadialCenter"] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = xPos, Y = yPos })
    components[Name .. "RadialCenter"].args = args
    components[Name .. "RadialCenter"].screen = screen
    components[Name .. "RadialCenter"].Children = {}
    components[Name .. "RadialCenter"].IsExpanded = false
    return components[Name .. "RadialCenter"]
end
function ErumiUILibRadialMenuClickRadialButton(screen, button)
    if button.RadialMenuPressedArgs.buttonData.Event ~= nil then
        button.RadialMenuPressedArgs.buttonData.Event(button.RadialMenuPressedArgs.parent, button.RadialMenuPressedArgs.buttonData)
    elseif button.RadialMenuPressedArgs.parent.args.GeneralEvent ~= nil then
        button.RadialMenuPressedArgs.parent.args.GeneralEvent(button.RadialMenuPressedArgs.parent, button.RadialMenuPressedArgs.buttonData)
    end
end
function ErumiUILib.RadialMenu.Expand(radialMenu, ignoreTime)
    if radialMenu.IsExpanded == true then
        return
    end
    radialMenu.IsExpanded = true
    local args = radialMenu.args
    local xPos = (args.X or 0)
    local yPos = (args.Y or 0)
    local Name = (args.Name or "UnnamedRadialMenu")
    local currentAngle = args.StartingAngle
    local angleIncrement = (args.MaxAngle - args.StartingAngle) / #args.Items
    local args = radialMenu.args
    local components = radialMenu.screen.Components
    for k,v in ipairs(args.Items)do
        local a = (currentAngle - 90) * (math.pi / 180)
        local curXPos = xPos + args.Radius * math.cos(a)
        local curYPos = yPos + args.Radius * math.sin(a)
        if ignoreTime then
            components[Name .. "Button" .. k] = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = args.Group,  X = curXPos, Y = curYPos})
            components[Name .. "ButtonImageBack" .. k] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = curXPos, Y = curYPos })
            components[Name .. "ButtonImage" .. k] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = curXPos, Y = curYPos })
        else
            components[Name .. "Button" .. k] = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = args.Group,  X = xPos, Y = yPos})
            components[Name .. "ButtonImageBack" .. k] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = xPos, Y = yPos })
            components[Name .. "ButtonImage" .. k] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = xPos, Y = yPos })
        end

        components[Name .. "Button" .. k].OnPressedFunctionName = "ErumiUILibRadialMenuClickRadialButton"
        components[Name .. "Button" .. k].RadialMenuPressedArgs = {parent = components[Name .. "RadialCenter"], buttonData = v, Button = components[Name .. "Button" .. k]}
        AttachLua({ Id = components[Name .. "Button" .. k].Id, Table = components[Name .. "Button" .. k] })

        SetAnimation({ Name = "GUI\\Grey_Node", DestinationId = components[Name .. "ButtonImageBack" .. k].Id, Scale = 1 })
        if v.Color ~= nil and args.GeneralColor ~= nil then
            SetColor({ Id = components[Name .. "ButtonImageBack" .. k].Id, Color = v.Color or args.GeneralColor })
        end

        SetAnimation({ Name = v.Image, DestinationId = components[Name .. "ButtonImage" .. k].Id, Scale = 1 })

        SetScaleY({ Id = components[Name .. "Button" .. k].Id , Fraction = args.Scale.Y or 1 })
        SetScaleX({ Id = components[Name .. "Button" .. k].Id , Fraction = args.Scale.X or 1 })

        SetScaleY({ Id = components[Name .. "ButtonImage" .. k].Id , Fraction = v.Scale.Y or 1 })
        SetScaleX({ Id = components[Name .. "ButtonImage" .. k].Id , Fraction = v.Scale.X or 1 })
        if v.IsEnabled == false then
            SetAlpha({ Id = components[Name .. "Button" .. k].Id, Fraction = 0, Duration = 0 })
            SetAlpha({ Id = components[Name .. "ButtonImageBack" .. k].Id, Fraction = 0.2, Duration = 0 })
            SetAlpha({ Id = components[Name .. "ButtonImage" .. k].Id, Fraction = 0.2, Duration = 0 })
            components[Name .. "Button" .. k].OnPressedFunctionName = nil
        end
        if ignoreTime ~= true then
            thread(function ()
                Move({ Ids = { components[Name .. "Button" .. k].Id, components[Name .. "ButtonImageBack" .. k].Id, components[Name .. "ButtonImage" .. k].Id}, OffsetX = curXPos, OffsetY = curYPos, Duration = args.CreationTime })
            end)
        end
        currentAngle = k * angleIncrement
        radialMenu.Children[Name .. "Button" .. k] = components[Name .. "Button" .. k]
        radialMenu.Children[Name .. "ButtonImageBack" .. k] = components[Name .. "ButtonImageBack" .. k]
        radialMenu.Children[Name .. "ButtonImage" .. k] = components[Name .. "ButtonImage" .. k]
    end
end
OnMouseOver{"ButtonClose", function (triggerArgs)
    if triggerArgs.TriggeredByTable ~= nil then
        local pressedArgs = triggerArgs.TriggeredByTable.RadialMenuPressedArgs
        if pressedArgs ~= nil then
            local parentArgs = pressedArgs.parent.args
            local hoveredItemData = pressedArgs.buttonData
            local components = pressedArgs.parent.screen.Components
            local button = pressedArgs.Button
            for k,v in pairs(components) do
                if string.find(k, "CenterTooltipDisplay") or string.find(k, "IndepTooltipDisplay")then
                    Destroy({Id = v.Id})
                end
            end
            if parentArgs.TooltipStyle ~= nil and parentArgs.TooltipStyle.Name == "Independent" and button.IsEnabled ~= true then
                local independentDisplayName = (parentArgs.Name or "UnnamedRadialMenu") .. "IndepTooltipDisplay"
                components[independentDisplayName] = CreateScreenComponent({ Name = "MarketSlot", Group = "Combat_Menu", Scale = 1, X = parentArgs.TooltipStyle.args.X or 0, Y = parentArgs.TooltipStyle.args.Y or 0 })
                SetScaleY({ Id = components[independentDisplayName].Id , Fraction = parentArgs.Scale.Y or 1 })
                SetScaleX({ Id = components[independentDisplayName].Id , Fraction = parentArgs.Scale.X or 1  })

                CreateTextBox({
                    Id = components[independentDisplayName].Id,
                    Text = hoveredItemData.Desc,
                    FontSize =  (parentArgs.TextStyle.FontSize or 20),
                    OffsetX =  (parentArgs.TextStyle.OffsetX or 0), OffsetY =  (parentArgs.TextStyle.DescOffsetY or 0),
                    Width = parentArgs.TextStyle.TextWidth or 1,
                    Color = Color.White,
                    Font = "AlegreyaSansSCBold",
                    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                    Justification = "Left",
                })
                CreateTextBox({ Id = components[independentDisplayName].Id, Text = hoveredItemData.Title,
                    FontSize = (parentArgs.TextStyle.FontSize or 20),
                    OffsetX =  (parentArgs.TextStyle.OffsetX or 0), OffsetY =  (parentArgs.TextStyle.TitleOffsetY or 0),
                    Width = parentArgs.TextStyle.TextWidth or 1,
                    Color = {0.988, 0.792, 0.247, 1},
                    Font = "AlegreyaSansSCBold",
                    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                    Justification = "Left",
                })
            elseif button.IsEnabled ~= true then --Center
                local centerDisplayKey = (parentArgs.Name or "UnnamedRadialMenu") .. "CenterTooltipDisplay"
                components[centerDisplayKey] = CreateScreenComponent({ Name = "MarketSlot", Group = "Combat_Menu", Scale = 1, X = parentArgs.X or 0, Y = parentArgs.Y or 0 })

                SetScaleY({ Id = components[centerDisplayKey].Id , Fraction = parentArgs.Scale.Y or 1 })
                SetScaleX({ Id = components[centerDisplayKey].Id , Fraction = parentArgs.Scale.X or 1  })

                CreateTextBox({
                    Id = components[centerDisplayKey].Id,
                    Text = hoveredItemData.Desc,
                    FontSize =  (parentArgs.TextStyle.FontSize or 20),
                    OffsetX =  (parentArgs.TextStyle.OffsetX or 0), OffsetY =  (parentArgs.TextStyle.DescOffsetY or 0),
                    Width = parentArgs.TextStyle.TextWidth or 1,
                    Color = Color.White,
                    Font = "AlegreyaSansSCBold",
                    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                    Justification = "Left",
                })
                CreateTextBox({ Id = components[centerDisplayKey].Id, Text = hoveredItemData.Title,
                    FontSize = (parentArgs.TextStyle.FontSize or 20),
                    OffsetX =  (parentArgs.TextStyle.OffsetX or 0), OffsetY =  (parentArgs.TextStyle.TitleOffsetY or 0),
                    Width = parentArgs.TextStyle.TextWidth or 1,
                    Color = {0.988, 0.792, 0.247, 1},
                    Font = "AlegreyaSansSCBold",
                    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                    Justification = "Left",
                })
            end
        end
    end
end}
function ErumiUILib.RadialMenu.Collapse( radialMenu, ignoreTime)
    radialMenu.IsExpanded = false
    local args = radialMenu.args
    local xPos = (args.X or 0)
    local yPos = (args.Y or 0)
    local Name = (args.Name or "UnnamedRadialMenu")
    local components = radialMenu.screen.Components
    local waitTime = args.CreationTime
    if ignoreTime then
        waitTime = 0
    end
    for k,v in ipairs(args.Items)do
        if ignoreTime then
            if components[Name .. "Button" .. k] ~= nil then
                Destroy({Ids = { components[Name .. "Button" .. k].Id, components[Name .. "ButtonImageBack" .. k].Id, components[Name .. "ButtonImage" .. k].Id}})
            end
            if components[Name  .. "IndepTooltipDisplay"] ~= nil then
                Destroy({Ids = { components[Name  .. "IndepTooltipDisplay"].Id}})
            end
            if components[Name  .. "CenterTooltipDisplay"] ~= nil then
                Destroy({Ids = { components[Name  .. "CenterTooltipDisplay"].Id}})
            end
        else
            thread(function ()
                if components[Name .. "Button" .. k] ~= nil then
                    if components[Name  .. "IndepTooltipDisplay"] ~= nil then
                        Destroy({Ids = { components[Name  .. "IndepTooltipDisplay"].Id}})
                    end
                    if components[Name  .. "CenterTooltipDisplay"] ~= nil then
                        Destroy({Ids = { components[Name  .. "CenterTooltipDisplay"].Id}})
                    end
                    Move({ Ids = { components[Name .. "Button" .. k].Id, components[Name .. "ButtonImageBack" .. k].Id, components[Name .. "ButtonImage" .. k].Id}, OffsetX = xPos, OffsetY = yPos, Duration = waitTime })
                    wait(waitTime)
                    Destroy({Ids = { components[Name .. "Button" .. k].Id, components[Name .. "ButtonImageBack" .. k].Id, components[Name .. "ButtonImage" .. k].Id}})
                end
            end)
        end
        radialMenu.Children[Name .. "Button" .. k] = nil
        radialMenu.Children[Name .. "ButtonImageBack" .. k] = nil
        radialMenu.Children[Name .. "ButtonImage" .. k] = nil
    end
end
--[[
function ErumiUILib.RadialMenu.UpdateTooltipText(screen, RadialMenu)
    local args = RadialMenu.RadialMenuPressedArgs
    local components = screen.Components
    local itemToSwapTo = RadialMenu.currentItem

    local textboxContainerName = args.Name .. "BaseTextbox"
    if components[textboxContainerName] ~= nil then
        Destroy({Id = components[textboxContainerName].Id})
    end
    components[textboxContainerName] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = args.X or 0, Y = args.Y or 0})

    SetScaleY({ Id = components[textboxContainerName].Id , Fraction = args.Scale.Y or 1 })
    SetScaleX({ Id = components[textboxContainerName].Id , Fraction = args.Scale.X or 1 })


    local offsetX = args.GeneralOffset.X
    if itemToSwapTo.Offset ~= nil then
        offsetX = itemToSwapTo.Offset.X
    end
    local offsetY = args.GeneralOffset.Y
    if itemToSwapTo.Offset ~= nil then
        offsetY = itemToSwapTo.Offset.Y
    end


    CreateTextBox({ Id = components[textboxContainerName].Id, Text = itemToSwapTo.Text,
        FontSize = itemToSwapTo.FontSize or args.GeneralFontSize,
        OffsetX = offsetX, OffsetY = offsetY,
        Width = 665,
        Justification = "Left",
        VerticalJustification = "Top",
        LineSpacingBottom = 8,
        Font = "AlegreyaSansSCBold",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
        TextSymbolScale = 0.8,
    })
end
]]--
function ErumiUILib.RadialMenu.GetEntries(radialMenu)
    local returnItems = {}
    for k,v in pairs(radialMenu.args.Items)do
        if v.IsEnabled ~= false then
            table.insert(returnItems, v)
        end
    end
    return returnItems
end
function ErumiUILib.RadialMenu.NewEntry(radialMenu, value)
    local screen = radialMenu.screen
    table.insert(radialMenu.args.Items, value)
    if radialMenu.IsExpanded then
        ErumiUILib.RadialMenu.Collapse(radialMenu, true)
        ErumiUILib.RadialMenu.Expand(radialMenu, true)
    end
end
function ErumiUILib.RadialMenu.DelEntry(radialMenu, value)
    local itemToRemove = nil
    local itemToRemoveIndex = nil
    local items = radialMenu.args.Items
    if type(value) == "number" then
        if value > 0 then
            itemToRemove = items[value]
            itemToRemoveIndex = value
        end
    elseif type(value) == "string" then
        for k,v in pairs(items) do
            if v.Title == value then
                itemToRemove = v
                itemToRemoveIndex = k
                break
            end
        end
    end
    if itemToRemove ~= nil then
        local shouldExpand = false
        if radialMenu.IsExpanded then
            ErumiUILib.RadialMenu.Collapse(radialMenu, true)
            shouldExpand = true
        end
        table.remove(radialMenu.args.Items, itemToRemoveIndex)
        if shouldExpand then
            ErumiUILib.RadialMenu.Expand(radialMenu, true)
        end
    end
end
function ErumiUILib.RadialMenu.DisableEntry(radialMenu, value)
    local itemToDisable = nil
    local itemToDisableIndex = nil
    local items = radialMenu.args.Items
    if type(value) == "number" then
        if value > 0 then
            itemToDisable = items[value]
            itemToDisableIndex = value
        end
    elseif type(value) == "string" then
        for k,v in pairs(items) do
            if v.Text == value then
                itemToDisable = v
                itemToDisableIndex = k
                break
            end
        end
    end
    if itemToDisable ~= nil then
        items[itemToDisableIndex].IsEnabled = false
        local screen = radialMenu.screen
        if radialMenu.IsExpanded then
            ErumiUILib.RadialMenu.Collapse(radialMenu, true)
            ErumiUILib.RadialMenu.Expand(radialMenu, true)
        end
    end
end
function ErumiUILib.RadialMenu.EnableEntry(radialMenu, value)
    local itemToDisable = nil
    local itemToDisableIndex = nil
    local items = radialMenu.args.Items
    if type(value) == "number" then
        if value > 0 then
            itemToDisable = items[value]
            itemToDisableIndex = value
        end
    elseif type(value) == "string" then
        for k,v in pairs(items) do
            if v.Text == value then
                itemToDisable = v
                itemToDisableIndex = k
                break
            end
        end
    end
    if itemToDisable ~= nil then
        items[itemToDisableIndex].IsEnabled = true
        local screen = radialMenu.screen
        if radialMenu.IsExpanded then
            ErumiUILib.RadialMenu.Collapse(radialMenu, true)
            ErumiUILib.RadialMenu.Expand(radialMenu, true)
        end
    end
end
function ErumiUILib.RadialMenu.Destroy(radialMenu)
    for _,v in pairs(radialMenu.Children) do
        Destroy({Id = v.Id})
    end
    Destroy({Id = radialMenu.Id})
end
--#endregion

--#region OSK

ErumiUILib.Keyboard.Layouts = {
    ["Alphanumeric"] = {
        {Text = [[`~1!2 3#4$5%6^7&8*9(0)-_=+<-]], Offset = -25},
        {Text = [[qQwWeErRtTyYuUiIoOpP| ]], Offset = -17},
        {Text = [[aAsSdDfFgGhHjJkKlL;:'"<|]], Offset = -20},
        {Text = [[||zZxXcCvVbBnNmM,<.>/?]], Offset = -17},
        {Text = [[|\|/  <<>>]], Offset = 70},
    },
    ["Calculator"] = {
        {Text = [[7 8 9 / ]], Offset = 100},
        {Text = [[4 5 6 X ]], Offset = 100},
        {Text = [[1 2 3 - ]], Offset = 100},
        {Text = [[0 + = <||\]], Offset = 70 },
    },
    ["Numeric"] = {
        {Text = [[7 8 9 ]], Offset = 150},
        {Text = [[4 5 6 ]], Offset = 150},
        {Text = [[1 2 3 ]], Offset = 150},
        {Text = [[0 . <||\]], Offset = 100 },
    },
    ["Alphabetic"] = {
        {Text = [[qQwWeErRtTyYuUiIoOpP| <-]], Offset = -20},
        {Text = [[aAsSdDfFgGhHjJkKlL;:'"<|]], Offset = -20},
        {Text = [[||zZxXcCvVbBnNmM,<.>/?]], Offset = -17},
        {Text = [[|\|/  <<>>]], Offset = 70},
    },
}

function ErumiUILib.Keyboard.RegisterLayout(name, layout)
  ErumiUILib.Keyboard.Layouts[name] = layout
end

function ErumiUILib.Keyboard.CreateKeyboard(screen, args)
	local xPos = (args.X.Start or 0)
    local yPos = (args.Y.Start or 0)
    local components = screen.Components
    local Name = (args.Name or "UnnamedKeyboard")

    components[Name .. "KeyboardBase"] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = xPos, Y = yPos})
    components[Name .. "KeyboardBase"].args = args
    components[Name .. "KeyboardBase"].screen = screen
    components[Name .. "KeyboardBase"].Children = {}
    return components[Name .. "KeyboardBase"]
end
function ErumiUILib.Keyboard.Expand(keyboard, instant, skipCallback)
    if keyboard.IsExpanded then
        return
    end
    keyboard.IsExpanded = true
    local args = keyboard.args
    local screen = keyboard.screen
    local startXPos = (args.X.Start or 0)
    local startYPos = (args.Y.Start or 0)
    local endXPos = (args.X.End or 0)
    local endYPos = (args.Y.End or 0)
    local components = screen.Components
    local Name = (args.Name or "UnnamedKeyboard")

    --Create Background
    components[Name .. "KeyboardBackground"] = CreateScreenComponent({ Name = "rectangle01", Group = args.Group, Scale = 4, X = startXPos, Y = startYPos })
    Attach({ Id = components[Name .. "KeyboardBackground"].Id, DestinationId = keyboard.Id, OffsetX = 0, OffsetY = 0})

    SetScaleX({ Id = components[Name .. "KeyboardBackground"].Id , Fraction = (args.BackgroundScale.X or 1)  })
    SetScaleY({ Id = components[Name .. "KeyboardBackground"].Id , Fraction = (args.BackgroundScale.Y or 1)  })
  	SetColor({ Id = components[Name .. "KeyboardBackground"].Id, Color = args.Colors.Background or {0,0,0,1} })
    
    local currentXPos = args.Width.Start
    local currentYPos = args.Height.Start
    local creationTime = args.CreationTime or 0.3
    if instant then
      creationTime = 0
    end
    Move({ Ids = {  keyboard.Id}, OffsetX = endXPos, OffsetY = endYPos, Duration = creationTime })
    wait(creationTime)

    local lines
    if args.Layout.Style ~= nil and args.Layout.Style ~= "Custom" then
        lines = ErumiUILib.Keyboard.Layouts[args.Layout.Style]
    elseif args.Layout.Style == "Custom" then
        lines = args.Layout.Pattern
    end
    local xScalar = (args.Width.End - args.Width.Start) / 170
    local yScalar = (args.Height.End - args.Height.Start) / 34
    local buttonScaleY =  yScalar / #lines
    for _, v in ipairs(lines) do
        local lineScaleX = xScalar / (#v.Text / 2)
        currentXPos = currentXPos + v.Offset
        for i = 1, #v.Text, 2 do
            local lower = v.Text:sub(i,i)
            local upper = v.Text:sub(i+1,i+1)
            local buttonName = Name .. "KeyboardButton(" .. lower .."," .. upper .. ")"
            components[buttonName] = CreateScreenComponent({ Name = "MarketSlot", Group = args.Group, Scale = 0.5, X = currentXPos, Y = currentYPos })
            SetScaleX({ Id = components[buttonName].Id , Fraction = 0.4 * lineScaleX })
            SetScaleY({ Id = components[buttonName].Id , Fraction = 2  * buttonScaleY  })

            components[buttonName].OnPressedFunctionName = "ErumiUILibKeyboardClickKey"
            components[buttonName].Args = {args = args, Keys = {Lower = lower, Upper = upper}, keyboard = keyboard}

            local curText = lower
            local curColor = args.Colors.Text
            if (lower == "<" and upper == "<") or (lower == ">" and upper == ">") then
                local imageName = Name .. "KeyboardImage(" .. lower .."," .. upper .. ")"
                local imagePath = "GUI\\Arrow_Right"
                if (lower ~= ">" and upper ~= ">") then
                    imagePath = "GUI\\Arrow_Left"
                end
                components[imageName] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = currentXPos, Y = currentYPos })
                SetScaleX({ Id = components[imageName].Id , Fraction = 0.4 * lineScaleX })
                SetScaleY({ Id = components[imageName].Id , Fraction = 2  * buttonScaleY  })
                SetAnimation({ Name =imagePath, DestinationId = components[imageName].Id, Scale = 1 })
                keyboard.Children[imageName] = components[imageName]
            else
                if keyboard.IsUpper and upper ~= " " then
                    curText = upper
                end
                if lower == " " and upper == " " then
                    curText = " Space "
                end
                if lower == "<" and upper == "-" then
                    curText = "Back"
                end
                if lower == "<" and upper == "|" then
                    curText = " Enter "
                end
                if lower == "|" and upper == "|" then
                    curText = "Shift"
                    if keyboard.IsUpper then
                        curColor = args.Colors.ShiftPressed
                    end
                end
                if lower == "|" and upper == [[\]] then
                    curText = "Close"
                end
                if lower == "|" and upper == "/" then
                    curText = " Clear "
                end
                CreateTextBox({ Id = components[buttonName].Id, Text = curText,
                    FontSize = 30,
                    OffsetX = 0, OffsetY = -20,
                    Width = 1920,
                    Justification = "Center",
                    VerticalJustification = "Top",
                    LineSpacingBottom = 8,
                    Font = "AlegreyaSansSCBold",
                    Color = curColor,
                    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                    TextSymbolScale = 0.8,
                })
            end
            keyboard.Children[buttonName] = components[buttonName]
            currentXPos = currentXPos + (180 * lineScaleX)
        end
        currentYPos = currentYPos + 100 * buttonScaleY
        currentXPos = args.Width.Start
        if not instant then
            wait(0.02)
        end
    end
    keyboard.Children[Name .. "KeyboardBackground"] = components[Name .. "KeyboardBackground"]
    if args.ExpandCallback ~= nil and not skipCallback then
      args.ExpandCallback(keyboard)
    end
end
function ErumiUILibKeyboardClickKey(screen, button)
    local args = button.Args
    local keyboardArgs = args.args
    local lower = args.Keys.Lower
    local upper = args.Keys.Upper
    local keyboard = args.keyboard
    local curText = lower
    if keyboard.IsUpper and upper ~= " " then
        curText = upper
    end
    if lower == "<" and upper == "-" then
        keyboardArgs.SpecialKeys.Back(keyboard)
        return
    end
    if lower == "<" and upper == "|" then
        --Enter
        keyboardArgs.SpecialKeys.Enter(keyboard)
        return
    end
    if lower == "|" and upper == "|" then
        --Shift
        keyboardArgs.SpecialKeys.Shift(keyboard)
        return
    end
    if lower == "|" and upper == "/" then
        --Clear
        keyboardArgs.SpecialKeys.Clear(keyboard)
        return
    end
    if lower == "|" and upper == [[\]] then
        --Close
        keyboardArgs.SpecialKeys.Close(keyboard)
        return
    end
    if lower == "<" and upper == "<" then
        --Left
        keyboardArgs.SpecialKeys.Left(keyboard)
        return
    end
    if lower == ">" and upper == ">" then
        --Right
        keyboardArgs.SpecialKeys.Right(keyboard)
        return
    end
    keyboardArgs.KeyPressedFunction(keyboard, curText)
end
function ErumiUILib.Keyboard.Collapse(keyboard, instant, skipCallback)
    if keyboard.IsExpanded == false then
        return
    end
    keyboard.IsExpanded = false
    local args = keyboard.args
    local screen = keyboard.screen
    -- Reversed as we are now doing the opposite tween
    local startXPos = (args.X.End or 0)
    local startYPos = (args.Y.End or 0)
    local endXPos = (args.X.Start or 0)
    local endYPos = (args.Y.Start or 0)
    local components = screen.Components
    local Name = (args.Name or "UnnamedKeyboard")

    local lines
    if args.Layout.Style ~= nil and args.Layout.Style ~= "Custom" then
        lines = ErumiUILib.Keyboard.Layouts[args.Layout.Style]
    elseif args.Layout.Style == "Custom" then
        lines = args.Layout.Pattern
    end
    for i = #lines, 1, -1 do
        local line = lines[i]
        for j = #line.Text, 1, -2 do
            local lower = line.Text:sub(j-1,j-1)
            local upper = line.Text:sub(j,j)
            local buttonName = Name .. "KeyboardButton(" .. lower .."," .. upper .. ")"
            Destroy({Id = components[buttonName].Id})
            if (lower == "<" and upper == "<") or (lower == ">" and upper == ">") then
                local imageName = Name .. "KeyboardImage(" .. lower .."," .. upper .. ")"
                Destroy({Id = components[imageName].Id})
            end
        end

        if not instant then
            wait(0.02)
        end
    end

    local creationTime = args.CreationTime or 0.3
    if instant then
      creationTime = 0
    end
    Move({ Ids = { keyboard.Id }, OffsetX = endXPos, OffsetY = endYPos, Duration = creationTime })
    wait(creationTime)
    Destroy({Id = components[Name .. "KeyboardBackground"].Id})

    if args.CollapseCallback ~= nil and not skipCallback then
      args.CollapseCallback(keyboard)
    end
end

function ErumiUILib.Keyboard.Refresh(keyboard)
    ErumiUILib.Keyboard.Collapse(keyboard, true, true)
    ErumiUILib.Keyboard.Expand(keyboard, true, true)
end
function ErumiUILib.Keyboard.Destroy(keyboard)
    for _,v in pairs(keyboard.Children) do
        Destroy({Text = v.Id})
    end
    Destroy({Text = keyboard.Id})
end
--#endregion

--#region TextBoxes
function ErumiUILib.Textbox.CreateTextbox(screen, args)
  	local xPos = (args.X or 0)
    local yPos = (args.Y or 0)
    local components = screen.Components
    local Name = (args.Name or "UnnamedTextBox")

    --Create base default text and backingKey
    local textBoxButtonKey = Name .. "Button"
    components[textBoxButtonKey] = CreateScreenComponent({ Name = "MarketSlot", Group = args.Group, Scale = 1, X = xPos, Y = yPos })
    SetScaleY({ Id = components[textBoxButtonKey].Id , Fraction = 2.75 * (args.Scale.Y or 1)})
    SetScaleX({ Id = components[textBoxButtonKey].Id , Fraction = 0.55 * (args.Scale.X or 1)})
    components[textBoxButtonKey].OnPressedFunctionName = "ErumiUILibTextFieldButtonPressed"
    components[textBoxButtonKey].args = args
    components[textBoxButtonKey].screen = screen
    components[textBoxButtonKey].textboxName = Name .. "Backing"

    local textBoxBackingKey = Name .. "Backing"
    components[textBoxBackingKey] = CreateScreenComponent({ Name = "rectangle01", Group = args.Group, Scale = 1, X = xPos, Y = yPos })
    components[textBoxBackingKey].args = args
    components[textBoxBackingKey].screen = screen
    components[textBoxBackingKey].currentText = args.StartingText or ""
    components[textBoxBackingKey].Children = {}

    -- Add a space at the start to allow us to clear the text with ModifyText (empty string will not upadte the textbox)
    components[textBoxBackingKey].currentText = " " .. components[textBoxBackingKey].currentText
    components[textBoxBackingKey].cursorPosition = (#args.StartingText or 0) + 1
    components[textBoxBackingKey].maxLength = args.MaxLength or 999999 -- big number in place of infinity / disabling the limit :shrug:
    components[textBoxBackingKey].showCursor = args.ShowCursor or false

    SetScaleY({ Id = components[textBoxBackingKey].Id , Fraction = args.Scale.Y or 1 })
    SetScaleX({ Id = components[textBoxBackingKey].Id , Fraction = args.Scale.X or 1 })
  	SetColor({ Id = components[textBoxBackingKey].Id, Color = args.BackgroundColor or {0,0,0,1} })

    local textBoxCursorHolder = Name .. "CursorHolder"
        components[textBoxCursorHolder] = CreateScreenComponent({ Name = "BlankObstacle", X = xPos, Y = yPos, Group = args.Group .. "Cursor" })
        CreateTextBox({ Id = components[textBoxCursorHolder].Id, Text = " |",
        FontSize = args.TextStyle.FontSize or 20,
        OffsetX = args.TextStyle.Offset.X or 0, OffsetY = args.TextStyle.Offset.Y or 0,
        Width = args.TextStyle.Width or 780,
        Justification = args.TextStyle.Justification,
        VerticalJustification = "Top",
        LineSpacingBottom = 8,
        Font = "MonospaceTypewriterBold",
        Color = args.CursorColor,
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
        TextSymbolScale = 0.8,})
        local textBoxValidTextBackingKey = Name .. "ValidTextHolder"
        components[textBoxValidTextBackingKey] = CreateScreenComponent({ Name = "BlankObstacle", X = xPos, Y = yPos, Group = args.Group .. "Text" })
        CreateTextBox({ Id = components[textBoxValidTextBackingKey].Id, Text = "",
            FontSize = args.ValidityStyle.FontSize or 20,
            OffsetX = args.ValidityStyle.Offset.X or 0, OffsetY = args.ValidityStyle.Offset.Y or 0,
            Width = args.ValidityStyle.Width or 780,
            Justification = args.ValidityStyle.Justification,
            VerticalJustification = "Top",
            LineSpacingBottom = 8,
            Font = "MonospaceTypewriterBold",
            Color = args.ValidityStyle.Valid,
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
            TextSymbolScale = 0.8})
    local textBoxTextBackingKey = Name .. "TextHolder"
    components[textBoxTextBackingKey] = CreateScreenComponent({ Name = "BlankObstacle", X = xPos, Y = yPos, Group = args.Group .. "Text" })
    CreateTextBox({ Id = components[textBoxTextBackingKey].Id, Text = "",
        FontSize = args.TextStyle.FontSize or 20,
        OffsetX = args.TextStyle.Offset.X or 0, OffsetY = args.TextStyle.Offset.Y or 0,
        Width = args.TextStyle.Width or 780,
        Justification = args.TextStyle.Justification,
        VerticalJustification = "Top",
        LineSpacingBottom = 8,
        Font = "MonospaceTypewriterBold",
        Color = args.TextStyle.Color,
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
        TextSymbolScale = 0.8})

    -- Note this also has the important job of calling update textbox
    ErumiUILib.Textbox.ShowCursor(components[textBoxBackingKey], args.ShowCursor or false)
    components[textBoxBackingKey].Children[textBoxTextBackingKey] = components[textBoxTextBackingKey]
    components[textBoxBackingKey].Children[textBoxButtonKey] = components[textBoxButtonKey]
    components[textBoxBackingKey].Children[textBoxCursorHolder] = components[textBoxCursorHolder]

    return components[textBoxBackingKey]
end
function ErumiUILib.Textbox.Update(textbox, text)
    local lines = {}
    local args = textbox.args
    local screen = textbox.screen
    local components = screen.Components
    local xPos = (args.X or 0)
    local yPos = (args.Y or 0)
    local Name = (args.Name or "UnnamedTextBox")
    local textBoxTextBackingKey = Name .. "TextHolder"
    local textBoxCursorHolder = Name .. "CursorHolder"
    textbox.currentText = text

    -- Add a space at the start of each to allow us to clear the text with ModifyText (empty string will not upadte the textbox)
    ModifyTextBox({ Id = components[textBoxTextBackingKey].Id, Text = " " .. text})
    if textbox.showCursor then
        ModifyTextBox({ Id = components[textBoxCursorHolder].Id, Text = " " .. text:sub(1, textbox.cursorPosition).."|"})
    else
      ModifyTextBox({ Id = components[textBoxCursorHolder].Id, Text = " "})
    end
    if args.CheckValidOnUpdate then
        ErumiUILib.Textbox.CheckValidity(textbox)
    end
end
function ErumiUILib.Textbox.CheckValidity(textbox)
    local text = textbox.currentText
    local args = textbox.args
    local screen = textbox.screen
    local components = screen.Components
    local Name = (args.Name or "UnnamedTextBox")
    local textBoxValidTextBackingKey = Name .. "ValidTextHolder"

    if args.CheckFunc ~= nil then
        local valid, msg = args.CheckFunc( text )
        if valid == nil then
            textbox.isValid = false
            ModifyTextBox({ Id = components[textBoxValidTextBackingKey].Id, Color = args.ValidityStyle.Colors.Invalid})
            if msg then
                ModifyTextBox({ Id = components[textBoxValidTextBackingKey].Id, Text = msg}) 
            end
        else
            textbox.isValid = true
            ModifyTextBox({ Id = components[textBoxValidTextBackingKey].Id, Text = " "}) 
            ModifyTextBox({ Id = components[textBoxValidTextBackingKey].Id, Color = args.ValidityStyle.Colors.Valid})
        end
    else
        textbox.isValid = nil
        ModifyTextBox({ Id = components[textBoxValidTextBackingKey].Id, Color = args.ValidityStyle.Colors.Unknown})
        ModifyTextBox({ Id = components[textBoxValidTextBackingKey].Id, Text = " "}) 
    end
end
function ErumiUILib.Textbox.Write(textbox, text)
    if #textbox.currentText + #text > textbox.maxLength then
        return
    end
    local newText = textbox.currentText
    local cursorPos = textbox.cursorPosition
    newText = newText:sub(1, cursorPos)..text..newText:sub(cursorPos + 1)
    ErumiUILib.Textbox.Update(textbox, newText)
    ErumiUILib.Textbox.SetCursorPosition(textbox, cursorPos + #text)
end
function ErumiUILib.Textbox.Delete(textbox, size)
    local newText = textbox.currentText
    local cursorPos = textbox.cursorPosition
    newText = newText:sub(1, math.max(0, cursorPos - size)) .. newText:sub(cursorPos + 1)
    ErumiUILib.Textbox.Update(textbox, newText)
    ErumiUILib.Textbox.SetCursorPosition(textbox, cursorPos - size)
end
function ErumiUILib.Textbox.SetCursorPosition(textbox, position)
    local newPosition = math.min(#textbox.currentText, math.max(0, position))
    textbox.cursorPosition = newPosition
    ErumiUILib.Textbox.Update(textbox, textbox.currentText)
end
function ErumiUILib.Textbox.ShowCursor(textbox, showCursor)
    textbox.showCursor = showCursor
    ErumiUILib.Textbox.Update(textbox, textbox.currentText)
end
function ErumiUILib.Textbox.GetText(textbox)
    return textbox.currentText
end
function ErumiUILib.Textbox.SetText(textbox, text)
    local cursorPos = #text
    ErumiUILib.Textbox.SetCursorPosition(textbox, cursorPos)
    ErumiUILib.Textbox.Update(textbox, text)
end
function ErumiUILibTextFieldButtonPressed(screen, button)
    button.args.OnFocus(button.screen.Components[button.textboxName])
end
function ErumiUILib.Textbox.Destroy(textbox)
    for _,v in pairs(textbox.Children)do
        Destroy({Id = v.Id})
    end
    Destroy({Id = textbox.Id})
end
--#endregion

--#region SubScreen
    function ErumiUILib.SubScreen.AssignParent(child, parent)
        if child.Parents == nil then
            child.Parents = {}
        end
        if parent.Children == nil then
            parent.Children = {}
        end
        table.insert(child.Parents, parent)
        table.insert(parent.Children, child)
        if ErumiUILib.SubScreen.OpenScreens[child.Name or "Generic"] == nil then
            ErumiUILib.SubScreen.OpenScreens[child.Name or "Generic"] = child
        end
        if ErumiUILib.SubScreen.OpenScreens[parent.Name or "Generic"] == nil then
            ErumiUILib.SubScreen.OpenScreens[parent.Name or "Generic"] = child
        end
    end
    function ErumiUILib.SubScreen.GetRegisteredScreen(name)
        return ErumiUILib.SubScreen.OpenScreens[name or "Generic"]
    end
    function ErumiUILib.SubScreen.RegisterScreen(screen)
        ErumiUILib.SubScreen.OpenScreens[screen.Name or "Generic"] = screen
    end
    ModUtil.Path.Wrap("OnScreenClosed", function ( baseFunc, args )
        if ErumiUILib.SubScreen.OpenScreens[args.Flag]~= nil then
            
            if ErumiUILib.SubScreen.OpenScreens[args.Flag].Children ~= nil then
                for k,v in pairs(ErumiUILib.SubScreen.OpenScreens[args.Flag].Children) do
                    ErumiUILib.SubScreen.CloseChildren(v)
                end
            end
            if ErumiUILib.SubScreen.OpenScreens[args.Flag].Parents ~= nil then
                FreezePlayerUnit()
            end
            ErumiUILib.SubScreen.OpenScreens[args.Flag] = nil
            for k,v in pairs(ErumiUILib.SubScreen.OpenScreens) do
                if v.Children[args.Flag] ~= nil then
                    v.Children[args.Flag] = nil
                end
            end
        end
        return baseFunc(args)
    end, ErumiUILib)
    
    function ErumiUILib.SubScreen.CloseChildren(screen)
        CloseScreen( GetAllIds( screen.Components ) )
        screen.KeepOpen = false
        OnScreenClosed({ Flag = screen.Name })
    end
    --#endregion

--#region Scrolling Lists
function ErumiUILib.ScrollingList.CreateScrollingList(screen, args)
    local xPos = (args.X or 0)
    local yPos = (args.Y or 0)
    local components = screen.Components
    local Name = (args.Name or "UnnamedScrollingList")
    --Create base default text and backingKey
    local scrollingListTopBackingKey = Name .. "BaseBacking"
    components[scrollingListTopBackingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group, Scale = 1, X = xPos, Y = yPos })

    components[scrollingListTopBackingKey].isEnabled = true
    components[scrollingListTopBackingKey].Children = {}
    components[scrollingListTopBackingKey].screen = screen
    components[scrollingListTopBackingKey].CurrentPage = 0
    components[scrollingListTopBackingKey].args = args

    ErumiUILib.ScrollingList.Update(components[scrollingListTopBackingKey])
    return components[scrollingListTopBackingKey]
end
function ErumiUILib.ScrollingList.Update(scrollingList)
    local args = scrollingList.args
    local screen = scrollingList.screen
    local xPos = (args.X or 0)
    local yPos = (args.Y or 0)
    local components = screen.Components
    local Name = (args.Name or "UnnamedScrollingList")
    --Create base default text and backingKey
    local scrollingListTopBackingKey = Name .. "BaseBacking"
    local currentPageItems = {}

    for _,v in pairs(scrollingList.Children) do
        Destroy({Id = v.Id})
    end

    for i = 1, args.ItemsPerPage do
        local curItem = args.Items[i + (scrollingList.CurrentPage * args.ItemsPerPage)]
        if curItem == nil then
            break
        end
            table.insert(currentPageItems, curItem)
        
    end
    for k,v in pairs(currentPageItems) do
        local scrollingListItemBackingKey = args.Name .. "ScrollingListBacking" .. k
        local ySpaceAmount = 102* (k - 1) * args.Scale.Y + (args.Padding.Y * k)
        components[scrollingListItemBackingKey] = CreateScreenComponent({ Name = "MarketSlot", Group = args.Group .. "ScrollingList", Scale = 1, X = (args.X or 0), Y = (args.Y or 0) + ySpaceAmount})
        components[scrollingListItemBackingKey].scrollingListPressedArgs = {Args = args, parent = scrollingList, Index = k + (scrollingList.CurrentPage * args.ItemsPerPage)}

        SetScaleY({ Id = components[scrollingListItemBackingKey].Id , Fraction = args.Scale.Y or 1 })
        SetScaleX({ Id = components[scrollingListItemBackingKey].Id , Fraction = args.Scale.X or 1 })
        local offsetX = (args.GeneralOffset or {X = 0}).X
        if v.Offset ~= nil then
            offsetX = v.Offset.X
        end
        local offsetY = (args.GeneralOffset or {Y = 0}).Y
        if v.Offset ~= nil then
            offsetY = v.Offset.Y
        end
        local textColor = Color.White
        CreateTextBox({ Id = components[scrollingListItemBackingKey].Id, Text = v.Text,
            FontSize = v.FontSize or args.GeneralFontSize,
            OffsetX = offsetX, OffsetY = offsetY,
            Width = 665,
            Justification = (v.Justification or args.Justification) or "Center",
            VerticalJustification = (v.VerticalJustification or args.VerticalJustification) or "Center",
            LineSpacingBottom = 8,
            Font = (v.Font or args.Font) or "AlegreyaSansSCBold",
            Color = textColor,
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
            TextSymbolScale = 0.8,
        })
        if v.Description then
            CreateTextBox({ Id = components[scrollingListItemBackingKey].Id, Text = v.Description,
                FontSize = v.DescriptionFontSize or args.DescriptionFontSize or 10,
                OffsetX = (v.DescriptionOffset or args.DescriptionOffset).X or 0, OffsetY = (v.DescriptionOffset or args.DescriptionOffset).Y or 0,
                Width = 665,
                Justification = (v.Justification or args.Justification) or "Center",
                VerticalJustification = (v.VerticalJustification or args.VerticalJustification) or "Center",
                LineSpacingBottom = 8,
                Font = (v.Font or args.Font) or "AlegreyaSansSCBold",
                Color = args.DescriptionColor,
                ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                TextSymbolScale = 0.8,
            })
        end
        if v.ImageStyle ~= nil and v.ImageStyle.Image ~= nil then
            local scrollingListItemImageBackingKey = args.Name .. "ScrollingListIcon" .. k
            components[scrollingListItemImageBackingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group .. "Image", Scale = v.ImageStyle.Scale or 1 })
            SetAnimation({ Name = v.ImageStyle.Image  , DestinationId = components[scrollingListItemImageBackingKey].Id, Scale = 1 })
            Attach({ Id = components[scrollingListItemImageBackingKey].Id, DestinationId = components[scrollingListItemBackingKey].Id, OffsetX = v.ImageStyle.Offset.X or 0, OffsetY = v.ImageStyle.Offset.Y or 0})
            components[scrollingListTopBackingKey].Children[components[scrollingListItemImageBackingKey].Id] = components[scrollingListItemImageBackingKey]
        elseif args.ImageStyle ~= nil and args.ImageStyle.Image ~= nil then
            local scrollingListItemImageBackingKey = args.Name .. "ScrollingListIcon" .. k
            components[scrollingListItemImageBackingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = args.Group .. "Image", Scale = args.ImageStyle.Scale or 1 })
            SetAnimation({ Name = args.ImageStyle.Image, DestinationId = components[scrollingListItemImageBackingKey].Id, Scale = 1 })
            Attach({ Id = components[scrollingListItemImageBackingKey].Id, DestinationId = components[scrollingListItemBackingKey].Id, OffsetX = args.ImageStyle.Offset.X or 0, OffsetY = args.ImageStyle.Offset.Y or 0})
            scrollingList.Children[scrollingListItemImageBackingKey] = components[scrollingListItemImageBackingKey]
        end
        if v.IsEnabled ~= false then
            components[scrollingListItemBackingKey].OnPressedFunctionName = "ErumiUILib.ScrollingList.ButtonPressed"
        else
            SetColor({ Id = components[scrollingListItemBackingKey].Id , Color = args.DeEnabledColor or {1,1,1,0.33} })
        end
        scrollingList.Children[scrollingListItemBackingKey] = components[scrollingListItemBackingKey]
        local createUpArrow = function()
            local scrollingListItemArrowKey = args.Name .. "ScrollingListArrowUp" .. k
            components[scrollingListItemArrowKey] = CreateScreenComponent({ Name = "ButtonCodexUp", X = (args.X or 0) + (args.ArrowStyle.Offset.X or 0), Y = (args.Y or 0) + ySpaceAmount + (args.ArrowStyle.Offset.Y or 0), Scale = args.ArrowStyle.Scale, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = args.Group .. "Arrows" })
            components[scrollingListItemArrowKey].OnPressedFunctionName = "ErumiUILib.ScrollingList.PreviousPage"
            components[scrollingListItemArrowKey].args = args
            components[scrollingListItemArrowKey].Parent = scrollingList
            
            scrollingList.Children[components[scrollingListItemArrowKey].Id] = components[scrollingListItemArrowKey]
            
        end
        local createDownArrow = function()
            local scrollingListItemArrowKey = args.Name .. "ScrollingListArrowDown" .. k
            components[scrollingListItemArrowKey] = CreateScreenComponent({ Name = "ButtonCodexDown", X = (args.X or 0) + (args.ArrowStyle.Offset.X or 0), Y = (args.Y or 0) + ySpaceAmount + (args.ArrowStyle.Offset.Y or 0), Scale = args.ArrowStyle.Scale, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = args.Group .. "Arrows" })
            scrollingList.Children[components[scrollingListItemArrowKey].Id] = components[scrollingListItemArrowKey]
            components[scrollingListItemArrowKey].OnPressedFunctionName = "ErumiUILib.ScrollingList.NextPage"
            components[scrollingListItemArrowKey].args = args
            components[scrollingListItemArrowKey].Parent = scrollingList
            
            scrollingList.Children[components[scrollingListItemArrowKey].Id] = components[scrollingListItemArrowKey]
        end
        if args.ArrowStyle.CreationPositions.Style == "First" then
            if k == 1 and args.ArrowStyle ~= nil then
                createUpArrow()
            elseif k == 2 and args.ArrowStyle ~= nil then
                createDownArrow()    
            end
        elseif args.ArrowStyle.CreationPositions.Style == "TB" or args.ArrowStyle.CreationPositions.Style == "Top-Bottom" then
            if k == 1 and args.ArrowStyle ~= nil then
                createUpArrow()            
            elseif k == #currentPageItems and args.ArrowStyle ~= nil then
                createDownArrow()
            end
        elseif args.ArrowStyle.CreationPositions.Style == "Custom" then
            if args.ArrowStyle ~= nil and k == args.ArrowStyle.CreationPositions.Positions[1] then
                createUpArrow()
            elseif args.ArrowStyle ~= nil and k == args.ArrowStyle.CreationPositions.Positions[2] then
                createDownArrow()
            end
        end
    end
end
function ErumiUILib.ScrollingList.PreviousPage(screen, button)
    local parent = button.Parent
    local args = button.args
    if parent.CurrentPage - 1 >= 0 then
        parent.CurrentPage = parent.CurrentPage - 1
        ErumiUILib.ScrollingList.Update(parent)
    end
    
end
function ErumiUILib.ScrollingList.NextPage(screen, button)
    local parent = button.Parent
    local args = button.args
    if #args.Items > (parent.CurrentPage + 1) * args.ItemsPerPage then
        parent.CurrentPage = parent.CurrentPage + 1
        ErumiUILib.ScrollingList.Update(parent)
    end
    
end

function ErumiUILib.ScrollingList.ButtonPressed(screen, button)
  local args = button.scrollingListPressedArgs.Args
  local components = screen.Components
  local itemToSwapTo = args.Items[button.scrollingListPressedArgs.Index]
  local parentButton = button.scrollingListPressedArgs.parent

  if itemToSwapTo.event ~= nil then
      itemToSwapTo.event(parentButton, itemToSwapTo)
  elseif args.GeneralEvent ~= nil then
      args.GeneralEvent(parentButton, itemToSwapTo)
  end
end
function ErumiUILib.ScrollingList.GetEntries(scrollingList)
  local returnItems = {}
  for k,v in pairs(scrollingList.scrollingListPressedArgs.Items)do
      if v.IsEnabled == true or v.IsEnabled == nil then
          table.insert(returnItems, v)
      end
  end
  return returnItems
end
function ErumiUILib.ScrollingList.NewEntry(scrollingList, value)
  table.insert(scrollingList.scrollingListPressedArgs.Items, value)
  local screen = scrollingList.screen
  ErumiUILib.ScrollingList.Update(scrollingList)
end
function ErumiUILib.ScrollingList.DelEntry(scrollingList, value)
  local itemToRemove = nil
  local itemToRemoveIndex = nil
  local items = scrollingList.scrollingListPressedArgs.Items
  if type(value) == "number" then
      if value > 0 then
          itemToRemove = items[value]
          itemToRemoveIndex = value
      end
  elseif type(value) == "string" then
      for k,v in pairs(items) do
          if v.Text == value then
              itemToRemove = v
              itemToRemoveIndex = k
              break
          end
      end
  end
  if itemToRemove ~= nil and itemToRemove ~= scrollingList.currentItem then
      table.remove(scrollingList.scrollingListPressedArgs.Items, itemToRemoveIndex)
      local screen = scrollingList.screen
      ErumiUILib.ScrollingList.Update(scrollingList)
  end
end
function ErumiUILib.ScrollingList.DisableEntry(scrollingList, value)
  local itemToDisable = nil
  local itemToDisableIndex = nil
  local items = scrollingList.scrollingListPressedArgs.Items
  if type(value) == "number" then
      if value > 0 then
          itemToDisable = items[value]
          itemToDisableIndex = value
      end
  elseif type(value) == "string" then
      for k,v in pairs(items) do
          if v.Text == value then
              itemToDisable = v
              itemToDisableIndex = k
              break
          end
      end
  end
  if itemToDisable ~= nil and itemToDisable ~= scrollingList.currentItem then
      items[itemToDisableIndex].IsEnabled = false
      ErumiUILib.ScrollingList.Update(scrollingList)
  end
end
function ErumiUILib.ScrollingList.EnableEntry(scrollingList, value)
  local itemToDisable = nil
  local itemToDisableIndex = nil
  local items = scrollingList.scrollingListPressedArgs.Items
  if type(value) == "number" then
      if value > 0 then
          itemToDisable = items[value]
          itemToDisableIndex = value
      end
  elseif type(value) == "string" then
      for k,v in pairs(items) do
          if v.Text == value then
              itemToDisable = v
              itemToDisableIndex = k
              break
          end
      end
  end
  if itemToDisable ~= nil and itemToDisable ~= scrollingList.currentItem then
    items[itemToDisableIndex].IsEnabled = true
    ErumiUILib.ScrollingList.Update(scrollingList)
end
end
function ErumiUILib.ScrollingList.Destroy(scrollingList)
  local components = scrollingList.screen.components
  for _,v in pairs(scrollingList.Children) do
      if components[v.Id] ~= nil then
          Destroy({Id = v.Id})
      end
  end
  Destroy({Id = scrollingList.Id})
end
--#endregion

--[[


TODO:
Textfield validity controllers
Maybe (Magic says must be done by reading Packages so probably not) Position is top left corner (i really dont want to and probably wont, might make it a function that modders can use at will)
Clean destroy mechanics to destroy children of components
    A) Destory function
    B) OnDestroy trigger or whatever auto destorys objects
    Can destroy by storing children in object then having that as a table in the object directly interacted with by modder 
    or a GetChildren() function
Slider dragging: Sliding turned on when clicked, follows mouse until mouse clicked again to turn mouse follow off
Creating Sub-menus that dont re-enable input on close, effectively making in menu pop-up systems
    Make subscreen work
    Cry when it doesn't

]]--
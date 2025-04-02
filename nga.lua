local Radix = {}
Radix.__index = Radix

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Utility function to create instances
local function create(class, properties)
    local instance = Instance.new(class)
    for prop, value in pairs(properties) do
        instance[prop] = value
    end
    return instance
end

-- Main UI constructor
function Radix.new()
    local self = setmetatable({}, Radix)
    
    self.ScreenGui = create("ScreenGui", {
        Name = "Radix",
        IgnoreGuiInset = true,
        DisplayOrder = 100,
        ResetOnSpawn = false,
        Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    })
    
    self.Main = create("Frame", {
        Name = "Main",
        Size = UDim2.new(0, 500, 0, 475),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(26, 26, 26),
        BorderSizePixel = 0,
        Parent = self.ScreenGui
    })
    create("UICorner", {CornerRadius = UDim.new(0, 15), Parent = self.Main})
    
    create("Frame", {
        Name = "Shadow",
        ZIndex = 0,
        Size = UDim2.new(1, 35, 1, 35),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Parent = self.Main
    }):SetAttribute("InitialTransparency", 1)
    
    create("ImageLabel", {
        Name = "Image",
        ZIndex = 0,
        Size = UDim2.new(1.6, 0, 1.3, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://5587865193",
        ImageTransparency = 0.6,
        ImageColor3 = Color3.fromRGB(21, 21, 21),
        Parent = self.Main.Shadow
    }):SetAttribute("InitialTransparency", 0.5)
    
    self.Topbar = create("Frame", {
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = self.Main
    })
    create("UICorner", {CornerRadius = UDim.new(0, 15), Parent = self.Topbar})
    create("Frame", {
        Name = "CornerRepair",
        Size = UDim2.new(1, 0, 0.32222, 0),
        Position = UDim2.new(0.5, 0, 0.83889, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
        BorderSizePixel = 0,
        ZIndex = 4,
        Parent = self.Topbar
    })
    
    create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 338, 0, 16),
        Position = UDim2.new(0, 17, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Text = "Radix Interface",
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextScaled = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold),
        ZIndex = 5,
        Parent = self.Topbar
    })
    
    self.TabList = create("ScrollingFrame", {
        Name = "TabList",
        Size = UDim2.new(1, -25, 0, 36),
        Position = UDim2.new(0.5, 0, 0, 72),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        ScrollBarThickness = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.X,
        ScrollingDirection = Enum.ScrollingDirection.X,
        Parent = self.Main
    })
    create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 6),
        Parent = self.TabList
    })
    
    self.Elements = create("Frame", {
        Name = "Elements",
        Size = UDim2.new(1, 0, 1, -100),
        Position = UDim2.new(0.5, 0, 1, 0),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent = self.Main
    })
    
    self.Tabs = {}
    self.CurrentTab = nil
    return self
end

function Radix:CreateTab(config)
    local tab = {}
    
    tab.Button = create("Frame", {
        Name = config.Name,
        Size = UDim2.new(0, 110, 0, 30),
        BackgroundColor3 = Color3.fromRGB(81, 81, 81),
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        Parent = self.TabList
    })
    create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = tab.Button})
    create("UIStroke", {Transparency = 0.5, Color = Color3.fromRGB(86, 86, 86), Parent = tab.Button})
    
    tab.Title = create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0.8, 0, 0, 14),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Text = config.Name,
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextTransparency = 0.2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        ZIndex = 5,
        Parent = tab.Button
    })
    
    tab.Content = create("ScrollingFrame", {
        Name = config.Name,
        Size = UDim2.new(1, -25, 1, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        ScrollBarThickness = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Parent = self.Elements
    })
    create("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 6),
        Parent = tab.Content
    })
    
    local interact = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 3,
        Parent = tab.Button
    })
    
    interact.MouseButton1Click:Connect(function()
        if self.CurrentTab then
            self.CurrentTab.Content.Visible = false
        end
        tab.Content.Visible = true
        self.CurrentTab = tab
    end)
    
    if not self.CurrentTab then
        self.CurrentTab = tab
        tab.Content.Visible = true
    else
        tab.Content.Visible = false
    end
    
    self.Tabs[config.Name] = tab
    return tab
end

function Radix.CreateSection(tab, config)
    local section = create("Frame", {
        Name = "SectionTitle",
        Size = UDim2.new(1, 0, 0, 15),
        BackgroundTransparency = 1,
        Parent = tab.Content
    })
    
    create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0.87474, 0, 0, 13),
        Position = UDim2.new(0, 10, 0.1, 0),
        BackgroundTransparency = 1,
        Text = config.Name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextScaled = true,
        TextTransparency = 0.4,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = section
    })
    
    return section
end

function Radix.CreateButton(tab, config)
    local button = create("Frame", {
        Name = config.Name,
        Size = UDim2.new(1, -10, 0, 35),
        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
        BorderSizePixel = 0,
        Parent = tab.Content
    })
    create("UICorner", {CornerRadius = UDim.new(0, 9), Parent = button})
    create("UIStroke", {Color = Color3.fromRGB(51, 51, 51), Parent = button})
    
    create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 315, 0, 14),
        Position = UDim2.new(0, 15, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Text = config.Name,
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = button
    })
    
    local interact = create("TextButton", {
        Name = "Interact",
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 5,
        Parent = button
    })
    
    interact.MouseButton1Click:Connect(function()
        if config.Callback then
            config.Callback()
        end
    end)
    
    return button
end

function Radix.CreateToggle(tab, config)
    local toggle = create("Frame", {
        Name = config.Name,
        Size = UDim2.new(1, -10, 0, 40),
        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
        BorderSizePixel = 0,
        Parent = tab.Content
    })
    create("UICorner", {CornerRadius = UDim.new(0, 9), Parent = toggle})
    create("UIStroke", {Color = Color3.fromRGB(51, 51, 51), Parent = toggle})
    
    create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 385, 0, 14),
        Position = UDim2.new(0, 15, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Text = config.Name,
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = toggle
    })
    
    local switch = create("Frame", {
        Name = "Switch",
        Size = UDim2.new(0, 43, 0, 21),
        Position = UDim2.new(1, -10, 0, 20),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(31, 31, 31),
        BorderSizePixel = 0,
        Parent = toggle
    })
    create("UICorner", {CornerRadius = UDim.new(0, 15), Parent = switch})
    create("UIStroke", {Color = Color3.fromRGB(66, 66, 66), Parent = switch})
    
    local indicator = create("Frame", {
        Name = "Indicator",
        Size = UDim2.new(0, 17, 0, 17),
        Position = UDim2.new(0, 2, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(101, 101, 101),
        BorderSizePixel = 0,
        Parent = switch
    })
    create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = indicator})
    create("UIStroke", {Thickness = 1.2, Color = Color3.fromRGB(126, 126, 126), Parent = indicator})
    
    local state = config.Default or false
    if state then
        indicator.Position = UDim2.new(1, -19, 0.5, 0)
        indicator.BackgroundColor3 = Color3.fromRGB(51, 139, 221)
    end
    
    local interact = create("TextButton", {
        Name = "Interact",
        Size = UDim2.new(0.36935, 0, 1, 0),
        Position = UDim2.new(0.81532, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 5,
        Parent = toggle
    })
    
    interact.MouseButton1Click:Connect(function()
        state = not state
        if state then
            indicator:TweenPosition(UDim2.new(1, -19, 0.5, 0), "Out", "Quad", 0.2, true)
            indicator.BackgroundColor3 = Color3.fromRGB(51, 139, 221)
        else
            indicator:TweenPosition(UDim2.new(0, 2, 0.5, 0), "Out", "Quad", 0.2, true)
            indicator.BackgroundColor3 = Color3.fromRGB(101, 101, 101)
        end
        if config.Callback then
            config.Callback(state)
        end
    end)
    
    return toggle
end

function Radix.CreateSlider(tab, config)
    local slider = create("Frame", {
        Name = config.Name,
        Size = UDim2.new(1, -10, 0, 48),
        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
        BorderSizePixel = 0,
        Parent = tab.Content
    })
    create("UICorner", {CornerRadius = UDim.new(0, 9), Parent = slider})
    create("UIStroke", {Color = Color3.fromRGB(51, 51, 51), Parent = slider})
    
    create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 200, 0, 14),
        Position = UDim2.new(0, 15, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Text = config.Name,
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = slider
    })
    
    local main = create("CanvasGroup", {
        Name = "Main",
        Size = UDim2.new(0, 222, 0, 30),
        Position = UDim2.new(1, -10, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(51, 139, 221),
        BackgroundTransparency = 0.8,
        Parent = slider
    })
    create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = main})
    create("UIStroke", {Transparency = 0.4, Thickness = 1.2, Color = Color3.fromRGB(59, 164, 255), Parent = main})
    
    local progress = create("Frame", {
        Name = "Progress",
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 =  = Color3.fromRGB(51, 139, 221),
        BorderSizePixel = 0,
        Parent = main
    })
    create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = progress})
    create("UIStroke", {Transparency = 0.3, Thickness = 1.2, Color = Color3.fromRGB(59, 164, 255), Parent = progress})
    
    local valueLabel = create("TextLabel", {
        Name = "Information",
        Size = UDim2.new(0, 168, 0, 15),
        Position = UDim2.new(0.4536, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Text = tostring(config.Default or config.Min) .. " " .. (config.Unit or ""),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 15,
        TextTransparency = 0.3,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        ZIndex = 5,
        Parent = main
    })
    
    local interact = create("TextButton", {
        Name = "Interact",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 10,
        Parent = main
    })
    
    local min = config.Min or 0
    local max = config.Max or 100
    local value = config.Default or min
    local dragging = false
    
    local function updateValue(inputX)
        local relativeX = math.clamp((inputX - main.AbsolutePosition.X) / main.AbsoluteSize.X, 0, 1)
        value = min + (max - min) * relativeX
        value = math.floor(value + 0.5)
        progress.Size = UDim2.new(relativeX, 0, 1, 0)
        valueLabel.Text = tostring(value) .. " " .. (config.Unit or "")
        if config.Callback then
            config.Callback(value)
        end
    end
    
    interact.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateValue(input.Position.X)
        end
    end)
    
    interact.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateValue(input.Position.X)
        end
    end)
    
    interact.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    updateValue(main.AbsolutePosition.X + (main.AbsoluteSize.X * ((value - min) / (max - min))))
    return slider
end

function Radix.CreateInput(tab, config)
    local input = create("Frame", {
        Name = config.Name,
        Size = UDim2.new(1, -10, 0, 40),
        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
        BorderSizePixel = 0,
        Parent = tab.Content
    })
    create("UICorner", {CornerRadius = UDim.new(0, 9), Parent = input})
    create("UIStroke", {Color = Color3.fromRGB(51, 51, 51), Parent = input})
    
    create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 200, 0, 14),
        Position = UDim2.new(0, 15, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Text = config.Name,
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = input
    })
    
    local inputFrame = create("Frame", {
        Name = "InputFrame",
        Size = UDim2.new(0, 120, 0, 30),
        Position = UDim2.new(1, -7, 0, 20),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(31, 31, 31),
        BorderSizePixel = 0,
        Parent = input
    })
    create("UICorner", {CornerRadius = UDim.new(0, 10), Parent = inputFrame})
    create("UIStroke", {Color = Color3.fromRGB(66, 66, 66), Parent = inputFrame})
    
    local inputBox = create("TextBox", {
        Name = "InputBox",
        Size = UDim2.new(1, -15, 0, 14),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Text = config.Default or "",
        PlaceholderText = config.Placeholder or "Enter text...",
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = inputFrame
    })
    
    inputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed and config.Callback then
            config.Callback(inputBox.Text)
        end
    end)
    
    return input
end

function Radix.CreateKeybind(tab, config)
    local keybind = create("Frame", {
        Name = config.Name,
        Size = UDim2.new(1, -10, 0, 40),
        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
        BorderSizePixel = 0,
        Parent = tab.Content
    })
    create("UICorner", {CornerRadius = UDim.new(0, 9), Parent = keybind})
    create("UIStroke", {Color = Color3.fromRGB(51, 51, 51), Parent = keybind})
    
    create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 200, 0, 14),
        Position = UDim2.new(0, 15, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Text = config.Name,
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = keybind
    })
    
    local keybindFrame = create("Frame", {
        Name = "KeybindFrame",
        Size = UDim2.new(0, 34, 0, 30),
        Position = UDim2.new(1, -7, 0, 20),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(31, 31, 31),
        BorderSizePixel = 0,
        Parent = keybind
    })
    create("UICorner", {CornerRadius = UDim.new(0, 10), Parent = keybindFrame})
    create("UIStroke", {Color = Color3.fromRGB(66, 66, 66), Parent = keybindFrame})
    
    local keybindBox = create("TextBox", {
        Name = "KeybindBox",
        Size = UDim2.new(1, -15, 0, 14),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Text = config.Default or "None",
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = keybindFrame
    })
    
    local waiting = false
    keybindBox.Focused:Connect(function()
        waiting = true
        keybindBox.Text = "[...]"
    end)
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if waiting and not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
            waiting = false
            keybindBox.Text = input.KeyCode.Name
            keybindBox:ReleaseFocus()
            if config.Callback then
                config.Callback(input.KeyCode)
            end
        end
    end)
    
    return keybind
end

function Radix.CreateDropdown(tab, config)
    local dropdown = create("Frame", {
        Name = config.Name,
        Size = UDim2.new(1, -10, 0, 40),
        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
        BorderSizePixel = 0,
        Parent = tab.Content
    })
    create("UICorner", {CornerRadius = UDim.new(0, 9), Parent = dropdown})
    create("UIStroke", {Color = Color3.fromRGB(51, 51, 51), Parent = dropdown})
    
    local title = create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 237, 0, 14),
        Position = UDim2.new(0, 15, 0, 20),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Text = config.Name,
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        ZIndex = 3,
        Parent = dropdown
    })
    
    local selected = create("TextLabel", {
        Name = "Selected",
        Size = UDim2.new(0, 168, 0, 14),
        Position = UDim2.new(1, -41, 0, 20),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Text = config.Default or config.Options[1] or "None",
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextScaled = true,
        TextTransparency = 0.5,
        TextXAlignment = Enum.TextXAlignment.Right,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = dropdown
    })
    create("UITextSizeConstraint", {MaxTextSize = 14, Parent = selected})
    
    local list = create("ScrollingFrame", {
        Name = "List",
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0, 38),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageTransparency = 0.7,
        ScrollBarImageColor3 = Color3.fromRGB(241, 241, 241),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Parent = dropdown
    })
    create("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 5),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = list
    })
    
    local toggleBtn = create("ImageButton", {
        Name = "Toggle",
        Size = UDim2.new(0, 24, 0, 24),
        Position = UDim2.new(1, -12, 0, 20),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Image = "rbxassetid://3926305904",
        ImageRectOffset = Vector2.new(564, 284),
        ImageRectSize = Vector2.new(36, 36),
        ImageColor3 = Color3.fromRGB(151, 151, 151),
        Parent = dropdown
    })
    
    local interact = create("TextButton", {
        Name = "Interact",
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 5,
        Parent = dropdown
    })
    
    local expanded = false
    local options = {}
    
    local function updateList()
        for _, opt in pairs(options) do
            opt:Destroy()
        end
        options = {}
        
        for i, option in pairs(config.Options or {}) do
            local optFrame = create("Frame", {
                Name = "Option" .. i,
                Size = UDim2.new(1, -12, 0, 38),
                BackgroundColor3 = Color3.fromRGB(31, 31, 31),
                BorderSizePixel = 0,
                Parent = list
            })
            create("UICorner", {CornerRadius = UDim.new(0, 9), Parent = optFrame})
            create("UIStroke", {Color = Color3.fromRGB(51, 51, 51), Parent = optFrame})
            
            create("TextLabel", {
                Name = "Title",
                Size = UDim2.new(0, 316, 0, 14),
                Position = UDim2.new(0, 15, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                Text = option,
                TextColor3 = Color3.fromRGB(241, 241, 241),
                TextSize = 14,
                TextScaled = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
                Parent = optFrame
            })
            
            local optInteract = create("TextButton", {
                Name = "Interact",
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = "",
                ZIndex = 5,
                Parent = optFrame
            })
            
            optInteract.MouseButton1Click:Connect(function()
                selected.Text = option
                if config.Callback then
                    config.Callback(option)
                end
                expanded = false
                TweenService:Create(list, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)}):Play()
            end)
            
            table.insert(options, optFrame)
        end
    end
    
    updateList()
    
    interact.MouseButton1Click:Connect(function()
        expanded = not expanded
        local targetSize = expanded and UDim2.new(1, 0, 0, math.min(#config.Options * 43, 180)) or UDim2.new(1, 0, 0, 0)
        TweenService:Create(list, TweenInfo.new(0.2), {Size = targetSize}):Play()
        dropdown.Size = expanded and UDim2.new(1, -10, 0, 40 + targetSize.Y.Offset) or UDim2.new(1, -10, 0, 40)
    end)
    
    return dropdown
end

function Radix.CreateLabel(tab, config)
    local label = create("Frame", {
        Name = config.Name,
        Size = UDim2.new(1, -10, 0, 35),
        BackgroundColor3 = Color3.fromRGB(26, 26, 26),
        BorderSizePixel = 0,
        Parent = tab.Content
    })
    create("UICorner", {CornerRadius = UDim.new(0, 9), Parent = label})
    create("UIStroke", {Color = Color3.fromRGB(41, 41, 41), Parent = label})
    
    local title = create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 441, 0, 14),
        Position = UDim2.new(0, 15, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Text = config.Text or config.Name,
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        Parent = label
    })
    
    return label
end

function Radix.CreateParagraph(tab, config)
    local paragraph = create("Frame", {
        Name = config.Name,
        Size = UDim2.new(1, -10, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(26, 26, 26),
        BorderSizePixel = 0,
        Parent = tab.Content
    })
    create("UICorner", {CornerRadius = UDim.new(0, 9), Parent = paragraph})
    create("UIStroke", {Color = Color3.fromRGB(41, 41, 41), Parent = paragraph})
    
    create("Frame", {
        Name = "Buffer",
        Size = UDim2.new(0, 0, 0, 8),
        BackgroundTransparency = 1,
        LayoutOrder = -1,
        Parent = paragraph
    })
    
    create("TextLabel", {
        Name = "Title",
        Size = UDim2.new(0, 438, 0, 14),
        Position = UDim2.new(1, -10, 0, 18),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Text = config.Title or config.Name,
        TextColor3 = Color3.fromRGB(241, 241, 241),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        LayoutOrder = 1,
        Parent = paragraph
    })
    
    create("TextLabel", {
        Name = "Content",
        Size = UDim2.new(0, 438, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.new(1, -10, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Text = config.Text or "",
        TextColor3 = Color3.fromRGB(181, 181, 181),
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium),
        LayoutOrder = 2,
        Parent = paragraph
    })
    
    create("Frame", {
        Name = "Buffer",
        Size = UDim2.new(0, 0, 0, 8),
        BackgroundTransparency = 1,
        LayoutOrder = 5,
        Parent = paragraph
    })
    
    create("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = paragraph
    })
    
    return paragraph
end

function Radix.CreateDivider(tab, config)
    local divider = create("Frame", {
        Name = "Divider",
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Parent = tab.Content
    })
    
    create("Frame", {
        Name = "Divider",
        Size = UDim2.new(1, -50, 0, 2),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.85,
        BorderSizePixel = 0,
        Parent = divider
    }):AddChild(create("UICorner", {CornerRadius = UDim.new(1, 0)}))
    
    return divider
end

return Radix

--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   88'        VP  8D      88      88    88 d8' 8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  SIGMA LIB 
]=]

local module = {}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

function module:start()
    local start = {}
    local dragToggle, dragStart, startPos
    
    local UI = Instance.new("ScreenGui")
    UI.Name = "SigmaLib" .. math.random(5, 100000)
    UI.Parent = game.CoreGui
    UI.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local Main = Instance.new("Frame", UI)
    Main.Name = "Main"
    Main.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    Main.BorderSizePixel = 0
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 420, 0, 310)

    local function updateInput(input)
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
            dragToggle = true
            dragStart = input.Position
            startPos = Main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch and dragToggle then
            updateInput(input)
        end
    end)

    local Shadow = Instance.new("Frame", Main)
    Shadow.Name = "Shadow"
    Shadow.ZIndex = 0
    Shadow.BackgroundTransparency = 1
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.Size = UDim2.new(1, 35, 1.09626, 35)
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)

    local ShadowImage = Instance.new("ImageLabel", Shadow)
    ShadowImage.Name = "Image"
    ShadowImage.ZIndex = 0
    ShadowImage.BackgroundTransparency = 1
    ShadowImage.ImageTransparency = 0.3
    ShadowImage.ImageColor3 = Color3.fromRGB(21, 21, 21)
    ShadowImage.AnchorPoint = Vector2.new(0.5, 0.5)
    ShadowImage.Image = "rbxassetid://5587865193"
    ShadowImage.Size = UDim2.new(1.6, 0, 1.3, 0)
    ShadowImage.Position = UDim2.new(0.5, 0, 0.5, 0)

    local Topbar = Instance.new("Frame", Main)
    Topbar.Name = "Topbar"
    Topbar.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(1, 0, 0.018, 23)

    local Title = Instance.new("TextLabel", Topbar)
    Title.Name = "Title"
    Title.BackgroundTransparency = 1
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Size = UDim2.new(-0.22195, 200, 1, 0)
    Title.Position = UDim2.new(0, 6, 0, 0)
    Title.Text = "Murder Mystery 2"

    local Hide = Instance.new("ImageButton", Topbar)
    Hide.Name = "Hide"
    Hide.BackgroundTransparency = 1
    Hide.ImageTransparency = 0.8
    Hide.ImageColor3 = Color3.fromRGB(241, 241, 241)
    Hide.ZIndex = 5
    Hide.AnchorPoint = Vector2.new(1, 0.5)
    Hide.Image = "http://www.roblox.com/asset/?id=10137832201"
    Hide.Size = UDim2.new(0, 24, 0, 24)
    Hide.Position = UDim2.new(1, -5, 0.5, 0)
    Hide.MouseButton1Click:Connect(function()
        start:Destroy()
    end)

    local ServerHop = Instance.new("TextButton", Topbar)
    ServerHop.Name = "ServerHop"
    ServerHop.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    ServerHop.TextColor3 = Color3.fromRGB(255, 255, 255)
    ServerHop.AutoButtonColor = false
    ServerHop.TextSize = 14
    ServerHop.FontFace = Font.new("rbxassetid://12187365364")
    ServerHop.AnchorPoint = Vector2.new(0, 0.5)
    ServerHop.Size = UDim2.new(-0.3, 200, 0, 18)
    ServerHop.Position = UDim2.new(0.29515, 0, 0.5, 0)
    ServerHop.Text = "Server Hop"
    local ServerHopStroke = Instance.new("UIStroke", ServerHop)
    ServerHopStroke.Color = Color3.fromRGB(53, 53, 53)
    ServerHopStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    local ServerHopCorner = Instance.new("UICorner", ServerHop)
    ServerHopCorner.CornerRadius = UDim.new(0, 4)

    local Rejoin = Instance.new("TextButton", Topbar)
    Rejoin.Name = "Rejoin"
    Rejoin.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    Rejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
    Rejoin.AutoButtonColor = false
    Rejoin.TextSize = 14
    Rejoin.FontFace = Font.new("rbxassetid://12187365364")
    Rejoin.AnchorPoint = Vector2.new(0, 0.5)
    Rejoin.Size = UDim2.new(-0.3, 200, 0, 18)
    Rejoin.Position = UDim2.new(0.47054, 5, 0.5, 0)
    Rejoin.Text = "Rejoin"
    local RejoinStroke = Instance.new("UIStroke", Rejoin)
    RejoinStroke.Color = Color3.fromRGB(53, 53, 53)
    RejoinStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    local RejoinCorner = Instance.new("UICorner", Rejoin)
    RejoinCorner.CornerRadius = UDim.new(0, 4)
    Rejoin.MouseButton1Click:Connect(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
    end)

    local CopyTemplate = Instance.new("TextButton", Topbar)
    CopyTemplate.Name = "CopyTemplate"
    CopyTemplate.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    CopyTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyTemplate.AutoButtonColor = false
    CopyTemplate.TextSize = 14
    CopyTemplate.FontFace = Font.new("rbxassetid://12187365364")
    CopyTemplate.AnchorPoint = Vector2.new(0, 0.5)
    CopyTemplate.Size = UDim2.new(-0.25619, 200, 0, 18)
    CopyTemplate.Position = UDim2.new(0.64615, 10, 0.5, 0)
    CopyTemplate.Text = "Copy Template"
    local CopyTemplateStroke = Instance.new("UIStroke", CopyTemplate)
    CopyTemplateStroke.Color = Color3.fromRGB(53, 53, 53)
    CopyTemplateStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    local CopyTemplateCorner = Instance.new("UICorner", CopyTemplate)
    CopyTemplateCorner.CornerRadius = UDim.new(0, 4)

    local Container = Instance.new("ScrollingFrame", Main)
    Container.Name = "Container"
    Container.BackgroundTransparency = 1
    Container.Size = UDim2.new(1, 0, 0.96638, -44)
    Container.Position = UDim2.new(0, 0, 0.09492, 0)
    Container.ScrollBarThickness = 0
    Container.Active = true

    local UIListLayout = Instance.new("UIListLayout", Container)
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 4)

    local ContainerPadding = Instance.new("UIPadding", Container)
    ContainerPadding.PaddingTop = UDim.new(0, 10)

    local UserContainer = Instance.new("Frame", Main)
    UserContainer.Name = "UserContainer"
    UserContainer.BackgroundTransparency = 1
    UserContainer.Size = UDim2.new(1, 0, -0.023, 31)
    UserContainer.Position = UDim2.new(0, 0, 0.91935, 0)

    local UserIcon = Instance.new("ImageLabel", UserContainer)
    UserIcon.Name = "UserIcon"
    UserIcon.BackgroundTransparency = 1
    UserIcon.AnchorPoint = Vector2.new(0, 0.5)
    UserIcon.Size = UDim2.new(0, 18, 0, 18)
    UserIcon.Position = UDim2.new(0, 6, 0.5, 0)
    UserIcon.Image = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60)
    local UserIconCorner = Instance.new("UICorner", UserIcon)
    local UserIconStroke = Instance.new("UIStroke", UserIcon)
    UserIconStroke.Color = Color3.fromRGB(49, 49, 49)

    local Footer = Instance.new("TextLabel", UserContainer)
    Footer.Name = "Footer"
    Footer.BackgroundTransparency = 1
    Footer.TextSize = 12
    Footer.TextXAlignment = Enum.TextXAlignment.Left
    Footer.TextScaled = true
    Footer.FontFace = Font.new("rbxassetid://12187365364")
    Footer.TextColor3 = Color3.fromRGB(255, 255, 255)
    Footer.RichText = true
    Footer.AnchorPoint = Vector2.new(0, 0.5)
    Footer.Size = UDim2.new(-0.22195, 200, 0.02712, 14)
    Footer.Position = UDim2.new(0.00476, 30, 0.5, 0)
    Footer.Text = "Welcome <b>" .. Players.LocalPlayer.Name .. "</b>!"

    local Separator = Instance.new("Frame", UserContainer)
    Separator.Name = "Separator"
    Separator.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    Separator.BorderSizePixel = 0
    Separator.Size = UDim2.new(1, 0, 0, 1)

    function start:ServerHopCallback(callback)
        ServerHop.MouseButton1Click:Connect(callback)
    end

    function start:AddPlayer(player, inventoryCost, isElite, eliminations, survivals, level)
        local x = {}
        local playerToAdd = Players:FindFirstChild(player)
        if not playerToAdd then return end -- Prevent nil index error

        local Name = playerToAdd.Name
        local playerFrame = Instance.new("Frame", Container)
        playerFrame.Name = Name
        playerFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
        playerFrame.Size = UDim2.new(1, -12, -0.01246, 65)
        local PlayerFrameStroke = Instance.new("UIStroke", playerFrame)
        PlayerFrameStroke.Transparency = 0.5
        PlayerFrameStroke.Color = Color3.fromRGB(85, 85, 85)
        local PlayerFrameCorner = Instance.new("UICorner", playerFrame)

        local InvCost = Instance.new("TextLabel", playerFrame)
        InvCost.Name = "InvCost"
        InvCost.BackgroundTransparency = 1
        InvCost.TextWrapped = true
 
        InvCost.TextSize = 12
        InvCost.TextXAlignment = Enum.TextXAlignment.Left
        InvCost.TextTransparency = 0.3
        InvCost.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
        InvCost.TextColor3 = Color3.fromRGB(255, 255, 255)
        InvCost.RichText = true
        InvCost.Size = UDim2.new(0, 130, 0, 12)
        InvCost.Position = UDim2.new(0.025, 2, 0.406, 2)
        InvCost.Text = "<font color=\"rgb(195,195,195)\">Inventory Cost:</font> " .. tostring(inventoryCost)

        local User = Instance.new("TextButton", playerFrame)
        User.Name = "User"
        User.BackgroundTransparency = 1
        User.TextColor3 = Color3.fromRGB(255, 255, 255)
        User.TextXAlignment = Enum.TextXAlignment.Left
        User.TextSize = 16
        User.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium)
        User.Size = UDim2.new(0, 139, 0, 18)
        User.Position = UDim2.new(0.026, 0, 0.138, -2)
        User.Text = "@" .. Name

        local Elite = Instance.new("TextLabel", playerFrame)
        Elite.Name = "Elite"
        Elite.BackgroundTransparency = 1
        Elite.TextWrapped = true
        Elite.TextSize = 12
        Elite.TextXAlignment = Enum.TextXAlignment.Left
        Elite.TextTransparency = 0.3
        Elite.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
        Elite.TextColor3 = Color3.fromRGB(255, 255, 255)
        Elite.RichText = true
        Elite.Size = UDim2.new(0, 130, 0, 12)
        Elite.Position = UDim2.new(0.025, 2, 0.406, 15)
        Elite.Text = "<font color=\"rgb(195,195,195)\">Elite:</font> " .. tostring(isElite)

        local Eliminations = Instance.new("TextLabel", playerFrame)
        Eliminations.Name = "Eliminations"
        Eliminations.BackgroundTransparency = 1
        Eliminations.TextWrapped = true
        Eliminations.TextSize = 12
        Eliminations.TextXAlignment = Enum.TextXAlignment.Left
        Eliminations.TextTransparency = 0.3
        Eliminations.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
        Eliminations.TextColor3 = Color3.fromRGB(255, 255, 255)
        Eliminations.RichText = true
        Eliminations.Size = UDim2.new(0, 130, 0, 12)
        Eliminations.Position = UDim2.new(0.361, 2, 0.406, -11)
        Eliminations.Text = "<font color=\"rgb(195,195,195)\">Eliminations:</font> " .. tostring(eliminations)

        local Survivals = Instance.new("TextLabel", playerFrame)
        Survivals.Name = "Survivals"
        Survivals.BackgroundTransparency = 1
        Survivals.TextWrapped = true
        Survivals.TextSize = 12
        Survivals.TextXAlignment = Enum.TextXAlignment.Left
        Survivals.TextTransparency = 0.3
        Survivals.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
        Survivals.TextColor3 = Color3.fromRGB(255, 255, 255)
        Survivals.RichText = true
        Survivals.Size = UDim2.new(0, 130, 0, 12)
        Survivals.Position = UDim2.new(0.361, 2, 0.403, 2)
        Survivals.Text = "<font color=\"rgb(195,195,195)\">Survivals:</font> " .. tostring(survivals)

        local Level = Instance.new("TextLabel", playerFrame)
        Level.Name = "Level"
        Level.BackgroundTransparency = 1
        Level.TextWrapped = true
        Level.TextSize = 12
        Level.TextXAlignment = Enum.TextXAlignment.Left
        Level.TextTransparency = 0.3
        Level.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
        Level.TextColor3 = Color3.fromRGB(255, 255, 255)
        Level.RichText = true
        Level.Size = UDim2.new(0, 130, 0, 12)
        Level.Position = UDim2.new(0.361, 2, 0.406, 15)
        Level.Text = "Level: " .. tostring(level)

        local TargetIcon = Instance.new("ImageLabel", playerFrame)
        TargetIcon.Name = "TargetIcon"
        TargetIcon.BackgroundTransparency = 1
        TargetIcon.AnchorPoint = Vector2.new(0, 0.5)
        TargetIcon.Size = UDim2.new(0, 40, 0, 40)
        TargetIcon.Position = UDim2.new(0.83067, 6, 0.51742, 0)
        TargetIcon.Image = Players:GetUserThumbnailAsync(playerToAdd.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60)
        local TargetIconCorner = Instance.new("UICorner", TargetIcon)
        TargetIconCorner.CornerRadius = UDim.new(0, 12)
        local TargetIconStroke = Instance.new("UIStroke", TargetIcon)
        TargetIconStroke.Color = Color3.fromRGB(49, 49, 49)

        function x:SetNameCallback(callback)
            User.MouseButton1Click:Connect(callback)
        end

        function x:SetMessageCallback(callback)
            CopyTemplate.MouseButton1Click:Connect(callback)
        end

        return x
    end

    function start:Destroy()
        UI:Destroy()
    end

    return start
end

return module

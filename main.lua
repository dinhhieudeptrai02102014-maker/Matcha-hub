-- [[ MATCHA HUB - BREAK & STEAL AN EGG ]] --
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local guiName = "MatchaHubUI"
local parentGui = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")

if parentGui:FindFirstChild(guiName) then
    parentGui[guiName]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = parentGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local _G_Config = {
    AutoBreak = false,
    AutoSteal = false,
    AutoReturnHome = false,
    FastSteal = false,
    HomeCFrame = nil
}

if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    _G_Config.HomeCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
end

local Colors = {
    BgDark = Color3.fromRGB(10, 18, 14),
    SidebarBg = Color3.fromRGB(12, 24, 18),
    CardBg = Color3.fromRGB(15, 30, 22),
    CardStroke = Color3.fromRGB(25, 55, 38),
    AccentGreen = Color3.fromRGB(46, 204, 113),
    ToggleOn = Color3.fromRGB(46, 204, 113),
    ToggleOff = Color3.fromRGB(40, 55, 48),
    TextWhite = Color3.fromRGB(240, 250, 245),
    TextGray = Color3.fromRGB(140, 170, 155)
}

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Colors.BgDark
MainFrame.Position = UDim2.new(0.5, -340, 0.5, -210)
MainFrame.Size = UDim2.new(0, 680, 0, 420)
MainFrame.Visible = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Colors.AccentGreen
MainStroke.Thickness = 1.5

local Header = Instance.new("Frame")
Header.Parent = MainFrame
Header.BackgroundTransparency = 1
Header.Size = UDim2.new(1, 0, 0, 50)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = Header
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 20, 0, 8)
TitleLabel.Size = UDim2.new(0, 300, 0, 22)
TitleLabel.Font = Enum.Font.FredokaOne
TitleLabel.Text = "MATCHA HUB"
TitleLabel.TextColor3 = Colors.AccentGreen
TitleLabel.TextSize = 22
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = Header
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 20, 0, 30)
SubTitle.Size = UDim2.new(0, 300, 0, 15)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Break and Steal an Egg"
SubTitle.TextColor3 = Colors.TextGray
SubTitle.TextSize = 11
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = Header
CloseBtn.BackgroundColor3 = Colors.CardBg
CloseBtn.Position = UDim2.new(1, -35, 0, 10)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Colors.TextWhite
CloseBtn.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = Header
MinimizeBtn.BackgroundColor3 = Colors.CardBg
MinimizeBtn.Position = UDim2.new(1, -65, 0, 10)
MinimizeBtn.Size = UDim2.new(0, 25, 0, 25)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "─"
MinimizeBtn.TextColor3 = Colors.TextWhite
MinimizeBtn.TextSize = 12

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeBtn

MinimizeBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

local FloatingBtn = Instance.new("TextButton")
FloatingBtn.Name = "FloatingBtn"
FloatingBtn.Parent = ScreenGui
FloatingBtn.BackgroundColor3 = Colors.BgDark
FloatingBtn.Position = UDim2.new(0.92, 0, 0.45, 0)
FloatingBtn.Size = UDim2.new(0, 50, 0, 50)
FloatingBtn.Font = Enum.Font.FredokaOne
FloatingBtn.Text = "M"
FloatingBtn.TextColor3 = Colors.AccentGreen
FloatingBtn.TextSize = 24

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(1, 0)
FloatCorner.Parent = FloatingBtn

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Parent = FloatingBtn
FloatStroke.Color = Colors.AccentGreen
FloatStroke.Thickness = 2

FloatingBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.M then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Colors.SidebarBg
Sidebar.Position = UDim2.new(0, 15, 0, 55)
Sidebar.Size = UDim2.new(0, 140, 0, 350)

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 10)
SideCorner.Parent = Sidebar

local SideLayout = Instance.new("UIListLayout")
SideLayout.Parent = Sidebar
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0, 5)

local SidePadding = Instance.new("UIPadding")
SidePadding.Parent = Sidebar
SidePadding.PaddingTop = UDim.new(0, 10)
SidePadding.PaddingLeft = UDim.new(0, 8)
SidePadding.PaddingRight = UDim.new(0, 8)

local tabs = {"Main", "Break", "Steal", "Teleport", "Settings", "Info"}
for i, tabName in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Parent = Sidebar
    tabBtn.BackgroundColor3 = (i == 1) and Colors.AccentGreen or Color3.fromRGB(0, 0, 0)
    tabBtn.BackgroundTransparency = (i == 1) and 0 or 1
    tabBtn.Size = UDim2.new(1, 0, 0, 32)
    tabBtn.Font = Enum.Font.GothamSemibold
    tabBtn.Text = "  " .. tabName
    tabBtn.TextColor3 = (i == 1) and Colors.BgDark or Colors.TextGray
    tabBtn.TextSize = 13
    tabBtn.TextXAlignment = Enum.TextXAlignment.Left

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = tabBtn
end

local ContentArea = Instance.new("Frame")
ContentArea.Parent = MainFrame
ContentArea.BackgroundTransparency = 1
ContentArea.Position = UDim2.new(0, 165, 0, 55)
ContentArea.Size = UDim2.new(0, 300, 0, 350)

local BreakCard = Instance.new("Frame")
BreakCard.Parent = ContentArea
BreakCard.BackgroundColor3 = Colors.CardBg
BreakCard.Size = UDim2.new(1, 0, 0, 120)

local BCorner = Instance.new("UICorner")
BCorner.CornerRadius = UDim.new(0, 8)
BCorner.Parent = BreakCard

local BStroke = Instance.new("UIStroke")
BStroke.Parent = BreakCard
BStroke.Color = Colors.CardStroke

local BTitle = Instance.new("TextLabel")
BTitle.Parent = BreakCard
BTitle.BackgroundTransparency = 1
BTitle.Position = UDim2.new(0, 12, 0, 10)
BTitle.Font = Enum.Font.FredokaOne
BTitle.Text = "⛏ BREAK"
BTitle.TextColor3 = Colors.AccentGreen
BTitle.TextSize = 16
BTitle.TextXAlignment = Enum.TextXAlignment.Left

local StealCard = Instance.new("Frame")
StealCard.Parent = ContentArea
StealCard.BackgroundColor3 = Colors.CardBg
StealCard.Position = UDim2.new(0, 0, 0, 130)
StealCard.Size = UDim2.new(1, 0, 0, 220)

local SCorner = Instance.new("UICorner")
SCorner.CornerRadius = UDim.new(0, 8)
SCorner.Parent = StealCard

local SStroke = Instance.new("UIStroke")
SStroke.Parent = StealCard
SStroke.Color = Colors.CardStroke

local STitle = Instance.new("TextLabel")
STitle.Parent = StealCard
STitle.BackgroundTransparency = 1
STitle.Position = UDim2.new(0, 12, 0, 10)
STitle.Font = Enum.Font.FredokaOne
STitle.Text = "🎭 STEAL"
STitle.TextColor3 = Colors.AccentGreen
STitle.TextSize = 16
STitle.TextXAlignment = Enum.TextXAlignment.Left

local function AddToggle(parent, yPos, text, defaultState, callback)
    local container = Instance.new("Frame")
    container.Parent = parent
    container.BackgroundTransparency = 1
    container.Position = UDim2.new(0, 12, 0, yPos)
    container.Size = UDim2.new(1, -24, 0, 30)

    local lbl = Instance.new("TextLabel")
    lbl.Parent = container
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(0.7, 0, 1, 0)
    lbl.Font = Enum.Font.GothamSemibold
    lbl.Text = text
    lbl.TextColor3 = Colors.TextWhite
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local switch = Instance.new("TextButton")
    switch.Parent = container
    switch.BackgroundColor3 = defaultState and Colors.ToggleOn or Colors.ToggleOff
    switch.Position = UDim2.new(1, -40, 0.5, -10)
    switch.Size = UDim2.new(0, 40, 0, 20)
    switch.Text = ""

    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switch

    local circle = Instance.new("Frame")
    circle.Parent = switch
    circle.BackgroundColor3 = Colors.TextWhite
    circle.Position = defaultState and UDim2.new(1, -18, 0.1, 0) or UDim2.new(0, 2, 0.1, 0)
    circle.Size = UDim2.new(0, 16, 0, 16)

    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = circle

    local state = defaultState
    switch.MouseButton1Click:Connect(function()
        state = not state
        switch.BackgroundColor3 = state and Colors.ToggleOn or Colors.ToggleOff
        circle.Position = state and UDim2.new(1, -18, 0.1, 0) or UDim2.new(0, 2, 0.1, 0)
        callback(state)
    end)
end

AddToggle(BreakCard, 65, "Auto Break", false, function(s)
    _G_Config.AutoBreak = s
end)

AddToggle(StealCard, 65, "Auto Steal", false, function(s)
    _G_Config.AutoSteal = s
end)

AddToggle(StealCard, 110, "Auto Return Home", false, function(s)
    _G_Config.AutoReturnHome = s
end)

AddToggle(StealCard, 155, "Fast Steal (No Delay)", false, function(s)
    _G_Config.FastSteal = s
end)

local RightPanel = Instance.new("Frame")
RightPanel.Parent = MainFrame
RightPanel.BackgroundTransparency = 1
RightPanel.Position = UDim2.new(0, 475, 0, 55)
RightPanel.Size = UDim2.new(0, 190, 0, 350)

local InfoCard = Instance.new("Frame")
InfoCard.Parent = RightPanel
InfoCard.BackgroundColor3 = Colors.CardBg
InfoCard.Size = UDim2.new(1, 0, 0, 110)

local ICorner = Instance.new("UICorner")
ICorner.CornerRadius = UDim.new(0, 8)
ICorner.Parent = InfoCard

local IStroke = Instance.new("UIStroke")
IStroke.Parent = InfoCard
IStroke.Color = Colors.CardStroke

local ITitle = Instance.new("TextLabel")
ITitle.Parent = InfoCard
ITitle.BackgroundTransparency = 1
ITitle.Position = UDim2.new(0, 10, 0, 8)
ITitle.Font = Enum.Font.GothamBold
ITitle.Text = "ⓘ INFORMATION"
ITitle.TextColor3 = Colors.AccentGreen
ITitle.TextSize = 11
ITitle.TextXAlignment = Enum.TextXAlignment.Left

local infoText = Instance.new("TextLabel")
infoText.Parent = InfoCard
infoText.BackgroundTransparency = 1
infoText.Position = UDim2.new(0, 10, 0, 30)
infoText.Size = UDim2.new(1, -20, 0, 70)
infoText.Font = Enum.Font.Gotham
infoText.Text = "Current Zone: Zone 1\nTarget Rarity: Legendary\nStatus: Ready"
infoText.TextColor3 = Colors.TextGray
infoText.TextSize = 11
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Top

local BannerCard = Instance.new("Frame")
BannerCard.Parent = RightPanel
BannerCard.BackgroundColor3 = Colors.CardBg
BannerCard.Position = UDim2.new(0, 0, 0, 120)
BannerCard.Size = UDim2.new(1, 0, 0, 230)

local BnrCorner = Instance.new("UICorner")
BnrCorner.CornerRadius = UDim.new(0, 8)
BnrCorner.Parent = BannerCard

local BnrStroke = Instance.new("UIStroke")
BnrStroke.Parent = BannerCard
BnrStroke.Color = Colors.CardStroke

local BannerText = Instance.new("TextLabel")
BannerText.Parent = BannerCard
BannerText.BackgroundTransparency = 1
BannerText.Position = UDim2.new(0, 15, 0, 15)
BannerText.Size = UDim2.new(1, -30, 0, 60)
BannerText.Font = Enum.Font.FredokaOne
BannerText.Text = "MATCHA HUB"
BannerText.TextColor3 = Colors.AccentGreen
BannerText.TextSize = 22
BannerText.TextXAlignment = Enum.TextXAlignment.Left

local QuoteText = Instance.new("TextLabel")
QuoteText.Parent = BannerCard
QuoteText.BackgroundTransparency = 1
QuoteText.Position = UDim2.new(0, 15, 1, -50)
QuoteText.Size = UDim2.new(1, -30, 0, 40)
QuoteText.Font = Enum.Font.GothamItalic
QuoteText.Text = "Good things take time...\nJust like matcha. ♥"
QuoteText.TextColor3 = Colors.TextGray
QuoteText.TextSize = 10
QuoteText.TextXAlignment = Enum.TextXAlignment.Left

task.spawn(function()
    while true do
        task.wait(0.1)
        pcall(function()
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local hrp = char.HumanoidRootPart

            if _G_Config.AutoBreak then
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then tool:Activate() end
                
                local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes", true) 
                            or game:GetService("ReplicatedStorage"):FindFirstChild("Events", true)
                if remote then
                    for _, r in pairs(remote:GetChildren()) do
                        if r:IsA("RemoteEvent") and (r.Name:lower():find("hit") or r.Name:lower():find("attack")) then
                            r:FireServer()
                        end
                    end
                end
            end

            if _G_Config.AutoSteal then
                for _, v in pairs(workspace:GetDescendants()) do
                    if not _G_Config.AutoSteal then break end
                    if v:IsA("ProximityPrompt") then
                        local parentPart = v.Parent
                        if parentPart and parentPart:IsA("BasePart") then
                            if (parentPart.Position - hrp.Position).Magnitude <= v.MaxActivationDistance + 5 then
                                fireproximityprompt(v)
                                if not _G_Config.FastSteal then task.wait(0.2) end
                                
                                if _G_Config.AutoReturnHome and _G_Config.HomeCFrame then
                                    hrp.CFrame = _G_Config.HomeCFrame
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

print("[MATCHA HUB]: Loaded successfully!")

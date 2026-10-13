-- [[ MATCHA HUB v9.0 - GOD ULTRA OVERPOWERED EDITION ]] --
-- [[ Break and Steal an Egg Specialized Engine ]] --

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Anti AFK
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- Xóa UI cũ nếu có
local guiName = "MatchaHubGodVIP"
local parentGui = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")

if parentGui:FindFirstChild(guiName) then
    parentGui[guiName]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = parentGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Config System
local _G_Config = {
    AutoBreak = false,
    AutoSteal = false,
    FastSteal = true,
    InstantTP = true,
    AutoRebirth = false,
    AutoHatch = false,
    AutoUpgrade = false,
    SelectedZone = "Zone 1",
    TargetRarity = "All",
    HomeCFrame = nil,
    ZoneCFrame = nil,
    IsStealing = false,
    WalkSpeed = 16,
    JumpPower = 50
}

local Zones = {
    ["Zone 1"] = Vector3.new(0, 5, 0),
    ["Zone 2"] = Vector3.new(100, 5, 0),
    ["Zone 3"] = Vector3.new(200, 5, 0),
    ["Zone 4"] = Vector3.new(300, 5, 0),
    ["Zone 5"] = Vector3.new(400, 5, 0)
}

local Rarities = {"All", "Rare+", "Epic+", "Legendary+", "Mythic+", "Secret", "Godly"}

local function SaveHomePosition()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        _G_Config.HomeCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
SaveHomePosition()

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    SaveHomePosition()
end)

-- UI Theme Dark Matcha Neon
local C = {
    BgMain     = Color3.fromRGB(10, 14, 12),
    BgSidebar  = Color3.fromRGB(6, 10, 8),
    CardBg     = Color3.fromRGB(15, 22, 18),
    CardBorder = Color3.fromRGB(30, 60, 40),
    MatchaGlow = Color3.fromRGB(46, 230, 120),
    MatchaDark = Color3.fromRGB(20, 100, 50),
    TextWhite  = Color3.fromRGB(250, 255, 252),
    TextMuted  = Color3.fromRGB(130, 170, 145),
    ToggleOff  = Color3.fromRGB(25, 38, 30)
}

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = C.BgMain
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -225)
MainFrame.Size = UDim2.new(0, 700, 0, 450)
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = C.MatchaGlow
MainStroke.Thickness = 2.5

-- Header UI
local Header = Instance.new("Frame")
Header.Parent = MainFrame
Header.BackgroundColor3 = C.BgSidebar
Header.Size = UDim2.new(1, 0, 0, 55)

local HeaderLine = Instance.new("Frame")
HeaderLine.Parent = Header
HeaderLine.BackgroundColor3 = C.MatchaGlow
HeaderLine.Position = UDim2.new(0, 0, 1, -2)
HeaderLine.Size = UDim2.new(1, 0, 0, 2)
HeaderLine.BorderSizePixel = 0

local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 20, 0, 6)
Title.Size = UDim2.new(0, 380, 0, 25)
Title.Font = Enum.Font.FredokaOne
Title.Text = "🍵 MATCHA HUB v9.0 GOD OVERPOWERED"
Title.TextColor3 = C.MatchaGlow
Title.TextSize = 21
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = Header
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 20, 0, 31)
SubTitle.Size = UDim2.new(0, 380, 0, 15)
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.Text = "Break & Steal an Egg • Ultimate Ouroboros Power Engine"
SubTitle.TextColor3 = C.TextMuted
SubTitle.TextSize = 10
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = Header
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseBtn.Position = UDim2.new(1, -38, 0, 14)
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = C.TextWhite
CloseBtn.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Float Toggle Button
local FloatBtn = Instance.new("TextButton")
FloatBtn.Name = "FloatBtn"
FloatBtn.Parent = ScreenGui
FloatBtn.BackgroundColor3 = C.BgMain
FloatBtn.Position = UDim2.new(0.92, 0, 0.4, 0)
FloatBtn.Size = UDim2.new(0, 58, 0, 58)
FloatBtn.Font = Enum.Font.FredokaOne
FloatBtn.Text = "🍵"
FloatBtn.TextSize = 28

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(1, 0)
FloatCorner.Parent = FloatBtn

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Parent = FloatBtn
FloatStroke.Color = C.MatchaGlow
FloatStroke.Thickness = 3

FloatBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.M then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = C.BgSidebar
Sidebar.Position = UDim2.new(0, 0, 0, 55)
Sidebar.Size = UDim2.new(0, 155, 1, -55)

local SideLayout = Instance.new("UIListLayout")
SideLayout.Parent = Sidebar
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0, 6)

local SidePad = Instance.new("UIPadding")
SidePad.Parent = Sidebar
SidePad.PaddingTop = UDim.new(0, 12)
SidePad.PaddingLeft = UDim.new(0, 10)
SidePad.PaddingRight = UDim.new(0, 10)

local ContentContainer = Instance.new("Frame")
ContentContainer.Parent = MainFrame
ContentContainer.BackgroundTransparency = 1
ContentContainer.Position = UDim2.new(0, 165, 0, 65)
ContentContainer.Size = UDim2.new(0, 525, 0, 375)

local Pages = {}

local function CreateTab(name, icon, isDefault)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = Sidebar
    TabBtn.BackgroundColor3 = isDefault and C.MatchaDark or Color3.fromRGB(0, 0, 0)
    TabBtn.BackgroundTransparency = isDefault and 0 or 1
    TabBtn.Size = UDim2.new(1, 0, 0, 38)
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.Text = "  " .. icon .. "  " .. name
    TabBtn.TextColor3 = isDefault and C.TextWhite or C.TextMuted
    TabBtn.TextSize = 12
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = TabBtn

    local Page = Instance.new("ScrollingFrame")
    Page.Parent = ContentContainer
    Page.BackgroundTransparency = 1
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Visible = isDefault
    Page.ScrollBarThickness = 3
    Page.ScrollBarImageColor3 = C.MatchaGlow

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = Page
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 10)

    Pages[name] = {Btn = TabBtn, View = Page}

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do
            p.View.Visible = false
            p.Btn.BackgroundTransparency = 1
            p.Btn.TextColor3 = C.TextMuted
        end
        Page.Visible = true
        TabBtn.BackgroundTransparency = 0
        TabBtn.BackgroundColor3 = C.MatchaDark
        TabBtn.TextColor3 = C.TextWhite
    end)

    return Page
end

local MainTab   = CreateTab("God Main", "👑", true)
local BreakTab  = CreateTab("Auto Break", "⛏️", false)
local StealTab  = CreateTab("Auto Steal", "🎭", false)
local MiscTab   = CreateTab("Misc & Fast", "⚡", false)

local function CreateCard(parent, title, sizeY)
    local Card = Instance.new("Frame")
    Card.Parent = parent
    Card.BackgroundColor3 = C.CardBg
    Card.Size = UDim2.new(1, -10, 0, sizeY or 120)

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 10)
    CardCorner.Parent = Card

    local CardStroke = Instance.new("UIStroke")
    CardStroke.Parent = Card
    CardStroke.Color = C.CardBorder
    CardStroke.Thickness = 1.5

    local CardTitle = Instance.new("TextLabel")
    CardTitle.Parent = Card
    CardTitle.BackgroundTransparency = 1
    CardTitle.Position = UDim2.new(0, 12, 0, 8)
    CardTitle.Font = Enum.Font.FredokaOne
    CardTitle.Text = title

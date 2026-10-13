-- [[ MATCHA HUB v8.0 - SUPER VIP GOD EDITION ]] --
-- [[ Specialized Break and Steal an Egg ]] --

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Xóa UI cũ
local guiName = "MatchaHubVIP"
local parentGui = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")

if parentGui:FindFirstChild(guiName) then
    parentGui[guiName]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = parentGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Global Config VIP
local _G_Config = {
    AutoBreak = false,
    AutoSteal = false,
    FastSteal = true,
    GodSpeed = true,
    AutoUpgrade = false,
    AutoRebirth = false,
    AutoHatch = false,
    EggESP = false,
    PlayerESP = false,
    WalkSpeed = 16,
    JumpPower = 50,
    SelectedZone = "Zone 1",
    TargetRarity = "All",
    HomeCFrame = nil,
    ZoneCFrame = nil,
    IsStealing = false
}

local Zones = {
    ["Zone 1"] = Vector3.new(0, 5, 0),
    ["Zone 2"] = Vector3.new(100, 5, 0),
    ["Zone 3"] = Vector3.new(200, 5, 0),
    ["Zone 4"] = Vector3.new(300, 5, 0),
    ["Zone 5"] = Vector3.new(400, 5, 0)
}

local Rarities = {"All", "Rare+", "Epic+", "Legendary+", "Mythic+", "Secret"}

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

-- VIP Color Palette
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

-- Header VIP
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
Title.Size = UDim2.new(0, 350, 0, 25)
Title.Font = Enum.Font.FredokaOne
Title.Text = "🍵 MATCHA HUB v8.0 GOD VIP"
Title.TextColor3 = C.MatchaGlow
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = Header
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 20, 0, 31)
SubTitle.Size = UDim2.new(0, 350, 0, 15)
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.Text = "Break & Steal an Egg • Ouroboros God Core"
SubTitle.TextColor3 = C.TextMuted
SubTitle.Text

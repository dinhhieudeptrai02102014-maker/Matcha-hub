-- [[ MATCHA HUB v5.0 - SUPER VIP ULTRA EDITION ]] --
-- [[ Break and Steal an Egg Specialized ]] --

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

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

local _G_Config = {
    AutoBreak = false,
    AutoSteal = false,
    FastSteal = true,
    HomeCFrame = nil
}

local function UpdateHomePos()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        _G_Config.HomeCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
UpdateHomePos()

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    UpdateHomePos()
end)

local C = {
    BgMain     = Color3.fromRGB(12, 16, 14),
    BgSidebar  = Color3.fromRGB(8, 12, 10),
    CardBg     = Color3.fromRGB(18, 26, 21),
    CardBorder = Color3.fromRGB(30, 50, 36),
    MatchaGlow = Color3.fromRGB(50, 220, 115),
    MatchaDark = Color3.fromRGB(25, 110, 58),
    TextWhite  = Color3.fromRGB(245, 255, 248),
    TextMuted  = Color3.fromRGB(130, 160, 140),
    ToggleOff  = Color3.fromRGB(30, 42, 34)
}

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = C.BgMain
MainFrame.Position = UDim2.new(0.5, -320, 0.5, -200)
MainFrame.Size = UDim2.new(0, 640, 0, 400)
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = C.MatchaGlow
MainStroke.Thickness = 2

local Header = Instance.new("Frame")
Header.Parent = MainFrame
Header.BackgroundColor3 = C.BgSidebar
Header.Size = UDim2.new(1, 0, 0, 50)

local HeaderLine = Instance.new("Frame")
HeaderLine.Parent = Header
HeaderLine.BackgroundColor3 = C.MatchaGlow
HeaderLine.Position = UDim2.new(0, 0, 1, -2)
HeaderLine.Size = UDim2.new(1, 0, 0, 2)
HeaderLine.BorderSizePixel = 0

local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 20, 0, 5)
Title.Size = UDim2.new(0, 250, 0, 25)
Title.Font = Enum.Font.FredokaOne
Title.Text = "🍵 MATCHA HUB VIP"
Title.TextColor3 = C.MatchaGlow
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = Header
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 20, 0, 28)
SubTitle.Size = UDim2.new(0, 280, 0, 15)
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.Text = "Break and Steal an Egg • Ultra Edition"
SubTitle.TextColor3 = C.TextMuted
SubTitle.TextSize = 10
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = Header
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseBtn.Position = UDim2.new(1, -35, 0, 12)
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = C.TextWhite
CloseBtn.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

local FloatBtn = Instance.new("TextButton")
FloatBtn.Name = "FloatBtn"
FloatBtn.Parent = ScreenGui
FloatBtn.BackgroundColor3 = C.BgMain
FloatBtn.Position = UDim2.new(0.92, 0, 0.4, 0)
FloatBtn.Size = UDim2.new(0, 55, 0, 55)
FloatBtn.Font = Enum.Font.FredokaOne
FloatBtn.Text = "🍵"
FloatBtn.TextSize = 26

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(1, 0)
FloatCorner.Parent = FloatBtn

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Parent = FloatBtn
FloatStroke.Color = C.MatchaGlow
FloatStroke.Thickness = 2.5

FloatBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.M then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = C.BgSidebar
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -50)

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
ContentContainer.Position = UDim2.new(0, 160, 0, 60)
ContentContainer.Size = UDim2.new(0, 470, 0, 330)

local Pages = {}

local function CreateTab(name, icon, isDefault)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = Sidebar
    TabBtn.BackgroundColor3 = isDefault and C.MatchaDark or Color3.fromRGB(0, 0, 0)
    TabBtn.BackgroundTransparency = isDefault and 0 or 1
    TabBtn.Size = UDim2.new(1, 0, 0, 36)
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

local MainTab  = CreateTab("Main", "🔥", true)
local BreakTab = CreateTab("Auto Break", "⛏️", false)
local StealTab = CreateTab("Auto Steal", "🎭", false)
local InfoTab  = CreateTab("Info", "👑", false)

local function CreateCard(parent, title)
    local Card = Instance.new("Frame")
    Card.Parent = parent
    Card.BackgroundColor3 = C.CardBg
    Card.Size = UDim2.new(1, -10, 0, 120)

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 10)
    CardCorner.Parent = Card

    local CardStroke = Instance.new("UIStroke")
    CardStroke.Parent = Card
    CardStroke.Color = C.CardBorder
    CardStroke.Thickness = 1

    local CardTitle = Instance.new("TextLabel")
    CardTitle.Parent = Card
    CardTitle.BackgroundTransparency = 1
    CardTitle.Position = UDim2.new(0, 12, 0, 8)
    CardTitle.Font = Enum.Font.FredokaOne
    CardTitle.Text = title
    CardTitle.TextColor3 = C.MatchaGlow
    CardTitle.TextSize = 14
    CardTitle.TextXAlignment = Enum.TextXAlignment.Left

    return Card
end

local function AddToggle(parent, yPos, text, defaultState, callback)
    local Container = Instance.new("Frame")
    Container.Parent = parent
    Container.BackgroundTransparency = 1
    Container.Position = UDim2.new(0, 12, 0, yPos)
    Container.Size = UDim2.new(1, -24, 0, 32)

    local Label = Instance.new("TextLabel")
    Label.Parent = Container
    Label.BackgroundTransparency = 1
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Font = Enum.Font.GothamSemibold
    Label.Text = text
    Label.TextColor3 = C.TextWhite
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Switch = Instance.new("TextButton")
    Switch.Parent = Container
    Switch.BackgroundColor3 = defaultState and C.MatchaGlow or C.ToggleOff
    Switch.Position = UDim2.new(1, -44, 0.5, -11)
    Switch.Size = UDim2.new(0, 44, 0, 22)
    Switch.Text = ""

    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = Switch

    local Circle = Instance.new("Frame")
    Circle.Parent = Switch
    Circle.BackgroundColor3 = C.TextWhite
    Circle.Position = defaultState and UDim2.new(1, -19, 0.1, 0) or UDim2.new(0, 3, 0.1, 0)
    Circle.Size = UDim2.new(0, 17, 0, 17)

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = Circle

    local state = defaultState
    Switch.MouseButton1Click:Connect(function()
        state = not state
        Switch.BackgroundColor3 = state and C.MatchaGlow or C.ToggleOff
        Circle.Position = state and UDim2.new(1, -19, 0.1, 0) or UDim2.new(0, 3, 0.1, 0)
        callback(state)
    end)
end

local MainCard = CreateCard(MainTab, "⚡ TÍNH NĂNG CHÍNH VIP")
MainCard.Size = UDim2.new(1, -10, 0, 170)

AddToggle(MainCard, 38, "Auto Break Trứng (Super Fast)", false, function(s)
    _G_Config.AutoBreak = s
end)

AddToggle(MainCard, 78, "Auto Steal + TP Home Tức Thì", false, function(s)
    _G_Config.AutoSteal = s
end)

AddToggle(MainCard, 118, "Fast Steal Mode (Không Delay)", true, function(s)
    _G_Config.FastSteal = s
end)

local SetBaseBtn = Instance.new("TextButton")
SetBaseBtn.Parent = MainTab
SetBaseBtn.BackgroundColor3 = C.MatchaDark
SetBaseBtn.Size = UDim2.new(1, -10, 0, 40)
SetBaseBtn.Font = Enum.Font.GothamBold
SetBaseBtn.Text = "📍 CẬP NHẬT VỊ TRÍ BASE (SET HOME)"
SetBaseBtn.TextColor3 = C.TextWhite
SetBaseBtn.TextSize = 12

local BaseCorner = Instance.new("UICorner")
BaseCorner.CornerRadius = UDim.new(0, 8)
BaseCorner.Parent = SetBaseBtn

SetBaseBtn.MouseButton1Click:Connect(function()
    UpdateHomePos()
    SetBaseBtn.Text = "✅ ĐÃ LƯU VỊ TRÍ BASE THÀNH CÔNG!"
    task.wait(1.5)
    SetBaseBtn.Text = "📍 CẬP NHẬT VỊ TRÍ BASE (SET HOME)"
end)

local BreakCard = CreateCard(BreakTab, "⛏️ HỆ THỐNG AUTO BREAK")
BreakCard.Size = UDim2.new(1, -10, 0, 100)

AddToggle(BreakCard, 40, "Kích hoạt Auto Break Trứng", false, function(s)
    _G_Config.AutoBreak = s
end)

local StealCard = CreateCard(StealTab, "🎭 HỆ THỐNG AUTO STEAL & BASE TELEPORT")
StealCard.Size = UDim2.new(1, -10, 0, 120)

AddToggle(StealCard, 38, "Kích hoạt Auto Steal", false, function(s)
    _G_Config.AutoSteal = s
end)

AddToggle(StealCard, 75, "Teleport Base Tức Thì Khi Cướp", true, function(s)
end)

local InfoCard = CreateCard(InfoTab, "👑 MATCHA HUB VIP INFORMATIONS")
InfoCard.Size = UDim2.new(1, -10, 0, 160)

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Parent = InfoCard
InfoLabel.BackgroundTransparency = 1
InfoLabel.Position = UDim2.new(0, 15, 0, 35)
InfoLabel.Size = UDim2.new(1, -30, 0, 110)
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.Text = "• Game: Break and Steal an Egg\n• Edition: Matcha VIP Ultra\n• Status: Active & Undetected\n• Keybind: Bấm phím 'M' hoặc nút 🍵 để ẩn/hiện GUI."
InfoLabel.TextColor3 = C.TextMuted
InfoLabel.TextSize = 12
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.TextYAlignment = Enum.TextYAlignment.Top

task.spawn(function()
    while true do
        task.wait(_G_Config.FastSteal and 0.001 or 0.05)
        pcall(function()
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local hrp = char.HumanoidRootPart

            if _G_Config.AutoBreak then
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then tool:Activate() end

                for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                    if remote:IsA("RemoteEvent") then
                        local name = remote.Name:lower()
                        if name:find("click") or name:find("tap") or name:find("hit") or name:find("break") or name:find("damage") then
                            remote:FireServer()
                        end
                    end
                end
            end

            if _G_Config.AutoSteal then
                for _, prompt in pairs(workspace:GetDescendants()) do
                    if not _G_Config.AutoSteal then break end
                    if prompt:IsA("ProximityPrompt") then
                        local parentPart = prompt.Parent
                        if parentPart and parentPart:IsA("BasePart") then
                            if (parentPart.Position - hrp.Position).Magnitude <= (prompt.MaxActivationDistance + 15) then
                                fireproximityprompt(prompt)
                                if _G_Config.HomeCFrame then
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

print("[MATCHA HUB VIP]: Loaded successfully!")

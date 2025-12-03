-- The Forge [BETA] – Ultimate GUI Hub for Solara Executor
-- Clean, beautiful, fully working visual script

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ForgeHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 460, 0, 560)
mainFrame.Position = UDim2.new(0.5, -230, 0.5, -280)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(30, 120, 255)
title.BorderSizePixel = 0
title.Text = "⚒️ THE FORGE BETA HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 14)
titleCorner.Parent = title

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 36, 0, 36)
closeBtn.Position = UDim2.new(1, -44, 0, 7)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.Parent = title
local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(0, 8)

-- Tabs
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, -20, 0, 40)
tabFrame.Position = UDim2.new(0, 10, 0, 60)
tabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
tabFrame.Parent = mainFrame
local tabCorner = Instance.new("UICorner", tabFrame)
tabCorner.CornerRadius = UDim.new(0, 10)

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 8)
tabLayout.Parent = tabFrame

local function makeTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 100, 1, -10)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 16
    btn.Parent = tabFrame
    local c = Instance.new("UICorner", btn)
    c.CornerRadius = UDim.new(0, 8)
    return btn
end

local forgeTab = makeTab("Forge")
local combatTab = makeTab("Combat")
local playerTab = makeTab("Player")
local miscTab = makeTab("Misc")

-- Content container
local content = Instance.new("ScrollingFrame")
content.Size = UDim2.new(1, -20, 1, -110)
content.Position = UDim2.new(0, 10, 0, 110)
content.BackgroundTransparency = 1
content.ScrollBarThickness = 6
content.Parent = mainFrame

local list = Instance.new("UIListLayout")
list.Padding = UDim.new(0, 9)
list.Parent = content

-- Toggle & Button templates
local function toggle(name, order, parent)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 44)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    frame.LayoutOrder = order
    frame.Parent = parent
    local c = Instance.new("UICorner", frame); c.CornerRadius = UDim.new(0, 10)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -70, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.new(1,1,1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 17
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 54, 0, 28)
    btn.Position = UDim2.new(1, -64, 0.5, -14)
    btn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    btn.Text = "OFF"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = frame
    local bc = Instance.new("UICorner", btn); bc.CornerRadius = UDim.new(0, 14)

    local on = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        btn.Text = on and "ON" or "OFF"
        btn.BackgroundColor3 = on and Color3.fromRGB(50, 200, 80) or Color3.fromRGB(220, 50, 50)
    end)
end

local function button(name, order, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 48)
    btn.BackgroundColor3 = Color3.fromRGB(45, 100, 255)
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 18
    btn.LayoutOrder = order
    btn.Parent = parent
    local c = Instance.new("UICorner", btn); c.CornerRadius = UDim.new(0, 10)

    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12), {Size = UDim2.new(1, -8,0,48)}):Play()
        task.wait(0.12)
        TweenService:Create(btn, TweenInfo.new(0.12), {Size = UDim2.new(1,0,0,48)}):Play()
    end)
end

-- Tab contents
local forgeCont = Instance.new("Frame"); forgeCont.Size = UDim2.new(1,0,1,0); forgeCont.BackgroundTransparency = 1; forgeCont.Parent = content; forgeCont.Visible = true
local combatCont = Instance.new("Frame"); combatCont.Size = UDim2.new(1,0,1,0); combatCont.BackgroundTransparency = 1; combatCont.Parent = content; combatCont.Visible = false
local playerCont = Instance.new("Frame"); playerCont.Size = UDim2.new(1,0,1,0); playerCont.BackgroundTransparency = 1; playerCont.Parent = content; playerCont.Visible = false
local miscCont = Instance.new("Frame"); miscCont.Size = UDim2.new(1,0,1,0); miscCont.BackgroundTransparency = 1; miscCont.Parent = content; miscCont.Visible = false

-- Switch tabs
local function switch(to)
    forgeCont.Visible = (to == forgeCont)
    combatCont.Visible = (to == combatCont)
    playerCont.Visible = (to == playerCont)
    miscCont.Visible = (to == miscCont)
end
forgeTab.MouseButton1Click:Connect(function() switch(forgeCont) end)
combatTab.MouseButton1Click:Connect(function() switch(combatCont) end)
playerTab.MouseButton1Click:Connect(function() switch(playerCont) end)
miscTab.MouseButton1Click:Connect(function() switch(miscCont) end)

-- === FORGE TAB ===
toggle("Auto Forge All Ores", 1, forgeCont)
toggle("Auto Smelt", 2, forgeCont)
toggle("Auto Upgrade Pickaxe", 3, forgeCont)
toggle("Instant Forge", 4, forgeCont)
toggle("Ore ESP", 5, forgeCont)
toggle("Auto Collect Drops", 6, forgeCont)
button("Max Forge Level", 7, forgeCont)
button("Unlock All Recipes", 8, forgeCont)
button("Infinite Ore Bag", 9, forgeCont)

-- === COMBAT TAB ===
toggle("Kill Aura", 10, combatCont)
toggle("Auto Parry", 11, combatCont)
toggle("Aimlock", 12, combatCont)
toggle("Silent Aim", 13, combatCont)
toggle("Hitbox Expander", 14, combatCont)
button("One Hit Kill", 15, combatCont)
button("Godmode", 16, combatCont)

-- === PLAYER TAB ===
toggle("Speed Hack", 17, playerCont)
toggle("Infinite Jump", 18, playerCont)
toggle("Fly / Noclip", 19, playerCont)
toggle("NoClip", 20, playerCont)
toggle("Infinite Stamina", 21, playerCont)
button("Teleport to Ore", 22, playerCont)
button("Fullbright", 23, playerCont)

-- === MISC TAB ===
toggle("Anti AFK", 24, miscCont)
toggle("Auto Rebirth", 25, miscCont)
toggle("Auto Sell", 26, miscCont)
button("Unlock All Gamepasses", 27, miscCont)
button("Crash Server (Visual)", 28, miscCont)
button("Rejoin Server", 29, miscCont)

-- Close
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Auto resize canvas
list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    content.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 20)
end)
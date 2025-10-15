local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local panelAdmin = {
    "Kaua_452",
}

local function isPanelAdmin(name)
    for _, n in ipairs(panelAdmin) do
        if name:lower() == n:lower() then return true end
    end
    return false
end

if not isPanelAdmin(LocalPlayer.Name) then
    LocalPlayer:Kick("Nice try, go get the panel on our discord.")
    return
end

local function getScriptUsers()
    local users = {}
    if ReplicatedStorage:FindFirstChild("FreemanScriptUsers") then
        for _, v in ipairs(ReplicatedStorage.FreemanScriptUsers:GetChildren()) do
            table.insert(users, v.Name)
        end
    end
    return users
end

local function showUserTags()
    for _, name in ipairs(getScriptUsers()) do
        local plr = Players:FindFirstChild(name)
        if plr and plr.Character and plr.Character:FindFirstChild("Head") and not plr.Character:FindFirstChild("FMANUserTag") then
            local tag = Instance.new("BillboardGui")
            tag.Name = "FMANUserTag"
            tag.Size = UDim2.new(0, 90, 0, 24)
            tag.ExtentsOffset = Vector3.new(0, 2.8, 0)
            tag.Adornee = plr.Character.Head
            tag.AlwaysOnTop = true
            local txt = Instance.new("TextLabel", tag)
            txt.Size = UDim2.new(1,0,1,0)
            txt.BackgroundTransparency = 1
            txt.Text = "User"
            txt.TextColor3 = Color3.fromRGB(255,140,0)
            txt.Font = Enum.Font.GothamBold
            txt.TextScaled = true
            tag.Parent = plr.Character
            task.delay(5, function() pcall(function() tag:Destroy() end) end)
        end
    end
end

local function getTargetedPlayer(name)
    if not name then return nil end
    for _, n in ipairs(getScriptUsers()) do
        if n == name then
            return Players:FindFirstChild(n)
        end
    end
    return nil
end

local function Kick(pName)
    local p = getTargetedPlayer(pName)
    if p then p:Kick("Você foi removido pelo painel FMAN HUB.") end
end

local function Kill(pName)
    local p = getTargetedPlayer(pName)
    if p and p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
        p.Character.Humanoid.Health = 0
    end
end

local function Explode(pName)
    local p = getTargetedPlayer(pName)
    if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
        local e = Instance.new("Explosion")
        e.Position = p.Character.HumanoidRootPart.Position
        e.BlastPressure = 250000
        e.BlastRadius = 8
        e.Parent = workspace
    end
end

local function Jumpscare(pName)
    local p = getTargetedPlayer(pName)
    if p and p == LocalPlayer then
        local gui = Instance.new("ScreenGui", CoreGui)
        gui.Name = "FMAN_Jumpscare"
        local img = Instance.new("ImageLabel", gui)
        img.Size = UDim2.new(1,0,1,0)
        img.BackgroundTransparency = 1
        img.Image = "rbxassetid://126754882337711"
        img.ImageTransparency = 0
        local snd = Instance.new("Sound", gui)
        snd.SoundId = "rbxassetid://138873214826309"
        snd.Volume = 1
        snd:Play()
        task.spawn(function()
            for i=1,10 do
                img.ImageTransparency = (i%2==0) and 0.7 or 0.15
                task.wait(0.09)
            end
            snd:Stop()
            gui:Destroy()
        end)
    end
end

local function Bring(pName)
    local p = getTargetedPlayer(pName)
    if p and p ~= LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local cf = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-4)
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            p.Character:SetPrimaryPartCFrame(cf)
        end
    end
end

local function Fling(pName)
    local p = getTargetedPlayer(pName)
    if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
        local bv = Instance.new("BodyVelocity", p.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
        bv.Velocity = Vector3.new(math.random(-100,100),120,math.random(-100,100))
        game:GetService("Debris"):AddItem(bv, 0.3)
    end
end

local orange = Color3.fromRGB(255,140,0)
local white = Color3.fromRGB(255,255,255)
local darkBg = Color3.fromRGB(15,15,15)
local accentBg = Color3.fromRGB(30,30,30)

local screenGui = Instance.new("ScreenGui")
screenGui = "FMANAdminPanel"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Name = "Main"
mainFrame.Size = UDim2.new(0, 370, 0, 420)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5,0,0.5,0)
mainFrame.BackgroundColor3 = darkBg
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = orange
mainStroke.Thickness = 2
mainStroke.Transparency = 0.7

local header = Instance.new("Frame", mainFrame)
header.Size = UDim2.new(1, 0, 0, 48)
header.BackgroundTransparency = 1
header.Position = UDim2.new(0,0,0,0)
header.Name = "Header"
header.ZIndex = 2

local pumpkinIcon = Instance.new("TextLabel", header)
pumpkinIcon.Text = "🎃"
pumpkinIcon.Font = Enum.Font.GothamBlack
pumpkinIcon.TextSize = 32
pumpkinIcon.TextColor3 = orange
pumpkinIcon.Size = UDim2.new(0, 38, 0, 38)
pumpkinIcon.Position = UDim2.new(0, 0, 0, 2)
pumpkinIcon.BackgroundTransparency = 1

local headerTitle = Instance.new("TextLabel", header)
headerTitle.Text = "FMAN HUB - Admin Panel"
headerTitle.Font = Enum.Font.GothamBold
headerTitle.TextSize = 17
headerTitle.TextColor3 = white
headerTitle.BackgroundTransparency = 1
headerTitle.Size = UDim2.new(1, -60, 1, 0)
headerTitle.Position = UDim2.new(0, 44, 0, 0)
headerTitle.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 36, 0, 36)
closeBtn.Position = UDim2.new(1, -44, 0, 6)
closeBtn.BackgroundColor3 = accentBg
closeBtn.Text = "X"
closeBtn.TextColor3 = orange
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)
local closeBtnStroke = Instance.new("UIStroke", closeBtn)
closeBtnStroke.Color = orange
closeBtnStroke.Thickness = 1.25
closeBtnStroke.Transparency = 0.7
closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

local divider = Instance.new("Frame", mainFrame)
divider.Name = "Divider"
divider.Size = UDim2.new(0.86, 0, 0, 2)
divider.Position = UDim2.new(0.07, 0, 0, 48)
divider.BackgroundColor3 = orange
divider.BorderSizePixel = 0
local dividerGradient = Instance.new("UIGradient", divider)
dividerGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, orange),
    ColorSequenceKeypoint.new(0.5, white),
    ColorSequenceKeypoint.new(1, orange)
})

local playerDropdown = Instance.new("TextButton", mainFrame)
playerDropdown.Size = UDim2.new(0.62, -10, 0, 36)
playerDropdown.Position = UDim2.new(0, 14, 0, 66)
playerDropdown.BackgroundColor3 = accentBg
playerDropdown.Text = "Select player"
playerDropdown.TextColor3 = orange
playerDropdown.Font = Enum.Font.GothamBold
playerDropdown.TextSize = 16
Instance.new("UICorner", playerDropdown).CornerRadius = UDim.new(1, 0)
local playerDropdownStroke = Instance.new("UIStroke", playerDropdown)
playerDropdownStroke.Color = orange
playerDropdownStroke.Thickness = 1.25
playerDropdownStroke.Transparency = 0.7

local selectedPlayer = nil
local dropFrame = nil
playerDropdown.MouseButton1Click:Connect(function()
    if dropFrame and dropFrame.Parent then dropFrame:Destroy() end
    dropFrame = Instance.new("Frame", mainFrame)
    dropFrame.BackgroundColor3 = accentBg
    dropFrame.Size = UDim2.new(0, 190, 0, 120)
    dropFrame.Position = UDim2.new(0, 14, 0, 106)
    dropFrame.ZIndex = 10
    Instance.new("UICorner", dropFrame).CornerRadius = UDim.new(1,0)
    local dropLayout = Instance.new("UIListLayout", dropFrame)
    dropLayout.Padding = UDim.new(0, 2)
    for _, name in ipairs(getScriptUsers()) do
        local b = Instance.new("TextButton", dropFrame)
        b.Text = name
        b.Font = Enum.Font.Gotham
        b.TextSize = 15
        b.Size = UDim2.new(1, -8, 0, 28)
        b.BackgroundColor3 = Color3.fromRGB(50,50,50)
        b.TextColor3 = orange
        b.ZIndex = 11
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
        b.MouseButton1Click:Connect(function()
            selectedPlayer = name
            playerDropdown.Text = name
            dropFrame:Destroy()
        end)
    end
end)

local updateBtn = Instance.new("TextButton", mainFrame)
updateBtn.Size = UDim2.new(0.36, -10, 0, 36)
updateBtn.Position = UDim2.new(0.62, 0, 0, 66)
updateBtn.BackgroundColor3 = accentBg
updateBtn.Text = "Update list"
updateBtn.TextColor3 = orange
updateBtn.Font = Enum.Font.GothamBold
updateBtn.TextSize = 15
Instance.new("UICorner", updateBtn).CornerRadius = UDim.new(1, 0)
local updateBtnStroke = Instance.new("UIStroke", updateBtn)
updateBtnStroke.Color = orange
updateBtnStroke.Thickness = 1.25
updateBtnStroke.Transparency = 0.7
updateBtn.MouseButton1Click:Connect(function()
    playerDropdown.Text = "Select player"
    selectedPlayer = nil
end)

local cmdsFrame = Instance.new("Frame", mainFrame)
cmdsFrame.BackgroundTransparency = 1
cmdsFrame.Size = UDim2.new(1, -28, 0, 270)
cmdsFrame.Position = UDim2.new(0, 14, 0, 120)

local cmdsLayout = Instance.new("UIGridLayout", cmdsFrame)
cmdsLayout.CellSize = UDim2.new(0, 110, 0, 44)
cmdsLayout.CellPadding = UDim2.new(0, 12, 0, 14)

local function makeBtn(txt, callback)
    local b = Instance.new("TextButton", cmdsFrame)
    b.Text = txt
    b.Font = Enum.Font.GothamBold
    b.TextSize = 15
    b.BackgroundColor3 = accentBg
    b.TextColor3 = orange
    b.AutoButtonColor = true
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
    local btnStroke = Instance.new("UIStroke", b)
    btnStroke.Color = orange
    btnStroke.Thickness = 1.25
    btnStroke.Transparency = 0.7
    b.MouseEnter:Connect(function() b.BackgroundColor3 = orange b.TextColor3 = darkBg end)
    b.MouseLeave:Connect(function() b.BackgroundColor3 = accentBg b.TextColor3 = orange end)
    b.MouseButton1Click:Connect(function()
        if not selectedPlayer then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "[FMAN HUB] - Select a player first!",
                Color = Color3.fromRGB(255, 100, 100),
                Font = Enum.Font.GothamBold
            })
            return
        end
        callback(selectedPlayer)
    end)
    return b
end

makeBtn("Kick", Kick)
makeBtn("Kill", Kill)
makeBtn("Explode", Explode)
makeBtn("Jumpscare", Jumpscare)
makeBtn("Bring", Bring)
makeBtn("Fling", Fling)

local verifyBtn = Instance.new("TextButton", mainFrame)
verifyBtn.Size = UDim2.new(1, -28, 0, 36)
verifyBtn.Position = UDim2.new(0, 14, 1, -46)
verifyBtn.BackgroundColor3 = accentBg
verifyBtn.Text = "Verify"
verifyBtn.TextColor3 = orange
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 15
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(1,0)
local verifyBtnStroke = Instance.new("UIStroke", verifyBtn)
verifyBtnStroke.Color = orange
verifyBtnStroke.Thickness = 1.25
verifyBtnStroke.Transparency = 0.7
verifyBtn.MouseButton1Click:Connect(showUserTags)

StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "[FMAN HUB] - Panel loaded, use only those who are using the same script.",
    Color = orange,
    Font = Enum.Font.GothamBold
})
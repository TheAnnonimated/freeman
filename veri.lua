local player = game:GetService("Players").LocalPlayer

local premiumUsers = {

    ["JumexD24"] = true,

    ["Itz_Mariena"] = true,

    ["thiagojuniorgamer12"] = true,

    ["Andriel_cria4"] = true,

    ["eutoxitando123"] = true,

    ["pedro312jee"] = true,

    ["Kaua_452"] = true,

}

local orange = Color3.fromRGB(255, 140, 0)

local red = Color3.fromRGB(180, 30, 30)

local green = Color3.fromRGB(35, 170, 60)

local darkGreen = Color3.fromRGB(35, 85, 35)

local brightGreen = Color3.fromRGB(60, 255, 80)

local gui = Instance.new("ScreenGui")

gui.Name = "AuralynxVerificationHub"

gui.ResetOnSpawn = false

gui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")

mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

mainFrame.Size = UDim2.new(0, 480, 0, 210)

mainFrame.BackgroundTransparency = 0.1

mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)

mainFrame.Parent = gui

mainFrame.BorderSizePixel = 0

local mainCorner = Instance.new("UICorner", mainFrame)

mainCorner.CornerRadius = UDim.new(0, 30)

local uiStroke = Instance.new("UIStroke", mainFrame)

uiStroke.Thickness = 5

uiStroke.Color = red

local grad = Instance.new("UIGradient", uiStroke)

grad.Color = ColorSequence.new{

    ColorSequenceKeypoint.new(0, red),

    ColorSequenceKeypoint.new(0.5, red),

    ColorSequenceKeypoint.new(1, red)

}

spawn(function()

    local t0 = tick()

    while grad.Parent do

        grad.Offset = Vector2.new(0.5+0.5*math.sin((tick()-t0)*1.12),0)

        wait(0.03)

    end

end)

local container = Instance.new("Frame", mainFrame)

container.Size = UDim2.new(0, 380, 0, 90)

container.Position = UDim2.new(0.5, -190, 0, 34)

container.BackgroundTransparency = 1

local auralynxLabel = Instance.new("TextLabel", container)

auralynxLabel.Size = UDim2.new(0, 310, 1, 0)

auralynxLabel.Position = UDim2.new(0, 0, 0, 0)

auralynxLabel.BackgroundTransparency = 1

auralynxLabel.Text = "Auralynx"

auralynxLabel.Font = Enum.Font.GothamBlack

auralynxLabel.TextSize = 72

auralynxLabel.TextColor3 = orange

auralynxLabel.ZIndex = 21

auralynxLabel.TextXAlignment = Enum.TextXAlignment.Left

local gradText = Instance.new("UIGradient", auralynxLabel)

gradText.Color = ColorSequence.new{

    ColorSequenceKeypoint.new(0, orange),

    ColorSequenceKeypoint.new(0.5, darkGreen),

    ColorSequenceKeypoint.new(1, brightGreen)

}

spawn(function()

    local t0 = tick()

    while gradText.Parent do

        gradText.Offset = Vector2.new(0.5+0.5*math.sin((tick()-t0)*1.25),0)

        wait(0.03)

    end

end)

local pumpkinLabel = Instance.new("TextLabel", container)

pumpkinLabel.Size = UDim2.new(0, 70, 1, 0)

pumpkinLabel.Position = UDim2.new(0, 310, 0, 0)

pumpkinLabel.BackgroundTransparency = 1

pumpkinLabel.Text = "💎"

pumpkinLabel.Font = Enum.Font.GothamBlack

pumpkinLabel.TextSize = 65

pumpkinLabel.TextColor3 = Color3.fromRGB(255, 120, 10)

pumpkinLabel.ZIndex = 21

pumpkinLabel.TextXAlignment = Enum.TextXAlignment.Left

local percentLabel = Instance.new("TextLabel", mainFrame)

percentLabel.Size = UDim2.new(1, 0, 0, 42)

percentLabel.Position = UDim2.new(0, 0, 1, -60)

percentLabel.BackgroundTransparency = 1

percentLabel.Text = ""

percentLabel.Font = Enum.Font.GothamBold

percentLabel.TextSize = 38

percentLabel.TextColor3 = brightGreen

percentLabel.ZIndex = 24

local gradPercent = Instance.new("UIGradient", percentLabel)

gradPercent.Color = ColorSequence.new{

    ColorSequenceKeypoint.new(0, orange),

    ColorSequenceKeypoint.new(0.5, brightGreen),

    ColorSequenceKeypoint.new(1, orange)

}

spawn(function()

    local t0 = tick()

    while gradPercent.Parent do

        gradPercent.Offset = Vector2.new(0.5+0.5*math.cos((tick()-t0)*1.6),0)

        wait(0.03)

    end

end)

percentLabel.Text = "Checking..."

coroutine.wrap(function()

    uiStroke.Color = red

    grad.Color = ColorSequence.new{

        ColorSequenceKeypoint.new(0, red),

        ColorSequenceKeypoint.new(0.5, red),

        ColorSequenceKeypoint.new(1, red)

    }

    percentLabel.Text = "Checking..."

    wait(5)

    if premiumUsers[player.Name] == true then

        percentLabel.Text = "Done!"

        uiStroke.Color = green

        grad.Color = ColorSequence.new{

            ColorSequenceKeypoint.new(0, green),

            ColorSequenceKeypoint.new(0.5, green),

            ColorSequenceKeypoint.new(1, green)

        }

        wait(2)

        percentLabel.Text = "Welcome!"

        wait(1.5)

        gui:Destroy()

        loadstring(game:HttpGet("https://pastefy.app/zSB3bYJM/raw"))()

    else

        uiStroke.Color = red

        grad.Color = ColorSequence.new{

            ColorSequenceKeypoint.new(0, red),

            ColorSequenceKeypoint.new(0.5, red),

            ColorSequenceKeypoint.new(1, red)

        }

        percentLabel.Text = "ACESS DENIED."

        local s = Instance.new("Sound")

        s.SoundId = "rbxassetid://3069892996"

        s.Volume = 5

        s.Looped = false

        s.Parent = workspace

        s:Play()

        wait(1)

        player:Kick("Você não tem permissão para usar esse script,\nadquira no nosso discord.")

    end

end)()
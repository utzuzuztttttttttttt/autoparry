local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoParryGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Draggable Frame
local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, 220, 0, 120)
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 255, 127) -- Neon green
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Rounded corners
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 12)

-- Auto Parry Button
local AutoParryButton = Instance.new("TextButton")
AutoParryButton.Size = UDim2.new(0.8, 0, 0.4, 0)
AutoParryButton.Position = UDim2.new(0.1, 0, 0.15, 0)
AutoParryButton.BackgroundColor3 = Color3.fromRGB(0, 191, 255) -- Neon blue
AutoParryButton.Text = "Auto Parry"
AutoParryButton.Font = Enum.Font.GothamBold
AutoParryButton.TextColor3 = Color3.new(1, 1, 1)
AutoParryButton.TextScaled = true
AutoParryButton.Parent = Frame

-- Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
MinimizeButton.Position = UDim2.new(1, -28, 0, 4)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
MinimizeButton.Text = "-"
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.TextScaled = true
MinimizeButton.Parent = Frame

-- Bottom-right hint label
local HintLabel = Instance.new("TextLabel")
HintLabel.Size = UDim2.new(0, 220, 0, 20)
HintLabel.Position = UDim2.new(1, -230, 1, -30)
HintLabel.BackgroundTransparency = 1
HintLabel.Text = "Press Left Ctrl to open GUI"
HintLabel.TextColor3 = Color3.new(1, 1, 1)
HintLabel.TextScaled = true
HintLabel.Font = Enum.Font.Gotham
HintLabel.TextXAlignment = Enum.TextXAlignment.Right
HintLabel.Parent = ScreenGui

-- Functionality
AutoParryButton.MouseButton1Click:Connect(function()
	getgenv().visualizer = true
	loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/RedCircleBlock"))()
end)

local guiVisible = true

MinimizeButton.MouseButton1Click:Connect(function()
	Frame.Visible = false
	guiVisible = false
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftControl then
		guiVisible = not guiVisible
		Frame.Visible = guiVisible
	end
end)

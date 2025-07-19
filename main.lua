-- rkxVOID v4.1 Lite - GUI Preto com LED Azul (Versão Free)
-- by rkxdev_hub

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local localPlayer = Players.LocalPlayer
local mouse = localPlayer:GetMouse()
local camera = workspace.CurrentCamera

local character, humanoid, rootPart
local function updateCharacter()
	character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	humanoid = character:WaitForChild("Humanoid")
	rootPart = character:WaitForChild("HumanoidRootPart")
end
updateCharacter()
localPlayer.CharacterAdded:Connect(updateCharacter)

-- Proteção para não carregar o script mais de uma vez
if getgenv().rkxVOIDv4Loaded then return end
getgenv().rkxVOIDv4Loaded = true

-- Criar GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "rkxVOID_v4"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = game:GetService("CoreGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 440, 0, 380)
mainFrame.Position = UDim2.new(0.5, -220, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
mainFrame.ClipsDescendants = true
local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 16)

-- Header
local header = Instance.new("TextLabel", mainFrame)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
header.BackgroundTransparency = 0.5
header.Text = "rkxVOID v4.1 Lite - Preto LED Azul"
header.Font = Enum.Font.GothamBold
header.TextSize = 24
header.TextColor3 = Color3.fromRGB(0, 170, 255)
header.TextXAlignment = Enum.TextXAlignment.Left
header.BorderSizePixel = 0
local headerCorner = Instance.new("UICorner", header)
headerCorner.CornerRadius = UDim.new(0, 16)
header.Position = UDim2.new(0, 0, 0, 0)

-- Close / Minimize Button
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 28
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.BorderSizePixel = 0
local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(0, 14)

local minimizedIcon = Instance.new("ImageButton", screenGui)
minimizedIcon.Size = UDim2.new(0, 50, 0, 50)
minimizedIcon.Position = UDim2.new(0, 10, 0.5, -25)
minimizedIcon.BackgroundColor3 = Color3.fromRGB(10,10,10)
minimizedIcon.Image = "rbxassetid://10578816197" -- caveira fofa (você pode trocar)
minimizedIcon.Visible = false
minimizedIcon.BorderSizePixel = 0
local minimizedCorner = Instance.new("UICorner", minimizedIcon)
minimizedCorner.CornerRadius = UDim.new(0, 16)

closeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	minimizedIcon.Visible = true
end)
minimizedIcon.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	minimizedIcon.Visible = false
end)

-- Tabs
local tabsNames = {"Movimento", "Utilitários", "Troll"}
local tabsFrames = {}
local tabsButtons = {}

local function createTabButton(name, posX)
	local btn = Instance.new("TextButton", mainFrame)
	btn.Size = UDim2.new(0, 130, 0, 40)
	btn.Position = UDim2.new(0, posX, 0, 50)
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 18
	btn.TextColor3 = Color3.fromRGB(180, 180, 180)
	btn.BorderSizePixel = 0
	local uic = Instance.new("UICorner", btn)
	uic.CornerRadius = UDim.new(0, 12)
	
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 120, 220), TextColor3 = Color3.fromRGB(255,255,255)}):Play()
	end)
	btn.MouseLeave:Connect(function()
		if tabsFrames[name].Visible == false then
			TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(20,20,20), TextColor3 = Color3.fromRGB(180,180,180)}):Play()
		end
	end)
	
	return btn
end

local function createTabFrame()
	local frame = Instance.new("Frame", mainFrame)
	frame.Size = UDim2.new(1, -20, 1, -110)
	frame.Position = UDim2.new(0, 10, 0, 100)
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	frame.BorderSizePixel = 0
	local corner = Instance.new("UICorner", frame)
	corner.CornerRadius = UDim.new(0, 14)
	frame.Visible = false
	return frame
end

local startX = 15
for i, name in ipairs(tabsNames) do
	tabsButtons[name] = createTabButton(name, startX + (i-1)*145)
	tabsFrames[name] = createTabFrame()
	if i == 1 then
		tabsFrames[name].Visible = true
		tabsButtons[name].BackgroundColor3 = Color3.fromRGB(0, 120, 220)
		tabsButtons[name].TextColor3 = Color3.fromRGB(255, 255, 255)
	end
	tabsButtons[name].MouseButton1Click:Connect(function()
		for tn, tf in pairs(tabsFrames) do
			tf.Visible = false
			tabsButtons[tn].BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			tabsButtons[tn].TextColor3 = Color3.fromRGB(180, 180, 180)
		end
		tabsFrames[name].Visible = true
		tabsButtons[name].BackgroundColor3 = Color3.fromRGB(0, 120, 220)
		tabsButtons[name].TextColor3 = Color3.fromRGB(255, 255, 255)
	end)
end

-- Função para criar botões toggle com LED
local function createToggleButton(parent, text, posY, callback)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0, 250, 0, 45)
	btn.Position = UDim2.new(0, 20, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 18
	btn.Text = text .. " [OFF]"
	btn.TextColor3 = Color3.fromRGB(180, 180, 180)
	btn.BorderSizePixel = 0
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 16)
	
	local led = Instance.new("Frame", btn)
	led.Size = UDim2.new(0, 20, 0, 20)
	led.Position = UDim2.new(1, -30, 0.5, -10)
	led.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
	led.BorderSizePixel = 0
	led.AnchorPoint = Vector2.new(0.5, 0.5)
	led.Name = "LED"
	led.Visible = true
	local ledCorner = Instance.new("UICorner", led)
	ledCorner.CornerRadius = UDim.new(0, 10)

	local enabled = false
	
	local function updateVisual()
		if enabled then
			btn.Text = text .. " [ON]"
			btn.TextColor3 = Color3.fromRGB(0, 170, 255)
			TweenService:Create(led, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
		else
			btn.Text = text .. " [OFF]"
			btn.TextColor3 = Color3.fromRGB(180, 180, 180)
			led.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
			led:ClearAllChildren() -- Para parar tween (limpa o UICorner e etc)
			local ledCornerNew = Instance.new("UICorner", led)
			ledCornerNew.CornerRadius = UDim.new(0, 10)
		end
	end
	
	btn.MouseButton1Click:Connect(function()
		enabled = not enabled
		updateVisual()
		pcall(callback, enabled)
	end)
	
	updateVisual()
	return btn, function() return enabled end
end

-- Variáveis de estado
local noclipEnabled = false
local flyEnabled = false
local stealthEnabled = false
local runEnabled = false
local jumpEnabled = false

local flyBodyGyro, flyBodyVelocity

-- Funções principais

local function getPartsNoCollide()
	if not character then return {} end
	local parts = {}
	for _, part in pairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			table.insert(parts, part)
		end
	end
	return parts
end

local function toggleNoclip(state)
	noclipEnabled = state
	if noclipEnabled then
		RunService.Stepped:Connect(function()
			if noclipEnabled and character then
				for _, part in pairs(getPartsNoCollide()) do
					part.CanCollide = false
				end
			end
		end)
	else
		for _, part in pairs(getPartsNoCollide()) do
			part.CanCollide = true
		end
	end
end

local function toggleFly(state)
	flyEnabled = state
	if flyEnabled then
		if not rootPart then return end
		flyBodyGyro = Instance.new("BodyGyro", rootPart)
		flyBodyGyro.P = 90000
		flyBodyGyro.MaxTorque = Vector3.new(900000, 900000, 900000)
		flyBodyGyro.CFrame = rootPart.CFrame

		flyBodyVelocity = Instance.new("BodyVelocity", rootPart)
		flyBodyVelocity.MaxForce = Vector3.new(900000, 900000, 900000)
		flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)

		humanoid.PlatformStand = true

		spawn(function()
			while flyEnabled do
				RunService.Heartbeat:Wait()
				local camCFrame = camera.CFrame
				flyBodyGyro.CFrame = camCFrame
				local direction = Vector3.new()

				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					direction = direction + camCFrame.LookVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					direction = direction - camCFrame.LookVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					direction = direction - camCFrame.RightVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					direction = direction + camCFrame.RightVector
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					direction = direction + Vector3.new(0, 1, 0)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
					direction = direction - Vector3.new(0, 1, 0)
				end
				flyBodyVelocity.Velocity = direction.Unit * 70
				if direction.Magnitude == 0 then
					flyBodyVelocity.Velocity = Vector3.new(0,0,0)
				end
			end
		end)
	else
		if flyBodyGyro then flyBodyGyro:Destroy() flyBodyGyro = nil end
		if flyBodyVelocity then flyBodyVelocity:Destroy() flyBodyVelocity = nil end
		humanoid.PlatformStand = false
	end
end

local function toggleStealth(state)
	stealthEnabled = state
	if character then
		for _, part in pairs(getPartsNoCollide()) do
			part.Transparency = stealthEnabled and 1 or 0
		end
		local head = character:FindFirstChild("Head")
		if head then
			local nameTag = head:FindFirstChildWhichIsA("BillboardGui")
			if nameTag then
				nameTag.Enabled = not stealthEnabled
			end
		end
	end
end

local function toggleRun(state)
	runEnabled = state
	if humanoid then
		humanoid.WalkSpeed = runEnabled and 300 or 16 -- padrão 16
	end
end

local function toggleJump(state)
	jumpEnabled = state
	if humanoid then
		humanoid.JumpPower = jumpEnabled and 100 or 50 -- padrão 50
	end
end

-- Criar botões Movimento
local posY = 20
local btnNoclip, getNoclipState = createToggleButton(tabsFrames["Movimento"], "NoClip", posY, toggleNoclip)
posY = posY + 55
local btnFly, getFlyState = createToggleButton(tabsFrames["Movimento"], "Voo", posY, toggleFly)
posY = posY + 55
local btnRun, getRunState = createToggleButton(tabsFrames["Movimento"], "Correr", posY, toggleRun)
posY = posY + 55
local btnJump, getJumpState = createToggleButton(tabsFrames["Movimento"], "Super Pulo", posY, toggleJump)
posY = posY + 55

-- Aba Utilitários: Texto "Disponível na versão VIP"
local utilLabel = Instance.new("TextLabel", tabsFrames["Utilitários"])
utilLabel.Size = UDim2.new(1, -40, 0, 60)
utilLabel.Position = UDim2.new(0, 20, 0, 150)
utilLabel.BackgroundTransparency = 1
utilLabel.Text = "Disponível na versão VIP"
utilLabel.Font = Enum.Font.GothamBold
utilLabel.TextSize = 28
utilLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
utilLabel.TextStrokeTransparency = 0.7
utilLabel.TextStrokeColor3 = Color3.fromRGB(0, 100, 180)
utilLabel.TextWrapped = true
utilLabel.TextXAlignment = Enum.TextXAlignment.Center
utilLabel.TextYAlignment = Enum.TextYAlignment.Center

-- Aba Troll: Texto "Disponível na versão VIP"
local trollLabel = Instance.new("TextLabel", tabsFrames["Troll"])
trollLabel.Size = UDim2.new(1, -40, 0, 60)
trollLabel.Position = UDim2.new(0, 20, 0, 150)
trollLabel.BackgroundTransparency = 1
trollLabel.Text = "Disponível na versão VIP"
trollLabel.Font = Enum.Font.GothamBold
trollLabel.TextSize = 28
trollLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
trollLabel.TextStrokeTransparency = 0.7
trollLabel.TextStrokeColor3 = Color3.fromRGB(0, 100, 180)
trollLabel.TextWrapped = true
trollLabel.TextXAlignment = Enum.TextXAlignment.Center
trollLabel.TextYAlignment = Enum.TextYAlignment.Center

print("rkxVOID v4.1 Lite carregado !")

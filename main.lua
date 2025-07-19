-- rkxVOID v4.1 Lite

local a,b,c,d=game:GetService("Players"),game:GetService("UserInputService"),game:GetService("RunService"),game:GetService("TweenService")
local e=a.LocalPlayer
local f=e:GetMouse()
local g=workspace.CurrentCamera

local h,i,j
local function k()
	h=e.Character or e.CharacterAdded:Wait()
	i=h:WaitForChild("Humanoid")
	j=h:WaitForChild("HumanoidRootPart")
end
k()
e.CharacterAdded:Connect(k)

if getgenv().x then return end
getgenv().x=true

local l=Instance.new("ScreenGui")
l.Name="rkxVOID_v4"
l.ResetOnSpawn=false
l.IgnoreGuiInset=true
l.Parent=game:GetService("CoreGui")

local m=Instance.new("Frame",l)
m.Size=UDim2.new(0,440,0,380)
m.Position=UDim2.new(0.5,-220,0.5,-190)
m.BackgroundColor3=Color3.fromRGB(10,10,10)
m.BorderSizePixel=0
m.Active=true
m.Draggable=true
local n=Instance.new("UICorner",m)
n.CornerRadius=UDim.new(0,16)

local o=Instance.new("TextLabel",m)
o.Size=UDim2.new(1,0,0,40)
o.BackgroundColor3=Color3.fromRGB(0,0,0)
o.BackgroundTransparency=0.5
o.Text="rkxVOID v4.1 Lite - Preto LED Azul"
o.Font=Enum.Font.GothamBold
o.TextSize=24
o.TextColor3=Color3.fromRGB(0,170,255)
o.TextXAlignment=Enum.TextXAlignment.Left
o.BorderSizePixel=0
local p=Instance.new("UICorner",o)
p.CornerRadius=UDim.new(0,16)
o.Position=UDim2.new(0,0,0,0)

local q=Instance.new("TextButton",m)
q.Size=UDim2.new(0,40,0,40)
q.Position=UDim2.new(1,-45,0,0)
q.BackgroundColor3=Color3.fromRGB(25,0,0)
q.Text="X"
q.Font=Enum.Font.GothamBold
q.TextSize=28
q.TextColor3=Color3.fromRGB(255,100,100)
q.BorderSizePixel=0
local r=Instance.new("UICorner",q)
r.CornerRadius=UDim.new(0,14)

local s=Instance.new("ImageButton",l)
s.Size=UDim2.new(0,50,0,50)
s.Position=UDim2.new(0,10,0.5,-25)
s.BackgroundColor3=Color3.fromRGB(10,10,10)
s.Image="rbxassetid://10578816197"
s.Visible=false
s.BorderSizePixel=0
local t=Instance.new("UICorner",s)
t.CornerRadius=UDim.new(0,16)

q.MouseButton1Click:Connect(function()
	m.Visible=false
	s.Visible=true
end)
s.MouseButton1Click:Connect(function()
	m.Visible=true
	s.Visible=false
end)

local u={"Movimento","Utilitários","Troll"}
local v,w={},{}

local function x(y,z)
	local A=Instance.new("TextButton",m)
	A.Size=UDim2.new(0,130,0,40)
	A.Position=UDim2.new(0,z,0,50)
	A.BackgroundColor3=Color3.fromRGB(20,20,20)
	A.Text=y
	A.Font=Enum.Font.GothamBold
	A.TextSize=18
	A.TextColor3=Color3.fromRGB(180,180,180)
	A.BorderSizePixel=0
	local B=Instance.new("UICorner",A)
	B.CornerRadius=UDim.new(0,12)
	A.MouseEnter:Connect(function()
		d:Create(A,TweenInfo.new(0.3),{BackgroundColor3=Color3.fromRGB(0,120,220),TextColor3=Color3.fromRGB(255,255,255)}):Play()
	end)
	A.MouseLeave:Connect(function()
		if w[y].Visible==false then
			d:Create(A,TweenInfo.new(0.3),{BackgroundColor3=Color3.fromRGB(20,20,20),TextColor3=Color3.fromRGB(180,180,180)}):Play()
		end
	end)
	return A
end

local function C()
	local D=Instance.new("Frame",m)
	D.Size=UDim2.new(1,-20,1,-110)
	D.Position=UDim2.new(0,10,0,100)
	D.BackgroundColor3=Color3.fromRGB(15,15,15)
	D.BorderSizePixel=0
	local E=Instance.new("UICorner",D)
	E.CornerRadius=UDim.new(0,14)
	D.Visible=false
	return D
end

local F=15
for G,H in ipairs(u)do
	w[H]=C()
	v[H]=x(H,F+(G-1)*145)
	if G==1 then
		w[H].Visible=true
		v[H].BackgroundColor3=Color3.fromRGB(0,120,220)
		v[H].TextColor3=Color3.fromRGB(255,255,255)
	end
	v[H].MouseButton1Click:Connect(function()
		for I,J in pairs(w)do
			J.Visible=false
			v[I].BackgroundColor3=Color3.fromRGB(20,20,20)
			v[I].TextColor3=Color3.fromRGB(180,180,180)
		end
		w[H].Visible=true
		v[H].BackgroundColor3=Color3.fromRGB(0,120,220)
		v[H].TextColor3=Color3.fromRGB(255,255,255)
	end)
end

local function K(L,M,N)
	local O=Instance.new("TextButton",L)
	O.Size=UDim2.new(0,250,0,45)
	O.Position=UDim2.new(0,20,0,M)
	O.BackgroundColor3=Color3.fromRGB(30,30,30)
	O.Font=Enum.Font.GothamBold
	O.TextSize=18
	O.Text=N.." [OFF]"
	O.TextColor3=Color3.fromRGB(180,180,180)
	O.BorderSizePixel=0
	local P=Instance.new("UICorner",O)
	P.CornerRadius=UDim.new(0,16)
	local Q=Instance.new("Frame",O)
	Q.Size=UDim2.new(0,20,0,20)
	Q.Position=UDim2.new(1,-30,0.5,-10)
	Q.BackgroundColor3=Color3.fromRGB(100,0,0)
	Q.BorderSizePixel=0
	Q.AnchorPoint=Vector2.new(0.5,0.5)
	Q.Name="LED"
	Q.Visible=true
	local R=Instance.new("UICorner",Q)
	R.CornerRadius=UDim.new(0,10)
	local S=false
	local function T()
		if S then
			O.Text=N.." [ON]"
			O.TextColor3=Color3.fromRGB(0,170,255)
			d:Create(Q,TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut,-1,true),{BackgroundColor3=Color3.fromRGB(0,170,255)}):Play()
		else
			O.Text=N.." [OFF]"
			O.TextColor3=Color3.fromRGB(180,180,180)
			Q.BackgroundColor3=Color3.fromRGB(100,0,0)
			Q:ClearAllChildren()
			local U=Instance.new("UICorner",Q)
			U.CornerRadius=UDim.new(0,10)
		end
	end
	O.MouseButton1Click:Connect(function()
		S=not S
		T()
		pcall(M,S)
	end)
	T()
	return O,function()return S end
end

local V,W,X,Y,Z=false,false,false,false,false
local aa,ab

local function ac()
	if not h then return{}end
	local ad={}
	for _,ae in pairs(h:GetDescendants())do
		if ae:IsA("BasePart")then table.insert(ad,ae)end
	end
	return ad
end

local function af(ag)
	V=ag
	if V then
		c.Stepped:Connect(function()
			if V and h then
				for _,ah in pairs(ac())do
					ah.CanCollide=false
				end
			end
		end)
	else
		for _,ai in pairs(ac())do
			ai.CanCollide=true
		end
	end
end

local function aj(ak)
	W=ak
	if W then
		if not j then return end
		aa=Instance.new("BodyGyro",j)
		aa.P=90000
		aa.MaxTorque=Vector3.new(900000,900000,900000)
		aa.CFrame=j.CFrame

		ab=Instance.new("BodyVelocity",j)
		ab.MaxForce=Vector3.new(900000,900000,900000)
		ab.Velocity=Vector3.new(0,0,0)

		i.PlatformStand=true

		spawn(function()
			while W do
				c.Heartbeat:Wait()
				local al=g.CFrame
				aa.CFrame=al
				local am=Vector3.new()
				if b:IsKeyDown(Enum.KeyCode.W)then am=am+al.LookVector end
				if b:IsKeyDown(Enum.KeyCode.S)then am=am-al.LookVector end
				if b:IsKeyDown(Enum.KeyCode.A)then am=am-al.RightVector end
				if b:IsKeyDown(Enum.KeyCode.D)then am=am+al.RightVector end
				if b:IsKeyDown(Enum.KeyCode.Space)then am=am+Vector3.new(0,1,0) end
				if b:IsKeyDown(Enum.KeyCode.LeftControl)then am=am-Vector3.new(0,1,0) end
				ab.Velocity=am.Unit*70
				if am.Magnitude==0 then ab.Velocity=Vector3.new(0,0,0)end
			end
		end)
	else
		if aa then aa:Destroy()aa=nil end
		if ab then ab:Destroy()ab=nil end
		i.PlatformStand=false
	end
end

local function an(ao)
	X=ao
	if h then
		for _,ap in pairs(ac())do
			ap.Transparency=X and 1 or 0
		end
		local aq=h:FindFirstChild("Head")
		if aq then
			local ar=aq:FindFirstChildWhichIsA("BillboardGui")
			if ar then
				ar.Enabled=not X
			end
		end
	end
end

local function as(at)
	Y=at
	if i then
		i.WalkSpeed=Y and 100 or 16
	end
end

local function au(av)
	Z=av
	if i then
		i.JumpPower=Z and 100 or 50
	end
end

local posY=20
local btnNoclip,getNoclipState=K(w["Movimento"],posY,af)
posY=posY+55
local btnFly,getFlyState=K(w["Movimento"],posY,aj)
posY=posY+55
local btnRun,getRunState=K(w["Movimento"],posY,as)
posY=posY+55
local btnJump,getJumpState=K(w["Movimento"],posY,au)
posY=posY+55

local av=Instance.new("TextLabel",w["Utilitários"])
av.Size=UDim2.new(1,-40,0,60)
av.Position=UDim2.new(0,20,0,150)
av.BackgroundTransparency=1
av.Text="Disponível na versão VIP"
av.Font=Enum.Font.GothamBold
av.TextSize=28
av.TextColor3=Color3.fromRGB(0,170,255)
av.TextStrokeTransparency=0.7
av.TextStrokeColor3=Color3.fromRGB(0,100,180)
av.TextWrapped=true
av.TextXAlignment=Enum.TextXAlignment.Center
av.TextYAlignment=Enum.TextYAlignment.Center

local aw=Instance.new("TextLabel",w["Troll"])
aw.Size=UDim2.new(1,-40,0,60)
aw.Position=UDim2.new(0,20,0,150)
aw.BackgroundTransparency=1
aw.Text="Disponível na versão VIP"
aw.Font=Enum.Font.GothamBold
aw.TextSize=28
aw.TextColor3=Color3.fromRGB(0,170,255)
aw.TextStrokeTransparency=0.7
aw.TextStrokeColor3=Color3.fromRGB(0,100,180)
aw.TextWrapped=true
aw.TextXAlignment=Enum.TextXAlignment.Center
aw.TextYAlignment=Enum.TextYAlignment.Center

print("rkxVOID v4.1 Lite carregado !")

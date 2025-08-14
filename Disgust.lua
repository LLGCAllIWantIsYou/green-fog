local P = game:GetService("Players")
local p = P.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local ss = game:GetService("SoundService")
local ts = game:GetService("TweenService")

local sId = "rbxassetid://8350106890"
local au = Instance.new("Sound")
au.SoundId = sId
au.Parent = workspace
au:Play()

wait(1)

local Id = "rbxassetid://87664733938862"
local sg = Instance.new("ScreenGui")
sg.Name = "Disgust"
sg.Parent = pg
local il = Instance.new("ImageLabel")
il.Name = "iiLabel"
il.Image = Id
il.BackgroundTransparency = 1
il.Size = UDim2.new(1, 0, 1, 0)
il.Position = UDim2.new(0.5, 0, 0.5, 0)
il.AnchorPoint = Vector2.new(0.5, 0.5)
il.ScaleType = Enum.ScaleType.Fit
il.Parent = sg

local Tween = ts:Create(il, TweenInfo.new(5), {ImageTransparency = 1})
Tween:Play()

Tween.Completed:Wait()

local bp = p:WaitForChild("Backpack")
local item = #bp:GetChildren()

if item > 0 then
    local hu = p.Character:FindFirstChildOfClass("Humanoid")
    if hu then
        hu.Health = hu.Health - 35
    end
end

sg:Destroy()
au:Destroy()

if p.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
    game:GetService("ReplicatedStorage").GameStats["Player_" .. p.Name].Total.DeathCause.Value = "Disgust"
end
    

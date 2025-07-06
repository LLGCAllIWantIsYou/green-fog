-- a remake of daze (for free if u wanna use it credit me)
local plr = game.Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local cam = workspace.CurrentCamera
local offsetgyat = 10
local TweenService = game:GetService("TweenService")

local entity = game:GetObjects("rbxassetid://11621254476")[1]
entity.Parent = workspace
local primary_part = entity:FindFirstChildWhichIsA("BasePart") or entity:FindFirstChildWhichIsA("Part")
entity.PrimaryPart = primary_part

if not entity.PrimaryPart then return end

entity:SetPrimaryPartCFrame(chr.HumanoidRootPart.CFrame * CFrame.new(0, 0, -offsetgyat))
entity.PrimaryPart.Anchored = true

local function damageblud()
    local hum = chr:FindFirstChild("Humanoid")
    if hum then
        local dmg = math.random(15, 25)
        hum:TakeDamage(dmg)
    end
end

local function check()
    local direction = (entity.PrimaryPart.Position - cam.CFrame.Position).unit
    local dot_product = direction:Dot(cam.CFrame.LookVector)
    return dot_product > 0.95
end

local function move(target, dur)
    local tween_info = TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(entity.PrimaryPart, tween_info, {CFrame = target})
    tween:Play()
    tween.Completed:Wait()
end

entity.PrimaryPart.Anchored = false
wait(1.5)

if check() then
    move(chr.HumanoidRootPart.CFrame, 0.5)
    damageblud()
end

local fallframe = entity.PrimaryPart.CFrame * CFrame.new(0, -100, 0)
local falldur = 1

move(fallframe, falldur)

entity.PrimaryPart.Anchored = false
entity.PrimaryPart.CanCollide = false

wait(10)
entity:Destroy()

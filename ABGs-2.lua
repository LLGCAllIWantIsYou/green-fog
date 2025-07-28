local CF = CFrame.new
local niceframe = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
local sussyroom = game:GetObjects("rbxassetid://11626479968")[1]
sussyroom.Parent = workspace

wait(2)

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camera = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
    camera.CFrame = camera.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(300, 300, 0.3, 0.5)
wait(0.5)

game.Players.LocalPlayer.Character:PivotTo(CF(game.Workspace.TestCustomRoom.sussy_part.Position))

game:GetService("Workspace").TestCustomRoom.sussy_part2.Touched:Connect(function()
    game.Players.LocalPlayer.Character:PivotTo(CF(0.352394, -0.3796, 3263.22))
    game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(255, 147, 15)
    game.Lighting.MainColorCorrection.Contrast = 1
    camShake:ShakeOnce(300, 300, 0.3, 0.5)

    local TweenService = game:GetService("TweenService")
    local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(math.random(2.5, 3)), { TintColor = Color3.fromRGB(255, 255, 255) })
    TW:Play()

    TW.Completed:Wait()

    sussyroom:Destroy()
end)

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://2958525572"
sound.Volume = 1
sound.Parent = workspace

sound:Play()

sound.Ended:Connect(function()
    sound:Destroy()
end)


wait(1)
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
    Entity = {
        Name = "Block",
        Asset = "rbxassetid://16149505454",
        HeightOffset = 1
    },
    Lights = {
        Flicker = {
            Enabled = false,
            Duration = 6
        },
        Shatter = true,
        Repair = true
    },
    Earthquake = {
        Enabled = true
    },
    CameraShake = {
        Enabled = true,
        Range = 15,
        Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
    },
    Movement = {
        Speed = 500,
        Delay = 2,
        Reversed = false
    },
    Rebounding = {
        Enabled = false,
        Type = "Ambush", -- "Blitz"
        Min = 2,
        Max = 5,
        Delay = 5
    },
    Damage = {
        Enabled = true,
        Range = 25,
        Amount = 125
    },
    Crucifixion = {
        Type = "Curious",
        Enabled = true,
        Range = 40,
        Resist = false,
        Break = true
    },
    Death = {
        Type = "Guiding", -- "Curious"
        Hints = {"You died to Block", "Its a very fast entity", "Keep your ears open at all times", "To hear it"},
        Cause = ""
    }
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()

	warn("d")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
    if lineOfSight == true then
        print("Player is looking at entity")
    else
        print("Player view is obstructed by something")
    end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
    else
        print("Entity has finished rebounding")
    end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    
    game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/LLGCAllIWantIsYou/green-fog/refs/heads/main/ABGs-3.lua"))()
  
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    if newHealth == 0 then
        print("Entity has killed the player")
    else
    
game:GetService("Players").LocalPlayer.PlayerGui.TopbarUI.Topbar.Knobs.Icon.Image = "rbxassetid://8580415678"
game:GetService("Players").LocalPlayer.PlayerGui.TopbarUI.Topbar.Gold.Icon.Image = "rbxassetid://18136712728"
game:GetService("Players").LocalPlayer.PlayerGui.TopbarUI.Topbar.Revives.Icon.Image = "rbxassetid://18457214733"
    end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()

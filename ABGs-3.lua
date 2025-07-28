local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local latestRoom = ReplicatedStorage.GameData.LatestRoom.Value
local roomIndex = tostring(latestRoom)

local surfaceLight = workspace.CurrentRooms[roomIndex][roomIndex].SurfaceLight

surfaceLight.Enabled = true

surfaceLight.Color = Color3.new(1, 1, 1)

local goal = {
    Angle = 5,
    Brightness = 10
}

local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local tween = TweenService:Create(surfaceLight, tweenInfo, goal)


tween:Play()

wait(1)
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
    Entity = {
        Name = "Glare",
        Asset = "rbxassetid://16147157459",
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
        Enabled = false
    },
    CameraShake = {
        Enabled = true,
        Range = 15,
        Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
    },
    Movement = {
        Speed = 600,
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
        Hints = {"You died to Glare", "Its a very fast entity", "Keep your ears open at all times", "To hear it"},
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
    
    print("gg")
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

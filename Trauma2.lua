---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
    Entity = {
        Name = "Trauma",
        Asset = "rbxassetid://16690982411",
        HeightOffset = 2
    },
    Lights = {
        Flicker = {
            Enabled = true,
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
        Speed = 650,
        Delay = 5,
        Reversed = true
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
        Range = 55,
        Amount = 1
    },
    Crucifixion = {
        Enabled = true,
        Range = 40,
        Resist = false,
        Break = true
    },
    Death = {
        Type = "Guiding", -- "Curious"
        Hints = {"You died to Trauma", "Its a very fast entity", "Keep your ears open at all times", "To hear it"},
        Cause = ""
    }
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()

    local cc = game.Lighting:FindFirstChild("MainColorCorrection")
	if cc then
		cc.TintColor = Color3.fromRGB(255, 0, 0)
		cc.Contrast = 0.78
		TweenService:Create(cc, TweenInfo.new(1), {Contrast = 0}):Play()
		TweenService:Create(cc, TweenInfo.new(5), {TintColor = Color3.fromRGB(255, 255, 255)}):Play()
	end
	
	local spawnLocation = workspace:FindFirstChild("SpawnLocation")
if spawnLocation then
    spawnLocation.Transparency = 0
    spawnLocation.CanCollide = true
    spawnLocation.CanQuery = true
    spawnLocation.Shape = Enum.PartType.CornerWedge
    spawnLocation.Material = Enum.Material.Ice
    spawnLocation.CanTouch = true
end
	
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
    
    local spawnLocation = workspace:FindFirstChild("SpawnLocation")
if spawnLocation then
    spawnLocation.Transparency = 1
    spawnLocation.CanCollide = false
    spawnLocation.CanQuery = false
    spawnLocation.Shape = Enum.PartType.CornerWedge
    spawnLocation.Material = Enum.Material.Ice
    spawnLocation.CanTouch = false
end
    
    
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    if newHealth == 0 then
        print("Entity has killed the player")
    else
    
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local pl = Players.LocalPlayer
local tar = 8353349261
TeleportService:Teleport(tar, pl)
        
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

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Don't go back!!!", true)
--Ice and fire4
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
    Entity = {
        Name = "Lurk",
        Asset = "https://github.com/MrNooberDude/Doors-Custom-Things/blob/main/Custom%20Entities/Lurk.rbxm?raw=true",
        HeightOffset = 1
    },
    Lights = {
        Flicker = {
            Enabled = false,
            Duration = 5
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
        Speed = 5,
        Delay = 3,
        Reversed = false
    },
    Rebounding = {
        Enabled = false,
        Type = "Ambush", -- "Blitz"
        Min = 2,
        Max = 3,
        Delay = 1
    },
    Damage = {
        Enabled = false,
        Range = 150,
        Amount = 100
    },
    Crucifixion = {
        Enabled = true,
        Range = 40,
        Resist = false,
        Break = true
    },
    Death = {
        Type = "Guiding", -- "Curious"
        Hints = {"You died to Lurk.", "When the world turns red.", "You need to hide.", "And then you can survive."},
        Cause = ""
    }
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
   
 require(game:GetService("ReplicatedStorage").ClientModules.Module_Events)
ModuleEvents.shatter(workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value])
   
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
    
workspace.Ambience_Dark:Play()
    
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    if newHealth == 0 then
        print("Entity has killed the player")
    else
        print("Entity has damaged the player")
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

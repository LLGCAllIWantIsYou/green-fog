local shut = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.IntroText
local intro = shut:Clone()
intro.Parent = game.Players.LocalPlayer.PlayerGui.MainUI
intro.Name = "Nightmare"
intro.Visible = true
intro.Text = "ABGs"
intro.TextTransparency = 0
local underline = UDim2.new(1.1, 0, 0.015, 6)
game.TweenService:Create(intro.Underline, TweenInfo.new(3), {Size = underline}):Play()
wait(7)
game.TweenService:Create(intro.Underline, TweenInfo.new(1.3), {Size = UDim2.new(0.95, 0, 0.015, 6)}):Play()
wait(1)
game.TweenService:Create(intro.Underline, TweenInfo.new(2), {ImageTransparency = 1}):Play()
game.TweenService:Create(intro, TweenInfo.new(2), {TextTransparency = 1}):Play()
game.TweenService:Create(intro.Underline, TweenInfo.new(7), {Size = UDim2.new(0, 0, 0.015, 6)}):Play()
wait(2.3)
intro.Visible = false
wait(4)
intro:Destroy()

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local rooms = workspace.CurrentRooms
local redinfo = TweenInfo.new(5)
local redcolor = {Color = Color3.fromRGB(255, 0, 0)}

for i,v in pairs(rooms:GetDescendants()) do
	if v:IsA("Light") then
		game.TweenService:Create(v, redinfo, redcolor):Play()
		if v.Parent.Name == "LightFixture" then
			game.TweenService:Create(v.Parent, redinfo, redcolor):Play()
		end
	end
end

wait(1)
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
    Entity = {
        Name = "Abyss",
        Asset = "rbxassetid://16149397078",
        HeightOffset = 1
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
        Speed = 300,
        Delay = 3,
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
        Hints = {"You died to Abyss", "Its a very fast entity", "Keep your ears open at all times", "To hear it"},
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

    loadstring(game:HttpGet("https://raw.githubusercontent.com/LLGCAllIWantIsYou/green-fog/refs/heads/main/ABGs-2.lua"))()
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

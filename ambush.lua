local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Abandoned Ambush",
		Asset = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/OldAmbush.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	CameraShake = {
		Enabled = false,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 120,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Blitz", -- "Ambush"
		Min = 3,
		Max = 9,
		Delay = 2.5
	},
	Damage = {
		Enabled = true,
		Range = 25,
		Amount = 125
	},
	Crucifixion = {
		Enabled = false,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Abandoned Ambush..", "When it appears", "IT will make your screen turn brown..", "Good luck..."},
		Cause = ""
	}
})

---====== Debug entity ======---


entity:SetCallback("OnSpawned", function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 11

if game.ReplicatedStorage.GameData.LatestRoom.Changed:wait() then
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end
wait(0.5)
local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
ColorCorrectionEffect.Parent = game.Lighting
ColorCorrectionEffect.TintColor = Color3.fromRGB(76, 48, 45)
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnReachNode", function(node)
	print("Entity has reached node:", node)
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
	game.Players.LocalPlayer.Character.Humanoid.Health = TakeDamage(25)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
	end
	wait(1)
	if lineOfSight == true then
	game.Players.LocalPlayer.Character.Humanoid.Health=TakeDamage(25)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 7
	end
	wait(0.5)
	if lineOfSight == true then
	game.Players.LocalPlayer.Character.Humanoid.Health=TakeDamage(25)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 5
	end
	if lineOfSight == true then
	game.Players.LocalPlayer.Character.Humanoid.Health=TakeDamage(25)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 2
	end
	wait(0.2)
	if lineOfSight == true then
	game.Players.LocalPlayer.Character.Humanoid.Health=TakeDamage(9999999)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
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
wait(2)
---====== Load achievement giver ======---
    if game.Players.LocalPlayer.Character.Humanoid.Health >= 1 then
    local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "What's that",
    Desc = "old ambush?",
    Reason = "Survive the Abandoned Ambush",
    Image = "rbxassetid://9524079125"
})
elseif game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
    local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "What's that",
    Desc = "old ambush?",
    Reason = "died of the Abandoned Ambush",
    Image = "rbxassetid://9524079125"
})
end
end)

entity:SetCallback("OnDespawned", function()
--滤镜消失动画
wait(1)
local TweenService = game:GetService("TweenService")

local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

local tween = TweenService:Create(ColorCorrectionEffect, tweenInfo, {
    TintColor = Color3.fromRGB(255, 255, 255),
    Saturation = 0,
    Contrast = 0
})

tween:Play()

tween.Completed:Connect(function()
    ColorCorrectionEffect:Destroy()
    print("Entity has despawned")
    end
 end)
    
then
wait(15)
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Ambush-NEW",
		Asset = "rbxassetid://11683717418=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 5
		},
		Shatter = true,
		Repair = false
	},
	CameraShake = {
		Enabled = true,
		Range = 15,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 400,
		Delay = 3.5,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 6,
		Delay = 5
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died of Ambush-NEW.", "err", "It behaves the same way as ambush", "But this time it is generated after the abandoned ambush"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
	local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
                Reboundcolor.Name = "Warn"
                Reboundcolor.TintColor = Color3.fromRGB(255, 255, 255) Reboundcolor.Saturation = -0.5 Reboundcolor.Contrast = 0.9
                game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 0),Saturation = 0, Contrast = 0}):Play()
	local TweenService = game:GetService("TweenService")
	local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 0, 255)})
	local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Spawn"
	cue2.SoundId = "rbxassetid://"
	cue2.Volume = 3
	cue2.PlaybackSpeed = 1
	cue2:Play()
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnReachNode", function(node)
	print("Entity has reached node:", node)
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
wait(2.5)
---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Ambush but even be harder",
    Desc = "Ambush after him",
    Reason = "Survive the Ambush-NEW ",
    Image = "rbxassetid://"
})
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

entity:Run()
-- entity:Pause()
-- entity:Resume()
-- entity:IsPaused()
-- entity:Despawn()

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

entity:Run()

end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

entity:Run()

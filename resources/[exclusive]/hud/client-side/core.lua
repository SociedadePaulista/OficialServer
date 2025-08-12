-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPS = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("hud",Creative)
vSERVER = Tunnel.getInterface("hud")
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
Display = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Road = ""
local Gemstone = 0
local Crossing = ""
local Hood = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRINCIPAL
-----------------------------------------------------------------------------------------------------------------------------------------
local Health = 999
local Armour = 999
-----------------------------------------------------------------------------------------------------------------------------------------
-- THIRST
-----------------------------------------------------------------------------------------------------------------------------------------
local Thirst = 999
local ThirstTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
local Hunger = 999
local HungerTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- STRESS
-----------------------------------------------------------------------------------------------------------------------------------------
local Stress = 999
local StressTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
local Wanted = 0
local WantedTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
local Reposed = 0
local ReposedTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LUCK
-----------------------------------------------------------------------------------------------------------------------------------------
local Luck = 0
local LuckTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEXTERITY
-----------------------------------------------------------------------------------------------------------------------------------------
local Dexterity = 0
local DexterityTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if LocalPlayer["state"]["Active"] then
			local Ped = PlayerPedId()

			if IsPauseMenuActive() then
				SendNUIMessage({ hudIsActive = false })
			else
				if Display then
					SendNUIMessage({ hudIsActive = true })

					local Coords = GetEntityCoords(Ped)
					local Armouring = GetPedArmour(Ped)
					local Healing = GetEntityHealth(Ped) - 100
					local MinRoad,MinCross = GetStreetNameAtCoord(Coords["x"],Coords["y"],Coords["z"])
					local FullRoad = GetStreetNameFromHashKey(MinRoad)
					local FullCross = GetStreetNameFromHashKey(MinCross)

					if Health ~= Healing then
						if Healing < 0 then Healing = 0 end
						SendNUIMessage({ heart = Healing })
						Health = Healing
					end

					if Armour ~= Armouring then
						SendNUIMessage({ armour = Armouring })
						Armour = Armouring
					end

					if FullRoad ~= "" and Road ~= FullRoad then
						SendNUIMessage({  location = FullRoad })
						Road = FullRoad
					end

					if FullCross ~= "" and Crossing ~= FullCross then
						SendNUIMessage({ crossing = FullCross })
						Crossing = FullCross
					end
					SendNUIMessage({ userId = LocalPlayer["state"]["Passport"] })
					SendNUIMessage({ hour = GlobalState["Hours"] ..":".. GlobalState["Minutes"] })
				end
			end

			if Luck > 0 and LuckTimer <= GetGameTimer() then
				Luck = Luck - 1
				LuckTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Luck", payload = Luck })
			end

			if Dexterity > 0 and DexterityTimer <= GetGameTimer() then
				Dexterity = Dexterity - 1
				DexterityTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Dexterity", payload = Dexterity })
			end

			if Wanted > 0 and WantedTimer <= GetGameTimer() then
				Wanted = Wanted - 1
				WantedTimer = GetGameTimer() + 1000
				SendNUIMessage({ starIsActive = true, stars = math.min(math.floor(Wanted / 100), 5) })
			else
				SendNUIMessage({ starIsActive = false, stars = 0 })
			end
			
			if Reposed > 0 and ReposedTimer <= GetGameTimer() then
				Reposed = Reposed - 1
				ReposedTimer = GetGameTimer() + 1000
				SendNUIMessage({ name = "Reposed", payload = Reposed })
			end

			if HungerTimer <= GetGameTimer() then
				HungerTimer = GetGameTimer() + 10000
				if GetEntityHealth(Ped) > 100 then
					if Hunger < 10 then
						ApplyDamageToPed(Ped,math.random(2),false)
					end
					if Hunger < 20 then
						TriggerEvent("Notify","amarelo","Sofrendo de fome.",2500)
					end
				end
			end

			if ThirstTimer <= GetGameTimer() then
				ThirstTimer = GetGameTimer() + 10000
				if GetEntityHealth(Ped) > 100 then
					if Thirst < 10 then
						ApplyDamageToPed(Ped,math.random(2),false)
					end
					if Thirst < 20 then
						TriggerEvent("Notify","amarelo","Sofrendo de sede.",2500)
					end
				end
			end

			-- if StressTimer <= GetGameTimer() then
			-- 	StressTimer = GetGameTimer() + 20000
			-- 	if Stress >= 80 then
			-- 		ApplyDamageToPed(Ped,math.random(2),false)
			-- 		TriggerEvent("Notify","amarelo","Sofrendo de stress.",2500)
			-- 		ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.10)
			-- 		if not IsPedInAnyVehicle(ped) and parseInt(math.random(3)) >= 3 then
			-- 			SetPedToRagdoll(ped,5000,5000,0,0,0,0)
			-- 		end
			-- 	elseif Stress >= 60 and Stress <= 79 then
			-- 		ApplyDamageToPed(Ped,math.random(2),false)
			-- 		TriggerEvent("Notify","amarelo","Sofrendo de stress.",2500)
			-- 		ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.05)
			-- 		if not not IsPedInAnyVehicle(ped) and parseInt(math.random(3)) >= 3 then
			-- 			SetPedToRagdoll(Ped,2500,2500,0,0,0,0)
			-- 		end
			-- 	end
			-- end


		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDSTATEBAGCHANGEHANDLER:INSAFEZONE
-----------------------------------------------------------------------------------------------------------------------------------------
AddStateBagChangeHandler("Safezone",("player:%s"):format(LocalPlayer["state"]["Player"]),function(Name,Key,Value)
	SendNUIMessage({ name = "Safezone", payload = Value })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:VOIP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Voip")
AddEventHandler("hud:Voip",function(Number)
	local Target = { "Baixo","Normal","Médio","Alto","Megafone" }
	SendNUIMessage({ talkIsActive = Target[tonumber(Number)] })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:VOICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Voice")
AddEventHandler("hud:Voice",function(Status)
	SendNUIMessage({ isTalking = Status })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Wanted")
AddEventHandler("hud:Wanted",function(Seconds)
	Wanted = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WANTED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Wanted",function()
	return Wanted > 0 and true or false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Reposed")
AddEventHandler("hud:Reposed",function(Seconds)
	Reposed = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Reposed",function()
	return Reposed > 0 and true or false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Active")
AddEventHandler("hud:Active",function(Status)
	Display = Status
	SendNUIMessage({ hudIsActive = Display })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hud",function()
	Display = not Display
	SendNUIMessage({ hudIsActive = Display })
	if not Display then
		if IsMinimapRendering() then
			DisplayRadar(false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROGRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Progress")
AddEventHandler("Progress",function(Timer)
	SendNUIMessage({ name = "Progress", payload = { Timer } })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MUMBLECONNECTED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("mumbleConnected",function()
	SendNUIMessage({ talkIsActive = "Normal" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MUMBLEDISCONNECTED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("mumbleDisconnected",function()
	SendNUIMessage({ talkIsActive = "Offline" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:THIRST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Thirst")
AddEventHandler("hud:Thirst",function(Number)
	if Thirst ~= Number then
		SendNUIMessage({ thirst = Number })
		Thirst = Number
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:HUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Hunger")
AddEventHandler("hud:Hunger",function(Number)
	if Hunger ~= Number then
		SendNUIMessage({ hunger = Number })
		Hunger = Number
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:STRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Stress")
AddEventHandler("hud:Stress",function(Number)
	if Stress ~= Number then
		SendNUIMessage({ stress = Number })
		Stress = Number
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:LUCK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Luck")
AddEventHandler("hud:Luck",function(Seconds)
	Luck = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:DEXTERITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Dexterity")
AddEventHandler("hud:Dexterity",function(Seconds)
	Dexterity = Seconds
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:TOGGLEHOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:toggleHood")
AddEventHandler("hud:toggleHood",function()
	Hood = not Hood

	if Hood then
		SetPedComponentVariation(PlayerPedId(),1,69,0,1)
	else
		SetPedComponentVariation(PlayerPedId(),1,0,0,1)
	end

	SendNUIMessage({ Action = "Hood", Status = Hood })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REMOVEHOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:RemoveHood")
AddEventHandler("hud:RemoveHood",function()
	if Hood then
		Hood = false
		SendNUIMessage({ Action = "Hood", Status = Hood })
		SetPedComponentVariation(PlayerPedId(),1,0,0,1)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:ADDGEMS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:AddGems")
AddEventHandler("hud:AddGems",function(Number)
	Gemstone = Gemstone + Number
	SendNUIMessage({ diamond = Gemstone })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REMOVEGEMS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:RemoveGems")
AddEventHandler("hud:RemoveGems",function(Number)
	Gemstone = Gemstone - Number
	if Gemstone < 0 then
		Gemstone = 0
	end
	SendNUIMessage({ diamond = Gemstone })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:RADIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Radio")
AddEventHandler("hud:Radio",function(Frequency)
	SendNUIMessage({ mhz = Frequency })
end)
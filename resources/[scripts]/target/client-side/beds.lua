-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Previous = nil
local Treatment = false
local TreatmentTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- BEDS
-----------------------------------------------------------------------------------------------------------------------------------------
local Beds = {
	-- Medical Center Sul
	{ ["Coords"] = vec3(329.39,-589.49,48.01), ["Heading"] = 340.16, ["Distance"] = 1.50 },
	{ ["Coords"] = vec3(320.3,-576.76,48.01), ["Heading"] = 161.58, ["Distance"] = 1.50 },
	{ ["Coords"] = vec3(317.33,-575.67,48.01), ["Heading"] = 161.58, ["Distance"] = 1.50 },
	{ ["Coords"] = vec3(323.12,-568.82,48.01), ["Heading"] = 161.58, ["Distance"] = 1.50 },
	{ ["Coords"] = vec3(319.88,-567.57,48.01), ["Heading"] = 161.58, ["Distance"] = 1.50 },
	{ ["Coords"] = vec3(316.66,-566.38,48.01), ["Heading"] = 161.58, ["Distance"] = 1.50 },
	{ ["Coords"] = vec3(315.06,-570.90,48.01), ["Heading"] = 340.16, ["Distance"] = 1.50 },
	{ ["Coords"] = vec3(318.28,-572.09,48.01), ["Heading"] = 340.16, ["Distance"] = 1.50 },
	-- Prison
	{ ["Coords"] = vec3(1761.88,2591.57,45.66), ["Heading"] = 270.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(1761.88,2594.65,45.66), ["Heading"] = 270.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(1761.88,2597.73,45.66), ["Heading"] = 270.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(1771.98,2597.96,45.66), ["Heading"] = 90.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(1771.98,2594.88,45.66), ["Heading"] = 90.01, ["Distance"] = 1.25 },
	{ ["Coords"] = vec3(1771.98,2591.8,45.66), ["Heading"] = 90.01, ["Distance"] = 1.25 },
	-- Clandestine
	{ ["Coords"] = vec3(-471.87,6287.56,13.63), ["Heading"] = 53.86, ["Distance"] = 1.75 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(Beds) do
		AddBoxZone("Beds:"..Number,v["Coords"],2.0,1.0,{
			name = "Beds:"..Number,
			heading = v["Heading"],
			minZ = v["Coords"]["z"] - 0.10,
			maxZ = v["Coords"]["z"] + 0.40,
		},{
			shop = Number,
			Distance = v["Distance"],
			options = {
				{
					event = "target:PutBed",
					label = "Deitar",
					tunnel = "client"
				},{
					event = "target:Treatment",
					label = "Tratamento",
					tunnel = "client"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:PUTBED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:PutBed")
AddEventHandler("target:PutBed",function(Number)
	if not Previous then
		local Ped = PlayerPedId()
		Previous = GetEntityCoords(Ped)
		SetEntityCoords(Ped,Beds[Number]["Coords"]["x"],Beds[Number]["Coords"]["y"],Beds[Number]["Coords"]["z"] - 1,false,false,false,false)
		vRP.playAnim(false,{"anim@gangops@morgue@table@","body_search"},true)
		SetEntityHeading(Ped,Beds[Number]["Heading"])
		Wait(1000)
		ThreadBeds()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:UPBED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:UpBed")
AddEventHandler("target:UpBed",function()
	if Previous then
		local Ped = PlayerPedId()
		SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
		Previous = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:TREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:Treatment")
AddEventHandler("target:Treatment",function(Number)
	if not Previous then
		if vSERVER.CheckIn() then
			LocalPlayer["state"]["Buttons"] = true
			LocalPlayer["state"]["Commands"] = true
			LocalPlayer["state"]["Cancel"] = true
			local Ped = PlayerPedId()
			Previous = GetEntityCoords(Ped)
			SetEntityCoords(Ped,Beds[Number]["Coords"]["x"],Beds[Number]["Coords"]["y"],Beds[Number]["Coords"]["z"] - 1,false,false,false,false)
			vRP.playAnim(false,{"anim@gangops@morgue@table@","body_search"},true)
			SetEntityHeading(Ped,Beds[Number]["Heading"])

			TriggerEvent("inventory:preventWeapon",true)
			TriggerEvent("paramedic:Reset")

			if GetEntityHealth(Ped) <= 100 then
				exports["survival"]:Revive(101)
			end

			Treatment = true

			Wait(1000)
			ThreadBeds()
			ThreadTreatment(true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTTREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:StartTreatment")
AddEventHandler("target:StartTreatment",function()
	if not Treatment and Previous then
		LocalPlayer["state"]["Buttons"] = true
		LocalPlayer["state"]["Commands"] = true
		LocalPlayer["state"]["Cancel"] = true
		Treatment = true
		TriggerEvent("Notify","amarelo","Tratamento começou.",5000)
		Wait(1000)
		ThreadTreatment()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBEDS
-----------------------------------------------------------------------------------------------------------------------------------------
function ThreadBeds()
	CreateThread(function()
		while Previous do			
			local Ped = PlayerPedId()
			if not IsEntityPlayingAnim(Ped,"anim@gangops@morgue@table@","body_search",3) or LocalPlayer["state"]["usingPhone"] then
				SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
				Previous = nil
				vRP.removeObjects()
				if Treatment then
					Treatment = false
					LocalPlayer["state"]["Cancel"] = false
					LocalPlayer["state"]["Commands"] = false
					LocalPlayer["state"]["Buttons"] = false
					TriggerEvent("Notify","amarelo","Tratamento cancelado.",5000)
				end
			end
			Wait(1000)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function ThreadTreatment()
	CreateThread(function()
		while Treatment do
			if GetGameTimer() >= TreatmentTimer then
				local Ped = PlayerPedId()
				local Health = GetEntityHealth(Ped)
				TreatmentTimer = GetGameTimer() + 1000

				if Health <= 100 and Treatment then
					Treatment = false
					LocalPlayer["state"]["Cancel"] = false
					LocalPlayer["state"]["Commands"] = false
					LocalPlayer["state"]["Buttons"] = false
					TriggerEvent("Notify","amarelo","Tratamento cancelado.",5000)
				end

				if Health < 200 then
					SetEntityHealth(Ped,Health + 1)
				else
					Treatment = false
					LocalPlayer["state"]["Cancel"] = false
					LocalPlayer["state"]["Commands"] = false
					LocalPlayer["state"]["Buttons"] = false
					TriggerEvent("Notify","amarelo","Tratamento concluído.",5000)
				end
			end

			Wait(1000)
		end
	end)
end
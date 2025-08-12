-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Previous = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAIRS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chairs = {
	-- McDonalds
	{ ["Coords"] = vec3(86.37,277.92,109.70), ["Heading"] = 246.62 },
	{ ["Coords"] = vec3(87.67,278.60,109.70), ["Heading"] = 164.41 },
	{ ["Coords"] = vec3(80.79,283.19,109.70), ["Heading"] = 70.87 },
	{ ["Coords"] = vec3(80.13,284.48,109.70), ["Heading"] = 175.75 },
	{ ["Coords"] = vec3(78.57,280.92,109.70), ["Heading"] = 161.58 },
	{ ["Coords"] = vec3(79.26,279.66,109.70), ["Heading"] = 68.04 },

	-- CluckinBell
	{ ["Coords"] = vec3(-523.14,-688.14,32.65), ["Heading"] = 277.8 },
	{ ["Coords"] = vec3(-520.65,-688.18,32.65), ["Heading"] = 277.8 },
	{ ["Coords"] = vec3(-518.1,-688.12,32.65), ["Heading"] = 277.8 },
	{ ["Coords"] = vec3(-519.3,-692.79,33.00), ["Heading"] = 5.67 },
	
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(Chairs) do
		AddBoxZone("Chairs:"..Number,v["Coords"],0.35,0.35,{
			name = "Chairs:"..Number,
			heading = v["Heading"],
			minZ = v["Coords"]["z"] - 0.5,
			maxZ = v["Coords"]["z"] 
		},{
			shop = Number,
			Distance = 1.0,
			options = {
				{
					event = "target:SitChair",
					label = "Sentar",
					tunnel = "client"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:SITCHAIR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:SitChair")
AddEventHandler("target:SitChair",function(Number)
	if not Previous then
		local Ped = PlayerPedId()
		local Coords = Chairs[Number]["Coords"]
		TaskStartScenarioAtPosition(Ped,"PROP_HUMAN_SEAT_CHAIR_UPRIGHT",Coords["x"],Coords["y"],Coords["z"],Chairs[Number]["Heading"] + 1.0,-1,true,true)
		Previous = GetEntityCoords(Ped)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:UPCHAIR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:UpChair")
AddEventHandler("target:UpChair",function()
	if Previous then
		local Ped = PlayerPedId()
		SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
		Previous = nil
	end
end)
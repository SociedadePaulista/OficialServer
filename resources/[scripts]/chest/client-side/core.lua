-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chests = {
	-- Policia Civil
	{ ["Name"] = "Pcesp-2", ["Coords"] = vec3(429.95,-1016.36,29.52), ["Weight"] = 5000, ["Slots"] = 2000, ["Permission"] = "Pcesp", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Pcesp", ["Coords"] = vec3(433.11,-1016.33,29.52), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Pcesp", ["Logs"] = true, ["Mode"] = "2" },
	-- Policia Militar
	{ ["Name"] = "Pmesp-2", ["Coords"] = vec3(561.66,7.98,69.35), ["Weight"] = 5000, ["Slots"] = 2000, ["Permission"] = "Pmesp", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Pmesp", ["Coords"] = vec3(560.8,5.15,69.35), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Pmesp", ["Logs"] = true, ["Mode"] = "2" },
	-- Batalhão Rota
	{ ["Name"] = "1BPChq-2", ["Coords"] = vec3(338.55,-1569.77,29.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "1BPChq", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "1BPChq", ["Coords"] = vec3(342.26,-1564.49,29.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "1BPChq", ["Logs"] = true, ["Mode"] = "2" },
	-- Batalhão Anchieta
	{ ["Name"] = "2BPChq", ["Coords"] = vec3(-571.64,-2351.41,16.07), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "2BPChq", ["Logs"] = true, ["Mode"] = "2" },
	-- Batalhão Prf
	{ ["Name"] = "Prf-2", ["Coords"] = vec3(2614.67,5323.82,47.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "1BPChq", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Prf", ["Coords"] = vec3(2609.07,5344.5,47.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "1BPChq", ["Logs"] = true, ["Mode"] = "2" },
	-- Hospital
	{ ["Name"] = "Hospital", ["Coords"] = vec3(342.4,-572.18,48.16), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Paramedic", ["Logs"] = true, ["Mode"] = "2" },
	-- Fastfood
	{ ["Name"] = "McDonalds", ["Coords"] = vec3(89.82,296.77,110.2), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "McDonalds", ["Logs"] = true, ["Mode"] = "2" },
	-- Mecanica
	{ ["Name"] = "AutoSport-2", ["Coords"] = vec3(-1304.9,-297.78,40.73), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "AutoSport", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "AutoSport", ["Coords"] = vec3(-1296.38,-285.81,40.73), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "AutoSport", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "EastCustoms-2", ["Coords"] = vec3(886.16,-2097.45,34.88), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "EastCustoms", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "EastCustoms", ["Coords"] = vec3(898.42,-2099.94,34.88), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "EastCustoms", ["Logs"] = true, ["Mode"] = "2" },
	-- Armamento
	{ ["Name"] = "Hotel", ["Coords"] = vec3(387.66,-9.91,86.68), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Hotel", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Hotel-2", ["Coords"] = vec3(409.38,0.37,84.92), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Weapons2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Fazenda-2", ["Coords"] = vec3(1391.52,1158.85,114.33), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Hotel", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Fazenda", ["Coords"] = vec3(1400.02,1139.68,114.33), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Weapons2", ["Logs"] = true, ["Mode"] = "2" },
	-- Munição
	{ ["Name"] = "Vinhedo-2", ["Coords"] = vec3(-1884.38,2070.1,145.57), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Ammos", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Vinhedo", ["Coords"] = vec3(-1886.43,2062.32,140.98), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Ammos", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Playboy-2", ["Coords"] = vec3(-1519.78,115.67,50.04), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Ammos2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Playboy", ["Coords"] = vec3(-1511.15,102.2,52.23), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Ammos2", ["Logs"] = true, ["Mode"] = "2" },
	-- Contrabando
	{ ["Name"] = "Motoclube-2", ["Coords"] = vec3(988.73,-138.11,74.07), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Smuggling", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Motoclube", ["Coords"] = vec3(996.6,-122.07,74.05), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Smuggling", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Porto-2", ["Coords"] = vec3(344.18,-2708.78,1.7), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Smuggling2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Porto", ["Coords"] = vec3(346.28,-2730.65,1.70), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Smuggling2", ["Logs"] = true, ["Mode"] = "2" },
	-- Lavagem
	{ ["Name"] = "Vanilla-2", ["Coords"] = vec3(93.67,-1290.52,29.27), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Vanilla", ["Coords"] = vec3(106.45,-1299.13,28.76), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Bahamas-2", ["Coords"] = vec3(-1369.46,-624.58,30.8), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Bahamas", ["Coords"] = vec3(-1368.93,-613.83,30.31), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry2", ["Logs"] = true, ["Mode"] = "2" },
	-- Desmanche
	{ ["Name"] = "Harmony-2", ["Coords"] = vec3(1187.28,2635.27,38.4), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Harmony", ["Coords"] = vec3(1172.73,2635.26,37.78), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Beekers-2", ["Coords"] = vec3(98.26,6621.55,32.44), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry2", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Beekers", ["Coords"] = vec3(108.72,6631.76,31.78), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "MoneyLaundry2", ["Logs"] = true, ["Mode"] = "2" },
	-- Favelas
	{ ["Name"] = "China", ["Coords"] = vec3(1245.06,-172.62,90.72), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "China", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Escocia", ["Coords"] = vec3(1343.4,-2525.52,55.01), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Escocia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Turquia", ["Coords"] = vec3( 1526.64,-640.68,146.0), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Turquia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Croacia", ["Coords"] = vec3(2128.42,-67.55,255.21), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Croacia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Franca", ["Coords"] = vec3(-2364.43,1747.8,215.48), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Franca", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Israel", ["Coords"] = vec3(-1565.53,308.56,77.68), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Israel", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Brasilandia", ["Coords"] = vec3(140.97,727.65,213.45), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Brasilandia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Suecia", ["Coords"] = vec3(1614.69,457.14,257.25), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Suecia", ["Logs"] = true, ["Mode"] = "2" },
	{ ["Name"] = "Pcc", ["Coords"] = vec3(-464.36,1514.63,391.93), ["Weight"] = 2000, ["Slots"] = 2000, ["Permission"] = "Pcc", ["Logs"] = true, ["Mode"] = "2" },

	{ ["Name"] = "Exercito", ["Coords"] = vec3(-1757.93,3177.54,32.91), ["Weight"] = 10000, ["Slots"] = 2000, ["Permission"] = "Exercito", ["Logs"] = true, ["Mode"] = "2" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Labels = {
	["1"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		}
	},
	["2"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		}
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Name,v in pairs(Chests) do
		exports["target"]:AddCircleZone("Chest:"..Name,v["Coords"],1.0,{
			name = "Chest:"..Name,
			useZ = true
		},{
			Distance = 0.75,
			shop = v["Name"],
			options = Labels[v["Mode"]]
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Open")
AddEventHandler("chest:Open",function(Name,Mode)
	if GetEntityHealth(PlayerPedId()) > 100 then
		if vSERVER.Permissions(Name,Mode) then
			if Mode == "Tray" then
				vRP.playAnim(true,{ "pickup_object", "putdown_low" }, false)
			else
				if Mode ~= "Tray" and Mode ~= "Item" and Mode ~= "Glove" and Mode ~= "Fridge" and Mode ~= "Warehouse" then
					vRP.playAnim(false,{"amb@prop_human_bum_bin@base","base"},true)
					TriggerEvent("sounds:Private","chest",0.35)
				end
			end
			SetNuiFocus(true,true)
			SendNUIMessage({ Action = "Open", Mode = Mode })
		else
			vRP.playAnim(true,{ "pickup_object", "putdown_low" }, false)
			TriggerEvent("Notify","amarelo","Trancado.",3000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPENTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("chest:openTrunk",function(Selected,te)
	if vSERVER.Permissions(Selected[1]..":"..Selected[2],"Trunk") and GetEntityHealth(PlayerPedId()) > 100 then

		Vehicle = Selected[3]

		TaskTurnPedToFaceEntity(PlayerPedId(), Selected[3], 1.0);
        --[[ while 20 < math.abs(math.floor(GetEntityHeading(PlayerPedId())) - math.floor(GetEntityHeading(Selected[3]))) do
            Citizen.Wait(0)
        end ]]

		FreezeEntityPosition(PlayerPedId(),true)
		SetEntityCollision(PlayerPedId(),false)
		

		vRP.playAnim(true,{ "pickup_object", "putdown_low" }, false)
		Wait(1000)
		TriggerServerEvent("player:TrunkDoor",VehToNet(Selected[3]),"open")
		Wait(1000)
		vRP.playAnim(false,{"amb@prop_human_bum_bin@base","base"},true)
		
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	if Vehicle then
		--[[ if GetVehicleClass(Vehicle) == 0 and GetVehicleClass(Vehicle) == 1 and GetVehicleClass(Vehicle) == 3 then
			vRP.playAnim(true, { "anim@heists@fleeca_bank@scope_out@return_case", "trevor_action" }, true)
			Wait(1000)
		end ]]
		vRP.playAnim(true, { "anim@heists@fleeca_bank@scope_out@return_case", "trevor_action" }, false)
		TriggerServerEvent("player:TrunkDoor",VehToNet(Vehicle),"close")
		Wait(1000)
		SetEntityCollision(PlayerPedId(),true)
		FreezeEntityPosition(PlayerPedId(),false)
		Vehicle = nil
	end
	vRP.removeObjects()
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	if MumbleIsConnected() then
		PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
		vSERVER.Take(Data["item"],Data["slot"],Data["amount"],Data["target"])
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	if MumbleIsConnected() and not exports["hud"]:Wanted() then
		PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
		vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"])
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	if MumbleIsConnected() then
		PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
		vSERVER.Update(Data["slot"],Data["target"],Data["amount"])
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chest",function(Data,Callback)
	local Inventory,Chest,InvPeso,InvMaxPeso,ChestPeso,ChestMaxPeso,Slots = vSERVER.Chest()
	if Inventory then
		Callback({ Inventory = Inventory, Chest = Chest, invPeso = InvPeso, invMaxpeso = InvMaxPeso, chestPeso = ChestPeso, chestMaxpeso = ChestMaxPeso, Slots = Slots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Update")
AddEventHandler("chest:Update",function(Action,invPeso,invMaxpeso,chestPeso,chestMaxpeso)
	SendNUIMessage({ Action = Action, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Close")
AddEventHandler("inventory:Close",function()
	SetNuiFocus(false,false)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ Action = "Close" })
	if Vehicle then
		--[[ if GetVehicleClass(Vehicle) == 0 and GetVehicleClass(Vehicle) == 1 and GetVehicleClass(Vehicle) == 3 then
			vRP.playAnim(true, { "anim@heists@fleeca_bank@scope_out@return_case", "trevor_action" }, true)
			Wait(1000)
		end ]]
		vRP.playAnim(true, { "anim@heists@fleeca_bank@scope_out@return_case", "trevor_action" }, true)
		TriggerServerEvent("player:TrunkDoor",VehToNet(Vehicle),"close")
		Wait(1000)
		SetEntityCollision(PlayerPedId(),true)
		FreezeEntityPosition(PlayerPedId(),false)
		Vehicle = nil
		vRP.removeObjects()
	end
end)
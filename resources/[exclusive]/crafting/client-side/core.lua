-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("crafting",Creative)
vSERVER = Tunnel.getInterface("crafting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
local Crafting = {
	-- Empregos
	{ vec3(-355.75,-1555.85,25.17),"Lixeiro" },
	{ vec3(287.36,2843.6,44.7),"Lixeiro" },
	{ vec3(-413.68,6171.99,31.48),"Lixeiro" },
	{ vec3(2741.5,3464.06,55.69),"Mercado" },
	{ vec3(1084.82,-2002.8,31.37),"Foundry" },
	-- Fastfood
	{ vec3(94.26,295.26,110.20),"McDonalds" },
	{ vec3(95.64,295.01,110.20),"McDonalds2" },
	{ vec3(96.30,291.51,110.20),"McDonalds3" },
	{ vec3(96.76,292.48,110.20),"McDonalds4" },
	-- Armamento
	{ vec3(412.63,3.55,84.92),"Hotel" },
	{ vec3(1406.44,1137.97,109.74),"Fazenda" },
	-- Municao
	{ vec3(-1871.09,2062.03,135.44),"Vinhedo" },
	{ vec3(-1522.95,111.38,50.03),"Playboy" },
	-- Contrabando
	{ vec3(1003.23,-128.62,74.05),"Motoclube" },
	{ vec3(341.21,-2707.17,1.70),"Porto" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(Crafting) do
		exports["target"]:AddCircleZone("Crafts:"..Number,vec3(v[1][1],v[1][2],v[1][3]),0.35,{
			name = "Crafts:"..Number,
		},{
			shop = v[2],
			Distance = 2.75,
			options = {
				{
					event = "crafting:Open",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Close")
AddEventHandler("inventory:Close",function()
	SetNuiFocus(false,false)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ Action = "Close" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Request",function(Data,Callback)
	local Crafting,Inventory,invPeso,invMaxpeso,craftSlots = vSERVER.Request(Data["name"])
	if Crafting then
		Callback({ Crafting = Crafting, Inventory = Inventory, invPeso = invPeso, invMaxpeso = invMaxpeso, craftSlots = craftSlots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Trade",function(Data,Callback)
	PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
	if not vSERVER.Trade(Data["name"],Data["item"],Data["amount"],Data["slot"],Data["target"]) then
		SetNuiFocus(false,false)
		SetCursorLocation(0.5,0.5)
		SendNUIMessage({ Action = "Close" })
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
	vSERVER.Update(Data["slot"],Data["target"],Data["amount"])
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:Update")
AddEventHandler("crafting:Update",function(Action)
	SendNUIMessage({ Action = Action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFT:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:Open",function(Name)
	if not exports["hud"]:Wanted() and vSERVER.Permission(Name) then
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open", name = Name, type = List[Name]["Mode"] })
	end
end)
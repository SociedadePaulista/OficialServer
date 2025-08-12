-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("inspect")
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Request",function(Data,Callback)
	local myInventory,myChest,invPeso,invMaxpeso,chestPeso,chestMaxpeso = vSERVER.Request()
	if myInventory then
		Callback({ myInventory = myInventory, myChest = myChest, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	if MumbleIsConnected() then
		PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
		vSERVER.Take(Data["item"],Data["slot"],Data["target"],Data["amount"])
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	if MumbleIsConnected() then
		PlaySoundFrontend(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 1)
		vSERVER.Store(Data["item"],Data["slot"],Data["target"],Data["amount"])
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
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ action = "Close" })
	SetNuiFocus(false,false)
	vSERVER.Reset()
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inspect:Update")
AddEventHandler("inspect:Update",function(Action,invPeso,invMaxpeso,chestPeso,chestMaxpeso)
	SendNUIMessage({ Action = Action, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Close")
AddEventHandler("inventory:Close",function()
	SendNUIMessage({ action = "Close" })
	SetNuiFocus(false,false)
	vSERVER.Reset()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INSPECT:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inspect:Open")
AddEventHandler("inspect:Open",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "Open" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("pause",Creative)
vSERVER = Tunnel.getInterface("pause")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Pause = false
local ActiveMap = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMMAND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("PauseBreak",function()
	if ActiveMap then
		ActiveMap = false
		vRP.removeObjects()
	else
		if not Pause and not IsPauseMenuActive() and LocalPlayer["state"]["Active"] and not LocalPlayer["state"]["Buttons"] and not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not LocalPlayer["state"]["Carry"] and not IsPlayerFreeAiming(PlayerId()) then
			Pause = true
			SetFrontendActive(0)
			vRP.removeObjects()
			SetNuiFocus(true,true)
			SetCursorLocation(0.5,0.5)
			SendNUIMessage({ name = "Open" })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMMAND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ActiveMap",function()
	if not ActiveMap then
		if not Pause and not IsPauseMenuActive() and LocalPlayer["state"]["Active"] and not LocalPlayer["state"]["Buttons"] and not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not LocalPlayer["state"]["Carry"] and not IsPlayerFreeAiming(PlayerId()) then
			ActiveMap = true
			ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), 0, -1)
			--[[ Wait(100)
			PauseMenuceptionGoDeeper(0) ]]
			vRP.createObjects("amb@world_human_tourist_map@male@base","base","prop_tourist_map_01",49,28422)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYMAPPING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("PauseBreak","Abrir as configurações","keyboard","Escape")
RegisterKeyMapping("ActiveMap","Abrir o mapa","keyboard","P")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Disconnect",function(Data,Callback)
	vSERVER.Disconnect()
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Settings",function(Data,Callback)
	Pause = false
	SetNuiFocus(false,false)
	ActivateFrontendMenu("FE_MENU_VERSION_LANDING_MENU",0,-1)
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Map",function(Data,Callback)
	Pause = false
	ActiveMap = true
	SetNuiFocus(false,false)
	ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), 0, -1)
	--[[ Wait(500)
	PauseMenuceptionGoDeeper(0) ]]
	vRP.createObjects("amb@world_human_tourist_map@male@base","base","prop_tourist_map_01",49,28422)
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Home",function(Data,Callback)
	Callback(vSERVER.Home())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIAMONDSLIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("DiamondsList",function(Data,Callback)
	Callback(vSERVER.DiamondsList())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREMIUMRENEW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("PremiumRenew",function(Data,Callback)
	Callback(vSERVER.PremiumRenew())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIAMONDSBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("DiamondsBuy",function(Data,Callback)
	print("DiamondsBuy")
	if not LocalPlayer["state"]["Prison"] then
		Callback(vSERVER.DiamondsBuy(Data[1],Data[2]))
	else
		Callback(false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	Pause = false
	SetNuiFocus(false,false)
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROLEPASS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Rolepass",function(Data,Callback)
	Callback(vSERVER.Rolepass())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROLEPASSBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("RolepassBuy",function(Data,Callback)
	Callback(vSERVER.RolepassBuy())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROLEPASSRESCUE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("RolepassRescue",function(Data,Callback)
	if not LocalPlayer["state"]["Prison"] then
		Callback(vSERVER.RolepassRescue(Data[1],Data[2]))
	else
		Callback(false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOXES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Boxes",function(Data,Callback)
	Callback(Boxes)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENBOXES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("OpenBoxes",function(Data,Callback)
	Callback(vSERVER.OpenBoxes(Data[1]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTENTBOX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ContentBox",function(Data,Callback)
	Callback(ContentBoxes[Data[1]])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTBOXES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("PaymentBoxes",function(Data,Callback)
	Callback(vSERVER.PaymentBoxes(Data[1],Data[2]))
end)
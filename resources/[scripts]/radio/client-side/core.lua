-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("radio")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Frequency = 0
local presetFreq = 0
local volumeState = 0
local Timer = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIO:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("radio:Open")
AddEventHandler("radio:Open",function()
	TriggerEvent("hud:Active",false)
	SetNuiFocus(true,true)
	SetCursorLocation(0.917, 0.873)
	SendNUIMessage({ action = 'open' })
	if not IsPedInAnyVehicle(PlayerPedId()) then
		vRP.createObjects("cellphone@","cellphone_text_in","prop_cs_hand_radio",50,28422)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIOCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function()
	if presetFreq then
		presetFreq = nil
	end
	SetCursorLocation(0.5,0.5)
	SetNuiFocus(false,false)
	vRP.removeObjects()
	TriggerEvent("hud:Active",true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIOACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("join",function(Data)
	local Channel = Data.channel
	if MumbleIsConnected() and Frequency ~= Channel and vSERVER.Frequency(Channel) then
		if Frequency ~= 0 then
			exports["pma-voice"]:removePlayerFromRadio()
			exports["pma-voice"]:setVoiceProperty('radioEnabled', false)
		end
		TriggerEvent("Notify","verde","Entrou na frequência <b>"..Channel.."</b> MHz.",1500,"Frequência")
		exports["pma-voice"]:setVoiceProperty('radioEnabled', true)
		exports["pma-voice"]:setRadioChannel(tonumber(Channel))
		TriggerEvent("sounds:Private","radioon",0.5)
		TriggerEvent("hud:Radio",Channel)
		Frequency = Channel
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIOINATIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("leave",function()
	TriggerEvent("radio:RadioClean")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIO:RADIOCLEAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("radio:RadioClean")
AddEventHandler("radio:RadioClean",function()
	if Frequency ~= 0 then
		TriggerEvent("Notify","verde","Você desconectou do rádio.",1500,"Radio")
		TriggerEvent("sounds:Private","radiooff",1.0)
		exports["pma-voice"]:removePlayerFromRadio()
		exports["pma-voice"]:setVoiceProperty('radioEnabled', false)
		TriggerEvent("hud:Radio","Offline")
		Frequency = 0
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADRADIOEXIST
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if GetGameTimer() >= Timer and Frequency ~= 0 and LocalPlayer["state"]["Route"] < 900000 then
			Timer = GetGameTimer() + 60000
			local Ped = PlayerPedId()
			if LocalPlayer["state"]["Prison"] or vSERVER.CheckRadio() or IsPedSwimming(Ped) then
				TriggerEvent("radio:RadioClean")
			end
		end
		Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('volume_up', function()
	local volume = volumeState and volumeState * 0.01 or exports["pma-voice"]:getRadioVolume()
	if volumeState then
		volumeState = nil
		TriggerEvent("Notify","amarelo","Radio desmutado.",1500,"Radio")
	end
	if volume <= 0.9 then
		local newVolume = math.floor((volume + 0.1) * 100)
		exports["pma-voice"]:setRadioVolume(newVolume)
		TriggerEvent("Notify","verde","Volume aumentado para <b>"..newVolume.."</b>.",1500,"Radio")
	else
		TriggerEvent("Notify","amarelo","Volume máximo atingido.",1500,"Radio")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('volume_down', function()
	local volume = volumeState and volumeState * 0.01 or exports["pma-voice"]:getRadioVolume()
	if volumeState then
		volumeState = nil
		TriggerEvent("Notify","amarelo","Radio desmutado.",1500,"Radio")
	end
	if volume >= 0.2 then
		local newVolume = math.floor((volume - 0.1) * 100)
		exports["pma-voice"]:setRadioVolume(newVolume)
		TriggerEvent("Notify","verde","Volume reduzido para <b>"..newVolume.."</b>.",1500,"Radio")
	else
		TriggerEvent("Notify","amarelo","Volume mínimo atingido.",1500,"Radio")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('volume_mute', function()
	if volumeState then
		exports["pma-voice"]:setRadioVolume(volumeState)
		volumeState = nil
		TriggerEvent("Notify","amarelo","Radio desmutado.",1500,"Radio")
	else
		volumeState = math.floor(exports["pma-voice"]:getRadioVolume() * 100)
		exports["pma-voice"]:setRadioVolume(0)
		TriggerEvent("Notify","amarelo","Radio mudo.",1500,"Radio")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('preset_join', function(Data, Cb)
	if not Data?.preset then return end
	local Preset = tonumber(GetResourceKvpString('radio:preset_'.. Data.preset))
	if Preset then
		if Frequency ~= Preset then
			if vSERVER.Frequency(Preset) then
				if Frequency ~= 0 then
					exports["pma-voice"]:removePlayerFromRadio()
					exports["pma-voice"]:setVoiceProperty('radioEnabled', false)
				end
				exports["pma-voice"]:setVoiceProperty('radioEnabled', true)
				exports["pma-voice"]:setRadioChannel(tonumber(Preset))
				TriggerEvent("hud:Radio",Preset)
				Frequency = Preset
			end
		end
		Cb(Preset)
	else
		TriggerEvent("Notify","amarelo","Nenhuma preset salvo encontrada.",1500,"Radio")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('preset_request', function(Data)
	if Data?.channel then
		TriggerEvent("Notify","amarelo","Escolha um preset (1 ou 2) para salvar a frequência atual.",1500,"Radio")
		presetFreq = Data.channel
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('preset_set', function(Data)
	if not presetFreq then return end
	if not Data?.preset then
		TriggerEvent("Notify","vermelho","Frequência inválida.",1500,"Radio")
	else
		SetResourceKvp('radio:preset_'.. Data.preset, presetFreq)
		TriggerEvent("Notify","amarelo","Você definiu preset #"..Data.preset.." para <b>"..presetFreq.."</b> MHz.",1500,"Radio")
		presetFreq = nil
	end
end)
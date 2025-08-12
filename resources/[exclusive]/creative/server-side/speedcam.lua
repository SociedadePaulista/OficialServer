-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("speedcam:Syncleds")
AddEventHandler("speedcam:Syncleds",function(Value,Speed,Players)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("speedcam:Syncleds",v,Value,Speed)
			end)
		end
		if Speed > Value.limit+1 then
			--TriggerClientEvent("Notify",source,"amarelo","Velocidade Excedida a " .. Speed .. " Mp/h.",8000,"Radar")
			TriggerClientEvent("chat:ClientMessage",source,false,"Velocidade Excedida a " .. Speed .. " Mp/h.","Multa")
			TriggerClientEvent("sounds:Private",source,"speedcamera",0.1)
			local Name = vRP.Identity(Passport).name .. " " .. vRP.Identity(Passport).name2
			vRP.Query("fines/Add", {Passport = Passport, Name = Name,Date = os.date("%d/%m/%Y"),Hour = os.date("%H:%M"),Value = Speed*2,Message = "Multa de Velocidade"}) 
		else
			--TriggerClientEvent("Notify",source,"amarelo","Velocidade Registrada a " .. Speed ..  " Mp/h.",8000,"Radar")
			TriggerClientEvent("chat:ClientMessage",source,false,"Velocidade Registrada a " .. Speed ..  " Mp/h.","Radar")
		end
	end
end)
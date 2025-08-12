-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Warehouses"] = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WAREHOUSE:TRANSFER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("warehouse:Transfer")
AddEventHandler("warehouse:Transfer",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Warehouse = vRP.Query("warehouse/Informations",{ Number = Number })
		if Warehouse[1] and Warehouse[1]["Passport"] == Passport then
			local Keyboard = vKEYBOARD.Primary(source,"Passaporte")
			if Keyboard and vRP.Request(source,"Armazém","Deseja transferir o <b>Armazém</b> para o passaporte <b>"..Keyboard[1].."</b>?") then
				vRP.Query("warehouse/Transfer",{ Passport = Keyboard[1], Number = Number })
				TriggerClientEvent("Notify",source,"verde","Armazém transferido.",5000,"Sucesso")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WAREHOUSE:PASSWORD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("warehouse:Password")
AddEventHandler("warehouse:Password",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Warehouse = vRP.Query("warehouse/Informations",{ Number = Number })
		if Warehouse[1] and Warehouse[1]["Passport"] == Passport then
			local Keyboard = vKEYBOARD.Password(source,"Nova Senha")
			if Keyboard then
				local Password = sanitizeString(Keyboard[1],"0123456789",true)
				if string.len(Password) >= 4 and string.len(Password) <= 20 then
					vRP.Query("warehouse/Password",{ Number = Number, Password = Password })
					TriggerClientEvent("Notify",source,"verde","Senha atualizada.",5000,"Sucesso")
				else
					TriggerClientEvent("Notify",source,"amarelo","Necessário possuir entre <b>4</b> e <b>20</b> números.",5000,"Aviso")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Warehouses = {}
	local Consult = vRP.Query("warehouse/All")
	for _,v in pairs(Consult) do
		local Number = v["Number"]
		if (v["Tax"] + 604800) <= os.time() then
			vRP.Query("warehouse/Sell",{ Number = Number })
			vRP.Query("entitydata/RemoveData",{ Number = "Warehouse:"..Number })
		else
			Warehouses[Number] = true
		end
	end
	GlobalState:set("Warehouses",Warehouses,true)
end)
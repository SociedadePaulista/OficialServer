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
Tunnel.bindInterface("inspect",Creative)
vCLIENT = Tunnel.getInterface("inspect")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
local Players = {}
local Sourcers = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:INSPECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("police:Inspect")
AddEventHandler("police:Inspect",function(OtherSource)
	local source = source
	local Passport = vRP.Passport(source)
	local OtherPassport = vRP.Passport(OtherSource)
	if Passport then
		if not Players[OtherPassport] and DoesPlayerExist(OtherSource) then
			Sourcers[Passport] = OtherSource
			Players[Passport] = OtherPassport
			TriggerEvent("inventory:ServerCarry",source,Passport,OtherSource,true)
			TriggerClientEvent("inventory:Close",OtherSource)
			TriggerClientEvent("inspect:Open",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Request()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Inventory = {}
		local Inv = vRP.Inventory(Passport)
		for Index,v in pairs(Inv) do
			if (parseInt(v["amount"]) <= 0 or not itemBody(v["item"])) then
				vRP.RemoveItem(Passport,v["item"],parseInt(v["amount"]),false)
			else
				
				v["amount"] = parseInt(v["amount"])
				v["peso"] = itemWeight(v["item"])
				v["stack"] = itemStack(v["item"])
				v["index"] = itemIndex(v["item"])
				v["name"] = itemName(v["item"])
				v["key"] = v["item"]
				v["slot"] = Index
				v["desc"] = "<item>"..v["name"].."</item>"


				if itemChest(v["item"]) and v["data"] then
					for Slot,Value in pairs(v["data"]) do
						v["peso"] = v["peso"] + (itemWeight(Value["item"]) * parseInt(Value["amount"]))
					end
				end

				local Split = splitString(v["item"])
				local Description = itemDescription(v["item"])
				if Description then
					v["desc"] = v["desc"].."<br><description>"..Description.."</description>"				
				end
	
				if Split[1] == "identity" or Split[1] == "fidentity" or string.sub(v["item"],1,5) == "badge" then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					if Split[1] == "fidentity" then
						Identity = vRP.FalseIdentity(Number)
					end
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
				elseif Split[1] == "vehkey" then
					v["desc"] = v["desc"].."<br><legenda>Placa do Veículo: <r>"..(Split[2]).."</r></legenda>"
				elseif Split[1] == "homekey" then
					v["desc"] = v["desc"].."<br><legenda>Numeração: <r>"..(Split[3]).."</r></legenda>"
				elseif Split[1] == "creditcard" then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
				elseif Split[1] == "debitcard"  then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
				elseif Split[1] == "driverlicense" then
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..json.decode(Split[3])["name"].."</r> <br>Emissão: <r>"..os.date("%d/%m/%Y", json.decode(Split[3])["issued"]).."</r><br>Validity: <r>"..os.date("%d/%m/%Y", json.decode(Split[3])["expiration"]).."</r><br>Categoria: <r>"..string.gsub(json.encode(json.decode(Split[3])["categories"]), '[^%a,]', '').."</r></legenda>"
				elseif Split[1] == "dmvdocs" then
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..vRP.Identity(parseInt(Split[2]))["name"].." "..vRP.Identity(parseInt(Split[2]))["name2"].."</r> <br>Prática: <r>"..string.gsub(Split[5], '[^%a,]', '').."</r><br>Teórica: <r>"..string.gsub(Split[4], '[^%a,]', '').."</r><br>Categoria: <r>"..string.gsub(Split[3], '[^%a,]', '').."</r></legenda>"
				elseif Split[3] and itemType(v["item"]) == "Armamento" then
					v["desc"] = v["desc"].."<br><legenda>Número de série: <r>"..Split[3].."</r></legenda>"
				end

				if Split[2] then
					if itemCharges(v["item"]) then
						v["charges"] = parseInt(Split[2] * 33)
					end
					if itemDurability(v["item"]) then
						v["durability"] = parseInt(os.time() - Split[2])
						v["days"] = itemDurability(v["item"])
					end
				end

				Inventory[Index] = v
			end
		end

		local OtherInventory = {}
		local Inv = vRP.Inventory(Players[Passport])
		for Index,v in pairs(Inv) do
			if (parseInt(v["amount"]) <= 0 or not itemBody(v["item"])) then
				vRP.RemoveItem(Passport,v["item"],parseInt(v["amount"]),false)
			else
				
				v["amount"] = parseInt(v["amount"])
				v["peso"] = itemWeight(v["item"])
				v["stack"] = itemStack(v["item"])
				v["index"] = itemIndex(v["item"])
				v["name"] = itemName(v["item"])
				v["key"] = v["item"]
				v["slot"] = Index
				v["desc"] = "<item>"..v["name"].."</item>"


				if itemChest(v["item"]) and v["data"] then
					for Slot,Value in pairs(v["data"]) do
						v["peso"] = v["peso"] + (itemWeight(Value["item"]) * parseInt(Value["amount"]))
					end
				end

				local Split = splitString(v["item"])
				local Description = itemDescription(v["item"])
				if Description then
					v["desc"] = v["desc"].."<br><description>"..Description.."</description>"				
				end
	
				if Split[1] == "identity" or Split[1] == "fidentity" or string.sub(v["item"],1,5) == "badge" then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					if Split[1] == "fidentity" then
						Identity = vRP.FalseIdentity(Number)
					end
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
				elseif Split[1] == "vehkey" then
					v["desc"] = v["desc"].."<br><legenda>Placa do Veículo: <r>"..(Split[2]).."</r></legenda>"
				elseif Split[1] == "homekey" then
					v["desc"] = v["desc"].."<br><legenda>Numeração: <r>"..(Split[3]).."</r></legenda>"
				elseif Split[1] == "creditcard" then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
				elseif Split[1] == "debitcard"  then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
				elseif Split[1] == "driverlicense" then
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..json.decode(Split[3])["name"].."</r> <br>Emissão: <r>"..os.date("%d/%m/%Y", json.decode(Split[3])["issued"]).."</r><br>Validity: <r>"..os.date("%d/%m/%Y", json.decode(Split[3])["expiration"]).."</r><br>Categoria: <r>"..string.gsub(json.encode(json.decode(Split[3])["categories"]), '[^%a,]', '').."</r></legenda>"
				elseif Split[1] == "dmvdocs" then
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..vRP.Identity(parseInt(Split[2]))["name"].." "..vRP.Identity(parseInt(Split[2]))["name2"].."</r> <br>Prática: <r>"..string.gsub(Split[5], '[^%a,]', '').."</r><br>Teórica: <r>"..string.gsub(Split[4], '[^%a,]', '').."</r><br>Categoria: <r>"..string.gsub(Split[3], '[^%a,]', '').."</r></legenda>"
				elseif Split[3] and itemType(v["item"]) == "Armamento" then
					v["desc"] = v["desc"].."<br><legenda>Número de série: <r>"..Split[3].."</r></legenda>"
				end

				if Split[2] then
					if itemCharges(v["item"]) then
						v["charges"] = parseInt(Split[2] * 33)
					end
					if itemDurability(v["item"]) then
						v["durability"] = parseInt(os.time() - Split[2])
						v["days"] = itemDurability(v["item"])
					end
				end

				OtherInventory[Index] = v
			end
		end
		return Inventory,OtherInventory,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),vRP.InventoryWeight(Players[Passport]),vRP.GetWeight(Players[Passport])
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESET
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Reset()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Sourcers[Passport] then
			if DoesPlayerExist(Sourcers[Passport]) then
				TriggerEvent("inventory:ServerCarry",source,Passport,Sourcers[Passport])
			end
			Sourcers[Passport] = nil
		end
		if Players[Passport] then
			Players[Passport] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Store(Item,Slot,Target,Amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Active[Passport] and Sourcers[Passport] then
			Active[Passport] = true
			if DoesPlayerExist(Sourcers[Passport]) then
				if vRP.MaxItens(Players[Passport],Item,Amount) then
					TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",5000,"Aviso")
					TriggerClientEvent("inspect:Update",source,"Request")
				else
					vRP.StoreInspect(Passport, Players[Passport], Amount, Slot, Target)
				end
			end
			Active[Passport] = false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Take(Item,Slot,Target,Amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Active[Passport] and Sourcers[Passport] then
			Active[Passport] = true
			if DoesPlayerExist(Sourcers[Passport]) then
				if vRP.MaxItens(Passport,Item,Amount) then
					TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",5000,"Aviso")
					TriggerClientEvent("inspect:Update",source,"Request")
				else
					vRP.TakeInspect(Passport, Players[Passport], Amount, Slot, Target)
				end
			end
			Active[Passport] = false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Slot, Target, Amount)
	local source = source
	local Passport = vRP.Passport(source)
	if not Active[Passport] and Passport then
		Active[Passport] = true
		if DoesPlayerExist(Sourcers[Passport]) then
			vRP.UpdateInspect(Players[Passport], Slot, Target, Amount)
		end
		Active[Passport] = false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Active[Passport] then
		Active[Passport] = nil
	end
end)
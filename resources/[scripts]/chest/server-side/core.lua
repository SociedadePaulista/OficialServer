-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("chest",Creative)
vTASKBAR = Tunnel.getInterface("taskbar")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Open = {}
local Active = {}
local Cooldown = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
local Objects = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTITENS
-----------------------------------------------------------------------------------------------------------------------------------------
local ChestItens = {
	["wallet"] = {
		["Slots"] = 3,
	},
	["ciggypack"] = {
		["Slots"] = 1,
	},
	["ollyrancherbag"] = {
		["Slots"] = 1,
	},
	["suitcase"] = {
		["Slots"] = 5,
	},
	["ammo9box"] = {
		["Slots"] = 1,
	},
	["ammo45box"] = {
		["Slots"] = 1,
	},
	["ammo556box"] = {
		["Slots"] = 1,
	},
	["ammo12box"] = {
		["Slots"] = 1,
	},
	["treasurebox"] = {
		["Slots"] = 20,
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Permissions(Name,Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Mode == "Personal" then
			Open[Passport] = {
				["Name"] = "Personal:"..Passport,
				["Weight"] = 50,
				["Save"] = true,
				["Slots"] = 50
			}
			return true
		elseif Mode == "Evidences" then
			local Keyboard = vKEYBOARD.Primary(source,"Passaporte:")
			if Keyboard then
				Open[Passport] = { 
					["Name"] = "Evidences:"..Keyboard[1], 
					["Weight"] = 50, 
					["Save"] = true,
					["Slots"] = 50
				}
				return true
			end
		elseif Mode == "Tray" then
			Open[Passport] = {
				["Name"] = Name,
				["Weight"] = 25,
				["Slots"] = 20
			}
			return true
		elseif Mode == "Trash" then		

			if vRPC.LastVehicle(source,"trash") or vRPC.LastVehicle(source,"trash2") then
				local Number = parseInt(#Objects+1)
				for Index = 1,#Objects do
					if #(Objects[Index]["Coords"] - Name[4]) <= 0.75 then
						Number = Index
					end
				end
				if not Objects[Number] or os.time() > Objects[Number]["Timer"] then
					Objects[Number] = { ["Coords"] = Name[4], ["Timer"] = os.time() + 1200 }
					local Itens = {
						{ ["Item"] = "dollars", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 50 },
						{ ["Item"] = "metalcan", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "can", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "screen", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "pile", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "battery", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "cellbattery", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "carbattery", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "elastic", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "metalscrap", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "plasticbottle", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
						{ ["Item"] = "WEAPON_BOTTLE", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 50 },
					}
					local Loot = {}
					for Slot = 1, 4 do
						local RandItem = math.random(#Itens)
						if math.random(100) <= Itens[RandItem]["Rand"] then
							Loot[tostring(Slot)] = { item = Itens[RandItem]["Item"], amount = math.random(Itens[RandItem]["Min"], Itens[RandItem]["Max"]) }
						end
					end
					vRP.SetSrvData("Trash:"..Number,Loot,false)	
				end
				Open[Passport] = {
					["Name"] = "Trash:"..Number,
					["Weight"] = 50,
					["Slots"] = 20
				}
				return true
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa utilizar o veículo do <b>Lixeiro</b>.",3000)
			end

		elseif Mode == "Postal" then		

			if vRPC.LastVehicle(source,"boxville2") then
				local Number = parseInt(#Objects+1)
				for Index = 1,#Objects do
					if #(Objects[Index]["Coords"] - Name[4]) <= 0.75 then
						Number = Index
					end
				end
				if not Objects[Number] or os.time() > Objects[Number]["Timer"] then
					Objects[Number] = { ["Coords"] = Name[4], ["Timer"] = os.time() + 1200 }
					local Itens = {
						{ ["Item"] = "postcard", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 25 },
						{ ["Item"] = "postenvelope", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 25 },
						{ ["Item"] = "postbox", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 25 },
					}
					local Loot = {}
					for Slot = 1, 20 do
						local RandItem = math.random(#Itens)
						if math.random(100) <= Itens[RandItem]["Rand"] then
							Loot[tostring(Slot)] = { item = Itens[RandItem]["Item"], amount = math.random(Itens[RandItem]["Min"], Itens[RandItem]["Max"]) }
						end
					end
					vRP.SetSrvData("Postal:"..Number,Loot,false)	
				end
				Open[Passport] = {
					["Name"] = "Postal:"..Number,
					["Weight"] = 50,
					["Slots"] = 20
				}
				return true
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa utilizar o veículo do <b>Correio</b>.",3000)
			end

		elseif Mode == "Safe" then		

			if vRPC.LastVehicle(source,"stockade") then
				local Number = parseInt(#Objects+1)
				for Index = 1,#Objects do
					if #(Objects[Index]["Coords"] - Name[4]) <= 0.75 then
						Number = Index
					end
				end
				if not Objects[Number] or os.time() > Objects[Number]["Timer"] then
					Objects[Number] = { ["Coords"] = Name[4], ["Timer"] = os.time() + 1200 }
					local Itens = {
						{ ["Item"] = "pouch", ["Min"] = 1, ["Max"] = 6, ["Rand"] = 25 },
					}
					local Loot = {}
					for Slot = 1, 20 do
						local RandItem = math.random(#Itens)
						if math.random(100) <= Itens[RandItem]["Rand"] then
							Loot[tostring(Slot)] = { item = Itens[RandItem]["Item"], amount = math.random(Itens[RandItem]["Min"], Itens[RandItem]["Max"]) }
						end
					end
					vRP.SetSrvData("Safe:"..Number,Loot,false)	
				end
				Open[Passport] = {
					["Name"] = "Safe:"..Number,
					["Weight"] = 50,
					["Slots"] = 20
				}
				return true
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa utilizar o veículo do <b>Transportador</b>.",3000)
			end

		elseif Mode == "Custom" then
			if SplitOne(Name,":") == "Helicrash" and Cooldown[Name] and Cooldown[Name] > os.time() then
				TriggerClientEvent("Notify",source,"amarelo","Aguarde até que esfrie o compartimento.",10000,"Aviso")
				return false
			end
			Open[Passport] = {
				["Name"] = Name,
				["Weight"] = 50,
				["Slots"] = 20
			}
			return true
		elseif Mode == "Robbery" then
			vRPC.playAnim(source,false,{"missfbi_s4mop","clean_mop_back_player"},true)
			if vTASKBAR.Task(source,5,10000) then
				vRPC.stopAnim(source)	
				local Number = parseInt(GetPlayerRoutingBucket(source)-100000)
				Open[Passport] = {
					["Name"] = SplitOne(Name,":")..":"..Number,
					["Weight"] = 15,
					["Slots"] = 5
				}
				return true
			else
				vRPC.stopAnim(source)	
			end
		elseif Mode == "Item" then
			local Item = SplitOne(Name,"-")
			if ChestItens[Item] then
				Open[Passport] = {
					["Name"] = "Item:"..Name,
					["Slots"] = ChestItens[Item]["Slots"],
					["Weight"] = vRP.GetWeight(Passport)
				}
				return true
			end
		elseif Mode == "Trunk" then
			Open[Passport] = {
				["Name"] = Mode..":"..SplitOne(Name,":"),
				["Weight"] = VehicleChest(SplitTwo(Name,":")) or 80,
				["Slots"] = VehicleGlobal()[SplitTwo(Name,":")]["Slots"] or 30,
				["Save"] = vRP.PassportPlate(SplitOne(Name,":")),
				["Logs"] = false,
			}
			return true
		elseif Mode == "Glove" then
			Open[Passport] = {
				["Name"] = Mode..":"..SplitOne(Name,":"),
				["Weight"] = 5,
				["Slots"] = 5,
				["Save"] = vRP.PassportPlate(SplitOne(Name,":")),
				["Logs"] = false,
			}
			return true
		elseif Mode == "Vault" then
			local Split = splitString(Name,":")
			local Number = parseInt(GetPlayerRoutingBucket(source)-100000)
			local Consult = vRP.Query("propertys/Exist",{ Number = Number })
			if (Consult[1] and Consult[1]["Passport"] == Passport) or (Consult[1] and vRP.InventoryFull(Passport,"homekey-"..Consult[1]["Keychain"].."-"..Number)) or exports["propertys"]:Lock(Number) then
				Open[Passport] = {
					["Name"] = Mode..":"..Number,
					["Weight"] = exports["propertys"]:Chest(Split[1],tonumber(Split[2]),Mode)["Weight"],
					["Slots"] = exports["propertys"]:Chest(Split[1],tonumber(Split[2]),Mode)["Slots"],
					["Save"] = true,
					["Logs"] = false,
				}
				return true
			end
		elseif Mode == "Fridge" then
			local Split = splitString(Name,":")
			local Number = parseInt(GetPlayerRoutingBucket(source)-100000)
			local Consult = vRP.Query("propertys/Exist",{ Number = Number })
			if (Consult[1] and Consult[1]["Passport"] == Passport) or (Consult[1] and vRP.InventoryFull(Passport,"homekey-"..Consult[1]["Keychain"].."-"..Number)) or exports["propertys"]:Lock(Number) then
				Open[Passport] = {
					["Name"] = Mode..":"..Number,
					["Weight"] = exports["propertys"]:Chest(Split[1],tonumber(Split[2]),Mode)["Weight"],
					["Slots"] = exports["propertys"]:Chest(Split[1],tonumber(Split[2]),Mode)["Slots"],
					["Save"] = true,
					["Logs"] = false,
				}
				return true
			end
		elseif Mode == "Warehouse" then
			local Number = tonumber(Name)
			local Consult = vRP.Query("warehouse/Informations",{ Number = Number })
			if Consult[1] then
				if Consult[1]["Passport"] ~= Passport then
					local Keyboard = vKEYBOARD.Password(source,"Senha")
					if Keyboard then
						local Warehouse = vRP.Query("warehouse/Acess",{ Number = Number, Password = Keyboard[1] })
						if not Warehouse[1] then
							TriggerClientEvent("Notify",source,"vermelho","Senha incorreta.",5000,"Erro") 
							return false
						end
					else
						return false
					end
				end
				if Consult[1]["Tax"] < os.time() then
					if vRP.Request(source,"Armazém","Deseja efetuar o pagamento do aluguel de <b>R$75.000</b>?") then
						if vRP.PaymentFull(Passport,75000) then
							vRP.Query("warehouse/Tax",{ Number = Number })
						else
							return false
						end
					else
						return false
					end
				end
			else
				if vRP.Request(source,"Armazém","Gostaria de comprar o armazém por <b>R$500.000</b> Reais?") then
					local Keyboard = vKEYBOARD.Password(source,"Senha")
					if Keyboard then
						local Password = sanitizeString(Keyboard[1],"0123456789",true)
						if string.len(Password) >= 4 and string.len(Password) <= 20 then
							if vRP.PaymentFull(Passport,500000) then
								local Warehouses = GlobalState["Warehouses"]
								Warehouses[Number] = true
								GlobalState:set("Warehouses",Warehouses,true)
								exports["bank"]:AddTaxs(Passport,"Armazém",500000,"Compra de armazém.")
								vRP.Query("warehouse/Buy",{ Number = Number, Passport = Passport, Password = Password })
								TriggerClientEvent("sounds:Private",source,"cash",0.1)
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Necessário possuir entre <b>4</b> e <b>20</b> números.",5000,"Aviso")
							return false
						end
					else
						return false
					end
				else
					return false
				end
			end
			Open[Passport] = { 
				["Name"] = Mode..":"..Name, 
				["Weight"] = 150, 
				["Slots"] = 50, 
				["Save"] = true, 
				["Logs"] = false 
			} 
			return true
		else
			local Consult = vRP.Query("chests/GetChests",{ Name = Name })
			if not Consult[1] then
				vRP.Query("chests/AddChests",{ Name = Name })
				Consult = vRP.Query("chests/GetChests",{ Name = Name })
			end
			local Split = splitString(Consult[1]["Permission"])
			if Consult[1] and vRP.HasPermission(tostring(Passport), Split[1], Split[2]) and vRP.HasService(Passport,Split[1]) then
				Open[Passport] = {
					["Slots"] = Consult[1]["Slots"],
					["Weight"] = Consult[1]["Weight"],
					["NameLogs"] = Name,
					["Name"] = "Chest:"..Name,
					["Logs"] = Consult[1]["Logs"],
					["Permission"] = Consult[1]["Permission"],
					["Save"] = true
				}
				return true
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Chest()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Open[Passport] then

		local Chest = {}
		local Inventory = {}
		local Inv = vRP.Inventory(Passport)
		local Identity = vRP.Identity(Passport)
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
				elseif Split[1] == "receipt" then
					v["desc"] = v["desc"].."<br><legenda>Data: <r>"..os.date("%Y-%m-%d %H:%M:%S", Split[3]).."</r> <br>Nome: <r>"..vRP.Identity(parseInt(Split[2]))["name"].." "..vRP.Identity(parseInt(Split[2]))["name2"].."</r><br>Valor: <r>"..parseFormat(Split[4]).."</r><br>Descrição: <r>"..Split[5].."</r></legenda>"
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

		local Result = (SplitOne(Open[Passport]["Name"],":") == "Item") and (vRP.GetItemData(Passport, SplitTwo(Open[Passport]["Name"],":")) or {}) or vRP.GetSrvData(Open[Passport]["Name"],Open[Passport]["Save"])
		for Index,v in pairs(Result) do
			v["amount"] = parseInt(v["amount"])
			v["stack"] = itemStack(v["item"])
			v["peso"] = itemWeight(v["item"])
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

			Chest[Index] = v
		end

		return Inventory,Chest,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),(SplitOne(Open[Passport]["Name"],":") == "Item") and vRP.InventoryWeight(Passport) or vRP.ChestWeight(Result),Open[Passport]["Weight"],Open[Passport]["Slots"]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Store(Item,Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if not Active[Passport] and Passport and Open[Passport] then
		Active[Passport] = true
		if not itemBlock(Item) then
			if SplitOne(Open[Passport]["Name"],":") == "Item" then
				vRP.StoreBag(Passport, SplitTwo(Open[Passport]["Name"],":"), Amount, Slot, Target)
			else
				vRP.StoreChest(Passport, Open[Passport]["Name"], Amount, Slot, Target, Open[Passport]["Weight"], Open[Passport]["Logs"])
			end
		end
		Active[Passport] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Take(Item,Slot,Amount,Target)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if not Active[Passport] and Passport and Open[Passport] then
		Active[Passport] = true
		if SplitOne(Open[Passport]["Name"],":") == "Item" then
			if vRP.TakeBag(Passport, SplitTwo(Open[Passport]["Name"],":"), Amount, Slot, Target) then
				TriggerClientEvent("chest:Update",source,"Refresh")
			end
		else
			vRP.TakeChest(Passport, Open[Passport]["Name"], Amount, Slot, Target, Open[Passport]["Weight"], Open[Passport]["Logs"])
		end
		Active[Passport] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Slot,Target,Amount)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if not Active[Passport] and Passport and Open[Passport] then
		Active[Passport] = true
		if SplitOne(Open[Passport]["Name"],":") == "Item" then
			vRP.UpdateBag(Passport, SplitTwo(Open[Passport]["Name"],":"), Slot, Target, Amount)
		else
			vRP.UpdateChest(Passport, Open[Passport]["Name"], Slot, Target, Amount)
		end
		Active[Passport] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:COOLDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("chest:Cooldown")
AddEventHandler("chest:Cooldown",function(Name)
	Cooldown[Name] = os.time() + math.random(600,1200)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Open[Passport] then
		Open[Passport] = nil
	end
	if Active[Passport] then
		Active[Passport] = nil
	end
end)
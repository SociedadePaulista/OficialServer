-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("propertys",Creative)
vKEYBOARD = Tunnel.getInterface("keyboard")
vSKINSHOP = Tunnel.getInterface("nation_skinshop")
vTASKBAR = Tunnel.getInterface("taskbar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Lock = {}
local Actived = {}
local Robbery = {}
GlobalState["Markers"] = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Enter")
AddEventHandler("propertys:Enter",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Actived[Passport] then
		Actived[Passport] = true
		local Identity = vRP.Identity(Passport)
		local Consult = vRP.Query("propertys/Exist",{ Number = Number })
		if Consult[1] then
			local Coords = Interiors[Propertys[Number].Interior][Consult[1].Interior]["Exit"]
			if Consult[1]["Passport"] == Passport or vRP.InventoryFull(Passport,"homekey-"..Consult[1]["Keychain"].."-"..Number) or Lock[Number] then
				if os.time() > Consult[1]["Tax"] then
					TriggerClientEvent("Notify",source,"amarelo","Taxas vencem em <b>"..parseInt(((Consult[1]["Tax"] + 604800 - os.time()) / (60 * 60 * 24))).."</b> dias.<br>Evite o leilão da propriedade.<br>Efetue o pagamento na prefeitura.",3000,"Atenção")
				end
				vRPC.createObjects(source,"anim@heists@keycard@","exit","h4_prop_h4_key_desk_01",48,57005, 0.15, 0.05, -0.01, 30.0, 60.0, -90.0)
				Wait(400)
				vRPC.removeObjects(source)
				TriggerClientEvent("sounds:Private",source,"enterhouse",0.25)
				TriggerEvent("vRP:BucketServer",source,"Enter",parseInt(100000+Number))
				SetEntityCoords(GetPlayerPed(source),Coords["x"],Coords["y"],Coords["z"]-1.0,false,false,false,false)
			else
				
				TriggerClientEvent("sounds:Private",source,"knock_door",0.5)
				Wait(500)
				vRPC.playAnim(source,false,{"amb@world_human_hammering@male@base","base"},false)
				Wait(1300)
				vRPC.stopAnim(source)

				local Knocks = {}
				local List = vRP.Players()
				for Passaports,Sources in pairs(List) do
					async(function()
						if GetPlayerRoutingBucket(Sources) == parseInt(100000+Number) then
							TriggerClientEvent("sounds:Private",Sources,"knock_door",0.7)
							if Consult[1]["Passport"] == Passaports or vRP.InventoryFull(Passaports,"homekey-"..Consult[1]["Keychain"].."-"..Number) then
								Knocks[#Knocks+1] = Sources
							end
						end
					end)
				end
				if Knocks[1] then
					for Index = 1,#Knocks do
						if vRP.Request(Knocks[Index],"Propriedades","<b>"..Identity.name.." "..Identity.name2.."</b> eesta batendo na porta.\nDeseja permitir a entrada do mesmo?") then
							TriggerClientEvent("sounds:Private",source,"enterhouse",0.25)
							TriggerEvent("vRP:BucketServer",source,"Enter",parseInt(100000+Number))
							SetEntityCoords(GetPlayerPed(source),Coords["x"],Coords["y"],Coords["z"]-1.0,false,false,false,false) break
						end
					end
				end
			end
		else
			if Propertys[Number]["Price"] then
				if vRP.Request(source,"Propriedades","Deseja efetuar a compra desta residência por <b>R$"..parseFormat(Propertys[Number]["Price"]).."</b> reais?") then
					if vRP.PaymentFull(Passport,Propertys[Number]["Price"],"Propriedades") then
						
						local Key = vRP.GenerateString("DDDDDD")
						repeat
							Key = vRP.GenerateString("DDDDDD") 
						until not vRP.Query("propertys/Key",{ Key = Key })[1]
	
						local Markers = GlobalState["Markers"]
						Markers[Number] = Passport
	
						GlobalState:set("Markers",Markers,true)
						vRP.GiveItem(Passport,"homekey-"..Key.."-"..Number,2,true)
						exports["bank"]:AddTaxs(Passport,"Propriedades",Propertys[Number]["Price"],"Compra de propriedade.")
						vRP.Query("propertys/Buy",{ Number = Number, Passport = Passport, Interior = 1, Key = parseInt(Key), Tax = os.time() + 2592000 })
						TriggerClientEvent("Notify",source,"verde","A residência foi comprada com sucesso.",5000,"Propriedades")
						TriggerEvent("Discord","BuyProperty","**Passaporte:** "..Passport.."\n**Propriedade:** "..Number.."\n**Reais:** "..Propertys[Number]["Price"],3553599)
					end
				end
			else
				if vRP.Request(source,"Propriedades","Deseja efetuar a compra desta residência por <b>"..parseFormat(Propertys[Number]["Gemstone"]).."</b> Gemas?") then
					if vRP.PaymentGems(Passport,Propertys[Number]["Gemstone"]) then
						
						local Key = vRP.GenerateString("DDDDDD")
						repeat
							Key = vRP.GenerateString("DDDDDD") 
						until not vRP.Query("propertys/Key",{ Key = Key })[1]
	
						local Markers = GlobalState["Markers"]
						Markers[Number] = Passport
	
						GlobalState:set("Markers",Markers,true)
						vRP.GiveItem(Passport,"homekey-"..Key.."-"..Number,2,true)
						vRP.Query("propertys/Buy",{ Number = Number, Passport = Passport, Interior = 1, Key = parseInt(Key), Tax = os.time() + 2592000 })
						TriggerClientEvent("Notify",source,"verde","A residência foi comprada com sucesso.",5000,"Propriedades")
						TriggerEvent("Discord","BuyProperty","**Passaporte:** "..Passport.."\n**Propriedade:** "..Number.."\n**Gemas:** "..Propertys[Number]["Gemstone"],3553599)
					end
				end
			end
		end
		Actived[Passport] = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Exit")
AddEventHandler("propertys:Exit",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Actived[Passport] then
		Actived[Passport] = true
		local Number = parseInt(GetPlayerRoutingBucket(source)-100000)
		if Propertys[Number] then
			vRPC.createObjects(source,"anim@heists@keycard@","exit","h4_prop_h4_key_desk_01",48,57005, 0.15, 0.05, -0.01, 30.0, 60.0, -90.0)
			Wait(400)
			vRPC.removeObjects(source)
			TriggerClientEvent("sounds:Private",source,"outhouse",0.5)
			TriggerEvent("vRP:BucketServer",source,"Exit")
			SetEntityCoords(GetPlayerPed(source),Propertys[Number]["Coords"]["x"],Propertys[Number]["Coords"]["y"],Propertys[Number]["Coords"]["z"]-1,false,false,false,false)
		end
		Actived[Passport] = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCK
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Lock",function(Number)
	return Lock[Number]
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:LOCK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Lock")
AddEventHandler("propertys:Lock",function(source,Number)
	if Lock[Number] then
		Lock[Number] = nil
		TriggerClientEvent("sounds:Private",source,"houses_door_lock",0.7)
		TriggerClientEvent("Notify",source,"verde","Propriedade trancada.",5000)
	else
		Lock[Number] = true
		TriggerClientEvent("sounds:Private",source,"houses_door_unlock",0.7)
		TriggerClientEvent("Notify",source,"vermelho","Propriedade destrancada.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:SELL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Sell")
AddEventHandler("propertys:Sell",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Actived[Passport] then
		Actived[Passport] = true
		local Number = parseInt(Number)
		local Consult = vRP.Query("propertys/Exist",{ Number = Number })
		if Consult[1] and Consult[1]["Passport"] == Passport then
			TriggerClientEvent("dynamic:closeSystem",source)
			if Propertys[Number]["Price"] then
				local Price = Propertys[Number]["Price"] * 0.75
				if vRP.Request(source,"Propriedades","Vender por <b>R$"..parseFormat(Price).."</b> reais?") then
					if GlobalState["Markers"][Number] then
						local Markers = GlobalState["Markers"]
						Markers[Number] = nil
						GlobalState:set("Markers",Markers,true)
					end
					vRP.GiveBank(Passport,Price)
					vRP.Query("propertys/Sell",{ Number = Number })
					TriggerClientEvent("Notify",source,"verde","Venda concluída.",5000,"Propriedades")
					TriggerEvent("Discord","SellProperty","**Passaporte:** "..Passport.."\n**Propriedade:** "..Number.."\n**Reais:** "..Propertys[Number]["Price"],3553599)
				end
			else
				-- local Gemstone = Propertys[Number]["Gemstone"] * 0.75
				-- if vRP.Request(source,"Propriedades","Vender por <b>"..parseFormat(Gemstone).."</b> gemas?") then
				-- 	if GlobalState["Markers"][Number] then
				-- 		local Markers = GlobalState["Markers"]
				-- 		Markers[Number] = nil
				-- 		GlobalState:set("Markers",Markers,true)
				-- 	end
				-- 	vRP.UpgradeGemstone(Passport,Gemstone)
				-- 	vRP.Query("propertys/Sell",{ Number = Number })
				-- 	TriggerClientEvent("Notify",source,"verde","Venda concluída.",5000,"Propriedades")
				-- end
			end
		end
		Actived[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:TRANSFER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Transfer")
AddEventHandler("propertys:Transfer",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Actived[Passport] then
		TriggerClientEvent("dynamic:closeSystem",source)
		Actived[Passport] = true
		local Number = tonumber(Number)
		if Propertys[Number]["Price"] then
			local Price = Propertys[Number]["Price"] * 0.001
			if vRP.Request(source,"Propriedades","Taxa transferência, deseja pagar por <b>R$"..parseFormat(Price).."</b> reais?") and vRP.PaymentFull(Passport,Price,"Taxa transferência de propriedades") then
				local Consult = vRP.Query("propertys/Exist",{ Number = Number })
				if Consult[1] and Consult[1]["Passport"] == Passport then
					local Keyboard = vKEYBOARD.Primary(source,"Passaporte")
					if Keyboard and vRP.Identity(Keyboard[1]) and vRP.Request(source,"Propriedades","Deseja trasnferir a propriedade para passaporte <b>"..Keyboard[1].."</b>?") then
						vRP.Query("propertys/Transfer",{ Number = Number, Passport = Keyboard[1] })
						TriggerClientEvent("Notify",source,"verde","Transferência concluída.",5000,"Propriedades")
						TriggerEvent("Discord","TransferProperty","**Passaporte:** "..Passport.."\n**Propriedade:** "..Number.."\n**Para:** "..Keyboard[1],3553599)
					end
				end
			end
		else
			-- local Gemstone = Propertys[Number]["Gemstone"] * 0.001
			-- if vRP.Request(source,"Propriedades","Taxa transferência, deseja pagar por <b>"..parseFormat(Gemstone).."</b> gemas?") and vRP.PaymentGems(Passport,Gemstone) then
			-- 	local Consult = vRP.Query("propertys/Exist",{ Number = Number })
			-- 	if Consult[1] and Consult[1]["Passport"] == Passport then
			-- 		local Keyboard = vKEYBOARD.Primary(source,"Passaporte")
			-- 		if Keyboard and vRP.Identity(Keyboard[1]) and vRP.Request(source,"Propriedades","Deseja trasnferir a propriedade para passaporte <b>"..Keyboard[1].."</b>?") then
			-- 			vRP.Query("propertys/Transfer",{ Number = Number, Passport = Keyboard[1] })
			-- 			TriggerClientEvent("Notify",source,"verde","Transferência concluída.",5000,"Propriedades")
			-- 		end
			-- 	end
			-- end
		end
		Actived[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:TAX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Tax")
AddEventHandler("propertys:Tax",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Actived[Passport] then
		Actived[Passport] = true
		local Number = tonumber(Number)
		if Propertys[Number]["Price"] then
			local Price = Propertys[Number]["Price"] * 0.15
			if vRP.Request(source,"Propriedades","Taxa atrasada, deseja pagar por <b>R$"..parseFormat(Price).."</b> reais?") and vRP.PaymentFull(Passport,Price,(Road.." Nº"..Number)) then
				vRP.Query("propertys/Tax",{ Number = Number })
				TriggerClientEvent("Notify",source,"verde","Pagamento concluído.",5000,"Propriedades")
				TriggerEvent("Discord","TaxProperty","**Passaporte:** "..Passport.."\n**Propriedade:** "..Number.."\n**Reais:** "..Price,3553599)
			end
		else
			local Price = (Propertys[Number]["Gemstone"] * 5000) * 0.15
			if vRP.Request(source,"Propriedades","Taxa atrasada, deseja pagar por <b>R$"..parseFormat(Price).."</b> reais?") and vRP.PaymentFull(Passport,Price,(Road.." Nº"..Number)) then
				vRP.Query("propertys/Tax",{ Number = Number })
				TriggerClientEvent("Notify",source,"verde","Pagamento concluído.",5000,"Propriedades")
				TriggerEvent("Discord","TaxProperty","**Passaporte:** "..Passport.."\n**Propriedade:** "..Number.."\n**Reais:** "..Price,3553599)
			end
			--[[ local Gemstone = Propertys[Number]["Gemstone"] * 0.15
			if vRP.Request(source,"Propriedades","Taxa atrasada, deseja pagar por <b>"..parseFormat(Gemstone).."</b> gemas?") and vRP.PaymentGems(Passport,Gemstone) then
				vRP.Query("propertys/Tax",{ Number = Number })
				TriggerClientEvent("Notify",source,"verde","Pagamento concluído.",5000,"Propriedades")
			end ]]
		end
		Actived[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Clothes()
	local Clothes = {}
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Consult = vRP.GetSrvData("Wardrobe:"..Passport)
		for Table,_ in pairs(Consult) do
			Clothes[#Clothes + 1] = Table
		end
	end
	return Clothes
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:CLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Clothes")
AddEventHandler("propertys:Clothes",function(Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Consult = vRP.GetSrvData("Wardrobe:"..Passport)
		local Split = splitString(Mode)
		local Name = Split[2]
		if Split[1] == "save" then
			TriggerClientEvent("dynamic:closeSystem",source)
			local Keyboard = vKEYBOARD.Primary(source,"Nome")
			if Keyboard then
				local Check = sanitizeString(Keyboard[1],"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",true)
				if not Consult[Check] then
					Consult[Check] = vSKINSHOP.getCloths(source)
					vRP.SetSrvData("Wardrobe:"..Passport,Consult,true)
					TriggerClientEvent("propertys:Clothes",source)
					TriggerClientEvent("Notify",source,"verde","<b>"..Check.."</b> adicionado.",5000,"Armário")
				else
					TriggerClientEvent("Notify",source,"amarelo","Nome escolhido já existe em seu armário.",5000,"Propriedades")
				end
			end
		elseif Split[1] == "delete" then
			TriggerClientEvent("dynamic:closeSystem",source)
			if Consult[Name] then
				Consult[Name] = nil
				vRP.SetSrvData("Wardrobe:"..Passport,Consult,true)
				TriggerClientEvent("propertys:Clothes",source)
				TriggerClientEvent("Notify",source,"verde","<b>"..Name.."</b> removido.",5000,"Armário")
			else
				TriggerClientEvent("Notify",source,"amarelo","A vestimenta salva não se encontra mais em seu armário.",5000,"Propriedades")
			end
		elseif Split[1] == "apply" then
			if Consult[Name] then
				TriggerClientEvent("skinshop:Apply",source,Consult[Name])
				TriggerClientEvent("Notify",source,"verde","<b>"..Name.."</b> aplicado.",5000,"Armário")
			else
				TriggerClientEvent("Notify",source,"amarelo","A vestimenta salva não se encontra mais em seu armário.",5000,"Propriedades")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport,source)
	local Number = parseInt(GetPlayerRoutingBucket(source)-100000)
	if Propertys[Number] then
		Actived[Passport] = nil
		vRP.InsidePropertys(Passport,Propertys[Number]["Coords"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Markers = {}
	local Consult = vRP.Query("propertys/All")
	for _,v in pairs(Consult) do
		if (v["Tax"]+604800) <= os.time() then
			if vRP.HasGroup(v["Passport"],"Premium") then
				vRP.Query("propertys/Tax",{ Number = v["Number"] })
			end
		else
			if Propertys[v["Number"]] then
				Markers[v["Number"]] = v["Passport"]
			end
		end
	end
	GlobalState:set("Markers",Markers,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("CharacterChosen",function(Passport,source)
	local Consult = vRP.Query("propertys/AllUser",{ Passport = Passport })
	if Consult[1] then
		local Tables = {}
		for _,v in pairs(Consult) do
			if Propertys[v["Number"]] then
				Tables[#Tables + 1] = { ["Coords"] = Propertys[v["Number"]]["Coords"]["xyz"] }
			end
		end
		TriggerClientEvent("spawn:Increment",source,Tables)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Propertys()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
		local Consult = vRP.Query("propertys/AllUser",{ Passport = Passport })
		for Index in pairs(Consult) do
			Consult[Index]["Tax"] = os.time() > Consult[Index]["Tax"]
		end
		return Consult
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Realty")
AddEventHandler("propertys:Realty",function(Full)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerClientEvent("dynamic:closeSystem",source)
		local Split = splitString(Full,"-")
		if Propertys[tonumber(Split[1])]["Price"] then
			local Price = parseInt(parseInt(Propertys[tonumber(Split[1])]["Price"]/#Interiors[Propertys[tonumber(SplitOne(Full))].Interior])*tonumber(SplitTwo(Full))/1.421)
			if vRP.Request(source,"Propriedades","Deseja reformr para interior nível <b>"..Split[2].."</b><br> a <b>"..Split[3].." Nº"..Split[1].."</b><br> por <b>R$"..parseFormat(parseInt(Price)).."</b> reais?") then
				if vRP.PaymentFull(Passport,parseInt(Price),"Reformar da Casa") then
					vRP.Query("propertys/Interior",{ Number = tonumber(Split[1]), Interior = tonumber(Split[2]) })
					TriggerClientEvent("sounds:Private",source,"cash",0.1)
					TriggerEvent("Discord","RealtyProperty","**Passaporte:** "..Passport.."\n**Propriedade:** "..Split[1].."\n**Reais:** "..Price,3553599)
				end
			end
		else
			local Gemstone = parseInt(parseInt(Propertys[tonumber(Split[1])]["Gemstone"]/#Interiors[Propertys[tonumber(SplitOne(Full))].Interior])*tonumber(SplitTwo(Full))/1.421)
			if vRP.Request(source,"Propriedades","Deseja reformr para interior nível <b>"..Split[2].."</b><br> a <b>"..Split[3].." Nº"..Split[1].."</b><br> por <b>"..parseFormat(parseInt(Gemstone)).."</b> gemas?") then
				if vRP.PaymentGems(Passport,parseInt(Gemstone)) then
					vRP.Query("propertys/Interior",{ Number = tonumber(Split[1]), Interior = tonumber(Split[2]) })
					TriggerClientEvent("sounds:Private",source,"cash",0.1)
					TriggerEvent("Discord","RealtyProperty","**Passaporte:** "..Passport.."\n**Propriedade:** "..Split[1].."\n**Gemas:** "..Gemstone,3553599)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALITENS
-----------------------------------------------------------------------------------------------------------------------------------------
StealItens = {
	{ ["Item"] = "pendrive", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 150 },
	{ ["Item"] = "slipper", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "soap", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "pliers", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "deck", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "floppy", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "domino", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "brush", ["Min"] = 1, ["Max"] = 4, ["Rand"] = 225 },
	{ ["Item"] = "rimel", ["Min"] = 2, ["Max"] = 4, ["Rand"] = 225 },
	{ ["Item"] = "WEAPON_SHOES", ["Min"] = 2, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "dices", ["Min"] = 2, ["Max"] = 4, ["Rand"] = 225 },
	{ ["Item"] = "spray04", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "spray03", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "spray02", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "spray01", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "bracelet", ["Min"] = 2, ["Max"] = 4, ["Rand"] = 200 },
	{ ["Item"] = "xbox", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 200 },
	{ ["Item"] = "playstation", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 200 },
	{ ["Item"] = "watch", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 200 },
	{ ["Item"] = "goldcoin", ["Min"] = 4, ["Max"] = 6, ["Rand"] = 175 },
	{ ["Item"] = "silvercoin", ["Min"] = 4, ["Max"] = 8, ["Rand"] = 175 },
	{ ["Item"] = "oxy", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 200 },
	{ ["Item"] = "analgesic", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "firecracker", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 200 },
	{ ["Item"] = "pager", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 150 },
	{ ["Item"] = "GADGET_PARACHUTE", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "lockpick-"..os.time(), ["Min"] = 1, ["Max"] = 1, ["Rand"] = 50 },
	{ ["Item"] = "WEAPON_WRENCH", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 125 },
	{ ["Item"] = "WEAPON_POOLCUE", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 125 },
	{ ["Item"] = "WEAPON_BAT", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 125 },
	{ ["Item"] = "card02", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "camera", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "binoculars", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "hennessy", ["Min"] = 1, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "dewars", ["Min"] = 1, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "teddy", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 225 },
	{ ["Item"] = "chocolate", ["Min"] = 1, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "lighter", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 225 },
	{ ["Item"] = "cellphone", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 150 },
	{ ["Item"] = "tyres", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "notepad", ["Min"] = 1, ["Max"] = 5, ["Rand"] = 225 },
	{ ["Item"] = "plate", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "plasticbottle", ["Min"] = 2, ["Max"] = 5, ["Rand"] = 225 },
	{ ["Item"] = "bait", ["Min"] = 1, ["Max"] = 6, ["Rand"] = 225 },
	{ ["Item"] = "WEAPON_SWITCHBLADE", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "card01", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "card02", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "card03", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "card04", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "card05", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("propertys:Lockpick")
AddEventHandler("propertys:Lockpick",function(source,Number,Interior)
	local Passport = vRP.Passport(source)
	if Passport and not Actived[Passport] then
		Actived[Passport] = true
		local Ped = GetPlayerPed(source)
		local Coords = Interiors[Propertys[Number].Interior][Interior]["Exit"]
		if vRP.HasService(Passport,"Policia") then
			vRPC.createObjects(source,"anim@heists@keycard@","exit","h4_prop_h4_key_desk_01",48,57005, 0.15, 0.05, -0.01, 30.0, 60.0, -90.0)
			Wait(400)
			vRPC.removeObjects(source)
			TriggerClientEvent("sounds:Private",source,"enterhouse",0.25)
			TriggerEvent("vRP:BucketServer",source,"Enter",parseInt(100000+Number))
			SetEntityCoords(Ped,Coords["x"],Coords["y"],Coords["z"]-1.0,false,false,false,false)
		else
			if not Robbery[Number] or (os.time() > Robbery[Number]) then
				vRPC.playAnim(source,false,{"missfbi_s4mop","clean_mop_back_player"},true)
				if vTASKBAR.Task(source,10,10000) then
					Robbery[Number] = os.time() + 3600
					for Index in pairs(Interiors[Propertys[Number].Interior][Interior]["Robbery"]) do
						local Loot = {}
						local Rand = math.random(#StealItens)
						Loot["1"] = { item = StealItens[Rand]["Item"], amount = math.random(StealItens[Rand]["Min"],StealItens[Rand]["Max"]) }
						local Rand = math.random(#StealItens)
						Loot["2"] = { item = StealItens[Rand]["Item"], amount = math.random(StealItens[Rand]["Min"],StealItens[Rand]["Max"]) }
						local Rand = math.random(#StealItens)
						Loot["3"] = { item = StealItens[Rand]["Item"], amount = math.random(StealItens[Rand]["Min"],StealItens[Rand]["Max"]) }
						local Rand = math.random(#StealItens)
						Loot["4"] = { item = StealItens[Rand]["Item"], amount = math.random(StealItens[Rand]["Min"],StealItens[Rand]["Max"]) }
						local Rand = math.random(#StealItens)
						Loot["5"] = { item = StealItens[Rand]["Item"], amount = math.random(StealItens[Rand]["Min"],StealItens[Rand]["Max"]) }
						vRP.SetSrvData("Robbery"..Index..":"..Number,Loot,false)			
					end
					TriggerClientEvent("sounds:Private",source,"enterhouse",0.25)
					TriggerEvent("vRP:BucketServer",source,"Enter",parseInt(100000+Number))
					SetEntityCoords(Ped,Coords["x"],Coords["y"],Coords["z"]-1.0,false,false,false,false)
					TriggerClientEvent("propertys:Robbery",source,Propertys[Number].Interior,Interior)
				else
					if math.random(1000) >= 900 then
						TriggerEvent("Wanted",source,Passport,300)
						local Service = vRP.NumPermission("Policia")
						for Passports,Sources in pairs(Service) do
							async(function()
								vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
								TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a Propriedade", x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 44 })
							end)
						end
					end
				end
				vRPC.stopAnim(source)		
			else
				vRPC.createObjects(source,"anim@heists@keycard@","exit","h4_prop_h4_key_desk_01",48,57005, 0.15, 0.05, -0.01, 30.0, 60.0, -90.0)
				Wait(400)
				vRPC.removeObjects(source)
				TriggerClientEvent("sounds:Private",source,"enterhouse",0.25)
				TriggerEvent("vRP:BucketServer",source,"Enter",parseInt(100000+Number))
				SetEntityCoords(Ped,Coords["x"],Coords["y"],Coords["z"]-1.0,false,false,false,false)
				TriggerClientEvent("propertys:Robbery",source,Propertys[Number].Interior,Interior)
			end
		end
		Actived[Passport] = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Police()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Number = parseInt(GetPlayerRoutingBucket(source)-100000)
		if Propertys[Number] then
			TriggerEvent("Wanted",source,Passport,300)
			local Service = vRP.NumPermission("Policia")
			for Passports,Sources in pairs(Service) do
				async(function()
					TriggerClientEvent("sounds:Private",Sources,"crime",0.5)
					TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a Propriedade", x = Propertys[Number]["Coords"]["x"], y = Propertys[Number]["Coords"]["y"], z = Propertys[Number]["Coords"]["z"], color = 44 })
				end)
			end
		end
	end
end
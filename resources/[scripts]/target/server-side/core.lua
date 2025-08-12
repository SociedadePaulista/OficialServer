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
Tunnel.bindInterface("target",Creative)
vRPC = Tunnel.getInterface("vRP")
vTASKBAR = Tunnel.getInterface("taskbar")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.ConsultItem(item,amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		return vRP.ConsultItem(Passport,item,amount)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKIN
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckIn()
	local Repose = 900
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Service,Total = vRP.NumPermission("Hospital")
		if Total <= 0 then
			if vRP.GetHealth(source) <= 100 then
				if vRP.InventoryFull(Passport,"medicplan-"..Passport) then
					if vRP.PaymentFull(Passport,485,true) then
						vRP.UpgradeThirst(Passport,15)
						vRP.UpgradeHunger(Passport,15)
						TriggerEvent("Reposed",source,Passport,450)
						TriggerClientEvent("Notify",source,"azul","Boas notícias! O plano de saúde foi utilizado para cobrir partes das despesas.",5000,"Hospital")
						return true
					else
						TriggerClientEvent("Notify","amarelo",source,"<b>Reais</b> insuficientes.",5000,"Aviso")
					end
				else
					if vRP.PaymentFull(Passport,975,true) then
						vRP.UpgradeThirst(Passport,15)
						vRP.UpgradeHunger(Passport,15)
						TriggerEvent("Reposed",source,Passport,900)
						return true
					else
						TriggerClientEvent("Notify","amarelo",source,"<b>Reais</b> insuficientes.",5000,"Aviso")
					end
				end
			else
				if vRP.InventoryFull(Passport,"medicplan-"..Passport) then
					if vRP.Request(source,"Hospital","Prosseguir o tratamento por <b>R$375</b> reais?") then
						if vRP.PaymentFull(Passport,375,true) then
							vRP.UpgradeThirst(Passport,15)
							vRP.UpgradeHunger(Passport,15)
							TriggerEvent("Reposed",source,Passport,450)
							TriggerClientEvent("Notify",source,"azul","Boas notícias! O plano de saúde foi utilizado para cobrir partes das despesas.",5000,"Hospital")
							return true
						else
							TriggerClientEvent("Notify","amarelo",source,"<b>Reais</b> insuficientes.",5000,"Aviso")
						end
					end
				else
					if vRP.Request(source,"Hospital","Prosseguir o tratamento por <b>R$750</b> reais?") then
						if vRP.PaymentFull(Passport,750,true) then
							vRP.UpgradeThirst(Passport,15)
							vRP.UpgradeHunger(Passport,15)
							TriggerEvent("Reposed",source,Passport,900)
							return true
						else
							TriggerClientEvent("Notify","amarelo",source,"<b>Reais</b> insuficientes.",5000,"Aviso")
						end
					end
				end
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Procure um Médico.",5000)
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:MEDICPLAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("target:Medicplan")
AddEventHandler("target:Medicplan",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not vRP.UserMedicPlan(Passport) then
			if vRP.Request(source,"Hospital","Assinar o plano de saúde por <b>R$10.000</b>? Lembrando que a duração do mesmo é de 7 dias.") then
				if vRP.PaymentFull(Passport,10000,"Plano de Saúde") then
					vRP.SetMedicPlan(Passport,parseInt(os.time()+604800))
					vRP.GiveItem(Passport,"medicplan-" .. Passport,1,true)
					TriggerClientEvent("Notify",source,"verde","Obrigado por escolher nosso plano de saúde. Estamos aqui para cuidar de você!",5000,"Hospital")
				end
			end
		else
			if vRP.Request(source,"Hospital","Prezado(a) cliente, está considerando uma segunda via do cartão do plano de saúde? Fico à disposição para ajudar. O custo é de <b>R$1500</b>?") then
				if vRP.PaymentFull(Passport,1500,"Cartão Plano de Saúde") then
					vRP.GiveItem(Passport,"medicplan-" .. Passport,1,true)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:CALLWORKS
-----------------------------------------------------------------------------------------------------------------------------------------
local Calls = {}
RegisterServerEvent("target:CallWorks")
AddEventHandler("target:CallWorks",function(Permission)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasPermission(Passport,Permission) then
			if vRP.HasService(Passport,Permission) then
				if not Calls[Permission] or os.time() >= Calls[Permission] then
					Calls[Permission] = os.time() + 600
					if Permission == "Hospital" then
						TriggerClientEvent("Notify",-1,"amarelo","<b>Pillbox Medical:</b> Estamos em busca de doadores de sangue, seja solidário e ajude o próximo, procure um de nossos profissionais.",15000)
					else
						TriggerClientEvent("Notify",-1,"amarelo","<b>"..Permission..":</b> Estamos em busca de trabalhadores, compareça ao estabelecimento, procure um de nossos funcionários e consulte nosso serviço de entregas.",15000)
					end
				else
					TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..parseInt(Calls[Permission] - os.time()).."</b> segundos.",5000)
				end
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Apenas funcionários podem anunciar.",5000,"Atenção")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:PHONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:callPhone")
AddEventHandler("target:callPhone",function(Entity,Service)
	local source = source
	local Passport = vRP.Passport(source)
	local Identity = vRP.Identity(Passport) 
	local ped = GetPlayerPed(source)
	local coords = GetEntityCoords(ped)
	local Services = vRP.NumPermission(Service)
	for Passports,Sources in pairs(Services) do
		if vRP.HasService(Passports,Service) then
			async(function()
				vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
				TriggerClientEvent("NotifyPush",Sources,{ code = "192", name = Identity["name"].." "..Identity["name2"].."  "..vRP.Identity(Passport).phone, phone = vRP.Identity(Passport).phone, title = "CHAMADO "..Service, x = coords["x"], y = coords["y"], z = coords["z"], criminal = "EMERGENCIA", time = "Recebido às "..os.date("%H:%M"), blipColor = 16 })
			end)
		end
	end
	TriggerClientEvent("Notify",source,"azul","Aguarde...",5000)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("target:newspaper")
AddEventHandler("target:newspaper",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
        if vRP.Request(source,"Jornal","Deseja comprar um Jornal? No valor de <b>R$" .. parseFormat(50) .. "</b> reais.") then
			if vRP.PaymentFull(Passport,50,"Jornal") then
				vRP.GenerateItem(Passport,"newspaper",1,true)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:JOKENPO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("target:Jokenpo")
AddEventHandler("target:Jokenpo",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			if vRP.GetHealth(ClosestPed) > 100 and not Player(ClosestPed)["state"]["Handcuff"] then
				local Identity = vRP.Identity(Passport)
				if vRP.Request(ClosestPed,"Pergunta","Pedido de <b>"..Identity["name"].."</b> para jogar <b>Jokenpô</b>?","Sim, iniciar animação","Não, sai fora") then
					local selectedClosestPed = vRP.Request(ClosestPed,"Pergunta","Pedra?","Sim, iniciar animação","Não, sai fora") and "rock" or vRP.Request(ClosestPed,"Pergunta","Papel?","Sim, iniciar animação","Não, sai fora") and "paper" or vRP.Request(ClosestPed,"Pergunta","Tesoura?","Sim, iniciar animação","Não, sai fora") and "scissors"
					local selectedPlayerPed = vRP.Request(source,"Pergunta","Pedra?","Sim, iniciar animação","Não, sai fora") and "rock" or vRP.Request(source,"Pergunta","Papel?","Sim, iniciar animação","Não, sai fora") and "paper" or vRP.Request(source,"Pergunta","Tesoura?","Sim, iniciar animação","Não, sai fora") and "scissors"
					if selectedClosestPed and selectedPlayerPed then
						local Anims = {
							["rock"] = { "baspel@rock@animation", "rock_clip" },
							["paper"] = { "baspel@paper@animation", "paper_clip" },
							["scissors"] = { "baspel@scissors@animation", "scissors_clip" },
							["win"] = { "anim@amb@nightclub@peds@", "amb_world_human_cheering_female_c" },
							["lose"] = { "oddjobs@towingangryidle_a", "idle_a" },
						}
						TriggerClientEvent("syncAnim",source,1.3)
						vRPC.playAnim(ClosestPed,true,{Anims[selectedClosestPed][1], Anims[selectedClosestPed][2]},false,2.0,2.0,3000,2)
						vRPC.playAnim(source,true,{Anims[selectedPlayerPed][1], Anims[selectedPlayerPed][2]},false,2.0,2.0,3000,2)
						Wait(3200)
						if selectedClosestPed == "rock" and selectedPlayerPed == "paper" then
							vRPC.playAnim(ClosestPed,true,{Anims["lose"][1], Anims["lose"][2]},false,2.0,2.0,3000,2)
							vRPC.playAnim(source,true,{Anims["win"][1], Anims["win"][2]},false,2.0,2.0,3000,2)
						end
						if selectedClosestPed == "paper" and selectedPlayerPed == "rock" then
							vRPC.playAnim(ClosestPed,true,{Anims["win"][1], Anims["win"][2]},false,2.0,2.0,3000,2)
							vRPC.playAnim(source,true,{Anims["lose"][1], Anims["lose"][2]},false,2.0,2.0,3000,2)
						end
						if selectedClosestPed == "scissors" and selectedPlayerPed == "rock" then
							vRPC.playAnim(ClosestPed,true,{Anims["lose"][1], Anims["lose"][2]},false,2.0,2.0,3000,2)
							vRPC.playAnim(source,true,{Anims["win"][1], Anims["win"][2]},false,2.0,2.0,3000,2)
						end
						if selectedClosestPed == "rock" and selectedPlayerPed == "scissors" then
							vRPC.playAnim(ClosestPed,true,{Anims["win"][1], Anims["win"][2]},false,2.0,2.0,3000,2)
							vRPC.playAnim(source,true,{Anims["lose"][1], Anims["lose"][2]},false,2.0,2.0,3000,2)
						end
						if selectedClosestPed == "scissors" and selectedPlayerPed == "paper" then
							vRPC.playAnim(ClosestPed,true,{Anims["win"][1], Anims["win"][2]},false,2.0,2.0,3000,2)
							vRPC.playAnim(source,true,{Anims["lose"][1], Anims["lose"][2]},false,2.0,2.0,3000,2)
						end
						if selectedClosestPed == "paper" and selectedPlayerPed == "scissors" then
							vRPC.playAnim(ClosestPed,true,{Anims["lose"][1], Anims["lose"][2]},false,2.0,2.0,3000,2)
							vRPC.playAnim(source,true,{Anims["win"][1], Anims["win"][2]},false,2.0,2.0,3000,2)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
local Gymnasium = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("target:Gymnasium")
AddEventHandler("target:Gymnasium",function(Value)
	local source = source
	local Ped = GetPlayerPed(source)
	local Passport = vRP.Passport(source)
	if Passport and not Gymnasium["Gymnasium"..Value.Location..":"..Value.Equipment..""..Value.Position] then

		Gymnasium["Gymnasium"..Value.Location..":"..Value.Equipment..""..Value.Position] = { 
			Location = Value.Location, 
			Equipment = Value.Equipment, 
			Position = Value.Position, 
			Passport = Passport 
		}
		GlobalState["Gymnastics"] = { 
			Location = Value.Location, 
			Equipment = Value.Equipment, 
			Position = Value.Position, 
			Available = false 
		}

		vRPC.AnimActive(source)
		FreezeEntityPosition(Ped,true)
		Player(source)["state"]["Buttons"] = true
		Player(source)["state"]["Cancel"] = true

		if Value.Anim[3] ~= "prop_barbell_01" then
			if Value.Anim[1] == "mouse@byc_crunch" and Value.Anim[2] == "byc_crunch_clip" then
				local x = Value.Coords[1] - math.sin(math.rad(Value.Coords[4])) * 0.25
				local y = Value.Coords[2] + math.cos(math.rad(Value.Coords[4])) * 0.25
				SetEntityCoords(Ped,x, y, Value.Coords[3]+0.50, true, true, true, true)		
				SetEntityRotation(Ped,-20.0,0.0,Value.Coords[4])
			elseif Value.Anim[3] == "prop_barbell_100kg" then
				SetEntityHeading(Ped,Value.Coords[4])
				SetEntityCoords(Ped,Value.Coords[1], Value.Coords[2], Value.Coords[3]-0.5, true, true, true, true)		
			elseif Value.Anim[1] == "mouse@situp" and Value.Anim[2] == "situp_clip" then
				SetEntityHeading(Ped,Value.Coords[4])
				SetEntityCoords(Ped,Value.Coords[1], Value.Coords[2], Value.Coords[3]+0.5, true, true, true, true)		
			else
				SetEntityHeading(Ped,Value.Coords[4])
				SetEntityCoords(Ped,Value.Coords[1], Value.Coords[2], Value.Coords[3], true, true, true, true)		
			end
		end

		if Value.Anim[3] then
			vRP.createObjects(source,Value.Anim[1],Value.Anim[2],Value.Anim[3],1,28422)
		else
			vRPC.playAnim(source,false,{Value.Anim[1],Value.Anim[2]},true)
		end

		while vTASKBAR.Task(source,1,10000) do
			TriggerClientEvent("Progress",source,500)
			vRP.SetWeight(Passport,tonumber("0.0"..math.random(1,5)))
			if math.random(100) <= 15 then
				vRP.DowngradeHunger(Passport, 1)
				vRP.DowngradeThirst(Passport, 2)
			end
			Wait(1000)
		end

		Gymnasium["Gymnasium"..Value.Location..":"..Value.Equipment..""..Value.Position] = nil
		GlobalState["Gymnastics"] = { 
			Location = Value.Location, 
			Equipment = Value.Equipment, 
			Position = Value.Position, 
			Available = true 
		}

		vRPC.removeObjects(source)
		FreezeEntityPosition(Ped,false)
		Player(source)["state"]["Buttons"] = false
		Player(source)["state"]["Cancel"] = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	TriggerClientEvent("target:Gymnasium",source,{Gymnasium,vRP.UserData(Passport,"Gym")})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport,source)
	for Key,Value in pairs(Gymnasium) do
		if Value == Passport then
			GlobalState["Gymnastics"] = { 
				Location = Value.Location, 
				Equipment = Value.Equipment, 
				Position = Value.Position, 
				Available = true 
			}
			Gymnasium[Key] = nil
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("target:PaymentGym")
AddEventHandler("target:PaymentGym",function(Location,Price)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Data = vRP.UserData(Passport,"Gymnasium")
		if not Data[tostring(Location)] or (Data[tostring(Location)] <= os.time()) then
			if vRP.HasGroup(Passport,"Premium") or vRP.Request(source,"Academia","Assinar Academia por <b>R$"..parseFormat(Price).."</b>? Lembrando que a duração do mesmo é de 7 dias.") and vRP.PaymentFull(Passport,tonumber(Price),"Academia") then
				Data[tostring(Location)] = os.time() + 604800
				vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Gymnasium", dvalue = json.encode(Data) })
				TriggerClientEvent("Notify",source,"verde","Obrigado por escolher nossa academia.",5000,"Academia") 
				TriggerClientEvent("target:Gymnasium",source,{Gymnasium,Data})
			end
		else
			TriggerClientEvent("target:Gymnasium",source,{Gymnasium,Data})
		end
	end
end)
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
vCLIENT = Tunnel.getInterface("paramedic")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Blood = {}
local Extract = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:REPOSED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Reposed")
AddEventHandler("paramedic:Reposed",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and vRP.GetHealth(entity) > 100 then
		if vRP.HasService(Passport,"Hospital") then
			local Keyboard = vKEYBOARD.Primary(source,"Minutos:")
			if Keyboard then
				if parseInt(Keyboard[1]) > 0 then
					local OtherPassport = vRP.Passport(entity)
					local Identity = vRP.Identity(OtherPassport)
					if Identity then
						if vRP.Request(source,"Adicionar <b>"..Keyboard[1].." minutos</b> de repouso no(a) <b>"..Identity["name"].."</b>?.","Sim, aplicar repouso","Não, mudei de ideia") then
							TriggerClientEvent("Notify",source,"azul","Aplicou <b>"..Keyboard[1].." minutos</b> de repouso.",10000)
							TriggerEvent("Reposed",entity,OtherPassport,parseInt(Keyboard[1] * 60))
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:TREATMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Treatment")
AddEventHandler("paramedic:Treatment",function(Entitys)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and vRP.GetHealth(Entitys) > 100 then
		local OtherPassport = vRP.Passport(Entitys)
		local Identity = vRP.Identity(OtherPassport)
		if Identity then

			TriggerEvent("Reposed",Entitys,OtherPassport,600)
			TriggerClientEvent("target:StartTreatment",Entitys)
			TriggerClientEvent("Notify",source,"verde","Tratamento começou.",5000,"Sucesso")

			--[[ if vRP.TakeItem(Passport,"syringe0"..Identity["Blood"],1) then
				if not Blood[OtherPassport] then
					Blood[OtherPassport] = os.time() + 1800
				end
				TriggerEvent("Reposed",Entitys,OtherPassport,600)
				TriggerClientEvent("target:StartTreatment",Entitys)
				TriggerClientEvent("Notify",source,"verde","Tratamento começou.",5000,"Sucesso")
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("syringe0"..Identity["Blood"]).."</b>.",5000,"Atenção")
			end ]]
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:REVIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Revive")
AddEventHandler("paramedic:Revive",function(Entitys)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(Entitys) <= 100 then
		if vRP.HasService(Passport,"Hospital") then
			Player(source)["state"]["Cancel"] = true
			local OtherPassport = vRP.Passport(Entitys)
			TriggerClientEvent("Progress",source,10000)
			vRPC.playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)
			SetTimeout(10000,function()
				vRPC.removeObjects(source)
				vRP.Revive(Entitys,101)
				vRP.UpgradeThirst(OtherPassport,10)
				vRP.UpgradeHunger(OtherPassport,10)
				Player(source)["state"]["Cancel"] = false
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:BANDAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Bandage")
AddEventHandler("paramedic:Bandage",function(Entitys)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and vRP.GetHealth(Entitys) > 100 then
		if vRP.HasService(Passport,"Hospital") then
			if vCLIENT.Bleeding(Entitys) > 0 then
				if vRP.TakeItem(Passport,"gauze",1) then
					local Bandage = vCLIENT.Bandage(Entitys)
					TriggerClientEvent("Progress",source,5000)
					vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
					SetTimeout(3000,function()
						TriggerClientEvent("Notify",source,"verde","Passou ataduras no(a) <b>"..Bandage.."</b>.",5000,"Sucesso")
						TriggerClientEvent("sounds:Private",source,"bandage",0.5)
						vRPC.removeObjects(source)
					end)
				else
					TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("gauze").."</b>.",5000,"Atenção")
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Nenhum ferimento encontrado.",5000,"Atenção")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:DIAGNOSTIC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:Diagnostic")
AddEventHandler("paramedic:Diagnostic",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		if vRP.HasService(Passport,"Hospital") then
			local Result = ""
			local OtherPassport = vRP.Passport(entity)
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				local Diagnostic,Bleeding = vCLIENT.Diagnostic(entity)

				if Bleeding <= 1 then
					Result = "<b>Sangramento:</b> Baixo<br>"
				elseif Bleeding == 2 then
					Result = "<b>Sangramento:</b> Médio<br>"
				elseif Bleeding >= 3 then
					Result = "<b>Sangramento:</b> Alto<br>"
				end

				Result = Result.."<b>Tipo Sangüíneo:</b> "..Sanguine(Identity["blood"])

				local Number = 0
				local Damaged = false
				for Index,_ in pairs(Diagnostic) do
					if not Damaged then
						Result = Result.."<br><br><b>Danos Superficiais:</b><br>"
						Damaged = true
					end
					Number = Number + 1
					Result = Result.."<b>"..Number.."</b>: "..Bone(Index).."<br>"
				end

				TriggerClientEvent("Notify",source,"amarelo",Result,10000,"Ferimentos")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local preset = {
	["1"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 56, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 0, texture = 0 },
			["shoes"] = { item = 16, texture = 0 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 15, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 15, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 57, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 0, texture = 0 },
			["shoes"] = { item = 16, texture = 0 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 15, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 15, texture = 0 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	},
	["2"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 84, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 0, texture = 0 },
			["mask"] = { item = 122, texture = 0 },
			["shoes"] = { item = 47, texture = 3 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 186, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 110, texture = 3 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0 },
			["pants"] = { item = 86, texture = 0 },
			["vest"] = { item = 0, texture = 0 },
			["bracelet"] = { item = -1, texture = 0 },
			["backpack"] = { item = 0, texture = 0 },
			["decals"] = { item = 90, texture = 0 },
			["mask"] = { item = 122, texture = 0 },
			["shoes"] = { item = 48, texture = 3 },
			["tshirt"] = { item = 15, texture = 0 },
			["torso"] = { item = 188, texture = 0 },
			["accessory"] = { item = 0, texture = 0 },
			["watch"] = { item = -1, texture = 0 },
			["arms"] = { item = 127, texture = 3 },
			["glass"] = { item = 0, texture = 0 },
			["ear"] = { item = -1, texture = 0 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESETBURN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:presetBurn")
AddEventHandler("paramedic:presetBurn",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasService(Passport,"Hospital") then
		local Model = vRP.ModelPlayer(entity)
		if Model == "mp_m_freemode_01" or "mp_f_freemode_01" then
			TriggerClientEvent("skinshop:Apply",entity,preset["1"][Model])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESETPLASTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:presetPlaster")
AddEventHandler("paramedic:presetPlaster",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasService(Passport,"Hospital") then
		local Model = vRP.ModelPlayer(entity)
		if Model == "mp_m_freemode_01" or "mp_f_freemode_01" then
			TriggerClientEvent("skinshop:Apply",entity,preset["2"][Model])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:EXTRACTBLOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:extractBlood")
AddEventHandler("paramedic:extractBlood",function(Entitys)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local OtherPassport = vRP.Passport(Entitys)
		if OtherPassport and not Extract[OtherPassport] then
			Extract[OtherPassport] = true

			if vRP.GetHealth(Entitys) >= 170 then
				local Identity = vRP.Identity(OtherPassport)
				if Identity and vRP.Request(Entitys,"Paramédico","Deseja iniciar a doação sangue?") then
					if not Blood[OtherPassport] then
						Blood[OtherPassport] = os.time()
					end
					if os.time() >= Blood[OtherPassport] then
						if vRP.TakeItem(Passport,"syringe",3) then
							vRPC.DowngradeHealth(Entitys,50)
							Blood[OtherPassport] = os.time() + 10800
							vRP.GenerateItem(Passport,"syringe0"..Identity["Blood"],5,true)
							if Extract[OtherPassport] then
								Extract[OtherPassport] = nil
							end
						else
							TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>3x "..itemName("syringe").."</b>.",5000,"Atenção")
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","No momento não é possível efetuar a extração, o mesmo ainda está se recuperando ou se acidentou recentemente.",10000,"Atenção")
					end
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Sistema imunológico do paciente muito fraco.",5000,"Aviso")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:BLOODDEATH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("paramedic:bloodDeath")
AddEventHandler("paramedic:bloodDeath",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		Blood[Passport] = os.time() + 10800
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Extract[Passport] then
		Extract[Passport] = nil
	end
end)
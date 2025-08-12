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
Tunnel.bindInterface("dynamic",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
vKEYBOARD = Tunnel.getInterface("keyboard")
vSKINSHOP = Tunnel.getInterface("nation_skinshop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('vroupas2', function(source, args, rawCommand)
    local Passport = vRP.Passport(source)
    if Passport then
		-- local custom = vSKINSHOP.Customization(source)
		local custom = vSKINSHOP.getCloths(source)
		if custom then
        	local content = ""
			content = content .. '["hat"] = { item = '..custom['hat']['item']..', texture = '..custom['hat']['texture']..' },\n'    
			content = content .. '["pants"] = { item = '..custom['pants']['item']..', texture = '..custom['pants']['texture']..' },\n'  
			content = content .. '["vest"] = { item = '..custom['vest']['item']..', texture = '..custom['vest']['texture']..' },\n'  
			content = content .. '["bracelet"] = { item = '..custom['bracelet']['item']..', texture = '..custom['bracelet']['texture']..' },\n'  
			content = content .. '["backpack"] = { item = '..custom['backpack']['item']..', texture = '..custom['backpack']['texture']..' },\n'  
			content = content .. '["decals"] = { item = '..custom['decals']['item']..', texture = '..custom['decals']['texture']..' },\n'  
			content = content .. '["mask"] = { item = '..custom['mask']['item']..', texture = '..custom['mask']['texture']..' },\n'  
			content = content .. '["shoes"] = { item = '..custom['shoes']['item']..', texture = '..custom['shoes']['texture']..' },\n'  
			content = content .. '["tshirt"] = { item = '..custom['tshirt']['item']..', texture = '..custom['tshirt']['texture']..' },\n'  
			content = content .. '["torso"] = { item = '..custom['torso']['item']..', texture = '..custom['torso']['texture']..' },\n'  
			content = content .. '["accessory"] = { item = '..custom['accessory']['item']..', texture = '..custom['accessory']['texture']..' },\n'  
			content = content .. '["watch"] = { item = '..custom['watch']['item']..', texture = '..custom['watch']['texture']..' },\n'  
			content = content .. '["arms"] = { item = '..custom['arms']['item']..', texture = '..custom['arms']['texture']..' },\n'  
			content = content .. '["glass"] = { item = '..custom['glass']['item']..', texture = '..custom['glass']['texture']..' },\n'  
			content = content .. '["ear"] = { item = '..custom['ear']['item']..', texture = '..custom['ear']['texture']..' }'  
        	vKEYBOARD.Copy(source,"vRoupas:",content)
		end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXCLUSIVAS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Exclusivas()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Clothes = {}
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)
		for Index,v in pairs(Consult) do
			Clothes[#Clothes + 1] = { ["name"] = Index, ["id"] = v["id"], ["texture"] = v["texture"] or 0, ["type"] = v["type"] }
		end
		return Clothes
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXCLUSIVAS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckVip()
	local source = source
	local Passport = vRP.Passport(source)
	if vRP.HasGroup(Passport,"Premium") then
		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CODES
-----------------------------------------------------------------------------------------------------------------------------------------
local Codes = {
	["13"] = {
		["Message"] = "Oficial desmaiado/ferido",
		["Blip"] = 6
	},
	["20"] = {
		["Message"] = "Localização",
		["Blip"] = 6
	},
	["38"] = {
		["Message"] = "Abordagem de trânsito",
		["Blip"] = 6
	},
	["78"] = {
		["Message"] = "Apoio com prioridade",
		["Blip"] = 6
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TENCODE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:Tencode")
AddEventHandler("dynamic:Tencode",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetUserType(Passport,"Policia") and Codes[Number] then
		local FullName = vRP.FullName(Passport)
		local Coords = vRP.GetEntityCoords(source)
		local Service = vRP.NumPermission("Policia")
		for Passports,Sources in pairs(Service) do
			async(function()
				vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
				TriggerClientEvent("NotifyPush",Sources,{ code = Number, title = Codes[Number]["Message"], x = Coords["x"], y = Coords["y"], z = Coords["z"], name = FullName, color = Codes[Number]["Blip"] })
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Animal = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEANIMAL
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CreateAnimal(Model,x,y,z,h)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Animal[Passport] then
			DeleteEntity(Animal[Passport])
		end
		Animal[Passport] = CreatePed(28,GetHashKey(Model),x,y,z,h)
		return Animal[Passport],NetworkGetNetworkIdFromEntity(Animal[Passport])
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEANIMAL
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.deleteAnimal()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		DeleteEntity(Animal[Passport])
		Animal[Passport] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Animal[Passport] then
		DeleteEntity(Animal[Passport])
		Animal[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:DYNAMIC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:Dynamic")
AddEventHandler("admin:Dynamic", function(Mode, Source)
	local source = Source or source
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerClientEvent("dynamic:closeSystem", source)
		if Mode == "wl" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Secondary(source, "ID da Whitelist:", "Status: (0 inativa, 1 ativa)")
				if Keyboard then
					TriggerClientEvent("Notify", source, "verde", "Whitelist editada.", 5000, "Sucesso")
					vRP.Query("accounts/SetWhitelist", { Whitelist = Keyboard[2], id = Keyboard[1] })
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "rename" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Tertiary(source, "ID:", "Nome:", "Sobrenome:")
				if Keyboard then
					vRP.UpgradeNames(Keyboard[1], Keyboard[2], Keyboard[3])
					TriggerClientEvent("Notify", source, "verde", "Nome atualizado.", 5000, "Sucesso")
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "ugroups" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					local Result = ""
					local Groups = vRP.Groups()
					local OtherPassport = Keyboard[1]
					for Permission, _ in pairs(Groups) do
						local Data = vRP.DataGroups(Permission)
						if Data[OtherPassport] then
							Result = Result .."<b>Permissão:</b> " ..Permission .. "<br><b>Nível:</b> " .. Data[OtherPassport] .. "<br>"
						end
					end
					if Result ~= "" then
						TriggerClientEvent("Notify", source, "azul", Result, 10000, "Grupos Pertencentes")
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "clearinv" then
			--if vRP.HasGroup(Passport, "Admin") then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					vRP.ClearInventory(Keyboard[1])
					TriggerClientEvent("Notify", source, "verde", "Limpeza concluída.", 5000, "Sucesso")
					exports["vrp"]:Embed("Admin", "**Passaporte:** " .. Passport ..
						"\n**Comando:** clearinv " .. Keyboard[1], 0xa3c846)
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "gem" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Secondary(source, "ID:", "Quantidade:")
				if Keyboard then
					local Amount = parseInt(Keyboard[2])
					local OtherPassport = parseInt(Keyboard[1])
					local Identity = vRP.Identity(OtherPassport)
					if Identity then
						TriggerClientEvent("Notify", source, "verde", "Gemas entregues.", 5000, "Sucesso")
						vRP.UpgradeGemstone(OtherPassport, Amount)
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "blips" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				vRPC.BlipAdmin(source)
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "flash" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				TriggerClientEvent("admin:Flash", source)
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "god" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					exports["vrp"]:Embed("Admin", "**Passaporte:** " .. Passport .. "\n**Comando:** god " .. Keyboard[1],
						0xa3c846)

					local OtherPassport = parseInt(Keyboard[1])
					local ClosestPed = vRP.Source(OtherPassport)
					if ClosestPed then
						vRP.UpgradeThirst(OtherPassport, 100)
						vRP.UpgradeHunger(OtherPassport, 100)
						vRP.DowngradeCough(OtherPassport, 100)
						vRP.DowngradeStress(OtherPassport, 100)
						vRP.Revive(ClosestPed, 200)

						TriggerClientEvent("paramedic:Reset", ClosestPed)

						vRPC.Destroy(ClosestPed)
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "godall" then
			if vRP.HasGroup(Passport,"Admin",2) then
				local UsersList = vRP.Players()
				for k, v in pairs(UsersList) do
					local OtherPassport = parseInt(k)
					local ClosestPed = vRP.Source(OtherPassport)
					if ClosestPed then
						vRP.UpgradeThirst(OtherPassport,100)
						vRP.UpgradeHunger(OtherPassport,100)
						vRP.DowngradeCough(OtherPassport,100)
						vRP.DowngradeStress(OtherPassport,100)
						vRP.Revive(ClosestPed,200)

						TriggerClientEvent("paramedic:Reset",ClosestPed)

						vRPC.Destroy(ClosestPed)

						TriggerClientEvent("Notify", ClosestPed, "default", "Você recebeu uma cura divina.", 5000)
					end

					TriggerClientEvent("Notify", source, "verde", "Você reviveu todos onlines.", 5000, "Sucesso")
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Você não tem permissões para isso.",5000, "Atenção")
			end
		elseif Mode == "armour" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					exports["vrp"]:Embed("Admin", "**Passaporte:** " .. Passport .. "\n**Comando:** armour " ..
						Keyboard[1], 0xa3c846)

					local OtherPassport = parseInt(Keyboard[1])
					local ClosestPed = vRP.Source(OtherPassport)
					if ClosestPed then
						vRP.SetArmour(ClosestPed, 100)
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "item" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Secondary(source, "Nome do Item:", "Quantidade:")
				if Keyboard then
					if itemBody(Keyboard[1]) ~= nil then
						vRP.GenerateItem(Passport, Keyboard[1], parseInt(Keyboard[2]), true)
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", "Atenção",5000)
			end
		elseif Mode == "item2" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Tertiary(source, "ID:", "Nome do Item:", "Quantidade:")
				if Keyboard then
					if itemBody(Keyboard[2]) ~= nil then
						vRP.GenerateItem(parseInt(Keyboard[1]), Keyboard[2], parseInt(Keyboard[3]), true)
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "itemall" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Secondary(source, "Nome do Item:", "Quantidade:")
				if Keyboard then
					if itemBody(Keyboard[1]) ~= nil then
						local List = vRP.Players()
						for AllPlayers, _ in pairs(List) do
							async(function()
								vRP.GenerateItem(AllPlayers, Keyboard[1], parseInt(Keyboard[2]), true)
							end)
						end
						TriggerClientEvent("Notify", source, "verde", "Envio concluído.", 5000, "Sucesso")
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "delete" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					if vRP.Request(source, "Deletar Conta", "Você tem certeza?") then
						local OtherPassport = parseInt(Keyboard[1])
						vRP.Query("characters/Delete", { Passport = OtherPassport })
						TriggerClientEvent("Notify", source, "verde", "Personagem <b>" .. OtherPassport .."</b> deletado.", 5000, "Sucesso")
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "skin" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Secondary(source, "ID:", "Skin:")
				if Keyboard then
					local ClosestPed = vRP.Source(Keyboard[1])
					if ClosestPed then
						vRPC.Skin(ClosestPed, Keyboard[2])
						vRP.SkinCharacter(parseInt(Keyboard[1]), Keyboard[2])
						exports["vrp"]:Embed("Admin",
							"**Passaporte:** " .. Passport .. "\n**Comando:** skin " .. Keyboard[1] .. " " .. Keyboard
							[2], 0xa3c846)
						TriggerClientEvent("Notify", source, "verde",
							"Skin <b>" .. Keyboard[2] .. "</b> setada no ID " .. parseInt(Keyboard[1]) .. ".", "Sucesso",
							5000)
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "resetskin" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					local ClosestPed = vRP.Source(Keyboard[1])
					if ClosestPed then
						local OtherPassport = parseInt(Keyboard[1])
						local Identity = vRP.Identity(OtherPassport)
						if Identity then
							if Identity["Sex"] == "M" then
								vRPC.Skin(ClosestPed, "mp_m_freemode_01")
								vRP.SkinCharacter(parseInt(Keyboard[1]), "mp_m_freemode_01")
							elseif Identity["Sex"] == "F" then
								vRPC.Skin(ClosestPed, "mp_f_freemode_01")
								vRP.SkinCharacter(parseInt(Keyboard[1]), "mp_f_freemode_01")
							end

							exports["vrp"]:Embed("Admin",
								"**Passaporte:** " .. Passport .. "\n**Comando:** resetskin " .. Keyboard[1], 0xa3c846)
							TriggerClientEvent("Notify", source, "verde",
								"Skin do ID " .. parseInt(Keyboard[1]) .. " foi resetada.", 5000, "Sucesso")
						end
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "nc" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				vRPC.noClip(source)
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "kick" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					local OtherSource = vRP.Source(Keyboard[1])
					if OtherSource then
						TriggerClientEvent("Notify", source, "verde", "Passaporte <b>" .. Keyboard[1] .. "</b> expulso.",
							5000, "Sucesso")
						exports["vrp"]:Embed("Admin", "**Passaporte:** " .. Passport ..
							"\n**Comando:** kick " .. Keyboard[1], 0xa3c846)
						vRP.Kick(OtherSource, "Expulso da cidade.")
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "ban" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Secondary(source, "ID:", "Dias:")
				if Keyboard then
					local Days = parseInt(Keyboard[2])
					local OtherPassport = parseInt(Keyboard[1])
					local Identity = vRP.Identity(OtherPassport)
					if Identity then
						local OtherSource = vRP.Source(OtherPassport)
						if OtherSource then
							local Token = GetPlayerTokens(OtherSource)
							for k, v in pairs(Token) do
								vRP.Kick(OtherPassport, "Banido.")
								vRP.Query("banneds/InsertBanned",
									{ License = Identity["License"], Token = v, Time = Days })
							end

							exports["vrp"]:Embed("Admin",
								"**Passaporte:** " .. Passport .. "\n**Comando:** ban " .. Keyboard[1] ..
								" " .. Keyboard[2], 0xa3c846)
							TriggerClientEvent("Notify", source, "amarelo",
								"Passaporte <b>" .. OtherPassport .. "</b> banido por <b>" .. Days .. "</b> dias.",
								5000, "Atenção")
						end
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "unban" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					local OtherPassport = parseInt(Keyboard[1])
					local Identity = vRP.Identity(OtherPassport)
					if Identity then
						vRP.Query("banneds/RemoveBanned", { License = Identity["License"] })
						exports["vrp"]:Embed("Admin", "**Passaporte:** " ..
							Passport .. "\n**Comando:** unban " .. Keyboard[1], 0xa3c846)
						TriggerClientEvent("Notify", source, "verde", "Passaporte <b>" ..
							OtherPassport .. "</b> desbanido.", 5000, "Sucesso")
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "timeset" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Tertiary(source, "Hora:", "Minuto:", "Clima:")
				if Keyboard then
					GlobalState["Hours"] = parseInt(Keyboard[1])
					GlobalState["Minutes"] = parseInt(Keyboard[2])
					GlobalState["Weather"] = Keyboard[3]
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "temperatureset" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Primary(source, "Temperatura:")
				if Keyboard then
					GlobalState["Temperature"] = parseInt(Keyboard[1])
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "blackoutset" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				if GlobalState["Blackout"] then
					GlobalState["Blackout"] = false
					TriggerClientEvent("Notify", source, "amarelo", "Modo blackout desativado.", 5000, "Atenção")
				else
					GlobalState["Blackout"] = true
					TriggerClientEvent("Notify", source, "verde", "Modo blackout ativado.", 5000, "Sucesso")
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "cds" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				local Ped = GetPlayerPed(source)
				local Coords = GetEntityCoords(Ped)
				local Heading = GetEntityHeading(Ped)

				vKEYBOARD.Copy(source, "Cordenadas:",
					mathLength(Coords["x"]) ..
					"," .. mathLength(Coords["y"]) .. "," .. mathLength(Coords["z"]) .. "," .. mathLength(Heading))
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "tpcds" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				local Keyboard = vKEYBOARD.Primary(source, "Coordenada:")
				if Keyboard then
					local Split = splitString(Keyboard[1], ",")
					vRP.Teleport(source, Split[1] or 0, Split[2] or 0, Split[3] or 0)
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "group" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Tertiary(source, "ID:", "Grupo:", "Hierarquia:")
				if Keyboard then
					local Level = Keyboard[3]
					local Permission = Keyboard[2]
					local OtherPassport = Keyboard[1]

					if vRP.CheckGroup(Permission) then
						if vRP.GroupType(Permission) == "Work" then
							if not vRP.GetUserType(OtherPassport, "Work") then
								exports["vrp"]:Embed("Admin",
									"**Passaporte:** " ..
									Passport .. "\n**Comando:** group " .. OtherPassport .. " " .. Permission .. " " .. Level,
									0xa3c846)
								TriggerClientEvent("Notify", source, "verde",
									"Adicionado <b>" .. Permission .. "</b> ao passaporte <b>" .. OtherPassport .. "</b>.",
									5000, "Sucesso")
								vRP.SetPermission(OtherPassport, Permission, Level)
								
								-- if exports["painel"]:Buff(Permission) > 0 then
								-- 	vRP.SetPermission(OtherPassport, "Buff")
								-- end
							else
								TriggerClientEvent("Notify", source, "amarelo", "O passaporte já pertence a outro grupo.",
									5000, "Atenção")
							end
						else
							exports["vrp"]:Embed("Admin",
								"**Passaporte:** " ..
								Passport .. "\n**Comando:** group " .. OtherPassport .. " " .. Permission .. " " .. Level,
								0xa3c846)
							TriggerClientEvent("Notify", source, "verde",
								"Adicionado <b>" .. Permission .. "</b> ao passaporte <b>" .. OtherPassport .. "</b>.",
								5000, "Sucesso")
							vRP.SetPermission(OtherPassport, Permission, Level)
						end
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "ungroup" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Secondary(source, "ID:", "Grupo:")
				if Keyboard and vRP.CheckGroup(Keyboard[2]) then
					TriggerClientEvent("Notify", source, "verde",
						"Removido <b>" .. Keyboard[2] .. "</b> ao passaporte <b>" .. Keyboard[1] .. "</b>.", "Sucesso",
						5000)
					exports["vrp"]:Embed("Admin",
						"**Passaporte:** " .. Passport .. "\n**Comando:** ungroup " .. Keyboard[1] .. " " .. Keyboard[2],
						0xa3c846)
					vRP.RemovePermission(Keyboard[1], Keyboard[2])
					if vRP.GroupType(Keyboard[2]) == "Work" then
						vRP.RemovePermission(Keyboard[1], "Buff")
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "tptome" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					local ClosestPed = vRP.Source(Keyboard[1])
					if ClosestPed then
						local Ped = GetPlayerPed(source)
						local Coords = GetEntityCoords(Ped)

						vRP.Teleport(ClosestPed, Coords["x"], Coords["y"], Coords["z"])
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "tpto" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					local ClosestPed = vRP.Source(Keyboard[1])
					if ClosestPed then
						local Ped = GetPlayerPed(ClosestPed)
						local Coords = GetEntityCoords(Ped)
						vRP.Teleport(source, Coords["x"], Coords["y"], Coords["z"])
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "tpway" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				IMPERIO_CLIENT.teleportWay(source)
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "tuning" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				TriggerClientEvent("admin:Tuning", source)
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "fix" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Vehicle, Network, Plate = vRPC.VehicleList(source, 10)
				if Vehicle then
					local Players = vRPC.Players(source)
					for _, v in pairs(Players) do
						async(function()
							TriggerClientEvent("inventory:repairAdmin", v, Network, Plate)
						end)
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "fuel" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				if not vRPC.InsideVehicle(source) then
					local Vehicle, Network, Plate = vRPC.VehicleList(source, 10)
					if Vehicle then
						local Keyboard = vKEYBOARD.Primary(source, "Litros:")
						if Keyboard then
							local Networked = NetworkGetEntityFromNetworkId(Network)
							Entity(Networked)["state"]:set("Fuel", Keyboard[1], true)
							TriggerClientEvent("Notify", source, "verde",
								"Veículo com <b>" .. parseInt(Keyboard[1]) .. "% de Gasolina</b>.", 5000, "Sucesso")
						end
					end
				else
					TriggerClientEvent("Notify", source, "amarelo", "Você precisa sair do veículo.", 5000, "Atenção")
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "limparea" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Ped = GetPlayerPed(source)
				local Coords = GetEntityCoords(Ped)
				IMPERIO_CLIENT.Limparea(source, Coords)
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "hash" then
			if vRP.HasGroup(Passport, "Admin") then
				local Vehicle = vRPC.VehicleHash(source)
				if Vehicle then
					vKEYBOARD.Copy(source, "Hash do veículo:", Vehicle)
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "setbank" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Secondary(source, "ID:", "Quantidade:")
				if Keyboard then
					vRP.GiveBank(Keyboard[1], Keyboard[2])
					TriggerClientEvent("Notify", source, "verde", "Envio concluído.", 5000, "Sucesso")
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "rembank" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Secondary(source, "ID:", "Quantidade:")
				if Keyboard then
					vRP.RemoveBank(Keyboard[1], Keyboard[2])
					TriggerClientEvent("Notify", source, "verde", "Remoção concluída.", 5000, "Sucesso")
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "players" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				TriggerClientEvent("Notify", source, "azul", "<b>Jogadores Conectados:</b> " .. GetNumPlayerIndices(),5000)
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "playersconnected" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				local List = vRP.Players()
				local Players = ""
				for k, v in pairs(List) do
					local Identity = vRP.Identity(k)
					Players = Players .. k .. ": " .. Identity.name .. " ".. Identity.name2 .. "\n"
				end
				vKEYBOARD.Copy(source, "Players Conectados:", Players)
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "announce" then
			if vRP.HasGroup(Passport, "Admin", 3) then
				local Keyboard = vKEYBOARD.Quadruple(source, "Tema:", "Anúncio:", "Título:", "Segundos:")
				if Keyboard then
					TriggerClientEvent("Notify", -1, Keyboard[1], Keyboard[2], Keyboard[3], Keyboard[4] * 1000)
					exports["vrp"]:Embed("Admin",
						"**Passaporte:** " ..
						Passport ..
						"\n**Comando:** announce " ..
						Keyboard[1] .. " " .. Keyboard[2] .. " " .. Keyboard[3] .. " " .. Keyboard[4] * 1000, 0xa3c846)
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "setcar" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Secondary(source, "ID:", "Veículo:")
				if Keyboard and Keyboard[1] and Keyboard[2] then
					if VehicleExist(Keyboard[2]) then
						local Consult = vRP.Query("vehicles/selectVehicles",
							{ Passport = Keyboard[1], vehicle = Keyboard[2] })
						if Consult[1] then
							TriggerClientEvent("Notify", source, "amarelo",
								"O passaporte <b>" .. Keyboard[1] .. "</b> já possui o veículo <b>" ..
								Keyboard[2] .. "</b>", 5000, "Atenção")
						else
							exports["vrp"]:Embed("Admin",
								"**Passaporte:** " .. Passport .. "\n**Comando:** setcar " ..
								Keyboard[1] .. " " .. Keyboard[2], 0xa3c846)
							vRP.Query("vehicles/addVehicles",
								{
									Passport = Keyboard[1],
									vehicle = Keyboard[2],
									plate = vRP.GeneratePlate(),
									work = "false"
								})
							TriggerClientEvent("Notify", source, "verde",
								"O veículo <b>" ..
								Keyboard[2] .. "</b> foi adicionado para o passaporte <b>" .. Keyboard[1] .. "<b>.",
								5000, "Sucesso")
						end
					else
						TriggerClientEvent("Notify", source, "amarelo", "Esse carro não existe.", 5000, "Atenção")
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "remcar" then
			if vRP.HasGroup(Passport, "Admin", 1) then
				local Keyboard = vKEYBOARD.Secondary(source, "ID:", "Veículo:")
				if Keyboard then
					exports["vrp"]:Embed("Admin",
						"**Passaporte:** " .. Passport .. "\n**Comando:** remcar " .. Keyboard[1] .. " " .. Keyboard[2],
						0xa3c846)
					TriggerClientEvent("Notify", source, "verde", "Veículo removido com sucesso.", 5000, "Sucesso")
					vRP.Query("vehicles/removeVehicles", { Passport = Keyboard[1], vehicle = Keyboard[2] })
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "clearprison" then
			if vRP.HasGroup(Passport, "Admin", 2) then
				local Keyboard = vKEYBOARD.Primary(source, "ID:")
				if Keyboard then
					local OtherPlayer = vRP.Source(Keyboard[1])
					if OtherPlayer then
						exports["vrp"]:Embed("Admin",
							"**Passaporte:** " .. Passport .. "\n**Comando:** clearprison " .. Keyboard[1], 0xa3c846)
						exports["markers"]:Exit(OtherPlayer)
						TriggerClientEvent("Notify", source, "verde", "Prisão zerada.", 5000, "Sucesso")
						vRP.Query("characters/CleanPrison", { Passport = Keyboard[1] })
						Player(OtherPlayer)["state"]["Prison"] = false
					end
				end
			else
				TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissões para isso.", 5000, "Atenção")
			end
		elseif Mode == "stats" then
			local _, TotalPolicia = vRP.NumPermission("Policia")
			local _, TotalParamedico = vRP.NumPermission("Hospital")
			local _, TotalBombeiro = vRP.NumPermission("Bombeiro")

			TriggerClientEvent("Notify", source, "azul",
				"Atualmente <b>" ..
				parseInt(GetNumPlayerIndices()) ..
				"</b> pessoas conectadas.<br><br>Atualmente <b>" ..
				parseInt(TotalPolicia) ..
				" Policiais</b> conectados.<br>Atualmente <b>" ..
				parseInt(TotalParamedico) .. " Paramédicos</b> conectados.", ServerName, 10000)
		elseif Mode == "statsPolicia" then
			local _, TotalPolicia = vRP.NumPermission("Policia")
			TriggerClientEvent("Notify", source, "policia",
				"Existem <b>" .. parseInt(TotalPolicia) .. "</b> companheiros com você.", "Polícia", 5000)
		elseif Mode == "statsParamedico" then
			local _, TotalParamedico = vRP.NumPermission("Hospital")
			TriggerClientEvent("Notify", source, "hospital",
				"Existem <b>" .. parseInt(TotalParamedico) .. "</b> companheiros com você.", "Paramédico", 5000)
		elseif Mode == "statsBombeiro" then
				local _, TotalBombeiro = vRP.NumPermission("Bombeiro")
				TriggerClientEvent("Notify", source, "hospital","Existem <b>" .. parseInt(TotalBombeiro) .. "</b> companheiros com você.", "Paramédico", 5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("service:Toggle")
AddEventHandler("service:Toggle",function(Service)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.ServiceToggle(source,Passport,Service,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	["RádioPatrulha"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 35, texture = 0 },
				["backpack"] = { item = 55, texture = 0 },
				["shoes"] = { item = 69, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 56, texture = 0 },
				["vest"] = { item = 8, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 102, texture = 1 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 3, texture = 1 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 37, texture = 2 },
				["backpack"] = { item = 55, texture = 0 },
				["shoes"] = { item = 72, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 18, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 88, texture = 1 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 3, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			}
		},
		[2] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 14, texture = 12 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 7, texture = 0 },
				["accessory"] = { item = 0, texture = 0 },
				["tshirt"] = { item = 122, texture = 0 },
				["vest"] = { item = 13, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 206, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 13, texture = 2 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 10, texture = 0 },
				["backpack"] = { item = 84, texture = 0 },
				["shoes"] = { item = 103, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 2, texture = 0 },
				["vest"] = { item = 15, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 212, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 13, texture = 2 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			}
		},
		[3] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 35, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 69, texture = 0 },
				["accessory"] = { item = 8, texture = 0 },
				["tshirt"] = { item = 56, texture = 0 },
				["vest"] = { item = 8, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 102, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 3, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 37, texture = 2 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 72, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 18, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 88, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 3, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			}
		},
		[4] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 1, texture = 0 },
				["pants"] = { item = 35, texture = 0 },
				["backpack"] = { item = 55, texture = 0 },
				["shoes"] = { item = 54, texture = 0 },
				["accessory"] = { item = 8, texture = 0 },
				["tshirt"] = { item = 44, texture = 1 },
				["vest"] = { item = 32, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 21, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 3, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 37, texture = 2 },
				["backpack"] = { item = 55, texture = 0 },
				["shoes"] = { item = 72, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 38, texture = 2 },
				["vest"] = { item = 15, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 70, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 3, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			}
		},
		[5] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 35, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 69, texture = 0 },
				["accessory"] = { item = 8, texture = 0 },
				["tshirt"] = { item = 55, texture = 0 },
				["vest"] = { item = 8, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 55, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 13, texture = 2 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 37, texture = 2 },
				["backpack"] = { item = 43, texture = 0 },
				["shoes"] = { item = 72, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 2, texture = 0 },
				["vest"] = { item = 18, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 88, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 13, texture = 2 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			}
		},
	},
	["Rocam"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["watch"] = { item = 20, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 19, texture = 0 },
				["pants"] = { item = 15, texture = 2 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 0, texture = 0 },
				["tshirt"] = { item = 122, texture = 0 },
				["vest"] = { item = 13, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 206, texture = 2 },
				["hat"] = { item = 52, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["watch"] = { item = -1, texture = 0 },
				["mask"] = { item = 185, texture = 0 },
				["arms"] = { item = 31, texture = 0 },
				["pants"] = { item = 10, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 31, texture = 0 },
				["vest"] = { item = 34, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 212, texture = 2 },
				["hat"] = { item = 50, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			}
		},
		[2] = {
			["mp_m_freemode_01"] = {
				["watch"] = { item = 20, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 19, texture = 0 },
				["pants"] = { item = 33, texture = 0 },
				["backpack"] = { item = 32, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 58, texture = 0 },
				["vest"] = { item = 31, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 190, texture = 0 },
				["hat"] = { item = 17, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["watch"] = { item = -1, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 31, texture = 0 },
				["pants"] = { item = 34, texture = 0 },
				["backpack"] = { item = 32, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 22, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 192, texture = 0 },
				["hat"] = { item = 47, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			}
		},
		[3] = {
			["mp_m_freemode_01"] = {
				["watch"] = { item = 20, texture = 0 },
				["mask"] = { item = 53, texture = 0 },
				["arms"] = { item = 20, texture = 0 },
				["pants"] = { item = 33, texture = 0 },
				["backpack"] = { item = 32, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 58, texture = 0 },
				["vest"] = { item = 31, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 193, texture = 0 },
				["hat"] = { item = 17, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["watch"] = { item = -1, texture = 0 },
				["mask"] = { item = 185, texture = 0 },
				["arms"] = { item = 31, texture = 0 },
				["pants"] = { item = 34, texture = 0 },
				["backpack"] = { item = 32, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 22, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 328, texture = 0 },
				["hat"] = { item = 47, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			}
		},
		[4] = {
			["mp_m_freemode_01"] = {
				["watch"] = { item = 20, texture = 0 },
				["mask"] = { item = 47, texture = 0 },
				["arms"] = { item = 20, texture = 0 },
				["pants"] = { item = 33, texture = 0 },
				["backpack"] = { item = 32, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 58, texture = 0 },
				["vest"] = { item = 32, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 154, texture = 0 },
				["hat"] = { item = 17, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["watch"] = { item = -1, texture = 0 },
				["mask"] = { item = 185, texture = 0 },
				["arms"] = { item = 31, texture = 0 },
				["pants"] = { item = 34, texture = 0 },
				["backpack"] = { item = 54, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 34, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 89, texture = 0 },
				["hat"] = { item = 47, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			}
		},		
	},
	["ForçaTática"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["ear"] = { item = -1, texture = 0 },
				["mask"] = { item = 58, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 33, texture = 0 },
				["backpack"] = { item = 52, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 55, texture = 0 },
				["vest"] = { item = 31, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 190, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["ear"] = { item = -1, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 37, texture = 2 },
				["backpack"] = { item = 52, texture = 0 },
				["shoes"] = { item = 29, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 159, texture = 0 },
				["vest"] = { item = 22, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 192, texture = 0 },
				["hat"] = { item = 28, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			}
		},
		[2] = {
			["mp_m_freemode_01"] = {
				["ear"] = { item = -1, texture = 0 },
				["mask"] = { item = 58, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 14, texture = 1 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 7, texture = 1 },
				["accessory"] = { item = 9, texture = 0 },
				["tshirt"] = { item = 49, texture = 0 },
				["vest"] = { item = 13, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 206, texture = 1 },
				["hat"] = { item = 8, texture = 2 },
				["watch"] = { item = 20, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["ear"] = { item = -1, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 14, texture = 9 },
				["backpack"] = { item = 83, texture = 0 },
				["shoes"] = { item = 103, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 2, texture = 0 },
				["vest"] = { item = 34, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 212, texture = 1 },
				["hat"] = { item = 28, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			}
		},
		[3] = {
			["mp_m_freemode_01"] = {
				["ear"] = { item = -1, texture = 0 },
				["mask"] = { item = 58, texture = 0 },
				["arms"] = { item = 1, texture = 0 },
				["pants"] = { item = 33, texture = 0 },
				["backpack"] = { item = 52, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 8, texture = 0 },
				["tshirt"] = { item = 44, texture = 1 },
				["vest"] = { item = 32, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 29, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["ear"] = { item = -1, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 37, texture = 2 },
				["backpack"] = { item = 52, texture = 0 },
				["shoes"] = { item = 29, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 197, texture = 4 },
				["vest"] = { item = 34, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 70, texture = 0 },
				["hat"] = { item = 28, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
			}
		}		
	},
	["Trânsito"] = {
		[6] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 33, texture = 0 },
				["backpack"] = { item = 54, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 8, texture = 0 },
				["tshirt"] = { item = 55, texture = 0 },
				["vest"] = { item = 14, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 190, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 13, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 30, texture = 0 },
				["backpack"] = { item = 53, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 219, texture = 0 },
				["vest"] = { item = 15, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 330, texture = 8 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 13, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
			}
		},
	},
	["BAEP"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 1 },
				["mask"] = { item = 58, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 33, texture = 0 },
				["backpack"] = { item = 53, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 55, texture = 0 },
				["vest"] = { item = 30, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 190, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["hat"] = { item = 28, texture = 0 },
				["mask"] = { item = -1, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 37, texture = 2 },
				["backpack"] = { item = 54, texture = 0 },
				["shoes"] = { item = 29, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 159, texture = 0 },
				["vest"] = { item = 4, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 192, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
			}
		},		
	},
	["GRPAE"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 17, texture = 0 },
				["pants"] = { item = 64, texture = 0 },
				["backpack"] = { item = 30, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 43, texture = 0 },
				["vest"] = { item = 29, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 108, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["watch"] = { item = 3, texture = 0 },
				["hat"] = { item = 78, texture = 1 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 17, texture = 0 },
				["pants"] = { item = 29, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 103, texture = 0 },
				["tshirt"] = { item = 31, texture = 0 },
				["vest"] = { item = 0, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 41, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["hat"] = { item = 78, texture = 0 },
			}
		},
		[2] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 17, texture = 0 },
				["pants"] = { item = 64, texture = 0 },
				["backpack"] = { item = 30, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 20, texture = 0 },
				["tshirt"] = { item = 49, texture = 0 },
				["vest"] = { item = 29, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 108, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["watch"] = { item = 3, texture = 0 },
				["hat"] = { item = 79, texture = 1 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 17, texture = 0 },
				["pants"] = { item = 29, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 103, texture = 0 },
				["tshirt"] = { item = 31, texture = 0 },
				["vest"] = { item = 17, texture = 1 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 41, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["hat"] = { item = 78, texture = 0 },
			}
		},
		
	},
	["Rota"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 58, texture = 1 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 33, texture = 0 },
				["backpack"] = { item = 33, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 49, texture = 0 },
				["vest"] = { item = 16, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 190, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 131, texture = 0 },
				["pants"] = { item = 34, texture = 0 },
				["backpack"] = { item = 33, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 2, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 329, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 28, texture = 1 },
			}
		},
		[2] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 58, texture = 1 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 14, texture = 1 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 7, texture = 2 },
				["accessory"] = { item = 9, texture = 0 },
				["tshirt"] = { item = 49, texture = 0 },
				["vest"] = { item = 13, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 206, texture = 3 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 8, texture = 2 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 14, texture = 9 },
				["backpack"] = { item = 43, texture = 0 },
				["shoes"] = { item = 28, texture = 0 },
				["accessory"] = { item = 2, texture = 0 },
				["tshirt"] = { item = 31, texture = 0 },
				["vest"] = { item = 0, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 212, texture = 3 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 28, texture = 1 },
			}
		},
		[3] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 58, texture = 1 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 52, texture = 0 },
				["backpack"] = { item = 33, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 49, texture = 0 },
				["vest"] = { item = 16, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 220, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 131, texture = 0 },
				["pants"] = { item = 100, texture = 2 },
				["backpack"] = { item = 33, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 2, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 296, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 28, texture = 1 },
			}
		},
		[4] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 58, texture = 1 },
				["arms"] = { item = 1, texture = 0 },
				["pants"] = { item = 33, texture = 0 },
				["backpack"] = { item = 33, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 44, texture = 1 },
				["vest"] = { item = 32, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 143, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 14, texture = 0 },
				["pants"] = { item = 136, texture = 1 },
				["backpack"] = { item = 33, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 59, texture = 1 },
				["vest"] = { item = 0, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 70, texture = 1 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = 28, texture = 1 },
			}
		},
		
	},

	["Pcesp"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 169, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 0, texture = 0 },
				["backpack"] = { item = 58, texture = 0 },
				["shoes"] = { item = 97, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 131, texture = 0 },
				["vest"] = { item = 35, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 94, texture = 2 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 0, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 29, texture = 0 },
				["accessory"] = { item = 103, texture = 0 },
				["tshirt"] = { item = 9, texture = 0 },
				["vest"] = { item = 15, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 44, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		[2] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 4, texture = 0 },
				["pants"] = { item = 45, texture = 0 },
				["backpack"] = { item = 58, texture = 0 },
				["shoes"] = { item = 51, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 60, texture = 0 },
				["vest"] = { item = 35, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 35, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 6, texture = 0 },
				["pants"] = { item = 133, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 52, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 39, texture = 0 },
				["vest"] = { item = 52, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 168, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		[3] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 47, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 52, texture = 1 },
				["backpack"] = { item = 58, texture = 0 },
				["shoes"] = { item = 25, texture = 0 },
				["accessory"] = { item = 0, texture = 0 },
				["tshirt"] = { item = 53, texture = 0 },
				["vest"] = { item = 7, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 94, texture = 0 },
				["watch"] = { item = 3, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = 47, texture = 0 },
				["arms"] = { item = 0, texture = 0 },
				["pants"] = { item = 30, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 100, texture = 0 },
				["accessory"] = { item = 103, texture = 0 },
				["tshirt"] = { item = 31, texture = 0 },
				["vest"] = { item = 1, texture = 1 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 46, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		
	},
	
	["Hospital"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["glass"] = { item = 0, texture = 0 },
				["mask"] = { item = 11, texture = 0 },
				["arms"] = { item = 95, texture = 0 },
				["pants"] = { item = 3, texture = 3 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 42, texture = 0 },
				["accessory"] = { item = 156, texture = 4 },
				["tshirt"] = { item = 135, texture = 0 },
				["vest"] = { item = 36, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 396, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["glass"] = { item = 0, texture = 0 },
				["mask"] = { item = 11, texture = 0 },
				["arms"] = { item = 102, texture = 0 },
				["pants"] = { item = 51, texture = 2 },
				["shoes"] = { item = 103, texture = 0 },
				["accessory"] = { item = 129, texture = 4 },
				["tshirt"] = { item = 7, texture = 0 },
				["vest"] = { item = 14, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 411, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		[2] = {
			["mp_m_freemode_01"] = {
				["glass"] = { item = 7, texture = 0 },
				["mask"] = { item = 121, texture = 0 },
				["arms"] = { item = 127, texture = 0 },
				["pants"] = { item = 38, texture = 1 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 126, texture = 0 },
				["tshirt"] = { item = 15, texture = 0 },
				["vest"] = { item = -1, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 65, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["hat"] = { item = 10, texture = 1 },
			},
			["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 1 },
				["arms"] = { item = 167, texture = 0 },
				["pants"] = { item = 38, texture = 1 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 96, texture = 0 },
				["tshirt"] = { item = 14, texture = 0 },
				["vest"] = { item = -1, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 59, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
			}
		},
		[3] = {
			["mp_m_freemode_01"] = {
				["glass"] = { item = 0, texture = 0 },
				["mask"] = { item = 11, texture = 0 },
				["arms"] = { item = 82, texture = 0 },
				["pants"] = { item = 20, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 42, texture = 0 },
				["accessory"] = { item = 126, texture = 0 },
				["tshirt"] = { item = 57, texture = 0 },
				["vest"] = { item = 36, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 322, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["glass"] = { item = 0, texture = 0 },
				["mask"] = { item = 11, texture = 0 },
				["arms"] = { item = 86, texture = 0 },
				["pants"] = { item = 50, texture = 0 },
				["shoes"] = { item = 103, texture = 0 },
				["accessory"] = { item = 124, texture = 0 },
				["tshirt"] = { item = 7, texture = 0 },
				["vest"] = { item = 14, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 367, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		
	},

	["Prf"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["glass"] = { item = -1, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 20, texture = 0 },
				["pants"] = { item = 31, texture = 2 },
				["backpack"] = { item = 43, texture = 0 },
				["shoes"] = { item = 35, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 49, texture = 0 },
				["vest"] = { item = 28, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 166, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = 4, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["glass"] = { item = -1, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 27, texture = 0 },
				["pants"] = { item = 54, texture = 1 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 36, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 3, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 103, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = 4, texture = 0 },
			}
		},
		[2] = {
			["mp_m_freemode_01"] = {
				["glass"] = { item = -1, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 1, texture = 0 },
				["pants"] = { item = 31, texture = 2 },
				["backpack"] = { item = 43, texture = 0 },
				["shoes"] = { item = 35, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 49, texture = 0 },
				["vest"] = { item = 28, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 166, texture = 0 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = 10, texture = 2 },
			},
			["mp_f_freemode_01"] = {
				["glass"] = { item = -1, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["arms"] = { item = 7, texture = 0 },
				["pants"] = { item = 54, texture = 1 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 36, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 3, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 103, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		[3] = {
			["mp_m_freemode_01"] = {
				["glass"] = { item = -1, texture = 0 },
				["mask"] = { item = 47, texture = 1 },
				["arms"] = { item = 20, texture = 0 },
				["pants"] = { item = 25, texture = 1 },
				["backpack"] = { item = 43, texture = 0 },
				["shoes"] = { item = 62, texture = 0 },
				["accessory"] = { item = 1, texture = 0 },
				["tshirt"] = { item = 49, texture = 0 },
				["vest"] = { item = 28, texture = 1 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 166, texture = 1 },
				["watch"] = { item = 20, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["glass"] = { item = -1, texture = 0 },
				["mask"] = { item = 47, texture = 1 },
				["arms"] = { item = 27, texture = 0 },
				["pants"] = { item = 127, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["shoes"] = { item = 36, texture = 0 },
				["accessory"] = { item = 3, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["vest"] = { item = 3, texture = 1 },
				["decals"] = { item = 0, texture = 0 },
				["torso"] = { item = 103, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["ear"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		
	},

	["EastCustoms"] = {
		[1] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 121, texture = 0 },
				["arms"] = { item = 48, texture = 0 },
				["pants"] = { item = 45, texture = 0 },
				["backpack"] = { item = -1, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = -1, texture = 0 },
				["tshirt"] = { item = 88, texture = 0 },
				["vest"] = { item = -1, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 43, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = -1, texture = 0 },
				["arms"] = { item = 54, texture = 0 },
				["pants"] = { item = 47, texture = 0 },
				["backpack"] = { item = -1, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 54, texture = 0 },
				["tshirt"] = { item = 100, texture = 0 },
				["vest"] = { item = -1, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 258, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		[2] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 121, texture = 0 },
				["arms"] = { item = 125, texture = 0 },
				["pants"] = { item = 38, texture = 0 },
				["backpack"] = { item = -1, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = -1, texture = 0 },
				["tshirt"] = { item = 89, texture = 0 },
				["vest"] = { item = -1, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 65, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = -1, texture = 0 },
				["arms"] = { item = 165, texture = 0 },
				["pants"] = { item = 38, texture = 0 },
				["backpack"] = { item = -1, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 8, texture = 0 },
				["tshirt"] = { item = 99, texture = 0 },
				["vest"] = { item = -1, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 59, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		[3] = {
			["mp_m_freemode_01"] = {
				["mask"] = { item = 121, texture = 0 },
				["arms"] = { item = 125, texture = 0 },
				["pants"] = { item = 39, texture = 1 },
				["backpack"] = { item = -1, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = -1, texture = 0 },
				["tshirt"] = { item = 88, texture = 0 },
				["vest"] = { item = -1, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 66, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			},
			["mp_f_freemode_01"] = {
				["mask"] = { item = -1, texture = 0 },
				["arms"] = { item = 19, texture = 0 },
				["pants"] = { item = 39, texture = 1 },
				["backpack"] = { item = -1, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["accessory"] = { item = 8, texture = 0 },
				["tshirt"] = { item = 100, texture = 0 },
				["vest"] = { item = -1, texture = 0 },
				["decals"] = { item = -1, texture = 0 },
				["torso"] = { item = 60, texture = 1 },
				["watch"] = { item = -1, texture = 0 },
				["glass"] = { item = -1, texture = 0 },
				["hat"] = { item = -1, texture = 0 },
			}
		},
		
	},

	
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Presets(Group)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		return List[Group]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:Preset")
AddEventHandler("dynamic:Preset",function(Key)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Group,Preset = Key:match("(.-)-(.*)")
		local Model = vRP.ModelPlayer(source)
		if Model == "mp_m_freemode_01" or "mp_f_freemode_01" then

			print(List[Group][tonumber(Preset)][Model])
			TriggerClientEvent("skinshop:Apply",source,List[Group][tonumber(Preset)][Model])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("barbershop:Debug")
AddEventHandler("barbershop:Debug",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Datatable = vRP.Datatable(Passport)
		local Identity = vRP.Identity(Passport)
		if Datatable and Identity then
		
			vRPC.Skin(source, Datatable.Skin)
        	vRP.SetArmour(source, Datatable.Armour)
        	vRPC.SetHealth(source, Datatable.Health)
			
        	TriggerClientEvent("barbershop:Apply", source, vRP.UserData(Passport, "Barbershop"))
        	TriggerClientEvent("skinshop:Apply", source, vRP.UserData(Passport, "Clothings"))
        	TriggerClientEvent("tattoos:Apply", source, vRP.UserData(Passport, "Tatuagens"))
			
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			TriggerClientEvent("syncarea",source,Coords["x"],Coords["y"],Coords["z"],1)
		end
	end
end)
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
Tunnel.bindInterface("pdm",Creative)
vCLIENT = Tunnel.getInterface("pdm")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Buy(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if not Active[Passport] and Passport then
		Active[Passport] = true
		if VehicleMode(Name) ~= "Work" then
			local Price = VehiclePrice(Name)
			local Gemstone = VehicleGemstone(Name)
			
			local MaxVehicles = 10
			if vRP.HasGroup(OtherPassport,"Poze") then
				MaxVehicles = MaxVehicles + 25
			elseif vRP.HasGroup(OtherPassport,"RubiPlus") then
				MaxVehicles = MaxVehicles + 20
			elseif vRP.HasGroup(OtherPassport,"Safira") then
				MaxVehicles = MaxVehicles + 12
			elseif vRP.HasGroup(OtherPassport,"Esmeralda") then
				MaxVehicles = MaxVehicles + 10
			elseif vRP.HasGroup(OtherPassport,"Diamante") then
				MaxVehicles = MaxVehicles + 8
			elseif vRP.HasGroup(OtherPassport,"Platina") then
				MaxVehicles = MaxVehicles + 6
			elseif vRP.HasGroup(OtherPassport,"Prata") then
				MaxVehicles = MaxVehicles + 4
			elseif vRP.HasGroup(OtherPassport,"Bronze") then
				MaxVehicles = MaxVehicles + 2
			end

			local Vehicles = exports["oxmysql"]:query_async("SELECT vehicle, COUNT(vehicle) AS countVehicle FROM vehicles WHERE work = 'false' AND Passport = @Passport GROUP BY vehicle ORDER BY countVehicle DESC;",{ Passport = Passport })
			if #Vehicles >= MaxVehicles then
				TriggerClientEvent("Notify",source,"azul","Atingiu o número máximo de veículos em sua garagem.",8000)
			else
				if VehicleMode(Name) == "Rental" then
					if parseInt(Gemstone) > 0 then
						if vRP.Request(source,"Alugar o veículo <b>"..VehicleName(Name).."</b> por <b>"..parseFormat(Gemstone).."</b> Gemas?","Sim, concluír aluguel","Não, mudei de ideia") then
							if vRP.PaymentGems(Passport,Gemstone) then
								local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
								if vehicle[1] then
									if vehicle[1]["rental"] <= os.time() then
										vRP.Query("vehicles/rentalVehiclesUpdate",{ Passport = Passport, vehicle = Name })
										TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> atualizado.",5000)
									else
										vRP.Query("vehicles/rentalVehiclesDays",{ Passport = Passport, vehicle = Name })
										TriggerClientEvent("Notify",source,"verde","Adicionado <b>30 Dias</b> de aluguel no veículo <b>"..VehicleName(Name).."</b>.",5000)
									end
								else
									vRP.Query("vehicles/rentalVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "false" })
									TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> concluído.",5000)
								end
								TriggerEvent("Discord","RentalVehicle","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name).."\n**Gemas:** "..Gemstone,3553599)
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
							end
						end
					else
						if parseInt(Price) > 0 then
							if vRP.Request(source,"Alugar o veículo <b>"..VehicleName(Name).."</b> por <b>R$"..parseFormat(Price).."</b> reais?","Sim, concluír aluguel","Não, mudei de ideia") then
								if vRP.PaymentFull(Passport,parseInt(Price),"Aluguel de "..VehicleName(Name)) then
									local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
									if vehicle[1] then
										if vehicle[1]["rental"] <= os.time() then
											vRP.Query("vehicles/rentalVehiclesUpdate",{ Passport = Passport, vehicle = Name })
											TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> atualizado.",5000)
										else
											vRP.Query("vehicles/rentalVehiclesDays",{ Passport = Passport, vehicle = Name })
											TriggerClientEvent("Notify",source,"verde","Adicionado <b>30 Dias</b> de aluguel no veículo <b>"..VehicleName(Name).."</b>.",5000)
										end
									else
										vRP.Query("vehicles/rentalVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "false" })
										TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> concluído.",5000)
									end
									TriggerEvent("Discord","RentalVehicle","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name).."\n**Reais:** "..Price,3553599)
								else
									TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
								end
							end
						end
					end
				else
					local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
					if vehicle[1] then
						TriggerClientEvent("Notify",source,"amarelo","Já possui um <b>"..VehicleName(Name).."</b>.",3000)
					else
						if parseInt(Gemstone) > 0 then
							if vRP.Request(source,"Veiculos","Comprar <b>"..VehicleName(Name).."</b> por <b>R$"..parseFormat(Gemstone).."</b> Gemas?","Sim, concluír pagamento","Não, mudei de ideia") then
								if vRP.PaymentGems(Passport,parseInt(Gemstone)) then
									vRP.Query("vehicles/addVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "false" })
									TriggerClientEvent("Notify",source,"verde","Compra do veículo <b>"..VehicleName(Name).."</b> concluído.",5000)
									TriggerEvent("Discord","BuyVehicle","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name).."\n**Gemas:** "..Gemstone,3553599)
								else
									TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
								end
							end			
						else
							if parseInt(Price) > 0 then
								if vRP.Request(source,"Veiculos","Comprar <b>"..VehicleName(Name).."</b> por <b>R$"..parseFormat(Price).."</b> reais?","Sim, concluír pagamento","Não, mudei de ideia") then
									if vRP.PaymentFull(Passport,Price,"Comprar de "..VehicleName(Name)) then
										vRP.Query("vehicles/addVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "false" })
										TriggerClientEvent("Notify",source,"verde","Compra do veículo <b>"..VehicleName(Name).."</b> concluído.",5000)
										TriggerEvent("Discord","BuyVehicle","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name).."\n**Reais:** "..Price,3553599)
									end
								end
							end
						end
					end
				end

			end
		end
		Active[Passport] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDRIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckDrive(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Active[Passport] then
			Active[Passport] = true
			if not exports["hud"]:Wanted(Passport) then
				if vRP.Request(source,"Veiculos","Iniciar o teste por <b>R$100</b> reais?","Sim, iniciar o teste","Não, volto depois") then
					if vRP.PaymentFull(Passport,100,"Teste-Driver") then
						TriggerEvent("vRP:BucketServer",source,"Enter",Passport)
						TriggerEvent("Discord","TestDriver","**Passaporte:** "..Passport.."\n**Veículo:** "..VehicleName(Name),3553599)
						Active[Passport] = nil
						return true
					end
				else
					TriggerClientEvent("Notify",source,"vermelho","<b>Negado</b>.",5000)	
				end
			end
			Active[Passport] = nil
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEDRIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RemoveDrive()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerEvent("vRP:BucketServer",source,"Exit")
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
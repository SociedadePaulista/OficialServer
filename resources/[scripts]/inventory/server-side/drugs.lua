-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	["cocaine"] = {
		["Price"] = { ["Min"] = 110, ["Max"] = 125 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 3 }
	},
	["meth"] = {
		["Price"] = { ["Min"] = 130, ["Max"] = 150 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 3 }
	},
	["joint"] = {
		["Price"] = { ["Min"] = 45, ["Max"] = 60 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 3 }
	},
	["oxy"] = {
		["Price"] = { ["Min"] = 70, ["Max"] = 80 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 3 }
	},
	["weedsack"] = {
		["Price"] = { ["Min"] = 400, ["Max"] = 450 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 1 }
	},
	["cokesack"] = {
		["Price"] = { ["Min"] = 400, ["Max"] = 450 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 1 }
	},
	["methsack"] = {
		["Price"] = { ["Min"] = 1250, ["Max"] = 1500 },
		["Amount"] = { ["Min"] = 1, ["Max"] = 1 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDRUGS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckDrugs()
	local Return = false
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Total = 0
		local Groups = vRP.Groups()
		for key,Value in pairs(Groups) do
			if Value["Type"] == "Policia" then
				local Service,Amount = vRP.NumPermission(key)
				Total = Total + Amount
			end
		end
		if Total >= 2 then
			for Item,v in pairs(List) do
				local Price = math.random(v["Price"]["Min"],v["Price"]["Max"])
				local Amount = math.random(v["Amount"]["Min"],v["Amount"]["Max"])
				if vRP.ConsultItem(Passport,Item,Amount) then
					Drugs[Passport] = { Item,Amount,Price * Amount }
					Return = true
					break
				end
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Contingente indisponível.",5000,"Atenção")
		end
	end
	return Return
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTDRUGS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.PaymentDrugs()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Drugs[Passport] and vRP.TakeItem(Passport,Drugs[Passport][1],Drugs[Passport][2]) then
		Active[Passport] = true

		local Valuation = Drugs[Passport][3]
		if Buffs["Dexterity"][Passport] and Buffs["Dexterity"][Passport] > os.time() then
			Valuation = Valuation + (Valuation * 0.1)
		end

		TriggerClientEvent("player:Residuals",source,"Resíduo Orgânico.")
		vRP.GenerateItem(Passport,"dollars",Valuation,true)

		if math.random(100) >= 70 then
			TriggerEvent("Wanted",source,Passport,60)
			local Coords = vRP.GetEntityCoords(source)


			local Groups = vRP.Groups()
			for key,Value in pairs(Groups) do
				if Value["Type"] == "Policia" then
					local Service,Amount = vRP.NumPermission(key)
					for Passports,Sources in pairs(Service) do
						async(function()
							TriggerClientEvent("sounds:Private",Sources,"crime",0.25)
							TriggerClientEvent("NotifyPush",Sources,{ code = 20, title = "Venda de Drogas", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Ligação Anônima", color = 16 })
						end)
					end

				end
			end

		end

		Active[Passport] = nil
		Drugs[Passport] = nil
	end
end
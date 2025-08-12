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
Tunnel.bindInterface("bank",Creative)
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
local yield = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Wanted()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 and not exports["hud"]:Reposed(Passport) and not exports["hud"]:Wanted(Passport,source) then
		return true
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
-- CreateThread(function()
-- 	local next_time = GetGameTimer()
-- 	while true do
-- 		if os.time() >= next_time then
-- 			next_time = os.time() + 3600
-- 			vRP.Query("investments/Actives")
-- 		end
-- 		Wait(1000)
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOME
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Home()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		Active[Passport] = nil
		local check = vRP.Query("investments/Check", {Passport = Passport})
		if check[1] then
			yield = check[1].Monthly
		end
		local cardnumber = "7822 1352 4522 " .. 1000 + Passport
		local balance = vRP.Identity(Passport).bank
		local transactions = Transactions(Passport)
		local dependents = Dependents(Passport)	
		return {
			Passport = Passport,
			yield = yield,
			cardnumber = cardnumber,
			balance = balance,
			transactions = transactions,
			dependents = dependents,
			cardlimit = vRP.Identity(Passport)["cardlimit"],
			spending = vRP.Identity(Passport)["spending"]
		}
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Bank:CreditCard")
AddEventHandler("Bank:CreditCard", function()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
		local Identity = vRP.Identity(Passport)
		if Identity["cardlimit"] == 0 and Identity["spending"] == 0 then
			if vRP.Request(source,"Banco","Você tem interesse em solicitar um Cartão de Crédito?") then
				vRP.UpgradeCardlimit(Passport,2000)
				vRP.GiveItem(Passport,"creditcard-" .. Passport,1,true)
			end
		else
			if vRP.Request(source,"Banco","Você gostaria de solicitar uma segunda via do seu Cartão de Crédito? Isso terá um custo de <b>R$"..parseFormat(500).."</b>.") then
				if vRP.PaymentFull(Passport, 500, "Banco") then
					vRP.GiveItem(Passport,"creditcard-" .. Passport,1,true)
				end
			end
		end
        return
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Bank:DebitCard")
AddEventHandler("Bank:DebitCard", function()
    local source = source
    local Passport = vRP.Passport(source)
	if Passport then
		local Identity = vRP.Identity(Passport)
		if Identity["cardpassword"] == 0 then
			if vRP.Request(source,"Banco","Você tem interesse em solicitar um Cartão de Débito?") then
				local Keyboard = vKEYBOARD.Password(source,"Senha: (4 Dígitos)")
				if Keyboard then
					if vRP.SetCardPassword(Passport, Keyboard[1]) then
						vRP.GiveItem(Passport,"debitcard-" .. Passport,1,true)
					end
				end
			end
		else
			if vRP.Request(source,"Banco","Você gostaria de alterar a senha do seu Cartão de Débito?") then
				local Keyboard = vKEYBOARD.Password(source,"Senha: (4 Dígitos)")
				if Keyboard then
					if vRP.SetCardPassword(Passport, Keyboard[1]) then
						TriggerClientEvent("Notify",source,"verde"," Sua senha foi alterada com sucesso!",5000) 
					end
				end
			else
				if vRP.Request(source,"Banco","Você gostaria de solicitar uma segunda via do seu Cartão de Débito? Isso terá um custo de <b>R$"..parseFormat(500).."</b>.") then
					if vRP.PaymentFull(Passport, 500, "Banco") then
						vRP.GiveItem(Passport,"debitcard-" .. Passport,1,true)
					end
				end
			end
		end
        return
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD DEPENDENTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.AddDependents(Dependent)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Dependent ~= Passport then
		Active[Passport] = true
		local Consulta = vRP.Query('dependents/Check',{ Passport = Passport, Dependent = Dependent })
		if not Consulta[1] then
			local ClosestPed = vRP.Source(Dependent)
			if ClosestPed then
				if vRP.Request(ClosestPed,"Banco","<b>" ..vRP.Identity(Passport).name .. " deseja convida-lo para sua lista de dependentes bancário, você aceita esse convite?","Sim, aceito","Não, obrigado") then
					local Name = vRP.Identity(Dependent).name .. " " .. vRP.Identity(Dependent).name2
					vRP.Query('dependents/Add',{ Passport = Passport, Dependent = Dependent, Name = Name })
					Active[Passport] = nil
					return Name
				end
			end
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVE DEPENDENTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RemoveDependents(Dependent)
	local source = source
	local Passport = vRP.Passport(source)
	TriggerClientEvent('Notify', source, 'vermelho',  Dependent , 5000)
	if Passport and not Active[Passport] then
		Active[Passport] = true
		local Consulta = vRP.Query('dependents/Check',{ Passport = Passport, Dependent = Dependent })
		if Consulta[1] then
			TriggerClientEvent('Notify', source, 'vermelho',  Consulta[1] , 5000)
			vRP.Query('dependents/Remove',{ Passport = Passport, Dependent = Dependent})
			Active[Passport] = nil
			return true
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.TransactionHistory()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		return Transactions(Passport, 50)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANKDEPOSIT
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Deposit(amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] == nil and parseInt(amount) > 0 then
		Active[Passport] = true
		if vRP.PaymentMoney(Passport,amount) then
			vRP.GiveBank(Passport, amount)
		end
		Active[Passport] = nil
		local balance = vRP.Identity(Passport).bank
		local transactions = Transactions(Passport)
		return {balance = balance, transactions = transactions}
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANWITHDRAW
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Withdraw(amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] == nil and parseInt(amount) > 0 then
		Active[Passport] = true
		vRP.WithdrawCash(Passport, amount)
		Active[Passport] = nil
		local balance = vRP.Identity(Passport).bank
		local transactions = Transactions(Passport)
		return {balance = balance, transactions = transactions}
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Transfer(ClosestPed,amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] == nil and parseInt(amount) > 0 then
		Active[Passport] = true
		if vRP.Identity(ClosestPed) and vRP.PaymentBank(Passport, amount, true) then
			vRP.GiveBank(ClosestPed, amount)
		end
		Active[Passport] = nil
		local balance = vRP.Identity(Passport).bank
		local transactions = Transactions(Passport)
		return {balance = balance, transactions = transactions}
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACTION
-----------------------------------------------------------------------------------------------------------------------------------------
function Transactions(Passport, Limit)
	local Passport = Passport
	local transactions = {}
	if not Limit then
		Limit = 4
	end
	local result = vRP.Query('transactions/List',{ Passport = Passport, Limit = Limit })
	if result[1] then
		for i, transaction in pairs(result) do
			local type = transaction.Type
			local date = transaction.Date
			local value = transaction.Value
			local balance = transaction.Balance
			transactions[#transactions + 1] = {
				type = type,
				date = date,
				value = value,
				balance = balance
			}
		end
	end
	return transactions
end
----------------------------------------------------------------------------------------------------------------------------------------
-- DEPENDENTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Dependents(Passport)
	local Passport = Passport
	local dependencies = {}
	local result = vRP.Query('dependents/List',{ Passport = Passport })
	if result[1] then
		for i, record in pairs(result) do
			dependencies[#dependencies + 1] = {
				name = record.Name,
				dependent = record.Dependent
			}
		end
	end
	return dependencies
end
----------------------------------------------------------------------------------------------------------------------------------------
-- FINES
-----------------------------------------------------------------------------------------------------------------------------------------
function Fines(Passport)
	local Passport = Passport
	local fines = {}
	local result = vRP.Query('fines/List',{ Passport = Passport })
	if result[1] then
		for i, row in pairs(result) do
			if row.Value > 0 then
				fines[i] = {
					id = row.id,
					name = row.Name,
					value = row.Value,
					date = row.Date,
					hour = row.Hour,
					message = row.Message
				}
			else
				vRP.Query("fines/Remove",{ Passport = row.Passport ,id = row.id})
			end
		end
	end
	return fines
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.FineList()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		return Fines(Passport)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.FinePayment(id)
	local source = source
	local Passport = vRP.Passport(source)
	local id = id
	if Passport and Active[Passport] == nil then
		Active[Passport] = true
		local result = vRP.Query('fines/Check',{ Passport = Passport, id = id })
		if result[1] then
			if vRP.PaymentBank(Passport, result[1].Value) then
				vRP.Query("fines/Remove",{ Passport = Passport ,id = id})
				Active[Passport] = nil
				return true
			end
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RemoveInFines()
	local source = source
	local Passport = vRP.Passport(source)
	local result = vRP.Query('fines/CheckList',{ Passport = Passport})
	local results = vRP.Query('fines/CheckLists',{ Passport = Passport})
		if #result > 0 then
		if result[1]["Value"] == 0 then
			vRP.Query("fines/Removes",{ id = result[1]["id"],Passport = result[1]["Passport"]}) 
		end 
	else
		return
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.FinePaymentAll()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] == nil then
		Active[Passport] = true
		local result = vRP.Query('fines/List',{ Passport = Passport})
		
		if result[1] then
			for i, row in pairs(result) do
				local id = row.id
				if vRP.PaymentBank(Passport, result[1].Value) then
					vRP.Query("fines/Remove",{ Passport = Passport, id = id })
					Active[Passport] = nil
					return true
				end
			end
		end
		Active[Passport] = nil
	end
	return Fines(Passport)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Taxs(Passport)
	local Passport = Passport
	local taxs = {}
	local result = vRP.Query('taxs/List',{ Passport = Passport })
	if result[1] then
		for i, tax in pairs(result) do
			taxs[i] = {
				id = tax.id,
				name = tax.Name,
				value = tax.Value,
				date = tax.Date,
				hour = tax.Hour,
				message = tax.Message
			}
		end
	end
	return taxs
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.TaxList()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		return Taxs(Passport)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.TaxPayment(id)
	local source = source
	local Passport = vRP.Passport(source)
	local id = id
	if Passport and Active[Passport] == nil then
		Active[Passport] = true
		local result = vRP.Query('taxs/Check',{ Passport = Passport, id = id })
		if result[1] then
			if vRP.PaymentBank(Passport, result[1].Value) then
				vRP.Query("taxs/Remove",{ Passport = Passport, id = id })
				Active[Passport] = nil
				return true
			end
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Invoices(Passport)
	local Passport = Passport
	local invoices = {}
	local result = vRP.Query('invoices/List',{ Passport = Passport })
	if result[1] then
		for i, invoice in pairs(result) do
			if not invoices[invoice.Type] then
				invoices[invoice.Type] = {}
			end
			local id = invoice.id
			local reason = invoice.Reason
			local holder = invoice.Holder
			invoices[invoice.Type][#invoices[invoice.Type] + 1] = {id = id, reason = reason, holder = holder, value = invoice.Value}
		end
	end
	return invoices
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.InvoiceList()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		return Invoices(Passport)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.InvoicePayment(id)
	local source = source
	local Passport = vRP.Passport(source)
	local id = id
	if Passport and Active[Passport] == nil then
		Active[Passport] = true
		local result = vRP.Query('invoices/Check',{ Passport = Passport, id = id })
		if result[1] then
			local Amount = result[1].Value
			if result[1]["Reason"] == "Cartão de Crédito" then
				if vRP.PaymentBank(Passport, Amount) then
					vRP.Query("invoices/Remove",{ Passport = Passport, id = id })
					vRP.DowngradeSpending(Passport, Amount)
					if vRP.Identity(Passport).spending == 0 and math.random(100) <= 50 then
						vRP.UpgradeCardlimit(Passport, parseInt(vRP.Identity(Passport).cardlimit/4))
					else
						vRP.UpgradeCardlimit(Passport, Amount)
					end
					Active[Passport] = nil
					return true
				end
			else
				if vRP.PaymentBank(Passport, Amount) then
					vRP.Query("invoices/Remove",{ Passport = Passport, id = id })
					vRP.GiveBank(result[1]['Received'], Amount)
					Active[Passport] = nil
					return true
				end
			end
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD DEPENDENTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.MakeInvoice(OtherPassport, value, reason)
	local source = source
	local Passport = vRP.Passport(source)
	local OtherPassport = OtherPassport
	if Passport and not Active[Passport]  and parseInt(value) > 0 then
		Active[Passport] = true
		local ClosestPed = vRP.Source(OtherPassport)
		if ClosestPed then
			if vRP.Request(ClosestPed,"Banco","<b>" .. vRP.Identity(Passport).name .. "	" .. vRP.Identity(Passport).name2 .. "</b> lhe enviou uma fatura de <b>R$" .. parseFormat(value) .. "</b>, deseja aceita-la?","Sim, aceito","Não, obrigado") then
				vRP.Query('invoices/Add',{ 
					Passport = OtherPassport, 
					Received = Passport, 
					Type = "received", 
					Reason = reason, 
					Holder = vRP.Identity(Passport).name .. " " .. vRP.Identity(Passport).name2,
					Value = value
				})
				vRP.Query('invoices/Add',{ 
					Passport = Passport, 
					Received = Passport, 
					Type = "sent", 
					Reason = reason, 
					Holder = vRP.Identity(OtherPassport).name .. " " .. vRP.Identity(OtherPassport).name2,
					Value = value
				})
				return Invoices(Passport)
			end
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
--  INVESTMENTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Investments()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local investment = vRP.Query('investments/Check',{ Passport = Passport })
		if investment[1] then
			local deposit = investment[1].Deposit
			local liquid = investment[1].Liquid
			local brute = deposit
			local total = deposit + liquid
			return {
				["deposit"] = deposit,
				["liquid"] = liquid,
				["brute"] = brute,
				["total"] = total
			}
		end
		return {
			["deposit"] = 0,
			["liquid"] = 0,
			["brute"] = 0,
			["total"] = 0
		}
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD INVESTMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Invest(amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and parseInt(amount) > 0 then
		Active[Passport] = true
		if vRP.PaymentBank(Passport, amount, true) then
			local investment = vRP.Query('investments/Check',{ Passport = Passport })
			if  investment[1] then
				local Value = amount
				vRP.Query("investments/Invest",{ Passport = Passport, Value = Value })
			else
				local Deposit = amount
				vRP.Query("investments/Add",{ Passport = Passport, Deposit = Deposit })
			end
			Active[Passport] = nil
			return true
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM INVESTMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.InvestRescue()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		Active[Passport] = true
		local investment = vRP.Query('investments/Check',{ Passport = Passport })
		if  investment[1] then
			vRP.Query("investments/Remove", {Passport = Passport})
			vRP.GiveBank(Passport, investment[1].Deposit + investment[1].Liquid)
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTRANSACTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddTransactions", function(Passport, Type, amount)
	if vRP.Identity(Passport) then
		local Passport = Passport
		local Type = Type
		local Date = os.date("%d/%m/%Y")
		local Value = amount
		local Balance = vRP.Identity(Passport).bank
		vRP.Query("transactions/Add", {Passport = Passport,Type = Type,Date = Date,Value = Value,Balance = Balance})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTAXS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddTaxs", function(Passport, Name, Value, Message)
	if vRP.Identity(Passport) then
		local Passport = Passport
		local Name = Name
		local Date = os.date("%d/%m/%Y")
		local Hour = os.date("%H:%M")
		local Value = Value
		local Message = Message
		vRP.Query("taxs/Add", {Passport = Passport,Name = Name,Date = Date,Hour = Hour,Value = Value,Message = Message}) 
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTAXS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddFines", function(Passport, OtherPassport, Value, Message)
	if vRP.Identity(Passport) then
		local Passport = Passport
		local Name = vRP.Identity(OtherPassport).name .. " " .. vRP.Identity(OtherPassport).name2
		local Date = os.date("%d/%m/%Y")
		local Hour = os.date("%H:%M")
		local Value = Value
		local Message = Message
		vRP.Query("fines/Add", {Passport = Passport,Name = Name,Date = Date,Hour = Hour,Value = Value,Message = Message}) 
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport)
	if Active[Passport] then
		Active[Passport] = nil
	end
end)
exports("Taxs", Taxs)
exports("Fines", Fines)
exports("Invoices", Invoices)
exports("Dependents", Dependents)
exports("Transactions", Transactions)

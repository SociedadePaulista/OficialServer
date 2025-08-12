-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GiveBank(Passport, Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 then
        exports.bank:AddTransactions(Passport, "entry", Amount)
        if Characters[Source] then
            Characters[Source].bank = Characters[Source].bank + Amount
        end
        vRP.Query("characters/addBank", { Passport = Passport, amount = Amount })
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.RemoveBank(Passport, Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 then
        vRP.Query("characters/remBank", { Passport = Passport, amount = Amount })
        exports.bank:AddTransactions(Passport, "exit", Amount)
        if Characters[Source] then
            Characters[Source].bank = Characters[Source].bank - Amount
            if 0 > Characters[Source].bank then
                Characters[Source].bank = 0
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetBank(source)
    if Characters[source] then
        return Characters[source].bank
    end
    return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTGEMS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentGems(Passport, Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 and Characters[Source] and Amount <= vRP.UserGemstone(Characters[Source].license) then
        vRP.Query("accounts/RemoveGems", { license = Characters[Source].license, gems = Amount })
        TriggerClientEvent("hud:RemoveGems", Source, Amount)
        return true
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentBank(Passport,Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 and Characters[Source] and Amount <= Characters[Source]["bank"] then
        vRP.RemoveBank(Passport,Amount,(Source))
        return true
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMONEY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentMoney(Passport,Amount)
	if parseInt(Amount) > 0 then 
        if Amount <= vRP.ItemAmount(Passport,"dollars") then
            local Inventory = vRP.Inventory(Passport)
            for k,v in pairs(Inventory) do
                if splitString(v["item"], "-")[1] == "dollars" then
                    if Amount <= v["amount"] then
                        Inventory[k]["amount"] = v["amount"] - Amount
                        if Inventory[k]["amount"] <= 0 then
                            Inventory[k] = nil
                        end
                        Amount = Amount - Amount
                    else
                        Amount = Amount - v["amount"]
                        Inventory[k] = nil
                    end
                elseif itemChest(v["item"]) and v["data"] then
                    for Slot,Value in pairs(v["data"]) do
                        if splitString(Value["item"], "-")[1] == "dollars" then
                            if Amount <= Value["amount"] then
                                Inventory[k]["data"][Slot]["amount"] = Value["amount"] - Amount
                                if Inventory[k]["data"][Slot]["amount"] <= 0 then
                                    Inventory[k]["data"][Slot] = nil
                                end
                                Amount = Amount - Amount
                            else
                                Amount = Amount - Value["amount"]
                                Inventory[k]["data"][Slot] = nil
                            end
                        end
                    end
                end
            end
            return Amount <= 0
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTCREDIT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentCredit(Passport,Amount,Type)
	if parseInt(Amount) > 0 then
		if vRP.Identity(Passport)["cardlimit"] >= parseInt(Amount) then
            vRP.UpgradeSpending(Passport, Amount)
            vRP.DowngradeCardlimit(Passport, Amount)
            vRP.Query('invoices/Add',{ Passport = Passport, Received = "CreditCard", Type = "received", Reason = "Cartão de Crédito", Holder = "Loja: " ..(Type or "Fisica") , Value = parseInt(Amount) })
			return true
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTFULL
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentFull(Passport, Amount, Type)
    local Source = vRP.Source(Passport)
    if parseInt(Amount) >= 1 then
        for Key,Value in pairs(vRP.Inventory(Passport)) do
            if SplitOne(Value["item"]) == "debitcard" or SplitOne(Value["item"]) == "creditcard" then
                local Identity = vRP.Identity(parseInt(SplitTwo(Value["item"]))) 
                if Passport == parseInt(SplitTwo(Value["item"])) or SplitOne(Value["item"]) == "creditcard" and vRP.Dependents(Passport,Dependent) then
                    if vRP.Request(Source,"Pagamento","Pagar Com "..itemName(Value["item"]).."<br> em nome de "..Identity["name"].." "..Identity["name2"].."<br><b>R$"..parseFormat(Amount).."</b> reais?") then 
                        if SplitOne(Value["item"]) == "debitcard" then
                            if vRP.PaymentBank(parseInt(SplitTwo(Value["item"])),parseInt(Amount)) then
                                return true
                            else
                                TriggerClientEvent("Notify",Source,"vermelho","<b>Saldo Bancário</b> insuficientes.",5000,"Liso")
                            end
                        else
                            if vRP.PaymentCredit(parseInt(SplitTwo(Value["item"])),parseInt(Amount),Type) then
                                return true
                            else
                                TriggerClientEvent("Notify",Source,"vermelho","<b>Limite Cartão</b> insuficientes.",5000,"Liso")
                            end
                        end
                    end
                end
            end
        end
        if vRP.PaymentMoney(Passport,parseInt(Amount)) then
            return true
        else
            TriggerClientEvent("Notify",Source,"vermelho","<b>Reais</b> insuficientes.",5000,"Liso")
        end
    end
    return
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WITHDRAWCASH
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.WithdrawCash(Passport, Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 and Characters[Source] and Amount <= Characters[Source].bank then
        vRP.GenerateItem(Passport, "dollars", Amount, true)
        vRP.RemoveBank(Passport, Amount,Source)
        return true
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEPENDENTS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Dependents(Passport,Dependent)
    if Dependents[Passport] == nil then
        local Consult = vRP.Query('dependents/Check',{ Passport = Passport, Dependent = Dependent })
		if Consult[1] then
			Dependents[Passport] = Consult[1]
		end
	end
    return Dependents[Passport]
end
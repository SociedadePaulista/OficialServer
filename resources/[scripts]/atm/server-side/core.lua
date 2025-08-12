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
Tunnel.bindInterface("atm",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Bank()
	local Source = source
	local Passport = vRP.Passport(Source)
	if Passport then
		for Key,Value in pairs(vRP.Inventory(Passport)) do
            if SplitOne(Value["item"]) == "debitcard" then
                local Identity = vRP.Identity(parseInt(SplitTwo(Value["item"]))) 
                if Passport == parseInt(SplitTwo(Value["item"])) then
                    if vRP.Request(Source,"Pagamento","Você deseja acessar o caixa eletrônico com o cartão que está em nome de <b>"..Identity.name.." "..Identity.name2.."</b>?") then 
						return { Password = Identity.cardpassword, Balance = Identity.bank }
                    end
                end
            end
        end
		TriggerClientEvent("Notify",Source,"amarelo","Precisa de um <b>Cartão de Débito</b>.",5000)
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANKDEPOSIT
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Deposit(amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] == nil then
		if parseInt(amount) > 0 then
			Active[Passport] = true
			if vRP.PaymentMoney(Passport,amount) then
				vRP.GiveBank(Passport, amount)
			end
			Active[Passport] = nil
		end
	end
	return vRP.Identity(Passport).bank
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANWITHDRAW
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Withdraw(amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] == nil  then
		if parseInt(amount) > 0 then
			Active[Passport] = true
			vRP.WithdrawCash(Passport, amount)
			Active[Passport] = nil
		end
	end
	return vRP.Identity(Passport).bank
end
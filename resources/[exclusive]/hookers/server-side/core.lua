-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-------------------------------------------------------------------------------
-- Get Money / Remove money
-------------------------------------------------------------------------------
RegisterServerEvent('sawu_hookers:pay')
AddEventHandler('sawu_hookers:pay', function(boolean)
    local source = source
	local Passport = vRP.Passport(source)
    if boolean == true then
        if vRP.PaymentFull(Passport, Config.BlowjobPrice, "BlowjobPrice") then
            TriggerClientEvent('sawu_hookers:startBlowjob', source)
        else
            TriggerClientEvent('sawu_hookers:noMoney', source)
        end  
    else
        if vRP.PaymentFull(Passport, Config.SexPrice, "SexPrice") then
            TriggerClientEvent('sawu_hookers:startSex', source)
        else
            TriggerClientEvent('sawu_hookers:noMoney', source)
        end 
    end
end)
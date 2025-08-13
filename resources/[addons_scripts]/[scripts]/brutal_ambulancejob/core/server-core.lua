
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
Tunnel.bindInterface("ambulancejob",Creative)


function GetIdentifier(source)
    local xPlayer = vRP.Passport(source)
    return xPlayer
end


function GetAccountMoney(source, account)
    local xPlayer = vRP.Passport(source)
    if account == 'bank' then
        return vRP.GetBank(source)
    elseif account == 'money' then
        return vRP.InventoryItemAmount(xPlayer, 'dollars')[1]
    end
end

function AddMoneyFunction(source, account, amount)
    local xPlayer = vRP.Passport(source)
    if account == 'bank' then
        vRP.GiveBank(xPlayer, amount)
    elseif account == 'money' then
        vRP.GenerateItem(xPlayer, 'dollars', amount, true)
    end
end

function GetItemCount(source, item)
    local xPlayer = vRP.Passport(source)
    return vRP.InventoryItemAmount(xPlayer, item)[1]
end

function RemoveAccountMoney(source, account, amount)
    local xPlayer = vRP.Passport(source)
    if account == 'bank' then
        vRP.RemoveBank(xPlayer, amount)
    elseif account == 'money' then
        vRP.TakeItem(xPlayer, 'dollars', amount)
    end
end

function RemoveItem(source, item, amount)
    local xPlayer = vRP.Passport(source)
    vRP.TakeItem(xPlayer, item, amount)
end

function AddItem(source, item, count)
    local xPlayer = vRP.Passport(source)
    vRP.GenerateItem(xPlayer, item, count)
end

function GetPlayerNameFunction(source)
    local xPlayer = vRP.Passport(source)
    local identity = vRP.Identity(xPlayer)
    return identity.name.." "..identity.name2
end



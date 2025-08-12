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
Tunnel.bindInterface("washing",Creative)
vCLIENT = Tunnel.getInterface("washing")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Washing()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Keyboard = vKEYBOARD.Primary(source,"Quanto dinheiro você deseja lavar?")
        if Keyboard then
            local taxaMaquina = 1.0 
            if tonumber(Keyboard[1]) > 0 then 
                if vRP.TakeItem(Passport, "dollars2", tonumber(Keyboard[1])) then
                    TriggerClientEvent("Progress", source, 10000)
                    SetTimeout(10000, function()
                        vRP.GenerateItem(Passport,"dollars",parseInt(tonumber(Keyboard[1]) * taxaMaquina),true)
                        TriggerClientEvent("Notify", source, "azul", "Você lavou <b>$"..tonumber(Keyboard[1]).."</b> Dinheiro sujo.\n E recebeu <b>$"..parseInt(tonumber(Keyboard[1]) * taxaMaquina).."</b> de dinheiro limpo.", 5000)
                    end)
                else
                    TriggerClientEvent("Notify", source, "amarelo", "Você não possui <b>dinheiro sujo</b> na mochila.", 4500)
                end
            else
                TriggerClientEvent("Notify", source, "verde", "Você precisa inserir um valor válido para confirmar sua solicitação.", 4500)
            end
        end
    end
end
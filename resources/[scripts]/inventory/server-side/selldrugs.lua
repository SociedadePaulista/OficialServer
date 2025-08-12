bancadas = {}

local dinheiro = { -- valor de cada droga (1 qtd)
    ["joint"] = 80,
    ["meth"] = 80,
    ["cocaine"] = 80
}
local drogas = { -- drogas disponiveis para colocar na bancada
    "joint",
    "meth",
    "cocaine"
}

function Creative.getBancadas()
    return bancadas
end

function Creative.getPermission()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
        local Service,Total = vRP.NumPermission("Policia")
        if Total >= 2 then
            return true
        else
            TriggerClientEvent("Notify",source,"amarelo","Contingente indisponível.",5000,"Atenção")
        end
    end
    return false
end

function Creative.getDroga(perm)
    return drogas[perm],itemName(drogas[perm])
end

function Creative.getDrugs()
    local source = source
    local Passport = vRP.Passport(source)
    local Keyboard = vKEYBOARD.Primary(source,"Digite a droga que será adicionada à bancada:")
    if Keyboard then
        local Drug = Keyboard[1]
        local drugname = itemName(Keyboard[1])
        if not checkDroga(Keyboard[1]) then
            TriggerClientEvent("Notify",source,"amarelo","Droga inválida!",5000)
            return 0
        end
        local Keyboard = vKEYBOARD.Primary(source,"Digite a quantidade de "..drugname.." para ser vendida: ")
        if Keyboard then
            local amount = parseInt(Keyboard[1])
            if amount > 0 and bancadas[source].amount + amount <= 20 and vRP.TakeItem(Passport,Drug,amount,true) then
                if bancadas[source].drugs[Drug] then
                    bancadas[source].drugs[Drug] = bancadas[source].drugs[Drug] + amount
                    bancadas[source].amount = bancadas[source].amount + amount
                else
                    bancadas[source].drugs[Drug] = amount
                    bancadas[source].amount = bancadas[source].amount + amount
                end
                vCLIENT.updateBancadas(-1,bancadas)
                return amount
            else
                TriggerClientEvent("Notify",source,"amarelo","Quantidade inválida.",5000)
            end
        end
    end
   
    return 0
end

function Creative.removeDrugs()
    local source = source
    local Passport = vRP.Passport(source)
    local Keyboard = vKEYBOARD.Primary(source,"Digite a droga que será recolhida da bancada: ")
    if Keyboard then
        local Drug = Keyboard[1]
        local drugname = itemName(Drug)
        if not checkDroga(Drug) then
            TriggerClientEvent("Notify",source,"amarelo","Droga inválida!",5000)
            return
        end
        local Keyboard = vKEYBOARD.Primary(source,"Digite a quantidade de "..drugname.." para recolher: ")
        if Keyboard then
            local amount = parseInt(Keyboard[1])
            if amount > 0 then
                if not bancadas[source].drugs[Drug] or bancadas[source].drugs[Drug] < amount then
                    TriggerClientEvent("Notify",source,"amarelo","Não há <b>"..amount.."x "..drugname.."</b> na bancada!",5000)
                    return false
                end
                if vRP.InventoryWeight(Passport) + itemWeight(Drug)*amount <= vRP.GetWeight(Passport) then
                    bancadas[source].drugs[Drug] = bancadas[source].drugs[Drug] - amount
                    bancadas[source].amount = bancadas[source].amount - amount
                    vRP.GenerateItem(Passport,Drug,amount)
                    vCLIENT.updateBancadas(-1,bancadas)
                    return amount
                else
                    TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Quantidade inválida.")
            end
            return false
        end
    end
end

function getBancadaWeight(bancada)
    local weight = 0
    for item,qtd in pairs(bancada) do 
        local peso = (itemWeight(item) or 0) * qtd
        weight = weight + peso
    end
    return weight
end

function Creative.canRemoveBancada()
    local source = source
    local Passport = vRP.Passport(source)
    if bancadas[source] then
        local bancadaPeso = getBancadaWeight(bancadas[source].drugs)
        if vRP.InventoryWeight(Passport) + bancadaPeso <= vRP.GetWeight(Passport) then
            return true
        end
    end
    return false
end

function Creative.createBancada(cds)
    local source = source
    local Passport = vRP.Passport(source)
    bancadas[source]= { drugs = {}, coords = cds, amount = 0 }
    vCLIENT.updateBancadas(-1,bancadas)
end

function Creative.removeBancada(noItems)
    local source = source
    local Passport = vRP.Passport(source)
    if not noItems and bancadas[source].amount > 0 then
        local pesoBancada = getBancadaWeight(bancadas[source].drugs)
        if vRP.InventoryWeight(Passport) + pesoBancada <= vRP.GetWeight(Passport) then
            for k,v in pairs(bancadas[source].drugs) do
                vRP.GenerateItem(Passport,k,parseInt(v))
            end
        else
            TriggerClientEvent("Notify",source,"amarelo","Espaço insuficiente.",500)
            return false
        end
    end
    bancadas[source] = nil 
    vCLIENT.updateBancadas(-1,bancadas)
    return true
end

function Creative.tryRemoveBancada(i,netent)
    local source = source
    local Passport = vRP.Passport(source)
    if bancadas[i] then
        local online = false
        if bancadas[i].amount > 0 then
            for k,v in pairs(bancadas[i].drugs) do
                vRP.GenerateItem(Passport,k,parseInt(v))
            end
        end
        if vRP.Passport(i) then
            online = true
            vCLIENT.forceRemoveBancada(i)
        else
            Creative.tryDeleteEntity(netent)
        end
        bancadas[i] = nil 
        vCLIENT.updateBancadas(-1,bancadas)
        if online then
            return 1
        else
            return 2
        end
    end
    return 0
end

function genTransaction(source)
    local qtd = math.random(2,4)
    local droga = drogas[math.random(#drogas)]
    local chance = math.random(100)
    if chance <= 70 then
        local timeout = 5000
        while not bancadas[source].drugs[droga] or bancadas[source].drugs[droga] < qtd do
            qtd = math.random(2,4)
            droga = drogas[math.random(#drogas)]
            timeout = timeout - 100
            if timeout <= 0 then
                break
            end
            Wait(100)
        end
    end
    return qtd,droga
end

function Creative.sellDrug()
    local source = source
    local Passport = vRP.Passport(source)
    if bancadas[source] and bancadas[source].amount > 0 then
        local qtd,droga = genTransaction(source)
        if bancadas[source].drugs[droga] and bancadas[source].drugs[droga] >= qtd then
            bancadas[source].drugs[droga] = bancadas[source].drugs[droga] - qtd
            bancadas[source].amount = bancadas[source].amount - qtd
            local money = dinheiro[droga] * qtd
            vRP.GenerateItem(Passport,"dollars2",money)
            vCLIENT.notify(source,"Ta na mão, ~g~R$ "..parseFormat(money).." ~w~por "..qtd.."x ~r~"..itemName(droga))
            vCLIENT.updateBancadas(-1,bancadas)
            return qtd
        else
            vCLIENT.notify(source,"Cadê as minhas "..qtd.."x "..itemName(droga).." no bagulho!")
        end
    else
        vCLIENT.notify(source,"Não tem mais droga no bagulho")
    end
    return false
end



function Creative.callPmesp()
	local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if math.random(100) >= 70 then
            TriggerEvent("Wanted",source,Passport,300)
            local Coords = GetEntityCoords(GetPlayerPed(source))
            local Service = vRP.NumPermission("Policia")
            for Passports,Sources in pairs(Service) do
                async(function()
                    vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                    TriggerClientEvent("NotifyPush",Sources,{ code = "QRU", title = "Denúncia Anônima", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Suspeita de tráfico de drogas", time = "Recebido às "..os.date("%H:%M"), blipColor = 16 })
                end)
            end
        end
    end
end


function Creative.tryDeleteEntity(netent)
    vCLIENT.deleteEntity(-1,netent)
end

function checkDroga(droga)
    for i in ipairs(drogas) do
        if droga == drogas[i] then
            return true
        end
    end
    return false
end





local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("spawn",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Global = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Characters()
    local source = source
    local license = vRP.Identities(source)
    TriggerEvent("vRP:BucketServer", source, "Enter", source)
    local query = vRP.Query("characters/Characters", { license = license })
    if query and query[1] then
        local values = {}
        for k, v in pairs(query) do
            values[#values + 1] = { Passport = v.id, Skin = vRP.UserData(v.id, "Datatable").Skin, Nome = v.name.." "..v.name2, Sexo = v.sex, Blood = Sanguine(v.blood), Clothes = vRP.UserData(v.id, "Clothings"), Barber = vRP.UserData(v.id, "Barbershop"), Tattoos = vRP.UserData(v.id, "Tatuagens"), Banco = v.bank }
        end
        return values
    end
    return {}
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CharacterChosen(user_id)
    local source = source
    local license = vRP.Identities(source)
    local query = vRP.Query("characters/UserLicense", { id = user_id, license = license})
    if query and query[1] then
        TriggerEvent("vRP:BucketServer", source, "Exit")
        vRP.CharacterChosen(source, user_id)
        return true
    else
        DropPlayer(source, "Conectando em personagem irregular.")
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NEWCHARACTER
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.NewCharacter(name, name2, sex)
    local source = source
    if not Global[source] then
        Global[source] = true
        local license = vRP.Identities(source)
        local account = vRP.Account(license)
        local query = vRP.Query("characters/countPersons", { license = license })
        
        if parseInt(account.chars +  parseInt(account["chars"])) <= parseInt(query[1].qtd) then
            TriggerClientEvent("Notify", source, "amarelo", "Limite de personagem atingido.", 3000)
            Global[source] = nil
            return false
        end
        
        local sexo = "F"
        if sex == "mp_m_freemode_01" then
            sexo = "M"
        end
        
        vRP.Query("characters/newCharacter", { license = license, name = name, sex = sexo, name2 = name2, phone = vRP.GeneratePhone(), blood = math.random(4) })
        local id = vRP.Query("characters/lastCharacters", { license = license })
        if id[1] then
            TriggerEvent("vRP:BucketServer", source, "Exit")
            vRP.CharacterChosen(source, id[1].id, sex)
        end
        Global[source] = nil
        return true
    end
end
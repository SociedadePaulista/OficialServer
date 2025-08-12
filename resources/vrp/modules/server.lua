-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMER
-----------------------------------------------------------------------------------------------------------------------------------------
local Timer = {}
local EntitysObject = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEEDRETURN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.WeedReturn(Passport)
    if Timer[Passport] then
        if os.time() < Timer[Passport] then
            return parseInt(Timer[Passport] - os.time())
        else
            Timer[Passport] = nil
        end
    end
    return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEEDTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.WeedTimer(Passport, Time)
    if Timer[Passport] then
        Timer[Passport] = Timer[Passport] + Time * 60
    else
        Timer[Passport] = os.time() + Time * 60
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEMICALRETURN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ChemicalReturn(Passport)
    if Timer[Passport] then
        if os.time() < Timer[Passport] then
            return parseInt(Timer[Passport] - os.time())
        else
            Timer[Passport] = nil
        end
    end
    return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEMICALTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ChemicalTimer(Passport, Time)
    if Timer[Passport] then
        Timer[Passport] = Timer[Passport] + Time * 60
    else
        Timer[Passport] = os.time() + Time * 60
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALCOHOLRETURN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.AlcoholReturn(Passport)
    if Timer[Passport] then
        if os.time() < Timer[Passport] then
            return parseInt(Timer[Passport] - os.time())
        else
            Timer[Passport] = nil
        end
    end
    return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALCOHOLTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.AlcoholTimer(Passport, Time)
    if Timer[Passport] then
        Timer[Passport] = Timer[Passport] + Time * 60
    else
        Timer[Passport] = os.time() + Time * 60
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPERIENCELIST
-----------------------------------------------------------------------------------------------------------------------------------------
local ExperienceList = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PUTEXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PutExperience(Passport,experience,Amount)
	local Passport = parseInt(Passport)
	if ExperienceList[Passport][experience] == nil then
		ExperienceList[Passport][experience] = 0
	end
	ExperienceList[Passport][experience] = ExperienceList[Passport][experience] + Amount
    TriggerEvent("pause:AddPoints", Passport, Amount)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKEXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetExperience(Passport,experience)
	local Passport = parseInt(Passport)
	if ExperienceList[Passport][experience] == nil then
		ExperienceList[Passport][experience] = 0
	end
	return parseInt(ExperienceList[Passport][experience])
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	ExperienceList[Passport] = vRP.UserData(Passport,"Experience")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport,source)
	if ExperienceList[Passport] then
		vRP.Query("playerdata/SetData",{ Passport = parseInt(Passport), dkey = "Experience", dvalue = json.encode(ExperienceList[Passport]) })
		ExperienceList[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Groups()
    return Groups
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DATAGROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DataGroups(Permission)
    return vRP.GetSrvData("Permissions:" ..Permission)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetUserType(Passport, Type)
    for k, v in pairs(Groups) do
        local Datatable = vRP.GetSrvData("Permissions:" .. k)
        if Groups[k].Type and Groups[k].Type == Type and Datatable[tostring(Passport)] then
            return k
        end
    end
    return
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HIERARCHY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Hierarchy(Permission)
    if Groups[Permission] and Groups[Permission].Hierarchy then
        return Groups[Permission].Hierarchy
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.NumPermission(Permission,Level)
	local Amount = 0
    local Services = {}
	if Groups[Permission] then
        for k,v in pairs(Groups[Permission]["Parent"]) do
            local List = vRP.GetSrvData("Permissions:" .. k)
			for Passport in pairs(List) do
				if not Level or List[Passport] <= Level then
					if vRP.HasService(Passport, Permission) then
						Services[Passport] = vRP.Source(Passport)
						Amount = Amount + 1
					end
                end
			end
        end
    end
    return Services, Amount
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICETOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ServiceToggle(Source, Passport, Permission, Silenced)
    local Perm = splitString(Permission, "-")
    if (Characters[Source] and Groups[Perm[1]]) and Groups[Perm[1]].Service then
        if Groups[Perm[1]].Service[tostring(Passport)] == Source then
            vRP.ServiceLeave(Source, tostring(Passport), Perm[1], Silenced)
        else
            if vRP.HasGroup(tostring(Passport), Perm[1]) and not Groups[Perm[1]].Service[tostring(Passport)] then
                vRP.ServiceEnter(Source, tostring(Passport), Perm[1], Silenced)
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICEENTER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ServiceEnter(Source, Passport, Permission, Silenced)
    if Characters[Source] then

        Player(Source)["state"][Permission] = true
        TriggerClientEvent("service:Label", Source, Permission, "Sair de Serviço")

        if GroupBlips[Permission] then
            TriggerEvent("blipsystem:Enter", Source, Permission, true)
        end

        if Groups[Permission] and Groups[Permission]["Salary"] then
            TriggerEvent("Salary:Add", tostring(Passport), Permission)
        end
        
        if Groups[Permission]["Service"] then
            Groups[Permission]["Service"][tostring(Passport)] = Source
        end

        if not Silenced then
            TriggerClientEvent("Notify", Source, "verde", "Entrou em serviço.", 5000)
        end
    end
end
---------------------------------i--------------------------------------------------------------------------------------------------------
-- SERVICELEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ServiceLeave(Source, Passport, Permission, Silenced)
    if Characters[Source] then

        Player(Source)["state"][Permission] = false
        TriggerClientEvent("service:Label", Source, Permission, "Entrar em Serviço")

        if GroupBlips[Permission] then
            TriggerEvent("blipsystem:Exit", Source)
            TriggerClientEvent("radio:RadioClean", Source)
        end
        if Groups[Permission] and Groups[Permission].Salary then
            TriggerEvent("Salary:Remove", tostring(Passport), Permission)
        end
        if Groups[Permission].Service and Groups[Permission].Service[tostring(Passport)] then
            Groups[Permission].Service[tostring(Passport)] = nil
        end
        if not Silenced then
            TriggerClientEvent("Notify", Source, "verde", "Saiu de serviço.", 5000)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetPermission(Passport, Permission, Level, Mode)
    local Datatable = vRP.GetSrvData("Permissions:" .. Permission)
    if Groups[Permission] then
        if Mode then
            if "Demote" == Mode then
                Datatable[tostring(Passport)] = Datatable[tostring(Passport)] + 1
                
                if Datatable[tostring(Passport)] > #Groups[Permission]["Hierarchy"] then
                    Datatable[tostring(Passport)] = #Groups[Permission]["Hierarchy"]
                end
            else
                Datatable[tostring(Passport)] = Datatable[tostring(Passport)] - 1
                
                if Datatable[tostring(Passport)] > #Groups[Permission]["Hierarchy"] then
                    Datatable[tostring(Passport)] = #Groups[Permission]["Hierarchy"]
                end
            end
        else
            if Level then
                Level = parseInt(Level)
                if #Groups[Permission]["Hierarchy"] < Level then 
                    Level = #Groups[Permission]["Hierarchy"]
                    Datatable[tostring(Passport)] = Level
                else
                    Datatable[tostring(Passport)] = Level
                end
            end
            if not Level then
                Datatable[tostring(Passport)] = #Groups[Permission]["Hierarchy"]
            end
        end
        vRP.ServiceEnter(vRP.Source(Passport), tostring(Passport), Permission, true)
        vRP.Query("entitydata/SetData", { dkey = "Permissions:" .. Permission, dvalue = json.encode(Datatable) })
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.RemovePermission(Passport, Permission)
    local Datatable = vRP.GetSrvData("Permissions:" ..Permission)
    if Groups[Permission] then
        if Groups[Permission].Service and Groups[Permission].Service[tostring(Passport)] then
            Groups[Permission].Service[tostring(Passport)] = nil
        end
        if Datatable[tostring(Passport)] then
            Datatable[tostring(Passport)] = nil
            vRP.ServiceLeave(vRP.Source(tostring(Passport)), tostring(Passport), Permission, true)
            vRP.Query("entitydata/SetData", { dkey = "Permissions:" .. Permission, dvalue = json.encode(Datatable) })
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.HasPermission(Passport, Permission, Level)
    local Datatable = vRP.GetSrvData("Permissions:" ..Permission)
    if Datatable[tostring(Passport)] then
        if not Level or not (Datatable[tostring(Passport)] > parseInt(Level)) then
            return tonumber(Datatable[tostring(Passport)])
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.HasGroup(Passport, Permission, Level)
    if Groups[Permission] then
        for k, v in pairs(Groups[Permission]["Parent"]) do
            local Datatable = vRP.GetSrvData("Permissions:" .. k)
            if Datatable[tostring(Passport)] then
                if not Level or Datatable[tostring(Passport)] <= parseInt(Level) then
                    return true
                end
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.HasService(Passport, Permission)
    if Groups[Permission] then
        for k,v in pairs(Groups[Permission]["Parent"]) do
            if Groups[k]["Service"] and Groups[k]["Service"][tostring(Passport)] then
                return true
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect", function(Passport, Source)
    for Key,Value in pairs(Groups) do
        if Value["Type"] ~= "Policia" and Value["Type"] ~= "Hospital" and Value["Type"] ~= "Mecanica" then
            if vRP.HasPermission(Passport, Key) then
                vRP.ServiceEnter(Source, Passport, Key, true)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport, Source)
    for Permission in pairs(Groups) do
        if Groups[Permission]["Service"] and Groups[Permission]["Service"][tostring(Passport)] then
            if GroupBlips[Permission] then
                TriggerEvent("blipsystem:Exit", Source)
            end
            Groups[Permission]["Service"][tostring(Passport)] = false
        end
        if Groups[Permission] and Groups[Permission]["Salary"] then
            TriggerEvent("Salary:Remove", tostring(Passport), Permission)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FALSEIDENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.FalseIdentity(Passport)
    if Identity[Passport] == nil then
        local Consult =  vRP.Query("fidentity/Result", { id = Passport })
        if Consult[1] then
            Identity[Passport] = Consult[1]
        end
    end
    return Identity[Passport] or false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Identity(Passport)
    local Source = vRP.Source(Passport)
    if Characters[Source] then
        return Characters[Source] or false
    else
        if Identity[Passport] == nil then
            local Consult = vRP.Query("characters/Person", { id = Passport })
            if Consult[1] then
                Identity[Passport] = Consult[1]
            end
        end
        return Identity[Passport] or false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADESPENDING
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeSpending(Passport, Amount)
    local Source = vRP.Source(Passport)
    if parseInt(Amount) > 0 then
        vRP.Query("characters/UpgradeSpending", { Passport = Passport, spending = parseInt(Amount) })
        if Characters[Source] then
            Characters[Source].spending = Characters[Source].spending + parseInt(Amount)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADESPENDING
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DowngradeSpending(Passport, Amount)
    local Source = vRP.Source(Passport)
    if parseInt(Amount) > 0 then
        vRP.Query("characters/DowngradeSpending", { Passport = Passport, spending = parseInt(Amount) })
        if Characters[Source] then
            Characters[Source].spending = Characters[Source].spending - parseInt(Amount)
            if 0 >= Characters[Source].spending then
                Characters[Source].spending = 0
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADECARDLIMIT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeCardlimit(Passport, Amount)
    local Source = vRP.Source(Passport)
    if parseInt(Amount) > 0 then
        vRP.Query("characters/UpgradeCardlimit", { Passport = Passport, cardlimit = parseInt(Amount) })
        if Characters[Source] then
            Characters[Source].cardlimit = Characters[Source].cardlimit + parseInt(Amount)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADECARDLIMIT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DowngradeCardlimit(Passport, Amount)
    local Source = vRP.Source(Passport)
    if parseInt(Amount) > 0 then
        vRP.Query("characters/DowngradeCardlimit", { Passport = Passport, cardlimit = parseInt(Amount) })
        if Characters[Source] then
            Characters[Source].cardlimit = Characters[Source].cardlimit - parseInt(Amount)
            if 0 >= Characters[Source].cardlimit then
                Characters[Source].cardlimit = 0
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetCardPassword(Passport, Password)
    local Source = vRP.Source(Passport)
    local Password = sanitizeString(Password,"0123456789",true)
    if string.len(Password) == 4 then
        if Characters[Source] then
            Characters[Source].cardpassword = Password
        end
        exports.oxmysql:query_async("UPDATE characters SET cardpassword = @Password WHERE id = @Passport",{ Passport = Passport, Password = Password })
        return true
    else
        TriggerClientEvent("Notify",Source,"amarelo","Necessário possuir <b>4</b> números.",5000)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADECHARS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeChars(source)
    if Characters[source] then
        vRP.Query("accounts/infosUpdatechars", { license = Characters[source].license })
        Characters[source].chars = Characters[source].chars + 1
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USERGEMSTONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UserGemstone(License)
    return vRP.Account(License).gems or 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADEGEMSTONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeGemstone(Passport, Amount)
    local Source = vRP.Source(Passport)
    local License = vRP.Identity(Passport)
    if parseInt(Amount) > 0 and License then
        vRP.Query("accounts/AddGems", { license = License.license, gems = parseInt(Amount) })
        if Characters[Source] then
            TriggerClientEvent("hud:AddGems", Source, tonumber(Amount))
            TriggerClientEvent("Notify",Source,"azul","Você recebeu <b>"..Amount.."x Gemas</b>.",5000)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADENAMES
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeNames(Passport, Name, Name2)
    local Source = vRP.Source(Passport)
    vRP.Query("characters/updateName", { Passport = Passport, name = Name, name2 = Name2 })
    if Characters[Source] then
        Characters[Source].name2 = Name2
        Characters[Source].name = Name
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADEPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradePhone(Passport, Phone)
    local Source = vRP.Source(Passport)
    if Characters[Source] then
        Characters[Source].phone = Phone
    end
    TriggerEvent("smartphone:updatePhoneNumber",Passport,Phone)
    vRP.Query("characters/updatePhone", { id = Passport, phone = Phone })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PASSPORTPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PassportPlate(Plate)
    if PassportPlate[Plate] == nil then
        local Consult = vRP.Query("vehicles/plateVehicles", { plate = Plate })
		if Consult[1] then
			PassportPlate[Plate] = Consult[1]
		end
	end
    return PassportPlate[Plate]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USERPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UserPhone(Phone)
    if UserPhone[Phone] == nil then
        local Consult = vRP.Query("characters/getPhone", { phone = Phone })
		if Consult[1] then
			UserPhone[Phone] = Consult[1]
		end
	end
    return UserPhone[Phone]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATESTRING
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GenerateString(Format)
    local Number = ""
    for i = 1, #Format do
        if string.sub(Format, i, i) == "D" then
            Number = Number..string.char(string.byte("0") + math.random(0,9))
        elseif "L" == string.sub(Format, i, i) then
            Number = Number..string.char(string.byte("A") + math.random(0,25))
        else
            Number = Number..string.sub(Format, i, i)
        end
    end
    return Number
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATEPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GeneratePlate()
    local Passport = nil
    local Serial = ""
    repeat
        Passport = vRP.PassportPlate((vRP.GenerateString("DDLLLDDD")))
        Serial = vRP.GenerateString("DDLLLDDD")
    until not Passport
    return Serial
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATEPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GeneratePhone()
    local Passport = nil
    local Phone = ""
    repeat
        Passport = vRP.UserPhone((vRP.GenerateString("DDD-DDD")))
        Phone = vRP.GenerateString("DDD-DDD")
    until not Passport
    return Phone
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMEDICPLAN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetMedicPlan(Passport,medicplan)
	local Source = vRP.Source(Passport)
	if Characters[Source] then
		Characters[Source]["medicplan"] = medicplan
	end
    exports["oxmysql"]:executeSync("UPDATE characters SET medicplan = :medicplan WHERE id = :Passport", { Passport = Passport, medicplan = medicplan })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USERMEDICPLAN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UserMedicPlan(Passport)
	local Source = vRP.Source(Passport)
	if Characters[Source] then
		if Characters[Source]["medicplan"] >= os.time() then
			return true
		end
	else
		local Identity = vRP.Query("characters/Person",{ id = Passport })
		if Identity[1] then
            if Identity[1]["medicplan"] >= os.time() then
                return true
            end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALARY
-----------------------------------------------------------------------------------------------------------------------------------------
local Salary = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALARY:ADD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Salary:Add", function(Passport, Permission)
    if not Salary[Permission] then
        Salary[Permission] = {}
    end
    if not Salary[Permission][Passport] then
        Salary[Permission][Passport] = os.time() + SalarySeconds
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALARY:REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Salary:Remove", function(Passport, Permission)
    if Permission then
        if Salary[Permission] and Salary[Permission][Passport] then
            Salary[Permission][Passport] = nil
        end
    else
        for k, v in pairs(Salary) do
            if Salary[k][Passport] then
                Salary[k][Passport] = nil
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(60000)
        for Key in pairs(Salary) do
            for Passport in pairs(Salary[Key]) do
                if Salary[Key][Passport] <= os.time() then
                    Salary[Key][Passport] = os.time() + SalarySeconds
                    local Hierarchy = vRP.HasPermission(Passport, Key)
                    if Hierarchy then
                        if Groups[Key] and Groups[Key]["Salary"] and Groups[Key]["Salary"][Hierarchy] then                    
                            vRP.GiveBank(Passport, Groups[Key]["Salary"][Hierarchy])
                            TriggerClientEvent("sounds:Private",vRP.Source(Passport),"coins",0.5)
                            TriggerClientEvent("Notify",vRP.Source(Passport),"verde","Recebeu <b>R$"..parseFormat(Groups[Key]["Salary"][Hierarchy]).."</b> em sua conta bancária.",5000,Key.." Salário")
                        end
                    else
                        Salary[Key][Passport] = nil
                    end
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport)
    for k, v in pairs(Salary) do
        if Salary[k][Passport] then
            Salary[k][Passport] = nil
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Groups = {}
Groups.Room = {}
Groups.Users = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.create(source, Passport, Message)
    if Message and not Groups.Users[Passport] and not Groups.Room[Message] then
        Groups.Room[Message] = {}
        Groups.Users[Passport] = Message
        Groups.Room[Message][Passport] = source        
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.add(source, Passport, Message)
    if not Groups.Users[Passport] and not Groups.Room[Message][Passport] then
        Groups.Users[Passport] = Message
        Groups.Room[Groups.Users[Passport]][Passport] = source       
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.rem(source, Passport, Message)
    if Groups.Users[Passport] and Groups.Room[Message][Passport] then
        Groups.Users[Passport] = nil
        Groups.Room[Message][Passport] = nil        
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.leave(source, Passport)
    if Groups.Users[Passport] then
        vRP.rem(source, Passport, Groups.Users[Passport])       
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARTY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.party(Passport)
    if Passport then
        if Groups.Users[Passport] and Groups.Room[Groups.Users[Passport]] then
            for k, v in pairs(Groups.Room[Groups.Users[Passport]]) do
                return "" .. "#" .. k .. " " .. vRP.Identity(k).name .. " " .. vRP.Identity(k).name2 .. "<br>"
            end
        end
        return false
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport)
    if Groups.Users[Passport] then
        if Groups.Room[Groups.Users[Passport]] and Groups.Room[Groups.Users[Passport]][Passport] then
            Groups.Room[Groups.Users[Passport]][Passport] = nil
            if #Groups.Room[Groups.Users[Passport]] <= 0 then
                Groups.Room[Groups.Users[Passport]] = nil
            end
        end
        Groups.Users[Passport] = nil
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARTY
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Party", function(Passport, source, Distance)
    local Partys = {}
    if Groups.Users[Passport] and Groups.Room[Groups.Users[Passport]] then
        for k, v in pairs(Groups.Room[Groups.Users[Passport]]) do
            if Distance >= #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(v))) then
                Partys[#Partys + 1] = {
                    ["Passport"] = k,
                    ["source"] = source
                }
            end
        end
    end
    return Partys
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
local Global = {}
Objects = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("CharacterChosen", function(Passport, source)
    local Datatable = vRP.Datatable(Passport)
    local Identity = vRP.Identity(Passport)
    if Datatable and Identity then
        
        if not Datatable.Skin then
            Datatable.Skin = "mp_m_freemode_01"
        end
        if not Datatable.Inventory then
            Datatable.Inventory = {}
        end
        if not Datatable.Health then
            Datatable.Health = 200
        end
        if not Datatable.Armour then
            Datatable.Armour = 0
        end
        if not Datatable.Stress then
            Datatable.Stress = 0
        end
        if not Datatable.Hunger then
            Datatable.Hunger = 100
        end
        if not Datatable.Thirst then
            Datatable.Thirst = 100
        end
        if not Datatable.Weight then
            Datatable.Weight = BackpackWeightDefault
        end
        
        vRPC.Skin(source, Datatable.Skin)
        vRP.SetArmour(source, Datatable.Armour)
        vRPC.SetHealth(source, Datatable.Health)
 
        TriggerClientEvent("barbershop:Apply", source, vRP.UserData(Passport, "Barbershop"))
        TriggerClientEvent("skinshop:Apply", source, vRP.UserData(Passport, "Clothings"))
        TriggerClientEvent("tattoos:Apply", source, vRP.UserData(Passport, "Tatuagens"))
        TriggerClientEvent("hud:Thirst", source, Datatable.Thirst)
        TriggerClientEvent("hud:Hunger", source, Datatable.Hunger)
        TriggerClientEvent("hud:Stress", source, Datatable.Stress)
        TriggerClientEvent("vRP:Active", source, Passport, Identity.name .. " " .. Identity.name2)
    
        if vRP.UserData(Passport, "Creator") == 1 then
            if Global[Passport] then
                TriggerClientEvent("spawn:Finish", source, false, vec3(Datatable.Pos.x, Datatable.Pos.y, Datatable.Pos.z))
            else
                TriggerClientEvent("spawn:Finish", source, true, vec3(Datatable.Pos.x, Datatable.Pos.y, Datatable.Pos.z))
            end
        else
            TriggerClientEvent("spawn:Finish", source, false)
        end

        GlobalState["SetDiscord"] = GetNumPlayerIndices()
        TriggerEvent("Connect", Passport, source, Global[Passport] == nil)
        Global[Passport] = true
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- JUSTOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vRP:justObjects")
AddEventHandler("vRP:justObjects", function()
    local source = source
    local Passport = vRP.Passport(source)
    local Inventory = vRP.Inventory(Passport)
    if Passport then
        for i = 1, 5 do
            if Inventory[tostring(i)] and "Armamento" == itemType(Inventory[tostring(i)].item) then
                TriggerClientEvent("inventory:CreateWeapon", source, Inventory[tostring(i)].item)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BACKPACKWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vRP:BackpackWeight")
AddEventHandler("vRP:BackpackWeight", function(value)
    local source = source
    local Passport = vRP.Passport(source)
    local Datatable = vRP.Datatable(Passport)
    if Passport then
        if value then
            if not Global[Passport] then
                Datatable.Weight = Datatable.Weight + 50
                Global[Passport] = true
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEOBJECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("DeleteObject")
AddEventHandler("DeleteObject", function(index, value)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if value and Objects[Passport] and Objects[Passport][value] then
            index = Objects[Passport][value]
            Objects[Passport][value] = nil
        end
    end
    TriggerEvent("DeleteObjectServer", index)
    while DoesEntityExist(EntitysObject[Passport]) do
        DeleteEntity(EntitysObject[Passport])
        Wait(1)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEOBJECTSERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("DeleteObjectServer", function(entIndex)
    local NetworkGetEntityFromNetworkId = NetworkGetEntityFromNetworkId(entIndex)
    if DoesEntityExist(NetworkGetEntityFromNetworkId) and not IsPedAPlayer(NetworkGetEntityFromNetworkId) and 3 == GetEntityType(NetworkGetEntityFromNetworkId) then
        DeleteEntity(NetworkGetEntityFromNetworkId)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEPED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("DeletePed")
AddEventHandler("DeletePed", function(entIndex)
    local NetworkGetEntityFromNetworkId = NetworkGetEntityFromNetworkId(entIndex)
    if DoesEntityExist(NetworkGetEntityFromNetworkId) and not IsPedAPlayer(NetworkGetEntityFromNetworkId) and 1 == GetEntityType(NetworkGetEntityFromNetworkId) then
        DeleteEntity(NetworkGetEntityFromNetworkId)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUGOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("DebugObjects", function(value)
    if Objects[value] then
        for k, v in pairs(Objects[value]) do
            Objects[value][k] = nil
            TriggerEvent("DeleteObjectServer", k)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUGWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("DebugWeapons", function(value)
    if Objects[value] then
        for k, v in pairs(Objects[value]) do
            TriggerEvent("DeleteObjectServer", v)
            Objects[value] = nil
        end
        Objects[value] = nil
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("gg", function(source)
    local source = source
    local Passport = vRP.Passport(source)
    if GetPlayerRoutingBucket(source) < 900000 and Passport and SURVIVAL.CheckDeath(source) then
        Characters[source]["table"]["Weight"] = BackpackMaxWeightDefault
        vRP.ClearInventory(Passport)
        vRP.UpgradeThirst(Passport, 100)
        vRP.UpgradeHunger(Passport, 100)
        vRP.DowngradeStress(Passport, 100)
        TriggerEvent("Discord", "Airport", "**Source:** " .. source .. [[ **Passaporte:** ]] .. Passport .. [[ **Address:** ]] .. GetPlayerEndpoint(source), 3092790)
        SURVIVAL.Respawn(source)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ClearInventory(Passport)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if source and Datatable and Datatable.Inventory then
        exports.inventory:CleanWeapons(parseInt(Passport), true)
        TriggerEvent("DebugObjects", parseInt(Passport))
        TriggerEvent("DebugWeapons", parseInt(Passport))
        for k,v in pairs(Datatable.Inventory) do
            local item = SplitOne(v["item"],"-")
            if item ~= "cellphone" and item ~= "creditcard" and item ~= "debitcard" then
                Datatable.Inventory[k] = nil
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADETHIRST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeThirst(Passport, Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable.Thirst then
            Datatable.Thirst = 0
        end
        Datatable.Thirst = Datatable.Thirst + parseInt(Amount)
        if Datatable.Thirst > 100 then
            Datatable.Thirst = 100
        end
        TriggerClientEvent("hud:Thirst", source, Datatable.Thirst)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADEHUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeHunger(Passport, Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable.Hunger then
            Datatable.Hunger = 0
        end
        Datatable.Hunger = Datatable.Hunger + parseInt(Amount)
        if Datatable.Hunger > 100 then
            Datatable.Hunger = 100
        end
        TriggerClientEvent("hud:Hunger", source, Datatable.Hunger)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeStress(Passport, Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable.Stress then
            Datatable.Stress = 0
        end
        Datatable.Stress = Datatable.Stress + parseInt(Amount)
        if Datatable.Stress > 100 then
            Datatable.Stress = 100
        end
        TriggerClientEvent("hud:Stress", source, Datatable.Stress)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADETHIRST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DowngradeThirst(Passport, Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable.Thirst then
            Datatable.Thirst = 100
        end
        Datatable.Thirst = Datatable.Thirst - parseInt(Amount)
        if Datatable.Thirst < 0 then
            Datatable.Thirst = 0
        end
        TriggerClientEvent("hud:Thirst", source, Datatable.Thirst)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADEHUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DowngradeHunger(Passport, Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable.Hunger then
            Datatable.Hunger = 100
        end
        Datatable.Hunger = Datatable.Hunger - parseInt(Amount)
        if Datatable.Hunger < 0 then
            Datatable.Hunger = 0
        end
        TriggerClientEvent("hud:Hunger", source, Datatable.Hunger)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DowngradeStress(Passport, Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable.Stress then
            Datatable.Stress = 0
        end
        Datatable.Stress = Datatable.Stress - parseInt(Amount)
        if Datatable.Stress < 0 then
            Datatable.Stress = 0
        end
        TriggerClientEvent("hud:Stress", source, Datatable.Stress)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FOODS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.Foods()
    local source = source
    local Passport = vRP.Passport(source)
    local Datatable = vRP.Datatable(Passport)
    if source and Datatable then
        if not Datatable.Thirst then
            Datatable.Thirst = 100
        end
        if not Datatable.Hunger then
            Datatable.Hunger = 100
        end
        Datatable.Hunger = Datatable.Hunger - 1
        Datatable.Thirst = Datatable.Thirst - 1
        if Datatable.Thirst < 0 then
            Datatable.Thirst = 0
        end
        if Datatable.Hunger < 0 then
            Datatable.Hunger = 0
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETHEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetHealth(source)
    local GetPlayerPed = GetPlayerPed(source)
    return GetEntityHealth(GetPlayerPed)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MODELPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ModelPlayer(source)
    local GetPlayerPed = GetPlayerPed(source)
    if GetEntityModel(GetPlayerPed) == GetHashKey("mp_f_freemode_01") then
        return "mp_f_freemode_01"
    elseif GetEntityModel(GetPlayerPed) == GetHashKey("mp_m_freemode_01") then
        return "mp_m_freemode_01"
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETARMOUR
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetArmour(source, Amount)
    local GetPlayerPed = GetPlayerPed(source)
    if GetPedArmour(GetPlayerPed) + Amount > 100 then
        Amount = 100 - GetPedArmour(GetPlayerPed)
    end
    SetPedArmour(GetPlayerPed, GetPedArmour(GetPlayerPed) + Amount)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Teleport(source, x, y, z)
    local GetPlayerPed = GetPlayerPed(source)
    SetEntityCoords(GetPlayerPed, x, y, z, false, false, false, false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETENTITYCOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetEntityCoords(source)
    local GetPlayerPed = GetPlayerPed(source)
    return GetEntityCoords(GetPlayerPed)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INSIDEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.InsideVehicle(source)
    return GetVehiclePedIsIn(GetPlayerPed(source)) ~= 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEPED
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.CreatePed(model,x,y,z,heading,typ)
	local spawnPeds = 0
	local mHash = GetHashKey(model)
	local Ped = CreatePed(typ,mHash,x,y,z,heading,true,false)

	while not DoesEntityExist(Ped) and spawnPeds <= 1000 do
		spawnPeds = spawnPeds + 1
		Wait(1)
	end

	if DoesEntityExist(Ped) then
		return true,NetworkGetNetworkIdFromEntity(Ped)
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEOBJECT
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.CreateObject(Model,x,y,z,Weapon)
    local Passport = vRP.Passport(source)
    if Passport then
        local spawnObjects = 0
        local hash = GetHashKey(Model)
        local object = CreateObject(hash,x,y,z,true,true,false)

        while not DoesEntityExist(object) and spawnObjects <= 1000 do
            spawnObjects = spawnObjects + 1
            Wait(1)
        end
        local network = NetworkGetNetworkIdFromEntity(object)
        if DoesEntityExist(object) then
            if Weapon then
                if not Objects[Passport] then
                    Objects[Passport] = {}
                end
                Objects[Passport][Weapon] = network
            else
                if not Objects[Passport] then
                    Objects[Passport] = {}
                end
                Objects[Passport][network] = true
            end
            return true,network
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEOBJECT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.createObjects(Source,Dict,Anim,Prop,Flag,Hands,Pos1,Pos2,Pos3,Pos4,Pos5,Pos6)
	local Passport = vRP.Passport(Source)
	local Ped = GetPlayerPed(Source)
	if Anim ~= "" then
        vRPC.playAnim(Source,Flag==48,{Dict,Anim},Flag==1)
	end
	if GetVehiclePedIsIn(Ped) == 0 then
        if DoesEntityExist(EntitysObject[Passport]) then DeleteEntity(EntitysObject[Passport]) end
        EntitysObject[Passport] = CreateObject(GetHashKey(Prop),GetEntityCoords(Ped), true, true, false)
		while not DoesEntityExist(EntitysObject[Passport]) do Wait(0) end
		TriggerClientEvent("AttachEntityToEntity",Source,NetworkGetNetworkIdFromEntity(EntitysObject[Passport]),NetworkGetNetworkIdFromEntity(Ped),Hands,Pos1,Pos2,Pos3,Pos4,Pos5,Pos6)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        for k, v in pairs(Sources) do
            vRP.DowngradeHunger(k, ConsumeHunger)
            vRP.DowngradeThirst(k, ConsumeThirst)
        end
        Wait(CooldownHungerThrist)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUCKETCLIENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vRP:BucketClient")
AddEventHandler("vRP:BucketClient", function(value)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if value == "Enter" then
            Player(source).state.Route = Passport
            SetPlayerRoutingBucket(source, Passport)
        else
            Player(source).state.Route = 0
            SetPlayerRoutingBucket(source, 0)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUCKETSERVER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vRP:BucketServer")
AddEventHandler("vRP:BucketServer", function(source, value, bucket)
    if value == "Enter" then
        Player(source).state.Route = bucket
        SetPlayerRoutingBucket(source, bucket)
        if bucket > 0 then
            SetRoutingBucketEntityLockdownMode(bucket, "inactive")
            SetRoutingBucketPopulationEnabled(bucket, false)
        end
    else
        Player(source).state.Route = 0
        SetPlayerRoutingBucket(source, 0)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport)
    TriggerEvent("DebugObjects", Passport)
    TriggerEvent("DebugWeapons", Passport)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUEUE
-----------------------------------------------------------------------------------------------------------------------------------------
local Queue = {}
Queue.QueueList = {}
Queue.PlayerList = {}
Queue.PlayerCount = 0
Queue.Connecting = {}
Queue.ThreadCount = 0
local maxPlayers = 2048
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETQUEUE
-----------------------------------------------------------------------------------------------------------------------------------------
function getQueue(ids,trouble,source,connect)
	for k,v in ipairs(connect and Queue.Connecting or Queue.QueueList) do
		local inQueue = false
		if not source then
			for _,i in ipairs(v["ids"]) do
				if inQueue then
					break
				end
				for _,o in ipairs(ids) do
					if o == i then
						inQueue = true
						break
					end
				end
			end
		else
			inQueue = ids == v["source"]
		end

		if inQueue then
			if trouble then
				return k,connect and Queue.Connecting[k] or Queue.QueueList[k]
			end

			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ISPRIORITY
-----------------------------------------------------------------------------------------------------------------------------------------
function isPriority(source)
	local Priority = 0
    local Identitie = vRP.Identities(source)
    local Account = vRP.Account(Identitie)
    if Account then
        Priority = Account["priority"] or 0
    end
	return Priority
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDQUEUE
-----------------------------------------------------------------------------------------------------------------------------------------
function addQueue(ids,connectTime,name,source,deferrals)
	if getQueue(ids) then
		return
	end

	local tmp = { source = source, ids = ids, name = name, firstconnect = connectTime, priority = isPriority(source), timeout = 0, deferrals = deferrals }

	local _pos = false
	local queueCount = #Queue.QueueList + 1

	for k,v in ipairs(Queue.QueueList) do
		if tmp["priority"] then
			if not v["priority"] then
				_pos = k
			else
				if tmp["priority"] > v["priority"] then
					_pos = k
				end
			end

			if _pos then
				break
			end
		end
	end

	if not _pos then
		_pos = #Queue.QueueList + 1
	end

	table.insert(Queue.QueueList,_pos,tmp)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEQUEUE
-----------------------------------------------------------------------------------------------------------------------------------------
function removeQueue(ids,source)
	if getQueue(ids,false,source) then
		local pos,data = getQueue(ids,true,source)
		table.remove(Queue.QueueList,pos)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
function isConnect(ids,source,refresh)
	local k,v = getQueue(ids,refresh and true or false,source and true or false,true)

	if not k then
		return false
	end

	if refresh and k and v then
		Queue.Connecting[k]["timeout"] = 0
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVECONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
function removeConnect(ids,source)
	for k,v in ipairs(Queue.Connecting) do
		local connect = false

		if not source then
			for _,i in ipairs(v["ids"]) do
				if connect then
					break
				end

				for _,o in ipairs(ids) do
					if o == i then
						connect = true
						break
					end
				end
			end
		else
			connect = ids == v["source"]
		end

		if connect then
			table.remove(Queue.Connecting,k)
			return true
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
function addConnect(ids,ignorePos,autoRemove,done)
	local function removeFromQueue()
		if not autoRemove then
			return
		end

		done(Lang.Error)
		removeConnect(ids)
		removeQueue(ids)
	end

	if #Queue.Connecting >= 100 then
		removeFromQueue()
		return false
	end

	if isConnect(ids) then
		removeConnect(ids)
	end

	local pos,data = getQueue(ids,true)
	if not ignorePos and (not pos or pos > 1) then
		removeFromQueue()
		return false
	end

	table.insert(Queue.Connecting,data)
	removeQueue(ids)
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEAMIDS
-----------------------------------------------------------------------------------------------------------------------------------------
function steamIds(source)
	return GetPlayerIdentifiers(source)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEDATA
-----------------------------------------------------------------------------------------------------------------------------------------
function updateData(source,ids,deferrals)
	local pos,data = getQueue(ids,true)
	Queue.QueueList[pos]["ids"] = ids
	Queue.QueueList[pos]["timeout"] = 0
	Queue.QueueList[pos]["source"] = source
	Queue.QueueList[pos]["deferrals"] = deferrals
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTFULL
-----------------------------------------------------------------------------------------------------------------------------------------
function notFull(firstJoin)
	local canJoin = Queue.PlayerCount + #Queue.Connecting < maxPlayers and #Queue.Connecting < 100
	if firstJoin and canJoin then
		canJoin = #Queue.QueueList <= 1
	end

	return canJoin
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPOSITION
-----------------------------------------------------------------------------------------------------------------------------------------
function setPosition(ids,newPos)
	local pos,data = getQueue(ids,true)
	table.remove(Queue.QueueList,pos)
	table.insert(Queue.QueueList,newPos,data)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local function Connect(name,setKickReason,deferrals)
		local source = source
		local ids = steamIds(source)
		local connectTime = os.time()
		local connecting = true

		deferrals.defer()

		CreateThread(function()
			while connecting do
				Wait(500)
				if not connecting then
					return
				end
				deferrals.update(Lang.Connecting)
			end
		end)

		Wait(1000)

		local function done(message)
			connecting = false
			CreateThread(function()
				if message then
					deferrals.update(tostring(message) and tostring(message) or "")
				end

				Wait(1000)

				if message then
					deferrals.done(tostring(message) and tostring(message) or "")
					CancelEvent()
				end
			end)
		end

		local function update(message)
			connecting = false
			deferrals.update(tostring(message) and tostring(message) or "")
		end


		local reason = "Removido da fila."

		local function setReason(message)
			reason = tostring(message)
		end

		TriggerEvent("Queue:playerJoinQueue",source,setReason)

		if WasEventCanceled() then
			done(reason)

			removeQueue(ids)
			removeConnect(ids)

			CancelEvent()
			return
		end

		local rejoined = false

		if getQueue(ids) then
			rejoined = true
			updateData(source,ids,deferrals)
		else
			addQueue(ids,connectTime,name,source,deferrals)
		end

		if isConnect(ids,false,true) then
			removeConnect(ids)

			if notFull() then
				local added = addConnect(ids,true,true,done)
				if not added then
					CancelEvent()
					return
				end

				done()
				TriggerEvent("Queue:Connecting",source,ids,deferrals,name)

				return
			else
				addQueue(ids,connectTime,name,source,deferrals)
				setPosition(ids,1)
			end
		end

		local pos,data = getQueue(ids,true)

		if not pos or not data then
			done(Lang.Error)
			RemoveFromQueue(ids)
			RemoveFromConnecting(ids)
			CancelEvent()
			return
		end

		if notFull(true) then
			local added = addConnect(ids,true,true,done)
			if not added then
				CancelEvent()
				return
			end

			done()

			TriggerEvent("Queue:Connecting",source,ids,deferrals,name)

			return
		end

		update(string.format(Lang.Position,pos,#Queue.QueueList))

		CreateThread(function()
			if rejoined then
				return
			end

			Queue.ThreadCount = Queue.ThreadCount + 1
			local dotCount = 0

			while true do
				Wait(1000)
				local dots = ""

				dotCount = dotCount + 1
				if dotCount > 3 then
					dotCount = 0
				end

				for i = 1,dotCount do
					dots = dots.."."
				end

				local pos,data = getQueue(ids,true)

				if not pos or not data then
					if data and data.deferrals then
						data.deferrals.done(Lang.Error)
					end

					CancelEvent()
					removeQueue(ids)
					removeConnect(ids)
					Queue.ThreadCount = Queue.ThreadCount - 1
					return
				end

				if pos <= 1 and notFull() then
					local added = addConnect(ids)
					data.deferrals.update(Lang.Join)
					Wait(500)

					if not added then
						data.deferrals.done(Lang.Error)
						CancelEvent()
						Queue.ThreadCount = Queue.ThreadCount - 1
						return
					end

					data.deferrals.update("Carregando conexão com o servidor.")

					removeQueue(ids)
					Queue.ThreadCount = Queue.ThreadCount - 1

					TriggerEvent("Queue:Connecting",source,data.ids,data.deferrals,name)
					
					return
				end

				local message = string.format("Nova Conexão SP \n\n"..Lang.Position.."%s\nEvite punições, fique por dentro das regras de conduta.\nAtualizações frequentes, deixe sua sugestão em nosso discord.",pos,#Queue.QueueList,dots)
				data.deferrals.update(message)
			end
		end)
	end

	AddEventHandler("playerConnecting",Connect)

	local function checkTimeOuts()
		local i = 1

		while i <= #Queue.QueueList do
			local data = Queue.QueueList[i]
			local lastMsg = GetPlayerLastMsg(data.source)

			if lastMsg == 0 or lastMsg >= 30000 then
				data.timeout = data.timeout + 1
			else
				data.timeout = 0
			end

			if not data.ids or not data.name or not data.firstconnect or data.priority == nil or not data.source then
				data.deferrals.done(Lang.Error)
				table.remove(Queue.QueueList,i)
			elseif (data.timeout >= 120) and os.time() - data.firstconnect > 5 then
				data.deferrals.done(Lang.Error)
				removeQueue(data.source,true)
				removeConnect(data.source,true)
			else
				i = i + 1
			end
		end

		i = 1

		while i <= #Queue.Connecting do
			local data = Queue.Connecting[i]
			local lastMsg = GetPlayerLastMsg(data.source)
			data.timeout = data.timeout + 1

			if ((data.timeout >= 300 and lastMsg >= 35000) or data.timeout >= 340) and os.time() - data.firstconnect > 5 then
				removeQueue(data.source,true)
				removeConnect(data.source,true)
			else
				i = i + 1
			end
		end

		SetTimeout(1000,checkTimeOuts)
	end

	checkTimeOuts()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("Queue:Connect")
AddEventHandler("Queue:Connect",function()
	local source = source
	if not Queue.PlayerList[source] then
		local ids = steamIds(source)
		Queue.PlayerCount = Queue.PlayerCount + 1
		Queue.PlayerList[source] = true
		removeQueue(ids)
		removeConnect(ids)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERDROPPED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerDropped",function()
	if Queue.PlayerList[source] then
		local ids = steamIds(source)
		Queue.PlayerCount = Queue.PlayerCount - 1
		Queue.PlayerList[source] = nil
		removeQueue(ids)
		removeConnect(ids)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Queue:Remove",function(ids)
	removeQueue(ids)
	removeConnect(ids)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUFFS
-----------------------------------------------------------------------------------------------------------------------------------------
Buffs = {
	["Dexterity"] = {}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- IMPOUND:CHECK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Impound")
AddEventHandler("inventory:Impound",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		Active[Passport] = true

		local Experience = vRP.GetExperience(Passport,"Tows")
		local Level = ClassCategory(Experience)
		local Valuation = 1000

		if Level == 2 or Level == 3 or Level == 5 then
			Valuation = Valuation + 50
		elseif Level == 6 or Level == 7 or Level == 8 then
			Valuation = Valuation + 80
		elseif Level == 9 or Level == 10 then
			Valuation = Valuation + 120
		end

		if Buffs["Dexterity"][Passport] then
			if Buffs["Dexterity"][Passport] > os.time() then
				Valuation = Valuation + (Valuation * 0.1)
			end
		end

		vRP.PutExperience(Passport,"Tows",1)
		vRP.GenerateItem(Passport,"dollars",Valuation,true)
		TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",Valuation)
		TriggerClientEvent("garages:Delete",source,entity[3])

		Active[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATENAME
-----------------------------------------------------------------------------------------------------------------------------------------
local plateName = { "James","John","Robert","Michael","William","David","Richard","Charles","Joseph","Thomas","Christopher","Daniel","Paul","Mark","Donald","George","Kenneth","Steven","Edward","Brian","Ronald","Anthony","Kevin","Jason","Matthew","Gary","Timothy","Jose","Larry","Jeffrey","Frank","Scott","Eric","Stephen","Andrew","Raymond","Gregory","Joshua","Jerry","Dennis","Walter","Patrick","Peter","Harold","Douglas","Henry","Carl","Arthur","Ryan","Roger","Joe","Juan","Jack","Albert","Jonathan","Justin","Terry","Gerald","Keith","Samuel","Willie","Ralph","Lawrence","Nicholas","Roy","Benjamin","Bruce","Brandon","Adam","Harry","Fred","Wayne","Billy","Steve","Louis","Jeremy","Aaron","Randy","Howard","Eugene","Carlos","Russell","Bobby","Victor","Martin","Ernest","Phillip","Todd","Jesse","Craig","Alan","Shawn","Clarence","Sean","Philip","Chris","Johnny","Earl","Jimmy","Antonio","Mary","Patricia","Linda","Barbara","Elizabeth","Jennifer","Maria","Susan","Margaret","Dorothy","Lisa","Nancy","Karen","Betty","Helen","Sandra","Donna","Carol","Ruth","Sharon","Michelle","Laura","Sarah","Kimberly","Deborah","Jessica","Shirley","Cynthia","Angela","Melissa","Brenda","Amy","Anna","Rebecca","Virginia","Kathleen","Pamela","Martha","Debra","Amanda","Stephanie","Carolyn","Christine","Marie","Janet","Catherine","Frances","Ann","Joyce","Diane","Alice","Julie","Heather","Teresa","Doris","Gloria","Evelyn","Jean","Cheryl","Mildred","Katherine","Joan","Ashley","Judith","Rose","Janice","Kelly","Nicole","Judy","Christina","Kathy","Theresa","Beverly","Denise","Tammy","Irene","Jane","Lori","Rachel","Marilyn","Andrea","Kathryn","Louise","Sara","Anne","Jacqueline","Wanda","Bonnie","Julia","Ruby","Lois","Tina","Phyllis","Norma","Paula","Diana","Annie","Lillian","Emily","Robin" }
local plateLastname = { "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes" }
local plateSave = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:PLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("police:Plate")
AddEventHandler("police:Plate",function(entity)
	local source = source
	local Data = vRP.PassportPlate(entity[1])
	if Data then
		local Identity = vRP.Identity(Data["Passport"])
		vRPC.PlaySound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		TriggerClientEvent("Notify",source,"azul","<b>Passaporte:</b> "..Identity["id"].."<br><b>Nome:</b> "..Identity["name"].." "..Identity["name2"].."<br><b>Nº Telefone: </b> "..Identity["phone"],10000)
	else
		if not plateSave[entity[1]] then
			plateSave[entity[1]] = { plateName[math.random(#plateName)].." "..plateLastname[math.random(#plateLastname)],vRP.GeneratePhone() }
		end
		vRPC.PlaySound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		TriggerClientEvent("Notify",source,"azul","<b>Passaporte:</b> 9.999<br><b>Nome:</b> "..plateSave[entity[1]][1].."<br><b>Nº Telefone: </b> "..plateSave[entity[1]][2],10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:ARREST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("police:Arrest")
AddEventHandler("police:Arrest",function(entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.Request(source,"Apreender o veículo?","Sim, concluír apreensão","Não, mudei de ideia") then
			local Data = vRP.PassportPlate(entity[1])
			if Data then
				local Vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Data["Passport"], vehicle = entity[2] })
				if Vehicle[1] then
					if Vehicle[1]["arrest"] <= os.time() then
						vRP.Query("vehicles/arrestVehicles",{ Passport = Data["Passport"], vehicle = entity[2] })
						TriggerClientEvent("Notify",source,"verde","Veículo apreendido.",5000)
					else
						TriggerClientEvent("Notify",source,"amarelo","Veículo já se encontra apreendido.",5000)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Active[Passport] then
		Active[Passport] = nil
	end
end)
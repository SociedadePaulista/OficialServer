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
Tunnel.bindInterface("painel",Creative)
vCLIENT = Tunnel.getInterface("painel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Panel = {}
local Price = 35000
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAINEL
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.Prepare("chests/DowngradeChests","UPDATE chests SET weight = weight / 2 WHERE name = @Name")
vRP.Prepare("chests/UpgradeChests2","UPDATE chests SET weight = weight + weight WHERE name = @Name")
vRP.Prepare("painel/GetInformations","SELECT * FROM organizations WHERE name = @Name")
vRP.Prepare("painel/UpdateBuff","UPDATE organizations SET buff = @Buff WHERE name = @Name")
vRP.Prepare("painel/DowngradeBank","UPDATE organizations SET bank = bank - @Value WHERE name = @Name")
vRP.Prepare("painel/UpgradeBank","UPDATE organizations SET bank = bank + @Value WHERE name = @Name")
vRP.Prepare("painel/GetTransactions","SELECT * FROM org_transactions WHERE name = @Name ORDER BY id DESC LIMIT 12")
vRP.Prepare("painel/InsertTransaction","INSERT INTO org_transactions (`name`, `Type`, `Value`) VALUES (@Name, @Type, @Value)")
vRP.Prepare("painel/UpdateBuff","UPDATE organizations SET buff = @Buff WHERE name = @Name")
vRP.Prepare("painel/SetPremium","UPDATE organizations SET premium = @Seconds WHERE name = @Name")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREMIUM
-----------------------------------------------------------------------------------------------------------------------------------------
function Premium(Org)
	local infos = vRP.Query("painel/GetInformations",{ Name = tostring(Org) })[1]

	if infos["premium"] > 0 then
		local premium = infos["premium"] - os.time()
		
		local Days = math.floor(premium / 86400)

		if infos["buff"] == true and Days < 1 then
			vRP.Query("painel/UpdateBuff",{ Name = tostring(Org), Buff = false })
			vRP.Query("chests/DowngradeChests",{ Name = tostring(Org) })
			vRP.Query("painel/SetPremium",{ Name = tostring(Org), Seconds = 0 })

			local Entitys = vRP.DataGroups(Panel[Passport])
			for Number,v in pairs(Entitys) do
				local Number = parseInt(Number)
				TriggerEvent("Salary:Remove", tostring(Number), "Buff")
			end
		end

		return Days
	else
		return 0
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAINEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("painel:Open")
AddEventHandler("painel:Open",function(Permission)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasPermission(Passport,Permission) then

            if not exports["oxmysql"]:query_async("SELECT * FROM organizations WHERE name = @Name;",{ Name = Permission })[1] then
                exports["oxmysql"]:query_async("INSERT INTO organizations (`name`) VALUES (@Name)",{ Name = Permission })
            end

			Panel[Passport] = Permission

			local Members = {}
			local Sources = vRP.Players()
			local Entitys = vRP.DataGroups(Panel[Passport])
			local Hierarchy = vRP.Hierarchy(Panel[Passport])
			
			for Number,v in pairs(Entitys) do
				local Number = parseInt(Number)
				local Identity = vRP.Identity(Number)
				if Identity then
					if vRP.HasPermission(Number,Panel[Passport],1) then
						Members[#Members + 1] = { ["name"] = Identity["name"].." "..Identity["name2"], ["phone"] = Identity["phone"], ["online"] = Sources[Number], ["id"] = Number, ["role"] = Hierarchy[1] or Hierarchy, ["role_id"] = 1 }
					else
						Members[#Members + 1] = { ["name"] = Identity["name"].." "..Identity["name2"], ["phone"] = Identity["phone"], ["online"] = Sources[Number], ["id"] = Number, ["role"] = Hierarchy[v] or Hierarchy }
					end
				end
			end

			vCLIENT.Open(source,{
				groupName = Panel[Passport],
				members = Members,
				client_role = Entitys[tostring(Passport)]
			},Premium(Panel[Passport]),Price)

		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVITE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Invite(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	local Identity = vRP.Identity(Passport)
	local otherSource = vRP.Source(Number)
	if Passport and Panel[Passport] and Number > 1 and Passport ~= Number and vRP.Identity(Number) and otherSource then
        local Entitys = vRP.DataGroups(Panel[Passport])
        for OtherPassport in pairs(Entitys) do
            if OtherPassport == tostring(Number) then
                TriggerClientEvent("Notify", source, "vermelho", "O convidado já está em uma organização.",5000)
                return
            end
        end
		if vRP.HasPermission(Passport,Panel[Passport],1) then
			TriggerClientEvent("Notify",source,"amarelo","O convite foi enviado.",5000)
			if vRP.Request(otherSource,Identity["name"].." "..Identity["name2"].." te convidou para se juntar a organização "..Panel[Passport]..", você aceita esse convite?") then
				vRP.SetPermission(Number,Panel[Passport])
				TriggerClientEvent("Notify",source,"verde","O convite foi aceito.",5000)
				local Sources = vRP.Players()
				local Entitys = vRP.DataGroups(Panel[Passport])
				local Identity = vRP.Identity(Number)
				return { 
					["name"] = Identity["name"].." "..Identity["name2"], 
					["phone"] = Identity["phone"], 
					["online"] = Sources[Number], 
					["id"] = Number,
					["role"] = vRP.Hierarchy(Panel[Passport])[Entitys[tostring(Number)]]
				}
			else
				TriggerClientEvent("Notify",source,"vermelho","O convite foi recusado.",5000)
			end
		else
			TriggerClientEvent("Notify", source, "vermelho", "Você não tem permissão para convidar uma pessoa para sua organização.",5000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HIERARCHY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Hierarchy(OtherPassport,Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and OtherPassport > 1 and Passport ~= OtherPassport and vRP.Identity(OtherPassport) then
		if vRP.HasPermission(Passport,Panel[Passport],1) then
			if (not vRP.HasPermission(OtherPassport,Panel[Passport],1) and not vRP.HasPermission(OtherPassport,Panel[Passport],2)) or (Mode == "Demote" and not vRP.HasPermission(OtherPassport,Panel[Passport],1)) then                
                vRP.SetPermission(OtherPassport,Panel[Passport],nil,Mode)
				local Entitys = vRP.DataGroups(Panel[Passport])
				return { vRP.Hierarchy(Panel[Passport])[Entitys[tostring(OtherPassport)]] }
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMISS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Dismiss(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and Number > 1 and Passport ~= Number then
		if vRP.HasPermission(Passport,Panel[Passport],1) and not vRP.HasPermission(Number,Panel[Passport],1) then
			vRP.RemovePermission(Number,Panel[Passport])
            TriggerClientEvent("Notify", source, "verde", "O integrante foi demitido com sucesso.",5000)
            local OtherSource = vRP.Source(Number)
            if OtherSource then
                TriggerClientEvent("Notify", OtherSource, "vermelho", "Você foi demitido da organização " .. Panel[Passport] .. ".",5000)
            end
			local Members = {}
			local Sources = vRP.Players()
			local Entitys = vRP.DataGroups(Panel[Passport])
			local Hierarchy = vRP.Hierarchy(Panel[Passport])
			for Number,v in pairs(Entitys) do
				local Number = parseInt(Number)
				local Identity = vRP.Identity(Number)
				if Identity then
					if vRP.HasPermission(Number,Panel[Passport],1) then
						Members[#Members + 1] = { ["name"] = Identity["name"].." "..Identity["name2"], ["phone"] = Identity["phone"], ["online"] = Sources[Number], ["id"] = Number, ["role"] = Hierarchy[1] or Hierarchy, ["role_id"] = 1 }
					else
						Members[#Members + 1] = { ["name"] = Identity["name"].." "..Identity["name2"], ["phone"] = Identity["phone"], ["online"] = Sources[Number], ["id"] = Number, ["role"] = Hierarchy[v] or Hierarchy }
					end
				end
			end
			return Members
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Transactions()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] then
		local bank = vRP.Query("painel/GetInformations",{ Name = Panel[Passport] })[1]["bank"]
		local transactions = vRP.Query("painel/GetTransactions",{ Name = Panel[Passport] })
		return {
			["Balance"] = bank,
			["Transactions"] = transactions
		}
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEPOSIT
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Deposit(Value)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and (vRP.HasPermission(Passport,Panel[Passport],1) or vRP.HasPermission(Passport,Panel[Passport],2)) then
		local Value = tonumber(Value)
		local bank = vRP.ItemAmount(Passport, "dollars")
		if Value <= bank then
			if vRP.TakeItem(Passport,"dollars",Value,true) then
				vRP.Query("painel/InsertTransaction",{ Name = Panel[Passport], Type = "entry", Value = Value })
				vRP.Query("painel/UpgradeBank",{ Name = Panel[Passport], Value = Value })
				local Bank = vRP.Query("painel/GetInformations",{ Name = Panel[Passport] })[1]["bank"]
				local Transactions = vRP.Query("painel/GetTransactions",{ Name = Panel[Passport] })
				return {
					["Balance"] = Bank,
					["Transactions"] = Transactions
				}
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WITHDRAW
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Withdraw(Value)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and (vRP.HasPermission(Passport,Panel[Passport],1) or vRP.HasPermission(Passport,Panel[Passport],2)) then
		local Value = tonumber(Value)
		local bank = vRP.Query("painel/GetInformations",{ Name = Panel[Passport] })[1]["bank"]
		if Value <= bank then
			vRP.Query("painel/InsertTransaction",{ Name = Panel[Passport], Type = "exit", Value = Value })
			vRP.Query("painel/DowngradeBank",{ Name = Panel[Passport], Value = Value })
			vRP.GenerateItem(Passport,"dollars",Value,true)
			local Bank = vRP.Query("painel/GetInformations",{ Name = Panel[Passport] })[1]["bank"]
			local Transactions = vRP.Query("painel/GetTransactions",{ Name = Panel[Passport] })
			return {
				["Balance"] = Bank,
				["Transactions"] = Transactions
			}
        else
            TriggerClientEvent("Notify", source, "vermelho", "Saldo insuficiente.",5000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Buy()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and (vRP.HasPermission(Passport,Panel[Passport],1) or vRP.HasPermission(Passport,Panel[Passport],2)) then
        if vRP.PaymentGems(Passport,Price) then
			local Seconds = os.time() + (86400 * 30)
			vRP.Query("painel/UpdateBuff",{ Name = Panel[Passport], Buff = true })
			vRP.Query("chests/UpgradeChests2",{ Name = Panel[Passport] })
			vRP.Query("painel/SetPremium",{ Name = Panel[Passport], Seconds = Seconds })
			local Entitys = vRP.DataGroups(Panel[Passport])
			for Number,v in pairs(Entitys) do
				local Number = parseInt(Number)
				TriggerEvent("Salary:Add", tostring(Number), "Buff")
			end
        else
            TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
		end
	end
	return Premium(Panel[Passport])
end
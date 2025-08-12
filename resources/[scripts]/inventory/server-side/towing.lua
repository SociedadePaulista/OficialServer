local ropes = {}

RegisterServerEvent("towing:tow")
AddEventHandler("towing:tow", function(veh1, veh2)
    local source = source
	local Passport = vRP.Passport(source)
	if Passport then
        local Inventory = vRP.Inventory(Passport)
		for Slot,Value in pairs(Inventory) do
			if SplitOne(Value["item"],"-") == "rope" and vRP.TakeItem(Passport,Value["item"],1,true) then
			
                for k, player in pairs(GetPlayers()) do
                    TriggerClientEvent('towing:makeRope', player, veh1, veh2, source)
                end
                table.insert(ropes, {veh1, veh2, source})

                break

            end
        end
    end
end)

RegisterServerEvent("towing:stopTow")
AddEventHandler("towing:stopTow", function()
    local source = source
	local Passport = vRP.Passport(source) 
	if Passport then
        for k, rope in pairs(ropes) do
            if rope[3] == source then
                for i, player in pairs(GetPlayers()) do
                    TriggerClientEvent('towing:removeRope', player, source, rope[1], rope[2])
                    ropes[k] = nil
                end
            end
        end
        vRP.GenerateItem(Passport,"rope",1,true)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10 * 1000)
        if #ropes > 0 then
            for k, rope in pairs(ropes) do
                for i, player in pairs(GetPlayers()) do
                    TriggerClientEvent('towing:makeRope', player, rope[1], rope[2], rope[3], rope[3] == player)
                end
            end
        end
    end
end)

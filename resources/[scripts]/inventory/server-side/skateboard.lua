RegisterServerEvent('shareImOnSkate')
AddEventHandler('shareImOnSkate', function() 
    local src = source
    TriggerClientEvent('shareHeIsOnSkate', -1, src)
end)

RegisterServerEvent('TakeItemSkate')
AddEventHandler('TakeItemSkate', function() 
	local src = source
	local Passport = vRP.Passport(src)
	if Passport then
        vRP.GenerateItem(Passport,"skateboard",1,true)
    end
end)

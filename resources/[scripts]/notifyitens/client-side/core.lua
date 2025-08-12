-----------------------------------------------------------------------------------------------------------------------------------------
-- NotifyItens
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("NotifyItens")
AddEventHandler("NotifyItens",function(status)
	SendNUIMessage({ name = "NotifyItens", payload = { status[1], status[2], status[3], status[4] } })
end)
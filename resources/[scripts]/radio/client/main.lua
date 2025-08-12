local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

Dz = {}
Tunnel.bindInterface("radio", Dz)
local DzSV = Tunnel.getInterface("radio") 
local controle = 0
 
CreateThread(function()
    while true do
        local ms = 2500
        if controle > 0 then
            ms = 1000
            controle = controle - 1
        end
        Wait(ms)
    end
end)

---@type boolean
gHasBootAnimation = false


gPlayer = {
    hasRadio = false,
    isMenuOpen = false,
    onRadio = false,
    channel = 0,
    volume = 50,
    prop = nil,
    lastChannel = 0,
}

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then
        return
    end 
    leaveRadio()
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then
        return
    end
    leaveRadio()
    resetPlayer()
end)

RegisterNetEvent('radio:RadioNui')
AddEventHandler('radio:RadioNui', function()
    gPlayer.hasRadio = DzSV.hasRadioItem()

    if gPlayer.hasRadio then
        if not vRP.isHandcuffed() then
            toggleRadio(not gPlayer.isMenuOpen)
        else
            TriggerEvent('Notify','aviso','não pode fazer isso algemado',5000)
        end
    end
end)

RegisterNetEvent('radio:client:GetPlayersInRadioChannel', function()
    local playerlist = DzSV.GetPlayersInRadioChannel(gPlayer.channel)
    if playerlist then
        if Config.VoiceSystem == 'pma-voice' then
            for _, v in ipairs(playerlist) do
                v.isMuted = checkPlayerMute(v.pid)
            end
        end
        SendReactMessage("setPlayersInRadioChannel", playerlist)
    else
        SendReactMessage("setPlayersInRadioChannel", {})
    end
end)

RegisterCommand("radio", function()
    gPlayer.hasRadio = DzSV.hasRadioItem()

    if gPlayer.hasRadio then
        if not vRP.isHandcuffed() then
            toggleRadio(not gPlayer.isMenuOpen)
        else
            TriggerEvent('Notify','aviso','não pode fazer isso algemado',5000)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(2500)
        if gPlayer.onRadio then
            if not gPlayer.hasRadio then
                gPlayer.lastChannel = 0
                leaveRadio()
                notify(_t('leave_channel'), 'error')
                toggleRadio(false)
                SendReactMessage("resetRadio")
            end
        end
    end
end)
CreateThread(function()
    while true do
        Wait(1000)
        if gPlayer.isMenuOpen then
            SendReactMessage('setGameTime', CalculateTimeToDisplay())
        end
    end
end)

--- A simple wrapper around SendNUIMessage that you can use to
--- dispatch actions to the React frame.
---
---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
function SendReactMessage(action, data)
    SendNUIMessage({
        action = action, 
        data = data
    })
end

---@param name string resource name
---@return boolean
function hasResource(name)
    return GetResourceState(name):find('start') ~= nil
end

---@param dict string
function loadAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(0)
        end
    end
end

---@param ped number
---@return string dict
function getRadioDict(ped)
    return IsPedInAnyVehicle(ped, false) and 'cellphone@in_car@ds' or 'cellphone@'
end

---@param model number | string
function loadModel(model)
    if HasModelLoaded(model) then
        return
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
end


function customNotify(text, type, duration, icon)
    --[[
        You can add your custom notification plugin here.
        The following is just an example.
	]]
    if hasResource('ox_lib') then
        exports.ox_lib:notify({
            type = type,
            description = text,
            duration = duration,
            icon = icon
        })
    end
end

---@param type string inform / success / error
---@param text string Notification text
---@param duration? number (optional) Duration in miliseconds, custom notify.
---@param icon? string (optional) icon name, custom notify.
function notify(text, type, duration, icon)
    if Config.UseCustomNotify then
        customNotify(text, type, duration, icon)
    else
        TriggerEvent('Notify','aviso',text,5000)
    end
end

-- Calculates the current time to display, formatting the hour and minute values with leading zeros if needed.
---@return (table) A table containing the formatted time values.
--- - `hour` (number): The current hour.
--- - `minute` (string): The formatted minute (with leading zeros if needed).
function CalculateTimeToDisplay()
    local hour = GetClockHours()
    local minute = GetClockMinutes()

    local obj = {}

    if minute <= 9 then
        minute = "0" .. minute
    end

    obj.hour = hour
    obj.minute = minute

    return obj
end

function DisableDisplayControlActions()
    DisableAllControlActions(0)
    EnableControlAction(0, 21, true) -- INPUT_SPRINT
    EnableControlAction(0, 22, true) -- INPUT_JUMP
    EnableControlAction(0, 30, true) -- INPUT_MOVE_LR
    EnableControlAction(0, 31, true) -- INPUT_MOVE_UD
    EnableControlAction(0, 59, true) -- INPUT_VEH_MOVE_LR
    EnableControlAction(0, 71, true) -- INPUT_VEH_ACCELERATE
    EnableControlAction(0, 72, true) -- INPUT_VEH_BRAKE
end

function removeRadioProp()
    local radioProp = gPlayer.prop
    if radioPropt then 
        DetachEntity(radioProp, false, false)
        Wait(500)
        DeleteEntity(radioProp)
        gPlayer.prop = nil
    end
end

function resetPlayer()
    if gPlayer.prop then removeRadioProp() end
    gPlayer = {
        hasRadio = false,
        isMenuOpen = false,
        onRadio = false,
        channel = 0,
        volume = 50,
        prop = nil,
        lastChannel = 0
    }
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
end

function toggleRadioAnimation(pState)
    local model = `prop_cs_hand_radio`
    local ped = PlayerPedId()
    
    if pState then
        loadModel(model)
        gPlayer.prop = CreateObject(model, 0.0, 0.0, 0.0, true, true, true)
        AttachEntityToEntity(gPlayer.prop, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true,
            false, true, 0, true)
        SetModelAsNoLongerNeeded(model)

        local dict = getRadioDict(ped)
        loadAnimDict(dict)
        TaskPlayAnim(ped, dict, 'cellphone_text_in', 4.0, -1, -1, 50, 0, false, false, false)
        RemoveAnimDict(dict)
    else
        local dict = getRadioDict(ped)
        StopAnimTask(ped, dict, 'cellphone_text_in', 1.0)
        Wait(100)
        
        loadAnimDict(dict)
        TaskPlayAnim(ped, dict, 'cellphone_text_out', 7.0, -1, -1, 50, 0, false, false, false)
        Wait(200)
        StopAnimTask(ped, dict, 'cellphone_text_out', 1.0)
        RemoveAnimDict(dict)

        removeRadioProps()  -- Remova o prop depois de parar as animações
    end
end

function removeRadioProps()
    if DoesEntityExist(gPlayer.prop) then
        DeleteEntity(gPlayer.prop)
        gPlayer.prop = nil
    end
end

function toggleRadio(toggle)
    TriggerEvent('inv:notKeybind',toggle)
    toggleRadioAnimation(toggle)
    SetNuiFocus(toggle, toggle)
    SetNuiFocusKeepInput(toggle)
    gPlayer.isMenuOpen = toggle
    SendReactMessage('setRadioVisible', toggle)
    CreateThread(function()
        while gPlayer.isMenuOpen do
            DisableDisplayControlActions()
            Citizen.Wait(1)
        end
    end)
end

function leavePMAVoiceRadio()
    exports["pma-voice"]:removePlayerFromRadio()
    exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
end

function leaveSaltyChatRadio()
    local getPlayerRadioChannel = exports.saltychat:GetRadioChannel(true)
    if getPlayerRadioChannel or getPlayerRadioChannel ~= '' then
        exports.saltychat:SetRadioChannel('', true)
    end
end

function leaveRadio()
    if gPlayer.prop then removeRadioProp() end
    if Config.VoiceSystem == 'pma-voice' then
        leavePMAVoiceRadio()
    elseif Config.VoiceSystem == 'saltychat' then
        leaveSaltyChatRadio()
    end
    TriggerServerEvent('radio:server:SendPlayersInRadioChannel', gPlayer.channel)
    gPlayer.onRadio = false
    gPlayer.channel = 0
end

function connectToPMAVoiceRadio(channel)
    exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
    exports["pma-voice"]:setRadioChannel(channel)
end

function connectSaltyChatRadio(channel)
    exports.saltychat:SetRadioChannel(channel, true)
end



function connectToRadio(channel)
    if Config.VoiceSystem == 'pma-voice' then
        connectToPMAVoiceRadio(channel)
    elseif Config.VoiceSystem == 'saltychat' then
        connectSaltyChatRadio(channel)
    end
    TriggerServerEvent('radio:server:SendPlayersInRadioChannel', channel)
    gPlayer.onRadio = true
    gPlayer.channel = channel
end

function setVolumePMAVoiceRadio(value)
    exports["pma-voice"]:setRadioVolume(value)
end

function setVolumeSaltyChatRadio(value)
    local volumeLevel = value / 100.0
    exports.saltychat:SetRadioVolume(volumeLevel)
end

function checkPlayerMute(playerId)
    return false --exports["pma-voice"]:isPlayerMuted(playerId)
end

-- NUI'
RegisterNUICallback('joinRadio', function(channel, cb)
    local rchannel = tonumber(channel)

    if rchannel then
        if rchannel <= Config.MaxFrequency and rchannel ~= 0 then
            for k, v in pairs(Config.RestrictedChannels) do
            
                if tonumber(k) == rchannel then
                    for ka, va in pairs(v) do
                        if DzSV.getPerms(va) then
                            if controle == 0 then
                                controle = 5
                                connectToRadio(rchannel)
                                notify(_t('connected_to') .. channel .. '.00 MHz', 'success')
                                local retData = { status = true, connected = true, newChannel = gPlayer.channel }
                                cb(retData)
                                return
                            else
                                cb({ status = false })
                                return
                            end
                        else
                            notify(_t('restricted_channel'), 'error')
                            cb({ status = false })
                            return
                        end
                    end
                end
            end
            
            connectToRadio(rchannel)
            notify(_t('connected_to') .. channel .. '.00 MHz', 'success')
            local retData = { status = true, connected = true, newChannel = gPlayer.channel }
            cb(retData)
            return
        else
            notify(_t('invalid_frequency'), 'error')
        end
    else
        notify(_t('invalid_frequency'), 'error')
    end
    cb({ status = false })
end)

RegisterNUICallback('leaveRadio', function(_, cb)
    if gPlayer.onRadio then
        notify(_t('leave_channel'), 'error')
    end
    gPlayer.lastChannel = 0
    leaveRadio()
    cb({ status = true })
end)

RegisterNUICallback("volumeUp", function(_, cb)
    if gPlayer.volume <= 95 then
        gPlayer.volume = gPlayer.volume + 5
        if Config.VoiceSystem == 'pma-voice' then
            setVolumePMAVoiceRadio(gPlayer.volume)
        elseif Config.VoiceSystem == 'saltychat' then
            setVolumeSaltyChatRadio(gPlayer.volume)
        end
        local retData = { status = true, newVolume = gPlayer.volume }
        cb(retData)
        return
    end
    cb({ status = false })
end)

RegisterNUICallback("volumeDown", function(_, cb)
    if gPlayer.volume >= 10 then
        gPlayer.volume = gPlayer.volume - 5
        if Config.VoiceSystem == 'pma-voice' then
            setVolumePMAVoiceRadio(gPlayer.volume)
        elseif Config.VoiceSystem == 'saltychat' then
            setVolumeSaltyChatRadio(gPlayer.volume)
        end
        local retData = { status = true, newVolume = gPlayer.volume }
        cb(retData)
        return
    end
    cb({ status = false })
end)

RegisterNUICallback('poweredOff', function(_, cb)
    if gPlayer.onRadio then
        notify(_t('leave_channel'), 'error')
    end
    gPlayer.lastChannel = 0
    leaveRadio()
    toggleRadio(false)
    Wait(100)
    gHasBootAnimation = false
    cb({ status = true })
end)

RegisterNUICallback("getServerVoiceSystem", function(_, cb)
    cb(Config.VoiceSystem)
end)

RegisterNUICallback('hideFrame', function(_, cb)
    toggleRadio(false)
    cb('ok')
end)

RegisterNUICallback('getHasBootAnimation', function(_, cb)
    cb(gHasBootAnimation)
end)

RegisterNUICallback("setMutePlayer", function(source, cb)
    if Config.VoiceSystem == 'pma-voice' then
        exports["pma-voice"]:toggleMutePlayer(source)
    end
    cb({ status = true })
end)

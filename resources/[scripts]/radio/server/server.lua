-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
---------------------------------------------------------
vRPclient = Tunnel.getInterface("vRP")

--------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------

Dz = {}
Tunnel.bindInterface("radio",Dz)
DzCLIENT = Tunnel.getInterface("radio")


if Config.VoiceSystem == "pma-voice" then
    for channel, config in pairs(Config.RestrictedChannels) do
        -- exports['pma-voice']:addChannelCheck(channel)
        exports['pma-voice']:addChannelCheck(channel, function(source)
            local user = vRP.Passport(source)
            for ka, va in pairs(config) do
                return config and user
            end
        end)
    end
    SetConvarReplicated('voice_useNativeAudio', tostring(Config.RadioEffect))
    SetConvarReplicated('voice_enableSubmix', Config.RadioEffect and '1' or '0')
    SetConvarReplicated('voice_enableRadioAnim', Config.RadioAnimation and '1' or '0')
    SetConvarReplicated('voice_defaultRadio', Config.RadioKey)
end

function getPlayersInRadioChannel(channel)
    if Config.VoiceSystem == 'pma-voice' then
        return exports['pma-voice']:getPlayersInRadioChannel(channel)
    elseif Config.VoiceSystem == 'saltychat' then
        return exports.saltychat:GetPlayersInRadioChannel(tostring(channel))
    end 
    return nil
end

function getPlayerInfo(playerSource)
    local player = vRP.Passport(playerSource)
    if player then
        local playerName = vRP.Identity(player).name .. ' ' .. vRP.Identity(player).name2

        return {
            source = playerSource,
            name = playerName,
            isMuted = false
        }
    end
    return nil
end

function Dz.getPerms(perm)
    local src = source
    local user = vRP.Passport(src)
    if user then 
        if vRP.HasGroup(user, tostring(perm)) then
            return true
        end
    end
end

function Dz.hasRadioItem()
    local src = source
    local user = vRP.Passport(src)
    if user then
        return vRP.InventoryItemAmount(user,'radio')
    end
end

function Dz.GetPlayersInRadioChannel(channel)
    local players = exports['pma-voice']:getPlayersInRadioChannel(channel)

    local src = source
    local targetPlayer = nil
    local updatedPlayers = {}
  
    for pmaSource, saltySource in pairs(players) do
        local playerSource = (Config.VoiceSystem == 'pma-voice') and pmaSource or saltySource
        local playerInfo = getPlayerInfo(playerSource)
        
        if playerInfo then
            if playerSource == src then
                targetPlayer = playerInfo
            else
                updatedPlayers[#updatedPlayers + 1] = playerInfo
            end
        end
    end

    if targetPlayer then
        table.insert(updatedPlayers, 1, targetPlayer)
    end

    return updatedPlayers
end

RegisterNetEvent('radio:server:SendPlayersInRadioChannel', function(channel)
 
    local players = exports['pma-voice']:getPlayersInRadioChannel(channel)

    Wait(100)
    if not players then
        return
    end

    for pmaSource, saltySource in pairs(players) do
        local playerSource = (Config.VoiceSystem == 'pma-voice') and pmaSource or saltySource
        TriggerClientEvent('radio:client:GetPlayersInRadioChannel', playerSource)
    end
end)


local radioOld = {}

RegisterNetEvent('sv:voiceTalking', function(status,channel)
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then 
        local identidade = vRP.Identity(user_id)
        if identidade then 
            local players = exports['pma-voice']:getPlayersInRadioChannel(channel)
            if players then 
                for pmaSource, saltySource in pairs(players) do
                    local playerSource = (Config.VoiceSystem == 'pma-voice') and pmaSource or saltySource
                    if playerSource then 
                        radioOld[user_id] = playerSource
                        TriggerClientEvent('radio:speakRadio',playerSource,identidade.firstname,status,channel)
                    end
                end
            else

                if radioOld[user_id] then 
                    for k ,v in pairs(radioOld) do
                        for pmaSource, saltySource in pairs(v) do
                            local playerSource = (Config.VoiceSystem == 'pma-voice') and pmaSource or saltySource
                            TriggerClientEvent('radio:speakRadio',playerSource,identidade.firstname,status,channel)
                        end
                    end
                end
            end
        end
    end
end)

print("Vazado pela Dogz1m Community")
print("Modificado e alterado Por: xINSANOUx#1359")
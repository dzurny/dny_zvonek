local ESX = exports['es_extended']:getSharedObject()
local lib = exports.ox_lib

local activeTargets = {}
local lastRingTime = 0

local function canRing()
    local currentTime = GetGameTimer()
    local timeSinceLastRing = (currentTime - lastRingTime) / 1000 -- Convert to seconds
    
    if timeSinceLastRing < Dny.Cooldown then
        local remainingTime = math.ceil(Dny.Cooldown - timeSinceLastRing)
        exports.ox_lib:notify({
            title = Dny.Locale.title,
            description = string.format(Dny.Locale.cooldown, remainingTime),
            type = 'error'
        })
        return false
    end
    
    return true
end

local function createTargets()
    for i, location in ipairs(Dny.Police.Locations) do
        local targetId = exports.ox_target:addBoxZone({
            coords = location.coords,
            size = vec3(1.0, 1.0, 3.0),
            rotation = 0,
            debug = false,
            options = {
                {
                    name = 'dny_zvonek_' .. i,
                    icon = 'fas fa-bell',
                    label = Dny.Locale.zvonek,
                    onSelect = function()
                        if not canRing() then
                            return
                        end
                        
                        local player = ESX.GetPlayerData()
                        local playerName = player.name or 'Unknown'
                        
                        lastRingTime = GetGameTimer()
                        
                        local dispatchData = {
                            title = Dny.Police.Dispatch.title,
                            message = string.format(Dny.Police.Dispatch.message, playerName),
                            coords = location.coords,
                            blip = Dny.Police.Dispatch.Blip,
                            flash = Dny.Police.Dispatch.flash,
                            sound = Dny.Police.Dispatch.sound,
                            jobs = Dny.Police.Jobs
                        }
                        
                        exports['cd_dispatch']:AddNotification(dispatchData)
                        exports.ox_lib:notify({
                            title = Dny.Locale.title,
                            description = Dny.Locale.zazvonil,
                            type = 'success'
                        })
                    end
                }
            }
        })
        
        activeTargets[i] = targetId
    end
end

local function removeTargets()
    for i, targetId in ipairs(activeTargets) do
        if targetId then
            exports.ox_target:removeZone(targetId)
            activeTargets[i] = nil
        end
    end
end

CreateThread(function()
    Wait(1000)
    
    if GetResourceState('es_extended') == 'started' and 
       GetResourceState('ox_target') == 'started' and 
       GetResourceState('ox_lib') == 'started' then
        createTargets()
    else
        if Dny.Debug then
            if GetResourceState('es_extended') ~= 'started' then
                print('dny_zvonek: es_extended not started')
            end
            if GetResourceState('ox_target') ~= 'started' then
                print('dny_zvonek: ox_target not started')
            end
            if GetResourceState('ox_lib') ~= 'started' then
                print('dny_zvonek: ox_lib not started')
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        removeTargets()
    end
end)

exports('createTargets', createTargets)
exports('removeTargets', removeTargets)


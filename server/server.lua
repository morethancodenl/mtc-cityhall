config = require('config')

local function isCloseToCityhall(coords)
    local close = false
    for _, locationData in pairs(config.locations) do
        if locationData.enabled then
            local dist = #(coords - vec3(locationData.coords.x, locationData.coords.y, locationData.coords.z))
            if dist < 5.0 then
                close = true
                break
            end
        end
    end
    return close
end

RegisterNetEvent('mtc-cityhall:server:ApplyJob', function(id)
    local src = source
    local xPlayer = exports.qbx_core:GetPlayer(src)
    if not xPlayer then return end

    local job = config.jobs[id]
    if not job then return end

    if not isCloseToCityhall(GetEntityCoords(GetPlayerPed(src))) then
        exports.qbx_core:Notify(src, locale('not_near_cityhall'), 'error')
        return
    end

    exports.qbx_core:SetJob(xPlayer.PlayerData.citizenid, job.job, 0)
    if config.RenewedPhone then 
        exports['qb-phone']:hireUser(job.job, xPlayer.PlayerData.citizenid, 0)
    end
    exports.qbx_core:Notify(src, locale('hired', job.label), 'success')
end)

RegisterNetEvent('mtc-cityhall:server:BuyIdentity', function(id)
    local src = source
    local xPlayer = exports.qbx_core:GetPlayer(src)
    if not xPlayer then return end

    local item = config.items[id]
    if not item then return end

    if not isCloseToCityhall(GetEntityCoords(GetPlayerPed(src))) then
        exports.qbx_core:Notify(src, locale('not_near_cityhall'), 'error')
        return
    end

    if not exports.ox_inventory:CanCarryItem(src, item.item) then
        exports.qbx_core:Notify(src, locale('no_space'), 'error')
        return
    end

    if not xPlayer.Functions.RemoveMoney('bank', item.price, "Cityhall purchase") then 
        exports.qbx_core:Notify(src, locale('not_enough_money'), 'error')
        return 
    end

    if not giveIdCard(src, item) then  -- Handles id_card items using qb-inventory or um_idcard if it was not an id_card give the item to the user
        exports.ox_inventory:AddItem(src, item.item)
    end
    
    exports.qbx_core:Notify(src, locale('bought', item.label), 'success')
end)

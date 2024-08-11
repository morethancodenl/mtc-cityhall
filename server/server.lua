RegisterNetEvent('mtc-cityhall:server:ApplyJob', function(id)
    local xPlayer = exports.qbx_core:GetPlayer(source)
    if not xPlayer then return end

    local job = Config.jobs[id]
    if not job then return end

    xPlayer.Functions.SetJob(job.job, 0)
    if Config.RenewedPhone then 
        exports['qb-phone']:hireUser(job.job, Player.PlayerData.citizenid, 0)
    end
    TriggerClientEvent('QBCore:Notify', source, Lang['hired']:format(job.label), 'success')
end)

RegisterNetEvent('mtc-cityhall:server:BuyIdentity', function(id)
    local xPlayer = exports.qbx_core:GetPlayer(source)
    if not xPlayer then return end

    local item = Config.items[id]
    if not item then return end

    if not exports.ox_inventory:CanCarryItem(source, item.item) then
        TriggerClientEvent('QBCore:Notify', source, Lang['no_space'], 'error')
        return
    end

    if not xPlayer.Functions.RemoveMoney('bank', item.price, "Cityhall purchase") then 
        TriggerClientEvent('QBCore:Notify', source, Lang['not_enough_money'], 'error')
        return 
    end

    if not giveIdCard(source, item) then  -- Handles id_card items using qb-inventory or um_idcard if it was not an id_card give the item to the user
        exports.ox_inventory:AddItem(source, item.item)
    end
    
    TriggerClientEvent('QBCore:Notify', source, Lang['bought']:format(item.label), 'success')
end)

RegisterNetEvent('mtc-cityhall:server:ApplyJob', function(id)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local job = Config.jobs[id]
    if not job then return end

    Player.Functions.SetJob(job.job, 0)
    if Config.RenewedPhone then 
        exports['qb-phone']:hireUser(job.job, Player.PlayerData.citizenid, 0)
    end
    TriggerClientEvent('QBCore:Notify', source, Lang['hired']:format(job.label), 'success')
end)

RegisterNetEvent('mtc-cityhall:server:BuyIdentity', function(id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local item = Config.items[id]
    if not item then return end

    if not Player.Functions.RemoveMoney('bank', item.price, "Cityhall purchase") then 
        TriggerClientEvent('QBCore:Notify', src, Lang['not_enough_money'], 'error')
        return 
    end

    if not giveIdCard(src, item) then  -- Handles id_card items using qb-inventory or um_idcard if it was not an id_card give the item to the user
        Player.Functions.AddItem(item.item, 1, false)
    end
    
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], 'add')
    TriggerClientEvent('QBCore:Notify', src, Lang['bought']:format(item.label), 'success')
end)

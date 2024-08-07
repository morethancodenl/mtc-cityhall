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

    local info = {}
    local metadata = {}
    if item.item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        metadata.description = "Citizen ID: " .. info.citizenid .. "  \nFirstname: " .. info.firstname .. "  \n Lastname: " .. info.lastname .. "  \nBirthdate: " .. info.birthdate .. "  \nGender: " .. info.gender .. "  \nNationality: " .. info.nationality
    elseif item.item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.type = "Class C Driver License"
        metadata.type = "Class C"
        metadata.description = "Firstname: " .. info.firstname .. "  \n Lastname: " .. info.lastname .. "  \nBirthdate: " .. info.birthdate .. "  \nGender: " .. info.gender
    elseif item.item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        metadata.description = "Firstname: " .. info.firstname .. "  \n Lastname: " .. info.lastname .. "  \nBirthdate: " .. info.birthdate .. "  \nGender: " .. info.gender
    end
    if Config.OX_Inventory then 
        exports.ox_inventory:AddItem(source, item.item, 1, metadata)
    else
        Player.Functions.AddItem(item.item, 1, false, info)
    end
    
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], 'add')
    TriggerClientEvent('QBCore:Notify', src, Lang['bought']:format(item.label), 'success')
end)

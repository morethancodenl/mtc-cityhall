local function default(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {}
    if item.item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item.item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.type = "Class C Driver License"
    elseif item.item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
    end

    Player.Functions.AddItem(item.item, 1, false, info)

    return true
end

local function bl_idcard(source, item)
    exports.bl_idcard:createLicense(source, item.item)
end

local function um_idcard(source, item)
    exports['um-idcard']:CreateMetaLicense(source, item.item)
end

local function qbx_idcard(source, item)
    exports['qbx_idcard']:CreateMetaLicense(source, item.item)
end

function giveIdCard(source, item)
    if not item.id_card then return false end
    
    if Config.idcard == "default" then 
        return default(source, item)
    end

    if Config.idcard == "bl_idcard" then 
        return bl_idcard(source, item)
    end

    if Config.idcard == "um_idcard" then 
        return um_idcard(source, item)
    end

    if Config.idcard == "qbx_idcard" then 
        return qbx_idcard(source, item)
    end


    print("[ERROR] Config.idcard is not setup correctly, please edit the config.lua to match the comment next to it")
    return false
end
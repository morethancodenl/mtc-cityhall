local function bl_idcard(source, item)
    exports.bl_idcard:createLicense(source, item.item)
    return true
end

local function um_idcard(source, item)
    exports['um-idcard']:CreateMetaLicense(source, item.item)
    return true
end

local function qbx_idcard(source, item)
    exports['qbx_idcard']:CreateMetaLicense(source, item.item)
    return true
end

function giveIdCard(source, item)
    if not item.id_card then return false end

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

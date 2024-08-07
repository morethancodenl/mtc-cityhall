QBCore = exports['qb-core']:GetCoreObject()

Config = {}

Config.ox_inventory = true --Using OX_Inventory ?
Config.RenewedPhone = false --> Set to true if you are using Renewed scripts their qb-phone
Config.idcard = "default" -- default, bl_idcard, qbx_idcard, um_idcard

-- Ped spawner
Config.ped = {
    enabled = true,
    model = "a_m_m_indian_01",
    coords = vector4(-266.88833618164, -961.62231445313, 30.227128982544, 210.22946166992),
    label = "Open cityhall"
}

Config.blip = {
    enabled = true,
    Name = "Cityhall",
    SpriteId = 487,
    Color = 2,
    Scale = 1.3,
    ShortRange = true,
    Alpha = 255,
    Coords = vector3(-266.88833618164, -961.62231445313, 31.227128982544)
}

-- Jobs for hire
Config.jobs = {
    {
        job = "trucker",
        label = "Trucker",
    },
    {
        job = "taxi",
        label = "Taxi",
    },
    {
        job = "tow",
        label = "Tow Truck",
    },
    {
        job = "reporter",
        label = "News Reporter",
    },
}

-- Items for purchase
Config.items = {{
    item = "id_card",
    meta = 'id',
    label = "ID Card",
    price = 100,
    id_card = true
}, {
    item = "driver_license",
    label = "Driver License",
    meta = 'driver',
    price = 100,
    id_card = true,
}, {
    item = "weaponlicense",
    label = "Weapon License",
    meta = 'weapon',
    price = 100,
    id_card = true
}}

-- Items shown in the information tab
Config.licenseItems = {{
    item = 'id_card',
    label = 'ID Card'
}, {
    item = 'driver_license',
    label = 'Driver License'
}, {
    item = 'weaponlicense',
    label = 'Weapon License'
}}

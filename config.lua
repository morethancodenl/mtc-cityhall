QBCore = exports['qb-core']:GetCoreObject()

Config = {}

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
        salary = 60
    },
    {
        job = "taxi",
        label = "Taxi",
        salary = 50
    },
    {
        job = "tow",
        label = "Tow Truck",
        salary = 70
    },
    {
        job = "reporter",
        label = "News Reporter",
        salary = 50 
    },
    {
        job = "garbage",
        label = "Garbage Man",
        salary = 80 
    },
    {
        job = "bus",
        label = "Bus Driver",
        salary = 50 
    },
}

-- Items for purchase
Config.items = {{
    item = "id_card",
    meta = 'id',
    label = "ID Card",
    price = 100
}, {
    item = "driver_license",
    label = "Driver License",
    meta = 'driver',
    price = 100
}, {
    item = "weaponlicense",
    label = "Weapon License",
    meta = 'weapon',
    price = 100
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

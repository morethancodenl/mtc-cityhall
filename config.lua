QBCore = exports['qb-core']:GetCoreObject()

Config = {}

Config.RenewedPhone = false --> Set to true if you are using Renewed scripts their qb-phone

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
        salary = 50
    },
    {
        job = "taxi",
        label = "Taxi",
        salary = 50
    },
    {
        job = "tow",
        label = "Tow Truck",
        salary = 50
    },
    {
        job = "reporter",
        label = "News Reporter",
        salary = 50
    },
}

-- Items for purchase
Config.items = {{
    item = "id_card", -- Name of ID Document
    meta = 'id', -- Metadata to check if eligible for ID document
    label = "ID Card", -- Label to show in the menu for the ID document
    price = 100 -- Price of the ID document
}, {
    item = "driver_license", -- Name of ID Document
    label = "Driver License",-- Label to show in the menu for the ID document
    meta = 'driver',  -- Metadata to check if eligible for ID document
    price = 100 -- Price of the ID document
}, {
    item = "weaponlicense", -- Name of ID Document
    label = "Weapon License", -- Label to show in the menu for the ID document
    meta = 'weapon',  -- Metadata to check if eligible for ID document
    --job = 'ammunation' -- Job check this will show the ID document to anyone with this job, Make sure to comment out "meta" if wanting to use the job check
    price = 100 -- Price of the ID document
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

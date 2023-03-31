QBCore = exports['qb-core']:GetCoreObject()

Config = {}

-- Jobs for hire
Config.jobs = {
    {
        job = "police",
        label = "LSPD",
        salary = 100,
    },
    {
        job = 'ambulance',
        label = "EMS",
        salary = -1,
    }
}

-- Items for purchase
Config.items = {
    {
        item = "id_card",
        label = "ID Card",
        price = 100,
    },
    {
        item = "driver_license",
        label = "Driver License",
        price = 100,
    }
}


-- Items shown in the information tab
Config.licenseItems = {
    {
        item = 'id_card',
        label = 'ID Card',
    },
    {
        item = 'driver_license',
        label = 'Driver License',
    }
}
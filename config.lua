return {
    RenewedPhone = false, --> Set to true if you are using Renewed scripts their qb-phone
    idcard = "qbx_idcard", -- bl_idcard, qbx_idcard, um_idcard

    locations = {
        cityhall = {
            enabled = true,
            model = "a_m_m_indian_01",
            coords = vec4(-266.88, -961.62, 30.22, 210.22),
            label = "Open cityhall",
            blipEnabled = true,
            blipData = {
                Name = "Cityhall",
                SpriteId = 487,
                Color = 2,
                Scale = 1.3,
                ShortRange = true,
                Coords = vec3(-266.88, -961.62, 30.22),
                Alpha = 255,
            }
        },
        cityhall2 = {
            enabled = true,
            model = "a_m_m_indian_01",
            coords = vec4(-544.55, -203.27, 37.22, 211.0),
            label = "Open cityhall",
            blipEnabled = true,
            blipData = {
                Name = "Cityhall",
                SpriteId = 487,
                Color = 2,
                Scale = 1.3,
                ShortRange = true,
                Coords = vec3(-544.55, -203.27, 37.22),
                Alpha = 255,
            }
        }
    },
    -- Jobs for hire
    jobs = {
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
    },

    -- Items for purchase
    items = {{
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
    }},

    -- Items shown in the information tab
    licenseItems = {{
        item = 'id_card',
        label = 'ID Card'
    }, {
        item = 'driver_license',
        label = 'Driver License'
    }, {
        item = 'weaponlicense',
        label = 'Weapon License'
    }}
}

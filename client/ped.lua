CreateThread(function()
    if not Config.ped.enabled then return end

    RequestModel(joaat(Config.ped.model))
    while not HasModelLoaded(joaat(Config.ped.model)) do
        Wait(100)
    end

    local ped = CreatePed(4, joaat(Config.ped.model), Config.ped.coords, 0.0, false, false)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanPlayAmbientAnims(ped, true)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, Config.ped.coords.w)

    -- Change to your target, ox_target should work because of the compatibility layer
    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                event = "mtc-cityhall:client:open",
                icon = "fas fa-id-card",
                label = Config.ped.label,
            }
        },
        distance = 2.5
    })
end)
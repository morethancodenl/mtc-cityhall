local spawnedPed = nil

local point = lib.points.new({coords = config.ped.coords.xyz, distance = 15})

function point:onEnter()
    if spawnedPed then return end
    local pedHash = joaat(config.ped.model)
    lib.requestModel(pedHash)

    spawnedPed = CreatePed(4, pedHash, config.ped.coords, 0.0, false, false)

    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    SetPedDiesWhenInjured(spawnedPed, false)
    SetPedCanPlayAmbientAnims(spawnedPed, true)
    SetPedCanRagdollFromPlayerImpact(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetEntityHeading(spawnedPed, config.ped.coords.w)

    exports.ox_target:addLocalEntity(spawnedPed, {
        {
            event = "mtc-cityhall:client:open",
            icon = "fas fa-id-card",
            label = config.ped.label
        }
    })
end

function point:onExit()
    if not spawnedPed then return end
    DeleteEntity(spawnedPed)
    spawnedPed = nil
end

local spawnedPed = nil

local point = lib.points.new({coords = Config.ped.coords.xyz, distance = 15})

function point:onEnter()
    if spawnedPed then return end
    local pedHash = joaat(Config.ped.model)
    lib.requestModel(pedHash)

    spawnedPed = CreatePed(4, pedHash, Config.ped.coords, 0.0, false,
                                 false)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanPlayAmbientAnims(ped, true)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, Config.ped.coords.w)

    exports.ox_target:addLocalEntity(spawnedPed, {
        {
            event = "mtc-cityhall:client:open",
            icon = "fas fa-id-card",
            label = Config.ped.label
        }
    })
end

function point:onExit()
    if not spawnedPed then return end
    DeleteEntity(spawnedPed)
    spawnedPed = nil
end

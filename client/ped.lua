local spawnedPed = nil
local cached_points = {}

for id, pointData in pairs(config.locations) do
    if pointData.enabled then
        local point = lib.points.new({ coords = pointData.coords, distance = 15})

        if pointData.blipEnabled then
            GenerateBlip(pointData.blipData)
        end

        function point:onEnter()
            if spawnedPed then return end
            local pedHash = joaat(pointData.model)
            lib.requestModel(pedHash)

            spawnedPed = CreatePed(4, pedHash, pointData.coords.x, pointData.coords.y, pointData.coords.z, pointData.coords.w, false, false)

            SetBlockingOfNonTemporaryEvents(spawnedPed, true)
            SetPedDiesWhenInjured(spawnedPed, false)
            SetPedCanPlayAmbientAnims(spawnedPed, true)
            SetPedCanRagdollFromPlayerImpact(spawnedPed, false)
            SetEntityInvincible(spawnedPed, true)
            FreezeEntityPosition(spawnedPed, true)

            exports.ox_target:addLocalEntity(spawnedPed, {
                {
                    event = "mtc-cityhall:client:open",
                    icon = "fas fa-id-card",
                    label = pointData.label,
                }
            })

            SetModelAsNoLongerNeeded(pedHash)
        end

        function point:onExit()
            if not spawnedPed then return end
            DeleteEntity(spawnedPed)
            spawnedPed = nil
        end

        cached_points[id] = point
    end
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    if spawnedPed then
        DeleteEntity(spawnedPed)
        spawnedPed = nil
    end
    for id, point in pairs(cached_points) do
        point:remove()
    end
end)
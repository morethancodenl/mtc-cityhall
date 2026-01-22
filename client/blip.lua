local cached_blips = {}

function GenerateBlip(data)
    local blip = AddBlipForCoord(data.Coords.x, data.Coords.y, data.Coords.z)
    SetBlipSprite(blip, data.SpriteId)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, data.Scale)
    SetBlipColour(blip, data.Color)
    SetBlipAsShortRange(blip, data.ShortRange)
    SetBlipAlpha(blip, data.Alpha)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.Name)
    EndTextCommandSetBlipName(blip)
    cached_blips[#cached_blips+1] = blip
end

AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
        for blipId in pairs(cached_blips) do
            RemoveBlip(blipId)
        end
   end
end)
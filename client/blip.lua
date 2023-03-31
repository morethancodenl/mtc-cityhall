local blip = nil

function GenerateBlip(data)
    blip = AddBlipForCoord(data.Coords.x, data.Coords.y, data.Coords.z)
    SetBlipSprite(blip, data.SpriteId)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, data.Scale)
    SetBlipColour(blip, data.Color)
    SetBlipAsShortRange(blip, data.ShortRange)
    SetBlipAlpha(blip, data.Alpha)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.Name)
    EndTextCommandSetBlipName(blip)
end

AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
        if blip ~= nil then
             RemoveBlip(blip)
        end
   end
end)

CreateThread(function()
    if not Config.blip.enabled then return end
    GenerateBlip(Config.blip)
end)
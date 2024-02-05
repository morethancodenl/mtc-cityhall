RegisterNuiCallback('close', function(data, cb)
    NUI:Close()
    cb('ok')
end)

RegisterNuiCallback('ApplyJob', function(data, cb)
    TriggerServerEvent('mtc-cityhall:server:ApplyJob', data.id)
    cb('ok')
end)

RegisterNuiCallback('BuyIdentity', function(data, cb)
    TriggerServerEvent('mtc-cityhall:server:BuyIdentity', data.id)
    cb('ok')
end)

RegisterNuiCallback('ApplyApplication', function(data, cb)
    TriggerServerEvent('mtc-cityhall:server:ApplyApplication', data)
    cb('ok')
end)

RegisterNuiCallback('ChangeApplicationStatus', function(data, cb)
    TriggerServerEvent('mtc-cityhall:server:ChangeApplicationStatus', data)
    cb('ok')
end)

RegisterNuiCallback('GetApplications', function(_, cb)
    local applications = lib.callback.await('mtc-cityhall:server:GetApplications', false)
    cb(applications)
end)

RegisterNuiCallback('DeleteApplication', function (data, cb)
    TriggerServerEvent('mtc-cityhall:server:DeleteApplication', data)
    cb('ok')
end)
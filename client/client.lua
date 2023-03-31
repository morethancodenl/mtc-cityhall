CreateThread(function()
    -- Setup the NUI. these actions only need to be done on resource start/player join
    Wait(100)
    NUI:SetupJobs()
    NUI:SetupItems()
end)


exports("Open", function()
    NUI:Open()
end)

RegisterNetEvent('mtc:cityhall:client:open', function ()
    NUI:Open()
end)

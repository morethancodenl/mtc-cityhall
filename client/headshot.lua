--- Clear all headshots
local function ClearHeadshots()
    for i = 1, 32 do
        if IsPedheadshotValid(i) then
            UnregisterPedheadshot(i)
        end
    end
end

--- Get the headshot of the player
-- @return string|false The URL of the headshot, or false if it failed
function GetHeadshot()
    ClearHeadshots()
    local ped = PlayerPedId()

    if not DoesEntityExist(ped) then
        -- shouldn't happen, but just in case
        return false
    end

    local handle, timer = RegisterPedheadshot(ped), GetGameTimer() + 5000
    while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do
        Wait(50)
        if GetGameTimer() >= timer then
            return false
        end
    end

    local txd = GetPedheadshotTxdString(handle)
    local url = string.format("https://nui-img/%s/%s", txd, txd)
    return url
end

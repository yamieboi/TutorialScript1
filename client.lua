local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 60)    
    ClearDrawOrigin()
end

local SPOTS = {
    {
        ['name'] = 'Facebook Trap',
        ['coords'] = vector3(-1048.14, -238.02, 44.02),
        ['label'] = 'Facebook Trap [E]',
    },
    {
        ['name'] = 'Facebook Trap',
        ['coords'] = vector3(-1053.28, -235.63, 44.02),
        ['label'] = 'Facebook Trap2 [E]',
    }
}

CreateThread(function ()
    while true do
 
        for key, value in pairs(SPOTS) do
            local coords = value.coords
            local label = value.label
            if #(coords - GetEntityCoords(PlayerPedId())) <= 5 then
                DrawText3D(coords.x,coords.y,coords.z,label)
            end

        end
        Wait(1)
    end
end)
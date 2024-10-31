local cooldowns = {}

onSelect = function(data)
    local player = data.entity
    if cooldowns[player] and cooldowns[player] > GetGameTimer() then
        local timeLeft = math.floor((cooldowns[player] - GetGameTimer()) / 1000)
    lib.notify({
        title = K.locales.cooldown,
        description = K.locales.cooldown,
        type = 'success'
})
        return
    end

    local function main()
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        local _, dist = lib.getClosestObject(pos, 2.0)

        local count = ox_inventory:Search('count', K.Robitem)
        if count <= 0 then
            lib.notify({type = 'error', description = K.locales.eioleitemia, icon = "fa-solid fa-power-off"})
            return
        end

        local result = lib.skillCheck({K.Skillcheck, K.Skillcheck, K.Skillcheck, K.Skillcheck}, K.Inputs)
        if not result then
            lib.notify({type = 'error', description = K.locales.failed})
            return
        end

        if K.Notify == "cd_dispatch" then
            local data = exports['cd_dispatch']:GetPlayerInfo()
            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = K.Jobs,
                coords = data.coords,
                title = K.locales.robnotify,
                message = data.sex .. ' on ryöstämässä konttia kohteessa: ' .. data.street,
                flash = 0,
                unique_id = data.unique_id,
                sound = 1,
                blip = {
                    sprite = 59,
                    scale = 1.2,
                    colour = 39,
                    flashes = false,
                    text = K.locales.robnotify,
                    time = 5,
                    sound = 1,
                }
            })
        elseif K.Notify == "quasar-dispatch" then
            local playerData = exports['qs-dispatch']:GetPlayerInfo()
            TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
                job = K.Jobs,
                callLocation = playerData.coords,
                callCode = { code = K.locales.robnotify },
                message = "A " .. playerData.sex .. " on ryöstämässä konttia kohteessa: " .. playerData.street_1,
                flashes = false,
                image = nil,
                blip = {
                    sprite = 488,
                    scale = 1.5,
                    colour = 1,
                    flashes = true,
                    text = K.locales.robnotify,
                    time = 20000,
                }
            })
        elseif K.Notify == "core-dispatch" then
            TriggerServerEvent(
                "core_dispatch:addMessage",
                K.locales.robnotify,
                {pos.x, pos.y, pos.z},
                "police",
                5000,
                11,
                5
            )
        elseif K.Notify == "op-dispatch" then
            for _, job in ipairs(K.Jobs) do
                TriggerServerEvent('Opto_dispatch:Server:SendAlert', job, K.locales.robnotify, K.locales.robnotify, pos, false, GetPlayerServerId(PlayerId()))
            end
        end
        RequestAmbientAudioBank("DLC_HEIST_FLEECA_SOUNDSET", 0)
        RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL", 0)
        RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2", 0)
        Wait(100)
        local playerPed = PlayerPedId()
        local soundID = GetSoundId()
        PlaySoundFromEntity(soundID, "Drill", playerPed, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)
        ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 5.0)
        if lib.progressCircle({
            duration = K.RobbingTime,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
            },
            anim = {
                dict = 'anim@heists@fleeca_bank@drilling',
                clip = 'drill_straight_end',
                flag = 1
            },
            prop = {
                model = `hei_prop_heist_drill`,
                pos = vec3(0.10, 0.08, 0.30),
                rot = vec3(5.0, 5.0, -180.5)
                
            },
        }) then
            StopSound(soundID)
            ReleaseSoundId(soundID)
            StopGameplayCamShaking(true)
            lib.callback.await('khalexi_kontit:payout')
            lib.callback.await('khalexi_kontit:poistaitemi')
            cooldowns[player] = GetGameTimer() + K.Cooldown
            else
                StopSound(soundID)
                ReleaseSoundId(soundID)
                StopGameplayCamShaking(true)
    lib.notify({
        title = K.locales.cooldown,
        description = K.locales.cooldown,
        type = 'success'
})
        end
        ClearPedTasks(playerPed)
    end

    main()
end

CreateThread(function()
    local options = {
        label = K.locales.container,
        icon = K.RobIcon,
        distance = K.Distance,
        onSelect = onSelect
    }

    local radius = K.Radius

    for _, coords in ipairs(K.Coordinates) do
        exports.ox_target:addSphereZone({
            coords = coords.position,
            radius = coords.radius or radius,
            options = options,
            debug = false 
        })
    end
end)

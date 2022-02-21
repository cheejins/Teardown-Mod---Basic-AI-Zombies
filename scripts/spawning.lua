local spawnTimer = { time = 0, rpm = 800}

function initSpawnMenu()

    showSpawnMenu = false

    selectedZombiePrefabs = {

        {
            fileName = 'zombie',
            name = 'Civilian',
            selected = true,
        },

        {
            fileName = 'zombie_scientist',
            name = 'Scientist',
            selected = true,
        },

        {
            fileName = 'zombie_soldier_swat',
            name = 'SWAT',
            selected = true
        },

        {
            fileName = 'zombie_soldier',
            name = 'Soldier',
            selected = true,
        },

    }

end

function manageZombieSpawning()

    checkBuiltInSpawning()

    if GetString('game.player.tool') == 'zombieController' and GetPlayerVehicle() == 0 then

        if InputPressed('rmb') then
            showSpawnMenu = not showSpawnMenu
        end

        if showSpawnMenu then -- Menu is showing.

            UiMakeInteractive()

        else -- Allow spawning.

            spawnZombies()

        end

    end

end

function spawnZombies()

    if InputDown('lmb') and not showSpawnMenu then

        if spawnTimer.time <= 0 then
            TimerResetTime(spawnTimer)

            -- Choose random zombie to spawn.
            local selectedZombies = {}
            for i = 1, #selectedZombiePrefabs do
                if selectedZombiePrefabs[i].selected then
                    table.insert(selectedZombies, i)
                end
            end
            local prefabFilename = selectedZombiePrefabs[GetRandomIndex(selectedZombies)].fileName

            -- Spawn a random zombie from the selected zombies.
            local hit, hitPos = raycastFromTransform(GetCameraTransform())
            if hit then

                local entities = Spawn('MOD/prefabs/' .. prefabFilename .. '.xml', Transform(hitPos))
                for key, entity in pairs(entities) do

                    if GetEntityType(entity) == "body" then

                        if HasTag(entity, 'ai_zombie') then

                            activateZombie(entity)
                            SetTag(entity, 'zombie_spawned')


                        end

                    end

                end

            end

        end

    end

    TimerRunTime(spawnTimer)

end

--- Build a zombie object and associate it to a zombie body.
function activateZombie(body)

    zombieId = zombieId + 1
    local zombie = createZombie(body, zombieId, true)
    SetTag(body, 'zombie_activated')

    table.insert(zombiesTable, zombie)

end


--- Check if a zombie was spawned through the spawner.
function checkBuiltInSpawning()

    local bodies = FindBodies('ai_zombie', true)
    for key, body in pairs(bodies) do
        if HasTag('zombie_spawned') and not HasTag(body, 'zombie_activated') then

            activateZombie(body)

        end
    end

end
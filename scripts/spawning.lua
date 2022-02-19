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
            fileName = 'zombie_soldier',
            name = 'Soldier',
            selected = true,
        },

        {
            fileName = 'zombie_soldier_swat',
            name = 'SWAT',
            selected = true
        },

    }

end

function manageZombieSpawning()

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

    if InputPressed('lmb') and not showSpawnMenu then

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

                        zombieId = zombieId + 1
                        local zombie = createZombie(entity, zombieId, true)

                        table.insert(zombiesTable, zombie)

                    end

                end

            end

        end

    end

end
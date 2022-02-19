function initSpawnMenu()

    showSpawnMenu = false

    selectedZombiePrefabs = {

        {
            fileName = 'zombie.xml',
            name = 'Civilian',
            selected = true,
        },

        {
            fileName = 'zombie_scientist.xml',
            name = 'Scientist',
            selected = false,
        },

        {
            fileName = 'zombie_soldier.xml',
            name = 'Soldier',
            selected = false,
        },

        {
            fileName = 'zombie_soldier_swat.xml',
            name = 'SWAT',
            selected = false
        },

    }

end

function manageZombieSpawning()

    if GetString('game.player.tool') == 'zombieController' and InputPressed('rmb') then
        showSpawnMenu = not showSpawnMenu
    end

    if showSpawnMenu then -- Menu is showing.

        UiMakeInteractive()

    else -- Allow spawning.

        if InputPressed('lmb') and not showSpawnMenu then

            -- Choose random zombie to spawn.
            local selectedZombies = {}
            for i = 1, #selectedZombiePrefabs do
                if selectedZombiePrefabs[i].selected then
                    table.insert(selectedZombies, i)
                end
            end
            local prefabFilename = selectedZombiePrefabs[GetRandomIndex(selectedZombies)].fileName

            beep()

            -- Spawn a random zombie from the selected zombies.
            local hit, hitPos = raycastFromTransform(GetCameraTransform())
            if hit then

                local entities = Spawn('MOD/prefabs/' .. prefabFilename, Transform(hitPos))
                for key, entity in pairs(entities) do

                    if GetEntityType(entity) == "body" then

                        if HasTag(entity, 'ai_zombie') then

                            zombieId = zombieId + 1
                            local zombie = createZombie(entity, zombieId)

                            table.insert(zombiesTable, zombie)

                        end

                    end

                end

            end

        end

    end

end


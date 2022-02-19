-- ====================================================================================================
-- Basic Ai Zombies - by: Cheejins
-- ====================================================================================================

-- ----------------------------------------------------------------------------------------------------
-- This script handles the creation of a zombie instance.
-- ----------------------------------------------------------------------------------------------------


function initZombieController()
    zombieController = {active = false, pos = Vec(0,0,0),}

    RegisterTool('zombieController','Zombie Controller', 'MOD/vox/zombieController.vox')
    SetBool('game.tool.zombieController.enabled', true)
end


function runZombieController()

    if GetString('game.player.tool') == "zombieController" then -- using controller..

        if InputPressed('r') and zombieController.isActive then -- release target..

            zombieController.isActive = false

            for i = 1, #zombiesTable do
                zombiesTable[i].ai.targetPos = game.ppos
            end

        elseif InputPressed('r') then -- setting target..

            zombieController.isActive = true

            local hit, pos = raycastFromTransform(GetCameraTransform())
            if hit then
                for i = 1, #zombiesTable do
                    zombiesTable[i].ai.targetPos = pos
                    zombieController.pos = pos
                end
            end

        end

    end

    zcLight()

end

function zcLight()
    if zombieController.isActive then -- Point light only when controller target active.
        PointLight(VecAdd(zombieController.pos, Vec(0,1,0)), 0, 1, 0, 3)
        DebugLine((zombieController.pos), VecAdd(zombieController.pos, Vec(0,10,0)), 0.5, 1, 0.5)
    end
end
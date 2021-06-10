local zr = {
    static = {
        bounds = {       
            width = 250,
            height = 250,
        },
        blips = {
            player = {
                width = 10,
                height = 10,
            },
            zombie = {
                width = 10,
                height = 10,
            },
        },
        zoom = 0.5, -- Zoom multiplier.
    },
}



function runZombieRadar()

    UiPush()

        -- Radar background and border.
        UiImageBox('MOD/img/radar/squareBg.png', zr.static.bounds.width, zr.static.bounds.height, 1, 1)
        UiImageBox('MOD/img/radar/square.png', zr.static.bounds.width, zr.static.bounds.height, 1, 1)

        -- Blips
        UiPush()

            -- Center radar
            UiAlign('center middle')
            UiTranslate(zr.static.bounds.width/2, zr.static.bounds.height/2)

            -- Player blip
            UiImageBox('MOD/img/radar/triangle.png', zr.static.blips.player.width, zr.static.blips.player.height)

            -- Zombie blips
            local pTr = GetPlayerTransform()
            for i = 1, #zombiesTable do

                local z = zombiesTable[i]
                local zTr = z.getTr()

                -- z position relative to player transform.
                local zToPlayerLocal = TransformToLocalPoint(pTr, VecSub(pTr.pos, VecSub(pTr.pos, zTr.pos)))
                local zToPlayerVec = VecScale(zToPlayerLocal, zr.static.zoom)

                -- Check if zombie is in bounds.
                local zIsInRadarBounds = 
                    zToPlayerVec[1] < zr.static.bounds.width/2.1 and
                    zToPlayerVec[3] < zr.static.bounds.height/2.1

                -- Check if zombie is active and is in radar bounds.
                if z.ai.isActive and zIsInRadarBounds then
                    UiPush()
                        UiTranslate(zToPlayerVec[1], zToPlayerVec[3]) -- Translate from center of radar.
                        UiImageBox('MOD/img/radar/circle_red.png', zr.static.blips.zombie.width, zr.static.blips.zombie.height)
                    UiPop()
                end
            end

        UiPop()

    UiPop()

end

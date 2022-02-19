function drawZombieSpawningMenu()

    do UiPush()
    UiPop() end

    local fontSize = 24

    UiColor(1,1,1,1)
    UiFont('regular.ttf', 24)
    UiAlign('center top')

    if showSpawnMenu then

        do UiPush()

            UiColor(0.5,0.5,0.5,0.75)
            UiFont('regular.ttf', fontSize)
            UiAlign('center top')

            -- Rectangle bg.
            UiTranslate(UiCenter(), UiMiddle()/2)
            UiRect(UiWidth()/2,440)
            UiTranslate(-UiCenter()/2, 0) -- Place caret at corner.


            local selectBoxW = 200
            local selectBoxH = 200
            local paddingW = 10
            local paddingH = 10


            -- Selection boxes header.
            UiTranslate(40,0)
            UiTranslate(paddingW, paddingH)
            do UiPush()
                UiTranslate(paddingW, 0)
                UiColor(1,1,1,1)
                UiAlign('left top')
                UiText('Select which zombies to spawn.')
            UiPop() end

            -- Zombie selection buttons
            UiTranslate(paddingW, fontSize + paddingH)
            do UiPush()
                for i = 1, #selectedZombiePrefabs do
                    ui_selectionBox(selectBoxH, selectBoxW, selectedZombiePrefabs[i])
                    UiTranslate(paddingW + selectBoxH/2, 0)
                end
            UiPop() end

            UiTranslate(0, selectBoxH + fontSize*2)
            do UiPush()
                UiColor(1,1,1,1)
                UiAlign('left top')

                UiText('Controls:')
                UiTranslate(paddingW*3, fontSize + paddingH)

                UiText('LEFT CLICK = Spawn zombie.')
                UiTranslate(0, fontSize + paddingH)

                UiText('RIGHT CLICK = Show/hide spawn menu.')
                UiTranslate(0, fontSize + paddingH)

                UiText('R = Set zombie target destination.')
                UiTranslate(0, fontSize + paddingH)

            UiPop() end

            -- do UiPush()
            --     UiColor(1,0.5,0.5,1)
            --     UiAlign('center middle')
            --     UiRect(5,5)
            -- UiPop() end

        UiPop() end

    end


    do UiPush()

        if GetString('game.player.tool') == "zombieController" then
            UiTranslate(UiCenter(), UiHeight() - 80)

            UiColor(1,1,1,0.5)
            UiFont('bold.ttf', 24)
            UiAlign('center top')

            UiText('Right click to show/hide zombie spawn menu.')
        end

    UiPop() end

end

function ui_selectionBox(w,h, prefab)

    UiTranslate(w/2, 0)

    -- Spawn preview
    UiColor(1,1,1,0.75)
    UiImageBox('MOD/img/spawnPreviews/' .. prefab.fileName .. '.png', w,h, 10,10)

    -- Button
    UiColor(0,0,0,0.75)
    if UiBlankButton(w, h) then
        prefab.selected = not prefab.selected
    end

    do UiPush()

        -- Checkmark/xmark
        do UiPush()
            UiColor(1,1,1,1)
            UiAlign('right top')
            UiTranslate(w/2, 0)
            if prefab.selected then
                UiImageBox('MOD/img/checkmark.png', w/3,h/3, 1,1)
            else
                UiImageBox('MOD/img/xmark.png', w/3,h/3, 1,1)
            end
        UiPop() end

        -- Name bg
        UiTranslate(0, h)
        UiColor(1,1,1,0.5)
        UiAlign('center bottom')
        UiRect(w, 24)

        -- Name text
        UiColor(0,0,0,1)
        UiText(prefab.name)

    UiPop() end

end

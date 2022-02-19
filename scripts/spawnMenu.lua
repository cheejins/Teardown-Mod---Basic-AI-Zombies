function drawZombieSpawningMenu()

    do UiPush()
    UiPop() end

    local fontSize = 24

    UiColor(1,1,1,1)
    UiFont('regular.ttf', 24)
    UiAlign('center top')

    if showSpawnMenu then

        do UiPush()

            UiColor(0.5,0.5,0.5,0.5)
            UiFont('regular.ttf', fontSize)
            UiAlign('center top')

            -- Rectangle bg.
            UiTranslate(UiCenter(), UiMiddle()/2)
            UiRect(UiWidth()/2,UiHeight()/2)
            UiTranslate(-UiCenter()/2, 0) -- Place caret at corner.


            local selectBoxW = 200
            local selectBoxH = 200
            local paddingW = 10
            local paddingH = 10


            -- Selection boxes.
            UiTranslate(paddingW, paddingH)

            for i = 1, #selectedZombiePrefabs do

                ui_selectionBox(selectBoxH, selectBoxW, selectedZombiePrefabs[i])
                UiTranslate(paddingW + selectBoxH/2, 0)

            end

            do UiPush()
                UiColor(1,0.5,0.5,1)
                UiAlign('center middle')
                UiRect(5,5)
            UiPop() end

        UiPop() end

    end

end

function ui_selectionBox(w,h, prefab)

    UiTranslate(w/2, 0)

    UiColor(1,1,1,0.75)
    UiRect(w, h)

    UiColor(0,0,0,0.75)
    if UiTextButton(prefab.name) then
        prefab.selected = not prefab.selected
    end

    do UiPush()

        UiColor(0,0,0,1)

        if prefab.selected then
            UiColor(0,0.5,0,1)
        end

        UiTranslate(0, h - 2)
        UiAlign('center bottom')
        UiText(prefab.name)

    UiPop() end

end

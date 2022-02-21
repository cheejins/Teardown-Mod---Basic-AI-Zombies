ui = {}

ui.colors = {
    white = Vec(1,1,1),
    g3 = Vec(0.5,0.5,0.5),
    g2 = Vec(0.35,0.35,0.35),
    g1 = Vec(0.2,0.2,0.2),
    black = Vec(0,0,0),
}



ui.container = {}

function ui.container.create(w, h, c, a)
    if not c then c = Vec(0.5,0.5,0.5) end
    UiColor(c[1], c[2], c[3], a or 0.5)
    UiRect(w, h)
end



ui.padding = {}

function ui.padding.create(w, h)
    UiTranslate(w or 10, h or 10)
end



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
            UiRect(UiWidth()/2,580)
            UiTranslate(-UiCenter()/2, 0) -- Place caret at corner.


            local selectBoxW = 200
            local selectBoxH = 200
            local paddingW = 10
            local paddingH = 10


            -- Selection boxes header left margin.
            UiTranslate(40,0)


            -- Selection boxes title.
            UiTranslate(paddingW, 0)
            UiTranslate(0, paddingH)
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
                    ui_zombieSelectionBox(selectBoxH, selectBoxW, selectedZombiePrefabs[i])
                    UiTranslate(paddingW + selectBoxH/2, 0)
                end
            UiPop() end


            -- Controls text
            UiTranslate(0, selectBoxH + fontSize*2)
            do UiPush()
                ui_checkbox_zombieMovement(fontSize)
            UiPop() end


            -- Controls text
            UiTranslate(0, fontSize*5)
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

    --> Tool text.
    do UiPush()

        if GetString('game.player.tool') == "zombieController" then
            UiTranslate(UiCenter(), UiHeight() - 100)

            UiFont('bold.ttf', 24)
            UiAlign('center top')

            UiColor(1,1,1,1)
            UiText('Right-click to show/hide zombie spawn menu.')

            local c = 1
            if #zombiesTable == 0 then
                c = oscillate(1)
            end
            UiColor(c+0.25,1,c+0.25,1)

            UiTranslate(0, fontSize)
            UiText('Hold left-click to spawn zombies.')
        end

    UiPop() end

end

function ui_zombieSelectionBox(w,h, prefab)

    UiTranslate(w/2, 0)

    -- Spawn preview
    UiColor(1,1,1,0.75)
    UiImageBox('MOD/img/spawnPreviews/' .. prefab.fileName .. '.png', w,h, 10,10)

    -- Button
    UiColor(0,0,0,0.75)
    if UiBlankButton(w, h) then
        prefab.selected = not prefab.selected

        if prefab.selected then
            PlaySound(LoadSound('pickup.ogg'), GetCameraTransform().pos, 0.5)
        else
            PlaySound(LoadSound('error.ogg'), GetCameraTransform().pos, 0.5)
        end

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


function ui_checkbox_zombieMovement(fontSize)

    UiAlign('left middle')

    -- Text header
    UiColor(1,1,1, 1)
    UiFont('regular.ttf', fontSize)
    UiText('Zombie movement')
    ui.padding.create(0, fontSize)

    -- Toggle BG
    UiAlign('left top')
    UiColor(0.4,0.4,0.4, 1)
    local tglW = w or 140
    local tglH = h or 40
    UiRect(tglW, h or tglH)

    -- Render toggle
    do UiPush()


        local toggleText = 'ON'

        if config.zombieMovementEnabled then
            ui.padding.create(tglW/2, 0)
            UiColor(0,0.8,0, 1)
        else
            toggleText = 'OFF'
            UiColor(0.8,0,0, 1)
        end

        UiRect(tglW/2, tglH)

        do UiPush()
            ui.padding.create(tglW/4, tglH/2)
            UiColor(1,1,1, 1)
            UiFont('bold.ttf', fontSize)
            UiAlign('center middle')
            UiText(toggleText)
        UiPop() end

    UiPop() end

    UiButtonImageBox('ui/common/box-outline-6.png', 10,10, 0,0,0, a)
    if UiBlankButton(tglW, tglH) then
        config.zombieMovementEnabled = not config.zombieMovementEnabled
        PlaySound(LoadSound('clickdown.ogg'), GetCameraTransform().pos, 1)
    end

end
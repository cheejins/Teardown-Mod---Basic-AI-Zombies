#include "scripts/utility.lua"

local ui = {}

function init()
    ui = {

        text = {
            size = {
                s = 12,
                m = 24,
                l = 48,
            },
        },

        container = {
            width = 1440,
            height = 240,
            margin = 240,
        },

        padding = {
            container = {
                width = UiWidth() * 0.2,
                height = UiHeight() * 0.1,
            },
        },

        bgColor = 0.12,
        fgColor = 0.4,
    }
end


function draw()
    initOptions()

    do UiPush()
        drawHeader()
        drawOptions()
        drawCloseButton()
    UiPop() end
end

function initOptions()
    if GetBool('savegame.mod.options.init') == false then

        SetString('savegame.mod.zombieRadar.corner', 'tr')
        SetBool('savegame.mod.options.outline', true)
        -- SetBool('savegame.mod.options.customWeapons', true)

        SetBool('savegame.mod.options.init', true)
    end
end

function drawHeader()
    do UiPush()
        UiTranslate(ui.container.margin, 10)

        UiColor(1, 1, 1)
        UiFont("bold.ttf", ui.text.size.m)

        do UiPush()
            UiColor(ui.bgColor, ui.bgColor, ui.bgColor)
            local bounds = {1440, 120}
            UiRect(bounds[1], bounds[2])
        UiPop() end

        -- Image
        do UiPush()
            UiTranslate(22.5, 22.5)
            UiImageBox("MOD/Preview.jpg", 80, 80, 1, 1)
        UiPop() end
        -- Title
        UiTranslate(120, 20)
        UiAlign("left top")
        UiFont("bold.ttf", ui.text.size.m * 2)
        UiText("Basic AI Zombies")
        -- Author
        UiTranslate(0, ui.text.size.m*2)
        UiFont("bold.ttf",  ui.text.size.m)
        UiText("By: Cheejins")
    UiPop() end

    -- Demo map
    do UiPush()
        UiTranslate(UiCenter(), 70)

        local c = oscillate(2)/3 + 2/3
        UiColor(c,1,c,1)
        UiFont("bold.ttf",  48)
        UiAlign('center middle')

        UiButtonImageBox("ui/common/box-outline-6.png", 10,10)
        UiButtonHoverColor(0.5,1,0.5,1)
        if UiTextButton('Start Demo Map', 350, 90) then
            StartLevel('', 'demo/demo.xml', '')
        end
    UiPop() end

    UiTranslate(0,120)
end

function drawOptions()

    local componentHeight = 800

    -- Container background
    do UiPush()
        UiTranslate(ui.container.margin, 20)
        UiColor(ui.bgColor, ui.bgColor, ui.bgColor)
        UiRect(ui.container.width, componentHeight)
    UiPop() end

    drawRadarOptions()

    UiTranslate(0, componentHeight)
end

function drawRadarOptions()

    local spacing = 150
    local buttonH = 50
    local buttonW = spacing * 0.98

    -- UiTranslate(0, 200)

    -- Active image box
    local activeButton = function ()
        UiButtonImageBox("ui/common/box-solid-6.png", 10, 10, 0,0.7,0)
        UiColor(1,1,1)
    end

    -- inactive image box
    local inactiveButton = function ()
        UiButtonImageBox("ui/common/box-solid-6.png", 10, 10, ui.fgColor,ui.fgColor,ui.fgColor)
        UiColor(1,1,1)
    end

    -- Radar corner table
    do UiPush()
        local corners = {-spacing*2, -spacing, 0, spacing, spacing*2}

        UiAlign('center middle')
        UiFont("bold.ttf",  ui.text.size.l)
        UiTranslate(UiCenter(), ui.text.size.l*1.5)

        --[[RADAR]]
        -- Title
        UiText("Radar Position")
        UiTranslate(0, ui.text.size.l*1.5)

        -- Radar corner buttons
        do UiPush()

            UiFont("bold.ttf",  ui.text.size.m)

            -- Base image box
            UiColor(1,1,1)
            UiButtonImageBox("ui/common/box-solid-6.png", 10, 10, ui.fgColor,ui.fgColor,ui.fgColor)

            -- if GetString('savegame.mod.zombieRadar.corner') == '' then
            --     SetString('savegame.mod.zombieRadar.corner','tl')
            -- end
            do UiPush()
                if GetString('savegame.mod.zombieRadar.corner') == 'tl' then activeButton() end
                UiTranslate(corners[1], 0)

                if UiTextButton('Top Left', buttonW, buttonH) then
                    SetString('savegame.mod.zombieRadar.corner','tl')
                end
            UiPop() end
            do UiPush()
                if GetString('savegame.mod.zombieRadar.corner') == 'tr' then activeButton() end
                UiTranslate(corners[2], 0)

                if UiTextButton('Top Right', buttonW, buttonH) then
                    SetString('savegame.mod.zombieRadar.corner','tr')
                end
            UiPop() end
            do UiPush()
                if GetString('savegame.mod.zombieRadar.corner') == 'bl' then activeButton() end
                UiTranslate(corners[3], 0)

                if UiTextButton('Bottom Left', buttonW, buttonH) then
                    SetString('savegame.mod.zombieRadar.corner','bl')
                end
            UiPop() end
            do UiPush()
                if GetString('savegame.mod.zombieRadar.corner') == 'br' then activeButton() end
                UiTranslate(corners[4], 0)

                if UiTextButton('Bottom Right', buttonW, buttonH) then
                    SetString('savegame.mod.zombieRadar.corner','br')
                end
            UiPop() end
            do UiPush()
                if GetString('savegame.mod.zombieRadar.corner') == 'off' then activeButton() end
                UiTranslate(corners[5], 0)

                if UiTextButton('OFF', buttonW, buttonH) then
                    SetString('savegame.mod.zombieRadar.corner','off')
                end
            UiPop() end
        UiPop() end


        --[[MISC]]
        UiTranslate(0, ui.text.size.l*3)
        UiText("Misc Options")

        -- Zombie Outline
        do UiPush()
            UiFont("bold.ttf",  ui.text.size.m)
            UiTranslate(0, ui.text.size.l*1.5)

            do UiPush()

                local toggleText = 'OFF'
                if GetBool('savegame.mod.options.outline') then
                    activeButton()
                    toggleText = 'ON'
                else
                    inactiveButton()
                end

                if UiTextButton('Zombie Outline = ' .. toggleText, buttonW*2, buttonH) then
                    SetBool('savegame.mod.options.outline', not GetBool('savegame.mod.options.outline'))
                end

            UiPop() end
        UiPop() end

        -- UiTranslate(0, ui.text.size.l*1.5)

        -- -- Custom Weapons
        -- do UiPush()
        --     UiFont("bold.ttf",  ui.text.size.m)
        --     UiTranslate(0, ui.text.size.l*1.5)

        --     do UiPush()
        --         local toggleText = 'OFF'
        --         if GetBool('savegame.mod.options.customWeapons') then
        --             activeButton()
        --             toggleText = 'ON'
        --         else
        --             inactiveButton()
        --         end

        --         if UiTextButton('Custom Weapons = ' .. toggleText, buttonW*2.2, buttonH) then
        --             SetBool('savegame.mod.options.customWeapons', not GetBool('savegame.mod.options.customWeapons'))
        --         end
        --     UiPop() end
        -- UiPop() end

    UiPop() end
end

function drawCloseButton()

    do UiPush()
        UiColor(1,0,0,1)
        UiTranslate(UiCenter(), 50)
        UiAlign("center top")
        UiFont("bold.ttf", 48)

        if UiTextButton("Close", 200, 40) then
            Menu()
        end
    UiPop() end
end

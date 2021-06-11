local ui = {}
local options = {}

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
        },

        padding = {
            container = {
                width = UiWidth() * 0.2,
                height = UiHeight() * 0.1,
            },
        },

        bgColor = 0.12,
    }

    options = {

        insertSlider = function ()

        end,

        insertButton = function (label, min, max, savePath)

        end,
    }
end


function draw()
    drawHeader()
    drawBody()
end


function drawHeader()

    UiTranslate(240, 45)

    UiPush()

        UiColor(1, 1, 1)
        UiFont("bold.ttf", ui.text.size.l)

        UiPush()
            UiColor(ui.bgColor, ui.bgColor, ui.bgColor)
            local bounds = {1440, 170}
            UiRect(bounds[1], bounds[2])
        UiPop()

        -- UiPush()
        --     UiAlign("right top")
        --     UiColor(1, 1, 1)
        --     UiTranslate(1440, 22.5)
        --     UiFont("bold.ttf", 40)
        --     local resetButton = UiTextButton("RESET", 200, 50)
        --     if resetButton then
        --         resetMod()
        --     end
        -- UiPop()

        -- Image
        UiPush()
            UiTranslate(22.5, 22.5)
            UiImageBox("MOD/Preview.jpg", 120, 120, 1, 1)
        UiPop()
        -- Title
        UiTranslate(160, 20)
        UiAlign("left top")
        UiFont("bold.ttf", ui.text.size.l * 2)
        UiText("AI Zombies")
        -- Author
        UiTranslate(0, 80)
        UiFont("bold.ttf",  ui.text.size.l)
        UiText("By: Cheejins")
    UiPop()
end


function drawBody()
    UiTranslate(0, 200)
    UiPush()
        UiColor(ui.bgColor, ui.bgColor, ui.bgColor)
        UiRect(ui.container.width, 700)
    UiPop()
end

function drawOptions()
    
end


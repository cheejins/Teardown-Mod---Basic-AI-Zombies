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
    }
end


function draw()
    drawHeader()
    drawBody()
    -- drawOptions()
    drawCloseButton()
end


function drawHeader()
    UiPush()
        UiTranslate(ui.container.margin, 20)

        UiColor(1, 1, 1)
        UiFont("bold.ttf", ui.text.size.l)

        UiPush()
            UiColor(ui.bgColor, ui.bgColor, ui.bgColor)
            local bounds = {1440, 170}
            UiRect(bounds[1], bounds[2])
        UiPop()

        -- Image
        UiPush()
            UiTranslate(22.5, 22.5)
            UiImageBox("MOD/Preview.jpg", 120, 120, 1, 1)
        UiPop()
        -- Title
        UiTranslate(160, 20)
        UiAlign("left top")
        UiFont("bold.ttf", ui.text.size.l * 2)
        UiText("Basic AI Zombies (Options)")
        -- Author
        UiTranslate(0, 80)
        UiFont("bold.ttf",  ui.text.size.l)
        UiText("By: Cheejins")
    UiPop()
    UiTranslate(0,195)
end

function drawBody()
    local componentHeight = 700
    UiPush()
        UiTranslate(ui.container.margin, 20)
        UiColor(ui.bgColor, ui.bgColor, ui.bgColor)
        UiRect(ui.container.width, componentHeight)
    UiPop()
    UiTranslate(0, componentHeight)
end

function drawOptions()

    local componentHeight = 500

    -- Radar
    -- corner
    -- zoom

    -- UiTranslate(0, componentHeight)
    
end

function drawCloseButton()

    UiPush()
        UiColor(1,0,0,1)
        UiTranslate(UiCenter(), 50)
        UiAlign("center top")
        UiFont("bold.ttf", 48)

        if UiTextButton("Close", 200, 40) then
            Menu()
        end
    UiPop()
end

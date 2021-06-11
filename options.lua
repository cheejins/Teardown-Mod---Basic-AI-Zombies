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
        fgColor = 0.34
    }
end


function draw()
    drawHeader()
    drawOptions()
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

function drawOptions()

    local componentHeight = 700

    -- Container background
    UiPush()
        UiTranslate(ui.container.margin, 20)
        UiColor(ui.bgColor, ui.bgColor, ui.bgColor)
        UiRect(ui.container.width, componentHeight)
    UiPop()


    -- Radar corner table
    UiPush()

        local buttonWidth = 50
        local spacing = 150
        local corners = {-spacing*2, -spacing, 0, spacing, spacing*2}


        UiAlign('center middle')
        UiFont("bold.ttf",  ui.text.size.l)
        UiTranslate(UiCenter(), ui.text.size.l*1.5)

        UiText("Radar Position")
        UiTranslate(0, ui.text.size.l*1.5)

        UiPush()

            UiFont("bold.ttf",  ui.text.size.m)
            UiButtonImageBox("ui/common/box-solid-6.png", 10, 10, ui.fgColor,ui.fgColor,ui.fgColor)

            -- Radar corner buttons
            UiColor(1,1,1)
            UiPush()
                UiTranslate(corners[1], 0)
                UiTextButton('Top Left',spacing, 40)
            UiPop()
            UiPush()
                UiTranslate(corners[2], 0)
                UiTextButton('Top Right',spacing, 40)
            UiPop()
            UiPush()
                UiTranslate(corners[3], 0)
                UiTextButton('Bottom Left',spacing, 40)
            UiPop()
            UiPush()
                UiTranslate(corners[4], 0)
                UiTextButton('Bottom Right',spacing, 40)
            UiPop()
            UiPush()
                UiTranslate(corners[5], 0)
                UiTextButton('OFF',spacing, 40)
            UiPop()

        UiPop()



    UiPop()

    -- Radar zoom slider


    UiTranslate(0, componentHeight)
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

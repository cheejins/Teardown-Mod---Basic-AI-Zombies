local menu = {
    isShowing = false,
}

function drawInfoUi()

    if InputPressed('h') then
        menu.isShowing = not menu.isShowing
    end

    if menu.isShowing then

        UiMakeInteractive()

        UiTranslate(UiCenter(), UiMiddle())
        UiAlign("center middle")
        UiImageBox('MOD/img/info.png', 1600, 680, 1, 1)
    end

end
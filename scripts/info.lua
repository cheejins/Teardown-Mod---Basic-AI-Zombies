local menu = {
    isShowing = false,
}

function tick()
    toggleUi()
end

function draw()
    if menu.isShowing then
        UiMakeInteractive()
        drawInfoUi()
    end
end

function toggleUi()
    if InputPressed('i') then
        menu.isShowing = not menu.isShowing
    end
end

function drawInfoUi()
    UiTranslate(UiCenter(), UiMiddle())
	UiAlign("center middle")
	UiImageBox('MOD/img/info.png', 1600, 680, 1, 1)
end
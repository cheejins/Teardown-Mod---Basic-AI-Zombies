function draw()
	local vehicle = GetPlayerVehicle()
	if HasTag(vehicle, "shred") then
		local info = {}
        info[#info+1] = {"Shredder", "Rotation Control"}
        info[#info+1] = {"LMB", "Forward 4-Speeds"}
		info[#info+1] = {"RMB", "Reverse 6-Speeds"}
		info[#info+1] = {"Press Again", "Change Speed"}
		UiPush()
			UiAlign("top left")
			local w = 200
			local h = #info*22 + 30
			UiTranslate(20, UiHeight()-h-20)
			UiColor(0,0,0,0.5)
			UiImageBox("common/box-solid-6.png", 300, h, 6, 6)
			UiTranslate(125, 32)
			UiColor(1,1,1)
			for i=1, #info do
				local key = info[i][1]
				local func = info[i][2]
				UiFont("bold.ttf", 22)
				UiAlign("right")
				UiText(key)
				UiTranslate(10, 0)
				UiFont("regular.ttf", 22)
				UiAlign("left")
				UiText(func)
				UiTranslate(-10, 22)
			end
		UiPop()
	end
end
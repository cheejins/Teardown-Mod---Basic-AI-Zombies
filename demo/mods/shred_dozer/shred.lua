function init()
	shred = nil
	speed = -15
end

function tick(dt)	
if GetPlayerVehicle() > 0 and HasTag(GetPlayerVehicle(),"shred") then	
	if shred == nil then
		shred = FindJoint(GetTagValue(GetPlayerVehicle(),"shred"),true)
		SetJointMotor(shred, speed)	
	end
else
	shred = nil
end

local lmb, rmb = InputPressed("lmb"), InputPressed("rmb")

	if lmb then
		if speed < 15 then
			speed = speed + 5
			SetJointMotor(shred, speed)	
		end
	elseif rmb then
		if speed > -15 then
			speed = speed - 5
			SetJointMotor(shred, speed)	
		end
	end
end
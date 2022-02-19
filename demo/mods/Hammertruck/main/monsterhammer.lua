function init()
    hammerj = FindJoint("hammerj", true)
	hammertime = 0
end

function tick()
    local vehicle = GetPlayerVehicle()
	if HasTag(vehicle, "monsterhammer") then
		hammertime = hammertime + GetTimeStep()
		local flip = math.floor(hammertime) % 2 == 0
		local min, max = GetJointLimits(hammerj)
		local movement = GetJointMovement(hammerj)
		local lmb, rmb = InputDown("lmb"), InputDown("rmb")

		if lmb then
			if movement > 5 then
				SetJointMotor(hammerj, 20)
			else
				SetJointMotor(hammerj, 0)
			end
		elseif not lmb then
			if movement < 120 then
				SetJointMotor(hammerj, -5)
			else
				SetJointMotor(hammerj, 0)
			end
		else
			SetJointMotor(hammerj, 0)
		end
    end
end

-- Here's a bunch of code that I ended up not using.





zombie.surroundingShapes = function()

    -- local zTr = zombie.getTr()

    -- local zAabbMin, zAabbMax = GetBodyBounds(zombie.body)
    -- drawAabb(zAabbMin, zAabbMax, 1, 0, 1, 1)

    -- local shapeMaxDist = 5
    -- -- Outer aabb
    -- local aabbZX = 5
    -- local aabbFloor = 0
    -- local aabbHeight = 2
    -- local aabbStartPos = VecAdd(zTr.pos, Vec(-aabbZX,aabbFloor,-aabbZX))
    -- local aabbEndPos = VecAdd(zTr.pos, Vec(aabbZX,aabbHeight,aabbZX))

    -- -- if db then
    --     drawAabb(aabbStartPos, aabbEndPos, nil, nil, nil, 0.5)        
    -- -- end

    -- for i = 1, #zombiesTable do QueryRejectBody(zombiesTable[i].body) end
    -- local shapesList = QueryAabbShapes(aabbStartPos, aabbEndPos)
    -- local largestShape = nil

    -- Search for largest shape
    -- for i = 1, #shapesList do
    -- end

    -- for i=1, #shapesList do

--         local shape = shapesList[i]
--         local shapeTr = GetShapeWorldTransform(shape)
--         local shapeAabbMin, shapeAabbMax = GetShapeBounds(shape) -- shape bounds.
--         local shapeAabbCenter = VecLerp(shapeAabbMin, shapeAabbMax, 0.5)

--         local shapeSize = GetShapeSize(shape)
--         if shapeSize > 5 then
--             -- Draw shape aabbs
--             if CalcDist(zTr.pos, shapeTr.pos) < shapeMaxDist then -- dist zombie to shape.
--                 for j = 1, #zombie.shapes do
--                     if zombie.shapes[j] ~= shapesList[i] then -- reject zombie self shapes.

--                         local c = Vec(0,1,0)
--                         local p = VecAdd(GetPlayerTransform().pos, Vec(0, 0.5, 0))

--                         -- Check if zombie aabb from floor pos intersects aabb
--                         local rot = QuatLookAt(GetPlayerTransform().pos, Vec(0,0,0))
--                         local tr = Transform(zTr.pos, rot)

--                         local bufSize = 3
--                         local zMinAdd = Vec(-bufSize,0,-bufSize)
--                         local zMaxAdd = Vec(bufSize,0,bufSize)
--                         local zAabbMinBuffer = VecAdd(zAabbMin, zMinAdd)
--                         local zAabbMaxBuffer = VecAdd(zAabbMax, zMaxAdd)

--                         if checkAabbOverlap(shapeAabbMin, shapeAabbMax, zAabbMinBuffer, zAabbMaxBuffer) then
--                             zombie.ai.pathing.isPathClear = false
--                             zombie.ai.pathing.blockingShape = shape
--                             c = Vec(1,0,0)
--                         else
--                             zombie.ai.pathing.isPathClear = true
--                         end

--                         -- DebugLine(zTr.pos, p, c[1], c[2], c[3])
--                         drawAabb(shapeAabbMin, shapeAabbMax, c[1], c[2], c[3], 0.5) -- shape aabb.
--                     end
--                 end
--             end
--         end
--     end
-- end









  zombie.navigateShapes = function(shapes)

        -- -- Check if shapes have same body, then navigate around body.
        -- local shabeAabbs = {}
        -- for i = 1, #shapes do
        --     local shape = shapes[i]

        --     if GetShapeSize(shape) < 10 then -- Check if shape size is within relevant bounds.
        --         shapes[i] = nil -- Remove irrelevant shape.
        --     else
        --         local sBMin, sBMax = GetShapeBounds(shape) -- Shape bounds.
        --         shabeAabbs[i] = {shape, sBMin, sBMax} -- Add shape aabb.
        --         drawAabb(sBMin, sBMax, 1, 0 ,0)
        --     end

        -- end

        -- -- Combine shapes aabbs and navigate around the ones closest to the sides.
        -- local groupedShapes = {}
        -- for i = 1, #shabeAabbs do
        --     local shapeAabb = shabeAabbs[i]

        --     for j = 1, #shabeAabbs do
        --         local shapeAabbOverlap = shabeAabbs[j]

        --         if checkAabbOverlap(shapeAabb.min, shapeAabb.max, shapeAabbOverlap.min, shapeAabbOverlap.min) then -- Check if the two shapes overlap.
        --             groupedShapes
        --         end
        --     end

        -- end
    -- end










    function draw()
        -- UiPush()
        -- local x, y, dist = UiWorldToPixel(zClosestEdge)
        -- if dist > 0 then
        --     UiTranslate(x, y-30)
        --     UiAlign('center middle')
        --     UiFont("bold.ttf", 24)
        --     UiText("z closest edge")
        -- end
        -- UiPop()
    
        -- UiPush()
        -- local x, y, dist = UiWorldToPixel(plClosestEdge)
        -- if dist > 0 then
        --     UiTranslate(x, y-30)
        --     UiAlign('center middle')
        --     UiFont("bold.ttf", 24)
        --     UiText("pl closest edge")
        -- end
        -- UiPop()
    end








    
-- local pathStatus = ""
-- -- Process obstacles.
-- if path.zombieCollision then

--     -- Close zombies
--     if isOnGround(zombie) then
--         local zBMin, zBMax = GetBodyBounds(zombie.body)
--         local buffer = 1
--         local zBMinBuf = VecAdd(zBMin, Vec(-buffer, 0 ,-buffer))
--         local zBMaxBuf = VecAdd(zBMax, Vec(buffer, 0 ,buffer))
--         local aabbBodies = QueryAabbBodies(zBMinBuf, zBMaxBuf)

--         for i = 1, aabbBodies do
--             if HasTag(aabbBodies,'ai_zombie')  then
--                 local zBody = aabbBodies[i]

--                 -- local colVel = VecSub(zombie:getTr(), GetBodyTransform(zBody).pos)
--                 -- local colVelMove = VecScale(VecNormalize(colVel), 10)
--                 -- colVelMove[2] = 1
--                 -- SetBodyVelocity(zBody, colVelMove)
--             end
--         end

--         drawAabb(zBMinBuf, zBMaxBuf)
--     end


--     -- do -- >Move away from zombie
--     --     zombieMoveWalk(zombie, -speed, hop)
--     --     zombieLookAt(zombie, game.ppos, 0.5)
--     -- end









-- around
local hitAround, hitPosAround, hitShapeAround = raycastFromTransform(rc.around.tr, rc.around.dist, rc.around.rad, zombie.body)
-- if hitAround and HasTag(GetShapeBody(hitShapeAround), "ai_zombie") then -- Shape is a zombie.
--     DebugLine(hitPosAround, TransformToParentPoint(rc.around.tr, Vec(0, 0, -rc.around.dist)), 1, 0, 1)
-- else
--     hitAround = nil -- Not zombie.
-- end








if zombie.timers.sfx.growl.timer <= 0 then
--     zombie.timers.sfx.growl.timer = 60/zombie.timers.sfx.growl.rpm
--     snd_growl(zombie)
-- else
--     zombie.timers.sfx.growl.timer = zombie.timers.sfx.growl.timer - GetTimeStep()
end










function zombieStandUp(zombie)
--     -- raycast up and down from above pos min and max, stand to reasonable y pos.

--     local zTr = zombie.getTr()
--     local zombieZXRot = math.abs(zTr.rot[1]) + math.abs(zTr.rot[3])
--     -- DebugWatch(zombie.id..' zombieZXRot', zombieZXRot)
--     if zombieZXRot > 0.1 then -- If lying on floor.

--         local legsPos = GetShapeWorldTransform(zombie.limbs.legs)
--         local bodyPos = GetShapeWorldTransform(zombie.limbs.body)

--         -- Move zombie up so rotation does not make zombie stuck in floor.
--         local bodyToLegsDist = CalcDist(legsPos, bodyPos)
--         local addVec = VecAdd(zTr.pos, Vec(0, bodyToLegsDist, 0))
--         local newZTr = TransformCopy(zTr)
--         newZTr.pos = addVec

--         -- local dimRate = 0.1
--         -- newZTr.rot = QuatRotateQuat(newZTr.rot, QuatEuler(newZTr.rot[1]*dimRate,newZTr.rot[2],newZTr.rot[3]*dimRate))

--         SetBodyTransform(zombie.body, newZTr)
--         -- DebugPrint('Stood up ' .. GetTime())
--     end
end










zombie.navigateShapes = function(shapes)

--     -- Check if shapes have same body, then navigate around body.
--     local shabeAabbs = {}
--     for i = 1, #shapes do
--         local shape = shapes[i]

--         if GetShapeSize(shape) < 10 then -- Check if shape size is within relevant bounds.
--             shapes[i] = nil -- Remove irrelevant shape.
--         else
--             local sBMin, sBMax = GetShapeBounds(shape) -- Shape bounds.
--             shabeAabbs[i] = {shape, sBMin, sBMax} -- Add shape aabb.
--             drawAabb(sBMin, sBMax, 1, 0 ,0)
--         end
--     end

--     -- Combine shapes aabbs and navigate around the ones closest to the sides.
--     local groupedShapes = {}
--     for i = 1, #shabeAabbs do
--         local shapeAabb = shabeAabbs[i]

--         for j = 1, #shabeAabbs do
--             local shapeAabbOverlap = shabeAabbs[j]

--         end
--     end
end





zombie.goAroundShape = function(shape)

--     local zTr = zombie.getTr()

--     -- Draw sprites at aabb vertical edges
--     local sAabbMin, sAabbMax = GetShapeBounds(shape)
--     local bCenterY = VecLerp(sAabbMin, sAabbMax, 0.5)[2]
--     local zxBuffers = 1
--     local edges = {}
--     edges[1] = Vec(sAabbMin[1] - zxBuffers, bCenterY, sAabbMin[3] - zxBuffers) -- a
--     edges[2] = Vec(sAabbMax[1] + zxBuffers, bCenterY, sAabbMin[3] - zxBuffers) -- b
--     edges[3] = Vec(sAabbMin[1] - zxBuffers, bCenterY, sAabbMax[3] + zxBuffers) -- c
--     edges[4] = Vec(sAabbMax[1] + zxBuffers, bCenterY, sAabbMax[3] + zxBuffers) -- d

--     zClosestEdge = aabbClosestEdge(zTr.pos, edges)
--     plClosestEdge = aabbClosestEdge(zombie.ai.targetPos, edges)

--     if zClosestEdge ~= plClosestEdge then

--         local edgesSorted = sortAabbEdges(zTr.pos, zombie.ai.targetPos, edges)

--         if CalcDist(edgesSorted[1], edgesSorted[4]) > CalcDist(edgesSorted[1], edgesSorted[2]) -- a -> d
--         and CalcDist(edgesSorted[1], edgesSorted[4]) > CalcDist(edgesSorted[1], edgesSorted[3])
--         then
--             -- zombie.ai.targetPos = edgesSorted[4]
--         else
--             edgesSorted = {
--                 edgesSorted[1],
--                 edgesSorted[4],
--             }
--         end

--         local edgeLetters = nil

--         if #edgesSorted == 2 then
--             edgesSorted["a"] = {
--                 d = 1,
--             }
--             edgesSorted["d"] = {
--                 d = 0,
--             }

--             edgeLetters = {
--                 a = edgesSorted[1],
--                 d = edgesSorted[2],
--             }
--         else
--             edgesSorted["a"] = {
--                 b = CalcDist(edgesSorted[1], edgesSorted[2]),
--                 c = CalcDist(edgesSorted[1], edgesSorted[3]),
--             }
--             edgesSorted["b"] = {
--                 d = CalcDist(edgesSorted[2], edgesSorted[4])
--             }
--             edgesSorted["c"] = {
--                 d = CalcDist(edgesSorted[3], edgesSorted[4])
--             }
--             edgesSorted["d"] = {
--                 d = 0,
--             }

--             edgeLetters = {
--                 a = edgesSorted[1],
--                 b = edgesSorted[2],
--                 c = edgesSorted[3],
--                 d = edgesSorted[4],
--             }
--         end

--         local cost, str = dijkstra(edgesSorted, "a", "d", true)
--         local letter =  string.sub(str, 3, 3)
--         local targetPos = edgeLetters[letter]
--         DebugPrint("Directed. " .. str .. " - " .. sfn(GetTime()))

--         local velDir = VecScale(VecNormalize(VecSub(zTr.pos, targetPos)), 5)

--         zombieLookAt(zombie, targetPos, 0.2)
--         zombieMoveVelDir(zombie, velDir, 1)

--     end

--     DebugLine((zombie.getPos()), zombie.ai.targetPos, 1, 0, 1)
--     DrawDot(zClosestEdge, 1, 0, 1)
--     DrawDot(plClosestEdge, 0, 1, 1)

end








zombie.surroundingShapes = function()

--     local zAabbMin, zAabbMax = GetBodyBounds(zombie.body)
--     drawAabb(zAabbMin, zAabbMax, 1, 0, 1, 1)

--     local zTr = zombie.getTr()

--     local shapeMaxDist = 10
--     -- Outer aabb
--     local aabbZX = 10
--     local aabbFloor = 0
--     local aabbHeight = 5
--     local aabbStartPos = VecAdd(zTr.pos, Vec(-aabbZX,aabbFloor,-aabbZX))
--     local aabbEndPos = VecAdd(zTr.pos, Vec(aabbZX,aabbHeight,aabbZX))

--     drawAabb(aabbStartPos, aabbEndPos, nil, nil, nil, 0.5)        

--     for i = 1, #zombiesTable do QueryRejectBody(zombiesTable[i].body) end
--     local shapesList = QueryAabbShapes(aabbStartPos, aabbEndPos)
--     local largestShape = nil

--     for i=1, #shapesList do

--         local shape = shapesList[i]
--         local shapeTr = GetShapeWorldTransform(shape)
--         local shapeAabbMin, shapeAabbMax = GetShapeBounds(shape) -- shape bounds.
--         local shapeAabbCenter = VecLerp(shapeAabbMin, shapeAabbMax, 0.5)

--         local shapeSize = GetShapeSize(shape)
--         if shapeSize > 5 then
--             -- Draw shape aabbs
--             if CalcDist(zTr.pos, shapeTr.pos) < shapeMaxDist then -- dist zombie to shape.
--                 -- if db then
--                     for j = 1, #zombie.shapes do
--                         if zombie.shapes[j] ~= shapesList[i] then -- reject zombie self shapes.

--                             local c = Vec(0,1,0)
--                             local p = VecAdd(GetPlayerTransform().pos, Vec(0, 0.5, 0))

--                             -- Check if zombie aabb from floor pos intersects aabb
--                             local rot = QuatLookAt(GetPlayerTransform().pos, Vec(0,0,0))
--                             local tr = Transform(zTr.pos, rot)

--                             local bufSize = 2
--                             local zMinAdd = Vec(-bufSize,0,-bufSize)
--                             local zMaxAdd = Vec(bufSize,0,bufSize)
--                             local zAabbMinBuffer = VecAdd(zAabbMin, zMinAdd)
--                             local zAabbMaxBuffer = VecAdd(zAabbMax, zMaxAdd)

--                             if checkAabbOverlap(shapeAabbMin, shapeAabbMax, zAabbMinBuffer, zAabbMaxBuffer) then
--                                 zombie.ai.pathing.isPathClear = false
--                                 zombie.ai.pathing.blockingShape = shape
--                                 c = Vec(1,0,0)
--                             else
--                                 zombie.ai.pathing.isPathClear = true
--                             end

--                             -- DebugLine(zTr.pos, p, c[1], c[2], c[3])
--                             drawAabb(shapeAabbMin, shapeAabbMax, c[1], c[2], c[3], 0.5) -- shape aabb.
--                         end
--                     end
--                 -- end


--                 -- Draw sprites at aabb vertical edges
--                 -- local bCenterY = VecLerp(shapeAabbMin, shapeAabbMax, 0.5)[2]
--                 -- local edges = {}
--                 -- edges[1] = Vec(shapeAabbMin[1], bCenterY, shapeAabbMin[3]) -- a
--                 -- edges[2] = Vec(shapeAabbMax[1], bCenterY, shapeAabbMin[3]) -- b
--                 -- edges[3] = Vec(shapeAabbMin[1], bCenterY, shapeAabbMax[3]) -- c
--                 -- edges[4] = Vec(shapeAabbMax[1], bCenterY, shapeAabbMax[3]) -- d

--             end
--         end
--     end
end







function zombieMoveOnGround(zombie, dir, speed, raycastDepth)

--     if isZombieOnGround(zombie) then

--         local zTr = zombie.getTr()

--         local rcTr = Transform(zTr.pos, QuatLookDown(zTr.pos))
--         rcTr.pos[2] = rcTr.pos[2] + 0.5

--         QueryRejectBody(zombie.body)
--         local hit, hitPos, hitShape = raycastFromTransform(rcTr, 1.5, 0.5)
--         if hit then

--             local zGroundTr = TransformCopy(zTr)

--             local rate = 0
--             local groundHeightOffset = 0.5
--             zGroundTr.pos[2] = VecLerp(zTr.pos[2], hitPos[2], rate)[2] + groundHeightOffset

--             SetBodyTransform(zombie.body, zGroundTr)

--             -- DebugLine(zTr.pos, hitPos)
--         end

--         local moveVel = VecScale(dir, speed)
--         SetBodyVelocity(zombie.body, moveVel)

--     end

--     zombieKeepUpright(zombie)
-- end





function zombieMoveOnGround(zombie)
--     local zTr = zombie.getTr()
--     local rc = { -- raycast
--         flr = { -- floor
--             dis = 2,
--             rad = 2,
--             tr = Transform(VecAdd(zTr.pos, Vec(0,1,0)), QuatLookDown(zTr.pos)),
--             res = {
--                 hit = nil,
--                 pos = nil,
--                 shape = nil,
--             },
--         },
--         ft = { -- feet
--             dis = 0.2,
--             rad = 3,
--             tr = Transform(VecAdd(zTr.pos, Vec(0,0,0)), QuatLookDown(zTr.pos)),
--             res = {
--                 hit = nil,
--                 pos = nil,
--                 shape = nil,
--             },
--         },
--     }
--     -- rc floor
--     rc.flr.res.hit, rc.flr.res.pos, rc.flr.res.shape  = raycastFromTransform(rc.flr.tr, rc.flr.dis, rc.flr.rad, zombie.body)
--     local rcFlr = rc.flr.res

--     -- rc feet
--     rc.ft.res.hit, rc.ft.res.pos, rc.ft.res.shape = raycastFromTransform(rc.ft.tr, rc.ft.dis, rc.ft.rad, zombie.body)
--     local rcFt = rc.ft.res

--     -- Keep zombie just above ground rc if in ground space
--     if rcFt.hit then

--         -- dist from bottom rc to hitpos.
--         local rcBottomPos = VecCopy(rc.ft.tr.pos)
--         rcBottomPos[2] = rc.ft.tr.pos[2] - rc.ft.dis -- bottom of rc volume
--         local rcBottomToRcHit = CalcDist(rc.ft.tr.pos, rcBottomPos)

--         local targetPosY = VecCopy(zombie.ai.targetPos)
--         targetPosY[2] = 0
--         local zTrPosY = VecCopy(zTr.pos)
--         targetPosY[2] = 0

--         local velDir = VecScale(VecNormalize(VecSub(targetPosY, zTrPosY)), 3)
--         -- velDir[2] = CalcDist(zTr.pos, rcFt.pos)
--         velDir[2] = rcBottomToRcHit
--         DebugPrint('velDir[2] '..velDir[2]..sfnTime())
--         SetBodyVelocity(zombie.body, velDir)
--     end

-- end








function evaluateBoidObstacles(boidBody)

    -- local boidTr = GetBodyTransform(boidBody)

    -- local bAabbMin, bAabbMax = GetBodyBounds(boidBody)
    -- drawAabb(bAabbMin, bAabbMax, 1, 0, 1, 1)

    -- local shapeMaxDist = 20
    -- -- Outer aabb
    -- local aabbZX = 5
    -- local aabbFloor = 0
    -- local aabbHeight = 2
    -- local aabbStartPos = VecAdd(boidTr.pos, Vec(-aabbZX,aabbFloor,-aabbZX))
    -- local aabbEndPos = VecAdd(boidTr.pos, Vec(aabbZX,aabbHeight,aabbZX))

    -- drawAabb(aabbStartPos, aabbEndPos)

    -- for i = 1, #zombiesTable do QueryRejectBody(zombiesTable[i].body) end
    -- local shapesList = QueryAabbShapes(aabbStartPos, aabbEndPos)

    -- for i=1, #shapesList do
    --     local shape = shapesList[i]
    --     local shapeTr = GetShapeWorldTransform(shape)
    --     local shapeAabbMin, shapeAabbMax = GetShapeBounds(shape) -- shape bounds.

    --     local shapeSize = GetShapeSize(shape)
    --     if shapeSize > 5 then
    --         -- Draw shape aabbs
    --         if CalcDist(boidTr.pos, shapeTr.pos) < shapeMaxDist then -- dist zombie to shape.

    --             table.insert(boidObstacles, shapesList)

    --             drawAabb(shapeAabbMin, shapeAabbMax, 1, 0, 0, 0.5) -- shape aabb.

    --         end
    --     end
    -- end

-- end
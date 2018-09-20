function miniTest()
  local checkFunc = function(circleP, circleRadius, lineStartP, lineEndP, lineNV)
    local toPointV = circleP - lineStartP
    local dist = math.abs(lineNV:OuterProduct(toPointV))
    if circleRadius < dist then
      SYSTEM:DebugPrintF("no hIT")
      return false
    end
    SYSTEM:DebugPrintF("hIT?")
    local toPointV2 = circleP - lineEndP
    local dot0 = toPointV:InnerProduct(lineNV)
    local dot1 = toPointV2:InnerProduct(lineNV)
    SYSTEM:DebugPrintF("dot0 %f dot1 %f", dot0, dot1)
    if dot0 * dot1 < 0 then
      SYSTEM:DebugPrintF("hIT!!!")
      return true
    else
      local circleRadiusSq = circleRadius * circleRadius
      return circleRadiusSq >= toPointV:SizeSquared() or circleRadiusSq >= toPointV2:SizeSquared()
    end
  end
  local heroPos = CH("HERO"):GetPosition()
  local circleP = Vector2(heroPos.x, heroPos.z)
  local circleRadius = 0.6
  local lineStartP = Vector2(heroPos.x + 0, heroPos.z + 0)
  local lineEndP = Vector2(heroPos.x + 1, heroPos.z + 0)
  local lineNV = (lineEndP - lineStartP):GetNormalized()
  local debugPrim_Circle = DEBUG_PRIM:CreateDebugPrim("testGrp", "c")
  local debugPrim_Line = DEBUG_PRIM:CreateDebugPrim("testGrp", "l")
  local vec2dToVec3d_ = function(vec2d)
    return Vector(vec2d.x, 0, vec2d.y)
  end
  local vec3dToVec2d_ = function(vec3d)
    return Vector2(vec3d.x, vec3d.z)
  end
  while true do
    local lineNV = (lineEndP - lineStartP):GetNormalized()
    local vx = PAD:StickX()
    local vz = -PAD:StickY()
    lineEndP.x = lineEndP.x + vx * 0.1
    lineEndP.y = lineEndP.y + vz * 0.1
    local isHit = checkFunc(circleP, circleRadius, lineStartP, lineEndP, lineNV)
    debugPrim_Circle:SetCircle(vec2dToVec3d_(circleP), circleRadius)
    local linesTbl = {}
    local colorsTbl = {}
    table.insert(linesTbl, vec2dToVec3d_(lineStartP))
    table.insert(linesTbl, vec2dToVec3d_(lineEndP))
    if isHit then
      table.insert(colorsTbl, Color32(255, 255, 255, 255))
      table.insert(colorsTbl, Color32(255, 255, 255, 255))
    else
      table.insert(colorsTbl, Color32(10, 255, 100, 255))
      table.insert(colorsTbl, Color32(10, 255, 100, 255))
    end
    table.insert(linesTbl, Vector(heroPos.x + 1.75, 0, heroPos.z))
    table.insert(linesTbl, Vector(heroPos.x - 1.75, 0, heroPos.z))
    table.insert(colorsTbl, Color32(255, 255, 128, 255))
    table.insert(colorsTbl, Color32(255, 255, 128, 255))
    debugPrim_Line:SetColorLines(Vector(0, 0, 0), linesTbl, colorsTbl)
    if PAD:Data("B") then
      break
    end
    TASK:Sleep(TimeSec(0))
  end
  DEBUG_PRIM:DestroyDebugPrimGroup("testGrp")
  return
end
function OpenTestKojimaMenu()
  OpenTestMenu1()
  do return end
  local tickLst = {}
  local copyVec_ = function(refDst, refSrc)
    refDst.x = refSrc.x
    refDst.y = refSrc.y
    refDst.z = refSrc.z
  end
  local createPtcl_ = function(pos, invmass)
    return {
      pos = Vector(pos),
      posPrev = Vector(pos),
      delta = Vector(0, 0, 0),
      deltaCnt = 0,
      invmass = invmass
    }
  end
  local function calcVerlet(ptcl, fric, accelV)
    local tmpVec = ptcl.pos + (ptcl.pos - ptcl.posPrev) * fric + accelV
    copyVec_(ptcl.posPrev, ptcl.pos)
    copyVec_(ptcl.pos, tmpVec)
  end
  local vec2dToVec3d_ = function(vec2d)
    return Vector(vec2d.x, 0, vec2d.y)
  end
  local vec3dToVec2d_ = function(vec3d)
    return Vector2(vec3d.x, vec3d.z)
  end
  local calcPointToLineNearestVec = function(point, lineP, lineV)
    local toPointV = point - lineP
    local toMostNearV = lineV:InnerProduct(toPointV) * lineV
    return toMostNearV - toPointV
  end
  local calcPointToLineNearestDist = function(point, lineP, lineV)
    local norm = Vector(lineV.y, 0, lineV.x)
    local toPointV = point - lineP
    return math.abs(norm:InnerProduct(toPointV))
  end
  local function calcCircleCrossPoints(circleP, circleRadius, lineP, lineV)
    local nearestV = calcPointToLineNearestVec(circleP, lineP, lineV)
    local nvl = nearestV:Size()
    local len = math.sqrt(circleRadius * circleRadius - nvl * nvl)
    local crossP0 = circleP + nearestV + lineV * len
    local crossP1 = circleP + nearestV + lineV * -len
    return {crossP0, crossP1}
  end
  local function crossPointLine2d_(line1, line2)
    local s0 = vec3dToVec2d_(line1.p0)
    local s1 = vec3dToVec2d_(line2.p0)
    local v0 = vec3dToVec2d_(line1.p1 - line1.p0)
    local v1 = vec3dToVec2d_(line2.p1 - line2.p0)
    local v = s1 - s0
    local Crs_v1_v2 = v0:OuterProduct(v1)
    if Crs_v1_v2 == 0 then
      return nil
    end
    local Crs_v_v1 = v:OuterProduct(v0)
    local Crs_v_v2 = v:OuterProduct(v1)
    local t1 = Crs_v_v2 / Crs_v1_v2
    local t2 = Crs_v_v1 / Crs_v1_v2
    local eps = 1.0E-5
    if t1 + eps < 0 or t1 - eps > 1 or t2 + eps < 0 or t2 - eps > 1 then
      return nil
    end
    return vec2dToVec3d_(s0 + v0 * t1)
  end
  local createStickConstraint = function(refPtclA, refPtclB)
    local stkConstObj = {}
    stkConstObj.refPtclA = refPtclA
    stkConstObj.refPtclB = refPtclB
    stkConstObj.orgLength = (refPtclA.pos - refPtclB.pos):Size()
    function stkConstObj:Tick()
      local invMassA = self.refPtclA.invmass
      local invMassB = self.refPtclB.invmass
      local delta = self.refPtclB.pos - self.refPtclA.pos
      local deltaLen = delta:Size()
      if invMassA == 0 and invMassB == 0 then
        return
      end
      if deltaLen == 0 then
        delta.x = -self.orgLength * 0.2
        delta.z = 0
        delta = delta / (invMassA + invMassB)
      else
        local c = 1
        local rate = (deltaLen - self.orgLength) * c / (deltaLen * c)
        delta = delta * rate
        delta = delta / (invMassA + invMassB)
      end
      if math.abs(deltaLen - self.orgLength) > 0.001 then
      end
      self.refPtclA.delta = self.refPtclA.delta + invMassA * delta
      self.refPtclB.delta = self.refPtclB.delta - invMassB * delta
      self.refPtclA.deltaCnt = self.refPtclA.deltaCnt + 1
      self.refPtclB.deltaCnt = self.refPtclB.deltaCnt + 1
    end
    return stkConstObj
  end
  local createSpringConstraint = function(refPtclA, refPtclB)
    local stkConstObj = {}
    stkConstObj.refPtclA = refPtclA
    stkConstObj.refPtclB = refPtclB
    stkConstObj.orgDelta = refPtclB.pos - refPtclA.pos
    stkConstObj.orgDeltaLen = stkConstObj.orgDelta:Size()
    function stkConstObj:Tick()
      local invMassA = self.refPtclA.invmass
      local invMassB = self.refPtclB.invmass
      local delta = self.refPtclB.pos - self.refPtclA.pos
      local diffDalta = delta - stkConstObj.orgDelta
      local diffDaltaLen = diffDalta:Size()
      if invMassA == 0 and invMassB == 0 then
        return
      end
      local rate = 1
      delta = diffDalta * rate
      delta = delta / (invMassA + invMassB)
      self.refPtclA.delta = self.refPtclA.delta + invMassA * delta
      self.refPtclB.delta = self.refPtclB.delta - invMassB * delta
      self.refPtclA.deltaCnt = self.refPtclA.deltaCnt + 1
      self.refPtclB.deltaCnt = self.refPtclB.deltaCnt + 1
    end
    return stkConstObj
  end
  local mapCollisionMgr = {}
  mapCollisionMgr.debugPrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "mapColPrim")
  mapCollisionMgr.debugHitPrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "mapHitColPrim")
  mapCollisionMgr.triColls = {}
  function mapCollisionMgr:AddTriangleColl(point0, point1, point2)
    table.insert(self.triColls, {
      p0 = point0,
      p1 = point1,
      p2 = point2
    })
  end
  function mapCollisionMgr:HitCollMove(toPos, fromPos, bIsStickInPosMoveAlongCollison)
    local hitPos
    for k, tri in pairs(self.triColls) do
      for k, line2 in ipairs({
        {
          tri.p0,
          tri.p1
        },
        {
          tri.p1,
          tri.p2
        },
        {
          tri.p2,
          tri.p0
        }
      }) do
        local crossP = crossPointLine2d_({
          p0 = line2[1],
          p1 = line2[2]
        }, {p0 = toPos, p1 = fromPos})
        if crossP then
          crossP = crossP + (fromPos - toPos):GetNormalized() * 0.01
          if bIsStickInPosMoveAlongCollison then
            local stickInV = toPos - crossP
            local lineV = (line2[1] - line2[2]):GetNormalized()
            local movNV = stickInV:GetNormalized()
            local movLen = lineV:InnerProduct(stickInV)
            crossP = crossP + lineV * movLen
          end
          self.debugHitPrim:SetCircle(crossP, 0.1)
        end
        if crossP then
          if hitPos then
            if (hitPos - fromPos):SizeSquared() > (crossP - fromPos):SizeSquared() then
              hitPos = crossP
            end
          else
            hitPos = crossP
          end
        end
      end
    end
    return hitPos
  end
  function mapCollisionMgr:Tick()
    local linesTbl = {}
    for k, tri in pairs(self.triColls) do
      table.insert(linesTbl, tri.p0)
      table.insert(linesTbl, tri.p1)
      table.insert(linesTbl, tri.p1)
      table.insert(linesTbl, tri.p2)
      table.insert(linesTbl, tri.p2)
      table.insert(linesTbl, tri.p0)
    end
    self.debugPrim:SetLines(Vector(0, 0, 0), linesTbl)
  end
  table.insert(tickLst, mapCollisionMgr)
  local function createVelObj2(name, ofsVec)
    local velObj = {}
    velObj.typeId = "VelObj2"
    velObj.velPrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "velObj" .. name)
    velObj.debugHitPrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "hitP" .. name)
    velObj.accelV = Vector(0, 0, 0)
    velObj.radius = 0.5
    velObj.name = name
    velObj.fric = 0.8
    velObj.centerPos = createPtcl_(CH("HERO"):GetPosition() + ofsVec, 1)
    velObj.hitPosTbl = {}
    for r = 0, 7 do
      local hpos = velObj.centerPos.pos + Vector(math.cos(math.pi * 2 * r / 8) * velObj.radius, 0, math.sin(math.pi * 2 * r / 8) * velObj.radius)
      table.insert(velObj.hitPosTbl, createPtcl_(hpos, 1))
    end
    velObj.constraintTbl = {}
    for idx = 1, 8 do
      local stkCst = createSpringConstraint(velObj.centerPos, velObj.hitPosTbl[idx])
      table.insert(velObj.constraintTbl, stkCst)
    end
    velObj.tesPosTbl = {}
    table.insert(velObj.tesPosTbl, createPtcl_(velObj.centerPos.pos + Vector(-0.4, 0, 0.2), 1))
    table.insert(velObj.tesPosTbl, createPtcl_(velObj.centerPos.pos + Vector(0, 0, 0.2), 0.5))
    table.insert(velObj.tesPosTbl, createPtcl_(velObj.centerPos.pos + Vector(0.4, 0, 0.2), 0.5))
    local stkCst = createStickConstraint(velObj.tesPosTbl[1], velObj.tesPosTbl[2])
    table.insert(velObj.constraintTbl, stkCst)
    local stkCst = createStickConstraint(velObj.tesPosTbl[2], velObj.tesPosTbl[3])
    table.insert(velObj.constraintTbl, stkCst)
    function velObj:Move()
      local vx = 0 + PAD:StickX()
      local vz = 0 + PAD:StickY()
      local mvx = vx * 0.1
      local mvy = -vz * 0.1
      self.accelV.x = mvx
      self.accelV.z = mvy
      local speedPrev = self.centerPos.pos - self.centerPos.posPrev
      local speedNew = speedPrev + self.accelV
      local limitSpeed = 0.2
      if limitSpeed < speedNew:Size() and (mvx ~= 0 or mvy ~= 0) then
        local normalizedSpeed = self.accelV:Normalize() * limitSpeed
        self.accelV = normalizedSpeed - speedPrev
      end
      for idx = 1, 8 do
      end
      for idx = 1, 8 do
      end
      if math.abs(mvx) > 0.001 or math.abs(mvy) > 0.001 then
        velObj.tesPosTbl[1].posPrev.x = velObj.tesPosTbl[1].pos.x - mvx
        velObj.fric = 1
      else
        SYSTEM:DebugPrint("stop")
        velObj.fric = 0.3
      end
      velObj.tesPosTbl[1].posPrev.x = velObj.tesPosTbl[1].pos.x - mvx
    end
    function velObj:VerletProc()
      local fric = velObj.fric
      calcVerlet(self.centerPos, fric, velObj.accelV)
      for idx = 1, 8 do
        calcVerlet(self.hitPosTbl[idx], fric, velObj.accelV)
      end
      calcVerlet(self.tesPosTbl[1], fric, velObj.accelV)
      calcVerlet(self.tesPosTbl[2], fric, velObj.accelV)
      calcVerlet(self.tesPosTbl[3], fric, velObj.accelV)
      velObj.accelV.x = 0
      velObj.accelV.z = 0
    end
    local applyConstraintDelta_ = function(ptcl)
      if ptcl.deltaCnt ~= 0 then
        ptcl.pos.x = ptcl.pos.x + ptcl.delta.x / ptcl.deltaCnt
        ptcl.pos.z = ptcl.pos.z + ptcl.delta.z / ptcl.deltaCnt
      end
      ptcl.delta.x = 0
      ptcl.delta.z = 0
      ptcl.deltaCnt = 0
    end
    function velObj:ConstraintProc()
      for i, stkCst in ipairs(self.constraintTbl) do
        stkCst:Tick()
      end
      applyConstraintDelta_(self.centerPos)
      for idx = 1, 8 do
        applyConstraintDelta_(self.hitPosTbl[idx])
      end
      for i, ptcl in ipairs(self.tesPosTbl) do
        applyConstraintDelta_(ptcl)
      end
      self.centerPos.invmass = self.centerPos.invmass + (1 - self.centerPos.invmass) * 0.2
      for idx = 1, 8 do
        self.hitPosTbl[idx].invmass = self.hitPosTbl[idx].invmass + (1 - self.hitPosTbl[idx].invmass) * 0.2
      end
    end
    function velObj:HitCheckProc(hitObj)
      if hitObj.typeId ~= "VelObj2" then
        return
      end
      local hitMovePos = mapCollisionMgr:HitCollMove(self.centerPos.pos, self.centerPos.posPrev, false)
      if hitMovePos then
        copyVec_(self.centerPos.pos, hitMovePos)
      end
      local dist = Vector(self.centerPos.pos - hitObj.centerPos.pos):Size()
      local hitRadius = self.radius + hitObj.radius
      if dist <= hitRadius then
        local cpos = self.centerPos.pos
        local hitObjCpos = hitObj.centerPos.pos
        for idx = 1, 8 do
          local checkPos = self.hitPosTbl[idx].pos
          if (checkPos - hitObjCpos):Size() < hitObj.radius then
            local points = calcCircleCrossPoints(hitObjCpos, hitObj.radius, cpos, Vector(checkPos - cpos):Normalize())
            local nearPoint = (points[1] - cpos):SizeSquared() < (points[2] - cpos):SizeSquared() and points[1] or points[2]
            copyVec_(self.hitPosTbl[idx].pos, nearPoint)
            self.hitPosTbl[idx].invmass = 1.0E-4
            self.debugHitPrim:SetCircle(self.hitPosTbl[idx].pos, 0.1)
          end
        end
      end
      for idx = 1, 8 do
        local checkPos = self.hitPosTbl[idx].pos
        local prevPos = self.centerPos.pos
        local hitMovePos = mapCollisionMgr:HitCollMove(checkPos, prevPos, true)
        if hitMovePos then
          copyVec_(self.hitPosTbl[idx].pos, hitMovePos)
          self.hitPosTbl[idx].invmass = 1.0E-4
          self.centerPos.invmass = 0.3
          SYSTEM:DebugPrint("Hit!")
        end
      end
    end
    velObj.debugObjCirclePrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "objCircle" .. name)
    function velObj:Tick()
      local linesTbl = {}
      local colorsTbl = {}
      for idx = 1, 8 do
        local lev0 = self.centerPos.invmass * 128 + 128
        if lev0 > 255 then
          lev0 = 255
        end
        local lev1 = self.hitPosTbl[idx].invmass * 128 + 128
        if lev1 > 255 then
          lev1 = 255
        end
        table.insert(linesTbl, self.centerPos.pos)
        table.insert(linesTbl, velObj.hitPosTbl[idx].pos)
        table.insert(colorsTbl, Color32(lev0, lev0, 255, 255))
        table.insert(colorsTbl, Color32(lev1, lev1, 255, 255))
      end
      table.insert(linesTbl, velObj.tesPosTbl[1].pos)
      table.insert(linesTbl, velObj.tesPosTbl[2].pos)
      table.insert(colorsTbl, Color32(128, 128, 64, 255))
      table.insert(colorsTbl, Color32(128, 128, 64, 255))
      table.insert(linesTbl, velObj.tesPosTbl[2].pos)
      table.insert(linesTbl, velObj.tesPosTbl[3].pos)
      table.insert(colorsTbl, Color32(255, 128, 255, 255))
      table.insert(colorsTbl, Color32(255, 128, 255, 255))
      velObj.velPrim:SetColorLines(Vector(0, 0, 0), linesTbl, colorsTbl)
    end
    return velObj
  end
  local createVelObj3 = function(name, ofsVec)
    local velObj = {}
    velObj.typeId = "VelObj3"
    velObj.velPrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "velObj" .. name)
    velObj.debugHitPrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "hitP" .. name)
    velObj.radius = 0.5
    velObj.name = name
    velObj.fric = 0.8
    local pos = CH("HERO"):GetPosition() + ofsVec
    velObj.instance = VERLET_PHYSICS:CreateVerletCircleObject(velObj.radius)
    velObj.instance:SetCenterPos(Vector2(pos.x, pos.z))
    velObj.instance:SetFriction(velObj.fric)
    function velObj:Move()
      local vx = 0 + PAD:StickX()
      local vz = 0 + PAD:StickY()
      local mvx = vx * 0.1
      local mvy = -vz * 0.1
      velObj.instance:SetAccelVectorWithLimit(Vector2(mvx, mvy), 0.2)
      if math.abs(mvx) > 0.001 or math.abs(mvy) > 0.001 then
        velObj.instance:SetFriction(1)
      else
        SYSTEM:DebugPrint("stop")
        velObj.instance:SetFriction(0.3)
      end
    end
    function velObj:VerletProc()
    end
    function velObj:ConstraintProc()
    end
    function velObj:HitCheckProc(hitObj)
    end
    velObj.debugObjCirclePrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "objCircle" .. name)
    function velObj:Tick()
      local pos2d = velObj.instance:GetCenterPos()
      velObj.debugObjCirclePrim:SetCircle(Vector(pos2d.x, 0, pos2d.y), self.radius)
    end
    return velObj
  end
  local velObjLst = {}
  table.insert(velObjLst, createVelObj2("Aa", Vector(0, 0, 0)))
  table.insert(velObjLst, createVelObj2("Ba", Vector(1.2, 0, 0)))
  for i, velObj in pairs(velObjLst) do
    table.insert(tickLst, velObj)
  end
  local heroPos = CH("HERO"):GetPosition()
  mapCollisionMgr:AddTriangleColl(heroPos + Vector(-1, 0, -1), heroPos + Vector(-1, 0, 1), heroPos + Vector(-2, 0, 1))
  while true do
    velObjLst[1]:Move()
    for i, v in pairs(velObjLst) do
      v:VerletProc()
    end
    for ii = 1, 1 do
      for i, v in pairs(velObjLst) do
        v:ConstraintProc()
      end
    end
    if PAD:Data("R") then
      TASK:Sleep(TimeSec(0.5))
      while PAD:Data("L") do
        TASK:Sleep(TimeSec(0))
        if PAD:Data("B") then
          break
        end
      end
    end
    for ii = 1, #velObjLst do
      for jj = ii + 1, #velObjLst do
        velObjLst[ii]:HitCheckProc(velObjLst[jj])
        velObjLst[jj]:HitCheckProc(velObjLst[ii])
      end
    end
    for i, v in pairs(tickLst) do
      v:Tick()
    end
    SYSTEM:DebugPrint("--tick")
    if PAD:Data("B") then
      break
    end
    TASK:Sleep(TimeSec(0))
  end
  DEBUG_PRIM:DestroyDebugPrimGroup("velGrp")
end

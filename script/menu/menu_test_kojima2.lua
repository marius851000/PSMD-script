function OpenTestKojimaMenu2()
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
    SYSTEM:DebugPrintF("tmpX(%f) = pX(%f) + (pX(%f) - prX(%f))", tmpVec.x, ptcl.pos.x, ptcl.pos.x, ptcl.posPrev.x)
    copyVec_(ptcl.posPrev, ptcl.pos)
    copyVec_(ptcl.pos, tmpVec)
  end
  local vec2dToVec3d_ = function(vec2d)
    return Vector(vec2d.x, 0, vec2d.y)
  end
  local vec3dToVec2d_ = function(vec3d)
    return Vector2(vec3d.x, vec3d.z)
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
  local function createVelObj2(name, ofsVec)
    local velObj = {}
    velObj.velPrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "velObj" .. name)
    velObj.debugHitPrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "hitP" .. name)
    velObj.accelV = Vector(0, 0, 0)
    velObj.radius = 0.5
    velObj.name = name
    velObj.fric = 1
    velObj.centerPos = createPtcl_(CH("HERO"):GetPosition() + ofsVec, 1)
    velObj.fixPosTbl = {}
    velObj.hitPosTbl = {}
    velObj.constraintTbl = {}
    velObj.tesPosTbl = {}
    table.insert(velObj.tesPosTbl, createPtcl_(velObj.centerPos.pos + Vector(-0.4, 0, 0.2), 1))
    table.insert(velObj.tesPosTbl, createPtcl_(velObj.centerPos.pos + Vector(0, 0, 0.2), 0.5))
    table.insert(velObj.tesPosTbl, createPtcl_(velObj.centerPos.pos + Vector(0.4, 0, 0.2), 0.5))
    local stkCst = createStickConstraint(velObj.tesPosTbl[1], velObj.tesPosTbl[2])
    table.insert(velObj.constraintTbl, stkCst)
    local stkCst = createStickConstraint(velObj.tesPosTbl[2], velObj.tesPosTbl[3])
    table.insert(velObj.constraintTbl, stkCst)
    function velObj:Move()
      local vx = PAD:StickX()
      local vz = PAD:StickY()
      local mvx = vx * 0.1
      local mvy = -vz * 0.1
      self.accelV.x = mvx
      self.accelV.z = mvy
      if math.abs(mvx) > 0.001 or math.abs(mvy) > 0.001 then
        velObj.tesPosTbl[1].posPrev.x = velObj.tesPosTbl[1].pos.x - mvx
        velObj.fric = 1
      else
        SYSTEM:DebugPrint("stop")
        velObj.fric = 0.3
      end
      local speed = (velObj.tesPosTbl[1].pos - velObj.tesPosTbl[1].posPrev):Size()
      if speed > 0.01 then
        local tmpV = (velObj.tesPosTbl[1].pos - velObj.tesPosTbl[1].posPrev) / speed * 0.1
        tmpV = velObj.tesPosTbl[1].pos - tmpV
        copyVec_(velObj.tesPosTbl[1].pos, tmpV)
      end
    end
    function velObj:VerletProc()
      local fric = velObj.fric
      calcVerlet(self.tesPosTbl[1], fric, velObj.accelV)
      calcVerlet(self.tesPosTbl[2], fric, velObj.accelV)
      calcVerlet(self.tesPosTbl[3], fric, velObj.accelV)
      velObj.accelV.x = 0
      velObj.accelV.z = 0
    end
    local applyConstraintDelta_ = function(ptcl)
      ptcl.pos.x = ptcl.pos.x + ptcl.delta.x / ptcl.deltaCnt
      ptcl.pos.z = ptcl.pos.z + ptcl.delta.z / ptcl.deltaCnt
      ptcl.delta.x = 0
      ptcl.delta.z = 0
      ptcl.deltaCnt = 0
    end
    function velObj:ConstraintProc()
      for i, stkCst in ipairs(self.constraintTbl) do
        stkCst:Tick()
      end
      for i, ptcl in ipairs(self.tesPosTbl) do
      end
    end
    function velObj:HitCheckProc(hitObj)
    end
    velObj.debugObjCirclePrim = DEBUG_PRIM:CreateDebugPrim("velGrp", "objCircle" .. name)
    function velObj:Tick()
      local linesTbl = {}
      local colorsTbl = {}
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
  local velObjLst = {}
  table.insert(velObjLst, createVelObj2("A", Vector(0, 0, 0)))
  for i, velObj in pairs(velObjLst) do
    table.insert(tickLst, velObj)
  end
  local heroPos = CH("HERO"):GetPosition()
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
    VERLET_PHYSICS:Update()
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

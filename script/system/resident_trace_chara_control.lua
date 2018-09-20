math.random = nil
function MoveTraceCharaStart(fmcCtrlObj)
  MoveTraceCharaInit_(fmcCtrlObj)
  MoveTraceChara_(fmcCtrlObj)
end
function MoveTraceCharaFinish(fmcCtrlObj)
  MoveTraceCharaFinish_(fmcCtrlObj)
end
function MoveTraceCharaInit_(fmcCtrlObj)
  local traceWk = {}
  traceWk.mode = "taiki"
  traceWk.subMode = nil
  traceWk.cnt = 0
  traceWk.lastDirV = nil
  traceWk.tgtOffs = nil
  traceWk.taikiRotSpeed = 0
  traceWk.nowCmd = nil
  traceWk.needWait = false
  traceWk.needNoQuitWait = false
  traceWk.sleepReadyCnt = 120
  function traceWk:changeMode(mode)
    self.mode = mode
    self.subMode = nil
    self.cnt = 0
  end
  fmcCtrlObj.traceWk = traceWk
  local traceCtrlIns = fmcCtrlObj.traceCtrlIns
  local traceWk = fmcCtrlObj.traceWk
  local traceCh = traceCtrlIns:GetScriptCharaObj()
  traceCh:SetTaiki()
end
function MoveTraceCharaFinish_(fmcCtrlObj)
  local traceCtrlIns = fmcCtrlObj.traceCtrlIns
  local traceWk = fmcCtrlObj.traceWk
  local traceCh = traceCtrlIns:GetScriptCharaObj()
  if traceWk.needWait then
    traceCh:SetTaiki()
    TASK:Sleep(TimeSec(0.1))
  end
  traceCh:ResetManpu()
  traceCh:ResetNeckRot(TimeSec(0.1))
  traceCh:SetMotionRaito(Raito(1))
end
function MoveTraceChara_(fmcCtrlObj)
  local traceCtrlIns = fmcCtrlObj.traceCtrlIns
  local traceWk = fmcCtrlObj.traceWk
  local traceCh = traceCtrlIns:GetScriptCharaObj()
  local function setRandTgtOffs()
    local len = SYSTEM:GetRandomValue(0, 1001) / 1000 * 0.4 + 0.3
    local rot = SYSTEM:GetRandomValue(0, 1001) / 1000 * math.pi * 2
    traceWk.tgtOffs = Vector2()
    traceWk.tgtOffs.x = len * math.sin(rot)
    traceWk.tgtOffs.y = len * math.cos(rot)
  end
  local rotateVecDeg = function(vec2d, rotOffsDeg)
    local rotOffs = rotOffsDeg / 180 * math.pi
    local rx = vec2d.x * math.cos(rotOffs) - vec2d.y * math.sin(rotOffs)
    local ry = vec2d.x * math.sin(rotOffs) + vec2d.y * math.cos(rotOffs)
    return Vector2(rx, ry)
  end
  local getDeg = function(vec2d)
    return math.atan2(vec2d.x, vec2d.y) / math.pi * 180
  end
  local diffDirDeg = function(tgtDir, nowDir)
    local tgtDir = math.fmod(tgtDir, 360)
    local nowDir = math.fmod(nowDir, 360)
    local difDir = tgtDir - nowDir
    if difDir >= 180 then
      difDir = difDir - 360
    end
    if difDir <= -180 then
      difDir = difDir + 360
    end
    return difDir
  end
  local function changeMode(mode)
    traceWk.mode = mode
    traceWk.subMode = nil
    traceWk.cnt = 0
  end
  local function cmd_waiting()
    local toDirV = traceCtrlIns:GetTargetPos2d() - traceCh:GetPosition2d()
    local tgtDir = math.atan2(toDirV.x, toDirV.y) / math.pi * 180
    local nowDir = math.fmod(traceCh:GetDir(), 360)
    local difDir = diffDirDeg(tgtDir, nowDir)
    if math.abs(difDir) > 30 then
      traceCh:DirTo(traceCtrlIns:GetTargetPos2d(), Speed(240))
      while traceCh:IsRotate() do
        coroutine.yield(1)
      end
    end
    for limit = 0, 15 do
      coroutine.yield(1)
    end
    return 0
  end
  local function cmd_waiting_long()
    traceCh:SetTaiki()
    local toDirV = traceCtrlIns:GetTargetPos2d() - traceCh:GetPosition2d()
    local tgtDir = math.atan2(toDirV.x, toDirV.y) / math.pi * 180
    local nowDir = math.fmod(traceCh:GetDir(), 360)
    local difDir = diffDirDeg(tgtDir, nowDir)
    if math.abs(difDir) > 30 then
      traceCh:DirTo(traceCtrlIns:GetTargetPos2d(), Speed(240))
      while traceCh:IsRotate() do
        coroutine.yield(1)
      end
    end
    for limit = 0, 90 do
      coroutine.yield(1)
    end
    return 0
  end
  local function cmd_randomMove()
    local tgtPos = traceCtrlIns:GetTargetPos2d()
    local myPos = traceCh:GetPosition2d()
    local randTbl = {
      {0.3, 0.3},
      {0.5, -0.3},
      {-0.1, 0.4},
      {-0.3, -0.3},
      {-0.5, 0.3},
      {0.1, -0.4}
    }
    local idx = math.floor(SYSTEM:GetRandomValue(0, 1000) / 1000 * #randTbl) + 1
    tgtPos.x = myPos.x + randTbl[idx][1]
    tgtPos.y = myPos.y + randTbl[idx][2]
    traceCh:WalkTo(tgtPos, Speed(1))
    for limit = 0, 60 do
      if traceCh:IsMove() == false then
        break
      end
      fmcCtrlObj.traceCtrlIns:ApplyVerletObj()
      coroutine.yield(1)
    end
    local stopCnt = SYSTEM:GetRandomValue(5, 15)
    for limit = 0, stopCnt do
      coroutine.yield(1)
    end
    traceCh:SetActivityTaiki()
    return 0
  end
  local function cmd_sleep()
    traceCh:SetActivityTaiki()
    local sleepPreTime = 150
    local sleepingTime = 450
    local sleepPostTime = 60
    traceCh:SetTaiki()
    for t = 0, 60 do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(0), RotateTarget(20), RotateTarget(0), TimeSec(0.8))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(0), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    for t = 0, 15 do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(0), RotateTarget(20), RotateTarget(0), TimeSec(1.4))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(0), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(20), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(-20), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(0), RotateTarget(0), RotateTarget(0), TimeSec(0.25))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(0), RotateTarget(20), RotateTarget(0), TimeSec(1.6))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(0), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    for t = 0, 30 do
      coroutine.yield(1)
    end
    traceWk.needWait = true
    if traceCh:GetPokemonIndex() == 715 or traceCh:GetPokemonIndex() == 30 then
      traceCh:SetMotionRaito(Raito(1))
      traceCh:SetMotion(SymMot("EV001_SLEEP00"), LOOP.OFF)
      traceCh:SetNextMotion(SymMot("EV001_SLEEP01"), LOOP.ON, TimeSec(0.1))
    else
      traceCh:SetMotionRaito(Raito(0.7))
      traceCh:SetMotion(SymMot("SLEEP"), LOOP.OFF)
      traceCh:SetNextMotion(SymMot("sleeploop"), LOOP.ON, TimeSec(0.4))
    end
    traceWk.needNoQuitWait = true
    while traceCh:IsNextMotionExist(MOTION_PARTS.BODY) do
      coroutine.yield(1)
    end
    traceWk.needNoQuitWait = false
    traceWk.needNoQuitWait = true
    for limit = 0, 5 do
      coroutine.yield(1)
    end
    traceWk.needNoQuitWait = false
    for limit = 0, sleepingTime do
      coroutine.yield(1)
    end
    traceCh:SetMotionRaito(Raito(1))
    traceCh:SetNextMotion(SymMot("letsgo"), LOOP.OFF, TimeSec(0.4))
    while traceCh:IsPlayMotion(MOTION_PARTS.BODY) do
      coroutine.yield(1)
    end
    traceCh:SetActivityTaiki()
    for limit = 0, sleepPostTime do
      coroutine.yield(1)
    end
    traceWk.needWait = false
    return 0
  end
  local function cmd_hurihuri_asease()
    traceCh:SetTaiki()
    traceCh:SetManpu("MP_QUESTION")
    for t = 0, 30 do
      coroutine.yield(1)
    end
    local neckR = 40
    traceCh:SetNeckRot(RotateTarget(-neckR), RotateTarget(0), RotateTarget(0), TimeSec(0.08))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    for t = 0, 10 do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(neckR), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    for t = 0, 8 do
      coroutine.yield(1)
    end
    traceCh:SetNeckRot(RotateTarget(-neckR), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    for t = 0, 8 do
      coroutine.yield(1)
    end
    traceCh:ResetNeckRot(TimeSec(0.1))
    while traceCh:IsNeckRot() do
      coroutine.yield(1)
    end
    for t = 0, 5 do
      coroutine.yield(1)
    end
    traceCh:SetManpu("MP_FLY_SWEAT")
    for t = 0, 15 do
      coroutine.yield(1)
    end
    for t = 0, 30 do
      coroutine.yield(1)
    end
    traceCh:DirTo(RotateOffs(-90), Speed(300))
    while traceCh:IsRotate() do
      coroutine.yield(1)
    end
    traceCh:DirTo(RotateOffs(180), Speed(300))
    while traceCh:IsRotate() do
      coroutine.yield(1)
    end
    for t = 0, 15 do
      coroutine.yield(1)
    end
  end
  local function cmd_trace_furimuki()
    local toDirV = traceCtrlIns:GetTargetPos2d() - traceCh:GetPosition2d()
    local tgtDir = math.atan2(toDirV.x, toDirV.y) / math.pi * 180
    local nowDir = math.fmod(traceCh:GetDir(), 360)
    local difDir = diffDirDeg(tgtDir, nowDir)
    if math.abs(difDir) > 150 and toDirV:Size() > 3 then
      cmd_hurihuri_asease()
      traceCh:DirTo(traceCtrlIns:GetTargetPos2d(), Speed(300))
      while traceCh:IsRotate() do
        coroutine.yield(1)
      end
      for t = 0, 15 do
        coroutine.yield(1)
      end
      traceCh:SetManpu("MP_FLY_SWEAT")
      for t = 0, 10 do
        coroutine.yield(1)
      end
    elseif math.abs(difDir) > 130 then
      traceCh:DirTo(traceCtrlIns:GetTargetPos2d(), Speed(800))
      while traceCh:IsRotate() do
        coroutine.yield(1)
      end
    end
  end
  local isSleepLvOk = FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear")
  while true do
    if traceWk.sleepReadyCnt > 0 then
      traceWk.sleepReadyCnt = traceWk.sleepReadyCnt - 1
    end
    if traceWk.mode == "taiki" then
      local tgtPos = traceCtrlIns:GetTargetPos2d()
      local myPos = traceCh:GetPosition2d()
      local distV = tgtPos - myPos
      if distV:Size() > 2.5 then
        traceCh:SetActivityTaiki()
        traceCh:ResetManpu()
        traceCh:ResetNeckRot(TimeSec(0.1))
        traceCh:SetMotionRaito(Raito(1))
        traceCh:ResetMotion()
        traceWk.nowCmd = nil
        traceWk:changeMode("trace")
      else
        if traceWk.nowCmd == nil then
          local taikiCmdTbl
          if isSleepLvOk and traceWk.sleepReadyCnt == 0 then
            taikiCmdTbl = {
              {we = 0.7, cmd = cmd_waiting},
              {we = 0.01, cmd = cmd_sleep}
            }
          else
            taikiCmdTbl = {
              {we = 0.7, cmd = cmd_waiting}
            }
          end
          local weSum = 0
          for i, v in ipairs(taikiCmdTbl) do
            weSum = v.we + weSum
          end
          local judge = weSum * (SYSTEM:GetRandomValue(0, 1001) / 1000)
          local weSum = 0
          for i, v in ipairs(taikiCmdTbl) do
            weSum = v.we + weSum
            if judge <= weSum then
              traceWk.nowCmd = coroutine.wrap(v.cmd)
              break
            end
          end
          traceWk.needNoQuitWait = false
        end
        if traceWk.nowCmd and traceWk.nowCmd() == 0 then
          traceWk.nowCmd = nil
        end
        traceWk.cnt = traceWk.cnt + 1
      end
      if traceWk.needNoQuitWait then
        TASK:Sleep(TimeSec(0))
      else
        TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      end
    elseif traceWk.mode == "trace" then
      local isHamari = false
      while true do
        traceCtrlIns:ScriptImpl_CoroutineTaskExec(cmd_trace_furimuki, nil)
        do
          local isExit = false
          local lastPos = traceCh:GetPosition2d()
          do
            local traceTmpTgt = traceCtrlIns:GetTargetPos2d()
            local traceCnt = 30
            local RunThresholdSpeed = 0.12
            setRandTgtOffs()
            local function exitFunc()
              local tgtPos = traceCtrlIns:GetTargetPos2d()
              local myPos = traceCh:GetPosition2d()
              local distV = tgtPos - myPos
              if distV:Size() < 1 then
                isExit = true
                return true
              end
              return false
            end
            traceCtrlIns:ScriptImpl_TraceMove(traceCnt, RunThresholdSpeed, 15, 3, exitFunc)
          end
          local nowPos = traceCh:GetPosition2d()
          if (nowPos - lastPos):Size() < 0.1 then
            isHamari = true
            break
          end
          if isExit then
            break
          end
        end
      end
      if isHamari then
        local tgtPos = traceCtrlIns:GetTargetPos2d()
        local myPos = traceCh:GetPosition2d()
        local distV = tgtPos - myPos
        traceWk.nowCmd = nil
        traceWk.cnt = 0
        traceWk:changeMode("hamariTaiki")
        traceWk.lastDirV = distV:GetNormalized()
      else
        local tgtPos = traceCtrlIns:GetTargetPos2d()
        local myPos = traceCh:GetPosition2d()
        local distV = tgtPos - myPos
        traceWk.nowCmd = nil
        traceWk:changeMode("traceTaiki")
        traceWk.lastDirV = distV:GetNormalized()
      end
    elseif traceWk.mode == "hamariTaiki" then
      local tgtPos = traceCtrlIns:GetTargetPos2d()
      local myPos = traceCh:GetPosition2d()
      local distV = tgtPos - myPos
      if traceWk.cnt == 0 then
        traceWk.nowCmd = coroutine.wrap(cmd_waiting_long)
      end
      if distV:Size() < 1.7 and traceWk.cnt > 60 then
        traceCh:SetActivityTaiki()
        traceCh:ResetManpu()
        traceCh:ResetNeckRot(TimeSec(0.1))
        traceCh:SetMotionRaito(Raito(1))
        traceCh:ResetMotion()
        traceWk.nowCmd = nil
        traceWk:changeMode("trace")
      else
        if traceWk.nowCmd == nil then
          local taikiCmdTbl
          if isSleepLvOk then
            taikiCmdTbl = {
              {we = 0.7, cmd = cmd_randomMove},
              {we = 0.1, cmd = cmd_waiting},
              {we = 0.04, cmd = cmd_sleep}
            }
          else
            taikiCmdTbl = {
              {we = 0.7, cmd = cmd_randomMove},
              {we = 0.1, cmd = cmd_waiting}
            }
          end
          local weSum = 0
          for i, v in ipairs(taikiCmdTbl) do
            weSum = v.we + weSum
          end
          local judge = weSum * (SYSTEM:GetRandomValue(0, 1001) / 1000)
          local weSum = 0
          for i, v in ipairs(taikiCmdTbl) do
            weSum = v.we + weSum
            if judge <= weSum then
              traceWk.nowCmd = coroutine.wrap(v.cmd)
              break
            end
          end
          traceWk.needNoQuitWait = false
        end
        if traceWk.nowCmd and traceWk.nowCmd() == 0 then
          traceWk.nowCmd = nil
        end
        traceWk.cnt = traceWk.cnt + 1
      end
      if traceWk.needNoQuitWait then
        TASK:Sleep(TimeSec(0))
      else
        TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      end
    elseif traceWk.mode == "traceTaiki" then
      if traceWk.subMode == nil then
        traceWk.subMode = "init"
      end
      local tgtPos = traceCtrlIns:GetTargetPos2d()
      local myPos = traceCh:GetPosition2d()
      local toPos = Vector2(myPos)
      local distV = tgtPos - myPos
      local nowDir = traceCh:GetDir()
      local needContinue = true
      while needContinue do
        needContinue = false
        if traceWk.subMode == "init" then
          traceCh:SetActivityTaiki()
          traceWk.subMode = "reset"
          traceWk.lastTgtPos = tgtPos
          traceWk.lastDir = nowDir
          traceWk.nowRotDeg = 0
          traceWk.manpuCnt = 0
          needContinue = true
        elseif traceWk.subMode == "reset" then
          traceWk.subMode = "loop"
          traceWk.stopTimer = 54
        elseif traceWk.subMode == "loop" then
          if distV:Size() > 1.5 then
            traceWk.subMode = "toTrace"
            needContinue = true
          elseif 0.01 < (traceWk.lastTgtPos - tgtPos):Size() then
            traceWk.subMode = "reset"
            needContinue = true
          end
          local distV = tgtPos - myPos
          traceCh:SetDir(RotateTarget(math.atan2(distV.x, distV.y) / math.pi * 180))
          if math.abs(traceWk.nowRotDeg) / 360 > 4.5 and math.abs(nowDir) < 90 then
            traceWk.subMode = "furafura"
            traceWk.cnt = 0
            needContinue = true
          end
          if 2.5 < math.abs(traceWk.nowRotDeg) / 360 then
            if traceWk.manpuCnt == 0 then
              traceCh:SetManpu("MP_FLY_SWEAT")
              traceWk.manpuCnt = 180
            end
            traceWk.manpuCnt = traceWk.manpuCnt - 1
          end
          if 0 >= traceWk.stopTimer then
            traceWk.subMode = "toTaiki"
            traceWk.cnt = 0
            needContinue = true
          end
          if traceWk.subMode == "loop" then
            traceWk.stopTimer = traceWk.stopTimer - 1
            traceWk.cnt = traceWk.cnt + 1
          end
        elseif traceWk.subMode == "furafura" then
          traceWk.needWait = true
          if traceWk.cnt == 0 then
            traceWk.nowRotDeg = 0
          end
          if traceWk.cnt == 5 then
            traceCh:SetManpu("MP_PIYOPIYO_LP")
            traceCh:SetMotion(SymMot("confuse"), LOOP.ON)
            traceCh:SetMotionRaito(Raito(1))
          end
          if traceWk.cnt == 40 then
            traceCh:ResetManpu()
            traceCh:SetMotion(SymMot("sleep"), LOOP.OFF)
            traceCh:SetMotionRaito(Raito(1))
          end
          if traceWk.cnt < 90 then
            local movDelta = math.sin(traceWk.cnt / 45 * math.pi * 2) * 0.005
            movDelta = movDelta + math.sin(traceWk.cnt / 45) * 0.001
            local rad = (nowDir - 90) / 180 * math.pi
            local movX = math.cos(rad) * movDelta - math.sin(rad) * 0
            local movY = math.sin(rad) * movDelta + math.cos(rad) * 0
            traceCh:SetPosition_NoTaiki(myPos.x + movX, 0, myPos.y + movY)
          end
          if traceWk.cnt > 170 then
            traceWk.needWait = false
            traceCh:SetActivityTaiki()
            traceWk.subMode = "reset"
            needContinue = true
          else
            traceWk.cnt = traceWk.cnt + 1
          end
        elseif traceWk.subMode == "toTrace" then
          traceWk:changeMode("trace")
        elseif traceWk.subMode == "toTaiki" then
          traceWk:changeMode("taiki")
        end
      end
      local rotOffsDeg = nowDir + 180 - (traceWk.lastDir + 180)
      if rotOffsDeg >= 180 then
        rotOffsDeg = rotOffsDeg - 360
      elseif rotOffsDeg <= -180 then
        rotOffsDeg = rotOffsDeg + 360
      end
      if 0 < traceWk.nowRotDeg and rotOffsDeg < 0 or 0 > traceWk.nowRotDeg and rotOffsDeg > 0 then
        traceWk.nowRotDeg = 0
      end
      traceWk.nowRotDeg = traceWk.nowRotDeg + rotOffsDeg
      traceWk.lastTgtPos = tgtPos
      traceWk.lastDir = nowDir
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
    end
  end
end

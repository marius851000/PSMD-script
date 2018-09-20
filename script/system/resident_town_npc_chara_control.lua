FREE_MOVE_SYSTEM = {}
FMCCTRL_FUNCS = {}
function FREE_MOVE_SYSTEM:CreateFmcCtrl_WalkingRange(ch, rangeSymbol)
  local townNpcCtrl = CharacterControlManager:AddTownNpcCharaCtrl()
  townNpcCtrl:AddScriptCharaObj(ch)
  local fmcCtrlObj = townNpcCtrl:GetFmcCtrlObj()
  fmcCtrlObj.walkingRange = rangeSymbol
  fmcCtrlObj.hitStopBaseTime = 1
  fmcCtrlObj.hitStopRandTime = 3.5
  function fmcCtrlObj.freeMoveStart(fmcCtrlObj)
    FmcCtrl_WalkingRangeStart_(fmcCtrlObj, townNpcCtrl)
  end
  function fmcCtrlObj.freeMoveFinish(fmcCtrlObj)
    FmcCtrl_WalkingRangeFinish_(fmcCtrlObj, townNpcCtrl)
  end
  function fmcCtrlObj.hitWallStart(fmcCtrlObj)
    FmcCtrl_HitStopStart_(fmcCtrlObj, townNpcCtrl)
  end
  function fmcCtrlObj.hitWallFinish(fmcCtrlObj)
    FmcCtrl_HitStopFinish_(fmcCtrlObj, townNpcCtrl)
  end
  fmcCtrlObj:SetAcceptTrigger_HitWall(true)
  function fmcCtrlObj.hitBodyStart(fmcCtrlObj, hitCharaObj)
    FmcCtrl_HitStopStart_(fmcCtrlObj, townNpcCtrl, hitCharaObj)
  end
  function fmcCtrlObj.hitBodyFinish(fmcCtrlObj, hitCharaObj)
    FmcCtrl_HitStopFinish_(fmcCtrlObj, townNpcCtrl, hitCharaObj)
  end
  fmcCtrlObj:SetAcceptTrigger_HitBody(true)
  return townNpcCtrl:GetFmcCtrlObj()
end
function FREE_MOVE_SYSTEM:CreateFmcCtrl_Taikis(chSet)
  local townNpcCtrl = CharacterControlManager:AddTownNpcCharaCtrl()
  for i, ch in ipairs(chSet) do
    townNpcCtrl:AddScriptCharaObj(ch)
  end
  local fmcCtrlObj = townNpcCtrl:GetFmcCtrlObj()
  townNpcCtrl:SetInvMass(0)
  return townNpcCtrl:GetFmcCtrlObj()
end
function FREE_MOVE_SYSTEM:CreateFmcCtrl_TaikisWithPush(chSet)
  local townNpcCtrl = CharacterControlManager:AddTownNpcCharaCtrl()
  for i, ch in ipairs(chSet) do
    townNpcCtrl:AddScriptCharaObj(ch)
  end
  local fmcCtrlObj = townNpcCtrl:GetFmcCtrlObj()
  townNpcCtrl:SetInvMass(0.2)
  function fmcCtrlObj.freeMoveStart(fmcCtrlObj)
    FmcCtrl_TaikiStart_(fmcCtrlObj, townNpcCtrl)
  end
  function fmcCtrlObj.freeMoveFinish(fmcCtrlObj)
    FmcCtrl_TaikiFinish_(fmcCtrlObj, townNpcCtrl)
  end
  function fmcCtrlObj.hitBodyStart(fmcCtrlObj, hitCharaObj)
    FmcCtrl_HitTaikiWithPushStart_(fmcCtrlObj, townNpcCtrl, hitCharaObj)
  end
  function fmcCtrlObj.hitBodyFinish(fmcCtrlObj, hitCharaObj)
    FmcCtrl_HitTaikiWithPushFinish_(fmcCtrlObj, townNpcCtrl, hitCharaObj)
  end
  function fmcCtrlObj.hitBodyStartCheck(fmcCtrlObj, hitCharaObj)
    return hitCharaObj:IsPlayer()
  end
  fmcCtrlObj:SetAcceptTrigger_HitBody(true)
  return townNpcCtrl:GetFmcCtrlObj()
end
function FREE_MOVE_SYSTEM:CreateFmcCtrl_ForShopStaff(ch)
  local townNpcCtrl = CharacterControlManager:AddTownNpcCharaCtrl()
  townNpcCtrl:AddScriptCharaObj(ch)
  local fmcCtrlObj = townNpcCtrl:GetFmcCtrlObj()
  townNpcCtrl:SetInvMass(0)
  townNpcCtrl:SetIgnoreMapCollision(true)
  function fmcCtrlObj.freeMoveStart(fmcCtrlObj)
    FmcCtrl_TaikiStart_(fmcCtrlObj, townNpcCtrl)
  end
  function fmcCtrlObj.freeMoveFinish(fmcCtrlObj)
    FmcCtrl_TaikiFinish_(fmcCtrlObj, townNpcCtrl)
  end
end
function FREE_MOVE_SYSTEM:CreateFmcCtrl_ForNone(ch)
  local townNpcCtrl = CharacterControlManager:AddTownNpcCharaCtrl()
  townNpcCtrl:AddScriptCharaObj(ch)
  local fmcCtrlObj = townNpcCtrl:GetFmcCtrlObj()
  function fmcCtrlObj.freeMoveStart(fmcCtrlObj)
    townNpcCtrl:SetAutoApplyVerletObjMode(false)
    while true do
      TASK:Sleep(TimeSec(99), TASK_EXIT.QUICK)
    end
  end
  function fmcCtrlObj.freeMoveFinish(fmcCtrlObj)
    townNpcCtrl:SetAutoApplyVerletObjMode(false)
  end
  return townNpcCtrl:GetFmcCtrlObj()
end
function FREE_MOVE_SYSTEM:CreateFmcCtrl_ForDefault(ch)
  return FREE_MOVE_SYSTEM:CreateFmcCtrl_Taikis({ch})
end
function FmcCtrl_WalkingRangeStart_(fmcCtrlObj, townNpcCtrl)
  local townNpcCtrl = fmcCtrlObj.townNpcCtrl
  local walkChara = townNpcCtrl:GetScriptCharaObj(0)
  local walkingRange = fmcCtrlObj.walkingRange
  townNpcCtrl:SetAutoApplyVerletObjMode(true)
  townNpcCtrl:SetHitIgnoreCount(60)
  while true do
    local tgtPos = townNpcCtrl:GetRandomFreeMovePos(walkingRange, walkChara)
    if fmcCtrlObj.WalkActMove then
      fmcCtrlObj:WalkActMove(tgtPos)
    else
      walkChara:WalkTo(tgtPos, Speed(1.5))
      walkChara:WaitMove(TASK_EXIT.QUICK)
    end
    if fmcCtrlObj.WalkActStop then
      fmcCtrlObj:WalkActStop()
    else
      local randValue = SYSTEM:GetRandomValue(0, 1001) / 1000
      TASK:Sleep(TimeSec(randValue * 1 + 1.5), TASK_EXIT.QUICK)
    end
  end
end
function FmcCtrl_WalkingRangeFinish_(fmcCtrlObj, townNpcCtrl)
  local townNpcCtrl = fmcCtrlObj.townNpcCtrl
  local walkChara = townNpcCtrl:GetScriptCharaObj(0)
  if fmcCtrlObj.WalkActFinish then
    fmcCtrlObj:WalkActFinish()
  end
  walkChara:SetTaiki()
  townNpcCtrl:SetAutoApplyVerletObjMode(false)
end
function FmcCtrl_TaikiStart_(fmcCtrlObj, townNpcCtrl)
  local townNpcCtrl = fmcCtrlObj.townNpcCtrl
  townNpcCtrl:SetAutoApplyVerletObjMode(true)
  townNpcCtrl:StartPushKeepPositionMode()
  while true do
    local randValue = SYSTEM:GetRandomValue(0, 1001) / 1000
    TASK:Sleep(TimeSec(randValue * 0.2), TASK_EXIT.QUICK)
    if fmcCtrlObj.TaikiActLoop then
      fmcCtrlObj:TaikiActLoop()
    else
      TASK:Sleep(TimeSec(99), TASK_EXIT.QUICK)
    end
  end
end
function FmcCtrl_TaikiFinish_(fmcCtrlObj, townNpcCtrl)
  if fmcCtrlObj.TaikiActFinish then
    fmcCtrlObj:TaikiActFinish()
  end
  townNpcCtrl:FinishPushKeepPositionMode()
  townNpcCtrl:SetAutoApplyVerletObjMode(false)
end
function FmcCtrl_HitStopStart_(fmcCtrlObj, townNpcCtrl, hitCharaObj)
  local townNpcCtrl = fmcCtrlObj.townNpcCtrl
  local chara = townNpcCtrl:GetScriptCharaObj(0)
  local baseTime = fmcCtrlObj.hitStopBaseTime
  local randTime = fmcCtrlObj.hitStopRandTime
  townNpcCtrl:SetAutoApplyVerletObjMode(false)
  chara:SetTaiki()
  if hitCharaObj then
    townNpcCtrl:SetTraceLookChara(hitCharaObj)
    if fmcCtrlObj.HitStopActHitChara then
      fmcCtrlObj:HitStopActHitChara(hitCharaObj)
    end
  end
  TASK:Sleep(TimeSec(baseTime), TASK_EXIT.QUICK)
  townNpcCtrl:ResetTraceLookChara()
  local randValue = SYSTEM:GetRandomValue(0, 1001) / 1000
  TASK:Sleep(TimeSec(randTime * randValue), TASK_EXIT.QUICK)
end
function FmcCtrl_HitStopFinish_(fmcCtrlObj, townNpcCtrl)
  local townNpcCtrl = fmcCtrlObj.townNpcCtrl
  local chara = townNpcCtrl:GetScriptCharaObj(0)
  townNpcCtrl:ResetTraceLookChara()
  townNpcCtrl:SetAutoApplyVerletObjMode(false)
  if fmcCtrlObj.HitStopActHitCharaFinish then
    fmcCtrlObj:HitStopActHitCharaFinish()
  end
end
function FmcCtrl_HitTaikiWithPushStart_(fmcCtrlObj, townNpcCtrl, hitCharaObj)
  local townNpcCtrl = fmcCtrlObj.townNpcCtrl
  local chara = townNpcCtrl:GetScriptCharaObj(0)
  townNpcCtrl:SetAutoApplyVerletObjMode(true)
  townNpcCtrl:MoveLimitPushProc(hitCharaObj)
  townNpcCtrl:MoveReturnWalkProc(Speed(1.5))
end
function FmcCtrl_HitTaikiWithPushFinish_(fmcCtrlObj, townNpcCtrl)
  local townNpcCtrl = fmcCtrlObj.townNpcCtrl
  for idx = 0, townNpcCtrl:GetScriptCharaObjCount() - 1 do
    local chara = townNpcCtrl:GetScriptCharaObj(idx)
    chara:SetMotion(SymMot("WAIT02"), LOOP.ON)
    chara:SetMotionRaito(Raito(1))
  end
  townNpcCtrl:SetAutoApplyVerletObjMode(false)
end

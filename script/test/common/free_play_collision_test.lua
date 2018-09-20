dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function FreeCharMoveTEST_ACT(symbol)
  local fmcCtrlObj = FREE_MOVE_SYSTEM:CreateFmcCtrl_ForNone(CH(symbol))
end
function groundInit()
  for idx = 0, CHARA:GetSymbolNum() - 1 do
    local symbol = CHARA:GetSymbol(idx)
    if symbol ~= "PLAYER" and symbol ~= "HERO" and symbol ~= "PARTNER" and symbol ~= "PARTY0" and symbol ~= "PARTY1" then
      SYSTEM:DebugPrintF(symbol)
      FreeCharMoveTEST_ACT(CHARA:GetSymbol(idx))
    end
  end
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
end
function groundStart()
end
function groundEnd()
end
function EventTriggerIn(symbol)
  FreeMovMapCheck(symbol)
end
function EventTriggerOut(symbol)
end
function EventTriggerLoop(symbol)
end
function EventTriggerPush(symbol)
  if symbol == "DOTEKKOTSU" then
    if FLAG.DotekkotsuCounter == CONST.CNT_1 then
      WINDOW:Talk(SymAct("DOTTEKOTSU"), 1819438129)
      WINDOW:CloseMessage()
      CAMERA:SetFreeMoveFixHeight(CH("HERO"))
      FLAG.DotekkotsuCounter = CONST.CNT_2
      return PROC.OK
    elseif FLAG.DotekkotsuCounter == CONST.CNT_2 then
      WINDOW:Talk(SymAct("DOTTEKOTSU"), 1969839472)
      WINDOW:CloseMessage()
      CAMERA:ResetFreeMoveFixHeight()
      FLAG.DotekkotsuCounter = CONST.CNT_1
      return PROC.OK
    end
  end
end

function groundInit()
end
function groundStart()
end
function groundEnd()
end
function odayaka_school_test_init()
end
function odayaka_school_test_start()
  CAMERA:MoveToHero(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  SCREEN_A:FadeInAll(TimeSec(0), false)
  SCREEN_A:FadeIn(TimeSec(2), true)
  WINDOW:SysMsg(1770098327)
  WINDOW:CloseMessage()
  CAMERA:MoveToPlayer(TimeSec(0.5), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
end
function odayaka_school_test_end()
end
function CheckFreeMove(symbol)
  local bGotoGround = false
  if symbol == "@MAP_ODAYAKA" then
    bGotoGround = true
  end
  if bGotoGround then
    subFreePlayReachCommon()
    WINDOW:SysMsg(1889189846)
    WINDOW:CloseMessage()
    FreeMovMapCheck(symbol)
  end
end
function EventTriggerIn(symbol)
  CheckFreeMove(symbol)
end
function EventTriggerPush(symbol)
end

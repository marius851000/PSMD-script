function groundInit()
end
function groundStart()
end
function groundEnd()
end
function tw02_all_test_init()
end
function tw02_all_test_start()
  CAMERA:MoveToHero(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  SCREEN_A:FadeInAll(TimeSec(0), false)
  SCREEN_A:FadeIn(TimeSec(2), true)
  CAMERA:MoveToPlayer(TimeSec(0.5), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
end
function tw02_all_test_end()
end
function CheckFreeMove(symbol)
end
function EventTriggerIn(symbol)
  CheckFreeMove(symbol)
end
function EventTriggerPush(symbol)
end

function groundInit()
end
function groundStart()
end
function groundEnd()
end
function scale_test_init()
end
function scale_test_start()
  CAMERA:MoveToHero(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  SCREEN_A:FadeInAll(TimeSec(0), false)
  SCREEN_A:FadeIn(TimeSec(0.1), true)
  CAMERA:MoveToPlayer(TimeSec(0.5), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
end
function scale_test_end()
end
function EventTriggerIn(symbol)
end
function EventTriggerPush(symbol)
end

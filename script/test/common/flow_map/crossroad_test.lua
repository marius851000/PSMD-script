dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
  SCREEN_A:FadeOut(TimeSec(0), true)
  SCREEN_A:FadeIn(TimeSec(0.3), true)
end
function groundStart()
end
function EventTriggerIn(symbol)
  FreeMovMapCheck(symbol)
end
function exitevent()
end
function groundEnd()
end

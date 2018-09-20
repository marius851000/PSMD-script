dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
  SCREEN_A:FadeOut(TimeSec(0), true)
  SCREEN_A:FadeIn(TimeSec(0.3), true)
end
function groundStart()
  WINDOW:SetWaitMode(TimeSec(1), TimeSec(0.5))
  WINDOW:SystemLetter(-273158696)
  WINDOW:CloseMessage()
end
function EventTriggerIn(symbol)
  FreeMovMapCheck(symbol)
  function EventTriggerPush(symbol)
    FreeCharCheck(symbol)
  end
end
function exitevent()
end
function groundEnd()
end

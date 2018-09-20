dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function hanyou_tsuginoasapanuki01_init()
end
function hanyou_tsuginoasapanuki01_start()
  WINDOW:Narration(TimeSec(0.3), TimeSec(0.3), -1309163523)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetDir(RotateTarget(-45))
  if CHARA:IsHeroCastCandidate("HERO") then
    CH("HERO"):SetMotion(SymMot("EV001_SLEEP01"), LOOP.ON, TimeSec(0))
    SCREEN_A:FadeIn(TimeSec(0.5), true)
    CH("HERO"):SetMotion(SymMot("EV001_SLEEP02"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  else
    SCREEN_A:FadeIn(TimeSec(0.5), true)
    subEveFadeAfterTime()
  end
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function hanyou_tsuginoasapanuki01_end()
end
function groundEnd()
end

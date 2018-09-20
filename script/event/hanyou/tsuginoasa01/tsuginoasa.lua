dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function hanyou_tsuginoasa01_init()
end
function hanyou_tsuginoasa01_start()
  WINDOW:Narration(TimeSec(0.3), TimeSec(0.3), -1757413268)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetDir(RotateTarget(-45))
  CH("PARTNER"):SetDir(RotateTarget(45))
  if CHARA:IsHeroCastCandidate("HERO") and CHARA:IsHeroCastCandidate("PARTNER") then
    CH("HERO"):SetMotion(SymMot("EV001_SLEEP01"), LOOP.ON, TimeSec(0))
    CH("PARTNER"):SetMotion(SymMot("EV001_SLEEP01"), LOOP.ON, TimeSec(0))
    SCREEN_A:FadeIn(TimeSec(0.5), true)
    CH("PARTNER"):SetMotion(SymMot("EV001_SLEEP02"), LOOP.OFF)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):SetMotion(SymMot("EV001_SLEEP02"), LOOP.OFF)
    TASK:Sleep(TimeSec(0.5))
    CH("PARTNER"):WaitPlayMotion()
    CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):WaitRotate()
    TASK:Sleep(TimeSec(0.25))
  else
    SCREEN_A:FadeIn(TimeSec(0.5), true)
    subEveFadeAfterTime()
    CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.25))
    CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):WaitRotate()
    TASK:Sleep(TimeSec(0.25))
  end
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function hanyou_tsuginoasa01_end()
end
function groundEnd()
end

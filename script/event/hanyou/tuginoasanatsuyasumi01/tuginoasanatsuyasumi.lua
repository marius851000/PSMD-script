dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function hanyou_tuginoasanatsuyasumi01_init()
end
function hanyou_tuginoasanatsuyasumi01_start()
  SCREEN_A:FadeOut(TimeSec(0), false)
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), 231518542)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetDir(RotateTarget(-45))
  CH("HERO"):SetMotion(SymMot("EV001_SLEEP01"), LOOP.ON, TimeSec(0))
  local taskWakeUpHero = function()
    CH("HERO"):SetMotion(SymMot("EV001_SLEEP02"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  end
  SOUND:PlayBgm(SymSnd("BGM_EVE_KONOHANANOIE"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  TASK:Regist(Group("grpHero"), taskWakeUpHero)
  TASK:WaitTask(Group("grpHero"))
  CAMERA:MoveToHero(Speed(4, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
end
function hanyou_tuginoasanatsuyasumi01_end()
end
function groundEnd()
end

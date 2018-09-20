dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main09_m09sonoyoru01_init()
end
function main09_m09sonoyoru01_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), -1599013135)
  WINDOW:CloseMessage()
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main09_m09sonoyoru01_end()
end
function main09_m09sonoyoru02_init()
end
function main09_m09sonoyoru02_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(-1179922512)
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(RotateTarget(-90), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(-1836671885)
  WINDOW:CloseMessage()
  CAMERA:MoveToHero(Speed(4, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
end
function main09_m09sonoyoru02_end()
end
function groundEnd()
end

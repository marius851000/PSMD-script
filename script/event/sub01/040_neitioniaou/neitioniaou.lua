dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function sub01_neitioniaou01_init()
end
function sub01_neitioniaou01_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1.5))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CAMERA:MoveFollow(SymCam("CAMERA_01"), Speed(1, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("HERO"):WaitMove()
  CAMERA:WaitMove()
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(1798779835)
  WINDOW:Monologue(1915486970)
  WINDOW:Monologue(1493258553)
  WINDOW:Monologue(1075470456)
  WINDOW:Monologue(257685183)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function sub01_neitioniaou01_end()
end
function groundEnd()
end

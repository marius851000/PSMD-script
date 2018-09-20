dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main06_scarfnohanashi01_init()
end
function main06_scarfnohanashi01_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("HERO"):WalkTo(SymPos("P01_HERO"), Speed(1.5))
  TASK:Sleep(TimeSec(0.5))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_NOTICE_R")
  CH("KONOHANA"):WaitManpu()
  CH("KONOHANA"):DirTo(SymPos("P01_HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1615016325)
  WINDOW:Talk(SymAct("KONOHANA"), -2035810502)
  WINDOW:KeyWait()
  CH("KONOHANA"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KONOHANA"), -1383420679)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  CH("KONOHANA"):ResetFacialMotion()
end
function main06_scarfnohanashi01_end()
end
function groundEnd()
end

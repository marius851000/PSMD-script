dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main14_shinpinomoriyarareta01_init()
end
function main14_shinpinomoriyarareta01_start()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.PAIN)
  WINDOW:SwitchTalk({PARTNER_0 = 664960682, PARTNER_1 = 1052332011})
  WINDOW:KeyWait()
  SCREEN_A:FadeOutAll(TimeSec(0.5), true)
  WINDOW:ForceCloseMessage()
  TASK:Sleep(TimeSec(0.5))
  SCREEN_A:FadeInAll(TimeSec(0), true)
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_MAP_TAIRIKU_KAZE"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("AAKEN"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("AAKEN"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("AAKEN"):SetManpu("MP_FLY_SWEAT")
  CH("AAKEN"):WaitManpu()
  CH("AAKEN"):SetFacialMotion(FACIAL_MOTION.SAD)
  WINDOW:DrawFace(324, 20, SymAct("AAKEN"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("AAKEN"), 362028072)
  subEveCloseMsg()
  CH("AAKEN"):ResetFacialMotion()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SAD)
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = 210709865, PARTNER_1 = 1137621934})
  WINDOW:KeyWait()
  CH("PARTNER"):ResetFacialMotion()
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1523944175, PARTNER_1 = 1912133932})
  WINDOW:SwitchTalk({PARTNER_0 = 1759766637, PARTNER_1 = -277089118})
  WINDOW:CloseMessage()
  CAMERA:MoveToHero(Speed(8, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
end
function main14_shinpinomoriyarareta01_end()
end
function groundEnd()
end

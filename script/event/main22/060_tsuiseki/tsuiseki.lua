dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main22_tsuiseki01_init()
end
function main22_tsuiseki01_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  local taskHero00 = function()
    CH("HERO"):RunTo(SymPos("P00_HERO"), Speed(3))
    CH("HERO"):WaitMove()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
    CH("HERO"):SetManpu("MP_EXCLAMATION")
  end
  TASK:Regist(taskHero00)
  local taskNyasupaa00 = function()
    CH("NYASUPAA"):RunTo(SymPos("P00_NYASUPAA"), Speed(3))
    CH("NYASUPAA"):WaitMove()
    CH("NYASUPAA"):SetManpu("MP_EXCLAMATION")
  end
  TASK:Regist(taskNyasupaa00)
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.DECIDE)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:WaitTask()
  TASK:Sleep(TimeSec(0.2))
  CAMERA:MoveFollow2(SymCam("CAMERA_01"), Speed(8, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("HERO"):DirTo(SymPos("P_KAIDAN"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("NYASUPAA"):DirTo(SymPos("P_KAIDAN"), Speed(350), ROT_TYPE.NEAR)
  CAMERA:WaitMove()
  WINDOW:SysMsg(1147654981)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_00"), Speed(8, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  CH("HERO"):DirTo(CH("NYASUPAA"), Speed(500), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("NYASUPAA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("NYASUPAA"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), 1568465412)
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("HERO"), FACE_TYPE.DECIDE)
  WINDOW:Monologue(1985065415)
  WINDOW:CloseMessage()
  CAMERA:MoveToHero(Speed(5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  CH("HERO"):ResetFacialMotion()
end
function main22_tsuiseki01_end()
end
function groundEnd()
end

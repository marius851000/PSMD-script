dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main23_kaichuudoukutsu01_init()
end
function main23_kaichuudoukutsu01_start()
  MAP:SetVisible(false)
  MAP:SetBG(SymImg("WALLPAPER_MAIN_CAPTURE_BG01"))
  MAP:SetVisibleBG(true)
  WINDOW:BeginChapter()
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_A:FadeIn(TimeSec(0), true)
  SCREEN_A:FadeInAll(TimeSec(1), false)
  WINDOW:SetWaitMode(TimeSec(2), TimeSec(1))
  WINDOW:Chapter(TimeSec(1.5), TimeSec(1.5), 2086491352)
  TASK:Sleep(TimeSec(3))
  SCREEN_A:FadeOutAll(TimeSec(1), true)
  SCREEN_A:FadeOut(TimeSec(0), true)
  WINDOW:EndChapter()
  WINDOW:ForceCloseMessage()
  WINDOW:SetWaitMode(TimeSec(-1), TimeSec(-1))
  SCREEN_A:FadeInAll(TimeSec(0), true)
  MAP:SetVisible(true)
  MAP:SetVisibleBG(false)
end
function main23_kaichuudoukutsu01_end()
end
function main23_kaichuudoukutsu02_init()
end
function main23_kaichuudoukutsu02_start()
  SOUND:FadeInEnv(SymSnd("SE_ENV_SEA_02_LP"), TimeSec(0.5), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("RAPURASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RAPURASU"), 1699112345)
  WINDOW:CloseMessage()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("RAPURASU"):SetShadow(false)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("RAPURASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RAPURASU"), 1315649114)
  WINDOW:Talk(SymAct("RAPURASU"), 1466959643)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_02"), Speed(8, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("PARTNER"):DirTo(SymPos("P_ENTER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(SymPos("P_ENTER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("OOBEMU"):DirTo(SymPos("P_ENTER"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU"):WaitRotate()
  CAMERA:WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("RAPURASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RAPURASU"), 405901788)
  WINDOW:Talk(SymAct("RAPURASU"), 19570845)
  WINDOW:Talk(SymAct("RAPURASU"), 705164126)
  WINDOW:Talk(SymAct("RAPURASU"), 857522719)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.2))
  CH("PARTNER"):DirTo(CH("RAPURASU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("RAPURASU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("OOBEMU"):DirTo(CH("RAPURASU"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("RAPURASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RAPURASU"), -1266360624)
  WINDOW:Talk(SymAct("RAPURASU"), -1382027375)
  WINDOW:CloseMessage()
  CH("OOBEMU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU"):WaitRotate()
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.3))
    CH("PARTNER"):DirTo(CH("OOBEMU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("OOBEMU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(72, 16, SymAct("OOBEMU"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(30, 0)
  WINDOW:Talk(SymAct("OOBEMU"), 63235534)
  WINDOW:Talk(SymAct("OOBEMU"), 450876559)
  WINDOW:Talk(SymAct("OOBEMU"), 837977932)
  WINDOW:Talk(SymAct("OOBEMU"), 686405133)
  subEveCloseMsg()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = 1739071690, PARTNER_1 = 2125664651})
  WINDOW:SwitchTalk({PARTNER_0 = 1436435016, PARTNER_1 = 1283814153})
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetFacialMotion()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("OOBEMU"):SetManpu("MP_FLY_SWEAT")
  CH("OOBEMU"):WaitManpu()
  WINDOW:DrawFace(72, 16, SymAct("OOBEMU"), FACE_TYPE.SAD)
  WINDOW:DrawFaceOffset(30, 0)
  WINDOW:Talk(SymAct("OOBEMU"), -887263290)
  WINDOW:Talk(SymAct("OOBEMU"), -771334521)
  subEveCloseMsg()
  CH("PARTNER"):SetManpu("MP_UPSET_LP")
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = 292637216, PARTNER_1 = 141196129})
  WINDOW:SwitchTalk({PARTNER_0 = 591866018, PARTNER_1 = 979114467})
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetManpu()
  CH("PARTNER"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = 1964871460, PARTNER_1 = 1812381285})
  WINDOW:KeyWait()
  CH("OOBEMU"):SetManpu("MP_SWEAT_R")
  WINDOW:SwitchTalk({PARTNER_0 = 1194061222, PARTNER_1 = 1580260583})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("PARTNER"):DirTo(CH("RAPURASU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("RAPURASU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("OOBEMU"):DirTo(CH("RAPURASU"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("RAPURASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RAPURASU"), -643252184)
  WINDOW:Talk(SymAct("RAPURASU"), -1061949079)
  subEveCloseMsg()
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1446171323, PARTNER_1 = -1328145404})
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(CH("OOBEMU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("OOBEMU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("OOBEMU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1678028857, PARTNER_1 = -2099216762})
  WINDOW:SwitchTalk({PARTNER_0 = -845027263, PARTNER_1 = -725952256})
  WINDOW:CloseMessage()
  SOUND:FadeOutEnv(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
end
function main23_kaichuudoukutsu02_end()
end
function groundEnd()
end

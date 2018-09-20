dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main18_warubiarunoyukue01_init()
end
function main18_warubiarunoyukue01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  TASK:Regist(Group("grpHero"), subEveMoveDir, {
    CH("HERO"),
    SymPos("P00_HERO"),
    Speed(1.5),
    CH("NOZUPASU")
  })
  TASK:Regist(Group("grpPartner"), subEveMoveDir, {
    CH("PARTNER"),
    SymPos("P00_PARTNER"),
    Speed(1.5),
    CH("NOZUPASU")
  })
  TASK:Regist(Group("grpAaken"), subEveMoveDir, {
    CH("AAKEN"),
    SymPos("P00_AAKEN"),
    Speed(1.5),
    CH("NOZUPASU")
  })
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:WaitTask(Group("grpPartner"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  TASK:WaitTask(Group("grpHero"))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  TASK:WaitTask(Group("grpAaken"))
  CH("AAKEN"):SetManpu("MP_EXCLAMATION")
  CH("AAKEN"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("AAKEN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("AAKEN"), -120284780)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_01"), Speed(4, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  TASK:Sleep(TimeSec(1))
  CAMERA:MoveFollow2(SymCam("CAMERA_00"), Speed(4, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  CH("PARTNER"):DirTo(CH("AAKEN"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("AAKEN"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -506484523, PARTNER_1 = -891094250})
  WINDOW:CloseMessage()
  local taskHero00 = function()
    subEveNod(CH("HERO"))
  end
  TASK:Regist(taskHero00)
  local taskPartner00 = function()
    subEveNod(CH("PARTNER"))
  end
  TASK:Regist(taskPartner00)
  local taskAaken00 = function()
    subEveNod(CH("AAKEN"))
  end
  TASK:Regist(taskAaken00)
  TASK:Sleep(TimeSec(1))
  CH("PARTNER"):WalkTo(SymPos("P01_PARTNER"), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):WalkTo(SymPos("P01_HERO"), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  CH("AAKEN"):WalkTo(SymPos("P01_AAKEN"), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
end
function main18_warubiarunoyukue01_end()
end
function main18_warubiarunoyukue02_init()
end
function main18_warubiarunoyukue02_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_NAZO_03"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("NOZUPASU"):SetManpu("MP_QUESTION")
  CH("NOZUPASU"):WaitManpu()
  WINDOW:DrawFace(72, 16, SymAct("NOZUPASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NOZUPASU"), -738604457)
  WINDOW:Talk(SymAct("NOZUPASU"), -1665639280)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("AAKEN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("AAKEN"), -2052887087)
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("NOZUPASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NOZUPASU"), -1366409710)
  WINDOW:Talk(SymAct("NOZUPASU"), -1214967981)
  WINDOW:Talk(SymAct("NOZUPASU"), 806163356)
  WINDOW:Talk(SymAct("NOZUPASU"), 689316573)
  subEveCloseMsg()
  local taskNozupasu00 = function()
    TASK:Sleep(TimeSec(0.3))
    CH("NOZUPASU"):DirTo(CH("PARTNER"), Speed(200), ROT_TYPE.NEAR)
    CH("NOZUPASU"):WaitRotate()
  end
  TASK:Regist(taskNozupasu00)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1159864509, PARTNER_1 = -1547244030})
  WINDOW:SwitchTalk({PARTNER_0 = -1997816383, PARTNER_1 = -1846506368})
  subEveCloseMsg()
  CH("NOZUPASU"):SetManpu("MP_UPSET_LP")
  WINDOW:DrawFace(272, 16, SymAct("NOZUPASU"), FACE_TYPE.THINK)
  WINDOW:DrawFaceOffset(-20, 0)
  WINDOW:Talk(SymAct("NOZUPASU"), -558818745)
  WINDOW:KeyWait()
  CH("NOZUPASU"):ResetManpu()
  WINDOW:Talk(SymAct("NOZUPASU"), -945149178)
  WINDOW:Talk(SymAct("NOZUPASU"), -326666043)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("AAKEN"):SetFacialMotion(FACIAL_MOTION.DECIDE)
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.DECIDE)
  CH("PARTNER"):DirTo(CH("AAKEN"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("AAKEN"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("AAKEN"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("AAKEN"):WaitRotate()
  CH("NOZUPASU"):DirTo(RotateTarget(0), Speed(200), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.DECIDE)
  WINDOW:Monologue(-174306940)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("AAKEN"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("AAKEN"), 1912886603)
  WINDOW:CloseMessage()
  CH("NOZUPASU"):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  CH("PARTNER"):SetManpu("MP_SHOCK_R")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 1797219338, PARTNER_1 = -1469550419})
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("NOZUPASU"):SetManpu("MP_FLY_SWEAT")
  WINDOW:DrawFace(324, 88, SymAct("AAKEN"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("AAKEN"), -1317846548)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("PARTNER"):DirTo(CH("NOZUPASU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("NOZUPASU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("AAKEN"):DirTo(CH("NOZUPASU"), Speed(350), ROT_TYPE.NEAR)
  CH("AAKEN"):WaitRotate()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.DECIDE)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = -1705110993, PARTNER_1 = -2092620946})
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("PARTNER"):RunTo(SymPos("P00_PARTNER"), Speed(3))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):RunTo(SymPos("P00_HERO"), Speed(3))
  TASK:Sleep(TimeSec(0.1))
  CH("NOZUPASU"):DirTo(RotateTarget(-90), Speed(200), ROT_TYPE.NEAR)
  CH("AAKEN"):RunTo(SymPos("P00_AAKEN"), Speed(3))
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("NOZUPASU"):SetManpu("MP_FLY_SWEAT")
  CH("NOZUPASU"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("NOZUPASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NOZUPASU"), -872106583)
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):SetPosition(SymPos("P00_HERO"))
  CH("PARTNER"):SetPosition(SymPos("P00_PARTNER"))
  CH("AAKEN"):SetPosition(SymPos("P00_AAKEN"))
  CH("PARTNER"):RunTo(SplinePath(SymPos("P01_PARTNER"), SymPos("P02_PARTNER")), Speed(3))
  CH("HERO"):RunTo(SplinePath(SymPos("P01_HERO"), SymPos("P02_HERO")), Speed(3))
  CH("AAKEN"):RunTo(SplinePath(SymPos("P01_AAKEN"), SymPos("P02_AAKEN")), Speed(3))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  WINDOW:Talk(SymAct(""), -719354648)
  subEveCloseMsg()
  WINDOW:Talk(SymAct(""), -30222549)
  subEveCloseMsg()
  WINDOW:Talk(SymAct(""), -416684438)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(1), true)
end
function main18_warubiarunoyukue02_end()
end
function groundEnd()
end
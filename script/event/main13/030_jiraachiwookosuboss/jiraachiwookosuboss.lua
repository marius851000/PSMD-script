dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main13_jiraachiwookosuboss01_init()
end
function main13_jiraachiwookosuboss01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("JIRAACHI"):SetMotion(SymMot("EV013_SLEEP00"), LOOP.ON, TimeSec(0))
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1.5))
  CH("PARTNER"):WalkTo(SymPos("P00_PARTNER"), Speed(1.5))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CAMERA:MoveFollow2(SymCam("CAMERA_01"), Speed(2, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):SetMotion(SymMot("EV001_CONFIRMS"), LOOP.ON)
  CH("PARTNER"):WaitPlayMotion()
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -452055281, PARTNER_1 = -65724850})
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CAMERA:MoveFollow2(SymCam("CAMERA_03"), Speed(1.2, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHUKEI"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(1))
  CH("PARTNER"):DirTo(SymPos("P_SCOPE"), Speed(60), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(SymPos("P_SCOPE"), Speed(60), ROT_TYPE.NEAR)
  CAMERA:WaitMove()
  TASK:Sleep(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -684175987, PARTNER_1 = -836535092})
  WINDOW:SwitchTalk({PARTNER_0 = -2124223989, PARTNER_1 = -1736844470})
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(RotateTarget(-135), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("PARTNER"):SetMotion(SymMot("EV001_CONFIRMS"), LOOP.ON)
  CH("PARTNER"):WaitPlayMotion()
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.2))
  CH("PARTNER"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1286305655, PARTNER_1 = -1437615672})
  CH("HERO"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_04"), Speed(4, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  TASK:Regist(subEveMoveDir, {
    CH("PARTNER"),
    SymPos("P01_PARTNER"),
    Speed(3),
    CH("JIRAACHI")
  })
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveMoveDir, {
    CH("HERO"),
    SymPos("P01_HERO"),
    Speed(3),
    CH("JIRAACHI")
  })
  TASK:WaitTask()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 769107207, PARTNER_1 = 885822534})
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 174753777, PARTNER_1 = 326219440})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  TASK:Sleep(TimeSec(0.2))
  CH("JIRAACHI"):SetManpu("MP_SLEEP_LP")
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.SPECIAL01)
  WINDOW:Talk(SymAct(""), 945612147)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):ResetManpu()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("HERO"):SetManpu("MP_NOTICE_L")
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  CH("PARTNER"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("JIRAACHI"):SetManpu("MP_SLEEP_LP")
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.SPECIAL01)
  WINDOW:Talk(SymAct(""), 558355506)
  subEveCloseMsg()
  CH("JIRAACHI"):ResetManpu()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1845904117, PARTNER_1 = 1998418868})
  WINDOW:KeyWait()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:SwitchTalk({PARTNER_0 = 1546657911, PARTNER_1 = 1160450358})
  subEveCloseMsg()
  CH("JIRAACHI"):SetManpu("MP_SLEEP_LP")
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.SPECIAL01)
  WINDOW:Talk(SymAct("JIRAACHI"), -1028452871)
  WINDOW:Talk(SymAct("JIRAACHI"), -609731400)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_R")
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 417277983, PARTNER_1 = 29628766})
  subEveCloseMsg()
  SOUND:FadeOutBgm(TimeSec(2))
  CH("JIRAACHI"):SetManpu("MP_SLEEP_LP")
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.SPECIAL01)
  WINDOW:Talk(SymAct("JIRAACHI"), 719932061)
  WINDOW:Talk(SymAct("JIRAACHI"), 871529436)
  WINDOW:Talk(SymAct("JIRAACHI"), 2092166427)
  WINDOW:Talk(SymAct("JIRAACHI"), 1705565274)
  WINDOW:Talk(SymAct("JIRAACHI"), 1317375897)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_R")
  TASK:Regist(subEveJumpSurprise, {
    CH("PARTNER")
  })
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 1470021336, PARTNER_1 = -804871657})
  subEveCloseMsg()
  CH("JIRAACHI"):SetManpu("MP_SLEEP_LP")
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.SPECIAL01)
  WINDOW:Talk(SymAct("JIRAACHI"), -920808618)
  WINDOW:CloseMessage()
  subEveFlash2()
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_BOSS_WIPE"), Volume(256))
  EFFECT:BossWipe(TimeSec(60, TIME_TYPE.FRAME), true)
  CAMERA:SetDefaultGroundFovy()
  SYSTEM:SetNextDungeonBanner(false)
end
function main13_jiraachiwookosuboss01_end()
end
function groundEnd()
end
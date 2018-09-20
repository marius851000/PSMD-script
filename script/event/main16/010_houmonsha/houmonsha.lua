dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main16_houmonsha01_init()
end
function main16_houmonsha01_start()
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  MAP:SetVisible(false)
  MAP:SetBG(SymImg("IMEV1601"))
  MAP:SetVisibleBG(true)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  MAP:SetVisible(true)
  MAP:SetVisibleBG(false)
end
function main16_houmonsha01_end()
end
function main16_houmonsha02_init()
end
function main16_houmonsha02_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_NAZO_03"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("YAMIKARASU_TOWN"):SetManpu("MP_FLY_SWEAT")
  CH("YAMIKARASU_TOWN"):WaitManpu()
  WINDOW:DrawFace(72, 16, SymAct("YAMIKARASU_TOWN"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("YAMIKARASU"), -404135206)
  subEveCloseMsg()
  WINDOW:DrawFace(272, 16, SymAct("MASSUGUMA"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("MASSUGUMA"), -17673317)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("KOROBOOSHI"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("KOROBOOSHI"), -706805672)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main16_houmonsha02_end()
end
function main16_houmonsha03_init()
end
function main16_houmonsha03_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_NAZO_03"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main16_houmonsha03_end()
end
function main16_houmonsha04_init()
end
function main16_houmonsha04_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_NAZO_03"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  MAP:SetVisible(false)
  MAP:SetBG(SymImg("IMEV1601"))
  MAP:SetVisibleBG(true)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  MAP:SetVisible(true)
  MAP:SetVisibleBG(false)
end
function main16_houmonsha04_end()
end
function main16_houmonsha05_init()
end
function main16_houmonsha05_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_NAZO_03"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.5))
  CH("JIRAACHI"):SetManpu("MP_UPSET_LP")
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("JIRAACHI"), -859557607)
  WINDOW:Talk(SymAct("JIRAACHI"), -2088392738)
  WINDOW:Talk(SymAct("JIRAACHI"), -1700882785)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  SOUND:FadeOutBgm(TimeSec(1))
  local taskJiraachi00 = function()
    TASK:Sleep(TimeSec(0.5))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
    CH("JIRAACHI"):SetManpu("MP_EXCLAMATION")
    CH("JIRAACHI"):WaitManpu()
  end
  TASK:Regist(taskJiraachi00)
  WINDOW:Talk(SymAct("KONOHANA"), -1313618596)
  WINDOW:Talk(SymAct("KONOHANA"), -1465322467)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  CH("JIRAACHI"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("JIRAACHI"):SetManpu("MP_QUESTION")
  CH("JIRAACHI"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), 791734482)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):WalkTo(SplinePath(SymSpl("S00_JIRAACHI")), Speed(2))
  TASK:Sleep(TimeSec(0.3))
  CAMERA:MoveFollow2(SymCam("CAMERA_02"), Speed(2, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("JIRAACHI"):WaitMove()
  CH("JIRAACHI"):SetNeckRot(RotateTarget(0), RotateTarget(-30), RotateTarget(0), TimeSec(0.2))
  CH("JIRAACHI"):WaitNeckRot()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("JIRAACHI"):SetManpu("MP_EXCLAMATION")
  CH("JIRAACHI"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), 908843411)
  WINDOW:KeyWait()
  CH("JIRAACHI"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("JIRAACHI")
  })
  WINDOW:Talk(SymAct("JIRAACHI"), -28800671)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("JIRAACHI"):ResetManpu()
  CH("JIRAACHI"):ResetNeckRot(TimeSec(0.1))
  CH("JIRAACHI"):WaitNeckRot()
  CH("JIRAACHI"):WalkTo(SplinePath(SymSpl("S01_JIRAACHI")), Speed(2.5))
  TASK:Sleep(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main16_houmonsha05_end()
end
function main16_houmonsha06_init()
end
function main16_houmonsha06_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_KONOHANANOIE"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("JIRAACHI"):SetManpu("MP_FLY_SWEAT_LP")
  CH("JIRAACHI"):WalkTo(SymPos("P00_JIRAACHI"), Speed(3))
  CH("JIRAACHI"):WaitMove()
  CH("JIRAACHI"):ResetManpu()
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -413943776)
  WINDOW:Talk(SymAct("JIRAACHI"), -864097309)
  WINDOW:Talk(SymAct("JIRAACHI"), -714745182)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1708897179)
  WINDOW:Talk(SymAct("KONOHANA"), -2092991196)
  WINDOW:Talk(SymAct("KONOHANA"), -1475203353)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("JIRAACHI"):SetManpu("MP_NOTICE_R")
  CH("JIRAACHI"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -1324802138)
  WINDOW:Talk(SymAct("JIRAACHI"), 915473257)
  WINDOW:Talk(SymAct("JIRAACHI"), 797585960)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("JIRAACHI"):SetManpu("MP_EXCLAMATION")
  CH("JIRAACHI"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -318953841)
  WINDOW:CloseMessage()
  CH("KONOHANA"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.RIGHT)
  CH("KONOHANA"):WaitRotate()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(2))
  CH("PARTNER"):WalkTo(SymPos("P00_PARTNER"), Speed(2))
  CH("HERO"):WaitMove()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -169470002, PARTNER_1 = -557104115})
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(-942639796)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow(SymCam("CAMERA_03"), Speed(3, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  TASK:Regist(subEveMoveDir, {
    CH("JIRAACHI"),
    SymPos("P01_JIRAACHI"),
    Speed(1.5),
    SymPos("P01_PARTNER")
  })
  TASK:Regist(subEveRunDir, {
    CH("HERO"),
    SymPos("P01_HERO"),
    Speed(3),
    CH("KONOHANA")
  })
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveRunDir, {
    CH("PARTNER"),
    SymPos("P01_PARTNER"),
    Speed(3),
    CH("KONOHANA")
  })
  TASK:WaitTask()
  CH("KONOHANA"):SetManpu("MP_LAUGH_LP")
  CH("KONOHANA"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(272, 16, SymAct("KONOHANA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KONOHANA"), -2003704949)
  WINDOW:CloseMessage()
  CH("KONOHANA"):ResetFacialMotion()
  CH("KONOHANA"):ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -1853173046, PARTNER_1 = -1163427575})
  subEveCloseMsg()
  WINDOW:DrawFace(272, 16, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1547915192)
  WINDOW:Talk(SymAct("KONOHANA"), 606383239)
  subEveCloseMsg()
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 1027579334, PARTNER_1 = 1413562858})
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  CH("KONOHANA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = 1297772715, PARTNER_1 = 1719083880})
  WINDOW:SwitchTalk({PARTNER_0 = 2137788969, PARTNER_1 = 808289518})
  TASK:WaitTask()
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_SHOCK_L")
  TASK:Regist(subEveJumpSurprise, {
    CH("KONOHANA")
  })
  WINDOW:DrawFace(324, 20, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KONOHANA"), 691451311)
  WINDOW:Talk(SymAct("KONOHANA"), 35382892)
  WINDOW:Talk(SymAct("KONOHANA"), 453039917)
  WINDOW:Talk(SymAct("KONOHANA"), -1667707934)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  CH("JIRAACHI"):WaitRotate()
  WINDOW:DrawFace(72, 16, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -2054948189)
  WINDOW:CloseMessage()
  CH("KONOHANA"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(72, 16, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -912885421)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("JIRAACHI"):WaitRotate()
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(-20, 0)
  WINDOW:Talk(SymAct("JIRAACHI"), -796047342)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -73393199, PARTNER_1 = -491050352})
  WINDOW:SwitchTalk({PARTNER_0 = -1376076713, PARTNER_1 = -1260286698})
  subEveCloseMsg()
  TASK:Regist(subEveDoubleJump, {
    CH("JIRAACHI")
  })
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.EMOTION)
  WINDOW:DrawFaceOffset(-20, 0)
  WINDOW:Talk(SymAct("JIRAACHI"), -1613963563)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  CH("JIRAACHI"):WaitRotate()
  CH("JIRAACHI"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(72, 16, SymAct("JIRAACHI"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("JIRAACHI"), -2032668780)
  WINDOW:Talk(SymAct("JIRAACHI"), 22016859)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):ResetFacialMotion()
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveDoubleJump, {
    CH("KONOHANA")
  })
  WINDOW:DrawFace(324, 20, SymAct("KONOHANA"), FACE_TYPE.EMOTION)
  WINDOW:Talk(SymAct("KONOHANA"), 408207898)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  local taskKonohana00 = function()
    CH("KONOHANA"):SetMotion(SymMot("EV016_BOW00"), LOOP.OFF)
    CH("KONOHANA"):WaitPlayMotion()
    CH("KONOHANA"):SetMotion(SymMot("EV016_BOW01"), LOOP.ON)
  end
  TASK:Regist(taskKonohana00)
  CH("HERO"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 20, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 1898585654)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("KONOHANA"):SetMotion(SymMot("EV016_BOW02"), LOOP.OFF)
  CH("KONOHANA"):WaitPlayMotion()
  CH("KONOHANA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  CH("JIRAACHI"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(272, 16, SymAct("KONOHANA"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("KONOHANA"), 1748053879)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04_2"))
  CAMERA:SetTgt(SymCam("CAMERA_04_2"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SAD)
  WINDOW:Monologue(1125940404)
  WINDOW:Monologue(1510428149)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 20, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 356965170)
  WINDOW:Talk(SymAct("KONOHANA"), 207481459)
  WINDOW:Talk(SymAct("KONOHANA"), 661698992)
  WINDOW:Talk(SymAct("KONOHANA"), 1047234801)
  WINDOW:Talk(SymAct("KONOHANA"), -1175219138)
  WINDOW:CloseMessage()
  TASK:Regist(subEveNo, {
    CH("HERO")
  })
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFace(20, 20, SymAct("KONOHANA"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("KONOHANA"), -1595366017)
  WINDOW:Talk(SymAct("KONOHANA"), 1671410136)
  WINDOW:CloseMessage()
  TASK:Regist(subEveNo, {
    CH("HERO")
  })
  TASK:Sleep(TimeSec(1.5))
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  CH("PARTNER"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.3))
    CH("KONOHANA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("JIRAACHI"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 2055504025, PARTNER_1 = 1370084186})
  WINDOW:SwitchTalk({PARTNER_0 = 1219682843, PARTNER_1 = 133395676})
  WINDOW:SwitchTalk({PARTNER_0 = 518538653, PARTNER_1 = 902108766})
  subEveCloseMsg()
  WINDOW:DrawFace(272, 16, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 752756511)
  WINDOW:Talk(SymAct("KONOHANA"), -1421460528)
  WINDOW:Talk(SymAct("KONOHANA"), -1302525295)
  WINDOW:Talk(SymAct("KONOHANA"), -618408259)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -1036457988, PARTNER_1 = -384453569})
  WINDOW:SwitchTalk({PARTNER_0 = -267483778, PARTNER_1 = -1085336647})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("JIRAACHI"):SetManpu("MP_QUESTION")
  CH("JIRAACHI"):WaitManpu()
  local taskLookAt01 = function()
    CH("PARTNER"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HERO"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    CH("KONOHANA"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(-20, 0)
  WINDOW:Talk(SymAct("JIRAACHI"), -1504435464)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1921420997, PARTNER_1 = -1805500294})
  WINDOW:CloseMessage()
  CH("PARTNER"):SetMotion(SymMot("SPEAK"), LOOP.OFF)
  CH("PARTNER"):WaitPlayMotion()
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  WINDOW:SysMsg(335174837)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("JIRAACHI"):SetManpu("MP_EXCLAMATION")
  CH("JIRAACHI"):WaitManpu()
  TASK:Regist(subEveDoubleJump, {
    CH("JIRAACHI")
  })
  WINDOW:DrawFace(20, 20, SymAct("JIRAACHI"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("JIRAACHI"), 182545908)
  TASK:WaitTask()
  WINDOW:DrawFace(20, 20, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -2092906773)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_01"), Volume(256))
  CH("JIRAACHI"):SetManpu("MP_SPREE_LP")
  CH("JIRAACHI"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Regist(subEveJump, {
    CH("JIRAACHI")
  })
  WINDOW:DrawFace(20, 20, SymAct("JIRAACHI"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("JIRAACHI"), -1705248854)
  WINDOW:Talk(SymAct("JIRAACHI"), -1317624727)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("KONOHANA"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  CH("KONOHANA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  WINDOW:DrawFace(324, 20, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KONOHANA"), -1469213400)
  CH("PARTNER"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:Talk(SymAct("KONOHANA"), -416545809)
  WINDOW:KeyWait()
  TASK:Regist(subEveDoubleJump, {
    CH("KONOHANA")
  })
  WINDOW:Talk(SymAct("KONOHANA"), -29936978)
  TASK:WaitTask()
  subEveCloseMsg()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -719691411, PARTNER_1 = -872329172})
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_08"))
  CAMERA:SetTgt(SymCam("CAMERA_08"))
  TASK:Sleep(TimeSec(0.2))
  CH("JIRAACHI"):ResetManpu()
  CH("JIRAACHI"):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), 1268337891)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_08_5"), Speed(1.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("KONOHANA"):DirTo(CH("JIRAACHI"), Speed(500), ROT_TYPE.NEAR)
  CH("PARTNER"):DirTo(CH("JIRAACHI"), Speed(500), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(CH("JIRAACHI"), Speed(500), ROT_TYPE.NEAR)
  CAMERA:WaitMove()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_SHOCK_L")
  TASK:Regist(subEveDoubleJump, {
    CH("KONOHANA")
  })
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KONOHANA"), 1384283554)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Sleep(TimeSec(0.2))
  CH("JIRAACHI"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  CH("JIRAACHI"):WaitRotate()
  WINDOW:DrawFace(20, 20, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), 1006412174)
  WINDOW:Talk(SymAct("JIRAACHI"), 585601231)
  WINDOW:Talk(SymAct("JIRAACHI"), 164283148)
  subEveCloseMsg()
  WINDOW:DrawFace(272, 16, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 282194509)
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  TASK:Regist(taskKonohana00)
  WINDOW:DrawFace(272, 16, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 1603298442)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("KONOHANA"):SetMotion(SymMot("EV016_BOW02"), LOOP.OFF)
  CH("KONOHANA"):WaitPlayMotion()
  CH("KONOHANA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.3))
  CH("KONOHANA"):WalkTo(SplinePath(SymSpl("S00_KONOHANA")), Speed(1.5))
  CH("HERO"):DirLockToChara(CH("KONOHANA"))
  CH("JIRAACHI"):DirLockToChara(CH("KONOHANA"))
  CH("PARTNER"):DirLockToChara(CH("KONOHANA"))
  TASK:Sleep(TimeSec(0.5))
  CAMERA:MoveFollow2(SymCam("CAMERA_07"), Speed(1.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("KONOHANA"):WaitMove()
  CH("HERO"):DirLockOff()
  CH("JIRAACHI"):DirLockOff()
  CH("PARTNER"):DirLockOff()
  TASK:Sleep(TimeSec(0.3))
  CH("KONOHANA"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  CH("KONOHANA"):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KONOHANA"), 1183536587)
  WINDOW:Talk(SymAct("KONOHANA"), 1839597064)
  WINDOW:CloseMessage()
  CH("KONOHANA"):ResetManpu()
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1958557513, PARTNER_1 = -215667834})
  WINDOW:SwitchTalk({PARTNER_0 = -365028665, PARTNER_1 = 1981659942})
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetManpu()
  TASK:Regist(subEveMoveDir, {
    CH("KONOHANA"),
    SymPos("P01_KONOHANA"),
    Speed(1.5),
    RotateTarget(0)
  })
  TASK:Sleep(TimeSec(1))
  SOUND:FadeOutBgm(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(1), true)
  TASK:Sleep(TimeSec(0.8))
end
function main16_houmonsha06_end()
end
function groundEnd()
end

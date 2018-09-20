dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main22_hinanbasho01_init()
end
function main22_hinanbasho01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):RunTo(SymPos("P00_HERO"), Speed(3))
  CH("PARTNER"):RunTo(SymPos("P00_PARTNER"), Speed(3))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("PARTNER"):WaitMove()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_L")
  CH("HERO"):WaitMove()
  CH("HERO"):SetManpu("MP_SHOCK_R")
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -2087130703, PARTNER_1 = -1702635280})
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_01"), Speed(10, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  TASK:Sleep(TimeSec(0.7))
  EFFECT:Create("effectBgConLp", SymEff("BG_CONCENTRATION_LP"))
  EFFECT:SetPosition("effectBgConLp", CH("HERO"), BODY_POINT.CENTER)
  EFFECT:Play("effectBgConLp")
  SOUND:PlaySe(SymSnd("SE_EVT_DEDEEN"))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -1313961165, PARTNER_1 = -1464485262})
  SOUND:WaitSe(SymSnd("SE_EVT_DEDEEN"))
  WINDOW:CloseMessage()
  CH("HERO"):SetPosition(SymPos("P01_HERO"))
  CH("PARTNER"):SetPosition(SymPos("P01_PARTNER"))
  EFFECT:Remove("effectBgConLp")
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Regist(subEveRunDir, {
    CH("HERO"),
    SymPos("P02_HERO"),
    Speed(3),
    GM("STONE_PEROPPAFU")
  })
  TASK:Regist(subEveRunDir, {
    CH("PARTNER"),
    SymPos("P02_PARTNER"),
    Speed(3),
    GM("STONE_PEROPPAFU")
  })
  TASK:WaitTask()
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = -403428171, PARTNER_1 = -17883660})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(RotateTarget(120), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("HERO"):WaitManpu()
  CH("PARTNER"):DirTo(RotateTarget(90), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.CATCHBREATH)
  WINDOW:Monologue(-708686281)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.CATCHBREATH)
  WINDOW:SwitchTalk({PARTNER_0 = -858161290, PARTNER_1 = 1262576569})
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.CATCHBREATH)
  WINDOW:Monologue(1381651192)
  WINDOW:Monologue(36373972)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 456144021, PARTNER_1 = 807233366})
  WINDOW:SwitchTalk({PARTNER_0 = 688281111, PARTNER_1 = 1715978448})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("PARTNER"):RunTo(SymPos("P03_PARTNER"), Speed(3))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):RunTo(SplinePath(SymSpl("S00_HERO")), Speed(3))
  TASK:Sleep(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main22_hinanbasho01_end()
end
function main22_hinanbasho02_init()
end
function main22_hinanbasho02_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):RunTo(SymPos("P00_HERO"), Speed(3))
  CH("PARTNER"):RunTo(SymPos("P00_PARTNER"), Speed(3))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("PARTNER"):WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 2136797585, PARTNER_1 = 1416733266})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CAMERA:MoveFollow2(SymCam("CAMERA_02"), Speed(10, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  local taskDesukaan00 = function()
    CH("DESUKAAN"):DirTo(CH("HERO"), Speed(500), ROT_TYPE.NEAR)
    CH("DESUKAAN"):WaitRotate()
    CH("DESUKAAN"):SetManpu("MP_SHOCK_L")
    CH("DESUKAAN"):WalkTo(SymPos("P00_DESUKAAN"), Speed(3), LINK_DIR.OFF)
    CH("DESUKAAN"):WaitMove()
  end
  TASK:Regist(taskDesukaan00)
  local taskKakureon00 = function()
    CH("KAKUREON"):DirTo(RotateTarget(0), Speed(500), ROT_TYPE.NEAR)
    CH("KAKUREON"):WaitRotate()
    CH("KAKUREON"):SetManpu("MP_SHOCK_R")
    CH("KAKUREON"):SetMotion(SymMot("DAMAGE"), LOOP.OFF)
    CH("KAKUREON"):MoveTo(SymPos("P00_KAKUREON"), Speed(3), LINK_DIR.OFF)
    CH("KAKUREON"):WaitMove()
    CH("KAKUREON"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  end
  TASK:Regist(taskKakureon00)
  local taskKureffi00 = function()
    CH("KUREFFI"):DirTo(RotateTarget(0), Speed(500), ROT_TYPE.NEAR)
    CH("KUREFFI"):WaitRotate()
    CH("KUREFFI"):SetManpu("MP_SHOCK_R")
    CH("KUREFFI"):WalkTo(SymPos("P00_KUREFFI"), Speed(3), LINK_DIR.OFF)
    CH("KUREFFI"):WaitMove()
  end
  TASK:Regist(taskKureffi00)
  local taskRuchaburu00 = function()
    CH("RUCHABURU"):SetManpu("MP_SHOCK_R")
    CH("RUCHABURU"):WalkTo(SymPos("P00_RUCHABURU"), Speed(4))
    CH("RUCHABURU"):WaitMove()
    CH("RUCHABURU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("RUCHABURU"):WaitRotate()
  end
  TASK:Regist(taskRuchaburu00)
  WINDOW:DrawFace(20, 20, SymAct("KUREFFI"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KUREFFI"), 1298830099)
  SOUND:WaitSe(SymSnd("SE_EVT_SIGN_SHOCK_01"))
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("KAKUREON"):SetManpu("MP_EXCLAMATION")
  CH("KAKUREON"):WaitManpu()
  WINDOW:DrawFace(272, 16, SymAct("KAKUREON"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KAKUREON"), -890073124)
  WINDOW:CloseMessage()
  CH("RUCHABURU"):SetPosition(SymPos("P02_5_RUCHABURU"))
  CH("RUCHABURU"):SetDir(RotateTarget(60))
  CAMERA:SetEye(SymCam("CAMERA_02_5"))
  CAMERA:SetTgt(SymCam("CAMERA_02_5"))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("KAKUREON"):SetManpu("MP_FLY_SWEAT")
  CH("KAKUREON"):WaitManpu()
  CH("KAKUREON"):SetFacialMotion(FACIAL_MOTION.RELIEF)
  WINDOW:DrawFace(272, 16, SymAct("KAKUREON"), FACE_TYPE.RELIEF)
  WINDOW:Talk(SymAct("KAKUREON"), -739656035)
  WINDOW:CloseMessage()
  CH("KAKUREON"):ResetFacialMotion()
  CH("RUCHABURU"):SetPosition(SymPos("P00_RUCHABURU"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CALM_01"), Volume(256))
  TASK:Regist(Group("grpPartner"), subEveRunDir, {
    CH("PARTNER"),
    SymPos("P01_PARTNER"),
    Speed(2.5),
    CH("KUREFFI")
  })
  TASK:Regist(subEveRunDir, {
    CH("RUCHABURU"),
    SymPos("P01_RUCHABURU"),
    Speed(3),
    CH("PARTNER")
  })
  CH("KUREFFI"):WalkTo(SymPos("P01_KUREFFI"), Speed(2))
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveRunDir, {
    CH("HERO"),
    SymPos("P01_HERO"),
    Speed(2.5),
    CH("KUREFFI")
  })
  TASK:Regist(subEveMoveDir, {
    CH("DESUKAAN"),
    SymPos("P01_DESUKAAN"),
    Speed(1.5),
    CH("PARTNER")
  })
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveMoveDir, {
    CH("KAKUREON"),
    SymPos("P01_KAKUREON"),
    Speed(2),
    CH("PARTNER")
  })
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:WaitTask(Group("grpPartner"))
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 278833722, PARTNER_1 = 159751035})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("KUREFFI"):SetManpu("MP_FLY_SWEAT")
  CH("KUREFFI"):WaitManpu()
  WINDOW:DrawFace(272, 16, SymAct("KUREFFI"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KUREFFI"), 581486776)
  WINDOW:DrawFace(272, 16, SymAct("KUREFFI"), FACE_TYPE.TEARS)
  WINDOW:Talk(SymAct("KUREFFI"), 1001650681)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = 1962045246, PARTNER_1 = 1844010623})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("RUCHABURU"):SetManpu("MP_FLY_SWEAT")
  CH("RUCHABURU"):WaitManpu()
  CH("RUCHABURU"):SetFacialMotion(FACIAL_MOTION.PAIN)
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("PARTNER"):DirTo(CH("RUCHABURU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("RUCHABURU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(20, 20, SymAct("RUCHABURU"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("RUCHABURU"), 1187253692)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_L")
  TASK:Regist(subEveJumpSurprise, {
    CH("PARTNER")
  })
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 1608465661, PARTNER_1 = -666427342})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  TASK:Sleep(TimeSec(0.2))
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("PARTNER"):DirTo(CH("DESUKAAN"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("DESUKAAN"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  WINDOW:DrawFace(324, 20, SymAct("DESUKAAN"), FACE_TYPE.SPECIAL01)
  WINDOW:Talk(SymAct("DESUKAAN"), -1050930829)
  WINDOW:Talk(SymAct("DESUKAAN"), -1474114209)
  WINDOW:Talk(SymAct("DESUKAAN"), -1321599970)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_R")
  TASK:Regist(subEveJumpSurprise, {
    CH("PARTNER")
  })
  CH("HERO"):SetManpu("MP_SHOCK_R")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -1709920291, PARTNER_1 = -2096128356})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_07"))
  CAMERA:SetTgt(SymCam("CAMERA_07"))
  TASK:Sleep(TimeSec(0.2))
  local taskLookAt02 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("PARTNER"):DirTo(CH("KAKUREON"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("KAKUREON"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt02)
  WINDOW:DrawFace(324, 20, SymAct("KAKUREON"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("KAKUREON"), -867301285)
  WINDOW:Talk(SymAct("KAKUREON"), -715835110)
  WINDOW:Talk(SymAct("KAKUREON"), -25662759)
  WINDOW:KeyWait()
  TASK:Regist(subEveDoubleJump, {
    CH("KAKUREON")
  })
  WINDOW:DrawFace(324, 20, SymAct("KAKUREON"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KAKUREON"), -412918888)
  WINDOW:Talk(SymAct("KAKUREON"), 1627080535)
  WINDOW:Talk(SymAct("KAKUREON"), 2044753430)
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("KUREFFI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KUREFFI"), 905311718)
  WINDOW:Talk(SymAct("KUREFFI"), 753845415)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = 130258788, PARTNER_1 = 517514789})
  WINDOW:SwitchTalk({PARTNER_0 = 1368994018, PARTNER_1 = 1216479651})
  WINDOW:SwitchTalk({PARTNER_0 = 1672434272, PARTNER_1 = 2058642209})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_08"))
  CAMERA:SetTgt(SymCam("CAMERA_08"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(-47415314)
  WINDOW:Monologue(-466137425)
  WINDOW:Monologue(-1924558205)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(20, 20, SymAct("RUCHABURU"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("RUCHABURU"), -1806523454)
  WINDOW:Talk(SymAct("RUCHABURU"), -1082134527)
  WINDOW:Talk(SymAct("RUCHABURU"), -1503346368)
  WINDOW:Talk(SymAct("RUCHABURU"), -383428729)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = -264345914, PARTNER_1 = -619498235})
  WINDOW:SwitchTalk({PARTNER_0 = -1039662012, PARTNER_1 = 1167071371})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_07"))
  CAMERA:SetTgt(SymCam("CAMERA_07"))
  local taskLookAt03 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("PARTNER"):DirTo(CH("KUREFFI"), Speed(200), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("KUREFFI"), Speed(200), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt03)
  TASK:Sleep(TimeSec(0.3))
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = 1552624074, PARTNER_1 = -1610859155})
  WINDOW:SwitchTalk({PARTNER_0 = -2031678420, PARTNER_1 = -1379246097})
  WINDOW:KeyWait()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1261343058, PARTNER_1 = -74385303})
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_09"))
  CAMERA:SetTgt(SymCam("CAMERA_09"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(272, 16, SymAct("KAKUREON"), FACE_TYPE.CATCHBREATH)
  WINDOW:Talk(SymAct("KAKUREON"), -494155480)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_10"), Speed(2, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  WINDOW:DrawFace(72, 16, SymAct("KUREFFI"), FACE_TYPE.CATCHBREATH)
  WINDOW:Talk(SymAct("KUREFFI"), -911828245)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_07"))
  CAMERA:SetTgt(SymCam("CAMERA_07"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_QUESTION")
  CH("PARTNER"):WaitManpu()
  local taskPartner00 = function()
    CH("PARTNER"):DirTo(CH("RUCHABURU"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):WaitRotate()
    TASK:Sleep(TimeSec(0.3))
    CH("PARTNER"):DirTo(CH("DESUKAAN"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):WaitRotate()
    TASK:Sleep(TimeSec(0.3))
    CH("PARTNER"):DirTo(CH("KUREFFI"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):WaitRotate()
  end
  TASK:Regist(taskPartner00)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -792876118, PARTNER_1 = 1462089573})
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Regist(taskLookAt00)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("RUCHABURU"):SetManpu("MP_FLY_SWEAT")
  CH("RUCHABURU"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("RUCHABURU"), FACE_TYPE.CATCHBREATH)
  WINDOW:Talk(SymAct("RUCHABURU"), 1312720420)
  WINDOW:Talk(SymAct("RUCHABURU"), 658528776)
  WINDOW:Talk(SymAct("RUCHABURU"), 1046178633)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(taskLookAt01)
  WINDOW:DrawFace(324, 20, SymAct("DESUKAAN"), FACE_TYPE.SPECIAL01)
  WINDOW:Talk(SymAct("DESUKAAN"), 360069258)
  subEveCloseMsg()
  TASK:Regist(taskLookAt03)
  CH("KUREFFI"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Regist(subEveDoubleJump, {
    CH("KUREFFI")
  })
  WINDOW:DrawFace(20, 20, SymAct("KUREFFI"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KUREFFI"), 208472523)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("KUREFFI"):ResetFacialMotion()
  SOUND:PlayBgm(SymSnd("BGM_EVE_THEME_PARTNER_02"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_07"))
  CAMERA:SetTgt(SymCam("CAMERA_07"))
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = 1126997772, PARTNER_1 = 1513598541})
  subEveCloseMsg()
  CH("HERO"):DirTo(CH("KAKUREON"), Speed(200), ROT_TYPE.NEAR)
  CH("KAKUREON"):SetManpu("MP_LAUGH_LP")
  CH("KAKUREON"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(324, 20, SymAct("KAKUREON"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KAKUREON"), 1897594254)
  WINDOW:Talk(SymAct("KAKUREON"), 1744948431)
  WINDOW:Talk(SymAct("KAKUREON"), -275132416)
  WINDOW:CloseMessage()
  CH("KAKUREON"):ResetFacialMotion()
  CH("KAKUREON"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -159194815, PARTNER_1 = 2133019230})
  WINDOW:KeyWait()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:SwitchTalk({PARTNER_0 = 1714977567, PARTNER_1 = 1293232348})
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(20, 20, SymAct("RUCHABURU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RUCHABURU"), 1410210205)
  WINDOW:Talk(SymAct("RUCHABURU"), 458198874)
  WINDOW:Talk(SymAct("RUCHABURU"), 39108123)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_11"))
  CAMERA:SetTgt(SymCam("CAMERA_11"))
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(CH("PARTNER"), Speed(200), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = 695856600, PARTNER_1 = 811785369})
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.EMOTION)
  WINDOW:Monologue(-1208303530)
  WINDOW:Monologue(-1360924393)
  WINDOW:Monologue(-945869509)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  TASK:Regist(taskLookAt01)
  WINDOW:DrawFace(324, 20, SymAct("DESUKAAN"), FACE_TYPE.SPECIAL03)
  WINDOW:Talk(SymAct("DESUKAAN"), -561767302)
  WINDOW:CloseMessage()
  EFFECT:Create("effectBgConLp", SymEff("BG_CONCENTRATION_LP"))
  EFFECT:SetPosition("effectBgConLp", CH("DESUKAAN"), BODY_POINT.CENTER)
  EFFECT:Play("effectBgConLp")
  CAMERA:SetEye(SymCam("CAMERA_12"))
  CAMERA:SetTgt(SymCam("CAMERA_12"))
  CAMERA:MoveFollow2(SymCam("CAMERA_12_5"), Speed(8, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  WINDOW:DrawFace(324, 88, SymAct("DESUKAAN"), FACE_TYPE.SPECIAL02)
  WINDOW:Talk(SymAct("DESUKAAN"), -173453383)
  WINDOW:CloseMessage()
  EFFECT:Remove("effectBgConLp")
  CAMERA:SetEye(SymCam("CAMERA_07"))
  CAMERA:SetTgt(SymCam("CAMERA_07"))
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(taskLookAt02)
  CH("KAKUREON"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Regist(subEveDoubleJump, {
    CH("KAKUREON")
  })
  WINDOW:DrawFace(324, 20, SymAct("KAKUREON"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KAKUREON"), -323846408)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("KAKUREON"):ResetFacialMotion()
  CAMERA:MoveFollow2(SymCam("CAMERA_13"), Speed(6, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("KAKUREON"):DirTo(GM("STORE_BANK"), Speed(350), ROT_TYPE.NEAR)
  CH("KAKUREON"):WaitRotate()
  CH("RUCHABURU"):DirTo(GM("STORE_BANK"), Speed(350), ROT_TYPE.NEAR)
  CH("KUREFFI"):DirTo(GM("STORE_BANK"), Speed(350), ROT_TYPE.NEAR)
  CH("DESUKAAN"):DirTo(GM("STORE_BANK"), Speed(350), ROT_TYPE.NEAR)
  CAMERA:WaitMove()
  CH("KAKUREON"):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("KAKUREON"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAKUREON"), -1544296385)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_07"), Speed(6, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("KAKUREON"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("RUCHABURU"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("KUREFFI"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("DESUKAAN"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CAMERA:WaitMove()
  WINDOW:DrawFace(324, 20, SymAct("KAKUREON"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAKUREON"), -1159145090)
  WINDOW:KeyWait()
  CH("KAKUREON"):SetManpu("MP_LAUGH_LP")
  CH("KAKUREON"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(324, 20, SymAct("KAKUREON"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KAKUREON"), -1849324867)
  WINDOW:CloseMessage()
  CH("KAKUREON"):ResetFacialMotion()
  CH("KAKUREON"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -1998668804, PARTNER_1 = 256288563})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_11"))
  CAMERA:SetTgt(SymCam("CAMERA_11"))
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = 375232114, PARTNER_1 = 195154611})
  WINDOW:SwitchTalk({PARTNER_0 = 314237938, PARTNER_1 = 966242353})
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1.2))
  subEveNod(CH("HERO"))
  TASK:Sleep(TimeSec(0.2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  CAMERA:MoveToHero(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  TASK:Sleep(TimeSec(1))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_03"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.2))
  subTowerUpdate()
end
function main22_hinanbasho02_end()
end
function groundEnd()
end
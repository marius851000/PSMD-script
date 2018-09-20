dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main13_pokemonatlusnaoru01_init()
end
function main13_pokemonatlusnaoru01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2.5))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("JIRAACHI"), 1227632799)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:MoveFollow2(SymCam("CAMERA_00_5"), Speed(15, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  GM("POKEMON_ATLAS"):SetMotion(SymMot("KEEP"), LOOP.ON)
  SOUND:PlayMe(SymSnd("ME_EVT_DAN_01"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.7))
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = 1345782238, PARTNER_1 = 2065322525})
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = 1644258140, PARTNER_1 = 759231899})
  WINDOW:CloseMessage()
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_03"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 20, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 878429402)
  WINDOW:Talk(SymAct("DENRYUU"), 527865625)
  WINDOW:CloseMessage()
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("KUCHIITO"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    CH("DEDENNE"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    CH("BUIZERU"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HORUBII"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    CH("PEROPPAFU"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt00)
  CH("JIRAACHI"):DirTo(CH("DENRYUU"), Speed(200), ROT_TYPE.NEAR)
  CH("JIRAACHI"):WaitRotate()
  CH("JIRAACHI"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH("JIRAACHI"):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(324, 20, SymAct("JIRAACHI"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("JIRAACHI"), 107849304)
  WINDOW:CloseMessage()
  CH("JIRAACHI"):ResetManpu()
  CH("JIRAACHI"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(0.2))
  CH("AAKEN"):SetFacialMotion(FACIAL_MOTION.SAD)
  WINDOW:DrawFace(20, 20, SymAct("AAKEN"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("AAKEN"), -2114602345)
  WINDOW:Talk(SymAct("AAKEN"), -1729197098)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -165434308)
  WINDOW:Talk(SymAct("JIRAACHI"), -281502339)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 20, SymAct("AAKEN"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("AAKEN"), -1005203778)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("KUCHIITO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("DEDENNE"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("BUIZERU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HORUBII"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("PEROPPAFU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):ResetFacialMotion()
    CH("AAKEN"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  CH("DENRYUU"):DirTo(CH("HORUBII"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  WINDOW:DrawFace(20, 20, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -586219521)
  WINDOW:Talk(SymAct("DENRYUU"), -1840289480)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("HORUBII"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("HORUBII"), -1957406599)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("DENRYUU"):SetManpu("MP_EXCLAMATION")
  CH("DENRYUU"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -1602679878)
  WINDOW:Talk(SymAct("DENRYUU"), -1184744709)
  WINDOW:Talk(SymAct("DENRYUU"), 1056581172)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_L")
  CH("HORUBII"):SetManpu("MP_SHOCK_L")
  CH("JIRAACHI"):SetManpu("MP_SHOCK_L")
  CH("PEROPPAFU"):SetManpu("MP_EXCLAMATION")
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("DEDENNE"):SetManpu("MP_SHOCK_L")
  CH("BUIZERU"):SetManpu("MP_EXCLAMATION")
  CH("KUCHIITO"):SetManpu("MP_EXCLAMATION")
  CH("AAKEN"):SetManpu("MP_EXCLAMATION")
  CH("AAKEN"):WaitManpu()
  local taskLookAt02 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("KUCHIITO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("DEDENNE"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("BUIZERU"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HORUBII"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("PEROPPAFU"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("JIRAACHI"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt02)
  WINDOW:DrawFace(324, 20, SymAct("BUIZERU"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("BUIZERU"), 669063029)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 20, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -459930670)
  WINDOW:Talk(SymAct("DENRYUU"), -41078125)
  WINDOW:Talk(SymAct("DENRYUU"), -694132400)
  WINDOW:Talk(SymAct("DENRYUU"), -809807855)
  WINDOW:Talk(SymAct("DENRYUU"), -2131048746)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("HORUBII"):SetManpu("MP_EXCLAMATION")
  CH("JIRAACHI"):SetManpu("MP_NOTICE_L")
  CH("PEROPPAFU"):SetManpu("MP_EXCLAMATION")
  TASK:Sleep(TimeSec(0.1))
  CH("DEDENNE"):SetManpu("MP_NOTICE_L")
  CH("BUIZERU"):SetManpu("MP_EXCLAMATION")
  CH("KUCHIITO"):SetManpu("MP_NOTICE_R")
  CH("AAKEN"):SetManpu("MP_EXCLAMATION")
  CH("AAKEN"):WaitManpu()
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  WINDOW:DrawFace(324, 20, SymAct("BUIZERU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUIZERU"), -1713244265)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_05"), Speed(4, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("AAKEN"), -1295211436)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("HORUBII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HORUBII"), -1411934955)
  WINDOW:Talk(SymAct("HORUBII"), 743410138)
  subEveCloseMsg()
  local taskLookAt02_5 = function()
    CH("DEDENNE"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.4))
    CH("KUCHIITO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("BUIZERU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HORUBII"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("PEROPPAFU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("AAKEN"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt02_5)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  CH("DEDENNE"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("DEDENNE")
  })
  WINDOW:DrawFace(272, 16, SymAct("DEDENNE"), FACE_TYPE.EMOTION)
  WINDOW:Talk(SymAct("DEDENNE"), 894744731)
  WINDOW:Talk(SymAct("DEDENNE"), 1546282167)
  WINDOW:CloseMessage()
  CH("DEDENNE"):ResetManpu()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 20, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1160861174)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  CH("DENRYUU"):DirTo(CH("HERO"), Speed(200), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  TASK:Regist(taskLookAt02)
  WINDOW:DrawFace(272, 16, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1847330357)
  WINDOW:Talk(SymAct("DENRYUU"), 1996961652)
  subEveCloseMsg()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = 944153011, PARTNER_1 = 559780082})
  WINDOW:SwitchTalk({PARTNER_0 = 175162161, PARTNER_1 = 325841520})
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -1795952961, PARTNER_1 = -1914118146})
  subEveCloseMsg()
  local taskLookAt02_6 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("KUCHIITO"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("PARTNER"):DirTo(CH("KUCHIITO"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt02_6)
  WINDOW:DrawFace(20, 20, SymAct("KUCHIITO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KUCHIITO"), -1040360434)
  WINDOW:Talk(SymAct("KUCHIITO"), -655987377)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveDoubleJump, {
    CH("BUIZERU")
  })
  WINDOW:DrawFace(324, 20, SymAct("BUIZERU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUIZERU"), -204783988)
  CH("PARTNER"):DirTo(CH("BUIZERU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("BUIZERU"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_07"))
  CAMERA:SetTgt(SymCam("CAMERA_07"))
  TASK:Sleep(TimeSec(0.2))
  local taskLookAt03 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("PARTNER"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt03)
  TASK:Regist(subEveDoubleJump, {
    CH("PEROPPAFU")
  })
  WINDOW:DrawFace(324, 88, SymAct("PEROPPAFU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("PEROPPAFU"), -355463219)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -1517184758, PARTNER_1 = -1131763637})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  CH("PARTNER"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -1750598776, PARTNER_1 = -1900229943})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  local taskLookAt04 = function()
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("PARTNER"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt04)
  CH("JIRAACHI"):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(324, 20, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), 153409030)
  WINDOW:KeyWait()
  CH("JIRAACHI"):ResetManpu()
  WINDOW:Talk(SymAct("JIRAACHI"), 272623431)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 2034318187, PARTNER_1 = 1616513578})
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  subEveCloseMsg()
  WINDOW:DrawFace(324, 20, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), 1266113001)
  WINDOW:Talk(SymAct("JIRAACHI"), 1382836392)
  WINDOW:Talk(SymAct("JIRAACHI"), 489553519)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1.5))
  CH("HERO"):DirTo(SymPos("P_KUBOMI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):DirTo(SymPos("P_KUBOMI"), Speed(200), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  local taskLookAt06 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("KUCHIITO"):DirTo(SymPos("P_KUBOMI"), Speed(350), ROT_TYPE.NEAR)
    CH("DEDENNE"):DirTo(SymPos("P_KUBOMI"), Speed(350), ROT_TYPE.NEAR)
    CH("BUIZERU"):DirTo(SymPos("P_KUBOMI"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HORUBII"):DirTo(SymPos("P_KUBOMI"), Speed(350), ROT_TYPE.NEAR)
    CH("PEROPPAFU"):DirTo(SymPos("P_KUBOMI"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("JIRAACHI"):DirTo(SymPos("P_KUBOMI"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(SymPos("P_KUBOMI"), Speed(350), ROT_TYPE.NEAR)
    CH("DENRYUU"):DirTo(SymPos("P_KUBOMI"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt06)
  TASK:Sleep(TimeSec(1))
  WINDOW:SysMsg(70700846)
  WINDOW:CloseMessage()
  TASK:Regist(subEveMoveDir, {
    CH("HERO"),
    SymPos("P00_HERO"),
    Speed(1.5),
    RotateTarget(180)
  })
  TASK:WaitTask()
  TASK:Sleep(TimeSec(0.7))
  CAMERA:SetEye(SymCam("CAMERA_08"))
  CAMERA:SetTgt(SymCam("CAMERA_08"))
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(790338797)
  WINDOW:CloseMessage()
  CH("HERO"):SetMotion(SymMot("PUSH"), LOOP.ON)
  TASK:Sleep(TimeSec(0.3))
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  SOUND:PlaySe(SymSnd("SE_EVT_ORB_HAMERU"), Volume(190))
  SOUND:WaitSe(SymSnd("SE_EVT_ORB_HAMERU"))
  WINDOW:SysMsg(906014124)
  WINDOW:SysMsg(-1315393181)
  WINDOW:CloseMessage()
  EFFECT:Create("effectAtlasBoot", SymEff("EV_ATLAS_BOOT"))
  EFFECT:SetPosition("effectAtlasBoot", SymPos("P_EFF_EV_ATLAS_BOOT"))
  EFFECT:Play("effectAtlasBoot")
  local taskKidouSe = function()
    SOUND:PlaySe(SymSnd("SE_EVT_ATLAS_KIDOU_01_LP"))
    TASK:Sleep(TimeSec(35, TIME_TYPE.FRAME))
    SOUND:PlaySe(SymSnd("SE_EVT_ATLAS_KIDOU_02"))
    TASK:Sleep(TimeSec(30, TIME_TYPE.FRAME))
    SOUND:FadeInEnv(SymSnd("SE_EVT_ATLAS_WORK_LP"), TimeSec(0.5), Volume(256))
  end
  TASK:Regist(taskKidouSe)
  TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
  local taskLookAt07 = function()
    CH("PARTNER"):DirTo(SymPos("P_ATLAS"), Speed(350), ROT_TYPE.NEAR)
    CH("KUCHIITO"):DirTo(SymPos("P_ATLAS"), Speed(350), ROT_TYPE.NEAR)
    CH("DEDENNE"):DirTo(SymPos("P_ATLAS"), Speed(350), ROT_TYPE.NEAR)
    CH("BUIZERU"):DirTo(SymPos("P_ATLAS"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HORUBII"):DirTo(SymPos("P_ATLAS"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("JIRAACHI"):DirTo(SymPos("P_ATLAS"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(SymPos("P_ATLAS"), Speed(350), ROT_TYPE.NEAR)
    CH("DENRYUU"):DirTo(SymPos("P_ATLAS"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt07)
  CH("HERO"):SetManpu("MP_SHOCK_L")
  CH("HERO"):WalkTo(SymPos("P01_HERO"), Speed(1.5), LINK_DIR.OFF)
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  CAMERA:SetEye(SymCam("CAMERA_09"))
  CAMERA:SetTgt(SymCam("CAMERA_09"))
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -1467776990, PARTNER_1 = 1811190917})
  TASK:Sleep(TimeSec(30, TIME_TYPE.FRAME))
  GM("POKEMON_ATLAS"):SetMotion(SymMot("START"), LOOP.OFF)
  GM("POKEMON_ATLAS"):SetNextMotion(SymMot("LOOP"), LOOP.ON, TimeSec(0))
  WINDOW:ForceCloseMessage()
  TASK:Sleep(TimeSec(2.2))
  SCREEN_A:WhiteOut(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(1))
  SCREEN_A:WhiteIn(TimeSec(0.5), true)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 1928308164, PARTNER_1 = 1505949191})
  subEveCloseMsg()
  SOUND:FadeOutEnv(TimeSec(3))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_03"), Volume(256))
  WINDOW:DrawFace(324, 20, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), 1088014150)
  WINDOW:Talk(SymAct("JIRAACHI"), 261640577)
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(CH("JIRAACHI"), Speed(200), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(CH("JIRAACHI"), Speed(200), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_QUESTION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = 377708736, PARTNER_1 = 1034826499})
  WINDOW:CloseMessage()
  CH("DENRYUU"):DirTo(CH("HERO"), Speed(200), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("DENRYUU"):SetManpu("MP_FLY_SWEAT")
  CH("DENRYUU"):WaitManpu()
  CH("HERO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("PARTNER"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 20, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 615842370)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("DENRYUU"):WalkTo(SymPos("P00_DENRYUU"), Speed(1.5))
  TASK:Sleep(TimeSec(0.5))
  CH("PARTNER"):DirTo(SymPos("P00_DENRYUU"), Speed(60), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitMove()
  SOUND:PlaySe(SymSnd("SE_EVT_HAND"))
  SOUND:WaitSe(SymSnd("SE_EVT_HAND"))
  WINDOW:SysMsg(-1557324147)
  WINDOW:CloseMessage()
  CH("DENRYUU"):WalkTo(SymPos("P01_DENRYUU"), Speed(1.5), LINK_DIR.OFF)
  CH("DENRYUU"):WaitMove()
  TASK:Sleep(TimeSec(0.3))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
end
function main13_pokemonatlusnaoru01_end()
end
function main13_pokemonatlusnaoru02_init()
end
function main13_pokemonatlusnaoru02_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_03"), Volume(256))
  SAJI:CreateSajiPlayer("gajet_01", "EV13_070_02_1")
  SAJI:CreateSajiPlayer("gajet_02", "EV13_070_02_2")
  SAJI:CreateSajiPlayer("gajet_03", "EV13_070_02_3")
  SAJI:CreateSajiPlayer("gajet_04", "EV13_070_02_4")
  SAJI:CreateSajiPlayer("gajet_05", "EV13_070_02_5")
  SAJI:CreateSajiPlayer("gajet_06", "EV13_070_02_6")
  SAJI:CreateSajiPlayer("gajet_07", "EV13_070_02_7")
  SAJI:CreateSajiPlayer("gajet_08", "EV13_070_02_8")
  SJ("gajet_02"):SetVisible(false)
  SJ("gajet_03"):SetVisible(false)
  SJ("gajet_04"):SetVisible(false)
  SJ("gajet_05"):SetVisible(false)
  SJ("gajet_06"):SetVisible(false)
  SJ("gajet_07"):SetVisible(false)
  SJ("gajet_08"):SetVisible(false)
  SJ("gajet_01"):SetPosition(Vector2(200, 120))
  SJ("gajet_02"):SetPosition(Vector2(200, 120))
  SJ("gajet_03"):SetPosition(Vector2(200, 120))
  SJ("gajet_04"):SetPosition(Vector2(200, 120))
  SJ("gajet_05"):SetPosition(Vector2(200, 120))
  SJ("gajet_06"):SetPosition(Vector2(200, 120))
  SJ("gajet_07"):SetPosition(Vector2(200, 120))
  SJ("gajet_08"):SetPosition(Vector2(200, 120))
  SJ("gajet_01"):SetDrawPriority(1024)
  SJ("gajet_02"):SetDrawPriority(1024)
  SJ("gajet_03"):SetDrawPriority(1024)
  SJ("gajet_04"):SetDrawPriority(1024)
  SJ("gajet_05"):SetDrawPriority(1024)
  SJ("gajet_06"):SetDrawPriority(1024)
  SJ("gajet_07"):SetDrawPriority(1024)
  SJ("gajet_08"):SetDrawPriority(1024)
  SJ("gajet_01"):Play(LOOP.OFF)
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  SJ("gajet_01"):WaitEnd()
  SJ("gajet_02"):SetVisible(true)
  SJ("gajet_02"):Play(LOOP.ON)
  SAJI:DestroySajiPlayer("gajet_01")
  TASK:Sleep(TimeSec(0.3))
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = -1170853940, PARTNER_1 = -750193696})
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -900480351)
  WINDOW:Talk(SymAct("DENRYUU"), -511798942)
  WINDOW:Talk(SymAct("DENRYUU"), -127557597)
  WINDOW:Talk(SymAct("DENRYUU"), -1222363420)
  WINDOW:Talk(SymAct("DENRYUU"), -1371600987)
  WINDOW:Talk(SymAct("DENRYUU"), -2062396314)
  subEveCloseMsg()
  SJ("gajet_03"):SetVisible(true)
  SJ("gajet_03"):Play(LOOP.OFF)
  SAJI:DestroySajiPlayer("gajet_02")
  SJ("gajet_03"):WaitEnd()
  SJ("gajet_04"):SetVisible(true)
  SJ("gajet_04"):Play(LOOP.OFF)
  SAJI:DestroySajiPlayer("gajet_03")
  SJ("gajet_04"):WaitEnd()
  SJ("gajet_05"):SetVisible(true)
  SJ("gajet_05"):Play(LOOP.OFF)
  SAJI:DestroySajiPlayer("gajet_04")
  SJ("gajet_05"):WaitEnd()
  SJ("gajet_06"):SetVisible(true)
  SJ("gajet_06"):Play(LOOP.OFF)
  SAJI:DestroySajiPlayer("gajet_05")
  SJ("gajet_06"):WaitEnd()
  SJ("gajet_07"):SetVisible(true)
  SJ("gajet_07"):Play(LOOP.OFF)
  SAJI:DestroySajiPlayer("gajet_06")
  TASK:Sleep(TimeSec(2))
  SOUND:PlaySe(SymSnd("SE_EVT_GADGET_SET"), Volume(256))
  SJ("gajet_07"):WaitEnd()
  SJ("gajet_08"):SetVisible(true)
  SJ("gajet_08"):Play(LOOP.ON)
  SAJI:DestroySajiPlayer("gajet_07")
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -1677105881, PARTNER_1 = 462518760})
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.EMOTION)
  WINDOW:Monologue(42617001)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -1960057930)
  WINDOW:Talk(SymAct("JIRAACHI"), -1842294025)
  WINDOW:Talk(SymAct("JIRAACHI"), -1189248716)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -1610174347, PARTNER_1 = -280549710})
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -161736717)
  WINDOW:Talk(SymAct("JIRAACHI"), -579779536)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  SAJI:DestroySajiPlayer("gajet_08")
end
function main13_pokemonatlusnaoru02_end()
end
function main13_pokemonatlusnaoru03_init()
end
function main13_pokemonatlusnaoru03_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_03"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(4))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -999656079, PARTNER_1 = 1139960254})
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetManpu()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1525242111, PARTNER_1 = 865567955})
  WINDOW:SwitchTalk({PARTNER_0 = 713864594, PARTNER_1 = 27387473})
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(0.2))
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.4))
    CH("HERO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("PARTNER"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(272, 16, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(-20, 0)
  WINDOW:Talk(SymAct("DENRYUU"), 414897936)
  WINDOW:Talk(SymAct("DENRYUU"), 1476084183)
  WINDOW:Talk(SymAct("DENRYUU"), 1323331734)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("DENRYUU"):DirTo(RotateTarget(0), Speed(200), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  CH("DENRYUU"):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(20, 20, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1707942741)
  WINDOW:CloseMessage()
  CH("DENRYUU"):ResetManpu()
  CH("DEDENNE"):SetManpu("MP_SPREE_LP")
  CH("AAKEN"):SetManpu("MP_SPREE_LP")
  CH("HORUBII"):SetManpu("MP_SPREE_LP")
  CH("BUIZERU"):SetManpu("MP_SPREE_LP")
  CH("PEROPPAFU"):SetManpu("MP_SPREE_LP")
  CH("DEDENNE"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("AAKEN"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HORUBII"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("BUIZERU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PEROPPAFU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  TASK:Sleep(TimeSec(0.2))
  CH("KUCHIITO"):SetManpu("MP_SPREE_LP")
  CH("JIRAACHI"):SetManpu("MP_SPREE_LP")
  CH("KUCHIITO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("JIRAACHI"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HERO"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("HERO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PARTNER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  WINDOW:SysMsg(2094404116)
  CH("PARTNER"):WaitPlayMotion()
  WINDOW:CloseMessage()
  CH("DEDENNE"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("AAKEN"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HORUBII"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("BUIZERU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.2))
  CH("PEROPPAFU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("KUCHIITO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("JIRAACHI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("DEDENNE"):ResetManpu()
  CH("AAKEN"):ResetManpu()
  CH("HORUBII"):ResetManpu()
  CH("BUIZERU"):ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  CH("PEROPPAFU"):ResetManpu()
  CH("KUCHIITO"):ResetManpu()
  CH("HERO"):ResetManpu()
  CH("PARTNER"):ResetManpu()
  CH("JIRAACHI"):ResetManpu()
  TASK:Sleep(TimeSec(0.5))
  CH("PEROPPAFU"):WalkTo(SymPos("P00_PEROPPAFU"), Speed(3))
  CH("KUCHIITO"):WalkTo(SymPos("P00_KUCHIITO"), Speed(3))
  TASK:Sleep(TimeSec(0.2))
  CH("AAKEN"):WalkTo(SplinePath(SymPos("P00_AAKEN"), SymPos("P01_AAKEN")), Speed(3))
  CH("JIRAACHI"):WalkTo(SplinePath(SymPos("P00_JIRAACHI"), SymPos("P01_JIRAACHI")), Speed(3))
  TASK:Sleep(TimeSec(0.2))
  CH("HORUBII"):WalkTo(SplinePath(SymPos("P00_HORUBII"), SymPos("P01_HORUBII")), Speed(3))
  TASK:Sleep(TimeSec(0.3))
  CH("BUIZERU"):WalkTo(SplinePath(SymPos("P00_BUIZERU"), SymPos("P01_BUIZERU"), SymPos("P02_BUIZERU")), Speed(3))
  SOUND:FadeOutBgm(TimeSec(2))
  TASK:Sleep(TimeSec(0.3))
  CH("DENRYUU"):DirTo(SymPos("P00_DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  CH("DENRYUU"):SetMotion(SymMot("EV006_WALK"), LOOP.ON)
  CH("DENRYUU"):MoveTo(SymPos("P00_DENRYUU"), Speed(1.2))
  CH("PARTNER"):DirTo(SymPos("P00_DENRYUU"), Speed(60), ROT_TYPE.NEAR)
  CH("HERO"):DirTo(SymPos("P00_DENRYUU"), Speed(200), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.4))
  CH("DEDENNE"):DirTo(SymPos("P00_DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  CH("DEDENNE"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("DEDENNE"):SetManpu("MP_EXCLAMATION")
  CH("DENRYUU"):WaitMove()
  CH("DENRYUU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("DEDENNE"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("DEDENNE")
  })
  WINDOW:DrawFace(324, 88, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DEDENNE"), -78770469)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("DENRYUU"):SetManpu("MP_NOTICE_L")
  CH("DENRYUU"):WaitManpu()
  CH("DENRYUU"):DirTo(CH("DEDENNE"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  TASK:Regist(subEveDoubleJump, {
    CH("DEDENNE")
  })
  WINDOW:DrawFace(324, 88, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DEDENNE"), -497729638)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("DEDENNE"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("DENRYUU"):SetManpu("MP_FLY_SWEAT")
  CH("DENRYUU"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("DENRYUU"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("DENRYUU"), 839664659)
  WINDOW:CloseMessage()
  CH("DENRYUU"):SetMotion(SymMot("EV006_WALK"), LOOP.ON)
  CH("DENRYUU"):MoveTo(SplinePath(SymPos("P01_DENRYUU"), SymPos("P02_DENRYUU"), SymPos("P03_DENRYUU")), Speed(1.2))
  TASK:Sleep(TimeSec(0.6))
  CH("HERO"):DirTo(SymPos("P03_DENRYUU"), Speed(60), ROT_TYPE.NEAR)
  CH("PARTNER"):DirTo(SymPos("P03_DENRYUU"), Speed(200), ROT_TYPE.LEFT)
  TASK:Sleep(TimeSec(0.2))
  CH("DEDENNE"):DirTo(SymPos("P02_DENRYUU"), Speed(60), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(2.3))
  CH("DEDENNE"):WalkTo(SymPos("P00_DEDENNE"), Speed(1.2))
  TASK:Sleep(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  CH("DENRYUU"):SetVisible(false)
  CH("DEDENNE"):SetVisible(false)
  CH("JIRAACHI"):SetVisible(false)
  CH("HORUBII"):SetVisible(false)
  CH("BUIZERU"):SetVisible(false)
  CH("PEROPPAFU"):SetVisible(false)
  CH("AAKEN"):SetVisible(false)
  CH("KUCHIITO"):SetVisible(false)
end
function main13_pokemonatlusnaoru03_end()
end
function groundEnd()
end

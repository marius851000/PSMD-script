dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function yakusya_cyousadan01_init()
end
function yakusya_cyousadan01_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_01"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("DENRYUU"):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(272, 16, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(-30, 0)
  WINDOW:Talk(SymAct("DENRYUU"), -1219758546)
  WINDOW:CloseMessage()
  WINDOW:CloseMessage()
  CH("DENRYUU"):ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  CH("DEDENNE"):SetManpu("MP_SPREE_LP")
  CH("AAKEN"):SetManpu("MP_SPREE_LP")
  CH("HORUBII"):SetManpu("MP_SPREE_LP")
  CH("BUIZERU"):SetManpu("MP_SPREE_LP")
  CH("PEROPPAFU"):SetManpu("MP_SPREE_LP")
  CH("KUCHIITO"):SetManpu("MP_SPREE_LP")
  CH("JIRAACHI"):SetManpu("MP_SPREE_LP")
  CH("HERO"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("DEDENNE"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("AAKEN"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HORUBII"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("BUIZERU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PEROPPAFU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("KUCHIITO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("JIRAACHI"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HERO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PARTNER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  WINDOW:SysMsg(-1370437777)
  CH("PARTNER"):WaitPlayMotion()
  WINDOW:CloseMessage()
  CH("DEDENNE"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("AAKEN"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HORUBII"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("BUIZERU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PEROPPAFU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("KUCHIITO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("JIRAACHI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("DEDENNE"):ResetManpu()
  CH("AAKEN"):ResetManpu()
  CH("HORUBII"):ResetManpu()
  CH("BUIZERU"):ResetManpu()
  CH("PEROPPAFU"):ResetManpu()
  CH("KUCHIITO"):ResetManpu()
  CH("HERO"):ResetManpu()
  CH("PARTNER"):ResetManpu()
  CH("JIRAACHI"):ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  CH("AAKEN"):RunTo(SymPos("P00_AAKEN"), Speed(3))
  CH("HORUBII"):DirTo(SymPos("P00_HORUBII"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("PEROPPAFU"):RunTo(SymPos("P00_PEROPPAFU"), Speed(3))
  CH("BUIZERU"):RunTo(SymPos("P00_BUIZERU"), Speed(3))
  TASK:Sleep(TimeSec(0.1))
  CH("HORUBII"):WalkTo(SymPos("P00_HORUBII"), Speed(3))
  CH("DEDENNE"):RunTo(SymPos("P00_DEDENNE"), Speed(3))
  CH("KUCHIITO"):RunTo(SplinePath(SymPos("P00_KUCHIITO"), SymPos("P01_KUCHIITO")), Speed(3))
  TASK:Sleep(TimeSec(0.1))
  CH("JIRAACHI"):RunTo(SplinePath(SymPos("P00_JIRAACHI"), SymPos("P01_JIRAACHI")), Speed(3))
  TASK:Sleep(TimeSec(1.5))
  CH("DENRYUU"):DirTo(SymPos("P00_DENRYUU"), Speed(60), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  TASK:Sleep(TimeSec(1))
  CH("DENRYUU"):WalkTo(SymPos("P00_DENRYUU"), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("DENRYUU"):WaitMove()
  CH("DENRYUU"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(272, 16, SymAct("DENRYUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("DENRYUU"), -2055367508)
  WINDOW:KeyWait()
  CH("DENRYUU"):ResetFacialMotion()
  WINDOW:DrawFace(272, 16, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -1670994451)
  WINDOW:Talk(SymAct("DENRYUU"), -752405718)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_QUESTION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -902036885, PARTNER_1 = -518958680})
  subEveCloseMsg()
  WINDOW:DrawFace(272, 16, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -133537559)
  WINDOW:Talk(SymAct("DENRYUU"), 2140306470)
  WINDOW:CloseMessage()
  CH("DENRYUU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  WINDOW:DrawFace(72, 16, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1720274279)
  WINDOW:CloseMessage()
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1.5))
  CH("HERO"):WaitMove()
  SOUND:PlaySe(SymSnd("SE_EVT_HAND"), Volume(256))
  WINDOW:SysMsg(2046470695)
  WINDOW:CloseMessage()
  CH("DENRYUU"):DirTo(RotateTarget(-130), Speed(350), ROT_TYPE.RIGHT)
  CH("DENRYUU"):WaitRotate()
  CH("DENRYUU"):SetNeckRot(RotateTarget(0), RotateTarget(-30), RotateTarget(0), TimeSec(0.3))
  CH("DENRYUU"):WaitNeckRot()
  local taskDenryuu00 = function()
    CH("DENRYUU"):SetMotion(SymMot("SPEAK"), LOOP.ON)
    TASK:Sleep(TimeSec(1))
    CH("DENRYUU"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  end
  TASK:Regist(taskDenryuu00)
  WINDOW:DrawFace(272, 16, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1625398118)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("DENRYUU"):ResetNeckRot(TimeSec(0.15))
  CH("DENRYUU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.LEFT)
  CH("DENRYUU"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_HAND"), Volume(256))
  WINDOW:SysMsg(1271711909)
  WINDOW:CloseMessage()
  CH("HERO"):WalkTo(SymPos("P01_HERO"), Speed(1.5), LINK_DIR.OFF)
  CH("HERO"):WaitMove()
  WINDOW:DrawFace(72, 16, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1389885924)
  WINDOW:Talk(SymAct("DENRYUU"), 496398115)
  WINDOW:Talk(SymAct("DENRYUU"), 76373602)
  WINDOW:Talk(SymAct("DENRYUU"), 799018401)
  WINDOW:Talk(SymAct("DENRYUU"), 918240480)
  WINDOW:Talk(SymAct("DENRYUU"), -1323098065)
  WINDOW:Talk(SymAct("DENRYUU"), -1472720530)
  WINDOW:Talk(SymAct("DENRYUU"), 1800340937)
  WINDOW:KeyWait()
  CH("DENRYUU"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(72, 16, SymAct("DENRYUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("DENRYUU"), 1918121096)
  WINDOW:Talk(SymAct("DENRYUU"), 1501128523)
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  CH("DENRYUU"):ResetFacialMotion()
  local eLanguageType = SYSTEM:GetLanguageType()
  local symbolName = "CONNECT2_LEGEND"
  if eLanguageType == LANGUAGE_TYPE.JP then
    symbolName = "CONNECT2_LEGEND"
  elseif eLanguageType == LANGUAGE_TYPE.EN then
    symbolName = "CONNECT2_LEGEND"
  elseif eLanguageType == LANGUAGE_TYPE.FR then
    symbolName = "CONNECT2_LEGEND_FR"
  elseif eLanguageType == LANGUAGE_TYPE.GE then
    symbolName = "CONNECT2_LEGEND_GE"
  elseif eLanguageType == LANGUAGE_TYPE.IT then
    symbolName = "CONNECT2_LEGEND_IT"
  elseif eLanguageType == LANGUAGE_TYPE.SP then
    symbolName = "CONNECT2_LEGEND_SP"
  end
  SAJI:CreateSajiPlayer("connected", symbolName)
  SJ("connected"):SetPosition(Vector2(200, 120))
  SJ("connected"):SetDrawPriority(200)
  SOUND:PlaySe(SymSnd("SE_SYS_ORB_CONNECTED_2"), Volume(256))
  SJ("connected"):Play(LOOP.OFF)
  SJ("connected"):WaitEnd()
  SAJI:DestroySajiPlayer("connected")
  TASK:Sleep(TimeSec(0.3))
  SOUND:PlayMe(SymSnd("ME_MINIGAME_PERFECT"), Volume(256))
  WINDOW:SysMsg(1080186378)
  SOUND:WaitMe()
  WINDOW:CloseMessage()
  CH("DENRYUU"):SetVisible(false)
  CAMERA:MoveToHero(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  CAMERA:ResetSisaRateVolume()
  CAMERA:ResetSisaAzimuthDifferenceVolume()
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_01"), Volume(256))
  TASK:Sleep(TimeSec(0.2))
  subTowerUpdate()
end
function yakusya_cyousadan01_end()
end

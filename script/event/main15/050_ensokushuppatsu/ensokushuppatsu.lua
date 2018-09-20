dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main15_ensokushuppatsu01_init()
end
function main15_ensokushuppatsu01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_WAIWAITOWN_01"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CAMERA:MoveFollow2(SymCam("CAMERA_02"), Speed(2, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CAMERA:WaitMove()
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1473462561)
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DEDENNE"), 1321758816)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_QUESTION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = 1709515683, PARTNER_1 = 2097025762})
  CH("DEDENNE"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("JIRAACHI"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DEDENNE"), 868189221)
  subEveCloseMsg()
  WINDOW:DrawFace(272, 16, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), 715437412)
  WINDOW:Talk(SymAct("JIRAACHI"), 25814695)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = 412276710, PARTNER_1 = -1626682583})
  subEveCloseMsg()
  CH("DEDENNE"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH("DEDENNE"):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(72, 16, SymAct("DEDENNE"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("DEDENNE"), -2045642136)
  WINDOW:CloseMessage()
  CH("DEDENNE"):ResetManpu()
  CH("DEDENNE"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PEROPPAFU"):SetManpu("MP_FLY_SWEAT")
  CH("PEROPPAFU"):WaitManpu()
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("DEDENNE"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    CH("BUIZERU"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("JIRAACHI"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    CH("DENRYUU"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    CH("HORUBII"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(324, 88, SymAct("PEROPPAFU"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("PEROPPAFU"), -1419284385)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 20, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DEDENNE"), -1300479714)
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(20, -10)
  WINDOW:Talk(SymAct("JIRAACHI"), -1722740003)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("DENRYUU"):DirTo(CH("HORUBII"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("DEDENNE"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("BUIZERU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("JIRAACHI"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
    CH("PEROPPAFU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("HORUBII"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("KUCHIITO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  WINDOW:DrawFace(324, 20, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -2142624868)
  subEveCloseMsg()
  CH("AAKEN"):SetManpu("MP_SPREE_LP")
  CH("HORUBII"):SetManpu("MP_SPREE_LP")
  CH("BUIZERU"):SetManpu("MP_SPREE_LP")
  CH("HERO"):SetManpu("MP_SPREE_LP")
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("PEROPPAFU"):SetManpu("MP_SPREE_LP")
  CH("KUCHIITO"):SetManpu("MP_SPREE_LP")
  CH("AAKEN"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HORUBII"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("BUIZERU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PEROPPAFU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("KUCHIITO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HERO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PARTNER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  WINDOW:SysMsg(-821316261)
  CH("PARTNER"):WaitPlayMotion()
  WINDOW:CloseMessage()
  CH("AAKEN"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HORUBII"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("BUIZERU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.1))
  CH("PEROPPAFU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("KUCHIITO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("AAKEN"):ResetManpu()
  CH("HORUBII"):ResetManpu()
  CH("BUIZERU"):ResetManpu()
  CH("PEROPPAFU"):ResetManpu()
  CH("KUCHIITO"):ResetManpu()
  CH("HERO"):ResetManpu()
  CH("PARTNER"):ResetManpu()
  TASK:Sleep(TimeSec(0.5))
  CH("DENRYUU"):DirTo(CH("JIRAACHI"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
    CH("BUIZERU"):DirTo(RotateTarget(160), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PEROPPAFU"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
    CH("HORUBII"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):DirTo(RotateTarget(170), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
    CH("KUCHIITO"):DirTo(RotateTarget(-170), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -703560678)
  subEveCloseMsg()
  TASK:Regist(subEveJump, {
    CH("DEDENNE")
  })
  WINDOW:DrawFace(72, 16, SymAct("DEDENNE"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("DEDENNE"), -46278695)
  TASK:WaitTask()
  CH("DEDENNE"):SetMotion(SymMot("EV015_SHAKE00"), LOOP.ON)
  CH("JIRAACHI"):SetMotion(SymMot("EV015_SHAKE00"), LOOP.ON)
  WINDOW:CloseMessage()
  TASK:Regist(subEveMoveDir2, {
    CH("AAKEN"),
    SymPos("P00_AAKEN"),
    Speed(1.5),
    SymPos("P00_AAKEN")
  })
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveMoveDir2, {
    CH("KUCHIITO"),
    SymPos("P00_KUCHIITO"),
    Speed(1.5),
    SymPos("P00_KUCHIITO")
  })
  TASK:Regist(subEveMoveDir2, {
    CH("HORUBII"),
    SymPos("P00_HORUBII"),
    Speed(1.5),
    SymPos("P00_HORUBII")
  })
  TASK:Sleep(TimeSec(0.3))
  CH("BUIZERU"):WalkTo(SplinePath(SymPos("P00_BUIZERU"), SymPos("P01_BUIZERU")), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  CH("DENRYUU"):WalkTo(SplinePath(SymPos("P00_DENRYUU"), SymPos("P01_DENRYUU")), Speed(1.5))
  TASK:Regist(subEveMoveDir2, {
    CH("PEROPPAFU"),
    SymPos("P00_PEROPPAFU"),
    Speed(1.5),
    SymPos("P00_PEROPPAFU")
  })
  TASK:Regist(subEveMoveDir2, {
    CH("HERO"),
    SymPos("P00_HERO"),
    Speed(1.5),
    SymPos("P00_HERO")
  })
  TASK:Sleep(TimeSec(0.1))
  TASK:Regist(subEveMoveDir2, {
    CH("PARTNER"),
    SymPos("P00_PARTNER"),
    Speed(1.5),
    SymPos("P00_PARTNER")
  })
  TASK:Sleep(TimeSec(3.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main15_ensokushuppatsu01_end()
end
function main15_ensokushuppatsu02_init()
end
function main15_ensokushuppatsu02_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_WAIWAITOWN_01"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("RAPURASU"):SetShadow(false)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.2))
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -467212648, PARTNER_1 = 1673460311})
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("RAPURASU"):SetManpu("MP_SHOCK_L")
  CH("RAPURASU"):WaitManpu()
  WINDOW:DrawFace(324, 20, SymAct("RAPURASU"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("RAPURASU"), 2057685782)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  CH("RAPURASU"):SetManpu("MP_SWEAT_L")
  CH("RAPURASU"):WaitManpu()
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 20, SymAct("RAPURASU"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("RAPURASU"), -1177362511)
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(1), true)
  TASK:Sleep(TimeSec(1))
  WINDOW:Talk(SymAct("RAPURASU"), -1597378832)
  WINDOW:Talk(SymAct("RAPURASU"), -1947943629)
  WINDOW:CloseMessage()
end
function main15_ensokushuppatsu02_end()
end
function main15_ensokushuppatsu03_init()
end
function main15_ensokushuppatsu03_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  local taskOee00 = function()
    function TaskL.Loop()
      CAMERA:MoveFollow2(SymCam("CAMERA_01"), Speed(10, ACCEL_TYPE.HIGH, DECEL_TYPE.LOW))
      CAMERA:WaitMove()
      CAMERA:MoveFollow2(SymCam("CAMERA_00"), Speed(10, ACCEL_TYPE.HIGH, DECEL_TYPE.LOW))
      CAMERA:WaitMove()
    end
    function TaskL.Finish()
      return
    end
  end
  TASK:Regist(taskOee00)
  local taskSoundThunder = function()
    function TaskL.Loop()
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
      SOUND:PlaySe(SymSnd("SE_ENV_THUNDER"), Volume(256))
    end
    function TaskL.Finish()
      return
    end
  end
  TASK:Regist(Group("grpThunder"), taskSoundThunder)
  SOUND:FadeInEnv(SymSnd("SE_ENV_STORM_SEA_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:DrawFace(20, 88, SymAct("PEROPPAFU"), FACE_TYPE.FAINT)
  WINDOW:Talk(SymAct("PEROPPAFU"), -1828746126)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("AAKEN"), FACE_TYPE.FAINT)
  WINDOW:Talk(SymAct("AAKEN"), -574743883)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("BUIZERU"), FACE_TYPE.FAINT)
  WINDOW:Talk(SymAct("BUIZERU"), -995808268)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.FAINT)
  WINDOW:SwitchTalk({PARTNER_0 = -276269001, PARTNER_1 = -158119562})
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.FAINT)
  WINDOW:Talk(SymAct("DENRYUU"), 1896568249)
  WINDOW:CloseMessage()
  TASK:ExitNotifyTasks(Group("grpThunder"))
  SOUND:FadeOutEnv(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(1), true)
  TASK:Sleep(TimeSec(3))
end
function main15_ensokushuppatsu03_end()
end
function main15_ensokushuppatsu04_init()
end
function main15_ensokushuppatsu04_start()
  TASK:Sleep(TimeSec(0.5))
  SOUND:FadeInEnv(SymSnd("SE_ENV_SEA_02_LP"), TimeSec(0.5), Volume(256))
  WINDOW:SysMsg(1745904888)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:SetFovy(SymCam("CAMERA_00"))
  CH("RAPURASU"):SetShadow(false)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(3))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main15_ensokushuppatsu04_end()
end
function main15_ensokushuppatsu05_init()
end
function main15_ensokushuppatsu05_start()
  SOUND:PlayEnv(SymSnd("SE_ENV_SEA_02_LP"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:MoveFollow2(SymCam("CAMERA_00_5"), Speed(11, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SOUND:PlaySe(SymSnd("SE_EVT_STYLISH"), Volume(256))
  EFFECT:Create("effectBgConLp", SymEff("BG_CONCENTRATION_LP"))
  EFFECT:SetPosition("effectBgConLp", CH("DENRYUU"), BODY_POINT.CENTER)
  EFFECT:Play("effectBgConLp")
  CH("DENRYUU"):SetMotion(SymMot("EV006_POSE00"), LOOP.OFF)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("DENRYUU"):WaitPlayMotion()
  CH("DENRYUU"):SetMotion(SymMot("EV006_POSE01"), LOOP.ON)
  CH("DENRYUU"):SetManpu("MP_SPREE_LP")
  WINDOW:Talk(SymAct("DENRYUU"), 24033492)
  CAMERA:WaitMove()
  WINDOW:CloseMessage()
  EFFECT:Remove("effectBgConLp")
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("PARTNER"):SetMotion(SymMot("EV001_CONFIRMS"), LOOP.OFF)
  CH("PARTNER"):WaitPlayMotion()
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_QUESTION")
  CH("PARTNER"):WaitManpu()
  CH("PARTNER"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.3))
    CH("KUCHIITO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("PEROPPAFU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HORUBII"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HERO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("BUIZERU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 410356117, PARTNER_1 = 861461078})
  WINDOW:CloseMessage()
  CH("DENRYUU"):ResetManpu()
  CH("DENRYUU"):SetMotion(SymMot("WAIT02"), LOOP.ON, TimeSec(0.25))
  TASK:Sleep(TimeSec(0.25))
  CH("DENRYUU"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 709094167)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SWEAT_R")
  CH("PARTNER"):WaitManpu()
  CH("PARTNER"):DirTo(RotateTarget(135), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("KUCHIITO"):DirTo(RotateTarget(135), Speed(350), ROT_TYPE.NEAR)
  CH("PEROPPAFU"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HORUBII"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("AAKEN"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(RotateTarget(135), Speed(350), ROT_TYPE.NEAR)
  CH("BUIZERU"):DirTo(RotateTarget(135), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.3))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CAMERA:SetFovy(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.CATCHBREATH)
  WINDOW:SwitchTalk({PARTNER_0 = 1694662096, PARTNER_1 = 2082032785})
  WINDOW:SwitchTalk({PARTNER_0 = 1463033682, PARTNER_1 = 1311714835})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  CAMERA:SetFovy(SymCam("CAMERA_03"))
  CH("PEROPPAFU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PEROPPAFU"):WaitRotate()
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.3))
    CH("KUCHIITO"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HORUBII"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HERO"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("BUIZERU"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  CH("PEROPPAFU"):SetManpu("MP_SPREE_LP")
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("PEROPPAFU")
  })
  CH("PEROPPAFU"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(324, 88, SymAct("PEROPPAFU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("PEROPPAFU"), -910740772)
  WINDOW:CloseMessage()
  CH("DENRYUU"):DirTo(CH("PEROPPAFU"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  CH("PEROPPAFU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  CH("PEROPPAFU"):ResetManpu()
  CH("PEROPPAFU"):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -794033251)
  WINDOW:Talk(SymAct("DENRYUU"), -1665564563)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("PEROPPAFU"):SetManpu("MP_SHOCK_L")
  TASK:Regist(subEveJumpSurprise, {
    CH("PEROPPAFU")
  })
  CH("PEROPPAFU"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("PEROPPAFU"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("PEROPPAFU"), -2052935380)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -1366301969)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("DENRYUU"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  CH("KUCHIITO"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("PEROPPAFU"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HORUBII"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("AAKEN"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("BUIZERU"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(1))
  SOUND:VolumeEnv(Volume(64), TimeSec(0.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
end
function main15_ensokushuppatsu05_end()
end
function main15_ensokushuppatsu06_init()
end
function main15_ensokushuppatsu06_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  MAP:SetVisible(false)
  MAP:SetBG(SymImg("IMEV1501"))
  MAP:SetVisibleBG(true)
  SOUND:FadeInBgm(SymSnd("SE_ENV_VOLCANO_LOW_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -1214983250)
  WINDOW:Talk(SymAct("DENRYUU"), -120240791)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -506563544, PARTNER_1 = -891082773})
  WINDOW:SwitchTalk({PARTNER_0 = -738715990, PARTNER_1 = 1415580261})
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  MAP:SetVisible(true)
  MAP:SetVisibleBG(false)
end
function main15_ensokushuppatsu06_end()
end
function main15_ensokushuppatsu07_init()
end
function main15_ensokushuppatsu07_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:VolumeEnv(Volume(256), TimeSec(0.5))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  CH("DENRYUU"):DirTo(CH("PARTNER"), Speed(200), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  CH("PARTNER"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.3))
    CH("KUCHIITO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("PEROPPAFU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HORUBII"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HERO"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    CH("AAKEN"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("BUIZERU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1299921700)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("DENRYUU"):DirTo(RotateTarget(180), Speed(200), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 604366600)
  WINDOW:Talk(SymAct("DENRYUU"), 1025431113)
  WINDOW:Talk(SymAct("DENRYUU"), 372475274)
  WINDOW:CloseMessage()
  SOUND:FadeOutEnv(TimeSec(1.5))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_03"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("DENRYUU"):DirTo(CH("AAKEN"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 254325963)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  CH("DENRYUU"):DirTo(CH("BUIZERU"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1080631820)
  WINDOW:CloseMessage()
  CH("DENRYUU"):DirTo(CH("KUCHIITO"), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1500648269)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 20, SymAct("KUCHIITO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KUCHIITO"), 1918845070)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("DENRYUU"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("DENRYUU"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1799647695)
  WINDOW:Talk(SymAct("DENRYUU"), -321098496)
  WINDOW:CloseMessage()
  CH("AAKEN"):SetManpu("MP_SPREE_LP")
  CH("HORUBII"):SetManpu("MP_SPREE_LP")
  CH("BUIZERU"):SetManpu("MP_SPREE_LP")
  TASK:Sleep(TimeSec(0.1))
  CH("PEROPPAFU"):SetManpu("MP_SPREE_LP")
  CH("KUCHIITO"):SetManpu("MP_SPREE_LP")
  CH("HERO"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("AAKEN"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HORUBII"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("BUIZERU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PEROPPAFU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("KUCHIITO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HERO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PARTNER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  WINDOW:SysMsg(-171484095)
  CH("PARTNER"):WaitPlayMotion()
  WINDOW:CloseMessage()
  CH("AAKEN"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HORUBII"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("BUIZERU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("AAKEN"):ResetManpu()
  CH("HORUBII"):ResetManpu()
  CH("BUIZERU"):ResetManpu()
  TASK:Sleep(TimeSec(0.1))
  CH("PEROPPAFU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("KUCHIITO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PEROPPAFU"):ResetManpu()
  CH("KUCHIITO"):ResetManpu()
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HERO"):ResetManpu()
  CH("PARTNER"):ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 917522662)
  WINDOW:Talk(SymAct("DENRYUU"), 799766951)
  WINDOW:CloseMessage()
  TASK:Regist(subEveMoveDir, {
    CH("AAKEN"),
    SymPos("P00_AAKEN"),
    Speed(1.5),
    SymPos("P00_PEROPPAFU")
  })
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveMoveDir, {
    CH("HERO"),
    SymPos("P00_HERO"),
    Speed(1.5),
    SymPos("P00_PARTNER")
  })
  TASK:Sleep(TimeSec(0.1))
  TASK:Regist(subEveMoveDir, {
    CH("HORUBII"),
    SymPos("P00_HORUBII"),
    Speed(1.5),
    SymPos("P00_AAKEN")
  })
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveMoveDir, {
    CH("PEROPPAFU"),
    SymPos("P00_PEROPPAFU"),
    Speed(1.5),
    SymPos("P00_AAKEN")
  })
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveMoveDir, {
    CH("PARTNER"),
    SymPos("P00_PARTNER"),
    Speed(1.5),
    SymPos("P00_HERO")
  })
  CH("BUIZERU"):WalkTo(SymPos("P00_BUIZERU"), Speed(1.5))
  TASK:Sleep(TimeSec(0.3))
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Sleep(TimeSec(0.7))
  CH("DENRYUU"):SetManpu("MP_NOTICE_R")
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 75901540)
  CH("KUCHIITO"):DirTo(SymPos("P00_BUIZERU"), Speed(350), ROT_TYPE.NEAR)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("BUIZERU"):SetManpu("MP_EXCLAMATION")
  CH("BUIZERU"):WaitMove()
  WINDOW:CloseMessage()
  CH("BUIZERU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  CH("BUIZERU"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 496835365)
  WINDOW:CloseMessage()
  CH("BUIZERU"):WalkTo(SymPos("P01_BUIZERU"), Speed(1.5))
  CH("KUCHIITO"):DirTo(SymPos("P01_BUIZERU"), Speed(60), ROT_TYPE.NEAR)
  CH("BUIZERU"):WaitMove()
  TASK:Sleep(TimeSec(0.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.3))
  CH("PEROPPAFU"):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(20, 88, SymAct("PEROPPAFU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("PEROPPAFU"), 1390185954)
  WINDOW:CloseMessage()
  CH("PEROPPAFU"):ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  CH("AAKEN"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_ANGRY_02"), Volume(256))
  CH("AAKEN"):SetManpu("MP_ANGRY_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("AAKEN")
  })
  WINDOW:DrawFace(272, 16, SymAct("AAKEN"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("AAKEN"), 1271381155)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("AAKEN"):ResetManpu()
  SCREEN_A:FadeOut(TimeSec(0.3), true)
end
function main15_ensokushuppatsu07_end()
end
function main15_ensokushuppatsu08_init()
end
function main15_ensokushuppatsu08_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_03"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1626009440)
  WINDOW:Talk(SymAct("DENRYUU"), 2045894177)
  WINDOW:Talk(SymAct("DENRYUU"), -26623250)
  WINDOW:Talk(SymAct("DENRYUU"), -411896913)
  WINDOW:Talk(SymAct("DENRYUU"), -1911804029)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("BUIZERU"):SetManpu("MP_FLY_SWEAT")
  CH("BUIZERU"):WaitManpu()
  CH("BUIZERU"):DirTo(CH("KUCHIITO"), Speed(350), ROT_TYPE.NEAR)
  CH("BUIZERU"):WaitRotate()
  WINDOW:DrawFace(324, 20, SymAct("BUIZERU"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("BUIZERU"), -1760092478)
  WINDOW:CloseMessage()
  CH("BUIZERU"):DirTo(CH("DENRYUU"), Speed(350), ROT_TYPE.NEAR)
  CH("BUIZERU"):WaitRotate()
  WINDOW:DrawFace(324, 20, SymAct("BUIZERU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUIZERU"), -1137029887)
  WINDOW:Talk(SymAct("BUIZERU"), -1524532160)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -362747257)
  WINDOW:Talk(SymAct("DENRYUU"), -209986618)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 20, SymAct("BUIZERU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUIZERU"), -665417723)
  WINDOW:Talk(SymAct("BUIZERU"), -1051870908)
  WINDOW:Talk(SymAct("BUIZERU"), 1188406667)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("DENRYUU"), 1607374026)
  WINDOW:Talk(SymAct("DENRYUU"), -697352235)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 20, SymAct("BUIZERU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUIZERU"), -814477676)
  WINDOW:CloseMessage()
  CH("BUIZERU"):DirTo(SymPos("P00_BUIZERU"), Speed(350), ROT_TYPE.NEAR)
  CH("BUIZERU"):WaitRotate()
  CH("BUIZERU"):WalkTo(SymPos("P00_BUIZERU"), Speed(1.5))
  TASK:Sleep(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
end
function main15_ensokushuppatsu08_end()
end
function main15_ensokushuppatsu09_init()
end
function main15_ensokushuppatsu09_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_03"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  CH("BUIZERU"):WalkTo(SymPos("P00_BUIZERU"), Speed(1.5))
  TASK:Sleep(TimeSec(0.6))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("HERO"):SetManpu("MP_NOTICE_L")
  CH("PARTNER"):WaitManpu()
  CH("PARTNER"):DirTo(SymPos("P00_BUIZERU"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(SymPos("P00_BUIZERU"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -463905449, PARTNER_1 = -45978602})
  WINDOW:CloseMessage()
  CH("BUIZERU"):WaitMove()
  CH("BUIZERU"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("BUIZERU"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("BUIZERU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUIZERU"), -1308362031)
  WINDOW:Talk(SymAct("BUIZERU"), -1424438384)
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -2143971245, PARTNER_1 = -1724995310})
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
end
function main15_ensokushuppatsu09_end()
end
function groundEnd()
end

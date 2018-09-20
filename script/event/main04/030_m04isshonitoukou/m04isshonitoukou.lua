dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main04_m04isshonitoukou01_init()
end
function main04_m04isshonitoukou01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH("PARTNER"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  CH("PARTNER"):SetMotionRaito(Raito(2))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHILDREN_01"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1.5))
  CH("PARTNER"):ResetFacialMotion()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):SetMotionRaito(Raito(1))
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  CH("PARTNER"):WaitManpu()
  CH("HERO"):WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1388907843, PARTNER_1 = -1272069124})
  WINDOW:SwitchTalk({PARTNER_0 = -1627353025, PARTNER_1 = -2045009538})
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
  TASK:Regist(subEveMoveDir2, {
    CH("PARTNER"),
    SymPos("P01_PARTNER"),
    Speed(1.5),
    SymPos("P01_PARTNER")
  })
  TASK:Sleep(TimeSec(0.7))
  CH("HERO"):WalkTo(SymPos("P01_HERO"), Speed(1.5))
  TASK:Sleep(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main04_m04isshonitoukou01_end()
end
function main04_m04isshonitoukou02_init()
end
function main04_m04isshonitoukou02_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHILDREN_01"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  GIMMICK:SetupLoopPlaced(SymGA("SCHOOL_ROAD"), 0, 10)
  GIMMICK:SetLoopPlacedRightMode()
  GIMMICK:MoveLoopPlaced(Speed(0.8))
  GIMMICK:SetLoopPlacedRightMode()
  CH("HERO"):SetMotion(SymMot("WALK"), LOOP.ON)
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):SetMotion(SymMot("WALK"), LOOP.ON)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = -916834375, PARTNER_1 = -801044744})
  WINDOW:KeyWait()
  CH("PARTNER"):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -76786373, PARTNER_1 = -495491974})
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  GIMMICK:MoveLoopPlaced(Speed(0))
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.5))
end
function main04_m04isshonitoukou02_end()
end
function main04_m04isshonitoukou03_init()
end
function main04_m04isshonitoukou03_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHILDREN_01"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("NYASUPAA"):SetVisible(false)
  CH("NUMERA"):SetVisible(false)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Regist(subEveRunDir, {
    CH("PARTNER"),
    SymPos("P00_PARTNER"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Regist(subEveRunDir, {
    CH("HERO"),
    SymPos("P00_HERO"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:WaitTask()
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 1710192821, PARTNER_1 = 2096384500})
  CH("PARTNER"):ResetFacialMotion()
  CH("PARTNER"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("MIRUHOGGU"):SetManpu("MP_EXCLAMATION")
  TASK:Regist(subEveJumpSurprise, {
    CH("MIRUHOGGU")
  })
  WINDOW:CloseMessage()
  TASK:WaitTask()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("MIRUHOGGU"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(72, 16, SymAct("MIRUHOGGU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 620473754)
  TASK:Sleep(TimeSec(0.2))
  WINDOW:ForceCloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("MIRUHOGGU"):SetManpu("MP_SHOCK_R")
  TASK:Regist(subEveJumpSurprise, {
    CH("MIRUHOGGU")
  })
  CAMERA:SetShake(Vector2(0.02, 0.02), TimeSec(1, TIME_TYPE.FRAME))
  WINDOW:DrawFace(72, 16, SymAct("MIRUHOGGU"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1038130395)
  CAMERA:SetShake(Vector2(0, 0), TimeSec(0))
  WINDOW:DrawFace(72, 16, SymAct("MIRUHOGGU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 382586648)
  TASK:Regist(subEveJump, {
    CH("MIRUHOGGU")
  })
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("PARTNER"):RunTo(SymPos("P00_5_PARTNER"), Speed(2.5))
  CH("MIRUHOGGU"):DirTo(SymPos("P00_5_PARTNER"), Speed(60), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):RunTo(SymPos("P00_5_HERO"), Speed(2.5))
  TASK:Sleep(TimeSec(1.5))
  CH("HERO"):SetPosition(SymPos("P01_HERO"))
  CH("PARTNER"):SetPosition(SymPos("P01_PARTNER"))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  local taskYanChobo00 = function()
    CH("YANCHAMU"):SetManpu("MP_SPREE_LP")
    CH("YANCHAMU"):SetMotion(SymMot("SPEAK"), LOOP.OFF)
    CH("YANCHAMU"):WaitPlayMotion()
    CH("YANCHAMU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    CH("CHOBOMAKI"):SetManpu("MP_LAUGH_LP")
    CH("YANCHAMU"):ResetManpu()
  end
  TASK:Regist(taskYanChobo00)
  TASK:Sleep(TimeSec(0.3))
  CH("PARTNER"):RunTo(SymPos("P02_PARTNER"), Speed(3))
  TASK:Sleep(TimeSec(0.3))
  CH("HERO"):RunTo(SymPos("P02_HERO"), Speed(3))
  CH("PARTNER"):WaitMove()
  TASK:WaitTask()
  CH("CHOBOMAKI"):ResetManpu()
  local taskYanChobo01 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("YANCHAMU"):SetManpu("MP_EXCLAMATION")
    CH("YANCHAMU"):WaitManpu()
    CH("YANCHAMU"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("CHOBOMAKI"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskYanChobo01)
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_EXCLAMATION")
  CH("SHIKIJIKA_SPRING"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 265748057, PARTNER_1 = 1083664542})
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_FLY_SWEAT")
  CH("SHIKIJIKA_SPRING"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.CATCHBREATH)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1502370271)
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetFacialMotion()
  CAMERA:MoveFollow2(SymCam("CAMERA_03"), Speed(2, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  TASK:Regist(subEveRunDir, {
    CH("PARTNER"),
    SymPos("P03_PARTNER"),
    Speed(3),
    CH("CHOBOMAKI")
  })
  CH("SHIKIJIKA_SPRING"):DirTo(SymPos("P03_PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("CHOBOMAKI"):DirTo(SymPos("P03_PARTNER"), Speed(60), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("YANCHAMU"):DirTo(SymPos("P03_PARTNER"), Speed(60), ROT_TYPE.NEAR)
  TASK:Regist(subEveMoveDir, {
    CH("HERO"),
    SymPos("P03_HERO"),
    Speed(1.5),
    SymPos("P03_PARTNER")
  })
  TASK:WaitTask()
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 1923156508, PARTNER_1 = 1807367005})
  subEveCloseMsg()
  CH("PARTNER"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("CHOBOMAKI"):SetManpu("MP_FLY_SWEAT")
  CH("CHOBOMAKI"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("CHOBOMAKI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("CHOBOMAKI"), -333305966)
  WINDOW:KeyWait()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_ANGRY_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("CHOBOMAKI")
  })
  WINDOW:DrawFace(324, 88, SymAct("CHOBOMAKI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("CHOBOMAKI"), -180807981)
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetFacialMotion()
  TASK:Regist(subEveRunDir, {
    CH("PARTNER"),
    SymPos("P04_PARTNER"),
    Speed(3),
    CH("YANCHAMU")
  })
  local taskLookAt01 = function()
    CH("YANCHAMU"):DirTo(SymPos("P04_PARTNER"), Speed(60), ROT_TYPE.NEAR)
    CH("SHIKIJIKA_SPRING"):DirTo(SymPos("P04_PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("CHOBOMAKI"):DirTo(SymPos("P04_PARTNER"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 911082100, PARTNER_1 = 794112821})
  TASK:Sleep(TimeSec(0.5))
  CH("PARTNER"):ResetManpu()
  WINDOW:ForceCloseMessage()
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_ANGRY_02"), Volume(256))
  CH("YANCHAMU"):SetManpu("MP_ANGRY_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("YANCHAMU")
  })
  WINDOW:DrawFace(324, 20, SymAct("YANCHAMU"), FACE_TYPE.ANGRY)
  WINDOW:Talk(SymAct("YANCHAMU"), 74998006)
  WINDOW:Talk(SymAct("YANCHAMU"), 493048247)
  WINDOW:CloseMessage()
  CH("YANCHAMU"):ResetManpu()
  TASK:Sleep(TimeSec(0.5))
  CAMERA:MoveFollow(SymCam("CAMERA_04"), Speed(1.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("PARTNER"):WalkTo(SplinePath(SymPos("P03_PARTNER"), SymPos("P05_PARTNER")), Speed(1.5))
  CH("CHOBOMAKI"):DirTo(SymPos("P05_PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("YANCHAMU"):DirTo(SymPos("P05_PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.3))
  CH("SHIKIJIKA_SPRING"):DirTo(SymPos("P05_PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):DirTo(SymPos("P05_PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CAMERA:WaitMove()
  CH("PARTNER"):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1378010992, PARTNER_1 = 1262089777})
  CH("PARTNER"):ResetManpu()
  WINDOW:CloseMessage()
  CH("NYASUPAA"):SetVisible(true)
  CH("NUMERA"):SetVisible(true)
  TASK:Regist(subEveMoveDir, {
    CH("NYASUPAA"),
    SymPos("P00_NYASUPAA"),
    Speed(1.5),
    CH("PARTNER")
  })
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  CH("PARTNER"):DirTo(SymPos("P00_NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("HERO"):DirTo(SymPos("P00_NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  CH("SHIKIJIKA_SPRING"):DirTo(SymPos("P00_NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  TASK:Regist(subEveMoveDir, {
    CH("NUMERA"),
    SymPos("P00_NUMERA"),
    Speed(1.5),
    CH("PARTNER")
  })
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 1611965938, PARTNER_1 = 2031064243})
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(1), true)
  CH("PARTNER"):ResetManpu()
  TASK:Sleep(TimeSec(0.5))
end
function main04_m04isshonitoukou03_end()
end
function main04_m04isshonitoukou04_init()
end
function main04_m04isshonitoukou04_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SOUND:PlaySe(SymSnd("SE_EVT_SCHOOL_CHIME"))
  WINDOW:SysMsg(-23623556)
  SOUND:WaitSe(SymSnd("SE_EVT_SCHOOL_CHIME"))
  WINDOW:ForceCloseMessage()
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), -410207939)
  WINDOW:Talk(SymAct("KAMONEGI"), -1896717039)
  subEveCloseMsg()
  WINDOW:Talk(SymWord(2093398760), -1746316208)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_GAKKOU_02"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(72, 16, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), -1128003693)
  subEveCloseMsg()
  local taskYanChobo00 = function()
    CH("YANCHAMU"):DirTo(CH("CHOBOMAKI"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("CHOBOMAKI"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
    CH("CHOBOMAKI"):WaitRotate()
    function TaskL.Loop()
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("YANCHAMU"):SetManpu("MP_SPREE_LP")
      CH("YANCHAMU"):SetMotion(SymMot("WAIT00"), LOOP.ON)
      TASK:Sleep(TimeSec(0.2))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("CHOBOMAKI"):SetManpu("MP_LAUGH_LP")
      CH("CHOBOMAKI"):SetMotion(SymMot("WALK"), LOOP.ON)
      CH("CHOBOMAKI"):SetMotionRaito(Raito(2))
      TASK:Regist(subEveDoubleJump, {
        CH("CHOBOMAKI")
      })
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("YANCHAMU"):ResetManpu()
      TASK:Regist(subEveDoubleJump, {
        CH("YANCHAMU")
      })
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("CHOBOMAKI"):ResetManpu()
    end
    function TaskL.Finish()
      CH("CHOBOMAKI"):ResetManpu()
      CH("YANCHAMU"):ResetManpu()
      CH("CHOBOMAKI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
      CH("YANCHAMU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
      CH("CHOBOMAKI"):SetMotionRaito(Raito(1))
      CH("YANCHAMU"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
      TASK:Sleep(TimeSec(0.1))
      CH("CHOBOMAKI"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
      return
    end
  end
  TASK:Regist(Group("grpYanchobo"), taskYanChobo00)
  SOUND:PlaySe(SymSnd("SE_EVT_PARTY_02"), Volume(256))
  local taskShikiNume00 = function()
    TASK:Sleep(TimeSec(0.1))
    CH("SHIKIJIKA_SPRING"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("NUMERA"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
    CH("NUMERA"):WaitRotate()
    function TaskL.Loop()
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("SHIKIJIKA_SPRING"):SetManpu("MP_SPREE_LP")
      CH("SHIKIJIKA_SPRING"):SetMotion(SymMot("WAIT00"), LOOP.ON)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("NUMERA"):SetManpu("MP_LAUGH_LP")
      CH("NUMERA"):SetMotion(SymMot("WALK"), LOOP.ON)
      TASK:Regist(subEveDoubleJump, {
        CH("NUMERA")
      })
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Regist(subEveDoubleJump, {
        CH("NUMERA")
      })
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("SHIKIJIKA_SPRING"):ResetManpu()
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Regist(subEveDoubleJump, {
        CH("NUMERA")
      })
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("NUMERA"):ResetManpu()
    end
    function TaskL.Finish()
      CH("SHIKIJIKA_SPRING"):ResetManpu()
      CH("NUMERA"):ResetManpu()
      CH("SHIKIJIKA_SPRING"):SetMotion(SymMot("WAIT02"), LOOP.ON)
      CH("NUMERA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
      CH("SHIKIJIKA_SPRING"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
      TASK:Sleep(TimeSec(0.2))
      CH("NUMERA"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
      return
    end
  end
  TASK:Regist(Group("grpShikiNume"), taskShikiNume00)
  local taskPartner00 = function()
    CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
    CH("PARTNER"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
    CH("PARTNER"):WaitPlayMotion()
    CH("PARTNER"):SetMotion(SymMot("WAIT00"), LOOP.ON)
    CH("PARTNER"):SetMotionRaito(Raito(2))
    CH("PARTNER"):SetManpu("MP_SPREE_LP")
    function TaskL.Loop()
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("PARTNER"):ResetManpu()
      CH("PARTNER"):DirTo(RotateTarget(-90), Speed(350), ROT_TYPE.NEAR)
      CH("PARTNER"):WaitRotate()
      subEveLookAround(CH("PARTNER"), Speed(600))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("PARTNER"):DirTo(RotateTarget(-135), Speed(350), ROT_TYPE.NEAR)
      CH("PARTNER"):WaitRotate()
      TASK:Regist(subEveDoubleJump, {
        CH("PARTNER")
      })
      CH("PARTNER"):SetMotion(SymMot("WAIT00"), LOOP.ON)
      CH("PARTNER"):SetManpu("MP_SPREE_LP")
      CH("PARTNER"):SetMotionRaito(Raito(2))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
    end
    function TaskL.Finish()
      CH("PARTNER"):SetMotionRaito(Raito(1))
      CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
      CH("PARTNER"):ResetManpu()
      CH("PARTNER"):ResetFacialMotion()
      SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
      CH("PARTNER"):SetManpu("MP_NOTICE_L")
      CH("PARTNER"):WaitManpu()
      return
    end
  end
  TASK:Regist(Group("grpPartner"), taskPartner00)
  WINDOW:Talk(SymWord(2093398760), -1512098094)
  CH("HERO"):DirTo(RotateTarget(-90), Speed(350), ROT_TYPE.NEAR)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(0.3))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("HERO"):SetManpu("MP_QUESTION")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFaceF(172, 8, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(-358703083)
  WINDOW:CloseMessage()
  TASK:ExitNotifyTasks(Group("grpPartner"))
  TASK:WaitTask(Group("grpPartner"))
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -209350316, PARTNER_1 = -660028777})
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:SwitchTalk({PARTNER_0 = -1045171242, PARTNER_1 = 1177284377})
  WINDOW:CloseMessage()
  CAMERA:MoveFollow(SymCam("CAMERA_03"), Speed(3, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("KAMONEGI"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("KAMONEGI"):WaitRotate()
  CH("KAMONEGI"):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_ANGRY_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("KAMONEGI")
  })
  WINDOW:DrawFace(20, 20, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), 1597038168)
  WINDOW:CloseMessage()
  SOUND:FadeOutSe(SymSnd("SE_EVT_PARTY_02"), TimeSec(1))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("PARTNER"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  TASK:ExitNotifyTasks(Group("grpShikiNume"))
  TASK:ExitNotifyTasks(Group("grpYanchobo"))
  TASK:WaitTask(Group("grpShikiNume"))
  TASK:WaitTask(Group("grpYanchobo"))
  CH("KAMONEGI"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  CH("KAMONEGI"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(72, 16, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), 321215912)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_01_5"), Speed(5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("KAMONEGI"):DirTo(SymPos("P00_EXIT"), Speed(350), ROT_TYPE.NEAR)
  CAMERA:WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), 171863273)
  CH("KAMONEGI"):WaitRotate()
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_01"), Speed(5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("KAMONEGI"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  CH("KAMONEGI"):WaitRotate()
  CAMERA:WaitMove()
  WINDOW:DrawFace(72, 16, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), 554909482)
  subEveCloseMsg()
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("KAMONEGI"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  CH("YANCHAMU"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("YANCHAMU")
  })
  WINDOW:DrawFace(20, 88, SymAct("YANCHAMU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("YANCHAMU"), 940052075)
  CH("YANCHAMU"):ResetManpu()
  subEveCloseMsg()
  WINDOW:DrawFace(20, 20, SymAct("CHOBOMAKI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("CHOBOMAKI"), 2001311916)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("HERO"):SetManpu("MP_QUESTION")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFaceF(172, 8, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(1850911213)
  subEveCloseMsg()
  local taskLookAt05 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("KAMONEGI"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("YANCHAMU"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("NUMERA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("SHIKIJIKA_SPRING"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt05)
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1166015022, PARTNER_1 = 1550109551})
  WINDOW:SwitchTalk({PARTNER_0 = -604186720, PARTNER_1 = -1024989471})
  WINDOW:SwitchTalk({PARTNER_0 = -1416021299, PARTNER_1 = -1300100212})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  local taskLookAt02 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
    CH("SHIKIJIKA_SPRING"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("YANCHAMU"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
    CH("NUMERA"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt02)
  CH("KAMONEGI"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  CH("KAMONEGI"):WaitRotate()
  WINDOW:DrawFace(72, 16, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), -1716561841)
  WINDOW:Talk(SymAct("KAMONEGI"), -2135660274)
  WINDOW:Talk(SymAct("KAMONEGI"), -805961783)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_SHOCK_R")
  CH("SHIKIJIKA_SPRING"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -688992632)
  WINDOW:CloseMessage()
  local taskLookAt03 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
    CH("NUMERA"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt03)
  CH("YANCHAMU"):DirTo(CH("CHOBOMAKI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("CHOBOMAKI"):SetManpu("MP_LAUGH_LP")
  CH("CHOBOMAKI"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
  CH("YANCHAMU"):WaitRotate()
  CH("YANCHAMU"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("YANCHAMU")
  })
  WINDOW:DrawFace(324, 20, SymAct("YANCHAMU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("YANCHAMU"), -37511861)
  WINDOW:CloseMessage()
  CH("YANCHAMU"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  CH("YANCHAMU"):WaitRotate()
  CH("CHOBOMAKI"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 20, SymAct("YANCHAMU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("YANCHAMU"), -455562230)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_FLY_SWEAT")
  CH("SHIKIJIKA_SPRING"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1665183941)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("NYASUPAA"):WalkTo(SymPos("P00_NYASUPAA"), Speed(1.5))
  CH("NYASUPAA"):WaitMove()
  local taskLookAt04 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("KAMONEGI"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
    CH("CHOBOMAKI"):ResetManpu()
    CH("CHOBOMAKI"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
    CH("NUMERA"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("SHIKIJIKA_SPRING"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
    CH("YANCHAMU"):ResetManpu()
    CH("YANCHAMU"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt04)
  WINDOW:DrawFace(324, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), 2052817284)
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), -1188260573)
  WINDOW:Talk(SymAct("KAMONEGI"), -1606966174)
  WINDOW:Talk(SymAct("KAMONEGI"), -1961166943)
  WINDOW:CloseMessage()
  subEveNod(CH("NYASUPAA"))
  WINDOW:DrawFace(324, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -1845377312)
  WINDOW:CloseMessage()
  CH("NYASUPAA"):WalkTo(SymPos("P01_NYASUPAA"), Speed(1.5), LINK_DIR.OFF)
  CH("NYASUPAA"):WaitMove()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("PARTNER"):WalkTo(SymPos("P00_PARTNER"), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("NUMERA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = -582987737, PARTNER_1 = -1000644250})
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SAD)
  CH("PARTNER"):SetNeckRot(RotateTarget(0), RotateTarget(-20), RotateTarget(0), TimeSec(0.3))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  CH("HERO"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = -277466459, PARTNER_1 = -160627740})
  WINDOW:KeyWait()
  CH("PARTNER"):ResetFacialMotion()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  CH("PARTNER"):ResetNeckRot(TimeSec(0.2))
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1911889707, PARTNER_1 = 1760439914})
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  CH("NUMERA"):SetManpu("MP_SWEAT_R")
  CH("NUMERA"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("NUMERA"), 26276422)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("KAMONEGI"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  CH("KAMONEGI"):WaitRotate()
  CH("KAMONEGI"):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(72, 16, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), 411812615)
  CH("KAMONEGI"):ResetManpu()
  CH("HERO"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  CH("CHOBOMAKI"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  CH("NUMERA"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("SHIKIJIKA_SPRING"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  CH("YANCHAMU"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:CloseMessage()
  WINDOW:DrawFace(72, 16, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), 866554052)
  WINDOW:Talk(SymAct("KAMONEGI"), 717070725)
  WINDOW:Talk(SymAct("KAMONEGI"), 1711028034)
  WINDOW:Talk(SymAct("KAMONEGI"), 2095515139)
  WINDOW:Talk(SymAct("KAMONEGI"), 1472878016)
  WINDOW:Talk(SymAct("KAMONEGI"), 1322345601)
  WINDOW:Talk(SymAct("KAMONEGI"), -917931954)
  WINDOW:CloseMessage()
  local taskYanchamu00 = function()
    CH("YANCHAMU"):WalkTo(SymPos("P00_YANCHAMU"), Speed(1.5))
    CH("YANCHAMU"):WaitMove()
    TASK:Sleep(TimeSec(0.5))
    CH("YANCHAMU"):SetMotion(SymMot("SPEAK"), LOOP.OFF)
    CH("YANCHAMU"):WaitPlayMotion()
    CH("YANCHAMU"):SetMotion(SymMot("WAIT00"), LOOP.ON)
    CH("KAMONEGI"):SetMotion(SymMot("SPEAK"), LOOP.OFF)
    CH("KAMONEGI"):WaitPlayMotion()
    CH("KAMONEGI"):SetMotion(SymMot("WAIT00"), LOOP.ON)
    TASK:Sleep(TimeSec(0.5))
  end
  TASK:Regist(taskYanchamu00)
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  local taskPartner10 = function()
    CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):WaitRotate()
    TASK:Sleep(TimeSec(0.3))
    CH("PARTNER"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):WaitRotate()
    TASK:Sleep(TimeSec(0.3))
    CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):WaitRotate()
  end
  TASK:Regist(taskPartner10)
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("NUMERA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -799913713, PARTNER_1 = 1509155344})
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
  TASK:Sleep(TimeSec(0.3))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("PARTNER"):WalkTo(SymPos("P01_PARTNER"), Speed(1.5))
  CH("HERO"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("NUMERA"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.NEAR)
  CH("KAMONEGI"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Regist(subEveMoveDir, {
    CH("YANCHAMU"),
    SymPos("P01_YANCHAMU"),
    Speed(1.5),
    CH("KAMONEGI")
  })
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitMove()
  GROUND:MoveItemBagToBox()
  WINDOW:SysMsg(1089000273)
  WINDOW:SysMsg(1808105618)
  WINDOW:CloseMessage()
  SOUND:PlayMe(SymSnd("ME_ITEM_IMPORTANT"), Volume(256))
  TASK:Sleep(TimeSec(1.8))
  OverFlow_AddOverflowCheckItem(101, 3, false)
  OverFlow_AddOverflowCheckItem(113, 3, false)
  OverFlow_AddOverflowCheckItem(143, 1, false)
  OverFlow_AddOverflowCheckItem(115, 3, false)
  OverFlow_AddOverflowCheckItem(289, 5, false)
  OverFlow_AddOverflowCheckItem(299, 5, false)
  OverFlow_AddOverflowCheckItem(244, 2, false)
  OverFlow_AddOverflowCheckItem(529, 1, false)
  OverFlow_AddOverflowCheckItem(249, 1, false)
  WINDOW:CloseMessage()
  GROUND:SortAndReduceBagItem()
  CH("PARTNER"):WalkTo(SymPos("P00_PARTNER"), Speed(1.5))
  TASK:Sleep(TimeSec(0.5))
  CH("KAMONEGI"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):DirTo(CH("KAMONEGI"), Speed(350), ROT_TYPE.RIGHT)
  CH("PARTNER"):WaitRotate()
  CH("KAMONEGI"):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(72, 16, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), 1927197139)
  CH("KAMONEGI"):ResetManpu()
  WINDOW:CloseMessage()
  CH("PARTNER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HERO"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("YANCHAMU"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("CHOBOMAKI"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("SHIKIJIKA_SPRING"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("NUMERA"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("NYASUPAA"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("HERO"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_SPREE_LP")
  CH("NUMERA"):SetManpu("MP_SPREE_LP")
  CH("CHOBOMAKI"):SetManpu("MP_SPREE_LP")
  TASK:Sleep(TimeSec(1.3))
  CH("PARTNER"):ResetManpu()
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("SHIKIJIKA_SPRING"):ResetManpu()
  CH("SHIKIJIKA_SPRING"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("YANCHAMU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.1))
  CH("NUMERA"):ResetManpu()
  CH("NUMERA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("CHOBOMAKI"):ResetManpu()
  CH("CHOBOMAKI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):ResetManpu()
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("NYASUPAA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  CH("YANCHAMU"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("CHOBOMAKI"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
  CH("YANCHAMU"):WaitRotate()
  WINDOW:DrawFace(324, 20, SymAct("YANCHAMU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("YANCHAMU"), 1033840404)
  subEveCloseMsg()
  TASK:Regist(subEveDoubleJump, {
    CH("CHOBOMAKI")
  })
  WINDOW:DrawFace(72, 16, SymAct("CHOBOMAKI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("CHOBOMAKI"), 612636245)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("YANCHAMU"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("SHIKIJIKA_SPRING"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("CHOBOMAKI"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("YANCHAMU"):WaitRotate()
  local taskLookAt06 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("KAMONEGI"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
    CH("NUMERA"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("NYASUPAA"):DirTo(CH("YANCHAMU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt06)
  WINDOW:DrawFace(72, 16, SymAct("YANCHAMU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("YANCHAMU"), 262751638)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("HERO"):SetMotion(SymMot("WALK"), LOOP.ON)
  CH("HERO"):DirLockToChara(CH("YANCHAMU"))
  CH("PARTNER"):SetMotion(SymMot("WALK"), LOOP.ON)
  CH("PARTNER"):DirLockToChara(CH("YANCHAMU"))
  CH("NUMERA"):SetMotion(SymMot("WALK"), LOOP.ON)
  CH("NUMERA"):DirLockToChara(CH("YANCHAMU"))
  CH("NYASUPAA"):SetMotion(SymMot("WALK"), LOOP.ON)
  CH("NYASUPAA"):DirLockToChara(CH("YANCHAMU"))
  CH("YANCHAMU"):WalkTo(SplinePath(SymPos("P02_YANCHAMU"), SymPos("P03_YANCHAMU")), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  CH("CHOBOMAKI"):WalkTo(SplinePath(SymPos("P02_CHOBOMAKI"), SymPos("P03_CHOBOMAKI")), Speed(1.5))
  TASK:Sleep(TimeSec(0.4))
  CH("SHIKIJIKA_SPRING"):WalkTo(SplinePath(SymPos("P02_SHIKIJIKA"), SymPos("P03_SHIKIJIKA")), Speed(1.5))
  CH("KAMONEGI"):DirTo(SymPos("P03_YANCHAMU"), Speed(120), ROT_TYPE.LEFT)
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("NUMERA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("NYASUPAA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("NYASUPAA"):SetMotionRaito(Raito(1))
  TASK:Sleep(TimeSec(3))
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("NUMERA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 380794071, PARTNER_1 = -1859491816})
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1))
  subEveNod(CH("HERO"))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main04_m04isshonitoukou04_end()
end
function groundEnd()
end
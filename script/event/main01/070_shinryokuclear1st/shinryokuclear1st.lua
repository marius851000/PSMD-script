dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main01_shinryokuclear1st01_init()
end
function main01_shinryokuclear1st01_start()
  TASK:Sleep(TimeSec(1))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(1))
  CH("PIKACHUU_H"):SetVisible(false)
  CH("POKABU_H"):SetVisible(false)
  CH("MIJUMARU_H"):SetVisible(false)
  CH("TSUTAAJA_H"):SetVisible(false)
  CH("FUSHIGIDANE_H"):SetVisible(false)
  CH("HITOKAGE_H"):SetVisible(false)
  CH("ZENIGAME_H"):SetVisible(false)
  CH("CHIKORIITA_H"):SetVisible(false)
  CH("HINOARASHI_H"):SetVisible(false)
  CH("WANINOKO_H"):SetVisible(false)
  CH("KIMORI_H"):SetVisible(false)
  CH("ACHAMO_H"):SetVisible(false)
  CH("MIZUGOROU_H"):SetVisible(false)
  CH("NAETORU_H"):SetVisible(false)
  CH("HIKOZARU_H"):SetVisible(false)
  CH("POTCHAMA_H"):SetVisible(false)
  CH("RIORU_H"):SetVisible(false)
  CH("HARIMARON_H"):SetVisible(false)
  CH("FOKKO_H"):SetVisible(false)
  CH("KEROMATSU_H"):SetVisible(false)
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("KONOHANA"):SetManpu("MP_FLY_SWEAT_LP")
  CH("KONOHANA"):RunTo(SplinePath(SymPos("P00_KONOHANA"), SymPos("P01_KONOHANA")), Speed(3))
  CH("HERO"):RunTo(SplinePath(SymPos("P00_HERO"), SymPos("P01_HERO")), Speed(3))
  SOUND:FadeInEnv(SymSnd("SE_ENV_BREEZE_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  TASK:Sleep(TimeSec(0.5))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("KONOHANA"):WaitMove()
  CH("KONOHANA"):ResetManpu()
  CH("KONOHANA"):SetEyeMotion(EYE_MOTION.PAIN)
  CH("KONOHANA"):SetMotion(SymMot("EV001_TIRED"), LOOP.ON)
  CH("HERO"):WaitMove()
  CH("HERO"):SetMotion(SymMot("EV013_TIRED"), LOOP.ON)
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.PAIN)
  WINDOW:Monologue(-547501020)
  subEveCloseMsg()
  WINDOW:DrawFaceF(324, 88, SymAct("KONOHANA"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("KONOHANA"), -968426139)
  WINDOW:Talk(SymAct("KONOHANA"), -311710042)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CAMERA:MoveFollow2(SymCam("CAMERA_02_5"), Speed(10, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  local taskKonohana01 = function()
    CH("KONOHANA"):DirTo(RotateTarget(20), Speed(350), ROT_TYPE.NEAR)
    CH("KONOHANA"):WaitRotate()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
    CH("KONOHANA"):SetManpu("MP_FLY_SWEAT")
    CH("KONOHANA"):SetMotion(SymMot("EV001_DOWN00"), LOOP.OFF)
    CH("KONOHANA"):WaitPlayMotion()
    CH("KONOHANA"):SetMotion(SymMot("EV001_DOWN01"), LOOP.ON)
  end
  TASK:Regist(taskKonohana01)
  WINDOW:Talk(SymAct("KONOHANA"), -193945625)
  WINDOW:Talk(SymAct("KONOHANA"), -1154414304)
  WINDOW:Talk(SymAct("KONOHANA"), -1574291359)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  SOUND:FadeOutEnv(TimeSec(0.5))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CALM_01"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("KONOHANA"):SetEyeMotion(EYE_MOTION.NORMAL)
  CH("KONOHANA"):SetMotion(SymMot("EV001_DOWN02"), LOOP.OFF)
  CH("KONOHANA"):WaitPlayMotion()
  CH("KONOHANA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("HERO"):SetManpu("MP_NOTICE_R")
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.ANGRY)
  WINDOW:Talk(SymAct("KONOHANA"), -1996002398)
  WINDOW:KeyWait()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_ANGRY_02"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_ANGRY_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("KONOHANA")
  })
  WINDOW:Talk(SymAct("KONOHANA"), -1877189917)
  WINDOW:KeyWait()
  CH("KONOHANA"):ResetManpu()
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 394544684)
  WINDOW:CloseMessage()
  CH("KONOHANA"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 245331821)
  WINDOW:CloseMessage()
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 1159328521)
  WINDOW:CloseMessage()
  CH("HERO"):SetDir(RotateTarget(90))
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  CH("KONOHANA"):DirTo(SymPos("P02_KONOHANA"), Speed(500), ROT_TYPE.LEFT)
  CH("KONOHANA"):WaitRotate()
  CH("KONOHANA"):WalkTo(SymPos("P02_KONOHANA"), Speed(1.2))
  CH("KONOHANA"):WaitMove()
  TASK:Sleep(TimeSec(0.5))
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.RIGHT)
  CH("KONOHANA"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 1543684680)
  WINDOW:Talk(SymAct("KONOHANA"), 1999606155)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03_5"))
  CAMERA:SetTgt(SymCam("CAMERA_03_5"))
  subEveNod(CH("HERO"))
  TASK:Sleep(TimeSec(0.3))
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_FLY_SWEAT")
  CH("KONOHANA"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("KONOHANA"), 1848942794)
  WINDOW:Talk(SymAct("KONOHANA"), 561329677)
  WINDOW:Talk(SymAct("KONOHANA"), 946734924)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03_5"))
  CAMERA:SetTgt(SymCam("CAMERA_03_5"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(323179663)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("KONOHANA"), 173565390)
  WINDOW:Talk(SymAct("KONOHANA"), -1916765951)
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1797568448)
  WINDOW:Talk(SymAct("KONOHANA"), 1470913767)
  WINDOW:Talk(SymAct("KONOHANA"), 1320644006)
  WINDOW:CloseMessage()
  CH("KONOHANA"):DirTo(SymPos("P03_KONOHANA"), Speed(500), ROT_TYPE.LEFT)
  CH("KONOHANA"):WaitRotate()
  CH("KONOHANA"):WalkTo(SymPos("P03_KONOHANA"), Speed(1.2))
  CH("KONOHANA"):WaitMove()
  TASK:Sleep(TimeSec(0.5))
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.RIGHT)
  CH("KONOHANA"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 1704607333)
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(3))
  SOUND:FadeInEnv(SymSnd("SE_ENV_BREEZE_LP"), TimeSec(1), Volume(256))
  CH("KONOHANA"):DirTo(SymPos("P04_5_KONOHANA"), Speed(500), ROT_TYPE.LEFT)
  CH("KONOHANA"):WaitRotate()
  CH("KONOHANA"):WalkTo(SymPos("P04_5_KONOHANA"), Speed(1.2))
  TASK:Sleep(TimeSec(2.5))
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  CH("KONOHANA"):SetPosition(SymPos("P03_5_KONOHANA"))
  CH("KONOHANA"):WalkTo(SymPos("P04_KONOHANA"), Speed(1.2))
  CH("KONOHANA"):WaitMove()
  TASK:Sleep(TimeSec(1))
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(500), ROT_TYPE.RIGHT)
  CH("KONOHANA"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_FLY_SWEAT")
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("KONOHANA"), 2088832804)
  WINDOW:CloseMessage()
  CH("HERO"):SetVisible(false)
  local pokemonIndexHero = SymAct("HERO"):GetIndex()
  if pokemonIndexHero == 30 then
    CH("PIKACHUU_H"):SetVisible(true)
    CH("PIKACHUU_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("PIKACHUU_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 595 then
    CH("POKABU_H"):SetVisible(true)
    CH("POKABU_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("POKABU_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 598 then
    CH("MIJUMARU_H"):SetVisible(true)
    CH("MIJUMARU_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("MIJUMARU_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 592 then
    CH("TSUTAAJA_H"):SetVisible(true)
    CH("TSUTAAJA_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 1 then
    CH("FUSHIGIDANE_H"):SetVisible(true)
    CH("FUSHIGIDANE_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("FUSHIGIDANE_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 5 then
    CH("HITOKAGE_H"):SetVisible(true)
    CH("HITOKAGE_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("HITOKAGE_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 10 then
    CH("ZENIGAME_H"):SetVisible(true)
    CH("ZENIGAME_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("ZENIGAME_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 197 then
    CH("CHIKORIITA_H"):SetVisible(true)
    CH("CHIKORIITA_H"):SetEyeMotion(EYE_MOTION.SAD)
  elseif pokemonIndexHero == 200 then
    CH("HINOARASHI_H"):SetVisible(true)
    CH("HINOARASHI_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("HINOARASHI_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 203 then
    CH("WANINOKO_H"):SetVisible(true)
    CH("WANINOKO_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("WANINOKO_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 322 then
    CH("KIMORI_H"):SetVisible(true)
    CH("KIMORI_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 325 then
    CH("ACHAMO_H"):SetVisible(true)
    CH("ACHAMO_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("ACHAMO_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 329 then
    CH("MIZUGOROU_H"):SetVisible(true)
    CH("MIZUGOROU_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("MIZUGOROU_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 479 then
    CH("NAETORU_H"):SetVisible(true)
    CH("NAETORU_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 482 then
    CH("HIKOZARU_H"):SetVisible(true)
    CH("HIKOZARU_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("HIKOZARU_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 485 then
    CH("POTCHAMA_H"):SetVisible(true)
    CH("POTCHAMA_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("POTCHAMA_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 537 then
    CH("RIORU_H"):SetVisible(true)
    CH("RIORU_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 766 then
    CH("HARIMARON_H"):SetVisible(true)
    CH("HARIMARON_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("HARIMARON_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 769 then
    CH("FOKKO_H"):SetVisible(true)
    CH("FOKKO_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("FOKKO_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  elseif pokemonIndexHero == 772 then
    CH("KEROMATSU_H"):SetVisible(true)
    CH("KEROMATSU_H"):SetEyeMotion(EYE_MOTION.SAD)
    CH("KEROMATSU_H"):SetMouthMotion(MOUTH_MOTION.ANGRY)
  end
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CAMERA:MoveFollow2(SymCam("CAMERA_05_5"), Speed(0.2, ACCEL_TYPE.NONE, DECEL_TYPE.NONE))
  TASK:Sleep(TimeSec(4))
  CH("HERO"):SetVisible(true)
  local pokemonIndexHero = SymAct("HERO"):GetIndex()
  if pokemonIndexHero == 30 then
    CH("PIKACHUU_H"):SetVisible(false)
  elseif pokemonIndexHero == 595 then
    CH("POKABU_H"):SetVisible(false)
  elseif pokemonIndexHero == 598 then
    CH("MIJUMARU_H"):SetVisible(false)
  elseif pokemonIndexHero == 592 then
    CH("TSUTAAJA_H"):SetVisible(false)
  elseif pokemonIndexHero == 1 then
    CH("FUSHIGIDANE_H"):SetVisible(false)
  elseif pokemonIndexHero == 5 then
    CH("HITOKAGE_H"):SetVisible(false)
  elseif pokemonIndexHero == 10 then
    CH("ZENIGAME_H"):SetVisible(false)
  elseif pokemonIndexHero == 197 then
    CH("CHIKORIITA_H"):SetVisible(false)
  elseif pokemonIndexHero == 200 then
    CH("HINOARASHI_H"):SetVisible(false)
  elseif pokemonIndexHero == 203 then
    CH("WANINOKO_H"):SetVisible(false)
  elseif pokemonIndexHero == 322 then
    CH("KIMORI_H"):SetVisible(false)
  elseif pokemonIndexHero == 325 then
    CH("ACHAMO_H"):SetVisible(false)
  elseif pokemonIndexHero == 329 then
    CH("MIZUGOROU_H"):SetVisible(false)
  elseif pokemonIndexHero == 479 then
    CH("NAETORU_H"):SetVisible(false)
  elseif pokemonIndexHero == 482 then
    CH("HIKOZARU_H"):SetVisible(false)
  elseif pokemonIndexHero == 485 then
    CH("POTCHAMA_H"):SetVisible(false)
  elseif pokemonIndexHero == 537 then
    CH("RIORU_H"):SetVisible(false)
  elseif pokemonIndexHero == 766 then
    CH("HARIMARON_H"):SetVisible(false)
  elseif pokemonIndexHero == 769 then
    CH("FOKKO_H"):SetVisible(false)
  elseif pokemonIndexHero == 772 then
    CH("KEROMATSU_H"):SetVisible(false)
  end
  SOUND:FadeOutEnv(TimeSec(0.5))
  SOUND:PlayBgm(SymSnd("BGM_EVE_ZANNEN_03"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  CH("KONOHANA"):WalkTo(SymPos("P01_KONOHANA"), Speed(3))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_FLY_SWEAT_LP")
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("KONOHANA"), 868260323)
  CH("KONOHANA"):WaitMove()
  CH("KONOHANA"):ResetManpu()
  WINDOW:KeyWait()
  CH("KONOHANA"):SetManpu("MP_UPSET_LP")
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("KONOHANA"), 719038626)
  WINDOW:KeyWait()
  CH("KONOHANA"):ResetManpu()
  WINDOW:Talk(SymAct("KONOHANA"), 32963425)
  WINDOW:CloseMessage()
  CH("HERO"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 418236960)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(-1619667217)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-2039552082, 1)
  WINDOW:SelectChain(-284148862, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 0 then
    CAMERA:SetEye(SymCam("CAMERA_07"))
    CAMERA:SetTgt(SymCam("CAMERA_07"))
    CAMERA:MoveFollow2(SymCam("CAMERA_07_5"), Speed(15, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    CAMERA:SetShake(Vector2(0.02, 0.02), TimeSec(1, TIME_TYPE.FRAME))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
    CH("KONOHANA"):SetManpu("MP_SHOCK_L")
    TASK:Regist(subEveJumpSurprise, {
      CH("KONOHANA")
    })
    WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
    WINDOW:Talk(SymAct("KONOHANA"), -167048509)
    CAMERA:SetShake(Vector2(0, 0), TimeSec(0))
    WINDOW:Talk(SymAct("KONOHANA"), -584689408)
    WINDOW:CloseMessage()
    CAMERA:SetEye(SymCam("CAMERA_01"))
    CAMERA:SetTgt(SymCam("CAMERA_01"))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
    CH("KONOHANA"):SetManpu("MP_EXCLAMATION")
    CH("KONOHANA"):WaitManpu()
    WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
    WINDOW:Talk(SymAct("KONOHANA"), -1002608575)
    WINDOW:CloseMessage()
    CH("KONOHANA"):DirTo(RotateTarget(-135), Speed(350), ROT_TYPE.NEAR)
    CH("KONOHANA"):WaitRotate()
    CH("KONOHANA"):SetNeckRot(RotateTarget(0), RotateTarget(-20), RotateTarget(0), TimeSec(0.35))
    CH("KONOHANA"):WaitNeckRot()
    WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.PAIN)
    WINDOW:Talk(SymAct("KONOHANA"), -1954742650)
    WINDOW:Talk(SymAct("KONOHANA"), -1838690361)
    WINDOW:Talk(SymAct("KONOHANA"), -1186292732)
    WINDOW:CloseMessage()
    CH("KONOHANA"):ResetNeckRot(TimeSec(0.2))
    CH("KONOHANA"):WaitNeckRot()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
    CH("KONOHANA"):SetManpu("MP_FLY_SWEAT")
    CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("KONOHANA"):WaitRotate()
    WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SAD)
    WINDOW:Talk(SymAct("KONOHANA"), -1605259963)
    WINDOW:CloseMessage()
    CAMERA:SetEye(SymCam("CAMERA_08"))
    CAMERA:SetTgt(SymCam("CAMERA_08"))
    CH("KONOHANA"):SetMotion(SymMot("EV001_DOGEZA00"), LOOP.OFF)
    CH("KONOHANA"):WaitPlayMotion()
    CH("KONOHANA"):SetMotion(SymMot("EV001_DOGEZA01"), LOOP.ON)
    WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.PAIN)
    WINDOW:Talk(SymAct("KONOHANA"), 667529610)
    WINDOW:Talk(SymAct("KONOHANA"), 1053982923)
    WINDOW:CloseMessage()
    while true do
      WINDOW:SysMsg(1925645115)
      WINDOW:SelectStart()
      WINDOW:SelectChain(1809592954, 1)
      WINDOW:SelectChain(1089561017, 0)
      WINDOW:DefaultCursor(0)
      local id2 = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
      if id2 == 0 then
        SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
        CH("KONOHANA"):SetManpu("MP_FLY_SWEAT")
        WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.PAIN)
        WINDOW:Talk(SymAct("KONOHANA"), 1508528376)
        WINDOW:Talk(SymAct("KONOHANA"), 380356159)
        WINDOW:CloseMessage()
      else
        CAMERA:SetEye(SymCam("CAMERA_01"))
        CAMERA:SetTgt(SymCam("CAMERA_01"))
        CH("KONOHANA"):SetMotion(SymMot("EV001_DOGEZA02"), LOOP.OFF)
        CH("KONOHANA"):WaitPlayMotion()
        CH("KONOHANA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
        TASK:Sleep(TimeSec(0.3))
        break
      end
    end
  end
  CH("KONOHANA"):SetManpu("MP_LAUGH_LP")
  CH("KONOHANA"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KONOHANA"), 263255934)
  WINDOW:CloseMessage()
  CH("KONOHANA"):ResetManpu()
  CH("KONOHANA"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_09"))
  CAMERA:SetTgt(SymCam("CAMERA_09"))
  CH("KONOHANA"):DirTo(RotateTarget(90), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 614311101)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 1032230396)
  WINDOW:Talk(SymAct("KONOHANA"), -1172403917)
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_09"))
  CAMERA:SetTgt(SymCam("CAMERA_09"))
  CH("KONOHANA"):WalkTo(SymPos("P00_EXIT"), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):WalkTo(SymPos("P00_EXIT"), Speed(1.5))
  TASK:Sleep(TimeSec(2))
  SOUND:FadeOutBgm(TimeSec(3.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  subEveFadeAfterTime()
end
function main01_shinryokuclear1st01_end()
end
function main01_shinryokuclear1st02_init()
end
function main01_shinryokuclear1st02_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(1))
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), -1559906190)
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), -897883042)
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), -748661473)
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), -129169700)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("KONOHANA"):RunTo(SplinePath(SymPos("P00_KONOHANA"), SymPos("P01_KONOHANA"), SymPos("P02_KONOHANA")), Speed(2.5))
  CH("HERO"):RunTo(SplinePath(SymPos("P00_HERO"), SymPos("P01_HERO"), SymPos("P02_HERO")), Speed(2.5))
  SOUND:FadeInEnv(SymSnd("SE_ENV_BREEZE_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("KONOHANA"):WaitMove()
  CH("KONOHANA"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_EXCLAMATION")
  CH("KONOHANA"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -514443363)
  WINDOW:CloseMessage()
  CH("KONOHANA"):WaitMove()
  CH("HERO"):WalkTo(SymPos("P03_HERO"), Speed(1))
  CH("HERO"):WaitMove()
  CH("HERO"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1374183078)
  SOUND:FadeOutEnv(TimeSec(2))
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main01_shinryokuclear1st02_end()
end
function main01_shinryokuclear1st03_init()
end
function main01_shinryokuclear1st03_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(1))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:MoveFollow(SymCam("CAMERA_01"), Speed(1, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SOUND:PlayBgm(SymSnd("BGM_EVE_SCENERY"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CAMERA:WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1223913445)
  WINDOW:Talk(SymAct("KONOHANA"), -1675508776)
  WINDOW:Talk(SymAct("KONOHANA"), -2059734375)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main01_shinryokuclear1st03_end()
end
function main01_shinryokuclear1st04_init()
end
function main01_shinryokuclear1st04_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(1))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_SCENERY"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  CH("HERO"):DirTo(CH("KONOHANA"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 44232278)
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
  CH("KONOHANA"):RunTo(SplinePath(SymPos("P00_KONOHANA"), SymPos("P00_5_KONOHANA"), SymPos("P01_KONOHANA")), Speed(2.5))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):RunTo(SplinePath(SymPos("P00_HERO"), SymPos("P00_5_HERO"), SymPos("P01_HERO")), Speed(2.5))
  CAMERA:MoveFollow(SymCam("CAMERA_01"), Speed(0.7, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  TASK:Sleep(TimeSec(1.5))
  local taskKageOff = function()
    TASK:Sleep(TimeSec(1))
    CH("KONOHANA"):SetShadow(false)
    TASK:Sleep(TimeSec(0.8))
    CH("HERO"):SetShadow(false)
  end
  TASK:Regist(taskKageOff)
  local taskGedan01 = function()
    CH("HERO"):WaitMove()
    TASK:Sleep(TimeSec(2))
    CH("KONOHANA"):SetPosition(SymPos("P02_KONOHANA"))
    CH("HERO"):SetPosition(SymPos("P02_HERO"))
    CH("KONOHANA"):RunTo(SplinePath(SymPos("P03_KONOHANA"), SymPos("P04_KONOHANA"), SymPos("P05_KONOHANA")), Speed(2.5))
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):RunTo(SplinePath(SymPos("P03_HERO"), SymPos("P04_HERO"), SymPos("P05_HERO")), Speed(2.5))
    CH("HERO"):SetShadow(true)
    CH("KONOHANA"):SetShadow(true)
    CH("KONOHANA"):WaitMove()
    CH("KONOHANA"):SetVisible(false)
    CH("HERO"):WaitMove()
    CH("HERO"):SetVisible(false)
  end
  TASK:Regist(taskGedan01)
  WINDOW:NarrationBottomFrame(TimeSec(0.5), TimeSec(0.5), 465166103)
  WINDOW:NarrationBottomFrame(TimeSec(0.5), TimeSec(0.5), -657536080)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), -1042941199)
  WINDOW:KeyWait()
  SOUND:FadeOutBgm(TimeSec(3))
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), -352802510)
  WINDOW:CloseMessage()
  TASK:Sleep(TimeSec(1.7))
end
function main01_shinryokuclear1st04_end()
end
function main01_shinryokuclear1st05_init()
end
function main01_shinryokuclear1st05_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(1))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  local taskKonoHero01 = function()
    CH("KONOHANA"):RunTo(SplinePath(SymPos("P00_KONOHANA"), SymPos("P01_KONOHANA"), SymPos("P02_KONOHANA"), SymPos("P03_KONOHANA")), Speed(2.5))
    CH("HERO"):RunTo(SplinePath(SymPos("P00_HERO"), SymPos("P01_HERO"), SymPos("P02_HERO"), SymPos("P03_HERO")), Speed(2.5))
    CH("KONOHANA"):WaitMove()
    CH("KONOHANA"):RunTo(SymPos("P04_KONOHANA"), Speed(2.5))
    CH("HERO"):WaitMove()
    CH("HERO"):RunTo(SymPos("P04_HERO"), Speed(2.5))
    CH("KONOHANA"):WaitMove()
    CH("KONOHANA"):SetVisible(false)
    CH("HERO"):WaitMove()
    CH("HERO"):SetVisible(false)
  end
  TASK:Regist(taskKonoHero01)
  local eLanguageType = SYSTEM:GetLanguageType()
  if eLanguageType == LANGUAGE_TYPE.EN then
    SPRITE:CreatePatternSet("pattern_title02", {
      name = "image_title02",
      img = "TITLE02",
      u = 0,
      v = 0,
      w = 512,
      h = 256,
      cx = 256,
      cy = 128
    })
  elseif eLanguageType == LANGUAGE_TYPE.FR then
    SPRITE:CreatePatternSet("pattern_title02", {
      name = "image_title02",
      img = "TITLE02_FR",
      u = 0,
      v = 0,
      w = 512,
      h = 256,
      cx = 256,
      cy = 128
    })
  elseif eLanguageType == LANGUAGE_TYPE.GE then
    SPRITE:CreatePatternSet("pattern_title02", {
      name = "image_title02",
      img = "TITLE02_GE",
      u = 0,
      v = 0,
      w = 512,
      h = 256,
      cx = 256,
      cy = 128
    })
  elseif eLanguageType == LANGUAGE_TYPE.IT then
    SPRITE:CreatePatternSet("pattern_title02", {
      name = "image_title02",
      img = "TITLE02_IT",
      u = 0,
      v = 0,
      w = 512,
      h = 256,
      cx = 256,
      cy = 128
    })
  elseif eLanguageType == LANGUAGE_TYPE.SP then
    SPRITE:CreatePatternSet("pattern_title02", {
      name = "image_title02",
      img = "TITLE02_SP",
      u = 0,
      v = 0,
      w = 512,
      h = 256,
      cx = 256,
      cy = 128
    })
  else
    SPRITE:CreatePatternSet("pattern_title02", {
      name = "image_title02",
      img = "TITLE02",
      u = 0,
      v = 0,
      w = 512,
      h = 256,
      cx = 256,
      cy = 128
    })
  end
  SPRITE:CreateSprite("title02"):SetPattern({
    setName = "pattern_title02",
    ptnName = "image_title02",
    ofsX = 0,
    ofsY = 0,
    ofsPrio = 0
  })
  SPRT("title02"):SetPosition(Vector2(132, 60))
  SPRT("title02"):ChangeAlpha(0, TimeSec(0))
  SOUND:PlayBgm(SymSnd("BGM_EVE_TITLECATCH"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(4.5))
  SPRT("title02"):ChangeAlpha(1, TimeSec(1))
  TASK:Sleep(TimeSec(7))
  SPRT("title02"):ChangeAlpha(0, TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(1.5), true)
  SPRITE:DestroySprite("title02")
  SPRITE:DestroyPatternSet("pattern_title02")
  TASK:Sleep(TimeSec(1))
end
function main01_shinryokuclear1st05_end()
end
function groundEnd()
end

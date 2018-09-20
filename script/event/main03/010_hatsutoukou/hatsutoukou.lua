dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main03_hatsutoukou01_init()
end
function main03_hatsutoukou01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), -308187073)
  WINDOW:CloseMessage()
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("KONOHANA"):WalkTo(SymPos("P00_KONOHANA"), Speed(1.5))
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1.5))
  SOUND:FadeInEnv(SymSnd("SE_MAP_HILLSWIND_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("KONOHANA"):WaitMove()
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -189120130)
  WINDOW:Talk(SymAct("KONOHANA"), -543747395)
  WINDOW:Talk(SymAct("KONOHANA"), -963894276)
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1983007429)
  WINDOW:CloseMessage()
  CH("KONOHANA"):WalkTo(SymPos("P01_KONOHANA"), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):WalkTo(SymPos("P01_HERO"), Speed(1.5))
  TASK:Sleep(TimeSec(1))
  SOUND:FadeOutEnv(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_hatsutoukou01_end()
end
function main03_hatsutoukou02_init()
end
function main03_hatsutoukou02_start()
  MAP:SetVisible(false)
  MAP:SetBG(SymImg("WALLPAPER_MAIN_CAPTURE_BG01"))
  MAP:SetVisibleBG(true)
  WINDOW:BeginChapter()
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_A:FadeIn(TimeSec(0), true)
  SCREEN_A:FadeInAll(TimeSec(1), false)
  WINDOW:SetWaitMode(TimeSec(2), TimeSec(1))
  WINDOW:Chapter(TimeSec(1.5), TimeSec(1.5), -1864989574)
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
function main03_hatsutoukou02_end()
end
function main03_hatsutoukou03_init()
end
function main03_hatsutoukou03_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("KAMONEGI"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  SOUND:PlayBgm(SymSnd("BGM_EVE_GAKKOU_01"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CAMERA:MoveFollow(SymCam("CAMERA_02"), Speed(2.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CAMERA:WaitMove()
  TASK:Sleep(TimeSec(0.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_hatsutoukou03_end()
end
function main03_hatsutoukou04_init()
end
function main03_hatsutoukou04_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SOUND:PlayBgm(SymSnd("BGM_EVE_GAKKOU_01"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1141123143)
  WINDOW:Talk(SymAct("KONOHANA"), -1562319112)
  WINDOW:CloseMessage()
  CH("KONOHANA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("KONOHANA"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_FLY_SWEAT")
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 628685367)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  CH("HERO"):SetNeckRot(RotateTarget(0), RotateTarget(-40), RotateTarget(0), TimeSec(0.2))
  CH("HERO"):WaitNeckRot()
  TASK:Sleep(TimeSec(0.7))
  CH("HIYAKKII"):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(72, 16, SymAct("HIYAKKII"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("HIYAKKII"), 1013173110)
  WINDOW:KeyWait()
  CH("HIYAKKII"):ResetManpu()
  CH("KONOHANA"):DirTo(CH("HIYAKKII"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):ResetNeckRot(TimeSec(0.35))
  WINDOW:Talk(SymAct("HIYAKKII"), 788067784)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  TASK:Sleep(TimeSec(0.2))
  local taskKonohana01 = function()
    CH("KONOHANA"):SetMotion(SymMot("EV016_BOW00"), LOOP.OFF)
    CH("KONOHANA"):WaitPlayMotion()
    CH("KONOHANA"):SetMotion(SymMot("EV016_BOW01"), LOOP.ON)
  end
  TASK:Regist(taskKonohana01)
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), 937673865)
  WINDOW:CloseMessage()
  TASK:WaitTask()
  CH("KONOHANA"):SetMotion(SymMot("EV016_BOW02"), LOOP.OFF)
  CH("KONOHANA"):WaitPlayMotion()
  CH("KONOHANA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HERO"):DirTo(RotateTarget(0), Speed(200), ROT_TYPE.RIGHT)
  CH("KONOHANA"):WalkTo(SplinePath(SymPos("P00_KONOHANA"), SymPos("P01_KONOHANA")), Speed(1.5))
  CH("KONOHANA"):WaitMove()
  CH("KONOHANA"):SetVisible(false)
  TASK:Sleep(TimeSec(0.5))
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.2))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
    CH("HERO"):SetManpu("MP_NOTICE_R")
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("MIRUHOGGU"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  WINDOW:DrawFace(20, 20, SymAct("MIRUHOGGU"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 483301194)
  WINDOW:KeyWait()
  CH("MIRUHOGGU"):SetManpu("MP_FLY_SWEAT")
  WINDOW:Talk(SymAct("MIRUHOGGU"), 97887755)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1251225804)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("HIYAKKII"):DirTo(CH("MIRUHOGGU"), Speed(350), ROT_TYPE.NEAR)
  CH("HIYAKKII"):WaitRotate()
  WINDOW:DrawFace(272, 16, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), 1401880973)
  WINDOW:Talk(SymAct("HIYAKKII"), 2023903822)
  WINDOW:CloseMessage()
  CH("MIRUHOGGU"):DirTo(CH("HIYAKKII"), Speed(350), ROT_TYPE.NEAR)
  CH("MIRUHOGGU"):WaitRotate()
  CH("MIRUHOGGU"):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("MIRUHOGGU")
  })
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.ANGRY)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1639539471)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -434012224)
  subEveCloseMsg()
  WINDOW:DrawFace(272, 16, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), -12956031)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  local taskLookAt02 = function()
    TASK:Sleep(TimeSec(0.3))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
    CH("MIRUHOGGU"):SetManpu("MP_EXCLAMATION")
    TASK:Sleep(TimeSec(0.2))
    CH("HIYAKKII"):SetManpu("MP_NOTICE_L")
    CH("HERO"):SetManpu("MP_NOTICE_R")
    CH("MIRUHOGGU"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HIYAKKII"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):WaitRotate()
  end
  TASK:Regist(taskLookAt02)
  WINDOW:Talk(SymAct("NUMERA"), 1011702310)
  subEveCloseMsg()
  WINDOW:Talk(SymAct("KAMONEGI"), 626420583)
  subEveCloseMsg()
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 242956452)
  subEveCloseMsg()
  WINDOW:Talk(SymAct("KAMONEGI"), 392169957)
  subEveCloseMsg()
  WINDOW:Talk(SymAct("YANCHAMU"), 1478598434)
  WINDOW:Talk(SymAct("YANCHAMU"), 1094364771)
  subEveCloseMsg()
  WINDOW:Talk(SymAct("KAMONEGI"), 1779957152)
  WINDOW:Talk(SymAct("KAMONEGI"), 1930218721)
  WINDOW:Talk(SymAct("KAMONEGI"), -191573970)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  local taskLookAt03 = function()
    CH("MIRUHOGGU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HERO"):DirTo(CH("HIYAKKII"), Speed(350), ROT_TYPE.RIGHT)
  end
  TASK:Regist(taskLookAt03)
  WINDOW:DrawFace(72, 16, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(30, 0)
  WINDOW:Talk(SymAct("HIYAKKII"), -309337745)
  WINDOW:Talk(SymAct("HIYAKKII"), -2064564925)
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
end
function main03_hatsutoukou04_end()
end
function main03_hatsutoukou05_init()
end
function main03_hatsutoukou05_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.3))
  WINDOW:DrawFace(20, 20, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), -1645605886)
  WINDOW:Talk(SymAct("HIYAKKII"), -1228447807)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("NUMERA"):SetManpu("MP_EXCLAMATION")
  TASK:Sleep(TimeSec(0.1))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_EXCLAMATION")
  TASK:Sleep(TimeSec(0.2))
  CH("CHOBOMAKI"):SetManpu("MP_SHOCK_L")
  CH("YANCHAMU"):SetManpu("MP_EXCLAMATION")
  CH("YANCHAMU"):WaitManpu()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("YANCHAMU"):SetManpu("MP_FLY_SWEAT")
  CH("YANCHAMU"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("YANCHAMU"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("YANCHAMU"), -1344508288)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_EXCLAMATION")
  CH("SHIKIJIKA_SPRING"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -526518201)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("HIYAKKII"):SetManpu("MP_NOTICE_R")
  CH("HIYAKKII"):WaitManpu()
  WINDOW:DrawFace(72, 16, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), -108607226)
  WINDOW:Talk(SymAct("HIYAKKII"), -760505659)
  WINDOW:Talk(SymAct("HIYAKKII"), -877614204)
  WINDOW:Talk(SymAct("HIYAKKII"), 1277736779)
  WINDOW:CloseMessage()
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.2))
    CH("NYASUPAA"):SetManpu("MP_EXCLAMATION")
    TASK:Sleep(TimeSec(0.1))
    CH("NYASUPAA"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
    CH("SHIKIJIKA_SPRING"):SetManpu("MP_NOTICE_L")
    CH("MIRUHOGGU"):SetManpu("MP_QUESTION")
    TASK:Sleep(TimeSec(0.2))
    CH("SHIKIJIKA_SPRING"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
    CH("MIRUHOGGU"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
    CH("CHOBOMAKI"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
    CH("TABUNNE"):SetManpu("MP_NOTICE_L")
    CH("YANCHAMU"):SetManpu("MP_EXCLAMATION")
    CH("HERO"):SetManpu("MP_NOTICE_R")
    TASK:Sleep(TimeSec(0.1))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
    CH("YANCHAMU"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
    CH("KAMONEGI"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
    CH("TABUNNE"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
    CH("HIYAKKII"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
    CH("NUMERA"):SetManpu("MP_QUESTION")
    CH("NUMERA"):DirTo(SymPos("P00_GATE"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  SOUND:FadeInEnv(SymSnd("SE_EVT_DODODO_LP"), TimeSec(0.5), Volume(64))
  CAMERA:SetShake(Vector2(0.004, 0.004), TimeSec(0.5, TIME_TYPE.FRAME))
  WINDOW:SysMsg(1429440010)
  TASK:Sleep(TimeSec(1.5))
  WINDOW:ForceCloseMessage()
  CAMERA:SetShake(Vector2(0, 0), TimeSec(0))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT_LP")
  CH("PARTNER"):RunTo(SplinePath(SymPos("P00_PARTNER"), SymPos("P01_PARTNER")), Speed(4))
  SOUND:PlayBgm(SymSnd("BGM_EVE_ZANNEN_01"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  SOUND:VolumeEnv(Volume(256), TimeSec(0.5))
  EFFECT:Create("effectSmokeBig01", SymEff("EV_RUN_SMOKE_BIG"))
  EFFECT:SetScale("effectSmokeBig01", Scale(0.7))
  EFFECT:SetPosition("effectSmokeBig01", SymPos("P01_EFF_SMOKE_BIG"))
  EFFECT:SetDir("effectSmokeBig01", RotateTarget(-60))
  EFFECT:Play("effectSmokeBig01")
  TASK:Sleep(TimeSec(0.25))
  EFFECT:Create("effectSmokeBig02", SymEff("EV_RUN_SMOKE_BIG"))
  EFFECT:SetScale("effectSmokeBig02", Scale(0.7))
  EFFECT:SetPosition("effectSmokeBig02", SymPos("P02_EFF_SMOKE_BIG"))
  EFFECT:SetDir("effectSmokeBig02", RotateTarget(-60))
  EFFECT:Play("effectSmokeBig02")
  TASK:Sleep(TimeSec(0.25))
  EFFECT:Create("effectSmokeBig03", SymEff("EV_RUN_SMOKE_BIG"))
  EFFECT:SetScale("effectSmokeBig03", Scale(0.7))
  EFFECT:SetPosition("effectSmokeBig03", SymPos("P03_EFF_SMOKE_BIG"))
  EFFECT:SetDir("effectSmokeBig03", RotateTarget(-60))
  EFFECT:Play("effectSmokeBig03")
  WINDOW:SwitchTalk({PARTNER_0 = 421922298, PARTNER_1 = 4011195})
  TASK:Sleep(TimeSec(1.2))
  SOUND:FadeOutEnv(TimeSec(1))
  WINDOW:ForceCloseMessage()
  CH("PARTNER"):SetPosition(SymPos("P02_PARTNER"))
  CH("PARTNER"):RunTo(SymPos("P03_PARTNER"), Speed(4))
  CH("HERO"):SetDir(SymPos("P03_PARTNER"))
  CH("NUMERA"):SetDir(SymPos("P03_PARTNER"))
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  CH("PARTNER"):ResetManpu()
  CH("PARTNER"):WaitMove()
  local taskCrush01 = function()
    SOUND:PlaySe(SymSnd("SE_EVT_PARTNER_CRUSH"), Volume(256))
    CAMERA:SetShake(Vector2(0.04, 0.04), TimeSec(1, TIME_TYPE.FRAME))
    CH("HERO"):SetMotion(SymMot("EV013_AVOID03"), LOOP.OFF)
    CH("PARTNER"):SetMotion(SymMot("EV013_AVOID03"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(SymMot("EV013_AVOID04"), LOOP.ON)
    CH("PARTNER"):WaitPlayMotion()
    CH("PARTNER"):SetMotion(SymMot("EV013_AVOID04"), LOOP.ON)
    CH("HERO"):SetEyeMotion(EYE_MOTION.PAIN)
    CH("PARTNER"):SetEyeMotion(EYE_MOTION.PAIN)
  end
  EFFECT:Create("effectShock", SymEff("EV_SHOCK"))
  EFFECT:SetPosition("effectShock", SymPos("P_EFF_SHOCK"))
  EFFECT:Play("effectShock")
  TASK:Regist(taskCrush01)
  CH("HIYAKKII"):SetManpu("MP_EXCLAMATION")
  CH("HIYAKKII"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  CH("KAMONEGI"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  CH("TABUNNE"):SetManpu("MP_FLY_SWEAT")
  CH("TABUNNE"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  TASK:Regist(subEveJumpSurprise, {
    CH("HIYAKKII")
  })
  CH("NUMERA"):SetManpu("MP_SHOCK_L")
  CH("NUMERA"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  TASK:Regist(subEveJumpSurprise, {
    CH("NUMERA")
  })
  WINDOW:DrawFace(272, 16, SymAct("HERO"), FACE_TYPE.SHOUT)
  WINDOW:DrawFaceOffset(-20, 0)
  WINDOW:Monologue(722495352)
  CAMERA:SetShake(Vector2(0, 0), TimeSec(0))
  WINDOW:CloseMessage()
  TASK:WaitTask()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CAMERA:SetShake(Vector2(0.02, 0.02), TimeSec(1, TIME_TYPE.FRAME))
  CH("MIRUHOGGU"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  TASK:Regist(subEveJumpSurprise, {
    CH("MIRUHOGGU")
  })
  CH("KAMONEGI"):SetManpu("MP_SHOCK_L")
  WINDOW:DrawFace(324, 88, SymAct("MIRUHOGGU"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 839603769)
  CAMERA:SetShake(Vector2(0, 0), TimeSec(0))
  WINDOW:CloseMessage()
  CH("PARTNER"):SetDir(CH("HERO"))
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("HIYAKKII"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):SetMotion(SymMot("EV001_DOWN02"), LOOP.OFF)
  CH("PARTNER"):WaitPlayMotion()
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):SetNeckRot(RotateTarget(0), RotateTarget(-20), RotateTarget(0), TimeSec(0.2))
  CH("PARTNER"):WaitNeckRot()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 2102051070, PARTNER_1 = 1683091903})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_07"))
  CAMERA:SetTgt(SymCam("CAMERA_07"))
  CH("HERO"):SetEyeMotion(EYE_MOTION.SAD)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 1333568124, PARTNER_1 = 1449628477})
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.PAIN)
  WINDOW:Monologue(-771780622)
  WINDOW:Monologue(-924533069)
  WINDOW:KeyWait()
  SOUND:FadeOutBgm(TimeSec(2))
  CH("HERO"):SetEyeMotion(EYE_MOTION.PAIN)
  SCREEN_A:FadeOut(TimeSec(1.5), false)
  WINDOW:Monologue(-1583717729)
  SCREEN_A:WaitFade()
  WINDOW:CloseMessage()
  TASK:Sleep(TimeSec(1))
end
function main03_hatsutoukou05_end()
end
function main03_hatsutoukou06_init()
end
function main03_hatsutoukou06_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(-1199483938)
  WINDOW:Monologue(-1817444323)
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(-1967705764)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetDir(RotateTarget(-45))
  CH("HERO"):SetMotion(SymMot("EV001_SLEEP01"), LOOP.ON, TimeSec(0))
  SCREEN_A:FadeIn(TimeSec(1), true)
  TASK:Sleep(TimeSec(0.5))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("HERO"):SetManpu("MP_NOTICE_L")
  CH("HERO"):WaitManpu()
  CH("HERO"):SetMotionRaito(Raito(0.8))
  CH("HERO"):SetMotion(SymMot("EV001_SLEEP02"), LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotionRaito(Raito(1))
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.3))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("TABUNNE"):SetManpu("MP_EXCLAMATION")
  CH("TABUNNE"):WaitManpu()
  CH("HERO"):DirTo(CH("TABUNNE"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct(""), -973690981)
  CH("HERO"):WaitRotate()
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  subEveLookAround(CH("HERO"), Speed(600))
  WINDOW:DrawFace(324, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct(""), -588409126)
  WINDOW:KeyWait()
  CH("HERO"):DirTo(CH("TABUNNE"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:Talk(SymAct(""), -138361575)
  WINDOW:KeyWait()
  CH("TABUNNE"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(324, 88, SymAct("TABUNNE"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct(""), -287574952)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("TABUNNE"):ResetFacialMotion()
  CH("TABUNNE"):SetManpu("MP_NOTICE_L")
  CH("TABUNNE"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct(""), 1766058135)
  WINDOW:Talk(SymAct("TABUNNE"), 1884871126)
  WINDOW:KeyWait()
  CH("TABUNNE"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(324, 88, SymAct("TABUNNE"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("TABUNNE"), -1288712847)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("TABUNNE"):ResetFacialMotion()
  CH("TABUNNE"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  CH("TABUNNE"):WaitRotate()
  CH("HERO"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("TABUNNE"), -1439368144)
  WINDOW:CloseMessage()
  CH("TABUNNE"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("TABUNNE"):WaitRotate()
  CH("HERO"):DirTo(CH("TABUNNE"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("TABUNNE"), -2129022989)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_hatsutoukou06_end()
end
function groundEnd()
end

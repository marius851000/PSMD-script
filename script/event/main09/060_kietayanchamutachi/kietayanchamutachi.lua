dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main09_kietayanchamutachi01_init()
end
function main09_kietayanchamutachi01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  local pokemonIndexPartner = SymAct("PARTNER"):GetIndex()
  if pokemonIndexPartner == 10 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 30 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 203 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 322 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 485 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 537 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 592 then
    CH("PARTNER"):SetPosition(SymPos("SP01_PARTNER"))
  elseif pokemonIndexPartner == 598 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 766 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  end
  CH("HERO"):SetMotion(SymMot("EV001_DOWN01"), LOOP.ON, TimeSec(0))
  CH("PARTNER"):SetMotion(SymMot("EV001_DOWN01"), LOOP.ON, TimeSec(0))
  CH("SHIKIJIKA_SPRING"):SetMotion(SymMot("EV004_DOWN"), LOOP.ON, TimeSec(0))
  CH("NUMERA"):SetMotion(SymMot("SLEEPLOOP"), LOOP.ON, TimeSec(0))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main09_kietayanchamutachi01_end()
end
function main09_kietayanchamutachi02_init()
end
function main09_kietayanchamutachi02_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  local pokemonIndexPartner = SymAct("PARTNER"):GetIndex()
  if pokemonIndexPartner == 10 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 30 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 203 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 322 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 485 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 537 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 592 then
    CH("PARTNER"):SetPosition(SymPos("SP01_PARTNER"))
  elseif pokemonIndexPartner == 598 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 766 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  end
  CH("NYASUPAA"):SetVisible(false)
  CH("HERO"):SetMotion(SymMot("EV001_DOWN01"), LOOP.ON, TimeSec(0))
  CH("PARTNER"):SetMotion(SymMot("EV001_DOWN01"), LOOP.ON, TimeSec(0))
  CH("SHIKIJIKA_SPRING"):SetMotion(SymMot("EV004_DOWN"), LOOP.ON, TimeSec(0))
  CH("NUMERA"):SetMotion(SymMot("SLEEPLOOP"), LOOP.ON, TimeSec(0))
  CHARA:SetAllCharacterShadowVisible(true)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  CH("HERO"):SetShake(Vector(0.005, 0, 0), TimeSec(0.2, TIME_TYPE.FRAME))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):ResetShake()
  WINDOW:DrawFace(324, 324, SymAct("HERO"), FACE_TYPE.PAIN)
  WINDOW:Monologue(531106716)
  WINDOW:CloseMessage()
  CH("HERO"):SetMotion(SymMot("EV001_DOWN02"), LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.2))
  subEveLookAround(CH("HERO"), Speed(600))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  local taskPartner00 = function()
    TASK:Sleep(TimeSec(0.4))
    CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SAD)
    CH("PARTNER"):SetMotion(SymMot("EV001_DOWN02"), LOOP.OFF)
    CH("PARTNER"):WaitPlayMotion()
    CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    TASK:Sleep(TimeSec(0.2))
    subEveLookAround(CH("PARTNER"), Speed(600))
  end
  local taskShikijika00 = function()
    CH("SHIKIJIKA_SPRING"):SetFacialMotion(FACIAL_MOTION.SAD)
    CH("SHIKIJIKA_SPRING"):SetMotion(SymMot("EV004_RISE"), LOOP.OFF)
    CH("SHIKIJIKA_SPRING"):WaitPlayMotion()
    CH("SHIKIJIKA_SPRING"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    subEveLookAround(CH("SHIKIJIKA_SPRING"), Speed(600))
  end
  local taskNumera00 = function()
    TASK:Sleep(TimeSec(0.6))
    CH("NUMERA"):SetFacialMotion(FACIAL_MOTION.SAD)
    CH("NUMERA"):SetMotion(SymMot("EV004_RISE"), LOOP.OFF)
    CH("NUMERA"):WaitPlayMotion()
    CH("NUMERA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    subEveLookAround(CH("NUMERA"), Speed(600))
  end
  TASK:Regist(taskPartner00)
  TASK:Regist(taskShikijika00)
  TASK:Regist(taskNumera00)
  CH("HERO"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 112409309)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = 765356318, PARTNER_1 = 881154143})
  WINDOW:CloseMessage()
  CH("NUMERA"):DirTo(SymPos("P_YANCHOBO"), Speed(350), ROT_TYPE.NEAR)
  CH("NUMERA"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_01"), Volume(256))
  CH("NUMERA"):SetManpu("MP_EXCLAMATION")
  CH("NUMERA"):WaitManpu()
  CH("NUMERA"):ResetFacialMotion()
  CH("SHIKIJIKA_SPRING"):ResetFacialMotion()
  CH("PARTNER"):ResetFacialMotion()
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.4))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
    CH("SHIKIJIKA_SPRING"):SetManpu("MP_SHOCK_R")
    CH("HERO"):SetManpu("MP_EXCLAMATION")
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):SetManpu("MP_SHOCK_R")
  end
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("NUMERA"), 2076495512)
  WINDOW:KeyWait()
  TASK:Regist(taskLookAt00)
  WINDOW:Talk(SymAct("NUMERA"), 1658847193)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_03"), Speed(4, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("SHIKIJIKA_SPRING"):DirTo(SymPos("P_YANCHOBO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(SymPos("P_YANCHOBO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):DirTo(SymPos("P_YANCHOBO"), Speed(350), ROT_TYPE.NEAR)
  CAMERA:WaitMove()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_FLY_SWEAT")
  WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1240640538)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_02"), Speed(2, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  SOUND:PlayBgm(SymSnd("BGM_EVE_NAZO_01"), Volume(256))
  CH("PARTNER"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SAD)
  CH("NUMERA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = 1357487451, PARTNER_1 = -680427116})
  CH("SHIKIJIKA_SPRING"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:SwitchTalk({PARTNER_0 = -831868715, PARTNER_1 = 1812283487})
  CH("SHIKIJIKA_SPRING"):WaitRotate()
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1964929310)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1580409565)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_R")
  TASK:Regist(subEveJumpSurprise, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 1193808796, PARTNER_1 = 141133147})
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SAD)
  CH("PARTNER"):SetMotion(SymMot("ENDURE"), LOOP.ON)
  TASK:Sleep(TimeSec(1.2))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("SHIKIJIKA_SPRING"):SetNeckRot(RotateTarget(0), RotateTarget(-30), RotateTarget(0), TimeSec(0.2))
  CH("SHIKIJIKA_SPRING"):WaitNeckRot()
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 292729882)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 979363801)
  WINDOW:CloseMessage()
  CH("SHIKIJIKA_SPRING"):ResetNeckRot(TimeSec(0.15))
  CH("SHIKIJIKA_SPRING"):WaitNeckRot()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_EXCLAMATION")
  CH("SHIKIJIKA_SPRING"):WaitManpu()
  TASK:Regist(subEveDoubleJump, {
    CH("SHIKIJIKA_SPRING")
  })
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.ANGRY)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 591713944)
  TASK:WaitTask()
  WINDOW:KeyWait()
  TASK:Regist(subEveDoubleJump, {
    CH("SHIKIJIKA_SPRING")
  })
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -1529034153)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_01"), Volume(256))
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  TASK:Sleep(TimeSec(1))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_FLY_SWEAT")
  CH("SHIKIJIKA_SPRING"):WaitManpu()
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.TEARS)
  WINDOW:Talk(SymAct("NUMERA"), -1110967530)
  WINDOW:Talk(SymAct("NUMERA"), 2125524913)
  subEveCloseMsg()
  SOUND:FadeOutBgm(TimeSec(1))
  CH("NYASUPAA"):SetVisible(true)
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.4))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
    CH("HERO"):SetManpu("MP_NOTICE_R")
    CH("SHIKIJIKA_SPRING"):SetManpu("MP_EXCLAMATION")
    TASK:Sleep(TimeSec(0.1))
    CH("NUMERA"):SetManpu("MP_NOTICE_R")
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  end
  TASK:Regist(taskLookAt01)
  WINDOW:Talk(SymAct("NYASUPAA"), 1739316976)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("NYASUPAA"):WalkTo(SymPos("P00_NYASUPAA"), Speed(1.5))
  CAMERA:MoveFollow2(SymCam("CAMERA_04"), Speed(1, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("SHIKIJIKA_SPRING"):DirTo(SymPos("P00_NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("NUMERA"):DirTo(SymPos("P00_NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):DirTo(SymPos("P00_NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):DirTo(SymPos("P00_NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  CAMERA:WaitMove()
  CH("NYASUPAA"):WaitMove()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(272, 16, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 1283886387, PARTNER_1 = 1436400754})
  subEveCloseMsg()
  TASK:Regist(subEveDoubleJump, {
    CH("SHIKIJIKA_SPRING")
  })
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 450636469)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.SPECIAL02)
  WINDOW:Talk(SymAct("NYASUPAA"), 63380468)
  WINDOW:Talk(SymAct("NYASUPAA"), 686442551)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_L")
  TASK:Regist(subEveJumpSurprise, {
    CH("PARTNER")
  })
  CH("NUMERA"):SetManpu("MP_EXCLAMATION")
  CH("HERO"):SetManpu("MP_SHOCK_L")
  TASK:Sleep(TimeSec(0.1))
  TASK:Regist(subEveJumpSurprise, {
    CH("NUMERA")
  })
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_EXCLAMATION")
  TASK:Sleep(TimeSec(0.1))
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 837908854, PARTNER_1 = -1234606663})
  WINDOW:CloseMessage()
  SOUND:PlayBgm(SymSnd("BGM_EVE_NAZO_02"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -1351461640)
  WINDOW:Talk(SymAct("NYASUPAA"), -972257068)
  WINDOW:Talk(SymAct("NYASUPAA"), -552093291)
  WINDOW:Talk(SymAct("NYASUPAA"), -197465514)
  WINDOW:Talk(SymAct("NYASUPAA"), -316548329)
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("NUMERA"):SetManpu("MP_SHOCK_R")
  WINDOW:DrawFace(72, 16, SymAct("NUMERA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("NUMERA"), -1570746928)
  subEveCloseMsg()
  WINDOW:DrawFace(272, 16, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -1149535087, PARTNER_1 = -1873399982})
  subEveCloseMsg()
  CH("NYASUPAA"):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("NYASUPAA"), -1991434733)
  WINDOW:CloseMessage()
  CH("NYASUPAA"):ResetManpu()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_FLY_SWEAT")
  CH("SHIKIJIKA_SPRING"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 248840924)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), 399389597)
  WINDOW:Talk(SymAct("NYASUPAA"), 1541124205)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main09_kietayanchamutachi02_end()
end
function main09_kietayanchamutachi03_init()
end
function main09_kietayanchamutachi03_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_NAZO_02"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  MAP:ChangeLightColor(Color(0.5, 0.5, 0.5, 1), TimeSec(0))
  local pokemonIndexPartner = SymAct("PARTNER"):GetIndex()
  if pokemonIndexPartner == 10 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 30 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 203 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 322 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 485 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 537 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 592 then
    CH("PARTNER"):SetPosition(SymPos("SP01_PARTNER"))
  elseif pokemonIndexPartner == 598 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  elseif pokemonIndexPartner == 766 then
    CH("PARTNER"):SetPosition(SymPos("SP00_PARTNER"))
  end
  SAJI:CreateSajiPlayer("kage_03", "EV09_050_04_03")
  SJ("kage_03"):SetPosition(Vector2(200, 120))
  SJ("kage_03"):SetDrawPriority(1024)
  SJ("kage_03"):Play(LOOP.ON)
  CAMERA:SetEye(SymCam("CAMERA_00_5"))
  CAMERA:SetTgt(SymCam("CAMERA_00_5"))
  CAMERA:SetFovy(SymCam("CAMERA_00_5"))
  EFFECT:CreateRecollectionFilter()
  CH("PARTNER"):SetMotion(SymMot("EV001_DOWN01"), LOOP.ON, TimeSec(0))
  CH("HERO"):SetMotion(SymMot("EV001_DOWN01"), LOOP.ON, TimeSec(0))
  CH("CHOBOMAKI"):SetMotion(SymMot("SLEEPLOOP"), LOOP.ON, TimeSec(0))
  CH("NUMERA"):SetMotion(SymMot("SLEEPLOOP"), LOOP.ON, TimeSec(0))
  CH("SHIKIJIKA_SPRING"):SetMotion(SymMot("EV004_DOWN"), LOOP.ON, TimeSec(0))
  CH("YANCHAMU"):SetMotion(SymMot("FALL"), LOOP.OFF, TimeSec(0))
  CH("NYASUPAA"):SetMotion(SymMot("SLEEPLOOP"), LOOP.ON, TimeSec(0))
  EFFECT:Create("effectFire04", SymEff("EV_FIRE_BLUEWHITE_LP"))
  EFFECT:SetPosition("effectFire04", SymPos("P_EFF_FIRE_04"))
  EFFECT:Play("effectFire04")
  EFFECT:Create("effectFire01", SymEff("EV_FIRE_BLUEWHITE_LP"))
  EFFECT:SetPosition("effectFire01", SymPos("P_EFF_FIRE_01"))
  EFFECT:Play("effectFire01")
  EFFECT:Create("effectFire02", SymEff("EV_FIRE_BLUEWHITE_LP"))
  EFFECT:SetPosition("effectFire02", SymPos("P_EFF_FIRE_02"))
  EFFECT:Play("effectFire02")
  EFFECT:Create("effectFire03", SymEff("EV_FIRE_BLUEWHITE_LP"))
  EFFECT:SetPosition("effectFire03", SymPos("P_EFF_FIRE_03"))
  EFFECT:Play("effectFire03")
  TASK:Sleep(TimeSec(0.5))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  MAP:ReturnLightColor(TimeSec(1.5))
  SJ("kage_03"):ChangeAlpha(0, TimeSec(1.5))
  TASK:Sleep(TimeSec(1.5))
  SAJI:DestroySajiPlayer("kage_03")
  TASK:Sleep(TimeSec(0.3))
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), 1119912236)
  WINDOW:Talk(SymAct("NYASUPAA"), 1777193711)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CAMERA:SetFovy(SymCam("CAMERA_01"))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  SOUND:PlaySe(SymSnd("SE_EVT_HONOO_MOVE"))
  EFFECT:MoveTo("effectFire01", SymPos("P01_EFF_FIRE_01"), Speed(1.5))
  EFFECT:MoveTo("effectFire02", SymPos("P01_EFF_FIRE_02"), Speed(1.5))
  EFFECT:MoveTo("effectFire03", SymPos("P01_EFF_FIRE_03"), Speed(1.5))
  EFFECT:MoveTo("effectFire04", SymPos("P01_EFF_FIRE_04"), Speed(2))
  EFFECT:WaitMove("effectFire04")
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), 1895228334)
  WINDOW:CloseMessage()
  EFFECT:MoveTo("effectFire01", SymPos("P02_EFF_FIRE_01"), Speed(0.8))
  EFFECT:MoveTo("effectFire02", SymPos("P02_EFF_FIRE_02"), Speed(0.8))
  EFFECT:MoveTo("effectFire03", SymPos("P02_EFF_FIRE_03"), Speed(0.8))
  EFFECT:MoveTo("effectFire04", SymPos("P02_EFF_FIRE_04"), Speed(0.8))
  TASK:Sleep(TimeSec(0.2))
  CH("YANCHAMU"):MoveTo(SymPos("P00_YANCHAMU"), Speed(0.8), LINK_DIR.OFF)
  CH("CHOBOMAKI"):MoveTo(SymPos("P00_CHOBOMAKI"), Speed(0.8), LINK_DIR.OFF)
  TASK:Sleep(TimeSec(0.7))
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), 1068987753)
  CH("CHOBOMAKI"):WaitMove()
  WINDOW:Talk(SymAct("NYASUPAA"), 648823848)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = 226564075, PARTNER_1 = 345646762})
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -1828570523)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -1978070236)
  WINDOW:CloseMessage()
  CH("NYASUPAA"):SetMotion(SymMot("EV004_RISE"), LOOP.OFF)
  CH("NYASUPAA"):WaitPlayMotion()
  CH("NYASUPAA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("NYASUPAA"):DirTo(SymPos("P00_YANCHAMU"), Speed(500), ROT_TYPE.NEAR)
  CH("NYASUPAA"):WaitRotate()
  TASK:Sleep(TimeSec(0.3))
  subEveLookAround(CH("NYASUPAA"), Speed(600))
  TASK:Sleep(TimeSec(0.5))
  CH("NYASUPAA"):DirTo(SymPos("P00_NYASUPAA"), Speed(500), ROT_TYPE.NEAR)
  CH("NYASUPAA"):WaitRotate()
  CH("NYASUPAA"):RunTo(SplinePath(SymPos("P00_NYASUPAA"), SymPos("P01_NYASUPAA")), Speed(3))
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -479734008)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  EFFECT:DestroyRecollectionFilter()
end
function main09_kietayanchamutachi03_end()
end
function main09_kietayanchamutachi04_init()
end
function main09_kietayanchamutachi04_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_NAZO_02"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CHARA:SetAllCharacterShadowVisible(true)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(272, 16, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -92477879, PARTNER_1 = -783174262})
  subEveCloseMsg()
  CH("PARTNER"):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -934640437)
  WINDOW:CloseMessage()
  TASK:Regist(subEveMoveDir, {
    CH("NYASUPAA"),
    SymPos("P00_NYASUPAA"),
    Speed(1.5),
    SymPos("P00_NYASUPAA")
  })
  TASK:Sleep(TimeSec(0.4))
  CH("SHIKIJIKA_SPRING"):WalkTo(SymPos("P00_SHIKIJIKA"), Speed(1.5))
  TASK:Sleep(TimeSec(0.2))
  CH("NUMERA"):WalkTo(SymPos("P00_NUMERA"), Speed(1.5))
  CH("PARTNER"):WalkTo(SymPos("P00_PARTNER"), Speed(1.5))
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1.5))
  TASK:Sleep(TimeSec(0.5))
  SOUND:FadeOutBgm(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main09_kietayanchamutachi04_end()
end
function main09_kietayanchamutachi05_init()
end
function main09_kietayanchamutachi05_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  TASK:Regist(Group("grpNyasupaa"), subEveMoveDir, {
    CH("NYASUPAA"),
    SymPos("P00_NYASUPAA"),
    Speed(1.5),
    SymPos("P_ENTER")
  })
  TASK:Regist(subEveMoveDir, {
    CH("SHIKIJIKA_SPRING"),
    SymPos("P00_SHIKIJIKA"),
    Speed(1.5),
    SymPos("P_ENTER")
  })
  TASK:Regist(subEveMoveDir, {
    CH("HERO"),
    SymPos("P00_HERO"),
    Speed(1.5),
    SymPos("P_ENTER")
  })
  TASK:Regist(subEveMoveDir, {
    CH("PARTNER"),
    SymPos("P00_PARTNER"),
    Speed(1.5),
    SymPos("P_ENTER")
  })
  TASK:Regist(Group("grpNumera"), subEveMoveDir, {
    CH("NUMERA"),
    SymPos("P00_NUMERA"),
    Speed(1.5),
    SymPos("P_ENTER")
  })
  MAP:SetVisibleMaterial("m_tw00_all_night_light0", false)
  SOUND:FadeInBgm(SymSnd("SE_ENV_FOREST_NIGHT_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:WaitTask(Group("grpNyasupaa"))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  WINDOW:DrawFace(324, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -2029317620)
  TASK:WaitTask(Group("grpNyasupaa"))
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_R")
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):SetManpu("MP_SHOCK_R")
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_EXCLAMATION")
  TASK:Regist(subEveDoubleJump, {
    CH("NUMERA")
  })
  TASK:WaitTask()
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("NUMERA"), -1643109555)
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_FLY_SWEAT")
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -1254264690)
  subEveCloseMsg()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -1406778929, PARTNER_1 = 733895936})
  WINDOW:SwitchTalk({PARTNER_0 = 849701953, PARTNER_1 = -237864730})
  WINDOW:CloseMessage()
  CH("NYASUPAA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("NYASUPAA"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -389461593)
  WINDOW:Talk(SymAct("NYASUPAA"), -1008461212)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SAD)
  CH("PARTNER"):SetMotion(SymMot("ENDURE"), LOOP.ON)
  TASK:Sleep(TimeSec(0.1))
  CH("NUMERA"):SetFacialMotion(FACIAL_MOTION.SAD)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("NUMERA"):SetManpu("MP_FLY_SWEAT")
  CH("NUMERA"):SetMotion(SymMot("ENDURE"), LOOP.ON)
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.TEARS)
  WINDOW:Talk(SymAct("NUMERA"), -620811483)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.TEARS)
  WINDOW:SwitchTalk({PARTNER_0 = -1782661662, PARTNER_1 = -1935307613})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_FLY_SWEAT")
  CH("SHIKIJIKA_SPRING"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.TEARS)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -1484202144)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(0.2))
  local taskLookAt02 = function()
    TASK:Sleep(TimeSec(0.3))
    CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("SHIKIJIKA_SPRING"):DirTo(CH("PARTNER"), Speed(200), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt02)
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.TEARS)
  WINDOW:SwitchTalk({PARTNER_0 = -1097601503, PARTNER_1 = 957084398})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 20, SymAct("NYASUPAA"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("NYASUPAA"), 537969583)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(0.2))
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.TEARS)
  WINDOW:SwitchTalk({PARTNER_0 = 1231953795, PARTNER_1 = 1349856962})
  WINDOW:SwitchTalk({PARTNER_0 = 2069396737, PARTNER_1 = 1648577600})
  WINDOW:KeyWait()
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.DAMAGE)
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.PAIN)
  WINDOW:SwitchTalk({PARTNER_0 = 755161735, PARTNER_1 = 874113990})
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(272, 16, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(10, 0)
  WINDOW:Monologue(523548677)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SAD)
  CH("NUMERA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.3))
  CH("NUMERA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("NUMERA"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("NUMERA"), FACE_TYPE.TEARS)
  WINDOW:Talk(SymAct("NUMERA"), 103778628)
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.TEARS)
  WINDOW:SwitchTalk({PARTNER_0 = -2118675061, PARTNER_1 = -1733516086})
  WINDOW:SwitchTalk({PARTNER_0 = 286068693, PARTNER_1 = 135675540})
  WINDOW:SwitchTalk({PARTNER_0 = 591097175, PARTNER_1 = 975199254})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  WINDOW:DrawFace(324, 20, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.TEARS)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1969343185)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1819999120)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  TASK:Sleep(TimeSec(0.2))
  CH("SHIKIJIKA_SPRING"):DirTo(SymPos("P_ENTER"), Speed(200), ROT_TYPE.NEAR)
  CH("SHIKIJIKA_SPRING"):WaitRotate()
  local taskLookAt00 = function()
    TASK:Sleep(TimeSec(0.3))
    CH("NYASUPAA"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("NUMERA"):ResetFacialMotion()
    CH("NUMERA"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("PARTNER"):ResetFacialMotion()
    CH("PARTNER"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt00)
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.RELIEF)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1196927059)
  WINDOW:KeyWait()
  TASK:Regist(subEveDoubleJump, {
    CH("SHIKIJIKA_SPRING")
  })
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1582078226)
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(SymPos("P_ENTER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.DECIDE)
  WINDOW:Monologue(-640383523)
  CH("NUMERA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:CloseMessage()
  CH("NYASUPAA"):DirTo(SymPos("P_ENTER"), Speed(350), ROT_TYPE.NEAR)
  CH("NYASUPAA"):WaitRotate()
  CH("PARTNER"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 20, SymAct("NYASUPAA"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("NYASUPAA"), -1060129636)
  subEveCloseMsg()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -1447991120, PARTNER_1 = -1331013135})
  WINDOW:CloseMessage()
  CH("SHIKIJIKA_SPRING"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
  CH("SHIKIJIKA_SPRING"):WaitRotate()
  CH("NUMERA"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  local taskLookAt01 = function()
    TASK:Sleep(TimeSec(0.6))
    CH("NYASUPAA"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HERO"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  WINDOW:DrawFace(324, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -1685648846)
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("NUMERA"):SetManpu("MP_FLY_SWEAT")
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.TEARS)
  WINDOW:Talk(SymAct("NUMERA"), -2103690381)
  WINDOW:Talk(SymAct("NUMERA"), -841110092)
  WINDOW:Talk(SymAct("NUMERA"), -725181195)
  subEveCloseMsg()
  local taskLookAt03 = function()
    TASK:Sleep(TimeSec(0.3))
    CH("NUMERA"):DirTo(CH("PARTNER"), Speed(200), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("NYASUPAA"):DirTo(CH("PARTNER"), Speed(200), ROT_TYPE.NEAR)
    CH("HERO"):DirTo(CH("PARTNER"), Speed(200), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("SHIKIJIKA_SPRING"):DirTo(CH("PARTNER"), Speed(200), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt03)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1323210, PARTNER_1 = -420413833})
  WINDOW:SwitchTalk({PARTNER_0 = 1634263736, PARTNER_1 = 2020856825})
  WINDOW:CloseMessage()
  TASK:Sleep(TimeSec(0.2))
  local taskUnun00 = function()
    subEveNod(CH("HERO"))
  end
  local taskUnun01 = function()
    subEveNod(CH("NYASUPAA"))
  end
  local taskUnun02 = function()
    subEveNod(CH("PARTNER"))
  end
  local taskUnun03 = function()
    TASK:Regist(subEveJump, {
      CH("NUMERA")
    })
  end
  local taskUnun04 = function()
    subEveNod(CH("SHIKIJIKA_SPRING"))
  end
  TASK:Regist(taskUnun00)
  TASK:Regist(taskUnun01)
  TASK:Regist(taskUnun02)
  TASK:Regist(taskUnun03)
  TASK:Regist(taskUnun04)
  TASK:Sleep(TimeSec(0.8))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
end
function main09_kietayanchamutachi05_end()
end
function groundEnd()
end

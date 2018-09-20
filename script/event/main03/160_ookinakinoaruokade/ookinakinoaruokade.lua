dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main03_ookinakinoaruokade01_init()
end
function main03_ookinakinoaruokade01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH("PARTNER"):RunTo(SymPos("P00_HERO"), Speed(2.5))
  CH("HERO"):RunTo(SymPos("P00_HERO"), Speed(2.5))
  SOUND:PlayBgm(SymSnd("BGM_EVE_HAPPY"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("HERO"):WaitMove()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("HERO"):SetPosition(SymPos("P01_HERO"))
  CH("PARTNER"):SetPosition(SymPos("P01_PARTNER"))
  CH("HERO"):RunTo(SymPos("P02_HERO"), Speed(3))
  CH("PARTNER"):RunTo(SymPos("P02_PARTNER"), Speed(3))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("YANCHAMU"):SetManpu("MP_EXCLAMATION")
  CH("YANCHAMU"):SetMotion(SymMot("WALK"), LOOP.ON)
  CH("YANCHAMU"):DirLockToChara(CH("PARTNER"))
  CH("CHOBOMAKI"):SetMotion(SymMot("WALK"), LOOP.ON)
  CH("CHOBOMAKI"):DirLockToChara(CH("PARTNER"))
  TASK:Sleep(TimeSec(0.8))
  WINDOW:DrawFace(272, 16, SymAct("YANCHAMU"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(-50, 0)
  WINDOW:Talk(SymAct("YANCHAMU"), -2139904557)
  CH("HERO"):WaitMove()
  CH("YANCHAMU"):DirLockOff()
  CH("CHOBOMAKI"):DirLockOff()
  CH("YANCHAMU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("CHOBOMAKI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  WINDOW:CloseMessage()
  CH("HERO"):ResetFacialMotion()
  CH("PARTNER"):ResetFacialMotion()
  CH("HERO"):SetPosition(SymPos("P03_HERO"))
  CH("PARTNER"):SetPosition(SymPos("P03_PARTNER"))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("HERO"):DirTo(CH("CHOBOMAKI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("PARTNER"):DirTo(CH("CHOBOMAKI"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.3))
  TASK:Regist(subEveDoubleJump, {
    CH("CHOBOMAKI")
  })
  WINDOW:DrawFace(324, 88, SymAct("CHOBOMAKI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("CHOBOMAKI"), -1721199470)
  WINDOW:Talk(SymAct("CHOBOMAKI"), -1304049839)
  subEveCloseMsg()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = -1419839984, PARTNER_1 = -467705641})
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  TASK:Regist(subEveJumpSurprise, {
    CH("CHOBOMAKI")
  })
  CH("CHOBOMAKI"):SetManpu("MP_SHOCK_L")
  TASK:Sleep(TimeSec(0.1))
  CH("YANCHAMU"):SetManpu("MP_EXCLAMATION")
  WINDOW:DrawFace(324, 88, SymAct("CHOBOMAKI"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("CHOBOMAKI"), -50048618)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("YANCHAMU"):SetManpu("MP_FLY_SWEAT")
  CH("YANCHAMU"):WaitManpu()
  WINDOW:DrawFace(324, 20, SymAct("YANCHAMU"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("YANCHAMU"), -701955499)
  WINDOW:Talk(SymAct("YANCHAMU"), -818793708)
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetFacialMotion()
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1219112923, PARTNER_1 = 1370562202})
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  TASK:Regist(subEveJumpSurprise, {
    CH("CHOBOMAKI")
  })
  CH("CHOBOMAKI"):SetManpu("MP_SHOCK_L")
  TASK:Sleep(TimeSec(0.1))
  CH("YANCHAMU"):SetManpu("MP_EXCLAMATION")
  WINDOW:DrawFace(324, 88, SymAct("CHOBOMAKI"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("CHOBOMAKI"), 713687713)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 865154016, PARTNER_1 = 414998563})
  WINDOW:SwitchTalk({PARTNER_0 = 27742562, PARTNER_1 = 1323747237})
  WINDOW:KeyWait()
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 20, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 1476261604, PARTNER_1 = 2094048551})
  TASK:WaitTask()
  CH("PARTNER"):ResetManpu()
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(SymPos("P04_PARTNER"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(SymPos("P04_HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):RunTo(SplinePath(SymPos("P04_PARTNER"), SymPos("P05_PARTNER")), Speed(3))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):RunTo(SplinePath(SymPos("P04_HERO"), SymPos("P05_HERO")), Speed(3))
  TASK:Sleep(TimeSec(1.5))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("YANCHAMU"):SetManpu("MP_FLY_SWEAT")
  TASK:Sleep(TimeSec(0.1))
  CH("CHOBOMAKI"):SetManpu("MP_FLY_SWEAT")
  TASK:Sleep(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_ookinakinoaruokade01_end()
end
function main03_ookinakinoaruokade02_init()
end
function main03_ookinakinoaruokade02_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_HAPPY"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH("PARTNER"):RunTo(SplinePath(SymPos("P00_PARTNER"), SymPos("P01_PARTNER"), SymPos("P02_PARTNER"), SymPos("P03_PARTNER")), Speed(3))
  CH("HERO"):RunTo(SplinePath(SymPos("P00_PARTNER"), SymPos("P01_PARTNER"), SymPos("P02_PARTNER"), SymPos("P03_PARTNER")), Speed(3))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 1707840614, PARTNER_1 = -497842007})
  TASK:Sleep(TimeSec(3))
  WINDOW:ForceCloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_ookinakinoaruokade02_end()
end
function main03_ookinakinoaruokade03_init()
end
function main03_ookinakinoaruokade03_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_HAPPY"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("PARTNER"):RunTo(SplinePath(SymPos("P00_PARTNER"), SymPos("P01_PARTNER"), SymPos("P02_PARTNER")), Speed(2.5))
  CH("HERO"):RunTo(SplinePath(SymPos("P00_PARTNER"), SymPos("P01_PARTNER"), SymPos("P02_HERO")), Speed(2.5))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(4))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SOUND:FadeInEnv(SymSnd("SE_ENV_BREEZE_LP"), TimeSec(2), Volume(190))
  SOUND:FadeOutBgm(TimeSec(3))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(272, 16, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -79119896, PARTNER_1 = 943697231})
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):WalkTo(SymPos("P03_PARTNER"), Speed(2))
  WINDOW:DrawFace(272, 16, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = 556047374, PARTNER_1 = 168415181})
  WINDOW:CloseMessage()
  CH("HERO"):WalkTo(SymPos("P03_HERO"), Speed(1.5))
  TASK:Sleep(TimeSec(0.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_ookinakinoaruokade03_end()
end
function main03_ookinakinoaruokade04_init()
end
function main03_ookinakinoaruokade04_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SOUND:PlayEnv(SymSnd("SE_ENV_BREEZE_LP"), Volume(190))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:MoveFollow2(SymCam("CAMERA_01"), Speed(3, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CAMERA:WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.EMOTION)
  WINDOW:Monologue(320011916)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1548970059, PARTNER_1 = 1162369290})
  WINDOW:SwitchTalk({PARTNER_0 = 1852115657, PARTNER_1 = 2004761480})
  WINDOW:SwitchTalk({PARTNER_0 = -253352121, PARTNER_1 = -369289722})
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_ookinakinoaruokade04_end()
end
function main03_ookinakinoaruokade05_init()
end
function main03_ookinakinoaruokade05_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SOUND:PlayEnv(SymSnd("SE_ENV_BREEZE_LP"), Volume(190))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -2138846678, PARTNER_1 = -1718027413})
  WINDOW:SwitchTalk({PARTNER_0 = -1296717656, PARTNER_1 = -1414620695})
  WINDOW:CloseMessage()
  SOUND:FadeOutEnv(TimeSec(1.5))
  subEveNod(CH("HERO"))
  TASK:Sleep(TimeSec(0.3))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_THEME_PARTNER_01"), Volume(256))
  CH("PARTNER"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):SetMotion(SymMot("EV003_RELAX00"), LOOP.OFF)
  CH("PARTNER"):WaitPlayMotion()
  CH("PARTNER"):SetMotion(SymMot("EV003_RELAX01"), LOOP.ON)
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -454095058, PARTNER_1 = -34324881})
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -690393684, PARTNER_1 = -809345811})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  CH("HERO"):SetMotion(SymMot("EV003_RELAX00"), LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(SymMot("EV003_RELAX01"), LOOP.ON)
  WINDOW:DrawFaceF(20, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(1213874210)
  WINDOW:Monologue(1363243363)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 492106387, PARTNER_1 = 72336338})
  subEveCloseMsg()
  WINDOW:DrawFaceF(20, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(794988561)
  subEveCloseMsg()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 913940816, PARTNER_1 = 2033727383})
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  CAMERA:ResetSisaRateVolume()
  CH("PARTNER"):ResetFacialMotion()
end
function main03_ookinakinoaruokade05_end()
end
function main03_ookinakinoaruokade06_init()
end
function main03_ookinakinoaruokade06_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SOUND:PlayBgm(SymSnd("BGM_EVE_THEME_PARTNER_01"), Volume(256))
  CAMERA:SetFovy(SymCam("CAMERA_02"))
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("HERO"):SetMotion(SymMot("EV003_RELAX01"), LOOP.ON, TimeSec(0))
  CH("PARTNER"):SetMotion(SymMot("EV003_RELAX01"), LOOP.ON, TimeSec(0))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1612908246, PARTNER_1 = 1259230485})
  WINDOW:SwitchTalk({PARTNER_0 = 1377133652, PARTNER_1 = -712148837})
  WINDOW:SwitchTalk({PARTNER_0 = -862565926, PARTNER_1 = -1511483914})
  WINDOW:SwitchTalk({PARTNER_0 = -1124883273, PARTNER_1 = -1746995340})
  WINDOW:SwitchTalk({PARTNER_0 = -1899641291, PARTNER_1 = -1048293134})
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(-660643405)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -206425488, PARTNER_1 = -358022351})
  WINDOW:SwitchTalk({PARTNER_0 = 1831935998, PARTNER_1 = 1948921535})
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_ookinakinoaruokade06_end()
end
function main03_ookinakinoaruokade07_init()
end
function main03_ookinakinoaruokade07_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SOUND:PlayBgm(SymSnd("BGM_EVE_THEME_PARTNER_01"), Volume(256))
  CAMERA:SetFovy(SymCam("CAMERA_00"))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("PIKACHUU2"):SetShadowOnlyMode(true)
  CH("PIKACHUU2"):SetVisible(false)
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
  CH("PIKACHUU_F_H"):SetVisible(false)
  CH("ACHAMO_F_H"):SetVisible(false)
  CH("HERO"):SetMotion(SymMot("EV003_RELAX01"), LOOP.ON, TimeSec(0))
  CH("PARTNER"):SetMotion(SymMot("EV003_RELAX01"), LOOP.ON, TimeSec(0))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -1218627048, PARTNER_1 = -1371141287})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("PARTNER"):SetMotion(SymMot("EV003_RELAX02"), LOOP.OFF)
  CH("PARTNER"):WaitPlayMotion()
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):SetNeckRot(RotateTarget(0), RotateTarget(30), RotateTarget(0), TimeSec(0.2))
  CH("PARTNER"):WaitNeckRot()
  local taskHero00 = function()
    CH("HERO"):SetMotion(SymMot("EV003_RELAX02"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):WaitRotate()
  end
  TASK:Regist(taskHero00)
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = -2056562534, PARTNER_1 = -1670354469})
  WINDOW:SwitchTalk({PARTNER_0 = -751698148, PARTNER_1 = -903164323})
  WINDOW:SwitchTalk({PARTNER_0 = -519594594, PARTNER_1 = -132338465})
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(2139402256)
  WINDOW:Monologue(1721729361)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.SAD)
  CH("PARTNER"):SetNeckRot(RotateTarget(0), RotateTarget(-30), RotateTarget(0), TimeSec(0.2))
  CH("PARTNER"):WaitNeckRot()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = 266427773, PARTNER_1 = 385510460})
  WINDOW:SwitchTalk({PARTNER_0 = 1037516799, PARTNER_1 = 617352894})
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("HERO"):SetManpu("MP_SHOCK_R")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(1804441721)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = 1922476344, PARTNER_1 = 1505491707})
  WINDOW:SwitchTalk({PARTNER_0 = 1084279738, PARTNER_1 = -952576139})
  WINDOW:SwitchTalk({PARTNER_0 = -568072652, PARTNER_1 = 1468157227})
  WINDOW:SwitchTalk({PARTNER_0 = 1318681706, PARTNER_1 = 1706307497})
  WINDOW:SwitchTalk({PARTNER_0 = 2091851496, PARTNER_1 = 871270447})
  WINDOW:SwitchTalk({PARTNER_0 = 720746862, PARTNER_1 = 30993069})
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("PARTNER"):ResetNeckRot(TimeSec(0.2))
  CH("PARTNER"):WaitNeckRot()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.SAD)
  WINDOW:SwitchTalk({PARTNER_0 = 415489004, PARTNER_1 = -1621375197})
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.CATCHBREATH)
  WINDOW:Monologue(-2042562974)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  CH("PARTNER"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("HERO"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):SetNeckRot(RotateTarget(0), RotateTarget(30), RotateTarget(0), TimeSec(0.2))
  CH("PARTNER"):WaitNeckRot()
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = -281138610, PARTNER_1 = -165340401})
  WINDOW:KeyWait()
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:SwitchTalk({PARTNER_0 = -586659636, PARTNER_1 = -1005356659})
  WINDOW:CloseMessage()
  CH("HERO"):SetVisible(false)
  CH("HERO"):SetDir(RotateTarget(180))
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SLEEP)
  CH("HERO"):SetMotion(SymMot("EV003_RELAX03"), LOOP.ON, TimeSec(0))
  CH("PARTNER"):SetVisible(false)
  local pokemonIndexPartner = SymAct("PARTNER"):GetIndex()
  if pokemonIndexPartner == 30 then
    if SYSTEM:IsPartnerFemale() then
      CH("PIKACHUU_F_H"):SetVisible(true)
      CH("PIKACHUU_F_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
    else
      CH("PIKACHUU_H"):SetVisible(true)
      CH("PIKACHUU_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
    end
  elseif pokemonIndexPartner == 595 then
    CH("POKABU_H"):SetVisible(true)
    CH("POKABU_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 598 then
    CH("MIJUMARU_H"):SetVisible(true)
    CH("MIJUMARU_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 592 then
    CH("TSUTAAJA_H"):SetVisible(true)
    CH("TSUTAAJA_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 1 then
    CH("FUSHIGIDANE_H"):SetVisible(true)
    CH("FUSHIGIDANE_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 5 then
    CH("HITOKAGE_H"):SetVisible(true)
    CH("HITOKAGE_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 10 then
    CH("ZENIGAME_H"):SetVisible(true)
    CH("ZENIGAME_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 197 then
    CH("CHIKORIITA_H"):SetVisible(true)
    CH("CHIKORIITA_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 200 then
    CH("HINOARASHI_H"):SetVisible(true)
    CH("HINOARASHI_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 203 then
    CH("WANINOKO_H"):SetVisible(true)
    CH("WANINOKO_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 322 then
    CH("KIMORI_H"):SetVisible(true)
    CH("KIMORI_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 325 then
    if SYSTEM:IsPartnerFemale() then
      CH("ACHAMO_F_H"):SetVisible(true)
      CH("ACHAMO_F_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
    else
      CH("ACHAMO_H"):SetVisible(true)
      CH("ACHAMO_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
    end
  elseif pokemonIndexPartner == 329 then
    CH("MIZUGOROU_H"):SetVisible(true)
    CH("MIZUGOROU_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 479 then
    CH("NAETORU_H"):SetVisible(true)
    CH("NAETORU_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 482 then
    CH("HIKOZARU_H"):SetVisible(true)
    CH("HIKOZARU_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 485 then
    CH("POTCHAMA_H"):SetVisible(true)
    CH("POTCHAMA_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 537 then
    CH("RIORU_H"):SetVisible(true)
    CH("RIORU_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 766 then
    CH("HARIMARON_H"):SetVisible(true)
    CH("HARIMARON_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 769 then
    CH("FOKKO_H"):SetVisible(true)
    CH("FOKKO_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  elseif pokemonIndexPartner == 772 then
    CH("KEROMATSU_H"):SetVisible(true)
    CH("KEROMATSU_H"):SetFacialMotion(FACIAL_MOTION.ANGRY)
  end
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  if pokemonIndexPartner == 30 then
    if SYSTEM:IsPartnerFemale() then
      TASK:Regist(subEveDoubleJump, {
        CH("PIKACHUU_F_H")
      })
    else
      TASK:Regist(subEveDoubleJump, {
        CH("PIKACHUU_H")
      })
    end
  elseif pokemonIndexPartner == 595 then
    TASK:Regist(subEveDoubleJump, {
      CH("POKABU_H")
    })
  elseif pokemonIndexPartner == 598 then
    TASK:Regist(subEveDoubleJump, {
      CH("MIJUMARU_H")
    })
  elseif pokemonIndexPartner == 592 then
    TASK:Regist(subEveDoubleJump, {
      CH("TSUTAAJA_H")
    })
  elseif pokemonIndexPartner == 1 then
    TASK:Regist(subEveDoubleJump, {
      CH("FUSHIGIDANE_H")
    })
  elseif pokemonIndexPartner == 5 then
    TASK:Regist(subEveDoubleJump, {
      CH("HITOKAGE_H")
    })
  elseif pokemonIndexPartner == 10 then
    TASK:Regist(subEveDoubleJump, {
      CH("ZENIGAME_H")
    })
  elseif pokemonIndexPartner == 197 then
    TASK:Regist(subEveDoubleJump, {
      CH("CHIKORIITA_H")
    })
  elseif pokemonIndexPartner == 200 then
    TASK:Regist(subEveDoubleJump, {
      CH("HINOARASHI_H")
    })
  elseif pokemonIndexPartner == 203 then
    TASK:Regist(subEveDoubleJump, {
      CH("WANINOKO_H")
    })
  elseif pokemonIndexPartner == 322 then
    TASK:Regist(subEveDoubleJump, {
      CH("KIMORI_H")
    })
  elseif pokemonIndexPartner == 325 then
    if SYSTEM:IsPartnerFemale() then
      TASK:Regist(subEveDoubleJump, {
        CH("ACHAMO_F_H")
      })
    else
      TASK:Regist(subEveDoubleJump, {
        CH("ACHAMO_H")
      })
    end
  elseif pokemonIndexPartner == 329 then
    TASK:Regist(subEveDoubleJump, {
      CH("MIZUGOROU_H")
    })
  elseif pokemonIndexPartner == 479 then
    TASK:Regist(subEveDoubleJump, {
      CH("NAETORU_H")
    })
  elseif pokemonIndexPartner == 482 then
    TASK:Regist(subEveDoubleJump, {
      CH("HIKOZARU_H")
    })
  elseif pokemonIndexPartner == 485 then
    TASK:Regist(subEveDoubleJump, {
      CH("POTCHAMA_H")
    })
  elseif pokemonIndexPartner == 537 then
    TASK:Regist(subEveDoubleJump, {
      CH("RIORU_H")
    })
  elseif pokemonIndexPartner == 766 then
    TASK:Regist(subEveDoubleJump, {
      CH("HARIMARON_H")
    })
  elseif pokemonIndexPartner == 769 then
    TASK:Regist(subEveDoubleJump, {
      CH("FOKKO_H")
    })
  elseif pokemonIndexPartner == 772 then
    TASK:Regist(subEveDoubleJump, {
      CH("KEROMATSU_H")
    })
  end
  WINDOW:SwitchTalk({PARTNER_0 = -1957499062, PARTNER_1 = -1840652789})
  WINDOW:KeyWait()
  if pokemonIndexPartner == 30 then
    if SYSTEM:IsPartnerFemale() then
      TASK:Regist(subEveDoubleJump, {
        CH("PIKACHUU_F_H")
      })
    else
      TASK:Regist(subEveDoubleJump, {
        CH("PIKACHUU_H")
      })
    end
  elseif pokemonIndexPartner == 595 then
    TASK:Regist(subEveDoubleJump, {
      CH("POKABU_H")
    })
  elseif pokemonIndexPartner == 598 then
    TASK:Regist(subEveDoubleJump, {
      CH("MIJUMARU_H")
    })
  elseif pokemonIndexPartner == 592 then
    TASK:Regist(subEveDoubleJump, {
      CH("TSUTAAJA_H")
    })
  elseif pokemonIndexPartner == 1 then
    TASK:Regist(subEveDoubleJump, {
      CH("FUSHIGIDANE_H")
    })
  elseif pokemonIndexPartner == 5 then
    TASK:Regist(subEveDoubleJump, {
      CH("HITOKAGE_H")
    })
  elseif pokemonIndexPartner == 10 then
    TASK:Regist(subEveDoubleJump, {
      CH("ZENIGAME_H")
    })
  elseif pokemonIndexPartner == 197 then
    TASK:Regist(subEveDoubleJump, {
      CH("CHIKORIITA_H")
    })
  elseif pokemonIndexPartner == 200 then
    TASK:Regist(subEveDoubleJump, {
      CH("HINOARASHI_H")
    })
  elseif pokemonIndexPartner == 203 then
    TASK:Regist(subEveDoubleJump, {
      CH("WANINOKO_H")
    })
  elseif pokemonIndexPartner == 322 then
    TASK:Regist(subEveDoubleJump, {
      CH("KIMORI_H")
    })
  elseif pokemonIndexPartner == 325 then
    if SYSTEM:IsPartnerFemale() then
      TASK:Regist(subEveDoubleJump, {
        CH("ACHAMO_F_H")
      })
    else
      TASK:Regist(subEveDoubleJump, {
        CH("ACHAMO_H")
      })
    end
  elseif pokemonIndexPartner == 329 then
    TASK:Regist(subEveDoubleJump, {
      CH("MIZUGOROU_H")
    })
  elseif pokemonIndexPartner == 479 then
    TASK:Regist(subEveDoubleJump, {
      CH("NAETORU_H")
    })
  elseif pokemonIndexPartner == 482 then
    TASK:Regist(subEveDoubleJump, {
      CH("HIKOZARU_H")
    })
  elseif pokemonIndexPartner == 485 then
    TASK:Regist(subEveDoubleJump, {
      CH("POTCHAMA_H")
    })
  elseif pokemonIndexPartner == 537 then
    TASK:Regist(subEveDoubleJump, {
      CH("RIORU_H")
    })
  elseif pokemonIndexPartner == 766 then
    TASK:Regist(subEveDoubleJump, {
      CH("HARIMARON_H")
    })
  elseif pokemonIndexPartner == 769 then
    TASK:Regist(subEveDoubleJump, {
      CH("FOKKO_H")
    })
  elseif pokemonIndexPartner == 772 then
    TASK:Regist(subEveDoubleJump, {
      CH("KEROMATSU_H")
    })
  end
  WINDOW:SwitchTalk({PARTNER_0 = -1184592440, PARTNER_1 = -1602241399})
  WINDOW:CloseMessage()
  if pokemonIndexPartner == 30 then
    if SYSTEM:IsPartnerFemale() then
      TASK:Regist(subEveDoubleJump, {
        CH("PIKACHUU_F_H")
      })
      CH("PIKACHUU_F_H"):ResetNeckRot(TimeSec(0.1))
      CH("PIKACHUU_F_H"):WaitNeckRot()
      CH("PIKACHUU_F_H"):ResetFacialMotion()
      CH("PIKACHUU_F_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
      CH("PIKACHUU_F_H"):WaitRotate()
    else
      TASK:Regist(subEveDoubleJump, {
        CH("PIKACHUU_H")
      })
      CH("PIKACHUU_H"):ResetNeckRot(TimeSec(0.1))
      CH("PIKACHUU_H"):WaitNeckRot()
      CH("PIKACHUU_H"):ResetFacialMotion()
      CH("PIKACHUU_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
      CH("PIKACHUU_H"):WaitRotate()
    end
  elseif pokemonIndexPartner == 595 then
    TASK:Regist(subEveDoubleJump, {
      CH("POKABU_H")
    })
    CH("POKABU_H"):ResetNeckRot(TimeSec(0.1))
    CH("POKABU_H"):WaitNeckRot()
    CH("POKABU_H"):ResetFacialMotion()
    CH("POKABU_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("POKABU_H"):WaitRotate()
  elseif pokemonIndexPartner == 598 then
    TASK:Regist(subEveDoubleJump, {
      CH("MIJUMARU_H")
    })
    CH("MIJUMARU_H"):ResetNeckRot(TimeSec(0.1))
    CH("MIJUMARU_H"):WaitNeckRot()
    CH("MIJUMARU_H"):ResetFacialMotion()
    CH("MIJUMARU_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("MIJUMARU_H"):WaitRotate()
  elseif pokemonIndexPartner == 592 then
    TASK:Regist(subEveDoubleJump, {
      CH("TSUTAAJA_H")
    })
    CH("TSUTAAJA_H"):ResetNeckRot(TimeSec(0.1))
    CH("TSUTAAJA_H"):WaitNeckRot()
    CH("TSUTAAJA_H"):ResetFacialMotion()
    CH("TSUTAAJA_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("TSUTAAJA_H"):WaitRotate()
  elseif pokemonIndexPartner == 1 then
    TASK:Regist(subEveDoubleJump, {
      CH("FUSHIGIDANE_H")
    })
    CH("FUSHIGIDANE_H"):ResetNeckRot(TimeSec(0.1))
    CH("FUSHIGIDANE_H"):WaitNeckRot()
    CH("FUSHIGIDANE_H"):ResetFacialMotion()
    CH("FUSHIGIDANE_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("FUSHIGIDANE_H"):WaitRotate()
  elseif pokemonIndexPartner == 5 then
    TASK:Regist(subEveDoubleJump, {
      CH("HITOKAGE_H")
    })
    CH("HITOKAGE_H"):ResetNeckRot(TimeSec(0.1))
    CH("HITOKAGE_H"):WaitNeckRot()
    CH("HITOKAGE_H"):ResetFacialMotion()
    CH("HITOKAGE_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("HITOKAGE_H"):WaitRotate()
  elseif pokemonIndexPartner == 10 then
    TASK:Regist(subEveDoubleJump, {
      CH("ZENIGAME_H")
    })
    CH("ZENIGAME_H"):ResetNeckRot(TimeSec(0.1))
    CH("ZENIGAME_H"):WaitNeckRot()
    CH("ZENIGAME_H"):ResetFacialMotion()
    CH("ZENIGAME_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("ZENIGAME_H"):WaitRotate()
  elseif pokemonIndexPartner == 197 then
    TASK:Regist(subEveDoubleJump, {
      CH("CHIKORIITA_H")
    })
    CH("CHIKORIITA_H"):ResetNeckRot(TimeSec(0.1))
    CH("CHIKORIITA_H"):WaitNeckRot()
    CH("CHIKORIITA_H"):ResetFacialMotion()
    CH("CHIKORIITA_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("CHIKORIITA_H"):WaitRotate()
  elseif pokemonIndexPartner == 200 then
    TASK:Regist(subEveDoubleJump, {
      CH("HINOARASHI_H")
    })
    CH("HINOARASHI_H"):ResetNeckRot(TimeSec(0.1))
    CH("HINOARASHI_H"):WaitNeckRot()
    CH("HINOARASHI_H"):ResetFacialMotion()
    CH("HINOARASHI_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("HINOARASHI_H"):WaitRotate()
  elseif pokemonIndexPartner == 203 then
    TASK:Regist(subEveDoubleJump, {
      CH("WANINOKO_H")
    })
    CH("WANINOKO_H"):ResetNeckRot(TimeSec(0.1))
    CH("WANINOKO_H"):WaitNeckRot()
    CH("WANINOKO_H"):ResetFacialMotion()
    CH("WANINOKO_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("WANINOKO_H"):WaitRotate()
  elseif pokemonIndexPartner == 322 then
    TASK:Regist(subEveDoubleJump, {
      CH("KIMORI_H")
    })
    CH("KIMORI_H"):ResetNeckRot(TimeSec(0.1))
    CH("KIMORI_H"):WaitNeckRot()
    CH("KIMORI_H"):ResetFacialMotion()
    CH("KIMORI_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("KIMORI_H"):WaitRotate()
  elseif pokemonIndexPartner == 325 then
    if SYSTEM:IsPartnerFemale() then
      TASK:Regist(subEveDoubleJump, {
        CH("ACHAMO_F_H")
      })
      CH("ACHAMO_F_H"):ResetNeckRot(TimeSec(0.1))
      CH("ACHAMO_F_H"):WaitNeckRot()
      CH("ACHAMO_F_H"):ResetFacialMotion()
      CH("ACHAMO_F_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
      CH("ACHAMO_F_H"):WaitRotate()
    else
      TASK:Regist(subEveDoubleJump, {
        CH("ACHAMO_H")
      })
      CH("ACHAMO_H"):ResetNeckRot(TimeSec(0.1))
      CH("ACHAMO_H"):WaitNeckRot()
      CH("ACHAMO_H"):ResetFacialMotion()
      CH("ACHAMO_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
      CH("ACHAMO_H"):WaitRotate()
    end
  elseif pokemonIndexPartner == 329 then
    TASK:Regist(subEveDoubleJump, {
      CH("MIZUGOROU_H")
    })
    CH("MIZUGOROU_H"):ResetNeckRot(TimeSec(0.1))
    CH("MIZUGOROU_H"):WaitNeckRot()
    CH("MIZUGOROU_H"):ResetFacialMotion()
    CH("MIZUGOROU_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("MIZUGOROU_H"):WaitRotate()
  elseif pokemonIndexPartner == 479 then
    TASK:Regist(subEveDoubleJump, {
      CH("NAETORU_H")
    })
    CH("NAETORU_H"):ResetNeckRot(TimeSec(0.1))
    CH("NAETORU_H"):WaitNeckRot()
    CH("NAETORU_H"):ResetFacialMotion()
    CH("NAETORU_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("NAETORU_H"):WaitRotate()
  elseif pokemonIndexPartner == 482 then
    TASK:Regist(subEveDoubleJump, {
      CH("HIKOZARU_H")
    })
    CH("HIKOZARU_H"):ResetNeckRot(TimeSec(0.1))
    CH("HIKOZARU_H"):WaitNeckRot()
    CH("HIKOZARU_H"):ResetFacialMotion()
    CH("HIKOZARU_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("HIKOZARU_H"):WaitRotate()
  elseif pokemonIndexPartner == 485 then
    TASK:Regist(subEveDoubleJump, {
      CH("POTCHAMA_H")
    })
    CH("POTCHAMA_H"):ResetNeckRot(TimeSec(0.1))
    CH("POTCHAMA_H"):WaitNeckRot()
    CH("POTCHAMA_H"):ResetFacialMotion()
    CH("POTCHAMA_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("POTCHAMA_H"):WaitRotate()
  elseif pokemonIndexPartner == 537 then
    TASK:Regist(subEveDoubleJump, {
      CH("RIORU_H")
    })
    CH("RIORU_H"):ResetNeckRot(TimeSec(0.1))
    CH("RIORU_H"):WaitNeckRot()
    CH("RIORU_H"):ResetFacialMotion()
    CH("RIORU_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("RIORU_H"):WaitRotate()
  elseif pokemonIndexPartner == 766 then
    TASK:Regist(subEveDoubleJump, {
      CH("HARIMARON_H")
    })
    CH("HARIMARON_H"):ResetNeckRot(TimeSec(0.1))
    CH("HARIMARON_H"):WaitNeckRot()
    CH("HARIMARON_H"):ResetFacialMotion()
    CH("HARIMARON_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("HARIMARON_H"):WaitRotate()
  elseif pokemonIndexPartner == 769 then
    TASK:Regist(subEveDoubleJump, {
      CH("FOKKO_H")
    })
    CH("FOKKO_H"):ResetNeckRot(TimeSec(0.1))
    CH("FOKKO_H"):WaitNeckRot()
    CH("FOKKO_H"):ResetFacialMotion()
    CH("FOKKO_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("FOKKO_H"):WaitRotate()
  elseif pokemonIndexPartner == 772 then
    TASK:Regist(subEveDoubleJump, {
      CH("KEROMATSU_H")
    })
    CH("KEROMATSU_H"):ResetNeckRot(TimeSec(0.1))
    CH("KEROMATSU_H"):WaitNeckRot()
    CH("KEROMATSU_H"):ResetFacialMotion()
    CH("KEROMATSU_H"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("KEROMATSU_H"):WaitRotate()
  end
  WINDOW:SwitchTalk({PARTNER_0 = 669491270, PARTNER_1 = 1056739591})
  WINDOW:CloseMessage()
  if pokemonIndexPartner == 30 then
    if SYSTEM:IsPartnerFemale() then
      CH("PIKACHUU_F_H"):SetVisible(false)
    else
      CH("PIKACHUU_H"):SetVisible(false)
    end
  elseif pokemonIndexPartner == 595 then
    CH("POKABU_H"):SetVisible(false)
  elseif pokemonIndexPartner == 598 then
    CH("MIJUMARU_H"):SetVisible(false)
  elseif pokemonIndexPartner == 592 then
    CH("TSUTAAJA_H"):SetVisible(false)
  elseif pokemonIndexPartner == 1 then
    CH("FUSHIGIDANE_H"):SetVisible(false)
  elseif pokemonIndexPartner == 5 then
    CH("HITOKAGE_H"):SetVisible(false)
  elseif pokemonIndexPartner == 10 then
    CH("ZENIGAME_H"):SetVisible(false)
  elseif pokemonIndexPartner == 197 then
    CH("CHIKORIITA_H"):SetVisible(false)
  elseif pokemonIndexPartner == 200 then
    CH("HINOARASHI_H"):SetVisible(false)
  elseif pokemonIndexPartner == 203 then
    CH("WANINOKO_H"):SetVisible(false)
  elseif pokemonIndexPartner == 322 then
    CH("KIMORI_H"):SetVisible(false)
  elseif pokemonIndexPartner == 325 then
    if SYSTEM:IsPartnerFemale() then
      CH("ACHAMO_F_H"):SetVisible(false)
    else
      CH("ACHAMO_H"):SetVisible(false)
    end
  elseif pokemonIndexPartner == 329 then
    CH("MIZUGOROU_H"):SetVisible(false)
  elseif pokemonIndexPartner == 479 then
    CH("NAETORU_H"):SetVisible(false)
  elseif pokemonIndexPartner == 482 then
    CH("HIKOZARU_H"):SetVisible(false)
  elseif pokemonIndexPartner == 485 then
    CH("POTCHAMA_H"):SetVisible(false)
  elseif pokemonIndexPartner == 537 then
    CH("RIORU_H"):SetVisible(false)
  elseif pokemonIndexPartner == 766 then
    CH("HARIMARON_H"):SetVisible(false)
  elseif pokemonIndexPartner == 769 then
    CH("FOKKO_H"):SetVisible(false)
  elseif pokemonIndexPartner == 772 then
    CH("KEROMATSU_H"):SetVisible(false)
  end
  CH("PARTNER"):SetVisible(true)
  CH("PARTNER"):ResetNeckRot(TimeSec(0))
  CH("PARTNER"):ResetFacialMotion()
  CH("PARTNER"):SetDir(CH("HERO"))
  CH("HERO"):SetVisible(true)
  CH("PIKACHUU2"):SetVisible(true)
  CH("HERO"):SetShadow(false)
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Sleep(TimeSec(0.3))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_QUESTION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -947002878, PARTNER_1 = -560540861})
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = -172261248, PARTNER_1 = -325013055})
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1545525498, PARTNER_1 = -1158015417})
  WINDOW:CloseMessage()
  CH("PARTNER"):WalkTo(SymPos("P00_PARTNER"), Speed(1))
  CH("PARTNER"):WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1848162940, PARTNER_1 = -1999866683})
  WINDOW:KeyWait()
  CH("PARTNER"):SetMotion(SymMot("PUSH"), LOOP.ON)
  CH("HERO"):SetMotion(SymMot("EV003_RELAX04"), LOOP.ON)
  WINDOW:SwitchTalk({PARTNER_0 = 257189898, PARTNER_1 = 374298955})
  WINDOW:CloseMessage()
  CH("HERO"):SetMotion(SymMot("EV003_RELAX03"), LOOP.ON)
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.3))
  CH("PARTNER"):WalkTo(SymPos("P01_PARTNER"), Speed(1.5), LINK_DIR.OFF)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  CH("HERO"):WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = 2133951847, PARTNER_1 = 1714074662})
  WINDOW:KeyWait()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 1292363749, PARTNER_1 = 1411176100})
  TASK:WaitTask()
  CH("PARTNER"):ResetManpu()
  WINDOW:CloseMessage()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetFovy(SymCam("CAMERA_05"))
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("PARTNER"):ResetFacialMotion()
  CH("PARTNER"):DirTo(RotateTarget(180), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.EMOTION)
  WINDOW:SwitchTalk({PARTNER_0 = 459096163, PARTNER_1 = 38170914})
  WINDOW:KeyWait()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH("PARTNER"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 694887137, PARTNER_1 = 812651424})
  CH("PARTNER"):WaitPlayMotion()
  CH("PARTNER"):SetManpu("MP_SPREE_LP")
  CH("PARTNER"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  CH("PARTNER"):SetMotionRaito(Raito(2))
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  CAMERA:ResetSisaRateVolume()
  CH("PARTNER"):ResetManpu()
end
function main03_ookinakinoaruokade07_end()
end
function main03_ookinakinoaruokade08_init()
end
function main03_ookinakinoaruokade08_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetFovy(SymCam("CAMERA_00"))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SLEEP)
  CH("HERO"):SetMotion(SymMot("EV003_RELAX03"), LOOP.ON, TimeSec(0))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:SwitchTalk({PARTNER_0 = -1209528465, PARTNER_1 = -1359790546})
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(2), true)
  TASK:Sleep(TimeSec(2))
end
function main03_ookinakinoaruokade08_end()
end
function main03_ookinakinoaruokade09_init()
end
function main03_ookinakinoaruokade09_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(1), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_ookinakinoaruokade09_end()
end
function main03_ookinakinoaruokade10_init()
end
function main03_ookinakinoaruokade10_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main03_ookinakinoaruokade10_end()
end
function main03_ookinakinoaruokade11_init()
end
function main03_ookinakinoaruokade11_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(1))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.3))
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(1837378185)
  WINDOW:Monologue(1956584392)
  WINDOW:Monologue(1605519371)
  WINDOW:Monologue(1185511754)
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(RotateTarget(-150), Speed(200), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1.5))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("HERO"):SetNeckRot(RotateTarget(0), RotateTarget(30), RotateTarget(0), TimeSec(0.5))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(166260621)
  WINDOW:Monologue(284417740)
  WINDOW:Monologue(1004440847)
  WINDOW:Monologue(583384142)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(1), true)
  TASK:Sleep(TimeSec(0.5))
end
function main03_ookinakinoaruokade11_end()
end
function main03_ookinakinoaruokade12_init()
end
function main03_ookinakinoaruokade12_start()
  CH("REKKUUZA"):SetShadow(false)
  CUT:Load(SymCut("m03_160_12"))
  SOUND:PlaySe(SymSnd("SE_EVT_REKKUUZA_NEARMISS_02"))
  CUT:Play()
  CUT:Wait()
  SOUND:FadeInEnv(SymSnd("SE_EVT_EARTHQUAKE_L_LP"), TimeSec(0.5), Volume(190))
  CUT:Destroy()
  TASK:Sleep(TimeSec(0.5))
end
function main03_ookinakinoaruokade12_end()
end
function main03_ookinakinoaruokade13_init()
end
function main03_ookinakinoaruokade13_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(0.5))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CAMERA:SetFovy(SymCam("CAMERA_02"))
  CAMERA:SetRotateZ(SymCam("CAMERA_02"))
  CH("REKKUUZA"):SetMotion(SymMot("EV001_FLY01"), LOOP.ON, TimeSec(0))
  CH("REKKUUZA"):SetShadow(false)
  EFFECT:Create("effectFrictionLp", SymEff("EV_FRICTION_LP"))
  EFFECT:SetPosition("effectFrictionLp", SymPos("P00_EFF_EV_FRICTION_LP"))
  EFFECT:SetDir("effectFrictionLp", RotateTarget(180))
  EFFECT:SetScale("effectFrictionLp", Scale(0.8))
  EFFECT:Play("effectFrictionLp")
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  WINDOW:Talk(SymAct("REKKUUZA"), -1520590719)
  WINDOW:Talk(SymAct("REKKUUZA"), -1136225856)
  WINDOW:Talk(SymAct("REKKUUZA"), -717730324)
  WINDOW:Talk(SymAct("REKKUUZA"), -870089555)
  WINDOW:CloseMessage()
  SOUND:FadeOutEnv(TimeSec(0.2))
  SCREEN_A:FadeOut(TimeSec(0), true)
  CAMERA:SetRotateZ(Degree(0))
  EFFECT:Remove("effectFrictionLp")
  WINDOW:Explanation(-418500754)
  WINDOW:Explanation(-32170449)
  WINDOW:CloseMessage()
  TASK:Sleep(TimeSec(0.5))
  CAMERA:ResetSisaRateVolume()
end
function main03_ookinakinoaruokade13_end()
end
function groundEnd()
end

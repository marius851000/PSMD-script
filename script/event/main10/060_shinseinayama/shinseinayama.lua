dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main10_shinseinayama01_init()
end
function main10_shinseinayama01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  local taskAbagoora00 = function()
    CH("ABAGOORA"):WalkTo(SymPos("P00_ABAGOORA"), Speed(1))
    CH("ABAGOORA"):WaitMove()
    CH("ABAGOORA"):SetManpu("MP_NOTICE_L")
    CH("ABAGOORA"):WaitManpu()
    TASK:Sleep(TimeSec(0.2))
    CH("ABAGOORA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("ABAGOORA"):WaitRotate()
  end
  TASK:Regist(Group("grpAbagoora"), taskAbagoora00)
  local taskHero00 = function()
    CH("HERO"):RunTo(SymPos("P00_HERO"), Speed(2))
    CH("HERO"):WaitMove()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
    CH("HERO"):SetManpu("MP_NOTICE_L")
    CH("HERO"):WaitManpu()
    CH("HERO"):DirTo(CH("ABAGOORA"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):WaitRotate()
  end
  TASK:Regist(taskHero00)
  local taskPartner00 = function()
    CH("PARTNER"):RunTo(SymPos("P00_PARTNER"), Speed(2))
    CH("PARTNER"):WaitMove()
    CH("PARTNER"):SetManpu("MP_EXCLAMATION")
    CH("PARTNER"):WaitManpu()
  end
  TASK:Regist(Group("grpPartner"), taskPartner00)
  SOUND:PlayBgm(SymSnd("BGM_EVE_KONOHANANOIE"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:WaitTask(Group("grpPartner"))
  WINDOW:DrawFace(324, 20, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1346990523, PARTNER_1 = -1230127356})
  TASK:WaitTask(Group("grpAbagoora"))
  subEveCloseMsg()
  WINDOW:DrawFace(20, 20, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), -1652495161)
  WINDOW:Talk(SymAct("ABAGOORA"), -2070159994)
  WINDOW:CloseMessage()
  local taskHero01 = function()
    CH("HERO"):RunTo(SymPos("P01_HERO"), Speed(2))
    CH("HERO"):WaitMove()
    CH("HERO"):DirTo(CH("ABAGOORA"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):WaitRotate()
  end
  local taskPartner01 = function()
    CH("PARTNER"):RunTo(SplinePath(SymPos("P01_PARTNER"), SymPos("P02_PARTNER")), Speed(2))
    CH("PARTNER"):WaitMove()
    CH("PARTNER"):DirTo(CH("ABAGOORA"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):WaitRotate()
  end
  TASK:Regist(taskHero01)
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(Group("grpPartner"), taskPartner01)
  TASK:Sleep(TimeSec(0.5))
  CH("ABAGOORA"):DirTo(SymPos("P02_PARTNER"), Speed(60), ROT_TYPE.NEAR)
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:WaitTask(Group("grpPartner"))
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -874886335, PARTNER_1 = -759072256})
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("ABAGOORA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("ABAGOORA"), -101963325)
  WINDOW:Talk(SymAct("ABAGOORA"), -520677246)
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_L")
  TASK:Regist(subEveJumpSurprise, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 1735328845, PARTNER_1 = 2121544972})
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("ABAGOORA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("ABAGOORA"), -1590822472)
  subEveCloseMsg()
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1204369159, PARTNER_1 = -1826907334})
  WINDOW:KeyWait()
  CH("PARTNER"):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = -1979667845, PARTNER_1 = -985580356})
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetManpu()
  subEveNod(CH("ABAGOORA"))
  WINDOW:DrawFace(72, 16, SymAct("ABAGOORA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("ABAGOORA"), -598077955)
  WINDOW:CloseMessage()
  CH("ABAGOORA"):DirTo(SymPos("P01_ABAGOORA"), Speed(350), ROT_TYPE.NEAR)
  CH("ABAGOORA"):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_EXCLAMATION")
  TASK:Regist(subEveJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = -143172034, PARTNER_1 = -294883457})
  WINDOW:CloseMessage()
  CH("ABAGOORA"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.LEFT)
  CH("ABAGOORA"):WaitRotate()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("ABAGOORA"):SetManpu("MP_QUESTION")
  CH("ABAGOORA"):WaitManpu()
  WINDOW:DrawFace(72, 16, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), 1777628080)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = 1894728433, PARTNER_1 = -1281862058})
  WINDOW:SwitchTalk({PARTNER_0 = -1434228969, PARTNER_1 = -2119289644})
  subEveCloseMsg()
  CH("HERO"):DirTo(CH("ABAGOORA"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(72, 16, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), -1732967019)
  WINDOW:Talk(SymAct("ABAGOORA"), -671837358)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -823156205, PARTNER_1 = -440208944})
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), -52838255)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_L")
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 2067913822, PARTNER_1 = 1650126111})
  WINDOW:SwitchTalk({PARTNER_0 = 186921267, PARTNER_1 = 306118770})
  subEveCloseMsg()
  WINDOW:DrawFace(72, 16, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), 957502385)
  WINDOW:Talk(SymAct("ABAGOORA"), 537486064)
  WINDOW:Talk(SymAct("ABAGOORA"), 1867052087)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("ABAGOORA"):SetManpu("MP_EXCLAMATION")
  CH("ABAGOORA"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("ABAGOORA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("ABAGOORA"), 1985201526)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.CATCHBREATH)
  WINDOW:SwitchTalk({PARTNER_0 = 1568577205, PARTNER_1 = 1147512820})
  WINDOW:SwitchTalk({PARTNER_0 = -1006781637, PARTNER_1 = -622425478})
  WINDOW:SwitchTalk({PARTNER_0 = -1762457206, PARTNER_1 = -1880606517})
  subEveCloseMsg()
  WINDOW:DrawFace(20, 20, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), -1530565880)
  WINDOW:Talk(SymAct("ABAGOORA"), -1109501367)
  WINDOW:CloseMessage()
  local taskHero02 = function()
    subEveNodDouble(CH("HERO"))
  end
  local taskPartner02 = function()
    subEveNodDouble(CH("PARTNER"))
  end
  TASK:Regist(taskHero02)
  TASK:Regist(taskPartner02)
  TASK:Sleep(TimeSec(1.2))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(72, 16, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), -224408434)
  WINDOW:CloseMessage()
  CH("ABAGOORA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("ABAGOORA"):WaitRotate()
  WINDOW:DrawFace(72, 16, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), -343605809)
  WINDOW:CloseMessage()
  TASK:Sleep(TimeSec(0.2))
  subEveNod(CH("HERO"))
  TASK:Sleep(TimeSec(0.2))
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(324, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = -1062621684, PARTNER_1 = -642605235})
  WINDOW:CloseMessage()
  local taskAbagoora01 = function()
    CH("ABAGOORA"):DirTo(SymPos("P01_ABAGOORA"), Speed(350), ROT_TYPE.NEAR)
    CH("ABAGOORA"):WaitRotate()
    CH("ABAGOORA"):WalkTo(SplinePath(SymPos("P01_ABAGOORA"), SymPos("P02_ABAGOORA"), SymPos("P03_ABAGOORA")), Speed(1.5))
    TASK:Sleep(TimeSec(0.5))
    CH("ABAGOORA"):SetManpu("MP_LAUGH_LP")
  end
  local taskHero03 = function()
    TASK:Sleep(TimeSec(0.7))
    CH("HERO"):WalkTo(SplinePath(SymPos("P02_HERO"), SymPos("P03_HERO"), SymPos("P04_HERO")), Speed(1.5))
    TASK:Sleep(TimeSec(0.3))
    CH("HERO"):SetManpu("MP_LAUGH_LP")
  end
  local taskPartner03 = function()
    TASK:Sleep(TimeSec(0.5))
    CH("PARTNER"):SetManpu("MP_SPREE_LP")
    CH("PARTNER"):WalkTo(SplinePath(SymPos("P03_PARTNER"), SymPos("P04_PARTNER"), SymPos("P05_PARTNER")), Speed(1.5))
  end
  TASK:Regist(taskAbagoora01)
  TASK:Regist(taskHero03)
  TASK:Regist(taskPartner03)
  TASK:Sleep(TimeSec(1.5))
  SOUND:FadeOutBgm(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(1), true)
  TASK:Sleep(TimeSec(2))
end
function main10_shinseinayama01_end()
end
function groundEnd()
end
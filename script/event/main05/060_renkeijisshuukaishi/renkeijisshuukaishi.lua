dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main05_renkeijisshuukaishi01_init()
end
function main05_renkeijisshuukaishi01_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_GAKKOU_03"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(1))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("MIRUHOGGU"):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(20, 20, SymAct("MIRUHOGGU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -1074682285)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -1494575342)
  CH("MIRUHOGGU"):ResetManpu()
  subEveCloseMsg()
  WINDOW:DrawFace(272, 16, SymAct("JIBAKOIRU"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(20, 0)
  WINDOW:Talk(SymAct("JIBAKOIRU"), -1916287791)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 20, SymAct("KOIRU"), FACE_TYPE.NORMAL)
  WINDOW:DrawFaceOffset(0, 10)
  WINDOW:Talk(SymAct("KOIRU"), -1797458544)
  subEveCloseMsg()
  CH("MIRUHOGGU"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("MIRUHOGGU")
  })
  WINDOW:DrawFace(20, 20, SymAct("MIRUHOGGU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -610442409)
  TASK:WaitTask()
  WINDOW:KeyWait()
  CH("MIRUHOGGU"):SetMotion(SymMot("BATTLE"), LOOP.ON)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -1031384554)
  CH("MIRUHOGGU"):ResetManpu()
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(0.5))
  EFFECT:Create("effectBgConLp", SymEff("BG_CONCENTRATION_LP"))
  EFFECT:SetPosition("effectBgConLp", CH("MIRUHOGGU"), BODY_POINT.CENTER)
  EFFECT:Play("effectBgConLp")
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  CH("KOIRU"):SetMotion(SymMot("BATTLE"), LOOP.ON)
  CH("REAKOIRU"):SetMotion(SymMot("BATTLE"), LOOP.ON)
  CH("JIBAKOIRU"):SetMotion(SymMot("BATTLE"), LOOP.ON)
  WINDOW:DrawFaceF(20, 20, SymAct("REAKOIRU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("REAKOIRU"), -374668843)
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_AT_RENKEI_READY_LP"), Volume(256))
  EFFECT:Create("effectRenkeiChargeLp01", SymEff("SN_RENKEI_CHARGE_LP"))
  EFFECT:SetPosition("effectRenkeiChargeLp01", SymPos("P_EFF_KOIRU"))
  EFFECT:Play("effectRenkeiChargeLp01")
  EFFECT:Create("effectRenkeiChargeLp02", SymEff("SN_RENKEI_CHARGE_LP"))
  EFFECT:SetPosition("effectRenkeiChargeLp02", SymPos("P_EFF_REAKOIRU"))
  EFFECT:Play("effectRenkeiChargeLp02")
  EFFECT:Create("effectRenkeiChargeLp03", SymEff("SN_RENKEI_CHARGE_LP"))
  EFFECT:SetPosition("effectRenkeiChargeLp03", SymPos("P_EFF_JIBAKOIRU"))
  EFFECT:Play("effectRenkeiChargeLp03")
  TASK:Sleep(TimeSec(0.7))
  WINDOW:DrawFace(272, 16, SymAct("JIBAKOIRU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIBAKOIRU"), -256888684)
  WINDOW:Talk(SymAct("JIBAKOIRU"), 1999121499)
  WINDOW:CloseMessage()
  SOUND:FadeOutSe(SymSnd("SE_AT_RENKEI_READY_LP"), TimeSec(0.2))
  EFFECT:Remove("effectRenkeiChargeLp01")
  EFFECT:Remove("effectRenkeiChargeLp02")
  EFFECT:Remove("effectRenkeiChargeLp03")
  TASK:Sleep(TimeSec(0.1))
  EFFECT:Create("effectRenkeiInvoke01", SymEff("SN_RENKEI_INVOKE"))
  EFFECT:SetPosition("effectRenkeiInvoke01", SymPos("P_EFF_KOIRU"))
  EFFECT:Play("effectRenkeiInvoke01")
  EFFECT:Create("effectRenkeiInvoke02", SymEff("SN_RENKEI_INVOKE"))
  EFFECT:SetPosition("effectRenkeiInvoke02", SymPos("P_EFF_REAKOIRU"))
  EFFECT:Play("effectRenkeiInvoke02")
  EFFECT:Create("effectRenkeiInvoke03", SymEff("SN_RENKEI_INVOKE"))
  EFFECT:SetPosition("effectRenkeiInvoke03", SymPos("P_EFF_JIBAKOIRU"))
  EFFECT:Play("effectRenkeiInvoke03")
  SOUND:PlaySe(SymSnd("SE_AT_RENKEI_GO"), Volume(256))
  TASK:Sleep(TimeSec(0.5))
  SOUND:PlaySe(SymSnd("SE_EVT_STYLISH"), Volume(256))
  local taskKoiruAttack00 = function()
    CH("KOIRU"):SetMotion(SymMot("JUMP"), LOOP.OFF)
    CH("KOIRU"):MoveHeightTo(Height(4), Speed(8))
    CH("KOIRU"):WaitMoveHeight()
    CH("KOIRU"):SetPosition(SymPos("P00_KOIRU"))
    CH("KOIRU"):SetDir(RotateTarget(45))
    TASK:Sleep(TimeSec(0.2))
    CH("KOIRU"):SetMotion(SymMot("LANDING"), LOOP.OFF)
    CH("KOIRU"):MoveHeightTo(Height(0), Speed(8))
    CH("KOIRU"):WaitMoveHeight()
    CH("KOIRU"):SetMotion(SymMot("ATTACK_ROUND"), LOOP.OFF)
    CAMERA:SetShake(Vector2(0.02, 0.02), TimeSec(1, TIME_TYPE.FRAME))
    SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
    SCREEN_A:WhiteChange(Level(0), Level(1), TimeSec(0.02), true)
    TASK:Sleep(TimeSec(0.1))
    SCREEN_A:WhiteChange(Level(1), Level(0), TimeSec(0.02), true)
    CH("KOIRU"):WaitPlayMotion()
    CAMERA:SetShake(Vector2(0, 0), TimeSec(0))
    CH("KOIRU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  end
  local taskReakoiruAttack00 = function()
    CH("REAKOIRU"):SetMotion(SymMot("JUMP"), LOOP.OFF)
    CH("REAKOIRU"):MoveHeightTo(Height(4), Speed(8))
    CH("REAKOIRU"):WaitMoveHeight()
    CH("REAKOIRU"):SetPosition(SymPos("P00_REAKOIRU"))
    CH("REAKOIRU"):SetDir(RotateTarget(-45))
    TASK:Sleep(TimeSec(0.2))
    CH("REAKOIRU"):SetMotion(SymMot("LANDING"), LOOP.OFF)
    CH("REAKOIRU"):MoveHeightTo(Height(0), Speed(8))
    CH("REAKOIRU"):WaitMoveHeight()
    CH("REAKOIRU"):SetMotion(SymMot("ATTACK_ROUND"), LOOP.OFF)
    CH("REAKOIRU"):WaitPlayMotion()
    CH("REAKOIRU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  end
  local taskJibakoiruAttack00 = function()
    CH("JIBAKOIRU"):SetMotion(SymMot("JUMP"), LOOP.OFF)
    CH("JIBAKOIRU"):MoveHeightTo(Height(4), Speed(8))
    CH("JIBAKOIRU"):WaitMoveHeight()
    CH("JIBAKOIRU"):SetPosition(SymPos("P00_JIBAKOIRU"))
    CH("JIBAKOIRU"):SetDir(RotateTarget(0))
    TASK:Sleep(TimeSec(0.2))
    CH("JIBAKOIRU"):SetMotion(SymMot("LANDING"), LOOP.OFF)
    CH("JIBAKOIRU"):MoveHeightTo(Height(0), Speed(8))
    CH("JIBAKOIRU"):WaitMoveHeight()
    SOUND:PlaySe(SymSnd("SE_EVT_DEDENNE_DENGEKI_02"))
    EFFECT:Create("effectWazaHit", SymEff("EV_LIGHTNING"))
    EFFECT:SetPosition("effectWazaHit", SymPos("P_EFF_MIRUHOGGU"))
    EFFECT:Play("effectWazaHit")
    CH("JIBAKOIRU"):SetMotion(SymMot("ATTACK_ROUND"), LOOP.OFF)
    CH("JIBAKOIRU"):WaitPlayMotion()
    CH("JIBAKOIRU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  end
  local taskLookAt00 = function()
    CH("YANCHAMU"):DirTo(CH("MIRUHOGGU"), Speed(350), ROT_TYPE.NEAR)
    CH("HERO"):DirTo(CH("MIRUHOGGU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("CHOBOMAKI"):DirTo(CH("MIRUHOGGU"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):DirTo(CH("MIRUHOGGU"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("NYASUPAA"):DirTo(CH("MIRUHOGGU"), Speed(350), ROT_TYPE.NEAR)
    CH("NUMERA"):DirTo(CH("MIRUHOGGU"), Speed(350), ROT_TYPE.NEAR)
    CH("SHIKIJIKA_SPRING"):DirTo(CH("MIRUHOGGU"), Speed(350), ROT_TYPE.NEAR)
  end
  local taskMiruhoggu00 = function()
    TASK:Sleep(TimeSec(0.5))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_02"), Volume(256))
    CH("MIRUHOGGU"):SetManpu("MP_FLY_SWEAT")
    CH("MIRUHOGGU"):DirTo(RotateOffs(-90), Speed(800))
    CH("MIRUHOGGU"):WaitRotate()
    CH("MIRUHOGGU"):DirTo(RotateOffs(180), Speed(800))
    CH("MIRUHOGGU"):WaitRotate()
    CH("MIRUHOGGU"):DirTo(RotateOffs(-90), Speed(800))
    CH("MIRUHOGGU"):WaitRotate()
    CH("MIRUHOGGU"):SetManpu("MP_SHOCK_R")
    CH("MIRUHOGGU"):SetMotion(SymMot("DAMAGE"), LOOP.OFF)
    CH("MIRUHOGGU"):WaitPlayMotion()
    CH("MIRUHOGGU"):SetMotion(SymMot("FALL"), LOOP.OFF)
    CH("MIRUHOGGU"):WaitPlayMotion()
    CH("MIRUHOGGU"):SetMotion(SymMot("SLEEPLOOP"), LOOP.ON)
  end
  EFFECT:Remove("effectBgConLp")
  CAMERA:MoveFollow2(SymCam("CAMERA_01_5"), Speed(8, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  TASK:Regist(taskKoiruAttack00)
  TASK:Regist(taskReakoiruAttack00)
  TASK:Regist(taskJibakoiruAttack00)
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(taskMiruhoggu00)
  CAMERA:WaitMove()
  CAMERA:MoveFollow2(SymCam("CAMERA_02"), Speed(5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  TASK:Regist(taskLookAt00)
  TASK:WaitTask()
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.SHOUT)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1848843546)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH("PARTNER"):SetManpu("MP_SHOCK_L")
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_SHOCK_L")
  CH("YANCHAMU"):SetManpu("MP_SHOCK_R")
  CH("HERO"):SetManpu("MP_SHOCK_L")
  CH("CHOBOMAKI"):SetManpu("MP_FLY_SWEAT")
  CH("NUMERA"):SetManpu("MP_FLY_SWEAT")
  TASK:Regist(subEveDoubleJump, {
    CH("NUMERA")
  })
  WINDOW:DrawFace(324, 20, SymAct("NUMERA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("NUMERA"), -2013203246)
  CH("NUMERA"):WaitManpu()
  WINDOW:CloseMessage()
  TASK:Regist(subEveMoveDir, {
    CH("PARTNER"),
    SymPos("P00_PARTNER"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Regist(subEveMoveDir, {
    CH("CHOBOMAKI"),
    SymPos("P00_CHOBOMAKI"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Sleep(TimeSec(0.1))
  TASK:Regist(subEveMoveDir, {
    CH("HERO"),
    SymPos("P00_HERO"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Regist(subEveMoveDir, {
    CH("YANCHAMU"),
    SymPos("P00_YANCHAMU"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Sleep(TimeSec(0.1))
  TASK:Regist(subEveMoveDir, {
    CH("NUMERA"),
    SymPos("P00_NUMERA"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Regist(subEveMoveDir, {
    CH("SHIKIJIKA_SPRING"),
    SymPos("P00_SHIKIJIKA"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Regist(subEveMoveDir, {
    CH("NYASUPAA"),
    SymPos("P00_NYASUPAA"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Sleep(TimeSec(0.2))
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:WaitTask()
  TASK:Sleep(TimeSec(0.5))
  CH("MIRUHOGGU"):MoveTo(PosOffs(0.01, 0.01), Speed(8), LINK_DIR.OFF)
  CH("MIRUHOGGU"):WaitMove()
  CH("MIRUHOGGU"):MoveTo(PosOffs(-0.01, -0.01), Speed(8), LINK_DIR.OFF)
  CH("MIRUHOGGU"):WaitMove()
  CH("MIRUHOGGU"):MoveTo(PosOffs(0.01, 0.01), Speed(8), LINK_DIR.OFF)
  CH("MIRUHOGGU"):WaitMove()
  CH("MIRUHOGGU"):MoveTo(PosOffs(-0.01, -0.01), Speed(8), LINK_DIR.OFF)
  CH("MIRUHOGGU"):WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -1860450925)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -1170827696)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -1557289199)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -328453674)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -176750441)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -564505772)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("MIRUHOGGU"):SetMotion(SymMot("EV005_RISE"), LOOP.OFF)
  CH("MIRUHOGGU"):SetMotionRaito(Raito(0.5))
  CH("MIRUHOGGU"):WaitPlayMotion()
  CH("MIRUHOGGU"):SetMotionRaito(Raito(1))
  CH("MIRUHOGGU"):SetFacialMotion(FACIAL_MOTION.DAMAGE)
  CH("MIRUHOGGU"):DirTo(RotateTarget(45), Speed(200), ROT_TYPE.NEAR)
  CH("MIRUHOGGU"):WaitRotate()
  CH("MIRUHOGGU"):SetMotion(SymMot("CONFUSE"), LOOP.ON)
  WINDOW:DrawFace(272, 16, SymAct("MIRUHOGGU"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -952016363)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1087995610)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.3))
end
function main05_renkeijisshuukaishi01_end()
end
function groundEnd()
end
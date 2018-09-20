dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main03_moguryutankouhirobanite01_init()
end
function main03_moguryutankouhirobanite01_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  TASK:Regist(subEveMoveDir, {
    CH("PARTNER"),
    SymPos("P00_PARTNER"),
    Speed(1.5),
    SymPos("P00_HERO")
  })
  TASK:Regist(subEveMoveDir, {
    CH("HERO"),
    SymPos("P00_HERO"),
    Speed(1.5),
    SymPos("P00_PARTNER")
  })
  SOUND:PlayBgm(SymSnd("BGM_EVE_ODAYAKA_01"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:WaitTask()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1106630741, PARTNER_1 = -1492052246})
  WINDOW:SwitchTalk({PARTNER_0 = -1942207191, PARTNER_1 = -1792576408})
  WINDOW:CloseMessage()
  CAMERA:MoveFollow2(SymCam("CAMERA_01"), Speed(6, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("PARTNER"):DirTo(RotateTarget(90), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):DirTo(RotateTarget(90), Speed(350), ROT_TYPE.NEAR)
  CAMERA:WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -630791505, PARTNER_1 = -1015163922})
  WINDOW:SwitchTalk({PARTNER_0 = -397377491, PARTNER_1 = -246697620})
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1993584035, PARTNER_1 = 1875418338})
  WINDOW:CloseMessage()
  CAMERA:MoveToHero(Speed(7, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
end
function main03_moguryutankouhirobanite01_end()
end
function groundEnd()
end

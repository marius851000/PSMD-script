dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_FM_TW01_DISTRICT_B()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 522146482, PARTNER_1 = 100951027})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 757674032, PARTNER_1 = 875692401})
  WINDOW:SwitchTalk({PARTNER_0 = 2071173046, PARTNER_1 = 1651025655})
  WINDOW:SwitchTalk({PARTNER_0 = 1229321524, PARTNER_1 = 1348387957})
  WINDOW:CloseMessage()
end

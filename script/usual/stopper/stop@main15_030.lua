dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW01_DIST_A_DGFRONT()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1992308992, PARTNER_1 = -1876625855})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1156995710, PARTNER_1 = -1575840573})
  WINDOW:SwitchTalk({PARTNER_0 = -313327100, PARTNER_1 = -196594875})
  WINDOW:CloseMessage()
end
dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_FM_TW00_SCHOOL00()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(500), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1382602059, PARTNER_1 = -1265886220})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(500), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1616820169, PARTNER_1 = -2034599562})
  WINDOW:CloseMessage()
end
function MV_FM_TW00_CAFE()
  MV_FM_TW00_SCHOOL00()
end
function TR_TW00_ALL_CENTER()
  MV_FM_TW00_SCHOOL00()
end

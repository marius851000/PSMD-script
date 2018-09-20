dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_ATLAS_PLACE()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1205397060, PARTNER_1 = 1589892869})
  WINDOW:SwitchTalk({PARTNER_0 = 1978565830, PARTNER_1 = 1828042119})
  WINDOW:CloseMessage()
end
function MV_FM_TW00_ALL()
end
function MV_FM_TW00_HOME01()
end
function MV_FM_TW00_HOME02()
end
function MV_FM_TW00_HOME03()
end
function MV_FM_TW00_HOME04()
end
function MV_FM_TW00_CAFE()
end
function MV_FM_TW00_SCHOOL00()
  MV_ATLAS_PLACE()
end
function MV_FM_TW00_HILL()
end

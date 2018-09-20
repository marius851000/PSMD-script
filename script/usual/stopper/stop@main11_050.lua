dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_ATLAS_PLACE()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 911602210, PARTNER_1 = 793690979})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 73633952, PARTNER_1 = 494445025})
  WINDOW:SwitchTalk({PARTNER_0 = 1379481382, PARTNER_1 = 1260521063})
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
end
function MV_FM_TW00_HILL()
end

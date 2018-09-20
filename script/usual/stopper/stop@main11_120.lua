dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW00_ALL_CENTER02()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -240812456, PARTNER_1 = -390181095})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1013768998, PARTNER_1 = -628609637})
  WINDOW:SwitchTalk({PARTNER_0 = -1781941412, PARTNER_1 = -1932359139})
  WINDOW:CloseMessage()
end
function MV_FM_TW00_ALL()
end
function MV_FM_TW00_HOME01()
  TR_TW00_ALL_CENTER02()
end
function MV_FM_TW00_HOME02()
  TR_TW00_ALL_CENTER02()
end
function MV_FM_TW00_HOME03()
  TR_TW00_ALL_CENTER02()
end
function MV_FM_TW00_HOME04()
  TR_TW00_ALL_CENTER02()
end
function MV_FM_TW00_CAFE()
end
function MV_FM_TW00_SCHOOL00()
end
function MV_FM_TW00_HILL()
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
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
  MV_ATLAS_PLACE()
end
function MV_FM_TW00_SCHOOL00()
  MV_ATLAS_PLACE()
end
function MV_FM_TW00_HILL()
end
function MV_ATLAS_PLACE()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(2058896189)
  WINDOW:Monologue(1671656060)
  WINDOW:Monologue(1217274303)
  WINDOW:CloseMessage()
end

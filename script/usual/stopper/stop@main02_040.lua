dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW00_ALL_CENTER()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(-1907529369)
  WINDOW:Monologue(-1755949018)
  WINDOW:CloseMessage()
end
function MV_FM_TW00_SCHOOL00()
  TR_TW00_ALL_CENTER()
end

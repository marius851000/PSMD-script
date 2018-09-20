dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_FM_TW00_HOME02()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(182280435)
  WINDOW:Monologue(331764146)
  WINDOW:CloseMessage()
end

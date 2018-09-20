dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function KONOHANA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1252269541)
  WINDOW:Talk(SymAct("KONOHANA"), -1405037734)
  WINDOW:CloseMessage()
end

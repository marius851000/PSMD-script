dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function KONOHANA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -1652127600)
  WINDOW:CloseMessage()
end

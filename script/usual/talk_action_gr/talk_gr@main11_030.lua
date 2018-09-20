dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function KONOHANA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KONOHANA"), -928548287)
  WINDOW:Talk(SymAct("KONOHANA"), -776189184)
  WINDOW:CloseMessage()
end

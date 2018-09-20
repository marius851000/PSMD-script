dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -288913426, PARTNER_1 = -136530257})
  WINDOW:CloseMessage()
end
function KONOHANA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KONOHANA"), -588126868)
  WINDOW:CloseMessage()
end

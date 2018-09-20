dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MYUU(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("MYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MYUU"), -781827933)
  WINDOW:CloseMessage()
end

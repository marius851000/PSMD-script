dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TABUNNE(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("TABUNNE"), -267601984)
  WINDOW:KeyWait()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("TABUNNE"), -384334207)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
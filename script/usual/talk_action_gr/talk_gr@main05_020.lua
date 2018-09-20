dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function KONOHANA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("KONOHANA"), -1900920535)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  CH(chSymb0):ResetFacialMotion()
  WINDOW:Talk(SymAct("KONOHANA"), -1750503320)
  WINDOW:CloseMessage()
end
function KAKUREON(chSymb0)
end

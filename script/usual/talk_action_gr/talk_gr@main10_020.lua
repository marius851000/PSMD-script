dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function KONOHANA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("KONOHANA"), 224287264)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("KONOHANA"), 340093793)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = -249415029, PARTNER_1 = -398914614})
  WINDOW:CloseMessage()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.NORMAL)
end
function BUIZERU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("BUIZERU"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:Talk(SymAct("BUIZERU"), -1022076919)
  WINDOW:CloseMessage()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.NORMAL)
end

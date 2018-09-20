dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = 2007770655, PARTNER_1 = 1857492830})
  WINDOW:CloseMessage()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.NORMAL)
end
function BUIZERU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("BUIZERU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUIZERU"), 1167738013)
  WINDOW:CloseMessage()
end

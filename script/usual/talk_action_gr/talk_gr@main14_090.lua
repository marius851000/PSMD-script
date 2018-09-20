dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = -429615405, PARTNER_1 = -8411246})
  WINDOW:CloseMessage()
end
function AAKEN(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:Talk(SymAct("AAKEN"), -732761007)
  WINDOW:CloseMessage()
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = 501318490, PARTNER_1 = 83538459})
  WINDOW:SwitchTalk({PARTNER_0 = 802677208, PARTNER_1 = 919392409})
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end

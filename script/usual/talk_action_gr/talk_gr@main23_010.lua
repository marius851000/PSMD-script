dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = 543007172, PARTNER_1 = 960925829})
  WINDOW:SwitchTalk({PARTNER_0 = 309052230, PARTNER_1 = 191951367})
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function OOBEMU(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("OOBEMU3"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("OOBEMU3"), 1144087744)
  WINDOW:Talk(SymAct("OOBEMU3"), 1563055489)
  WINDOW:Talk(SymAct("OOBEMU3"), 1980171842)
  WINDOW:CloseMessage()
end
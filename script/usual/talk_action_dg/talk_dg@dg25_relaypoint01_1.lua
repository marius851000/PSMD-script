dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = 1396866328, PARTNER_1 = 1247366233})
  WINDOW:SwitchTalk({PARTNER_0 = 1635000218, PARTNER_1 = 2020552411})
  WINDOW:CloseMessage()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.NORMAL)
end
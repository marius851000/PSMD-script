dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = 980890424, PARTNER_1 = 594281081})
  WINDOW:SwitchTalk({PARTNER_0 = 138498490, PARTNER_1 = 291135739})
  WINDOW:CloseMessage()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.NORMAL)
end
function MV_STAGING_POST_BACK()
  WINDOW:SysMsg(1578890812)
  WINDOW:CloseMessage()
end

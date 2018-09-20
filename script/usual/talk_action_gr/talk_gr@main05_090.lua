dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = -1183672186, PARTNER_1 = -1603687993})
  WINDOW:SwitchTalk({PARTNER_0 = -1958413820, PARTNER_1 = -1839215803})
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function RATTA(chSymb0)
  CH(chSymb0):SetManpu("MP_EXCLAMATION")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("RATTA"), -585212542)
  WINDOW:Talk(SymAct("RATTA"), -1006277437)
  WINDOW:CloseMessage()
  CH(chSymb0):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  CH(chSymb0):SetManpu("MP_SHOCK_L")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.SURPRISE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  WINDOW:Talk(SymAct("RATTA"), -282575104)
  WINDOW:CloseMessage()
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("RATTA"), -164426175)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = -568457320, PARTNER_1 = -955959591})
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function AAKEN(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:Talk(SymAct("AAKEN"), -332896998)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function KONOHANA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("KONOHANA"), -181185445)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function HASUBURERO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HASUBURERO"), -1166884196)
  WINDOW:CloseMessage()
end
function HIPOPOTASU(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH(chSymb0):SetManpu("MP_SHOCK_L")
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("HIPOPOTASU"), FACE_TYPE.SURPRISE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  WINDOW:Talk(SymAct("HIPOPOTASU"), -1553337379)
  WINDOW:DrawFace(20, 88, SymAct("HIPOPOTASU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("HIPOPOTASU"), -2008768482)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function RATTA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RATTA"), -1856007841)
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("RATTA"), 382176656)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function HIMANATTSU(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH(chSymb0):SetManpu("MP_SHOCK_L")
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("HIMANATTSU"), FACE_TYPE.GLADNESS)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  WINDOW:Talk(SymAct("HIMANATTSU"), 266124497)
  WINDOW:DrawFace(20, 88, SymAct("HIMANATTSU"), FACE_TYPE.NORMAL)
  CH(chSymb0):ResetFacialMotion()
  WINDOW:Talk(SymAct("HIMANATTSU"), 31393990)
  WINDOW:Talk(SymAct("HIMANATTSU"), 415512967)
  WINDOW:CloseMessage()
end
function BUBII(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("BUBII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUBII"), 870935108)
  WINDOW:DrawFace(20, 88, SymAct("BUBII"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:Talk(SymAct("BUBII"), 720526085)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -1130681503, PARTNER_1 = -1518331360})
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = -1901245981, PARTNER_1 = -1749649246})
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function RATTA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("RATTA"), -654840219)
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.NORMAL)
  CH(chSymb0):ResetFacialMotion()
  WINDOW:Talk(SymAct("RATTA"), -1041440988)
  WINDOW:CloseMessage()
end
function ROZERIA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("ROZERIA"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("ROZERIA"), -356414233)
  WINDOW:CloseMessage()
end
function HASUBURERO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("HASUBURERO"), -203768410)
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.THINK)
  CH(chSymb0):SetManpu("MP_SWEAT_L")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("HASUBURERO"), 1950523753)
  WINDOW:CloseMessage()
  CH(chSymb0):WaitManpu()
  CH(chSymb0):ResetFacialMotion()
end
function HIPOPOTASU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HIPOPOTASU"), FACE_TYPE.THINK)
  CH(chSymb0):ResetFacialMotion()
  WINDOW:Talk(SymAct("HIPOPOTASU"), 1834586152)
  WINDOW:CloseMessage()
end
function GARUURA(chSymb0, bFirst)
  if bFirst then
    WINDOW:DrawFace(20, 88, SymAct("GARUURA"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("GARUURA"), -159818668)
  else
  end
end
function HIMANATTSU(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH(chSymb0):SetManpu("MP_SHOCK_L")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("HIMANATTSU"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("HIMANATTSU"), -278762219)
  WINDOW:CloseMessage()
  subEveJumpSurprise(CH(chSymb0))
  WINDOW:DrawFace(20, 88, SymAct("HIMANATTSU"), FACE_TYPE.SPECIAL01)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH(chSymb0):SetManpu("MP_SHOCK_L")
  WINDOW:Talk(SymAct("HIMANATTSU"), -1001439530)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function BUBII(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("BUBII"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("BUBII"), -581693545)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function HIYAKKII(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("HIYAKKII"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("HIYAKKII"), -1844078256)
  WINDOW:Talk(SymAct("HIYAKKII"), -1961973743)
  subEveCloseMsg()
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFace(20, 88, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), -1608254510)
  WINDOW:Talk(SymAct("HIYAKKII"), -1187460461)
  WINDOW:Talk(SymAct("HIYAKKII"), 1050728028)
  subEveCloseMsg()
  CH(chSymb0):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("JIBAKOIRU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("JIBAKOIRU"), 666625821)
  WINDOW:KeyWait()
  CH(chSymb0):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("JIBAKOIRU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIBAKOIRU"), -456330310)
  subEveCloseMsg()
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFace(20, 88, SymAct("JIBAKOIRU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("JIBAKOIRU"), -36191493)
  WINDOW:KeyWait()
  CH(chSymb0):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("JIBAKOIRU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIBAKOIRU"), -688221896)
  WINDOW:Talk(SymAct("JIBAKOIRU"), -807296903)
  WINDOW:Talk(SymAct("JIBAKOIRU"), -2136983874)
  WINDOW:CloseMessage()
end
function JIBAKOIRU(chSymb0, chSymb1)
  HIYAKKII(chSymb0, chSymb1)
end

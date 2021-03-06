dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 1156655532, PARTNER_1 = 1575622893})
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function HIMEGUMA(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("HIMEGUMA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("HIMEGUMA"), 1992772398)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function RINGUMA(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("RINGUMA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RINGUMA"), 1876720239)
  WINDOW:DrawFace(20, 88, SymAct("RINGUMA"), FACE_TYPE.PAIN)
  CH(chSymb1):SetManpu("MP_UPSET_LP")
  CH(chSymb1):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("RINGUMA"), 547220648)
  WINDOW:CloseMessage()
  CH(chSymb1):ResetFacialMotion()
  CH(chSymb1):ResetManpu()
end
function HIYAKKII(chSymb0, chSymb1, chSymb2)
  WINDOW:DrawFace(20, 88, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), 965139945)
  WINDOW:DrawFace(20, 88, SymAct("HIYAKKII"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("HIYAKKII"), 313232938)
  WINDOW:Talk(SymAct("HIYAKKII"), 196132715)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function TABUNNE(chSymb0, chSymb1, chSymb2)
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("TABUNNE"), -1943493724)
  WINDOW:Talk(SymAct("TABUNNE"), -1791782171)
  WINDOW:CloseMessage()
end
function KAMONEGI(chSymb0, chSymb1, chSymb2)
  WINDOW:DrawFace(20, 88, SymAct("KAMONEGI"), FACE_TYPE.THINK)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb1):SetManpu("MP_QUESTION")
  CH(chSymb1):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("KAMONEGI"), 1713597457)
  WINDOW:CloseMessage()
  CH(chSymb1):ResetFacialMotion()
end

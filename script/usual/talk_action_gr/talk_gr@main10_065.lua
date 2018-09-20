dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 231215106, PARTNER_1 = 349380931})
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function ABAGOORA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), 1073640064)
  WINDOW:DrawFace(20, 88, SymAct("ABAGOORA"), FACE_TYPE.ANGRY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.ANGRY)
  WINDOW:Talk(SymAct("ABAGOORA"), 652559297)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function ROZERIA(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("ROZERIA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("ROZERIA"), 1772410118)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function SUBOMII(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("SUBOMII"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("SUBOMII"), 1891624007)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function NYASUPAA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), 1536341892)
  WINDOW:CloseMessage()
end

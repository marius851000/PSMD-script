dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 698181822, PARTNER_1 = 814111231})
  WINDOW:CloseMessage()
end
function KAKUREON(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KAKUREON"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAKUREON"), 464194108)
  WINDOW:KeyWait()
end
function DESUKAAN(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DESUKAAN"), FACE_TYPE.SPECIAL03)
  WINDOW:Talk(SymAct("DESUKAAN"), 45103997)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb0):SetManpu("MP_QUESTION")
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("DESUKAAN"), FACE_TYPE.SPECIAL02)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  WINDOW:Talk(SymAct("DESUKAAN"), 1307684282)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:KeyWait()
  CH(chSymb0):ResetManpu()
end
function KUREFFI(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KUREFFI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KUREFFI"), 1424661755)
  WINDOW:KeyWait()
end
function RUCHABURU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("RUCHABURU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RUCHABURU"), 2143801144)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  WINDOW:KeyWait()
end
function RAPURASU(chSymb0)
end
dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MYUU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("MYUU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("MYUU"), 1346799770)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function MIRUTANKU(chSymb0)
  CH(chSymb0):DirTo(CH("WARUBIARU"), Speed(500), ROT_TYPE.NEAR)
  subEveDoubleJump(CH(chSymb0))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_ANGRY_01"), Volume(256))
  CH(chSymb0):SetManpu("MP_ANGRY_LP")
  WINDOW:DrawFace(20, 88, SymAct("MIRUTANKU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MIRUTANKU"), 1230879195)
  WINDOW:Talk(SymAct("MIRUTANKU"), 1651567128)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
end
function WARUBIARU(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  WINDOW:DrawFace(20, 88, SymAct("WARUBIARU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("WARUBIARU"), 2070666073)
  WINDOW:KeyWait()
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  WINDOW:Talk(SymAct("WARUBIARU"), 875187614)
  WINDOW:DrawFace(20, 88, SymAct("WARUBIARU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("WARUBIARU"), 758217951)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function WARUBIRU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("WARUBIRU"), 102510364)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function YAMIKARASU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("YAMIKARASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("YAMIKARASU"), 520560221)
  WINDOW:CloseMessage()
end
function BANEBUU(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  WINDOW:DrawFace(20, 88, SymAct("BANEBUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BANEBUU"), -1734409582)
  WINDOW:CloseMessage()
end
function PURASURU(chSymb0, chSymb1)
  CH(chSymb0):SetManpu("MP_QUESTION")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PURASURU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("PURASURU"), -2122042413)
  WINDOW:CloseMessage()
end
function MAINAN(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("MAINAN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MAINAN"), 1324251821)
  WINDOW:CloseMessage()
end
function DOODOO(chSymb0)
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("DOODOO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DOODOO"), 1475693548)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function GOOGOOTO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("GOOGOOTO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("GOOGOOTO"), 2094536751)
  WINDOW:CloseMessage()
end
function DONFAN(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DONFAN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DONFAN"), 1707288942)
  WINDOW:CloseMessage()
end
function KUCHIITO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KUCHIITO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KUCHIITO"), 713211817)
  WINDOW:Talk(SymAct("KUCHIITO"), 865701608)
  WINDOW:CloseMessage()
end
function JIRAACHI(chSymb0)
  WINDOW:SysMsg(414506283)
  WINDOW:SysMsg(28306538)
  WINDOW:CloseMessage()
end
function PEROPPAFU(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("PEROPPAFU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.GLADNESS)
  WINDOW:Talk(SymAct("PEROPPAFU"), -2043154267)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
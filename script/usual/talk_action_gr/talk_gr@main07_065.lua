dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function YANCHAMU(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("YANCHAMU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("YANCHAMU"), -531037787)
  WINDOW:CloseMessage()
end
function CHOBOMAKI(chSymb0, chSymb1)
  CH(chSymb1):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("CHOBOMAKI"), FACE_TYPE.HAPPY)
  CH(chSymb1):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("CHOBOMAKI"), -113102620)
  WINDOW:CloseMessage()
  CH(chSymb1):ResetManpu()
  CH(chSymb1):ResetFacialMotion()
end
function HIYAKKII(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), -764452057)
  WINDOW:CloseMessage()
end
function TABUNNE(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("TABUNNE"), -881569178)
  WINDOW:CloseMessage()
end
function KAMONEGI(chSymb0)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.ANGRY)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_01"), Volume(256))
  subEveJump(CH(chSymb0))
  WINDOW:DrawFace(20, 88, SymAct("KAMONEGI"), FACE_TYPE.ANGRY)
  WINDOW:Talk(SymAct("KAMONEGI"), -2076851039)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function MIRUHOGGU(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.GLADNESS)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.GLADNESS)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -1657866784)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end

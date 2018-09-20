dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function HASUBURERO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HASUBURERO"), 1151470755)
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("HASUBURERO"), 1572421090)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function HIPOPOTASU(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("HIPOPOTASU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("HIPOPOTASU"), 1989439009)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function HIMANATTSU(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("HIMANATTSU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("HIMANATTSU"), 1871667040)
  WINDOW:Talk(SymAct("HIMANATTSU"), 550422951)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function RATTA(chSymb0)
  CH(chSymb0):SetManpu("MP_QUESTION")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb0):WaitManpu()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("RATTA"), 970324198)
  WINDOW:Talk(SymAct("RATTA"), 318286629)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function BUBII(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("BUBII"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("BUBII"), 199465572)
  WINDOW:CloseMessage()
end
function KAKUREON(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KAKUREON"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KAKUREON"), -1938061653)
  WINDOW:CloseMessage()
end
function RUCHABURU(chSymb0)
  CH(chSymb0):SetManpu("MP_QUESTION")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("RUCHABURU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RUCHABURU"), -1788823574)
  WINDOW:CloseMessage()
end
function KUREFFI(chSymb0)
end
function RAPURASU(chSymb0)
end
function DESUKAAN(chSymb0)
end
function GARUURA(chSymb0)
end
function ABAGOORA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("ABAGOORA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("ABAGOORA"), -1430281014)
  WINDOW:DrawFace(20, 88, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  CH(chSymb0):ResetFacialMotion()
  WINDOW:Talk(SymAct("ABAGOORA"), -1281059445)
  WINDOW:CloseMessage()
end
function ROZERIA(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("ROZERIA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("ROZERIA"), -1735801272)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function SUBOMII(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("SUBOMII"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("SUBOMII"), -2121074935)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function NYASUPAA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -825007666)
  WINDOW:Talk(SymAct("NYASUPAA"), -674738033)
  WINDOW:Talk(SymAct("NYASUPAA"), -52100276)
  WINDOW:CloseMessage()
end
function SHIKIJIKA_SPRING(chSymb0, chSymb1)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -436325875)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 1650863810)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function NUMERA(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NUMERA"), 2071797635)
  WINDOW:Talk(SymAct("NUMERA"), -1207301340)
  WINDOW:CloseMessage()
end
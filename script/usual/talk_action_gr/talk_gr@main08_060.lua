dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  CH("PARTNER"):SetManpu("MP_FLY_SWEAT")
  CH("PARTNER"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 2047829377, PARTNER_1 = 1662276800})
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function ABAGOORA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), 1211696899)
  WINDOW:DrawFace(20, 88, SymAct("ABAGOORA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("ABAGOORA"), 1361196610)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function HASUBURERO(chSymb0, chSymb1, chSymb2)
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HASUBURERO"), 509845637)
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("HASUBURERO"), 125342148)
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  CH(chSymb1):SetManpu("MP_SWEAT_L")
  CH(chSymb1):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.SURPRISE)
  CH(chSymb1):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  WINDOW:Talk(SymAct("RATTA"), 743817735)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("ROZERIA"), FACE_TYPE.PAIN)
  CH(chSymb2):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("ROZERIA"), 894366534)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb1):ResetFacialMotion()
  CH(chSymb2):ResetFacialMotion()
end
function RATTA(chSymb0, chSymb1, chSymb2)
  HASUBURERO(chSymb0, chSymb1, chSymb2)
end
function ROZERIA(chSymb0, chSymb1, chSymb2)
  HASUBURERO(chSymb0, chSymb1, chSymb2)
end
function NYASUPAA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -1294536823)
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("NYASUPAA"), -1412571448)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function JIBAKOIRU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("JIBAKOIRU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIBAKOIRU"), 962790843)
  WINDOW:Talk(SymAct("JIBAKOIRU"), 544748794)
  WINDOW:CloseMessage()
end
function KONOHANA(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH(chSymb0):SetManpu("MP_SHOCK_L")
  subEveJump(CH(chSymb0))
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  WINDOW:Talk(SymAct("KONOHANA"), 190146361)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function GARUURA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("GARUURA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("GARUURA"), 307123832)
  WINDOW:KeyWait()
end
function HIPOPOTASU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HIPOPOTASU"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("HIPOPOTASU"), 1561313471)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function HIMANATTSU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HIMANATTSU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIMANATTSU"), 1142223358)
  WINDOW:KeyWait()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb0):SetManpu("MP_QUESTION")
  WINDOW:Talk(SymAct("HIMANATTSU"), 1866048061)
  CH(chSymb0):SetManpu("MP_QUESTION")
  WINDOW:CloseMessage()
  CH(chSymb0):WaitManpu()
end
function SUBOMII(chSymb0, chSymb1, chSymb2, chSymb3)
  WINDOW:DrawFace(20, 88, SymAct("TOGEPII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("TOGEPII"), 1981977468)
  subEveCloseMsg()
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb1))
  WINDOW:DrawFace(20, 88, SymAct("KYATAPII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KYATAPII"), -239431757)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("SUBOMII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("SUBOMII"), -392053006)
  subEveCloseMsg()
  CH(chSymb3):DirTo(CH(chSymb1), Speed(350), ROT_TYPE.NEAR)
  CH(chSymb3):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb3))
  WINDOW:DrawFace(20, 88, SymAct("UPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("UPAA"), 735488597)
  subEveCloseMsg()
end
function KYATAPII(chSymb0, chSymb1, chSymb2, chSymb3)
  SUBOMII(chSymb0, chSymb1, chSymb2, chSymb3)
end
function UPAA(chSymb0, chSymb1, chSymb2, chSymb3)
  SUBOMII(chSymb0, chSymb1, chSymb2, chSymb3)
end
function TOGEPII(chSymb0, chSymb1, chSymb2, chSymb3)
  SUBOMII(chSymb0, chSymb1, chSymb2, chSymb3)
end
function TABUNNE(chSymb0, chSymb1)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.SAD)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SAD)
  WINDOW:Talk(SymAct("TABUNNE"), 852335380)
  WINDOW:CloseMessage()
  CH("HIYAKKII"):DirTo(CH("TABUNNE"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 88, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), 434161879)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function HIYAKKII(chSymb0)
  TABUNNE(chSymb0, chSymb1)
end
function SHIKIJIKA_SPRING(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.SAD)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SAD)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 16513430)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function NUMERA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("NUMERA"), 1337618257)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end

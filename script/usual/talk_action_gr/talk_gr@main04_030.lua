dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1263231304, PARTNER_1 = 1380995081})
  WINDOW:CloseMessage()
end
function NUMERA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("NUMERA"), 2038236106)
  WINDOW:CloseMessage()
end
function ABAGOORA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), 1617310347)
  WINDOW:Talk(SymAct("ABAGOORA"), 791127116)
  WINDOW:CloseMessage()
end
function SUBOMII(chSymb0, chSymb1)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SAD)
  CH(chSymb1):SetFacialMotion(FACIAL_MOTION.SAD)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb1))
  WINDOW:DrawFace(20, 88, SymAct("SUBOMII"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("SUBOMII"), 909939981)
  WINDOW:CloseMessage()
  CH(chSymb0):DirTo(CH(chSymb1), Speed(350), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("ROZERIA"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("ROZERIA"), 487704270)
  WINDOW:Talk(SymAct("ROZERIA"), 67827599)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb1):ResetFacialMotion()
end
function ROZERIA(chSymb0, chSymb1)
  SUBOMII(chSymb0, chSymb1)
end
function KAMONEGI(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), -2087523520)
  WINDOW:DrawFace(20, 88, SymAct("KAMONEGI"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KAMONEGI"), -1702241791)
  WINDOW:Talk(SymAct("KAMONEGI"), 607558881)
  WINDOW:CloseMessage()
end
function NYASUPAA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), 1026403744)
  WINDOW:CloseMessage()
end
function MIRUHOGGU(chSymb0, bFirst)
  if bFirst then
    CH(chSymb0):ResetFacialMotion()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
    CH(chSymb0):SetManpu("MP_QUESTION")
    CH(chSymb0):WaitManpu()
    WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.THINK)
    WINDOW:Talk(SymAct("MIRUHOGGU"), 369163875)
    WINDOW:Talk(SymAct("MIRUHOGGU"), 253480738)
    WINDOW:CloseMessage()
    CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
    CH(chSymb0):SetManpu("MP_EXCLAMATION")
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
    TASK:Regist(subEveJumpSurprise, {
      CH(chSymb0)
    })
    WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.SURPRISE)
    WINDOW:Talk(SymAct("MIRUHOGGU"), 1079663077)
    WINDOW:Talk(SymAct("MIRUHOGGU"), 1497458852)
    TASK:WaitTask()
    WINDOW:CloseMessage()
    CH(chSymb0):ResetFacialMotion()
  else
    CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
    CH(chSymb0):SetManpu("MP_EXCLAMATION")
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
    TASK:Regist(subEveJumpSurprise, {
      CH(chSymb0)
    })
    WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.SURPRISE)
    WINDOW:Talk(SymAct("MIRUHOGGU"), 1919695719)
    TASK:WaitTask()
    WINDOW:CloseMessage()
    CH(chSymb0):ResetFacialMotion()
  end
end
function HIYAKKII(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), 1802963494)
  WINDOW:CloseMessage()
end
function TABUNNE(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb0):SetManpu("MP_QUESTION")
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("TABUNNE"), -319875351)
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("TABUNNE"), -168548440)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function KAKUREON(chSymb)
  CH("NUMERA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("NUMERA"):WaitRotate()
  CH("PARTNER"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NUMERA"), 914567951)
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("NUMERA"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NUMERA"), 798491214)
  WINDOW:Talk(SymAct("NUMERA"), 78991757)
  WINDOW:Talk(SymAct("NUMERA"), 497967308)
  WINDOW:CloseMessage()
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function ABAGOORA(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb0):SetManpu("MP_QUESTION")
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("ABAGOORA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("ABAGOORA"), -1462584186)
  WINDOW:Talk(SymAct("ABAGOORA"), -1312191033)
  WINDOW:CloseMessage()
end
function subSetRozeriaSubomii(chSymb0, chSymb1)
  CH(chSymb1):SetFacialMotion(FACIAL_MOTION.SAD)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb1))
  TASK:Sleep(TimeSec(0.3))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb1):SetManpu("MP_QUESTION")
  CH(chSymb1):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("SUBOMII"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("SUBOMII"), -1696276988)
  WINDOW:CloseMessage()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SAD)
  CH(chSymb0):DirTo(CH(chSymb1), Speed(350), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("ROZERIA"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("ROZERIA"), -2080379067)
  WINDOW:Talk(SymAct("ROZERIA"), -859932286)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  CH(chSymb0):WaitManpu()
  WINDOW:CloseMessage()
end
function SUBOMII(chSymb0, chSymb1)
  CH("HERO"):DirTo(CH(chSymb1), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  subSetRozeriaSubomii(chSymb0, chSymb1)
end
function ROZERIA(chSymb0, chSymb1)
  CH("HERO"):DirTo(CH(chSymb0), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  subSetRozeriaSubomii(chSymb0, chSymb1)
end
function HASUBURERO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HASUBURERO"), -710588221)
  WINDOW:CloseMessage()
  CH(chSymb0):DirTo(SymPos("HIROBA_POINT_00"), Speed(350), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  CH("HERO"):DirTo(SymPos("HIROBA_POINT_00"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HASUBURERO"), -24634624)
  WINDOW:CloseMessage()
  CH(chSymb0):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HASUBURERO"), -409785791)
  WINDOW:CloseMessage()
end
function MOGURYUU(chSymb0, bFirst)
  if bFirst then
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
    CH(chSymb0):SetManpu("MP_FLY_SWEAT")
    CH(chSymb0):WaitManpu()
    WINDOW:DrawFace(20, 88, SymAct("MOGURYUU"), FACE_TYPE.SPECIAL01)
    WINDOW:Talk(SymAct("MOGURYUU"), 1611347598)
    WINDOW:Talk(SymAct("MOGURYUU"), 2031093711)
    WINDOW:CloseMessage()
    CH(chSymb0):DirTo(SymPos("SCHOOL_POINT_00"), Speed(350), ROT_TYPE.NEAR)
    CH(chSymb0):WaitRotate()
    CH("HERO"):DirTo(SymPos("SCHOOL_POINT_00"), Speed(350), ROT_TYPE.NEAR)
    WINDOW:DrawFace(20, 88, SymAct("MOGURYUU"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("MOGURYUU"), -1993528367)
    WINDOW:Talk(SymAct("MOGURYUU"), -1875502448)
    WINDOW:CloseMessage()
    CH(chSymb0):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH(chSymb0):WaitRotate()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
    CH(chSymb0):SetManpu("MP_FLY_SWEAT")
    CH(chSymb0):WaitManpu()
    WINDOW:DrawFace(20, 88, SymAct("MOGURYUU"), FACE_TYPE.SPECIAL01)
    WINDOW:Talk(SymAct("MOGURYUU"), -1155839661)
    WINDOW:CloseMessage()
  else
    CH(chSymb0):DirTo(SymPos("SCHOOL_POINT_00"), Speed(350), ROT_TYPE.NEAR)
    CH(chSymb0):WaitRotate()
    CH("HERO"):DirTo(SymPos("SCHOOL_POINT_00"), Speed(350), ROT_TYPE.NEAR)
    WINDOW:DrawFace(20, 88, SymAct("MOGURYUU"), FACE_TYPE.SPECIAL01)
    WINDOW:Talk(SymAct("MOGURYUU"), -1577027566)
    WINDOW:CloseMessage()
    CH(chSymb0):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH(chSymb0):WaitRotate()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
    CH(chSymb0):SetManpu("MP_FLY_SWEAT")
    CH(chSymb0):WaitManpu()
    WINDOW:DrawFace(20, 88, SymAct("MOGURYUU"), FACE_TYPE.SPECIAL01)
    WINDOW:Talk(SymAct("MOGURYUU"), -314446123)
    WINDOW:CloseMessage()
  end
end
function subSetHimaBubi(chSymb0, chSymb1)
  subEveDoubleJump(CH(chSymb0))
  WINDOW:DrawFace(20, 88, SymAct("HIMANATTSU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIMANATTSU"), -195371116)
  WINDOW:CloseMessage()
  CH(chSymb1):SetFacialMotion(FACIAL_MOTION.PAIN)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb1):SetManpu("MP_FLY_SWEAT")
  CH(chSymb1):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("BUBII"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("BUBII"), -545813417)
  WINDOW:Talk(SymAct("BUBII"), -965952234)
  WINDOW:CloseMessage()
  CH(chSymb1):ResetFacialMotion()
end
function HIMANATTSU(chSymb0, chSymb1)
  subSetHimaBubi(chSymb0, chSymb1)
end
function BUBII(chSymb0, chSymb1)
  subSetHimaBubi(chSymb0, chSymb1)
end
function GARUURA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("GARUURA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("GARUURA"), 1106551257)
  WINDOW:DrawFace(20, 88, SymAct("GARUURA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:Talk(SymAct("GARUURA"), 1492095128)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
end
function KAKUREON(chSymb0, bFirst)
  if bFirst then
    CH(chSymb0):SetManpu("MP_SPREE_LP")
    CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
    WINDOW:DrawFace(20, 88, SymAct("KAKUREON"), FACE_TYPE.HAPPY)
    WINDOW:Talk(SymAct("KAKUREON"), -1684503489)
    WINDOW:Talk(SymAct("KAKUREON"), -2105297538)
    WINDOW:KeyWait()
    CH(chSymb0):ResetManpu()
    CH(chSymb0):ResetFacialMotion()
  end
end

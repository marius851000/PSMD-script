dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 754360988, PARTNER_1 = 904762333})
  WINDOW:SwitchTalk({PARTNER_0 = 515948574, PARTNER_1 = 131854687})
  WINDOW:CloseMessage()
end
function YANCHAMU(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("YANCHAMU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("YANCHAMU"), 1218078616)
  WINDOW:CloseMessage()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_01"), Volume(256))
  subEveJump(CH(chSymb0))
  TASK:Sleep(TimeSec(0.3))
  WINDOW:DrawFace(20, 88, SymAct("YANCHAMU"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("YANCHAMU"), 1367430873)
  WINDOW:CloseMessage()
end
function CHOBOMAKI(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("CHOBOMAKI"), FACE_TYPE.CATCHBREATH)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.CATCHBREATH)
  WINDOW:Talk(SymAct("CHOBOMAKI"), 2058093850)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  CH(chSymb1):SetManpu("MP_SWEAT_L")
  CH(chSymb1):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("CHOBOMAKI"), FACE_TYPE.NORMAL)
  CH(chSymb1):ResetFacialMotion()
  WINDOW:Talk(SymAct("CHOBOMAKI"), 1672950875)
  WINDOW:CloseMessage()
end
function TABUNNE(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("TABUNNE"), -466671468)
  WINDOW:Talk(SymAct("TABUNNE"), -46917163)
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("TABUNNE"), -1022400435)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function MIRUHOGGU(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb0):SetManpu("MP_QUESTION")
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -636200692)
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.NORMAL)
  CH(chSymb0):ResetFacialMotion()
  WINDOW:Talk(SymAct("MIRUHOGGU"), -247919921)
  WINDOW:CloseMessage()
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.ANGRY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.ANGRY)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -400409714)
  CH(chSymb0):DirTo(RotateTarget(40), Speed(500), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  subEveDoubleJump(CH(chSymb0))
  CH(chSymb0):DirTo(RotateTarget(130), Speed(500), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  subEveDoubleJump(CH(chSymb0))
  CH(chSymb0):DirTo(CH("HERO"), Speed(500), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  subEveDoubleJump(CH(chSymb0))
  WINDOW:CloseMessage()
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.SHOUT)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  WINDOW:Talk(SymAct("MIRUHOGGU"), -1486639799)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function KAMONEGI(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KAMONEGI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KAMONEGI"), -1099391992)
  WINDOW:Talk(SymAct("KAMONEGI"), -1789538357)
  WINDOW:CloseMessage()
end
function HIYAKKII(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), -1940980086)
  WINDOW:Talk(SymAct("HIYAKKII"), 198632005)
  WINDOW:CloseMessage()
end
function GARUURA(chSymb0)
end

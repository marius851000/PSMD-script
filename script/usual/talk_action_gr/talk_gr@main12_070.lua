dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -333943326, PARTNER_1 = -184329053})
  WINDOW:SwitchTalk({PARTNER_0 = -567406752, PARTNER_1 = -952811999})
  WINDOW:CloseMessage()
end
function WARUBIRU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.ANGRY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.ANGRY)
  WINDOW:Talk(SymAct("WARUBIRU"), -2005620506)
  WINDOW:KeyWait()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_ANGRY_02"), Volume(256))
  CH(chSymb0):SetManpu("MP_ANGRY_LP")
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.ANGRY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.ANGRY)
  WINDOW:Talk(SymAct("WARUBIRU"), -1854957145)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function KOFUURAI_HANAZONO(chSymb0)
  CH(chSymb0):SetManpu("MP_EXCLAMATION")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("KOFUURAI_HANAZONO"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("KOFUURAI_HANAZONO"), -1170027932)
  WINDOW:CloseMessage()
  CH(chSymb0):WaitManpu()
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("KOFUURAI_HANAZONO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KOFUURAI_HANAZONO"), -1554384091)
  WINDOW:CloseMessage()
  CH(chSymb0):WaitManpu()
end
function DOODOO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DOODOO"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("DOODOO"), 616687594)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function RAPURASU(chSymb0)
  local degree0 = CH(chSymb0):GetDir()
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("RAPURASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RAPURASU"), 1037751979)
  WINDOW:Talk(SymAct("RAPURASU"), 2036868090)
  WINDOW:Talk(SymAct("RAPURASU"), 1618154171)
  WINDOW:Talk(SymAct("RAPURASU"), 1264468344)
  WINDOW:Talk(SymAct("RAPURASU"), 1380282425)
  WINDOW:CloseMessage()
  CH(chSymb0):DirTo(RotateTarget(degree0), Speed(350), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
end

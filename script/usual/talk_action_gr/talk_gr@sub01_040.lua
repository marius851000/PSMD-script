dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function BUIZERU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("BUIZERU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUIZERU"), 1247610555)
  WINDOW:DrawFace(20, 88, SymAct("BUIZERU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("BUIZERU"), 1397110778)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function HORUBII(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HORUBII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HORUBII"), 2020303929)
  WINDOW:CloseMessage()
end
function WARUBIRU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("WARUBIRU"), 1634751864)
  WINDOW:KeyWait()
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("WARUBIRU"), 775013311)
  WINDOW:KeyWait()
  CH(chSymb0):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("WARUBIRU"), 925561598)
  WINDOW:CloseMessage()
end
function NOZUPASU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NOZUPASU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("NOZUPASU"), 470262077)
  WINDOW:Talk(SymAct("NOZUPASU"), 85758076)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function KOFUURAI_HANAZONO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KOFUURAI_MIYABI"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("KOFUURAI_MIYABI"), -2105242445)
  WINDOW:Talk(SymAct("KOFUURAI_MIYABI"), -1684029966)
  CH(chSymb0):ResetFacialMotion()
  WINDOW:KeyWait()
  CH(chSymb0):SetManpu("MP_QUESTION")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("KOFUURAI_MIYABI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KOFUURAI_MIYABI"), -932062350)
  WINDOW:CloseMessage()
  CH(chSymb0):WaitManpu()
end
function DOODOO(chSymb0)
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("DOODOO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DOODOO"), -781522381)
  WINDOW:KeyWait()
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("DOODOO"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("DOODOO"), -95962640)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function SHIMAMA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("SHIMAMA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("SHIMAMA"), -480474959)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function POCHIENA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("POCHIENA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("POCHIENA"), -1407377802)
  WINDOW:DrawFace(20, 88, SymAct("POCHIENA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("POCHIENA"), -1257885897)
  WINDOW:KeyWait()
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("POCHIENA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("POCHIENA"), -1641317132)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function CHIRAAMII(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("CHIRAAMII"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("CHIRAAMII"), -2026877515)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function KORINKU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KORINKU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("KORINKU"), 11030906)
  WINDOW:DrawFace(20, 88, SymAct("KORINKU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("KORINKU"), 431185979)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function MASSUGUMA(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  WINDOW:DrawFace(20, 88, SymAct("MASSUGUMA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("MASSUGUMA"), -624659300)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function KOROBOOSHI(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  WINDOW:DrawFace(20, 88, SymAct("KOROBOOSHI"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("KOROBOOSHI"), -1008777763)
  WINDOW:Talk(SymAct("KOROBOOSHI"), -386787810)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function AAKEN(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("AAKEN"), -236378273)
  WINDOW:Talk(SymAct("AAKEN"), -1096240744)
  WINDOW:KeyWait()
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("AAKEN"), -1481408295)
  WINDOW:KeyWait()
  CH(chSymb0):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("AAKEN"), -1935748326)
  WINDOW:CloseMessage()
end
function GOOGOOTO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("GOOGOOTO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("GOOGOOTO"), -1786387877)
  WINDOW:KeyWait()
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(20, 88, SymAct("GOOGOOTO"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("GOOGOOTO"), 303955604)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function DONFAN(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DONFAN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DONFAN"), 184995797)
  WINDOW:KeyWait()
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(20, 88, SymAct("DONFAN"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("DONFAN"), 1652036601)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
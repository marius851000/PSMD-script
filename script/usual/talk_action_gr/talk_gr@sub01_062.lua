dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function SUKANPUU(chSymb0)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  WINDOW:DrawFace(20, 88, SymAct("SUKANPUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("SUKANPUU"), 419160877)
  WINDOW:Talk(SymAct("SUKANPUU"), 31511148)
  WINDOW:Talk(SymAct("SUKANPUU"), 718111151)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):SetManpu("MP_QUESTION")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("SUKANPUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("SUKANPUU"), 869708014)
  WINDOW:CloseMessage()
end
function OTACHI(chSymb0)
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("OTACHI"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("OTACHI"), 2090280489)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function BANEBUU(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("BANEBUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("BANEBUU"), 1703679848)
  WINDOW:Talk(SymAct("BANEBUU"), 1319191723)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function TANEBOO(chSymb0)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("TANEBOO"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("TANEBOO"), 1471837674)
  WINDOW:Talk(SymAct("TANEBOO"), -803051227)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function PURASURU(chSymb0, chSymb1)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("PURASURU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("PURASURU"), -918988700)
  WINDOW:Talk(SymAct("PURASURU"), 1057665727)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function MAINAN(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("MAINAN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MAINAN"), 638682110)
  WINDOW:CloseMessage()
end
function DOODOO(chSymb0)
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("DOODOO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DOODOO"), 222089277)
  WINDOW:CloseMessage()
end
function MEEKURU(chSymb0, chSymb1)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("MEEKURU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("MEEKURU"), 338157948)
  subEveCloseMsg()
  CH(chSymb0):ResetManpu()
  subEveDoubleJump(CH(chSymb1))
  CH(chSymb1):SetManpu("MP_SPREE_LP")
  CH(chSymb1):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("GOMAZOU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("GOMAZOU"), 1533441979)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb1):ResetFacialMotion()
end
function GOMAZOU(chSymb0, chSymb1)
  MEEKURU(chSymb0, chSymb1)
end
function WARUBIARU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("WARUBIARU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("WARUBIARU"), 1115506426)
  WINDOW:KeyWait()
  CH(chSymb0):SetManpu("MP_SWEAT_L")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("WARUBIARU"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("WARUBIARU"), 1766855993)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):WaitManpu()
end
function WARUBIRU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("WARUBIRU"), 1883972728)
  WINDOW:KeyWait()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("WARUBIRU"), -137152329)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
end
function DENRYUU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -288880138)
  WINDOW:Talk(SymAct("DENRYUU"), 767499601)
  WINDOW:Talk(SymAct("DENRYUU"), 883174416)
  WINDOW:Talk(SymAct("DENRYUU"), 529104851)
  WINDOW:Talk(SymAct("DENRYUU"), 110251666)
  WINDOW:Talk(SymAct("DENRYUU"), 1238620245)
  WINDOW:CloseMessage()
end
function DEDENNE(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DEDENNE"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("DEDENNE"), 1355344148)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function KUCHIITO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KUCHIITO"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  CH(chSymb0):SetManpu("MP_UPSET_LP")
  WINDOW:Talk(SymAct("KUCHIITO"), 2078653143)
  WINDOW:KeyWait()
  CH(chSymb0):ResetManpu()
  WINDOW:Talk(SymAct("KUCHIITO"), 1660849046)
  subEveNo(CH(chSymb0))
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function JIRAACHI(chSymb0)
  WINDOW:SysMsg(-446261415)
  WINDOW:SysMsg(-58874344)
  WINDOW:SysMsg(-1794934220)
  WINDOW:CloseMessage()
end
function PEROPPAFU(chSymb0)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:DrawFace(20, 88, SymAct("PEROPPAFU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.GLADNESS)
  WINDOW:Talk(SymAct("PEROPPAFU"), -1944564875)
  WINDOW:DrawFace(20, 88, SymAct("PEROPPAFU"), FACE_TYPE.GLADNESS)
  WINDOW:Talk(SymAct("PEROPPAFU"), -1489692490)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end

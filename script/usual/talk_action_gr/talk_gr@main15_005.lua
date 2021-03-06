dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1525787522, PARTNER_1 = -1139448513})
  WINDOW:CloseMessage()
end
function AAKEN(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("AAKEN"), -1757923588)
  WINDOW:CloseMessage()
  CH(chSymb0):SetManpu("MP_SWEAT_R")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.SAD)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SAD)
  WINDOW:Talk(SymAct("AAKEN"), -1910306883)
  WINDOW:CloseMessage()
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  WINDOW:Talk(SymAct("AAKEN"), -1050504838)
  WINDOW:DrawFace(20, 88, SymAct("AAKEN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("AAKEN"), -663117765)
  WINDOW:Talk(SymAct("AAKEN"), -212536328)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function BUIZERU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("BUIZERU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("BUIZERU"), -363871559)
  WINDOW:Talk(SymAct("BUIZERU"), 1842863734)
  WINDOW:DrawFace(20, 88, SymAct("BUIZERU"), FACE_TYPE.NORMAL)
  CH(chSymb0):ResetFacialMotion()
  WINDOW:Talk(SymAct("BUIZERU"), 1959587639)
  WINDOW:CloseMessage()
end
function GOOGOOTO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("GOOGOOTO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("GOOGOOTO"), -73848846)
  WINDOW:CloseMessage()
end
function MEEKURU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("MEEKURU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("MEEKURU"), -494790989)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function GOMAZOU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("GOMAZOU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("GOMAZOU"), -911260304)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function DONFAN(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DONFAN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DONFAN"), -793480143)
  WINDOW:Talk(SymAct("DONFAN"), -1611275530)
  WINDOW:CloseMessage()
end
function DOODOO(chSymb0)
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("DOODOO"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("DOODOO"), -2031168585)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function WARUBIRU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("WARUBIRU"), -1379696524)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function BURUU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("BURUU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("BURUU"), -1260867275)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function RAPURASU(chSymb0)
end
function DENRYUU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 859876858)
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("DENRYUU"), 710646971)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function DEDENNE(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DEDENNE"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("DEDENNE"), -382957540)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function KUCHIITO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KUCHIITO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KUCHIITO"), -264783523)
  WINDOW:Talk(SymAct("KUCHIITO"), -618992994)
  WINDOW:CloseMessage()
end
function JIRAACHI(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -1040065569)
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("JIRAACHI"), -1925165800)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function PEROPPAFU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PEROPPAFU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("PEROPPAFU"), -1805943719)
  WINDOW:DrawFace(20, 88, SymAct("PEROPPAFU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.GLADNESS)
  WINDOW:Talk(SymAct("PEROPPAFU"), -1082773606)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end

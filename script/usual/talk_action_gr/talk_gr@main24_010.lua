dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1511769247, PARTNER_1 = -1124136416})
  WINDOW:SwitchTalk({PARTNER_0 = -1747822109, PARTNER_1 = -1899403102})
  WINDOW:SwitchTalk({PARTNER_0 = -1047986587, PARTNER_1 = -661401820})
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = -205611801, PARTNER_1 = -358240858})
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function JIRAACHI(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("JIRAACHI"), 1832759657)
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:Talk(SymAct("JIRAACHI"), 1948680232)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function SEREBII(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("SEREBII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("SEREBII"), -338799281)
  WINDOW:Talk(SymAct("SEREBII"), -220896242)
  WINDOW:CloseMessage()
end
function NYASUPAA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -638044211)
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:Talk(SymAct("NYASUPAA"), -1058863476)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function DENRYUU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), -1885171637)
  WINDOW:Talk(SymAct("DENRYUU"), -1766219510)
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.DECIDE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:Talk(SymAct("DENRYUU"), -1114311991)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function DEDENNE(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DEDENNE"), FACE_TYPE.SURPRISE)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  WINDOW:Talk(SymAct("DEDENNE"), -624490094)
  WINDOW:Talk(SymAct("DEDENNE"), -1008977709)
  WINDOW:Talk(SymAct("DEDENNE"), -386831600)
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  subEveDoubleJump(CH(chSymb0))
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end

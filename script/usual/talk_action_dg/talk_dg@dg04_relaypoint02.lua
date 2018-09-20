dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 67931947, PARTNER_1 = 488095338})
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
end
function MOGURYUU(chSymb0)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH(chSymb0):SetManpu("MP_EXCLAMATION")
  subEveJumpSurprise(CH(chSymb0))
  CH(chSymb0):WaitManpu()
  TASK:Sleep(TimeSec(0.3))
  WINDOW:DrawFace(20, 88, SymAct("MOGURYUU"), FACE_TYPE.SPECIAL01)
  WINDOW:Talk(SymAct("MOGURYUU"), 909831593)
  WINDOW:CloseMessage()
end
function MV_STAGING_POST_ENTER()
  return "yes"
end
function MV_STAGING_POST_ENTER2()
  return "yes"
end

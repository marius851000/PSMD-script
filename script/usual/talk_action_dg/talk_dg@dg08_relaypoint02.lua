dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 944440732, PARTNER_1 = 558904541})
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.HAPPY)
  WINDOW:SwitchTalk({PARTNER_0 = 175990558, PARTNER_1 = 325473887})
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
end

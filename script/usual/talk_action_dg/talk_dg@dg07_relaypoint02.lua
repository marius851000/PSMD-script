dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = -1871073482, PARTNER_1 = -1990025609})
  WINDOW:SwitchTalk({PARTNER_0 = -1571828300, PARTNER_1 = -1152058123})
  WINDOW:CloseMessage()
  subEveNod(CH("HERO"))
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1507578857, PARTNER_1 = -1086382762})
  WINDOW:SwitchTalk({PARTNER_0 = -1810739563, PARTNER_1 = -1928757292})
  WINDOW:CloseMessage()
end

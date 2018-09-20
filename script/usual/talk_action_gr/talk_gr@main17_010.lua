dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1155410334, PARTNER_1 = 1573198047})
  WINDOW:CloseMessage()
end

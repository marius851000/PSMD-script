dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  subUsuComFuncTalkInBasePara2_01(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SURPRISE)
  WINDOW:SwitchTalk({PARTNER_0 = 392373395, PARTNER_1 = 242750930})
  WINDOW:CloseMessage()
end

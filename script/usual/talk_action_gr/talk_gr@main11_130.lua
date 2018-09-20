dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = -418951532, PARTNER_1 = -31686699})
  WINDOW:SwitchTalk({PARTNER_0 = -718197738, PARTNER_1 = -869655209})
  WINDOW:CloseMessage()
end
function CHK_DOOR_INISHIE_N(chSymb0)
  WINDOW:SysMsg(-2090103920)
  WINDOW:SysMsg(-1703888175)
  WINDOW:SysMsg(-1319245550)
  WINDOW:CloseMessage()
end

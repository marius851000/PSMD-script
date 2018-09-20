dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1489695676, PARTNER_1 = 1104265981})
  WINDOW:SwitchTalk({PARTNER_0 = 1794937150, PARTNER_1 = 1944559743})
  WINDOW:CloseMessage()
end

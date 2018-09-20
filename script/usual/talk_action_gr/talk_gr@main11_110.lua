dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -637992263, PARTNER_1 = -1058917384})
  WINDOW:SwitchTalk({PARTNER_0 = -338730949, PARTNER_1 = -220966534})
  WINDOW:CloseMessage()
end
function CHK_DOOR_INISHIE_N(chSymb0)
  WINDOW:SysMsg(-1114257475)
  WINDOW:SysMsg(-1534134532)
  WINDOW:SysMsg(-1885100737)
  WINDOW:CloseMessage()
end

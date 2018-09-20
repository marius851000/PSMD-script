dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -1650091521, PARTNER_1 = -2067879746})
  WINDOW:CloseMessage()
end
function GARUURA(chSymb0)
end
function RUCHABURU(chSymb0, bFirst)
  if bFirst then
    WINDOW:DrawFace(20, 88, SymAct("RUCHABURU"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("RUCHABURU"), -1349256323)
    WINDOW:KeyWait()
  else
  end
end

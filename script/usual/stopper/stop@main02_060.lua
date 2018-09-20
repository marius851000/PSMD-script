dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW00_ALL_CENTER()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(1485453127)
  WINDOW:Monologue(1100023302)
  WINDOW:Monologue(1790727621)
  WINDOW:CloseMessage()
end
function MV_FM_TW00_SCHOOL00()
  TR_TW00_ALL_CENTER()
end
function TR_TW00_ALL_DGFRONT02()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(1940350084)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(1021768259)
  WINDOW:SelectStart()
  WINDOW:SelectChain(637387522, 1)
  WINDOW:SelectChain(248549569, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 0 then
  else
    return "next"
  end
end

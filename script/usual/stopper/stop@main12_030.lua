dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_DG_ENTER()
  WINDOW:SysMsg(-389248174)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-237520365, 1)
  WINDOW:SelectChain(-621090352, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end
function TR_DG_BACK()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(-1008609135)
  WINDOW:Monologue(-1935651242)
  WINDOW:CloseMessage()
end

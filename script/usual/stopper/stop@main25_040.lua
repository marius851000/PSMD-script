dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_DG_ENTER()
  WINDOW:SysMsg(1870295420)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1986084925, 1)
  WINDOW:SelectChain(1565266942, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end
function TR_DG_BACK()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(1146561215)
  WINDOW:Monologue(186037368)
  WINDOW:CloseMessage()
end

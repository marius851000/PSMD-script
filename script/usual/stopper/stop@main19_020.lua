dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_DG_ENTER()
  WINDOW:SysMsg(-1012196587)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-625989036, 1)
  WINDOW:SelectChain(-241337961, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end
function TR_DG_BACK()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(-393852714)
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.DECIDE)
  WINDOW:Monologue(-1480073711)
  WINDOW:CloseMessage()
end

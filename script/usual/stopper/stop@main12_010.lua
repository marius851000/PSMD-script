dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_DG_ENTER()
  WINDOW:SysMsg(1040962930)
  WINDOW:SelectStart()
  WINDOW:SelectChain(655418419, 1)
  WINDOW:SelectChain(205371376, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end
function TR_DG_BACK()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(354846385)
  WINDOW:Monologue(1516703862)
  WINDOW:CloseMessage()
end

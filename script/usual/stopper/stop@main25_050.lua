dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_DG_ENTER()
  WINDOW:SysMsg(68804204)
  WINDOW:SelectStart()
  WINDOW:SelectChain(486731565, 1)
  WINDOW:SelectChain(909098222, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end
function TR_DG_BACK()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(791973295)
  WINDOW:Monologue(1618287464)
  WINDOW:CloseMessage()
end

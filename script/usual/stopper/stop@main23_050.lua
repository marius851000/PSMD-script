dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_DG_ENTER()
  WINDOW:SysMsg(-111483698)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-532556401, 1)
  WINDOW:SelectChain(-882080180, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end
function TR_DG_BACK()
  WINDOW:SysMsg(-763906291)
  WINDOW:CloseMessage()
end

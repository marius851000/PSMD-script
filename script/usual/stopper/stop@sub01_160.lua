dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW01_DISTRICT_C_FRONT()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.DECIDE)
  WINDOW:Monologue(224905810)
  WINDOW:Monologue(343735059)
  WINDOW:CloseMessage()
end
function MV_FM_TW01_CAFE()
  TR_TW01_DISTRICT_C_FRONT()
end
function MV_ATLAS_PLACE()
  WINDOW:SysMsg(1062316240)
  WINDOW:SelectStart()
  WINDOW:SelectChain(642423185, 1)
  WINDOW:SelectChain(1762332502, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end

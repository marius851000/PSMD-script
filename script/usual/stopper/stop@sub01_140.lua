dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_ATLAS_PLACE()
  WINDOW:SysMsg(1943042153)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1791707432, 1)
  WINDOW:SelectChain(1105599211, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end
function TR_TW01_DIST_A_DGFRONT()
  MV_FM_TW00_CAFE()
end
function TR_TW00_ALL_CENTER()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_HOME01()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_HOME02()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_HOME03()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_HOME04()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_CAFE()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.DECIDE)
  WINDOW:Monologue(1492986794)
  WINDOW:Monologue(398245229)
  WINDOW:CloseMessage()
end
function MV_FM_TW00_SCHOOL00()
  MV_FM_TW00_CAFE()
end
function TR_TW01_DISTRICT_C_FRONT()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW01_CAFE()
  MV_FM_TW00_CAFE()
end

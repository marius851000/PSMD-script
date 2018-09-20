dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_FM_TW00_ALL()
end
function MV_FM_TW00_HOME01()
end
function MV_FM_TW00_HOME02()
end
function MV_FM_TW00_HOME03()
end
function MV_FM_TW00_HOME04()
end
function MV_FM_TW00_CAFE()
end
function MV_FM_TW00_SCHOOL00()
end
function MV_FM_TW00_HILL()
end
function TR_TW00_ALL_DGFRONT02()
  WINDOW:SysMsg(1518790081)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1134417024, 1)
  WINDOW:SelectChain(1756399427, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end

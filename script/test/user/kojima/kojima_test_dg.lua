dofile("script/include/usual/inc_usual_free_char.lua")
dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function groundEnd()
end
function dungeon_test__enter_init()
end
function dungeon_test__enter_start()
  SCREEN_A:FadeIn(TimeSec(0.5), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), false)
end
function dungeon_test__enter_end()
end
function EventTriggerPush(symbol)
  if symbol == "RNG_DG_ENTER" then
    WINDOW:SysMsg(673082378)
    WINDOW:CloseMessage()
    SYSTEM:EnterDungeon(Dg(50))
  end
  if symbol == "KOARUHII" then
    if LocalFlag.WayPointSwitch == "WP0" then
      WINDOW:SysMsg(822435147)
      WINDOW:CloseMessage()
      SYSTEM:EnterDungeon(Dg(50), DG_WAYPOINT.POINT00)
    elseif LocalFlag.WayPointSwitch == "WP1" then
      WINDOW:SysMsg(438832776)
      WINDOW:CloseMessage()
      SYSTEM:EnterDungeon(Dg(50), DG_WAYPOINT.POINT01)
    elseif LocalFlag.WayPointSwitch == "DEAD" then
      WINDOW:SysMsg(53690313)
      WINDOW:CloseMessage()
      SYSTEM:EnterDungeon(Dg(50))
    end
  end
end
function dungeon_test__clear_init()
end
function dungeon_test__clear_start()
  SCREEN_A:FadeIn(TimeSec(0.5), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), false)
  WINDOW:SysMsg(1282582798)
  WINDOW:CloseMessage()
end
function dungeon_test__clear_end()
end
function dungeon_test__wayPoint0_init()
end
function dungeon_test__wayPoint0_start()
  SCREEN_A:FadeIn(TimeSec(0.5), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), false)
  WINDOW:SysMsg(1432983631)
  WINDOW:CloseMessage()
end
function dungeon_test__wayPoint0_end()
end
function dungeon_test__wayPoint1_init()
end
function dungeon_test__wayPoint1_start()
  SCREEN_A:FadeIn(TimeSec(0.5), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), false)
  WINDOW:SysMsg(2118437772)
  WINDOW:CloseMessage()
end
function dungeon_test__wayPoint1_end()
end
function dungeon_test__failed_init()
end
function dungeon_test__failed_start()
  SCREEN_A:FadeIn(TimeSec(0.5), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), false)
  WINDOW:SysMsg(1734343373)
  WINDOW:CloseMessage()
end
function dungeon_test__failed_end()
end

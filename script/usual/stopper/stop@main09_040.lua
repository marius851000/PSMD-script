dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW00_HOME_01_WINDOW02()
  WINDOW:SysMsg(-834054608)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-682465423, 1)
  WINDOW:SelectChain(-58772302, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.NORMAL)
    WINDOW:Monologue(-446429709)
    WINDOW:CloseMessage()
    SCREEN_A:FadeOut(TimeSec(0.5), true)
    SOUND:PlaySe(SymSnd("SE_EVT_NUKEDASU"))
    SOUND:WaitSe(SymSnd("SE_EVT_NUKEDASU"))
    TASK:Sleep(TimeSec(0.5))
    return "next"
  else
  end
end
function TR_TW00_HOME_01_WINDOW03()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(-1440378060)
  WINDOW:Monologue(-1287740811)
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(SymPos("POINT_WINDOW"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(-1743523402)
  WINDOW:CloseMessage()
end
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

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW00_HOME_01_WINDOW02()
  WINDOW:SysMsg(660742264)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1048121657, 1)
  WINDOW:SelectChain(357843706, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end
function TR_TW00_HOME_01_WINDOW03()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(206533563)
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(SymPos("POINT_WINDOW"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(1125049724)
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

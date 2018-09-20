dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW00_ALL_DGFRONT02()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:SysMsg(-1353060697)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-1237131290, 1)
  WINDOW:SelectChain(-1653634011, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end
function TR_TW00_TO_SCHOOL_NOTROOM()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -2072724124, PARTNER_1 = -885707869})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -768730398, PARTNER_1 = -117225183})
  WINDOW:SwitchTalk({PARTNER_0 = -535267232, PARTNER_1 = 1736467631})
  WINDOW:CloseMessage()
end
function TR_TW00_ALL_CENTER()
  TR_TW00_TO_SCHOOL_NOTROOM()
end

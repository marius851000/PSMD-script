dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_FM_TW00_ALL()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = 1680033735, PARTNER_1 = 2100852358})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = 1444226373, PARTNER_1 = 1326322692})
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetFacialMotion()
end
function TR_TW00_ALL_CENTER()
  MV_FM_TW00_ALL()
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
  MV_FM_TW00_ALL()
end
function MV_FM_TW00_SCHOOL00()
  MV_FM_TW00_ALL()
end
function MV_FM_TW00_HILL()
end
function TR_TW00_ALL_DGFRONT02()
  WINDOW:SysMsg(5210819)
  WINDOW:SelectStart()
  WINDOW:SelectChain(424981378, 1)
  WINDOW:SelectChain(846848065, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end

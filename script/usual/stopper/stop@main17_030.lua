dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW01_DISTRICT_C_FRONT()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = 1798188193, PARTNER_1 = 1916083680})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = 1494765091, PARTNER_1 = 1073971042})
  WINDOW:SwitchTalk({PARTNER_0 = 256043429, PARTNER_1 = 374986980})
  WINDOW:SwitchTalk({PARTNER_0 = 1031047975, PARTNER_1 = 611301990})
  WINDOW:CloseMessage()
end
function MV_FM_TW01_CAFE()
  TR_TW01_DISTRICT_C_FRONT()
end
function TR_TW01_DIST_A_DGFRONT()
  WINDOW:SysMsg(-1544051031)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-1158899736, 1)
  WINDOW:SelectChain(-1545090804, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW02_RAPURASU_ENTER()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("AAKEN"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = -184830344, PARTNER_1 = -304052423})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.SPECIAL02)
  WINDOW:SwitchTalk({PARTNER_0 = -959589126, PARTNER_1 = -539564613})
  WINDOW:CloseMessage()
end
function TR_TW02_ALL_DGFRONT()
  WINDOW:SysMsg(-1869122692)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-1987296707, 1)
  WINDOW:SelectChain(-1566502402, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end

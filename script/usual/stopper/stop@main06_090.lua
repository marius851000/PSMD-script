dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_FM_TW00_SCHOOL00()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1635572087, PARTNER_1 = 2020075574})
  WINDOW:CloseMessage()
end
function TR_TW00_ALL_DGFRONT02()
  WINDOW:SysMsg(1397406709)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1246857908, 1)
  WINDOW:SelectChain(84941939, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "next"
  else
  end
end

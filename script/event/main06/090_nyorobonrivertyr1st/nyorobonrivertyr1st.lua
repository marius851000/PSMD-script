dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main06_nyorobonrivertyr1st01_init()
end
function main06_nyorobonrivertyr1st01_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:DrawFaceF(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1550020066, PARTNER_1 = 1165515939})
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = 1851068256, PARTNER_1 = 2001616417})
  WINDOW:SwitchTalk({PARTNER_0 = 940550374, PARTNER_1 = 554998183})
  subEveCloseMsg()
  WINDOW:SysMsg(171559524)
  WINDOW:SelectStart()
  WINDOW:SelectChain(321059621, 1)
  WINDOW:SelectChain(-1799690262, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    SCREEN_A:FadeOut(TimeSec(0.5), true)
    return "select1"
  else
    SCREEN_A:FadeOut(TimeSec(0.5), true)
    return "select2"
  end
end
function main06_nyorobonrivertyr1st01_end()
end
function groundEnd()
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main22_kodaiisekitry2nd01_init()
end
function main22_kodaiisekitry2nd01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("RAPURASU"):SetShadow(false)
  CH("RAPURASU"):SetNeckRot(RotateTarget(-30), RotateTarget(0), RotateTarget(0), TimeSec(0))
  SOUND:FadeInEnv(SymSnd("SE_ENV_SEA_02_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  subEveFadeAfterTime()
  WINDOW:DrawFace(324, 88, SymAct("RAPURASU2"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RAPURASU2"), -1286850770)
  subEveCloseMsg()
  WINDOW:Talk(SymAct("RAPURASU2"), -1437137297)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-2122689108, 1)
  WINDOW:SelectChain(-1738447635, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    subEveCloseMsg()
    CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.2))
    CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("OOBEMU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH("OOBEMU"):WaitRotate()
    WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
    WINDOW:SwitchTalk({PARTNER_0 = -685706710, PARTNER_1 = -834944149})
    WINDOW:CloseMessage()
    subEveNod(CH("HERO"))
    SOUND:FadeOutEnv(TimeSec(0.8))
    SCREEN_A:FadeOut(TimeSec(1), true)
    TASK:Sleep(TimeSec(1))
    return "select1"
  else
    WINDOW:CloseMessage()
    SOUND:FadeOutEnv(TimeSec(0.5))
    SCREEN_A:FadeOut(TimeSec(0.5), true)
    return "select2"
  end
end
function main22_kodaiisekitry2nd01_end()
end
function groundEnd()
end

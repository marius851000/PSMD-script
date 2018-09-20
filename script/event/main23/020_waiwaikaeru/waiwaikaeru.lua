dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main23_waiwaikaeru01_init()
end
function main23_waiwaikaeru01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:FadeInEnv(SymSnd("SE_ENV_SEA_02_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  WINDOW:DrawFace(20, 88, SymAct("RAPURASU2"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("RAPURASU2"), -1510463371)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-1125967564, 1)
  WINDOW:SelectChain(-1748088073, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    SOUND:FadeOutEnv(TimeSec(1))
    SCREEN_A:FadeOut(TimeSec(0.5), true)
    TASK:Sleep(TimeSec(0.5))
    return "select1"
  end
  SOUND:FadeOutEnv(TimeSec(1))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  return "select2"
end
function main23_waiwaikaeru01_end()
end
function groundEnd()
end

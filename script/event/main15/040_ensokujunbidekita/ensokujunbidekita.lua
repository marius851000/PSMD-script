dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main15_ensokujunbidekita01_init()
end
function main15_ensokujunbidekita01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  WINDOW:DrawFace(272, 16, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DEDENNE"), -66842134)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-450944853, 1)
  WINDOW:SelectChain(-835554456, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    WINDOW:DrawFace(272, 16, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("DEDENNE"), -685161943)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-1737960210, 1)
    WINDOW:SelectChain(-2123110993, 0)
    WINDOW:DefaultCursor(0)
    local id2 = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    if id2 == 1 then
      CH("DEDENNE"):SetFacialMotion(FACIAL_MOTION.HAPPY)
      WINDOW:DrawFace(272, 16, SymAct("DEDENNE"), FACE_TYPE.HAPPY)
      WINDOW:Talk(SymAct("DEDENNE"), -1436633492)
      WINDOW:Talk(SymAct("DEDENNE"), -1287289043)
      WINDOW:Talk(SymAct("DEDENNE"), 886938594)
      WINDOW:CloseMessage()
      SCREEN_A:FadeOut(TimeSec(0.5), true)
      CH("DEDENNE"):ResetFacialMotion()
      return "select1"
    else
      WINDOW:DrawFace(272, 16, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
      WINDOW:Talk(SymAct("DEDENNE"), 767994531)
      WINDOW:Talk(SymAct("DEDENNE"), -402488071)
      WINDOW:CloseMessage()
      SCREEN_A:FadeOut(TimeSec(0.3), true)
      return "select2"
    end
  else
    WINDOW:DrawFace(272, 16, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("DEDENNE"), -249973320)
    WINDOW:Talk(SymAct("DEDENNE"), -634067333)
    WINDOW:CloseMessage()
    SCREEN_A:FadeOut(TimeSec(0.3), true)
    return "select2"
  end
end
function main15_ensokujunbidekita01_end()
end
function groundEnd()
end

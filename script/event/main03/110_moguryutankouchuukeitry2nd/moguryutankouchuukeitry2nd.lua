dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main03_moguryutankouchuukeitry2nd01_init()
end
function main03_moguryutankouchuukeitry2nd01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("SE_EVT_DROP_WATER_LP"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("MOGURYUU"):SetManpu("MP_EXCLAMATION")
  CH("MOGURYUU"):WaitManpu()
  WINDOW:DrawFace(324, 20, SymAct("MOGURYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MOGURYUU"), 1872069223)
  subEveCloseMsg()
  WINDOW:SysMsg(1989063462)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1571021029, 1)
  WINDOW:SelectChain(1152962980, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    CH("HERO"):RunTo(SymPos("P00_HERO"), Speed(3))
    TASK:Sleep(TimeSec(0.2))
    CH("PARTNER"):RunTo(SymPos("P02_PARTNER"), Speed(3))
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
    CH("MOGURYUU"):SetManpu("MP_SHOCK_L")
    CH("MOGURYUU"):WaitManpu()
    WINDOW:DrawFace(324, 20, SymAct("MOGURYUU"), FACE_TYPE.SURPRISE)
    WINDOW:Talk(SymAct("MOGURYUU"), 200886115)
    WINDOW:CloseMessage()
    SOUND:FadeOutBgm(TimeSec(0.5))
    SCREEN_A:FadeOut(TimeSec(0.5), true)
    return "select1"
  else
    SCREEN_A:FadeOut(TimeSec(0.5), true)
    return "select2"
  end
end
function main03_moguryutankouchuukeitry2nd01_end()
end
function groundEnd()
end

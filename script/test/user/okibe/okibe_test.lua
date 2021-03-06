dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function okibe_test_init()
end
function okibe_test_start()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SCENE:SetupGroup(SymGroup("GR1"))
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  SCREEN_B:FadeOut(TimeSec(0), false)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SCREEN_A:FadeOut(TimeSec(0), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), true)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:SysMsg(219678010)
  WINDOW:CloseMessage()
  SCENE:SetupGroup(SymGroup("GR2"))
  WINDOW:SysMsg(335754363)
  WINDOW:CloseMessage()
  SCENE:UnvisibleGroup(SymGroup("GR1"))
  WINDOW:SysMsg(1060005816)
  WINDOW:CloseMessage()
  SCENE:UnvisibleGroup(SymGroup("GR2"))
  SCENE:SetupGroup(SymGroup("GR3"))
  WINDOW:SysMsg(641029881)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(1769259070)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  WINDOW:SysMsg(1886384511)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(1531093692)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  WINDOW:SysMsg(1113166845)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(-977170638)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(-589644173)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function okibe_test_end()
end
function Scene_test01_init()
end
function Scene_test01_start()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  SCENE:SetupGroup(SymGroup("GR1"))
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  SCREEN_B:FadeOut(TimeSec(0), false)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SCREEN_A:FadeOut(TimeSec(0), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), true)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:SysMsg(1944085639)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(1794856390)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0), true)
end
function Scene_test01_end()
end
function Scene_test02_init()
end
function Scene_test02_start()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  SCREEN_A:FadeIn(TimeSec(0), true)
  WINDOW:SysMsg(1104545285)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(1489844036)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function Scene_test02_end()
end
function Scene_test02_div_init()
end
function Scene_test02_div_start()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  SCREEN_A:FadeIn(TimeSec(0), true)
  WINDOW:SysMsg(395092355)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(244814018)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function Scene_test02_div_end()
end
function groundEnd()
end

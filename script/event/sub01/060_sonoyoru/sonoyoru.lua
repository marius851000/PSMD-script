dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function sub01_sonoyoru01_init()
end
function sub01_sonoyoru01_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function sub01_sonoyoru01_end()
end
function sub01_sonoyoru02_init()
end
function sub01_sonoyoru02_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_04"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.3))
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(-913743669)
  WINDOW:Monologue(-795717238)
  WINDOW:Monologue(-71368119)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function sub01_sonoyoru02_end()
end
function sub01_sonoyoru03_init()
end
function sub01_sonoyoru03_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHOUSADAN_04"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  MAP:SetVisible(false)
  MAP:SetBG(SymImg("IMEV1201"))
  MAP:SetVisibleBG(true)
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(-492555512)
  WINDOW:Monologue(-1377458737)
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(1), true)
  MAP:SetVisible(true)
  MAP:SetVisibleBG(false)
  TASK:Sleep(TimeSec(1))
end
function sub01_sonoyoru03_end()
end
function groundEnd()
end

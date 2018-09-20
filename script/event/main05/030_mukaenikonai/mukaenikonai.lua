dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main05_mukaenikonai01_init()
end
function main05_mukaenikonai01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(1))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1.5))
  SOUND:FadeInEnv(SymSnd("SE_ENV_BREEZE_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("HERO"):WaitMove()
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(SymPos("P00_ABAHOME"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SAD)
  WINDOW:Monologue(-2084948201)
  WINDOW:CloseMessage()
  SOUND:FadeOutEnv(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main05_mukaenikonai01_end()
end
function groundEnd()
end

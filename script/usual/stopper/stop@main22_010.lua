dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function TR_TW01_DIST_A_DGFRONT()
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = 320153663, PARTNER_1 = 168696190})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(500), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = 555961021, PARTNER_1 = 943225852})
  WINDOW:SwitchTalk({PARTNER_0 = 2004479291, PARTNER_1 = 1851972730})
  WINDOW:CloseMessage()
  CH("PARTNER"):ResetFacialMotion()
end
function MV_FM_TW01_CAFE()
  TR_TW01_DIST_A_DGFRONT()
end
function TR_TW01_DISTRICT_C_FRONT()
  TR_TW01_DIST_A_DGFRONT()
end

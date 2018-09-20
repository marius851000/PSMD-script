dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_FM_TW00_ALL()
end
function MV_FM_TW00_HOME01()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_HOME02()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_HOME03()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_HOME04()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_CAFE()
  CH("HERO"):SetMotionRaito(Raito(1))
  CH("PARTNER"):SetMotionRaito(Raito(1))
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -986104567, PARTNER_1 = -601748408})
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:SwitchTalk({PARTNER_0 = -149987445, PARTNER_1 = -300650806})
  WINDOW:SwitchTalk({PARTNER_0 = -1588201459, PARTNER_1 = -1202796212})
  WINDOW:CloseMessage()
end
function MV_FM_TW00_SCHOOL00()
  MV_FM_TW00_CAFE()
end
function MV_FM_TW00_HILL()
  MV_FM_TW00_CAFE()
end

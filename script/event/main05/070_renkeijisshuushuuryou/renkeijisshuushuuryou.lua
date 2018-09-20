dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main05_renkeijisshuushuuryou01_init()
end
function main05_renkeijisshuushuuryou01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(1))
  TASK:Sleep(TimeSec(0.3))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("MIRUHOGGU"):SetMotion(SymMot("CONFUSE"), LOOP.ON, TimeSec(0))
  SOUND:PlayBgm(SymSnd("BGM_EVE_ZANNEN_04"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.3))
  WINDOW:DrawFace(72, 16, SymAct("MIRUHOGGU"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 2073414669)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1653538124)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1235463823)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  TASK:Sleep(TimeSec(0.2))
  local taskMiruhoggu00 = function()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
    CH("MIRUHOGGU"):SetManpu("MP_SHOCK_R")
    CH("MIRUHOGGU"):SetMotion(SymMot("FALL"), LOOP.OFF)
    TASK:Sleep(TimeSec(0.3))
    SOUND:PlaySe(SymSnd("SE_EVT_DOWN_LIGHT"))
    CH("MIRUHOGGU"):WaitPlayMotion()
    CH("MIRUHOGGU"):SetMotion(SymMot("SLEEPLOOP"), LOOP.ON)
  end
  TASK:Regist(taskMiruhoggu00)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1354276814)
  CH("PARTNER"):SetManpu("MP_SHOCK_R")
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("KOIRU"):SetManpu("MP_FLY_SWEAT")
  CH("SHIKIJIKA_SPRING"):SetManpu("MP_EXCLAMATION")
  TASK:Sleep(TimeSec(0.1))
  CH("YANCHAMU"):SetManpu("MP_SHOCK_R")
  CH("CHOBOMAKI"):SetManpu("MP_EXCLAMATION")
  CH("NUMERA"):SetManpu("MP_FLY_SWEAT")
  CH("REAKOIRU"):SetManpu("MP_FLY_SWEAT")
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveMoveDir, {
    CH("PARTNER"),
    SymPos("P00_PARTNER"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Regist(subEveMoveDir, {
    CH("CHOBOMAKI"),
    SymPos("P00_CHOBOMAKI"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Sleep(TimeSec(0.1))
  TASK:Regist(subEveMoveDir, {
    CH("HERO"),
    SymPos("P00_HERO"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Regist(subEveMoveDir, {
    CH("YANCHAMU"),
    SymPos("P00_YANCHAMU"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Sleep(TimeSec(0.1))
  TASK:Regist(subEveMoveDir, {
    CH("NUMERA"),
    SymPos("P00_NUMERA"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Regist(subEveMoveDir, {
    CH("SHIKIJIKA_SPRING"),
    SymPos("P00_SHIKIJIKA"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  TASK:Regist(subEveMoveDir, {
    CH("NYASUPAA"),
    SymPos("P00_NYASUPAA"),
    Speed(3),
    CH("MIRUHOGGU")
  })
  WINDOW:Talk(SymWord(-842874751), 536414473)
  CH("JIBAKOIRU"):SetManpu("MP_FLY_SWEAT")
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  TASK:Sleep(TimeSec(0.3))
  CH("MIRUHOGGU"):MoveTo(PosOffs(0.01, -0.01), Speed(8), LINK_DIR.OFF)
  CH("MIRUHOGGU"):WaitMove()
  CH("MIRUHOGGU"):MoveTo(PosOffs(-0.01, 0.01), Speed(8), LINK_DIR.OFF)
  CH("MIRUHOGGU"):WaitMove()
  CH("MIRUHOGGU"):MoveTo(PosOffs(0.01, -0.01), Speed(8), LINK_DIR.OFF)
  CH("MIRUHOGGU"):WaitMove()
  CH("MIRUHOGGU"):MoveTo(PosOffs(-0.01, 0.01), Speed(8), LINK_DIR.OFF)
  CH("MIRUHOGGU"):WaitMove()
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 115488840)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 768568203)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 886332106)
  WINDOW:Talk(SymAct("MIRUHOGGU"), -1286846971)
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(1), true)
  TASK:Sleep(TimeSec(0.7))
  SOUND:PlaySe(SymSnd("SE_EVT_SCHOOL_CHIME"))
  WINDOW:SysMsg(-1437108412)
  SOUND:WaitSe(SymSnd("SE_EVT_SCHOOL_CHIME"))
  WINDOW:ForceCloseMessage()
  TASK:Sleep(TimeSec(0.2))
  WINDOW:Talk(SymWord(2093398760), 23054378)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("TABUNNE"), 407173483)
  WINDOW:Talk(SymAct("TABUNNE"), 862562984)
  WINDOW:CloseMessage()
end
function main05_renkeijisshuushuuryou01_end()
end
function main05_renkeijisshuushuuryou02_init()
end
function main05_renkeijisshuushuuryou02_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  GIMMICK:SetupLoopPlaced(SymGA("SCHOOL_ROAD"), 0, -10)
  GIMMICK:MoveLoopPlaced(Speed(0.8))
  GIMMICK:SetLoopPlacedLeftMode()
  CH("HERO"):SetMotion(SymMot("WALK"), LOOP.ON)
  CH("HERO"):SetNeckRot(RotateTarget(0), RotateTarget(-20), RotateTarget(0), TimeSec(0))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(1), true)
  TASK:Sleep(TimeSec(1))
end
function main05_renkeijisshuushuuryou02_end()
end
function main05_renkeijisshuushuuryou03_init()
end
function main05_renkeijisshuushuuryou03_start()
  WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), 712154089)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetDir(RotateTarget(-45))
  CH("HERO"):SetMotion(SymMot("EV001_SLEEP01"), LOOP.ON, TimeSec(0))
  local taskWakeUpHero = function()
    CH("HERO"):SetMotion(SymMot("EV001_SLEEP02"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  end
  SOUND:PlayBgm(SymSnd("BGM_EVE_KONOHANANOIE"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  TASK:Regist(Group("grpHero"), taskWakeUpHero)
  TASK:WaitTask(Group("grpHero"))
  TASK:Sleep(TimeSec(0.3))
  CAMERA:MoveToHero(Speed(4, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
end
function main05_renkeijisshuushuuryou03_end()
end
function groundEnd()
end

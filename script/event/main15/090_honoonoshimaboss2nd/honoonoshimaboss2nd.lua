dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main15_honoonoshimaboss2nd01_init()
end
function main15_honoonoshimaboss2nd01_start()
  TASK:Sleep(TimeSec(1))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetMotion(SymMot("BATTLE"), LOOP.ON, TimeSec(0))
  CH("PARTNER"):SetMotion(SymMot("BATTLE"), LOOP.ON, TimeSec(0))
  CH("BUIZERU"):SetMotion(SymMot("BATTLE"), LOOP.ON, TimeSec(0))
  SOUND:PlayBgm(SymSnd("BGM_EVE_TENSION_01"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  WINDOW:DrawFace(272, 16, SymAct("BUUBAAN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUUBAAN"), 626209654)
  WINDOW:Talk(SymAct("BUUBAAN"), 1011352119)
  WINDOW:Talk(SymAct("BUUBAAN"), 392516084)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  WINDOW:DrawFace(324, 88, SymAct("BUIZERU"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("BUIZERU"), 243163317)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  CH("BUUBAAN"):SetMotion(SymMot("BATTLE"), LOOP.ON, TimeSec(0.2))
  WINDOW:DrawFace(272, 16, SymAct("BUUBAAN"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("BUUBAAN"), 1094710898)
  WINDOW:Talk(SymAct("BUUBAAN"), 1478805299)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  local taskBuubaa_00 = function()
    CH("BUUBAA"):SetManpu("MP_SPREE_LP")
    TASK:Regist(subEveDoubleJump, {
      CH("BUUBAA")
    })
  end
  local taskBuubaa2_00 = function()
    CH("BUUBAA2"):SetManpu("MP_SPREE_LP")
    TASK:Regist(subEveDoubleJump, {
      CH("BUUBAA2")
    })
  end
  local taskBuubaa3_00 = function()
    CH("BUUBAA3"):SetManpu("MP_SPREE_LP")
    TASK:Regist(subEveDoubleJump, {
      CH("BUUBAA3")
    })
  end
  local taskBuubaa4_00 = function()
    CH("BUUBAA4"):SetManpu("MP_SPREE_LP")
    TASK:Regist(subEveDoubleJump, {
      CH("BUUBAA4")
    })
  end
  TASK:Regist(taskBuubaa_00)
  TASK:Regist(taskBuubaa2_00)
  TASK:Sleep(TimeSec(0.1))
  TASK:Regist(taskBuubaa3_00)
  TASK:Regist(taskBuubaa4_00)
  CAMERA:MoveFollow2(SymCam("CAMERA_06"), Speed(15, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  WINDOW:Talk(SymAct("BUUBAA"), 1930007792)
  CAMERA:WaitMove()
  TASK:WaitTask()
  WINDOW:CloseMessage()
  CH("BUUBAA"):ResetManpu()
  CH("BUUBAA2"):ResetManpu()
  CH("BUUBAA3"):ResetManpu()
  CH("BUUBAA4"):ResetManpu()
  CH("BUUBAA"):SetMotion(SymMot("BATTLE"), LOOP.ON, TimeSec(0.2))
  CH("BUUBAA2"):SetMotion(SymMot("BATTLE"), LOOP.ON, TimeSec(0.2))
  TASK:Sleep(TimeSec(0.1))
  CH("BUUBAA3"):SetMotion(SymMot("BATTLE"), LOOP.ON, TimeSec(0.2))
  CH("BUUBAA4"):SetMotion(SymMot("BATTLE"), LOOP.ON, TimeSec(0.2))
  subEveFlash2()
  SOUND:FadeOutBgm(TimeSec(0.5))
  SOUND:PlaySe(SymSnd("SE_EVT_BOSS_WIPE"), Volume(256))
  EFFECT:BossWipe(TimeSec(60, TIME_TYPE.FRAME), true)
  CAMERA:SetDefaultGroundFovy()
  SYSTEM:SetNextDungeonBanner(false)
end
function main15_honoonoshimaboss2nd01_end()
end
function groundEnd()
end

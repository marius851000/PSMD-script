dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main04_ippikidegakkouhe01_init()
end
function main04_ippikidegakkouhe01_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):WalkTo(SplinePath(SymSpl("S00_HERO")), Speed(1.5))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("HERO"):WaitMove()
  local taskLookAt01 = function()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
    CH("HERO"):SetManpu("MP_EXCLAMATION")
    CH("HERO"):WaitManpu()
    CH("HERO"):DirTo(RotateTarget(0), Speed(350), ROT_TYPE.NEAR)
  end
  TASK:Regist(taskLookAt01)
  WINDOW:SwitchTalk({PARTNER_0 = 1378407479, PARTNER_1 = 1261692278})
  WINDOW:SwitchTalk({PARTNER_0 = 1612625589, PARTNER_1 = 2030405620})
  WINDOW:SwitchTalk({PARTNER_0 = 910430515, PARTNER_1 = 794763378})
  WINDOW:SwitchTalk({PARTNER_0 = 74609585, PARTNER_1 = 493437680})
  WINDOW:CloseMessage()
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SAD)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SAD)
  WINDOW:Monologue(-1695457729)
  WINDOW:Monologue(-2081788034)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.3), true)
end
function main04_ippikidegakkouhe01_end()
end
function groundEnd()
end

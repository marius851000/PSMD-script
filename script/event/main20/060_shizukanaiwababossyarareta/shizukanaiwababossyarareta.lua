dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main20_shizukanaiwababossyarareta01_init()
end
function main20_shizukanaiwababossyarareta01_start()
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.PAIN)
  WINDOW:SwitchTalk({PARTNER_0 = -428242561, PARTNER_1 = -10307522})
  WINDOW:KeyWait()
  SCREEN_A:FadeOutAll(TimeSec(0.5), true)
  WINDOW:ForceCloseMessage()
  TASK:Sleep(TimeSec(0.5))
  SCREEN_A:FadeInAll(TimeSec(0), true)
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SOUND:PlayBgm(SymSnd("SE_ENV_FOREST_NIGHT_LP"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("AAKEN"):SetFacialMotion(FACIAL_MOTION.SAD)
  CH("AAKEN"):SetManpu("MP_FLY_SWEAT")
  CH("AAKEN"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("AAKEN"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("AAKEN"), -732959747)
  subEveCloseMsg()
  CH("AAKEN"):ResetFacialMotion()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -850076996, PARTNER_1 = -2112533381})
  WINDOW:SwitchTalk({PARTNER_0 = -1693549254, PARTNER_1 = -1339871495})
  subEveCloseMsg()
  CH("PARTNER"):ResetFacialMotion()
  WINDOW:DrawFace(20, 88, SymAct("KUCHIITO"), FACE_TYPE.SPECIAL02)
  WINDOW:Talk(SymAct("KUCHIITO"), -1455939656)
  subEveCloseMsg()
  WINDOW:DrawFace(324, 20, SymAct("DEDENNE"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("DEDENNE"), 782238583)
  WINDOW:Talk(SymAct("DEDENNE"), 935014966)
  WINDOW:Talk(SymAct("DEDENNE"), 450952109)
  WINDOW:CloseMessage()
  CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.DECIDE)
  TASK:Regist(subEveDoubleJump, {
    CH("PARTNER")
  })
  WINDOW:DrawFace(72, 16, SymAct("PARTNER"), FACE_TYPE.DECIDE)
  WINDOW:SwitchTalk({PARTNER_0 = 66833132, PARTNER_1 = 685152559})
  TASK:WaitTask()
  WINDOW:CloseMessage()
  local taskUnun00 = function()
    subEveNod(CH("HERO"))
  end
  local taskUnun01 = function()
    subEveNod(CH("PARTNER"))
  end
  local taskUnun02 = function()
    subEveNod(CH("DEDENNE"))
  end
  local taskUnun03 = function()
    subEveNod(CH("KUCHIITO"))
  end
  local taskUnun05 = function()
    subEveNod(CH("AAKEN"))
  end
  TASK:Regist(taskUnun00)
  TASK:Regist(taskUnun01)
  TASK:Regist(taskUnun02)
  TASK:Regist(taskUnun03)
  TASK:Regist(taskUnun05)
  TASK:Sleep(TimeSec(0.7))
  CH("PARTNER"):ResetFacialMotion()
  CAMERA:MoveToHero(Speed(7, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
end
function main20_shizukanaiwababossyarareta01_end()
end
function groundEnd()
end

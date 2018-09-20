dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function sub01_mysteryjungleclear1st01_init()
end
function sub01_mysteryjungleclear1st01_start()
  TASK:Sleep(TimeSec(1))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SPECIAL02)
  WINDOW:Monologue(178467677)
  WINDOW:Monologue(330826268)
  WINDOW:KeyWait()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(949309919)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1.5))
  SOUND:FadeInEnv(SymSnd("SE_ENV_BREEZE_LP"), TimeSec(0.5), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("HERO"):WaitMove()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(562978974)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("HERO"):DirTo(RotateTarget(45), Speed(200), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.3))
  CH("HERO"):SetMotion(SymMot("EV001_CONFIRMS"), LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(1859122777)
  WINDOW:Monologue(2010433304)
  WINDOW:CloseMessage()
  CH("HERO"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CH("MYUU"):WalkTo(SymPos("P00_MYUU"), Speed(1.5))
  CH("HERO"):DirTo(RotateTarget(-90), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  SOUND:FadeOutEnv(TimeSec(1))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(1559860443)
  WINDOW:CloseMessage()
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHUKEI"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  CAMERA:MoveFollow2(SymCam("CAMERA_03_5"), Speed(0.2, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  TASK:Sleep(TimeSec(3.5))
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  CH("MYUU"):WalkTo(SymPos("P01_MYUU"), Speed(2))
  CH("MYUU"):WaitMove()
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  CH("MYUU"):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH("MYUU")
  })
  WINDOW:DrawFace(20, 88, SymAct("MYUU"), FACE_TYPE.EMOTION)
  WINDOW:Talk(SymAct(""), 1172481434)
  WINDOW:Talk(SymAct(""), -1032144555)
  WINDOW:CloseMessage()
  CH("MYUU"):ResetManpu()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):SetMotion(SymMot("SPEAK"), LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_15"))
  CAMERA:SetTgt(SymCam("CAMERA_15"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("MYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct(""), -614365164)
  WINDOW:KeyWait()
  CH("MYUU"):SetManpu("MP_LAUGH_LP")
  CH("MYUU"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("MYUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct(""), -1763308603)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(-1879229820)
  WINDOW:Monologue(-1529845433)
  WINDOW:CloseMessage()
  CH("MYUU"):ResetManpu()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  TASK:Sleep(TimeSec(0.2))
  TASK:Regist(subEveJump, {
    CH("MYUU")
  })
  WINDOW:DrawFace(20, 20, SymAct("MYUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("MYUU"), -1110747130)
  WINDOW:CloseMessage()
  CH("MYUU"):ResetFacialMotion()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("MYUU"):SetManpu("MP_NOTICE_R")
  CH("MYUU"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("MYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MYUU"), -225784127)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_15"))
  CAMERA:SetTgt(SymCam("CAMERA_15"))
  subEveNod(CH("HERO"))
  TASK:Sleep(TimeSec(0.3))
  CH("HERO"):SetMotion(SymMot("SPEAK"), LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.5))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("MYUU"):SetManpu("MP_QUESTION")
  CH("MYUU"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("MYUU"), FACE_TYPE.THINK)
  WINDOW:Talk(SymAct("MYUU"), -342753408)
  WINDOW:Talk(SymAct("MYUU"), -1061376957)
  WINDOW:Talk(SymAct("MYUU"), -643326718)
  WINDOW:CloseMessage()
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(1581220301)
  WINDOW:CloseMessage()
  CH("HERO"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 20, SymAct("MYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MYUU"), 1193586828)
  WINDOW:Talk(SymAct("MYUU"), -2074893269)
  WINDOW:KeyWait()
  CH("MYUU"):SetManpu("MP_LAUGH_LP")
  CH("MYUU"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Regist(subEveDoubleJump, {
    CH("MYUU")
  })
  WINDOW:DrawFace(20, 20, SymAct("MYUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("MYUU"), -1656187542)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("HERO"):SetManpu("MP_SHOCK_L")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(20, 20, SymAct("MYUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("MYUU"), -1234843991)
  WINDOW:CloseMessage()
  CH("MYUU"):ResetManpu()
  local taskMyuu00 = function()
    function TaskL.Loop()
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("MYUU"):SetManpu("MP_SPREE_LP")
      TASK:Regist(subEveDoubleJump, {
        CH("MYUU")
      })
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Regist(subEveDoubleJump, {
        CH("MYUU")
      })
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("MYUU"):ResetManpu()
      CH("MYUU"):SetMotion(SymMot("WAIT00"), LOOP.ON)
      CH("MYUU"):SetMotionRaito(Raito(2))
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      CH("MYUU"):SetManpu("MP_LAUGH_LP")
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      CH("MYUU"):ResetManpu()
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(0.25))
    end
    function TaskL.Finish()
      CH("MYUU"):ResetManpu()
      CH("MYUU"):SetMotion(SymMot("WAIT02"), LOOP.ON)
      CH("MYUU"):SetMotionRaito(Raito(1))
      return
    end
  end
  TASK:Regist(Group("grpMyuu"), taskMyuu00)
  TASK:Sleep(TimeSec(2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  CH("HERO"):SetManpu("MP_SWEAT_L")
  CH("HERO"):WaitManpu()
  TASK:Sleep(TimeSec(0.5))
  CAMERA:SetEye(SymCam("CAMERA_14"))
  CAMERA:SetTgt(SymCam("CAMERA_14"))
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.THINK)
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(-1350633496)
  WINDOW:Monologue(-532717265)
  WINDOW:Monologue(-115060626)
  WINDOW:CloseMessage()
  CH("HERO"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 20, SymAct("MYUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("MYUU"), -771161171)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_14"))
  CAMERA:SetTgt(SymCam("CAMERA_14"))
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SAD)
  CH("HERO"):SetNeckRot(RotateTarget(0), RotateTarget(-30), RotateTarget(0), TimeSec(0.3))
  CH("HERO"):WaitNeckRot()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SAD)
  WINDOW:Monologue(-887999764)
  WINDOW:Monologue(1284124195)
  WINDOW:Monologue(1435574114)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_15"))
  CAMERA:SetTgt(SymCam("CAMERA_15"))
  TASK:ExitNotifyTasks(Group("grpMyuu"))
  TASK:WaitTask()
  CH("MYUU"):ResetFacialMotion()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("MYUU"):SetManpu("MP_NOTICE_R")
  CH("MYUU"):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("MYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MYUU"), 1022346062)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("HERO"):ResetNeckRot(TimeSec(0.3))
  CH("HERO"):WaitNeckRot()
  WINDOW:DrawFace(324, 20, SymAct("HERO"), FACE_TYPE.SAD)
  WINDOW:Monologue(636809743)
  WINDOW:Monologue(249143756)
  WINDOW:CloseMessage()
  CH("HERO"):ResetFacialMotion()
  SOUND:FadeOutBgm(TimeSec(2.5))
  SOUND:FadeInEnv(SymSnd("SE_ENV_BREEZE_LP"), TimeSec(1.5), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_07"))
  CAMERA:SetTgt(SymCam("CAMERA_07"))
  CH("HERO"):WalkTo(SplinePath(SymPos("P01_HERO"), SymPos("P02_HERO")), Speed(1))
  TASK:Sleep(TimeSec(0.5))
  CH("MYUU"):DirTo(SymPos("P02_HERO"), Speed(100), ROT_TYPE.NEAR)
  CAMERA:MoveFollow(SymCam("CAMERA_08"), Speed(0.7, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  TASK:Sleep(TimeSec(1.5))
  WINDOW:DrawFace(324, 88, SymAct("MYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MYUU"), 398626957)
  WINDOW:CloseMessage()
  CH("HERO"):WaitMove()
  TASK:Sleep(TimeSec(0.3))
  CH("HERO"):DirTo(CH("MYUU"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.3))
  subEveNod(CH("HERO"))
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("MYUU"):SetManpu("MP_FLY_SWEAT")
  CH("MYUU"):WaitManpu()
  CH("HERO"):DirTo(RotateTarget(-90), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  CAMERA:MoveFollow(SymCam("CAMERA_09"), Speed(0.9, ACCEL_TYPE.NONE, DECEL_TYPE.NONE))
  CH("HERO"):WalkTo(SymPos("P03_HERO"), Speed(1))
  TASK:Sleep(TimeSec(0.2))
  CH("MYUU"):WalkTo(SymPos("P02_MYUU"), Speed(1))
  CH("HERO"):WaitMove()
  CH("MYUU"):WaitMove()
  TASK:Sleep(TimeSec(1.7))
  CAMERA:SetEye(SymCam("CAMERA_10"))
  CAMERA:SetTgt(SymCam("CAMERA_10"))
  TASK:Sleep(TimeSec(0.2))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
  CH("HERO"):SetManpu("MP_SWEAT_L")
  CH("HERO"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.CATCHBREATH)
  WINDOW:Monologue(1484981834)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_09"))
  CAMERA:SetTgt(SymCam("CAMERA_09"))
  TASK:Sleep(TimeSec(0.2))
  CAMERA:MoveFollow(SymCam("CAMERA_11"), Speed(0.95, ACCEL_TYPE.NONE, DECEL_TYPE.NONE))
  CH("HERO"):WalkTo(SymPos("P04_HERO"), Speed(1))
  CH("MYUU"):WalkTo(SymPos("P03_MYUU"), Speed(1))
  CH("HERO"):WaitMove()
  TASK:Sleep(TimeSec(1))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  CH("HERO"):WaitManpu()
  CAMERA:SetEye(SymCam("CAMERA_12"))
  CAMERA:SetTgt(SymCam("CAMERA_12"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.CATCHBREATH)
  WINDOW:Monologue(1100494603)
  WINDOW:CloseMessage()
  CH("MYUU"):SetDir(CH("HERO"))
  CAMERA:SetEye(SymCam("CAMERA_13"))
  CAMERA:SetTgt(SymCam("CAMERA_13"))
  CH("HERO"):DirTo(CH("MYUU"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("HERO"):SetManpu("MP_SHOCK_R")
  CH("HERO"):WaitManpu()
  SOUND:FadeOutEnv(TimeSec(0.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
end
function sub01_mysteryjungleclear1st01_end()
end
function sub01_mysteryjungleclear1st02_init()
end
function sub01_mysteryjungleclear1st02_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(0.5))
  CAMERA:SetSisaRateVolume(Volume(1))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:MoveFollow2(SymCam("CAMERA_01"), Speed(0.2, ACCEL_TYPE.NONE, DECEL_TYPE.NONE))
  MAP:SetVisible(false)
  MAP:SetBG(SymImg("IMEV0301"))
  MAP:SetVisibleBG(true)
  local taskEffTwinkle00 = function()
    EFFECT:Create("effectTwinkle_01", SymEff("EV_SHINKA_END_GLITTER"))
    EFFECT:SetScale("effectTwinkle_01", Scale(0.4))
    EFFECT:SetPosition("effectTwinkle_01", SymPos("P01_EFF_GLITTER_RANDOM"))
    EFFECT:Play("effectTwinkle_01")
    TASK:Sleep(TimeSec(0.4))
    EFFECT:Create("effectTwinkle_02", SymEff("EV_SHINKA_END_GLITTER"))
    EFFECT:ChangeColor("effectTwinkle_02", Color(1, 1, 1, 0), TimeSec(0, TIME_TYPE.FRAME))
    EFFECT:SetScale("effectTwinkle_02", Scale(0.3))
    EFFECT:SetPosition("effectTwinkle_02", SymPos("P02_EFF_GLITTER_RANDOM"))
    EFFECT:Play("effectTwinkle_02")
    EFFECT:ChangeColor("effectTwinkle_02", Color(1, 1, 1, 1), TimeSec(15, TIME_TYPE.FRAME))
    TASK:Sleep(TimeSec(0.7))
    EFFECT:Create("effectTwinkle_03", SymEff("EV_SHINKA_END_GLITTER"))
    EFFECT:ChangeColor("effectTwinkle_03", Color(1, 1, 1, 0), TimeSec(0, TIME_TYPE.FRAME))
    EFFECT:SetScale("effectTwinkle_03", Scale(0.5))
    EFFECT:SetPosition("effectTwinkle_03", SymPos("P03_EFF_GLITTER_RANDOM"))
    EFFECT:Play("effectTwinkle_03")
    EFFECT:ChangeColor("effectTwinkle_03", Color(1, 1, 1, 1), TimeSec(15, TIME_TYPE.FRAME))
    TASK:Sleep(TimeSec(0.8))
    EFFECT:Create("effectTwinkle_01", SymEff("EV_SHINKA_END_GLITTER"))
    EFFECT:ChangeColor("effectTwinkle_01", Color(1, 1, 1, 0), TimeSec(0, TIME_TYPE.FRAME))
    EFFECT:SetScale("effectTwinkle_01", Scale(0.4))
    EFFECT:SetPosition("effectTwinkle_01", SymPos("P01_EFF_GLITTER_RANDOM"))
    EFFECT:Play("effectTwinkle_01")
    EFFECT:ChangeColor("effectTwinkle_01", Color(1, 1, 1, 1), TimeSec(15, TIME_TYPE.FRAME))
  end
  TASK:Regist(Group("grpKiraKira"), taskEffTwinkle00)
  SOUND:PlaySe(SymSnd("SE_EVT_MITSUMERU"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(3.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  MAP:SetVisible(true)
  MAP:SetVisibleBG(false)
end
function sub01_mysteryjungleclear1st02_end()
end
function sub01_mysteryjungleclear1st03_init()
end
function sub01_mysteryjungleclear1st03_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_11"))
  CAMERA:SetTgt(SymCam("CAMERA_11"))
  SOUND:PlayBgm(SymSnd("BGM_EVE_CHILDREN_01"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  CH("MYUU"):SetManpu("MP_SPREE_LP")
  CH("MYUU"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Regist(subEveDoubleJump, {
    CH("MYUU")
  })
  WINDOW:DrawFace(324, 88, SymAct("MYUU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("MYUU"), 1790272712)
  WINDOW:Talk(SymAct("MYUU"), 1940805001)
  TASK:WaitTask()
  WINDOW:CloseMessage()
  TASK:Regist(subEveDoubleJump, {
    CH("MYUU")
  })
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  CH("HERO"):WaitManpu()
  TASK:Sleep(TimeSec(0.5))
  SOUND:FadeOutBgm(TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(1), true)
  CH("MYUU"):ResetManpu()
  CH("MYUU"):ResetFacialMotion()
  TASK:Sleep(TimeSec(0.5))
end
function sub01_mysteryjungleclear1st03_end()
end
function groundEnd()
end
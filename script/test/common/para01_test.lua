dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
dofile("script/test/user/kojima/kojima_test.lua")
function groundInit()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.2), true)
end
function groundStart()
  startMenu()
end
function startMenu()
  TestSet()
  WINDOW:SystemLetter(1755214276)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1904558213, 0)
  WINDOW:SelectChain(1520964422, 1)
  WINDOW:SelectChain(1135813127, 2)
  WINDOW:SelectChain(217232576, 3)
  WINDOW:SelectChain(367625601, 4)
  WINDOW:SelectChain(1053087298, 5)
  WINDOW:SelectChain(668985091, 6)
  id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 0 then
    WINDOW:CloseMessage()
    Test00()
  elseif id == 1 then
    WINDOW:CloseMessage()
    Test01()
  elseif id == 2 then
    WINDOW:CloseMessage()
    Test01_01()
  elseif id == 3 then
    WINDOW:CloseMessage()
    Test01_02()
  elseif id == 4 then
    WINDOW:CloseMessage()
    Test02()
  elseif id == 5 then
    WINDOW:CloseMessage()
    Test02_01()
  elseif id == 6 then
    WINDOW:CloseMessage()
    Test03()
  end
end
function TestSet()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetPosition(SymPos("HERO__START"))
  CH("PARTNER"):SetPosition(SymPos("PARTNER__START"))
  CH("DOKKORAA_1"):SetPosition(SymPos("DOKKORAA_1__START"))
  CH("DOKKORAA_2"):SetPosition(SymPos("DOKKORAA_2__START"))
  CH("DOTEKKOTSU"):SetPosition(SymPos("DOTEKKOTSU__START"))
  CH("KOMATANA_1"):SetPosition(SymPos("KOMATANA_1__START"))
  CH("TSUTAAJA"):SetPosition(SymPos("TSUTAAJA__START"))
  CH("WASHIBON"):SetPosition(SymPos("WASHIBON__START"))
  CH("ZURUGGU"):SetPosition(SymPos("ZURUGGU__START"))
end
function taskFuncTestMove(chara, toDirPos, toPos, speed)
  chara:DirTo(toDirPos, Speed(360))
  chara:RunTo(toPos, speed)
  chara:WaitMove()
  chara:DirTo(toDirPos, Speed(360))
end
function taskFuncTestCamera(toTgtPos, speed)
  CAMERA:MoveFollow(toTgtPos, speed)
end
function taskFuncTestManpu(chara, kind)
  chara:SetManpu(kind)
  chara:WaitManpu()
end
function taskFuncTestEffect(chara, kind, time)
  local effect = SYSTEM:CreateEffect(kind)
  SYSTEM:SetEffectPosition(effect, chara, BODY_POINT.HEAD)
  TASK:Sleep(time)
  SYSTEM:RemoveEffect(effect)
end
function Test00()
  WINDOW:SystemLetter(-1605895220)
  WINDOW:CloseMessage()
  CH("HERO"):SetPosition(SymPos("HERO__START"))
  CH("PARTNER"):SetPosition(SymPos("PARTNER__START"))
  WINDOW:SystemLetter(-1185101171)
  WINDOW:CloseMessage()
  CH("HERO"):SetPosition(SymPos("HERO__START", PosOffs(2, 1)))
  CH("PARTNER"):SetPosition(SymPos("PARTNER__START", PosOffs(2, 2)))
  WINDOW:SystemLetter(-1363707881)
  WINDOW:CloseMessage()
  CH("HERO"):SetPosition(SymPos("HERO__START"))
  CH("PARTNER"):SetPosition(SymPos("PARTNER__START"))
  WINDOW:SystemLetter(-1213445802)
  WINDOW:CloseMessage()
  startMenu()
end
function Test01()
  WINDOW:SystemLetter(-1669260651)
  WINDOW:SystemLetter(-2053493804)
  WINDOW:CloseMessage()
  CH("HERO"):SetPosition(SymPos("HERO__START"))
  CH("PARTNER"):SetPosition(SymPos("PARTNER__START"))
  TASK:Regist(taskFuncTestMove, {
    CH("HERO"),
    SymPos("POINT_00"),
    SymPos("POINT_00", PosOffs(0.5, -0.2)),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("PARTNER"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(2.5)
  })
  TASK:WaitTask()
  WINDOW:SystemLetter(-891568877)
  WINDOW:CloseMessage()
  startMenu()
end
function Test01_01()
  WINDOW:SystemLetter(-742355886)
  WINDOW:SystemLetter(-118628463)
  WINDOW:CloseMessage()
  CH("HERO"):SetPosition(SymPos("HERO__START"))
  CH("PARTNER"):SetPosition(SymPos("PARTNER__START"))
  TASK:Regist(taskFuncTestMove, {
    CH("PARTNER"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(1)
  })
  TASK:Sleep(TimeSec(0.5))
  TASK:Regist(taskFuncTestMove, {
    CH("HERO"),
    SymPos("POINT_00"),
    SymPos("POINT_00", PosOffs(0.2, -0.2)),
    Speed(2)
  })
  TASK:WaitTask()
  WINDOW:SystemLetter(-503910704)
  WINDOW:CloseMessage()
  startMenu()
end
function Test01_02()
  WINDOW:SystemLetter(1718546975)
  WINDOW:SystemLetter(2138424158)
  WINDOW:SystemLetter(-1140664327)
  WINDOW:CloseMessage()
  CH("HERO"):SetPosition(SymPos("HERO__START"))
  CH("PARTNER"):SetPosition(SymPos("PARTNER__START"))
  TASK:Regist(taskFuncTestMove, {
    CH("PARTNER"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(1)
  })
  TASK:Regist(taskFuncTestCamera, {
    SymPos("POINT_00"),
    Speed(3, ACCEL_TYPE.NONE, DECEL_TYPE.LOW)
  })
  TASK:Sleep(TimeSec(0.5))
  TASK:Regist(taskFuncTestMove, {
    CH("HERO"),
    SymPos("POINT_00"),
    SymPos("POINT_00", PosOffs(0.2, -0.2)),
    Speed(2)
  })
  TASK:WaitTask()
  WINDOW:SystemLetter(-1525029192)
  WINDOW:CloseMessage()
  startMenu()
end
function Test02()
  WINDOW:SystemLetter(-1909148293)
  WINDOW:SystemLetter(-1758493638)
  WINDOW:CloseMessage()
  TASK:Regist(taskFuncTestMove, {
    CH("HERO"),
    SymPos("POINT_01"),
    SymPos("POINT_01"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("PARTNER"),
    SymPos("POINT_01"),
    SymPos("POINT_01"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("DOKKORAA_1"),
    SymPos("POINT_01"),
    SymPos("POINT_01"),
    Speed(5)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("DOKKORAA_2"),
    SymPos("POINT_01"),
    SymPos("POINT_01"),
    Speed(4)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("DOTEKKOTSU"),
    SymPos("POINT_01"),
    SymPos("POINT_01"),
    Speed(2.5)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("KOMATANA_1"),
    SymPos("POINT_01"),
    SymPos("POINT_01"),
    Speed(3.5)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("TSUTAAJA"),
    SymPos("POINT_01"),
    SymPos("POINT_01"),
    Speed(6)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("WASHIBON"),
    SymPos("POINT_01"),
    SymPos("POINT_01"),
    Speed(5.5)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("ZURUGGU"),
    SymPos("POINT_01"),
    SymPos("POINT_01"),
    Speed(2.5)
  })
  TASK:WaitTask()
  WINDOW:SystemLetter(-663874819)
  WINDOW:SystemLetter(-1049287748)
  WINDOW:CloseMessage()
  TASK:Regist(taskFuncTestMove, {
    CH("HERO"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("PARTNER"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("DOKKORAA_1"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("DOKKORAA_2"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("DOTEKKOTSU"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("KOMATANA_1"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("TSUTAAJA"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("WASHIBON"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("ZURUGGU"),
    SymPos("POINT_00"),
    SymPos("POINT_00"),
    Speed(3)
  })
  WINDOW:SystemLetter(-363302785)
  WINDOW:CloseMessage()
  startMenu()
end
function Test02_01()
  WINDOW:SystemLetter(-213696194)
  WINDOW:SystemLetter(1960533489)
  WINDOW:CloseMessage()
  TASK:Regist(taskFuncTestMove, {
    CH("HERO"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_CENTER"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("PARTNER"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_010"),
    Speed(3)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("DOKKORAA_1"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_020"),
    Speed(5)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("DOKKORAA_2"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_030"),
    Speed(4)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("DOTEKKOTSU"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_040"),
    Speed(2.5)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("KOMATANA_1"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_050"),
    Speed(3.5)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("TSUTAAJA"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_060"),
    Speed(6)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("WASHIBON"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_070"),
    Speed(5.5)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("ZURUGGU"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_080"),
    Speed(2.5)
  })
  TASK:Regist(taskFuncTestMove, {
    CH("MUNNA"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_090"),
    Speed(3.5)
  })
  TASK:Regist(taskFuncTestCamera, {
    SymPos("POINT_CENTER"),
    Speed(3, ACCEL_TYPE.NONE, DECEL_TYPE.LOW)
  })
  TASK:WaitTask()
  WINDOW:SystemLetter(1841327280)
  WINDOW:CloseMessage()
  WINDOW:SystemLetter(79605916)
  TASK:Regist(taskFuncTestManpu, {
    CH("HERO"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("PARTNER"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("DOKKORAA_1"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("DOKKORAA_2"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("DOTEKKOTSU"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("KOMATANA_1"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("TSUTAAJA"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("WASHIBON"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("ZURUGGU"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("MUNNA"),
    "MP_EXCLAMATION"
  })
  TASK:WaitTask()
  WINDOW:SystemLetter(497385949)
  WINDOW:CloseMessage()
  TASK:Regist(taskFuncTestManpu, {
    CH("HERO"),
    "MP_EXCLAMATION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("PARTNER"),
    "MP_QUESTION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("DOKKORAA_1"),
    "MP_QUESTION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("DOKKORAA_2"),
    "MP_QUESTION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("DOTEKKOTSU"),
    "MP_SWEAT_R"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("KOMATANA_1"),
    "MP_FLY_SWEAT"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("TSUTAAJA"),
    "MP_SWEAT_R"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("WASHIBON"),
    "MP_SWEAT_R"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("ZURUGGU"),
    "MP_QUESTION"
  })
  TASK:Regist(taskFuncTestManpu, {
    CH("MUNNA"),
    "MP_SWEAT_R"
  })
  TASK:WaitTask()
  WINDOW:SystemLetter(914936350)
  WINDOW:CloseMessage()
  TASK:Regist(taskFuncTestEffect, {
    CH("HERO"),
    "EV_HOWL",
    TimeSec(3)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("PARTNER"),
    "EV_HOWL",
    TimeSec(3)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("DOKKORAA_1"),
    "EV_HOWL",
    TimeSec(3)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("DOKKORAA_2"),
    "EV_HOWL",
    TimeSec(3)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("DOTEKKOTSU"),
    "EV_HOWL",
    TimeSec(4)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("KOMATANA_1"),
    "EV_HOWL",
    TimeSec(4)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("TSUTAAJA"),
    "EV_HOWL",
    TimeSec(4)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("WASHIBON"),
    "EV_HOWL",
    TimeSec(4)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("ZURUGGU"),
    "EV_HOWL",
    TimeSec(5)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("MUNNA"),
    "EV_HOWL",
    TimeSec(5)
  })
  TASK:WaitTask()
  WINDOW:SystemLetter(798221151)
  WINDOW:CloseMessage()
  TASK:Regist(taskFuncTestEffect, {
    CH("HERO"),
    "EV_HOWL",
    TimeSec(3)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("PARTNER"),
    "EV_LUMINOUS_SMALL",
    TimeSec(3)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("DOKKORAA_1"),
    "EV_HOWL",
    TimeSec(3)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("DOKKORAA_2"),
    "EV_LUMINOUS_SMALL",
    TimeSec(3)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("DOTEKKOTSU"),
    "EV_HOWL",
    TimeSec(4)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("KOMATANA_1"),
    "EV_LUMINOUS_EXPANDED",
    TimeSec(4)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("TSUTAAJA"),
    "EV_FLARE",
    TimeSec(4)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("WASHIBON"),
    "EV_HOWL",
    TimeSec(4)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("ZURUGGU"),
    "EV_HOWL",
    TimeSec(5)
  })
  TASK:Regist(taskFuncTestEffect, {
    CH("MUNNA"),
    "EV_HOWL",
    TimeSec(5)
  })
  WINDOW:SystemLetter(1624405400)
  WINDOW:CloseMessage()
  startMenu()
end
function Test03()
  WINDOW:SystemLetter(2043233497)
  WINDOW:CloseMessage()
  function urouroParaTest(chara, speed, toDirPos, toPos)
    function TaskL.Start()
      DirToTest(chara, RotateOffs(90), Speed(360))
    end
    function TaskL.Loop()
      chara:DirTo(toDirPos, Speed(360))
      chara:RunTo(toDirPos, speed)
      chara:WaitMove()
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      chara:DirTo(toPos, Speed(360))
      chara:RunTo(toPos, speed)
      chara:WaitMove()
      TASK:Sleep(TimeSec(0.5), TASK_EXIT.QUICK)
    end
    function TaskL.Finish()
      TASK:GroupSync()
      DirToTest(chara, RotateOffs(90), Speed(360))
    end
  end
  function taskDance00(chara, speed)
    function TaskL.Start()
      DirToTest(chara, RotateOffs(90), speed)
    end
    function TaskL.Loop()
      DirToTest(chara, RotateOffs(90), speed)
      DirToTest(chara, RotateOffs(90), speed)
      DirToTest(chara, RotateOffs(-90), speed)
      TASK:Sleep(TimeSec(0.5), TASK_EXIT.END)
      DirToTest(chara, RotateOffs(-40), speed)
      DirToTest(chara, RotateOffs(40), speed)
      TASK:Sleep(TimeSec(0.5), TASK_EXIT.END)
      DirToTest(chara, RotateOffs(-660), Speed(920))
      TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      DirToTest(chara, RotateOffs(660), Speed(920))
      TASK:Sleep(TimeSec(0.5), TASK_EXIT.QUICK)
      TASK:GroupSync()
    end
    function TaskL.Finish()
      TASK:GroupSync()
      DirToTest(chara, RotateOffs(360), Speed(520))
      DirToTest(chara, SymPos("@point01"), Speed(420))
      return
    end
  end
  function taskCameraTest(toTgtPos, time)
    function TaskL.Start()
      CAMERA:SetEye(SymCam("CAMERA_00"))
      CAMERA:SetTgt(SymCam("CAMERA_00"))
      CAMERA:MoveEye(SymCam("CAMERA_01"), TimeSec(6), ACCEL_TYPE.LOW, DECEL_TYPE.LOW)
      CAMERA:MoveTgt(SymCam("CAMERA_01"), TimeSec(6), ACCEL_TYPE.LOW, DECEL_TYPE.LOW)
    end
    function TaskL.Loop()
      CAMERA:MoveFollow(toTgtPos, time, ACCEL_TYPE.NONE, DECEL_TYPE.LOW)
      TASK:Sleep(TimeSec(1), TASK_EXIT.QUICK)
    end
    function TaskL.Finish()
      CAMERA:MoveEye(SymCam("CAMERA_00"), TimeSec(2), ACCEL_TYPE.LOW, DECEL_TYPE.HIGH)
      CAMERA:MoveTgt(SymCam("CAMERA_00"), TimeSec(2), ACCEL_TYPE.LOW, DECEL_TYPE.HIGH)
      CAMERA:WaitMove()
      return
    end
  end
  CH("DOTEKKOTSU"):SetPosition(SymPos("POINT_040", PosOffs(-1, -1)))
  CH("KOMATANA_1"):SetPosition(SymPos("POINT_100", PosOffs(0, -0.5)))
  CH("TSUTAAJA"):SetPosition(SymPos("POINT_110", PosOffs(0, -0.5)))
  TASK:Regist(Group("moveGrp"), taskFuncTestMove, {
    CH("DOKKORAA_1"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_020"),
    Speed(5)
  })
  TASK:Regist(Group("moveGrp"), taskFuncTestMove, {
    CH("PARTNER"),
    SymPos("POINT_CENTER"),
    SymPos("POINT_010"),
    Speed(3)
  })
  TASK:Regist(Group("urouroGrp"), urouroParaTest, {
    CH("HERO"),
    Speed(1),
    SymPos("POINT_CENTER"),
    SymPos("POINT_050")
  })
  TASK:Regist(Group("urouroGrp"), urouroParaTest, {
    CH("DOKKORAA_2"),
    Speed(1.2),
    SymPos("POINT_090"),
    SymPos("POINT_060")
  })
  TASK:Regist(Group("urouroGrp"), urouroParaTest, {
    CH("WASHIBON"),
    Speed(2.5),
    SymPos("POINT_070"),
    SymPos("POINT_050")
  })
  TASK:Regist(Group("danceGrp"), taskDance00, {
    CH("DOTEKKOTSU"),
    Speed(520)
  })
  TASK:Regist(Group("danceGrp"), taskDance00, {
    CH("KOMATANA_1"),
    Speed(620)
  })
  TASK:Regist(Group("danceGrp"), taskDance00, {
    CH("TSUTAAJA"),
    Speed(1020)
  })
  TASK:Regist(Group("cameraTest"), taskCameraTest, {
    SymPos("POINT_CENTER"),
    TimeSec(5)
  })
  WINDOW:SystemLetter(1390679834)
  WINDOW:CloseMessage()
  TASK:ExitNotifyTasks(Group("moveGrp"))
  TASK:Sleep(TimeSec(1.5))
  TASK:ExitNotifyTasks(Group("urouroGrp"))
  TASK:Sleep(TimeSec(1.5))
  TASK:ExitNotifyTasks(Group("danceGrp"))
  TASK:Sleep(TimeSec(0.5))
  TASK:ExitNotifyTasks(Group("cameraTest"))
  TASK:WaitTask()
  WINDOW:SystemLetter(1275012699)
  WINDOW:CloseMessage()
  startMenu()
end
function groundEnd()
end

function DirToTest(ch, targeOffs, speed)
  ch:DirTo(targeOffs, speed)
  ch:WaitRotate()
end
function ground_main()
  local test0 = SplinePath(SymPos("FREE_MOVE_PT_00"), SymPos("FREE_MOVE_PT_00"))
  local test1 = SplinePath(SymPos("FREE_MOVE_PT_00"), SymPos("FREE_MOVE_PT_00"))
  if SYSTEM:IsDebugMode() then
    WINDOW:SystemLetter(-426779489)
    WINDOW:CloseMessage()
  end
  WINDOW:SwitchTalk({PARTNER_0 = -7016994, PARTNER_1 = -726024675})
  WINDOW:CloseMessage()
  local defaultCursorId = 0
  while true do
    WINDOW:SysMsg(-844984484)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-2099045989, 0)
    WINDOW:SelectChain(-1678235430, 1)
    WINDOW:SelectChain(-1328186599, 2)
    WINDOW:SelectChain(-1446098344, 3)
    WINDOW:SelectChain(777410199, 4)
    WINDOW:SelectChain(927819734, 5)
    WINDOW:SelectChain(1604300236, 6)
    WINDOW:SelectChain(1183095949, 7)
    WINDOW:SelectChain(1839845198, 8)
    WINDOW:SelectChain(1957887503, 9)
    WINDOW:SelectChain(1005807816, 10)
    WINDOW:SelectChain(585652617, 11)
    WINDOW:DefaultCursor(defaultCursorId)
    local result = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    defaultCursorId = result
    WINDOW:CloseMessage()
    if result == 0 then
      Test00()
    elseif result == 1 then
      Test01()
    elseif result == 2 then
      Test02()
    elseif result == 3 then
      Test03()
    elseif result == 4 then
      Test04()
    elseif result == 5 then
      Test05()
    elseif result == 6 then
      Test06()
    elseif result == 7 then
      Test07()
    elseif result == 8 then
      Test08()
    elseif result == 9 then
      Test09()
    elseif result == 10 then
      Test10()
    elseif result == 11 then
      WINDOW:SystemLetter(163908170)
      WINDOW:CloseMessage()
      CHARA_TASK:StartFreeMoveAll()
      break
    end
  end
end
function groundInit()
  CAMERA:SetEye(SymCam("Camera01"))
  CAMERA:SetTgt(SymCam("Camera01"))
end
function groundStart()
end
function groundEnd()
end
function CommonTalkStart(symbol)
  CHARA_TASK:StopFreeMoveAll()
  CH("HERO"):SetTaiki()
  CH("PARTNER"):SetTaiki()
end
function CommonTalkEnd(symbol)
  CHARA_TASK:StartFreeMoveAll()
end
function FreeMoveGen_TwoPointMove(point0, point1)
  local resumeDir
  return function(symbol)
    function TaskL.Start()
      if type(resumeDir) == "nil" then
        resumeDir = CH(symbol):GetDir()
      else
        CH(symbol):DirTo(RotateTarget(resumeDir), Speed(180))
        CH(symbol):WaitRotate()
      end
    end
    function TaskL.Loop()
      CH(symbol):WalkTo(point0, Speed(1))
      TASK:WaitIf(function()
        return CH(symbol):IsMove()
      end, TASK_EXIT.QUICK)
      CH(symbol):WalkTo(point1, Speed(1))
      TASK:WaitIf(function()
        return CH(symbol):IsMove()
      end, TASK_EXIT.QUICK)
    end
    function TaskL.Finish()
      CH(symbol):SetTaiki()
      CH(symbol):DirTo(CH("HERO"), Speed(600))
      CH(symbol):MoveHeightTo(Height(2), Speed(10))
      CH(symbol):WaitMoveHeight()
      TASK:Sleep(TimeSec(0.05))
      CH(symbol):MoveHeightTo(Height(0), Speed(10))
      CH(symbol):WaitMoveHeight()
      TASK:Sleep(TimeSec(0.05))
      CH(symbol):WaitRotate()
    end
  end
end
function groundCharaTaskInit(symbol)
  if symbol == "BIKUTYINI" then
    CHARA_TASK:SetFreeMoveTask(CH(symbol), FreeMoveGen_TwoPointMove(SymPos("FREE_MOVE_PT_00"), SymPos("FREE_MOVE_PT_01")))
  end
  if symbol == "DOKKORAA_2" then
    CHARA_TASK:SetFreeMoveTask(CH(symbol), FreeMoveGen_TwoPointMove(SymPos("FREE_MOVE_PT_02"), SymPos("FREE_MOVE_PT_03")))
  end
  if symbol == "MIJUMARU" then
    CHARA_TASK:SetFreeMoveTask(CH(symbol), FreeMoveGen_TwoPointMove(SymPos("FREE_MOVE_PT_03"), SymPos("FREE_MOVE_PT_04")))
  end
end
function kojima_test_01_init()
  SCREEN_A:FadeOut(TimeSec(0), false)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
end
function kojima_test_01_start()
  SCREEN_A:FadeIn(TimeSec(0.5), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), false)
  SCREEN_A:WaitFade()
  SYSTEM:DebugPrint("------ kojima_test_01_start -------")
  ground_main()
end
function kojima_test_01_end()
end
function kojima_test_02_init()
end
function kojima_test_02_start()
  SCREEN_A:WhiteIn(TimeSec(0.5), false)
  SCREEN_A:WhiteInAll(TimeSec(0.5), false)
  SCREEN_A:WaitFade()
  ground_main()
end
function kojima_test_02_end()
end
function kojima_test_03_init()
end
function kojima_test_03_start()
  SCREEN_A:WhiteIn(TimeSec(0.5), false)
  SCREEN_A:WhiteInAll(TimeSec(0.5), false)
  SCREEN_A:WaitFade()
  ground_main()
end
function kojima_test_03_end()
end
function dungeon_test__clear_01_init()
end
function dungeon_test__clear_01_start()
  SCREEN_A:FadeIn(TimeSec(2), true)
  subEveFadeAfterTime()
  WINDOW:SystemLetter(282999563)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0), true)
  SYSTEM:NextEntry()
end
function dungeon_test__clear_01_end()
end
function dungeon_test__failed_01_init()
end
function dungeon_test__failed_01_start()
  SCREEN_A:FadeIn(TimeSec(2), true)
  subEveFadeAfterTime()
  WINDOW:SystemLetter(-1757009980)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0), true)
  SYSTEM:NextEntry()
end
function dungeon_test__failed_01_end()
end
function kojima_test_next_day_01_init()
end
function kojima_test_next_day_01_start()
  WINDOW:SystemLetter(-1906502011)
  WINDOW:CloseMessage()
  SCREEN_A:WhiteIn(TimeSec(0.5), false)
  SCREEN_A:WhiteInAll(TimeSec(0.5), false)
  SCREEN_A:WaitFade()
  ground_main()
end
function kojima_test_next_day_01_end()
end
function Test00()
  local defaultCursorId = 0
  WINDOW:SysMsg(1294598690)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1412510563, 0)
  WINDOW:SelectChain(2132566176, 1)
  WINDOW:SelectChain(1711755745, 2)
  WINDOW:SelectChain(692504358, 3)
  WINDOW:SelectChain(811464295, 4)
  WINDOW:SelectChain(460367268, 5)
  WINDOW:SelectChain(40604901, 6)
  WINDOW:SelectChain(-2047637462, 7)
  WINDOW:SelectChain(-1662469781, 8)
  WINDOW:SelectChain(-174693049, 9)
  WINDOW:DefaultCursor(defaultCursorId)
  do
    local result = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    defaultCursorId = result
    WINDOW:CloseMessage()
    if result == 0 then
      CH("HERO"):SetMotion(SymMot("run"), LOOP.ON)
      TASK:Sleep(TimeSec(1))
      CH("HERO"):WaitPlayMotion()
      CH("HERO"):SetMotion(SymMot("throw"), LOOP.OFF)
      CH("HERO"):WaitPlayMotion()
      CH("HERO"):SetMotion(SymMot("run"), LOOP.ON, TimeSec(0))
      TASK:Sleep(TimeSec(1))
      CH("HERO"):WaitPlayMotion()
      CH("HERO"):SetMotion(SymMot("throw"), LOOP.OFF, TimeSec(0))
      CH("HERO"):WaitPlayMotion()
      CH("HERO"):SetMotion(SymMot("run"), LOOP.ON, TimeSec(0.3))
      TASK:Sleep(TimeSec(1))
      CH("HERO"):WaitPlayMotion()
      CH("HERO"):SetMotion(SymMot("throw"), LOOP.OFF, TimeSec(0.3))
      CH("HERO"):WaitPlayMotion()
    elseif result == 1 then
      CAMERA:SetFovy(SymCam("CAMERA_FOV_30"))
      TASK:Sleep(TimeSec(1))
      CAMERA:SetFovy(SymCam("CAMERA_FOV_50"))
      TASK:Sleep(TimeSec(1))
      CAMERA:SetFovy(SymCam("CAMERA_FOV_70"))
      TASK:Sleep(TimeSec(1))
      CAMERA:SetFovy(SymCam("CAMERA_FOV_30"))
      TASK:Sleep(TimeSec(1))
    elseif result == 2 then
      CH("HERO"):SetShake(Vector(0, 0.015, 0), TimeSec(0.001))
      TASK:Sleep(TimeSec(5))
      CH("HERO"):SetMotion(SymMot("run"), LOOP.OFF)
      CH("HERO"):WaitPlayMotion()
      CH("HERO"):SetMotion(SymMot("throw"), LOOP.OFF)
      CH("HERO"):WaitPlayMotion()
      CH("HERO"):SetMotion(SymMot("jump"), LOOP.OFF)
      CH("HERO"):WaitPlayMotion()
      CH("HERO"):SetMotion(SymMot("victory"), LOOP.OFF)
      CH("HERO"):WaitPlayMotion()
      CH("HERO"):SetFacialMotion(FACIAL_MOTION.HAPPY)
      CH("HERO"):ResetShake()
      TASK:Sleep(TimeSec(2))
      CH("HERO"):ResetMotion()
    elseif result == 3 then
      CH("PARTNER"):SetMotion(SymMot("ev001_sleep01"), LOOP.ON)
      TASK:Sleep(TimeSec(2))
      CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.NORMAL)
      TASK:Sleep(TimeSec(0.5))
      CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.TALK)
      TASK:Sleep(TimeSec(0.5))
      CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.BLINK)
      TASK:Sleep(TimeSec(0.5))
      CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
      TASK:Sleep(TimeSec(0.5))
      CH("PARTNER"):SetFacialMotion(FACIAL_MOTION.ANGRY)
      TASK:Sleep(TimeSec(0.5))
      CH("PARTNER"):ResetFacialMotion()
      TASK:Sleep(TimeSec(0.5))
      CH("PARTNER"):ResetMotion()
    elseif result == 4 then
      CH("KURUMAYU"):SetDir(RotateTarget(-240))
      TASK:Sleep(TimeSec(0))
      local degree = CH("KURUMAYU"):GetDir()
      CH("KURUMAYU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
      CH("KURUMAYU"):WaitRotate()
      CH("KURUMAYU"):DirTo(RotateTarget(degree), Speed(350), ROT_TYPE.NEAR)
      CH("KURUMAYU"):WaitRotate()
      CAMERA:WaitMove()
    elseif result == 5 then
      local retTgt = CAMERA:GetTgt()
      CAMERA:MoveFollow(GM("AZUKARI_BOX"):GetPosition(), Speed(10, ACCEL_TYPE.HIGH, DECEL_TYPE.LOW))
      CAMERA:WaitMove()
      GM("AZUKARI_BOX"):SetDir(RotateTarget(0))
      GM("AZUKARI_BOX"):DirTo(CH("PARTNER"), Speed(10), ROT_TYPE.NEAR)
      GM("AZUKARI_BOX"):WaitRotate()
      CAMERA:MoveFollow(retTgt, Speed(10, ACCEL_TYPE.HIGH, DECEL_TYPE.LOW))
      CAMERA:WaitMove()
    elseif result == 6 then
      local retTgt = CAMERA:GetTgt()
      CAMERA:MoveFollow(GM("IRAI_GATE"):GetPosition(), Speed(10, ACCEL_TYPE.HIGH, DECEL_TYPE.LOW))
      CAMERA:WaitMove()
      GM("IRAI_GATE"):SetMotion(SymMot("open"), LOOP.OFF)
      GM("IRAI_GATE"):WaitPlayMotion()
      GM("IRAI_GATE"):ResetMotion()
      CAMERA:MoveFollow(retTgt, Speed(10, ACCEL_TYPE.HIGH, DECEL_TYPE.LOW))
      CAMERA:WaitMove()
    elseif result == 7 then
      CH("HERO"):DirLockToChara(CH("KURUMAYU"))
      CH("PARTNER"):DirLockToChara(CH("KURUMAYU"))
      TASK:Sleep(TimeSec(0))
      CH("KURUMAYU"):MoveTo(PosOffs(0, -1.5), Speed(2))
      CH("KURUMAYU"):WaitMove()
      CH("KURUMAYU"):MoveTo(PosOffs(0, 1.5), Speed(2))
      CH("KURUMAYU"):WaitMove()
      TASK:Sleep(TimeSec(0))
    elseif result == 8 then
      do
        local taskChild = function()
          TASK:Sleep(TimeSec(9), TASK_EXIT.QUICK)
        end
        local function taskParent()
          function TaskL.Loop()
            TASK:Regist(taskChild, {})
            TASK:Sleep(TimeSec(10), TASK_EXIT.QUICK)
          end
          function TaskL.Finish()
            return
          end
        end
        TASK:Regist(Group("Gp0"), taskParent, {})
        TASK:Sleep(TimeSec(2))
        TASK:ExitNotifyTasks(Group("Gp0"))
        TASK:Sleep(TimeSec(10))
      end
    elseif result == 9 then
      local effect1 = SYSTEM:CreateEffect("EV_GATEBASE_OK_ALERT_LP")
      SYSTEM:SetEffectPosition(effect1, GM("TAKIBI_ON"):GetPosition())
      TASK:Sleep(TimeSec(3))
      SYSTEM:WaitEffect(effect1)
    elseif result == 99 then
    end
    return
  end
  while true do
    CAMERA:SetFovy(SymCam("CAMERA_FOV_30"))
    TASK:Sleep(TimeSec(1))
    CAMERA:SetFovy(SymCam("CAMERA_FOV_50"))
    TASK:Sleep(TimeSec(1))
    CAMERA:SetFovy(SymCam("CAMERA_FOV_70"))
    TASK:Sleep(TimeSec(1))
    CAMERA:SetFovy(SymCam("CAMERA_FOV_30"))
    TASK:Sleep(TimeSec(1))
    CH("HERO"):SetShake(Vector(0, 0.015, 0), TimeSec(0.001))
    TASK:Sleep(TimeSec(5))
    CH("HERO"):SetMotion(SymMot("run"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(SymMot("throw"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(SymMot("jump"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(SymMot("victory"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetFacialMotion(FACIAL_MOTION.HAPPY)
    CH("HERO"):ResetShake()
    TASK:Sleep(TimeSec(2))
    CH("HERO"):ResetMotion()
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):SetDir(CH("PARTNER"))
    TASK:Sleep(TimeSec(0.5))
    CH("PARTNER"):SetDir(CH("HERO"))
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):SetFacialMotion(FACIAL_MOTION.NORMAL)
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):SetFacialMotion(FACIAL_MOTION.TALK)
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):SetFacialMotion(FACIAL_MOTION.BLINK)
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):SetFacialMotion(FACIAL_MOTION.HAPPY)
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):SetFacialMotion(FACIAL_MOTION.ANGRY)
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):ResetFacialMotion()
    CH("HERO"):DirTo(RotateTarget(-20, ROT_TYPE.LEFT), Speed(1000))
    lastPos2d = CH("PARTNER"):GetPosition2d()
    CH("PARTNER"):MoveTo(Vector2(lastPos2d.x + 2, lastPos2d.y), Speed(1))
    CH("PARTNER"):WaitMove()
    CH("PARTNER"):WalkTo(lastPos2d, Speed(1))
    CH("PARTNER"):WaitMove()
    CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(SymMot("WALK"), LOOP.OFF)
    CH("HERO"):WaitPlayMotion()
    CH("HERO"):SetMotion(MOTION.WALK, LOOP.ON)
    CH("PARTNER"):DirTo(RotateOffs(180), Speed(60))
    CH("PARTNER"):SetMotionRaito(Raito(1))
    CH("PARTNER"):SetMotion(MOTION.WALK, LOOP.ON)
    CH("PARTNER"):WaitRotate()
    CH("PARTNER"):SetMotionRaito(Raito(1))
    CH("PARTNER"):SetMotion(MOTION.WAIT, LOOP.ON)
    CH("PARTNER"):SetMotionPause(true)
    DirToTest(CH("PARTNER"), RotateOffs(-180), Speed(90))
    TASK:Sleep(TimeSec(0.5))
    CH("HERO"):SetMotion(MOTION.SLEEPLOOP, LOOP.ON)
    CHARA:SetVisible(SymLayer("HERO_LAYER"), false)
    CHARA:SetVisible(SymLayer("PARTNER_LAYER"), false)
    WINDOW:SystemLetter(-326282234)
    WINDOW:CloseMessage()
    CHARA:SetVisible(SymLayer("HERO_LAYER"), true)
    CHARA:SetVisible(SymLayer("PARTNER_LAYER"), true)
    if PAD:Data("X&A") then
      WINDOW:SystemLetter(-945813563)
      WINDOW:CloseMessage()
      break
    end
  end
  CH("PARTNER"):DirTo(CH("HERO"), Speed(180))
  CH("PARTNER"):DirTo(CH("HERO"), Speed(180), ROT_TYPE.LEFT)
  CH("PARTNER"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  lastPos2d = CH("PARTNER"):GetPosition2d()
  CH("PARTNER"):SetPosition(SymPos("@point01"))
  TASK:Sleep(TimeSec(1))
  CH("PARTNER"):MoveTo(Vector2(5, 5), Speed(5))
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):WalkTo(lastPos2d, Speed(2.5))
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):MoveTo(Vector2(5, -5), Speed(5))
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):WalkTo(lastPos2d, Speed(2.5))
  CH("PARTNER"):WaitMove()
  WINDOW:SystemLetter(-558156156)
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(RotateOffs(90), Speed(180))
  CH("PARTNER"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  CH("PARTNER"):DirTo(RotateOffs(-90), Speed(180))
  CH("PARTNER"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  CH("PARTNER"):DirTo(RotateOffs(90), Speed(180))
  CH("PARTNER"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  CH("PARTNER"):DirTo(RotateOffs(360), Speed(180))
  CH("PARTNER"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):DirTo(CH("PARTNER"), Speed(180))
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  CH("PARTNER"):DirTo(CH("HERO"), Speed(180))
  CH("PARTNER"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  CH("PARTNER"):DirTo(CH("HERO"), Speed(180), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  WINDOW:SystemLetter(-1845845949)
  WINDOW:CloseMessage()
  CH("PARTNER"):DirTo(RotateTarget(180), Speed(60), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  CH("PARTNER"):DirTo(RotateTarget(90), Speed(60), ROT_TYPE.LEFT)
  CH("PARTNER"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  CH("PARTNER"):DirTo(RotateTarget(180), Speed(60), ROT_TYPE.RIGHT)
  CH("PARTNER"):SetMotionRaito(Raito(1))
  CH("PARTNER"):SetMotion(MOTION.WALK, LOOP.ON)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):SetMotionRaito(Raito(1))
  CH("PARTNER"):SetMotion(MOTION.WALK, LOOP.ON)
  TASK:Sleep(TimeSec(0.5))
  WINDOW:SystemLetter(-1998483198)
  WINDOW:CloseMessage()
  CH("HERO"):SetMotion(MOTION.WAIT, LOOP.OFF)
  CH("HERO"):WaitPlayMotion(MOTION_PARTS.BODY)
  CH("HERO"):SetMotion(MOTION.WALK, LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(MOTION.BACKWALK, LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(MOTION.RUN, LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(MOTION.ATTACK, LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(MOTION.SPECIAL, LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(MOTION.SWELL, LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(MOTION.THROW, LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(MOTION.DAMAGE, LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(MOTION.SLEEP, LOOP.OFF)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(MOTION.SLEEPLOOP, LOOP.ON)
  WINDOW:SwitchTalk({PARTNER_0 = -1546861887, PARTNER_1 = -1160252544})
  TASK:Sleep(TimeSec(60, TIME_TYPE.FRAME))
  WINDOW:CloseMessage()
end
function Test01()
  WINDOW:SystemLetter(1028648783)
  WINDOW:CloseMessage()
  CH("HERO"):MoveTo(SplinePath(SymPos("SPLINE_00"), SymPos("SPLINE_01"), SymPos("SPLINE_02"), SymPos("SPLINE_03")), Speed(1.5))
  CH("HERO"):WaitMove()
  CH("HERO"):WalkTo(SplinePath(SymPos("SPLINE_00"), SymPos("SPLINE_01"), SymPos("SPLINE_02"), SymPos("SPLINE_03")), Speed(1))
  CH("HERO"):WaitMove()
  CH("PARTNER"):MoveTo(PosOffs(-1.5, -1.5), Speed(2))
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):MoveTo(PosOffs(1.5, 1.5), Speed(2))
  CH("PARTNER"):WaitMove()
  TASK:Sleep(TimeSec(0))
  CH("PARTNER"):WalkTo(PosOffs(-1.5, -1.5), Speed(2))
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):WalkTo(PosOffs(1.5, 1.5), Speed(2))
  CH("PARTNER"):WaitMove()
  TASK:Sleep(TimeSec(0))
  CH("PARTNER"):RunTo(PosOffs(-1.5, -1.5), Speed(2))
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):RunTo(PosOffs(1.5, 1.5), Speed(2))
  CH("PARTNER"):WaitMove()
  TASK:Sleep(TimeSec(0))
  CH("PARTNER"):MoveTo(PosOffs(-1.5, -1.5), Speed(2), LINK_DIR.ON)
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):MoveTo(PosOffs(1.5, 1.5), Speed(2), LINK_DIR.ON)
  CH("PARTNER"):WaitMove()
  TASK:Sleep(TimeSec(0))
  CH("PARTNER"):WalkTo(PosOffs(-1.5, -1.5), Speed(2), LINK_DIR.OFF)
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):WalkTo(PosOffs(1.5, 1.5), Speed(2), LINK_DIR.OFF)
  CH("PARTNER"):WaitMove()
  TASK:Sleep(TimeSec(0))
  CH("PARTNER"):RunTo(PosOffs(-1.5, -1.5), Speed(2), LINK_DIR.OFF)
  CH("PARTNER"):WaitMove()
  CH("PARTNER"):RunTo(PosOffs(1.5, 1.5), Speed(2), LINK_DIR.OFF)
  CH("PARTNER"):WaitMove()
  TASK:Sleep(TimeSec(0))
  WINDOW:SystemLetter(609541646)
  WINDOW:CloseMessage()
end
function Test02()
  WINDOW:SystemLetter(1749114366)
  WINDOW:CloseMessage()
  function taskCollect(chara, toPos, toDirPos, speed)
    chara:RunTo(toPos, speed)
    chara:WaitMove()
    chara:DirTo(toDirPos, Speed(360))
  end
  CH("HERO"):SetPosition(SymPos("HERO__START", PosOffs(-5, 1)))
  CH("PARTNER"):SetPosition(SymPos("PARTNER__START", PosOffs(-5, 2)))
  CH("BIKUTYINI"):SetPosition(SymPos("BIKUTYINI__START", PosOffs(-5, 1)))
  CH("DOKKORAA_2"):SetPosition(SymPos("DOKKORAA_2__START", PosOffs(-5, 1)))
  CH("DANGORO"):SetPosition(SymPos("DANGORO__START", PosOffs(5, 2)))
  CH("MIJUMARU"):SetPosition(SymPos("MIJUMARU__START", PosOffs(5, 2)))
  CH("MARIRURI"):SetPosition(SymPos("MARIRURI__START", PosOffs(5, 1)))
  TASK:Regist(taskCollect, {
    CH("HERO"),
    SymPos("HERO__START"),
    SymPos("@point01"),
    Speed(3)
  })
  TASK:Regist(taskCollect, {
    CH("PARTNER"),
    SymPos("PARTNER__START"),
    SymPos("@point01"),
    Speed(2.5)
  })
  TASK:Regist(taskCollect, {
    CH("BIKUTYINI"),
    SymPos("BIKUTYINI__START"),
    SymPos("@point01"),
    Speed(5)
  })
  TASK:Regist(taskCollect, {
    CH("DOKKORAA_2"),
    SymPos("DOKKORAA_2__START"),
    SymPos("@point01"),
    Speed(5.6)
  })
  TASK:Regist(taskCollect, {
    CH("DANGORO"),
    SymPos("DANGORO__START"),
    SymPos("@point01"),
    Speed(4.2)
  })
  TASK:Regist(taskCollect, {
    CH("MIJUMARU"),
    SymPos("MIJUMARU__START"),
    SymPos("@point01"),
    Speed(4.7)
  })
  TASK:Regist(taskCollect, {
    CH("MARIRURI"),
    SymPos("MARIRURI__START"),
    SymPos("@point01"),
    Speed(4.1)
  })
  function taskCollectCam()
    CAMERA:SetEye(SymCam("Camera00"))
    CAMERA:SetTgt(SymCam("Camera00"))
    TASK:Sleep(TimeSec(0.5))
    CAMERA:MoveEye(SymCam("Camera01"), TimeSec(2), ACCEL_TYPE.NONE, DECEL_TYPE.LOW)
    CAMERA:MoveTgt(SymCam("Camera01"), TimeSec(2), ACCEL_TYPE.NONE, DECEL_TYPE.LOW)
    CAMERA:WaitMove()
  end
  TASK:Regist(taskCollectCam)
  TASK:WaitTask()
  TASK:Sleep(TimeSec(0.2))
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
  function taskDacneCam()
    local startWaitSec = TimeSec(1.5)
    function TaskL.Start()
      TASK:Sleep(startWaitSec, TASK_EXIT.QUICK)
    end
    function TaskL.Loop()
      CAMERA:MoveEye(SymCam("Camera00"), TimeSec(5), ACCEL_TYPE.LOW, DECEL_TYPE.LOW)
      CAMERA:MoveTgt(SymCam("Camera00"), TimeSec(5), ACCEL_TYPE.LOW, DECEL_TYPE.LOW)
      TASK:WaitIf(function()
        return CAMERA:IsMove()
      end, TASK_EXIT.QUICK)
      TASK:Sleep(TimeSec(1))
      CAMERA:MoveEye(SymCam("Camera01"), TimeSec(5), ACCEL_TYPE.LOW, DECEL_TYPE.LOW)
      CAMERA:MoveTgt(SymCam("Camera01"), TimeSec(5), ACCEL_TYPE.LOW, DECEL_TYPE.LOW)
      while CAMERA:IsMove() do
        TASK:Sleep(TimeSec(0), TASK_EXIT.QUICK)
      end
      TASK:Sleep(TimeSec(1))
    end
    function TaskL.Finish()
      CAMERA:MoveEye(SymCam("Camera01"), TimeSec(2), ACCEL_TYPE.LOW, DECEL_TYPE.HIGH)
      CAMERA:MoveTgt(SymCam("Camera01"), TimeSec(2), ACCEL_TYPE.LOW, DECEL_TYPE.HIGH)
      CAMERA:WaitMove()
      return
    end
    TASK:Sleep(startWaitSec, TASK_EXIT.QUICK)
  end
  TASK:Regist(Group("danceGrpA"), taskDance00, {
    CH("HERO"),
    Speed(520)
  })
  TASK:Regist(Group("danceGrpA"), taskDance00, {
    CH("PARTNER"),
    Speed(520)
  })
  TASK:Regist(Group("danceGrpB"), taskDance00, {
    CH("BIKUTYINI"),
    Speed(720)
  })
  TASK:Regist(Group("danceGrpB"), taskDance00, {
    CH("DOKKORAA_2"),
    Speed(720)
  })
  TASK:Regist(Group("danceGrpC"), taskDance00, {
    CH("DANGORO"),
    Speed(820)
  })
  TASK:Regist(Group("danceGrpC"), taskDance00, {
    CH("MIJUMARU"),
    Speed(820)
  })
  TASK:Regist(Group("danceGrpC"), taskDance00, {
    CH("MARIRURI"),
    Speed(1220)
  })
  TASK:Regist(Group("danceCam"), taskDacneCam)
  WINDOW:SystemLetter(1901751487)
  WINDOW:CloseMessage()
  TASK:ExitNotifyTasks(Group("danceCam"))
  TASK:ExitNotifyTasks(Group("danceGrpB"))
  TASK:Sleep(TimeSec(1.5))
  TASK:ExitNotifyTasks(Group("danceGrpC"))
  TASK:Sleep(TimeSec(1.5))
  TASK:ExitNotifyTasks(Group("danceGrpA"))
  TASK:Sleep(TimeSec(0.5))
  TASK:WaitTask()
  WINDOW:SystemLetter(1517764476)
  WINDOW:CloseMessage()
end
function Test03()
  WINDOW:SystemLetter(1131155005)
  WINDOW:CloseMessage()
  CH("HERO"):MoveHeightTo(Height(0), Speed(2))
  CH("HERO"):WaitMoveHeight()
  CH("HERO"):MoveHeightTo(Height(1), Speed(1, ACCEL_TYPE.HIGH, DECEL_TYPE.HIGH))
  CH("HERO"):WaitMoveHeight()
  CH("HERO"):MoveHeightTo(Height(0), Speed(1, ACCEL_TYPE.HIGH, DECEL_TYPE.HIGH))
  CH("HERO"):WaitMoveHeight()
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):MoveHeightTo(Height(1), Speed(5, ACCEL_TYPE.HIGH, DECEL_TYPE.NONE))
  CH("HERO"):WaitMoveHeight()
  CH("HERO"):MoveHeightTo(Height(0), Speed(5, ACCEL_TYPE.HIGH, DECEL_TYPE.NONE))
  CH("HERO"):WaitMoveHeight()
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):MoveHeightTo(Height(0.1), Speed(10))
  CH("HERO"):WaitMoveHeight()
  TASK:Sleep(TimeSec(0.05))
  CH("HERO"):MoveHeightTo(Height(0), Speed(10))
  CH("HERO"):WaitMoveHeight()
  TASK:Sleep(TimeSec(0.05))
  CH("HERO"):MoveHeightTo(Height(0.1), Speed(10))
  CH("HERO"):WaitMoveHeight()
  TASK:Sleep(TimeSec(0.05))
  CH("HERO"):MoveHeightTo(Height(0), Speed(10))
  CH("HERO"):WaitMoveHeight()
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):WalkTo(PosOffs(2, 0), Speed(4))
  CH("HERO"):MoveHeightTo(Height(1), Speed(4, ACCEL_TYPE.HIGH, DECEL_TYPE.NONE))
  CH("HERO"):WaitMoveHeight()
  CH("HERO"):MoveHeightTo(Height(0), Speed(4, ACCEL_TYPE.HIGH, DECEL_TYPE.NONE))
  CH("HERO"):WaitMoveHeight()
  CH("HERO"):WaitMove()
  CH("HERO"):WalkTo(PosOffs(-1, 0), Speed(3.5))
  CH("HERO"):MoveHeightTo(Height(0.5), Speed(4, ACCEL_TYPE.HIGH, DECEL_TYPE.NONE))
  CH("HERO"):WaitMoveHeight()
  CH("HERO"):MoveHeightTo(Height(0), Speed(4, ACCEL_TYPE.HIGH, DECEL_TYPE.NONE))
  CH("HERO"):WaitMoveHeight()
  CH("HERO"):WaitMove()
  CH("HERO"):DirTo(RotateOffs(1800), Speed(1800))
  CH("HERO"):MoveTo(PosOffs(-1, 0), Speed(1.75))
  CH("HERO"):MoveHeightTo(Height(0.5), Speed(2, ACCEL_TYPE.HIGH, DECEL_TYPE.NONE))
  CH("HERO"):WaitMoveHeight()
  CH("HERO"):MoveHeightTo(Height(0), Speed(2, ACCEL_TYPE.HIGH, DECEL_TYPE.NONE))
  CH("HERO"):WaitMoveHeight()
  CH("HERO"):DirTo(RotateOffs(360), Speed(1800, ACCEL_TYPE.NONE, DECEL_TYPE.LOW))
  CH("HERO"):WaitRotate()
  CH("HERO"):WaitMove()
  TASK:Sleep(TimeSec(0.5))
end
function Test04()
  WINDOW:SystemLetter(204314874)
  WINDOW:CloseMessage()
  SCENE:UnvisibleGroup(SymGroup("HERO_LAYER"))
  SCENE:UnvisibleGroup(SymGroup("PARTNER_LAYER"))
  SCENE:UnvisibleGroup(SymGroup("CHARA_LAYER0"))
  SCENE:UnvisibleGroup(SymGroup("CHARA_LAYER1"))
  SCENE:UnvisibleGroup(SymGroup("SET_02"))
  WINDOW:SystemLetter(355903931)
  WINDOW:CloseMessage()
  SCENE:SetupGroup(SymGroup("SET_02"))
  WINDOW:SystemLetter(1042020984)
  WINDOW:CloseMessage()
  SCENE:UnvisibleGroup(SymGroup("SET_02"))
  SCENE:SetupGroup(SymGroup("HERO_LAYER"))
  WINDOW:SystemLetter(654363449)
  WINDOW:CloseMessage()
  SCENE:UnvisibleGroup(SymGroup("HERO_LAYER"))
  SCENE:SetupGroup(SymGroup("PARTNER_LAYER"))
  SCENE:SetupGroup(SymGroup("HERO_LAYER"))
  WINDOW:SystemLetter(-1600595978)
  WINDOW:CloseMessage()
  SCENE:UnvisibleGroup(SymGroup("PARTNER_LAYER"))
  SCENE:UnvisibleGroup(SymGroup("HERO_LAYER"))
  SCENE:SetupGroup(SymGroup("HERO_LAYER"))
  SCENE:SetupGroup(SymGroup("PARTNER_LAYER"))
  SCENE:SetupGroup(SymGroup("CHARA_LAYER0"))
  SCENE:SetupGroup(SymGroup("CHARA_LAYER1"))
  WINDOW:SystemLetter(-1182538057)
  WINDOW:CloseMessage()
end
function Test05()
  WINDOW:SystemLetter(-788710757)
  WINDOW:CloseMessage()
  CH("HERO"):SetNeckRot(CH("PARTNER"), RotateTarget(-45), TimeSec(1))
  CH("HERO"):WaitNeckRot()
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):SetNeckRot(RotateTarget(0), RotateTarget(-45), RotateTarget(0), TimeSec(1))
  CH("HERO"):WaitNeckRot()
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):SetNeckRot(CH("PARTNER"), RotateTarget(60), TimeSec(1))
  CH("HERO"):WaitNeckRot()
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):ResetNeckRot(TimeSec(1))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetNeckRot(RotateTarget(35), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetNeckRot(RotateTarget(-35), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetNeckRot(RotateTarget(35), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetNeckRot(RotateTarget(-35), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):ResetNeckRot(TimeSec(0.2))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetNeckRot(RotateTarget(0), RotateTarget(-40), RotateTarget(0), TimeSec(0.2))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetNeckRot(RotateTarget(0), RotateTarget(0), RotateTarget(0), TimeSec(0.2))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetNeckRot(RotateTarget(45), RotateTarget(30), RotateTarget(0), TimeSec(1))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetNeckRot(RotateTarget(-45), RotateTarget(30), RotateTarget(0), TimeSec(1))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):ResetNeckRot(TimeSec(3))
  CH("HERO"):WaitNeckRot()
  WINDOW:SystemLetter(-907670566)
  WINDOW:CloseMessage()
  CH("HERO"):SetNeckRot(CH("PARTNER"), TimeSec(1))
  CH("PARTNER"):SetNeckRot(CH("HERO"), TimeSec(1))
  CH("HERO"):WaitNeckRot()
  WINDOW:SystemLetter(-489990119)
  WINDOW:CloseMessage()
  CH("HERO"):SetNeckRot(CH("BIKUTYINI"), TimeSec(1))
  CH("BIKUTYINI"):SetNeckRot(CH("HERO"), TimeSec(1))
  CH("HERO"):WaitNeckRot()
  WINDOW:SystemLetter(-70227624)
  WINDOW:CloseMessage()
  CH("HERO"):SetNeckRot(CH("DOKKORAA_2"), TimeSec(1))
  CH("DOKKORAA_2"):SetNeckRot(CH("HERO"), TimeSec(1))
  CH("HERO"):WaitNeckRot()
  WINDOW:SystemLetter(-1265500257)
  WINDOW:CloseMessage()
  CH("HERO"):SetNeckRot(CH("BIRIJION"), TimeSec(1))
  CH("BIRIJION"):SetNeckRot(CH("HERO"), TimeSec(1))
  CH("HERO"):WaitNeckRot()
  WINDOW:SystemLetter(-1383412002)
  WINDOW:CloseMessage()
  CH("HERO"):ResetNeckRot(TimeSec(1))
  CH("PARTNER"):ResetNeckRot(TimeSec(1))
  CH("BIKUTYINI"):ResetNeckRot(TimeSec(1))
  CH("DOKKORAA_2"):ResetNeckRot(TimeSec(1))
  CH("BIRIJION"):ResetNeckRot(TimeSec(1))
  CH("HERO"):WaitNeckRot()
  CH("HERO"):SetMotion(SymMot("wait02"), LOOP.ON)
end
function Test06()
  WINDOW:SystemLetter(-2035835619)
  WINDOW:CloseMessage()
  local __LB_SCOPE = function()
    local __scopeFuncTbl = {}
    function __scopeFuncTbl.__LB_FIRST()
    end
    function __scopeFuncTbl.LABEL_FIRST()
      WINDOW:Talk(CH("HERO"), -1615025060)
      local __labelCnt = 0
      local __labelTbl = {}
      WINDOW:SelectStart()
      WINDOW:SelectChain(405057683, __labelCnt)
      __labelTbl[__labelCnt] = __scopeFuncTbl.LABEL_YES
      __labelCnt = __labelCnt + 1
      WINDOW:SelectChain(20939218, __labelCnt)
      WINDOW:DefaultCursor(__labelCnt)
      __labelTbl[__labelCnt] = __scopeFuncTbl.LABEL_NO
      __labelCnt = __labelCnt + 1
      local __res = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
      return __labelTbl[__res]
    end
    function __scopeFuncTbl.LABEL_YES()
      WINDOW:Talk(CH("HERO"), -1035430539)
      local __labelCnt = 0
      local __labelTbl = {}
      WINDOW:SelectStart()
      WINDOW:SelectChain(-615275468, __labelCnt)
      __labelTbl[__labelCnt] = __scopeFuncTbl.LABEL_OK
      __labelCnt = __labelCnt + 1
      WINDOW:SelectChain(-260114441, __labelCnt)
      WINDOW:DefaultCursor(__labelCnt)
      __labelTbl[__labelCnt] = __scopeFuncTbl.LABEL_FIRST
      __labelCnt = __labelCnt + 1
      local __res = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
      CH("HERO"):DirTo(RotateOffs(360), Speed(600))
      CH("HERO"):WaitRotate()
      return __labelTbl[__res]
    end
    function __scopeFuncTbl.LABEL_NO()
      WINDOW:Talk(CH("HERO"), -379205962)
      return __scopeFuncTbl.LABEL_END
    end
    function __scopeFuncTbl.LABEL_OK()
      CH("HERO"):SetFacialMotion(FACIAL_MOTION.HAPPY)
      WINDOW:Talk(CH("HERO"), -1507569551)
      WINDOW:CloseMessage()
      CH("HERO"):ResetFacialMotion()
      return __scopeFuncTbl.LABEL_END
    end
    function __scopeFuncTbl.LABEL_END()
      WINDOW:Talk(CH("HERO"), -1086365392)
    end
    local __next = __scopeFuncTbl.LABEL_FIRST
    while __next ~= nil do
      __next = __next()
    end
  end
  __LB_SCOPE()
end
function Test07()
  WINDOW:SystemLetter(-1810746637)
  WINDOW:CloseMessage()
  CAMERA:SetPreset(SymPresetCam("NEAR_FRONT_HIGH"))
  WINDOW:SystemLetter(-1928789070)
  WINDOW:CloseMessage()
  CAMERA:SetPreset(SymPresetCam("MID_FRONT_HIGH"))
  WINDOW:SystemLetter(177282941)
  WINDOW:CloseMessage()
  CAMERA:SetPreset(SymPresetCam("FAR_FRONT_HIGH"))
  WINDOW:SystemLetter(327822908)
  WINDOW:CloseMessage()
  CAMERA:SetPreset(SymPresetCam("NEAR_FRONT_LOW"))
  WINDOW:SystemLetter(2062873104)
  WINDOW:CloseMessage()
  CAMERA:SetPreset(SymPresetCam("MID_FRONT_LOW"))
  WINDOW:SystemLetter(1676657489)
  WINDOW:CloseMessage()
  CAMERA:SetPreset(SymPresetCam("FAR_FRONT_LOW"))
  WINDOW:SystemLetter(1220710546)
  WINDOW:CloseMessage()
  CAMERA:SetPreset(SymPresetCam("NEAR_LEFT_LOW"))
  WINDOW:SystemLetter(1373217235)
  WINDOW:CloseMessage()
  CAMERA:SetPreset(SymPresetCam("MID_RIGHT_LOW"))
  WINDOW:SystemLetter(513292052)
  WINDOW:CloseMessage()
  CAMERA:SetPreset(SymPresetCam("FAR_LEFT_LOW"))
  WINDOW:SystemLetter(126027349)
  WINDOW:CloseMessage()
end
function Test08()
  WINDOW:SystemLetter(749622678)
  WINDOW:CloseMessage()
  local taskNeckLock = function(chara, gimmick)
    function TaskL.Start()
      local tgtPos = gimmick:GetPosition()
      chara:SetNeckRot(tgtPos, TimeSec(0.2))
      chara:WaitNeckRot()
    end
    function TaskL.Loop()
      local tgtPos = gimmick:GetPosition()
      chara:SetNeckRot(tgtPos, TimeSec(0.1))
      chara:WaitNeckRot()
    end
    function TaskL.Finish()
      chara:ResetNeckRot(TimeSec(0.5))
      chara:WaitNeckRot()
    end
  end
  TASK:Regist(Group("neckLock"), taskNeckLock, {
    CH("HERO"),
    GM("TAKIBI_ON")
  })
  TASK:Regist(Group("neckLock"), taskNeckLock, {
    CH("PARTNER"),
    GM("TAKIBI_ON")
  })
  TASK:Regist(Group("neckLock"), taskNeckLock, {
    CH("BIKUTYINI"),
    GM("TAKIBI_ON")
  })
  TASK:Regist(Group("neckLock"), taskNeckLock, {
    CH("DOKKORAA_2"),
    GM("TAKIBI_ON")
  })
  TASK:Regist(Group("neckLock"), taskNeckLock, {
    CH("MIJUMARU"),
    GM("TAKIBI_ON")
  })
  GM("TAKIBI_ON"):MoveTo(PosOffs(-1, 0), Speed(1.75))
  GM("TAKIBI_ON"):WaitMove()
  TASK:Sleep(TimeSec(2))
  GM("TAKIBI_ON"):MoveTo(PosOffs(1, 0), Speed(1.75))
  GM("TAKIBI_ON"):WaitMove()
  TASK:Sleep(TimeSec(1.5))
  GM("TAKIBI_ON"):SetShake(Vector(0.015, 0, 0.015), TimeSec(0.001))
  TASK:Sleep(TimeSec(2))
  GM("TAKIBI_ON"):ResetShake()
  local taskTakibiJet = function(gimmick)
    function TaskL.Start()
      TASK:Sleep(TimeSec(0.2))
    end
    function TaskL.Loop()
      local tgtPos = gimmick:GetPosition()
      local effectJet = SYSTEM:CreateEffect("NM_SMOKEUP_WHITE")
      SYSTEM:SetEffectPosition(effectJet, tgtPos)
      TASK:Sleep(TimeSec(0.2))
    end
    function TaskL.Finish()
    end
  end
  TASK:Regist(Group("takibiEff"), taskTakibiJet, {
    GM("TAKIBI_ON")
  })
  GM("TAKIBI_ON"):MoveHeightTo(Height(2), Speed(2, ACCEL_TYPE.HIGH, DECEL_TYPE.NONE))
  GM("TAKIBI_ON"):WaitMoveHeight()
  TASK:ExitNotifyTasks(Group("takibiEff"))
  TASK:Sleep(TimeSec(1))
  WINDOW:SystemLetter(901080279)
  WINDOW:CloseMessage()
  GM("TAKIBI_ON"):MoveHeightTo(Height(0), Speed(2, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  GM("TAKIBI_ON"):WaitMoveHeight()
  TASK:WaitTask()
end
function Test09()
  WINDOW:SystemLetter(-1305642984)
  WINDOW:CloseMessage()
end
function Test10()
  WINDOW:SystemLetter(-1422505639)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(580379206)
  WINDOW:SelectStart()
  WINDOW:SelectChain(999084807, 0)
  WINDOW:SelectChain(279019716, 1)
  WINDOW:SelectChain(163230085, 2)
  WINDOW:SelectChain(1190864706, 3)
  WINDOW:SelectChain(1608521219, 4)
  WINDOW:SelectChain(1959609792, 5)
  WINDOW:SelectChain(1842771073, 6)
  WINDOW:SelectChain(-363960242, 7)
  WINDOW:DefaultCursor(0)
  local result = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  WINDOW:CloseMessage()
  if result == 1 or result == 4 then
    WINDOW:SystemLetter(-212510449)
    WINDOW:CloseMessage()
    SCREEN_A:FadeOut(TimeSec(0.5), false)
    SCREEN_A:FadeOutAll(TimeSec(0.5), false)
    SCREEN_A:WaitFade()
    FLAG.ScenarioFlag = CONST.SF_TEST_S00
    if result >= 4 then
      SYSTEM:NextEntry(KEEP_PLACEMENT.ON)
    else
      SYSTEM:NextEntry()
    end
  elseif result == 2 or result == 5 then
    WINDOW:SystemLetter(-1708423901)
    WINDOW:CloseMessage()
    SCREEN_A:WhiteOut(TimeSec(0.5), false)
    SCREEN_A:WhiteOutAll(TimeSec(0.5), false)
    SCREEN_A:WaitFade()
    FLAG.ScenarioFlag = CONST.SF_TEST_S01
    FLAG.SceneNo = CONST.SCN_0
    if result >= 4 then
      SYSTEM:NextEntry(KEEP_PLACEMENT.ON)
    else
      SYSTEM:NextEntry()
    end
  elseif result == 3 or result == 6 then
    WINDOW:SystemLetter(-2093960094)
    WINDOW:CloseMessage()
    SCREEN_A:WhiteOut(TimeSec(0.5), false)
    SCREEN_A:WhiteOutAll(TimeSec(0.5), false)
    SCREEN_A:WaitFade()
    FLAG.ScenarioFlag = CONST.SF_TEST_S01
    FLAG.SceneNo = CONST.SCN_1
    if result >= 4 then
      SYSTEM:NextEntry(KEEP_PLACEMENT.ON)
    else
      SYSTEM:NextEntry()
    end
  elseif result == 7 then
    WINDOW:SystemLetter(-1474435167)
    WINDOW:CloseMessage()
    SCREEN_A:WhiteOut(TimeSec(0.5), false)
    SCREEN_A:WhiteOutAll(TimeSec(0.5), false)
    SCREEN_A:WaitFade()
    SYSTEM:NextSpecialEntry(SPECIAL_ENTRY.NEXT_DAY)
  end
end
function EventTriggerIn(symbol)
  if symbol == "@yomawaru" then
    WINDOW:SystemLetter(-1324951840)
    WINDOW:CloseMessage()
  end
end
function EventTriggerPush(symbol)
  CallSelectPush()
  if symbol == "BIKUTYINI" then
    CommonTalkStart(symbol)
    WINDOW:SystemLetter(-28884953)
    WINDOW:CloseMessage()
    WINDOW:SysMsg(-413372058)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-865000795, -1)
    WINDOW:SelectChain(-714468380, 0)
    WINDOW:SelectChain(1391595307, 1)
    WINDOW:SelectChain(1273577066, 2)
    WINDOW:SelectChain(1370963076, 3)
    WINDOW:DefaultCursor(-1)
    local result = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    WINDOW:CloseMessage()
    if result == 0 then
      SYSTEM:EnterDungeon(Dg(DUNGEON_INDEX_D000))
    end
    if result == 1 then
      SYSTEM:EnterDungeon(Dg(DUNGEON_INDEX_D001))
    end
    if result == 2 then
      SYSTEM:EnterDungeon(Dg(DUNGEON_INDEX_D002))
    end
    if result == 3 then
      SYSTEM:EnterDungeon(Dg(DUNGEON_INDEX_D003))
    end
    CommonTalkEnd(symbol)
  end
  if symbol == "DOKKORAA_2" then
    CommonTalkStart(symbol)
    WINDOW:SystemLetter(1219235269)
    WINDOW:CloseMessage()
    CommonTalkEnd(symbol)
  end
  if symbol == "MIJUMARU" then
    CommonTalkStart(symbol)
    WINDOW:SystemLetter(1669422598)
    WINDOW:CloseMessage()
    CommonTalkEnd(symbol)
  end
  if symbol == "@garuura" then
    WINDOW:SystemLetter(2056941383)
    WINDOW:CloseMessage()
  end
  if symbol == "@hana" then
    WINDOW:SystemLetter(903608704)
    WINDOW:CloseMessage()
  end
end
function CallSelectPush()
  if symbol == "BIKUTYINI" then
    BIKUTYINI_Push()
  end
  if symbol == "DOKKORAA_2" then
  end
  if symbol == "DOKKORAA_2" then
  end
  if symbol == "DOKKORAA_2" then
  end
  if symbol == "DOKKORAA_2" then
  end
end

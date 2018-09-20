function groundInit()
  SCREEN_A:FadeInAll(TimeSec(1), true)
  SCREEN_A:FadeIn(TimeSec(1), true)
end
function groundStart()
  local vec
  WINDOW:SystemLetter(-2030134075)
  CUT:Load(SymCut("CUT_M01_010_02"))
  CUT:Play()
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEyeR(Degree(0), Degree(30))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEyeR(Degree(0), Degree(-30))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEyeR(Degree(0), Degree(-30))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEyeR(Degree(0), Degree(30))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEyeR(Degree(30), Degree(30))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEyeR(Degree(30), Degree(-30))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEyeR(Degree(-30), Degree(-30))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEyeR(Degree(-30), Degree(30))
  TASK:Sleep(TimeSec(2))
  CH("HERO"):SetManpu("MP_SPREE_LP")
  CAMERA:SetTgtR(Vector(0, 0.5, 0))
  WINDOW:SystemLetter(-1612337788)
  CAMERA:LockTarget(CH("HERO"))
  CH("HERO"):WalkTo(Vector2(5, 0), Speed(2))
  CH("HERO"):WaitMove()
  CAMERA:UnlockTarget()
  WINDOW:SystemLetter(-1261896121)
  CAMERA:SetEyeR(Vector(5, 0, 0))
  CAMERA:MoveToHero(TimeSec(1), ACCEL_TYPE.LOW, DECEL_TYPE.LOW)
  WINDOW:Narration(TimeSec(0), TimeSec(0), -1378627834)
  WINDOW:CloseMessage()
  CAMERA:SetEyeR(Vector(5, 0, 0))
  WINDOW:SystemLetter(-493725247)
  MAP:SetVisible(false)
  MAP:SetBG(SymMap("BG_SAMPLE"))
  WINDOW:SystemLetter(-74880896)
  MAP:SetVisible(true)
  MAP:SetVisibleBG(false)
  WINDOW:SystemLetter(-794543293)
  CAMERA:SetShake(Vector2(0.1, 0), TimeSec(1, TIME_TYPE.FRAME))
  WINDOW:SystemLetter(-910226942)
  TASK:Sleep(TimeSec(1))
  CAMERA:MoveFollow(CH("PARTNER"), Height(2), Speed(10, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  WINDOW:SystemLetter(1311184589)
  CAMERA:SetShake(Vector2(0, 0.1), TimeSec(1, TIME_TYPE.FRAME))
  WINDOW:SystemLetter(1463560076)
  CAMERA:MoveFollowZoom(CH("HERO"), Height(2), Distance(1), Speed(10, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  WINDOW:SystemLetter(1763129843)
  CAMERA:SetShake(Vector2(0.1, 0.1), TimeSec(1, TIME_TYPE.FRAME))
  TASK:Sleep(TimeSec(3))
  CAMERA:MoveTgt(CH("HERO"), Height(0), Speed(10, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  CAMERA:SetShake(Vector2(0, 0), TimeSec(0))
  WINDOW:SystemLetter(1879836850)
  CH("HERO"):SetMotion(SymMot("EV001_CONFIRMS"), LOOP.ON)
  WINDOW:DrawFace(10, 70, SymAct("PARTNER"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymWord("[M:DEBUG]\227\130\132\227\130\141\227\129\134\227\129\169\227\130\130"), 1528912753)
end
function groundEnd()
  SCREEN_A:FadeOutAll(TimeSec(1), true)
end

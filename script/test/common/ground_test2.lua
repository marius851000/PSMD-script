function groundInit()
  SCREEN_A:FadeInAll(TimeSec(1), true)
end
function groundStart()
  local vec
  WINDOW:DrawFace(10, 10, SymAct("HERO"), FACE_TYPE.NORMAL)
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFaceF(10, 10, SymAct("HERO"), FACE_TYPE.NORMAL)
  TASK:Sleep(TimeSec(1))
  CAMERA:SetTgtR(Vector(3, 0, 0))
  WINDOW:SystemLetter(530511566)
  CAMERA:MoveFollowZoom(CH("HERO"), Height(0.5), Distance(1), Speed(2))
  CAMERA:WaitMove()
  TASK:Sleep(TimeSec(10))
  CAMERA:SetTgtR(Vector(3, 0, 0))
  TASK:Sleep(TimeSec(1))
  CAMERA:SetTgtR(Vector(-3, 0, 0))
  TASK:Sleep(TimeSec(1))
  WINDOW:SystemLetter(109430671)
  CAMERA:MoveEye(Vector(10, 3.5, 3.5), Speed(5, ACCEL_TYPE.HIGH, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  CAMERA:MoveEye(Vector(10, 5, 10), Speed(5, ACCEL_TYPE.HIGH, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  CAMERA:MoveEye(Vector(0, 5, 10), Speed(5))
  CAMERA:WaitMove()
  WINDOW:SystemLetter(766022732)
  CAMERA:MoveToHero(Speed(3, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  WINDOW:SystemLetter(884188429)
  CAMERA:MoveEyeR(Vector(2, 0, 0), Speed(2, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  CAMERA:MoveTgtR(Vector(2, 0, 0), Speed(2, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  WINDOW:SystemLetter(2079470538)
  CAMERA:MoveToHero(Speed(3, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  WINDOW:SystemLetter(1659437707)
  CAMERA:MoveFollowR(Vector(4, 0, 0), Speed(2, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  CAMERA:MoveFollowZoomR(Vector(4, 0, 0), Distance(1), Speed(2, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  CAMERA:MoveFollowZoomR(Vector(4, 0, 0), Distance(-1), Speed(2, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  WINDOW:SystemLetter(1237602632)
  CAMERA:MoveToHero(Speed(3, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
  WINDOW:SystemLetter(1356816393)
  WINDOW:DrawFace(10, 10, SymAct("HERO"), FACE_TYPE.NORMAL)
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFace(210, 10, SymAct("HERO"), FACE_TYPE.NORMAL)
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFaceF(10, 10, SymAct("HERO"), FACE_TYPE.NORMAL)
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFaceF(10, 10, SymAct("HERO"), FACE_TYPE.NORMAL)
  TASK:Sleep(TimeSec(1))
  WINDOW:RemoveFace()
  WINDOW:SystemLetter(-683180858)
  CAMERA:SetFovy(Degree(60))
  TASK:Sleep(TimeSec(2))
  CAMERA:SetDefaultGroundFovy()
  TASK:Sleep(TimeSec(1))
  WINDOW:SystemLetter(-832811641)
  CAMERA:SetTgt(CH("HERO"))
  TASK:Sleep(TimeSec(1))
  CAMERA:SetTgt(CH("PARTNER"))
  TASK:Sleep(TimeSec(1))
  CAMERA:SetTgt(CH("HERO"))
  WINDOW:SystemLetter(663023902)
  local effect = SYSTEM:CreateEffect("EV_LUMINOUS_SMALL")
  SYSTEM:SetEffectPosition(effect, SymPos("POINT_00"))
  SYSTEM:WaitEffect(effect)
  WINDOW:SystemLetter(1050656863)
  WINDOW:SystemLetter(364024732)
  CAMERA:LockTarget(CH("HERO"))
  CH("HERO"):WalkTo(Vector2(5, 0), Speed(2))
  CH("HERO"):WaitMove()
  CAMERA:UnlockTarget()
  WINDOW:SystemLetter(212443869)
end
function groundEnd()
  SCREEN_A:FadeOutAll(TimeSec(1), true)
end
dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
  SCREEN_A:FadeIn(TimeSec(0.2), true)
  WINDOW:DrawFace(272, 16, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(-689838107)
  WINDOW:Monologue(-805644636)
  WINDOW:DrawFace(272, 16, SymAct("HERO"), FACE_TYPE.HAPPY)
  WINDOW:Monologue(-455637657)
  WINDOW:DrawFace(272, 16, SymAct("HERO"), FACE_TYPE.NORMAL)
  WINDOW:Monologue(-36916186)
  WINDOW:DrawFace(272, 16, SymAct("HERO"), FACE_TYPE.THINK)
  WINDOW:Monologue(-1299373343)
  WINDOW:Monologue(-1416227936)
  WINDOW:Monologue(-2135211933)
  WINDOW:Monologue(-1717538526)
  WINDOW:Monologue(507014637)
  WINDOW:Monologue(119757996)
  WINDOW:Monologue(994371066)
  WINDOW:DrawFace(272, 16, SymAct("HERO"), FACE_TYPE.HAPPY)
  WINDOW:Monologue(576705723)
  WINDOW:CloseMessage()
end
function groundEnd()
end
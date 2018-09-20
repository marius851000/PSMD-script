dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main23_kaichuuclear1st01_init()
end
function main23_kaichuuclear1st01_start()
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = -455882585, PARTNER_1 = -37160474})
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("OOBEMU3"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("OOBEMU3"), -689591771)
  WINDOW:Talk(SymAct("OOBEMU3"), -805397660)
  WINDOW:Talk(SymAct("OOBEMU3"), -2134962781)
  WINDOW:CloseMessage()
end
function main23_kaichuuclear1st01_end()
end
function groundEnd()
end

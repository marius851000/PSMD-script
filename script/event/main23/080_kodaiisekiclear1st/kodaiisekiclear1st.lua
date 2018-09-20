dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main23_kodaiisekiclear1st01_init()
end
function main23_kodaiisekiclear1st01_start()
  TASK:Sleep(TimeSec(1))
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.THINK)
  WINDOW:SwitchTalk({PARTNER_0 = 112202958, PARTNER_1 = 531309967})
  WINDOW:SwitchTalk({PARTNER_0 = 881227340, PARTNER_1 = 765282061})
  subEveCloseMsg()
  WINDOW:DrawFace(324, 88, SymAct("OOBEMU3"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("OOBEMU3"), 1658638794)
  WINDOW:Talk(SymAct("OOBEMU3"), 2076696715)
  WINDOW:Talk(SymAct("OOBEMU3"), 1357558600)
  WINDOW:CloseMessage()
end
function main23_kodaiisekiclear1st01_end()
end
function groundEnd()
end

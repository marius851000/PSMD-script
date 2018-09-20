dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function PARTNER(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.PAIN)
  WINDOW:SwitchTalk({PARTNER_0 = -45553752, PARTNER_1 = -464267543})
  WINDOW:CloseMessage()
end
function NUMERA(chSymb0)
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  WINDOW:DrawFace(20, 88, SymAct("NUMERA"), FACE_TYPE.TEARS)
  WINDOW:Talk(SymAct("NUMERA"), -813791958)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
end
function SHIKIJIKA_SPRING(chSymb0)
  TASK:Regist(subEveDoubleJump, {
    CH("SHIKIJIKA_SPRING")
  })
  WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -697977749)
  TASK:WaitTask()
  WINDOW:CloseMessage()
end
function NYASUPAA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("NYASUPAA"), -1725685076)
  WINDOW:CloseMessage()
end

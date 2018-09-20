dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MV_ATLAS_PLACE()
  CH("SHIKIJIKA_SPRING"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("SHIKIJIKA_SPRING"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -1258364993)
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  CH("NYASUPAA"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
  WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -1377440002)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -2033664707)
  subEveCloseMsg()
  CH("NYASUPAA"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("NYASUPAA"):WaitRotate()
  CH("SHIKIJIKA_SPRING"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):DirTo(CH("NYASUPAA"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -1613525892)
  subEveCloseMsg()
  WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), -795731269)
  WINDOW:CloseMessage()
end
function MV_FM_TW00_ALL()
  MV_ATLAS_PLACE()
end
function TR_TW00_SCHOOL_DUNGEON()
  WINDOW:SysMsg(-913757190)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-492537799, 1)
  WINDOW:SelectChain(-71349896, 0)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    CH("SHIKIJIKA_SPRING"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.1))
    CH("HERO"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
    CH("NYASUPAA"):DirTo(CH("SHIKIJIKA_SPRING"), Speed(350), ROT_TYPE.NEAR)
    CH("SHIKIJIKA_SPRING"):WaitRotate()
    WINDOW:DrawFace(20, 88, SymAct("SHIKIJIKA_SPRING"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("SHIKIJIKA_SPRING"), 2082952631)
    WINDOW:CloseMessage()
    local taskUnun00 = function()
      subEveNod(CH("HERO"))
    end
    local taskUnun01 = function()
      subEveNod(CH("NYASUPAA"))
    end
    local taskUnun02 = function()
      subEveNod(CH("SHIKIJIKA_SPRING"))
    end
    TASK:Regist(taskUnun00)
    TASK:Regist(taskUnun01)
    TASK:Regist(taskUnun02)
    TASK:Sleep(TimeSec(0.7))
    return "next"
  else
  end
end
function MV_FM_TW00_HOME01()
end
function MV_FM_TW00_HOME02()
end
function MV_FM_TW00_HOME03()
end
function MV_FM_TW00_HOME04()
end
function MV_FM_TW00_CAFE()
end
function MV_FM_TW00_SCHOOL00()
end
function MV_FM_TW00_HILL()
end

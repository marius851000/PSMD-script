function groundInit()
end
function groundStart()
end
function groundEnd()
end
function odayaka_test_init()
  if FLAG.MapFrom == CONST.MAP_ODAYAKA_ABAGOORA_HOUSE then
    CH("HERO"):SetPosition(SymPos("ABA_TO_MIRA_HERO"))
    CH("PARTNER"):SetPosition(SymPos("ABA_TO_MIRA_PARTNER"))
  end
end
function odayaka_test_start()
  CAMERA:MoveToHero(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  SCREEN_A:FadeInAll(TimeSec(0), false)
  SCREEN_A:FadeIn(TimeSec(2), true)
  if FLAG.OdayakaStartFlag == CONST.FLAG_FALSE then
    WINDOW:SysMsg(102598951)
    WINDOW:CloseMessage()
    FLAG.OdayakaStartFlag = CONST.FLAG_TRUE
  end
  CAMERA:MoveToPlayer(TimeSec(0.5), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
end
function odayaka_test_end()
end
function CheckFreeMove(symbol)
  local bGotoDungeon = false
  local bGotoGround = false
  if symbol == "@MAP_GOTO_DUNGEON_00" then
    bGotoDungeon = true
  elseif symbol == "@MAP_GOTO_DUNGEON_01" then
    bGotoDungeon = true
  elseif symbol == "@MAP_ODAYAKA_ABAGOORA_HOUSE" then
    WINDOW:SysMsg(520534118)
    bGotoGround = true
  end
  if bGotoDungeon then
    subFreePlayReachCommon()
    WINDOW:SysMsg(875293605)
    WINDOW:SelectStart()
    WINDOW:SelectChain(758176484, 0)
    WINDOW:SelectChain(1651592227, 1)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    if ret == 0 then
      SCREEN_B:FadeOutAll(TimeSec(0.5), false)
      SCREEN_A:FadeOutAll(TimeSec(0.5), true)
      SCREEN_B:FadeOut(TimeSec(0), false)
      SCREEN_A:FadeOut(TimeSec(0), true)
      SYSTEM:EnterWorldMenu()
    end
  end
  if bGotoGround then
    subFreePlayReachCommon()
    FreeMovMapCheck(symbol)
  end
end
function EventTriggerIn(symbol)
  CheckFreeMove(symbol)
end
function EventTriggerPush(symbol)
  if CHARA:IsExist(symbol) then
    local b_result = subUsuComFuncTalkInBase01(CH(symbol))
    WINDOW:DrawFace(20, 88, SymAct(symbol), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct(symbol), 2070576482)
    WINDOW:CloseMessage()
    subUsuComFuncTalkOutBase01(CH(symbol), b_result)
  end
end

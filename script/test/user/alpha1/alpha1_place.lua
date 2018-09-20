function groundInit()
end
function groundStart()
end
function groundEnd()
end
function TalkDailyConversation(symbol)
  local b_result = subUsuComFuncTalkInBase01(CH(symbol))
  CH(symbol):PlayTalkScene()
  subUsuComFuncTalkOutBase01(CH(symbol), b_result)
end
function alpha1_place_init()
  if FLAG.MapFrom == CONST.MAP_ODAYAKA_ABAGOORA_HOUSE then
    CH("HERO"):SetPosition(SymPos("ABA_TO_MIRA_HERO"))
    CH("PARTNER"):SetPosition(SymPos("ABA_TO_MIRA_PARTNER"))
  end
  MAP:AddRangeBoxCollision(SymRBox("$HIDDEN_BOX"))
end
function alpha1_place_start()
  CAMERA:MoveToHero(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  SCREEN_A:FadeInAll(TimeSec(0), false)
  SCREEN_B:FadeInAll(TimeSec(2), false)
  SCREEN_A:FadeIn(TimeSec(2), true)
end
function alpha1_place_end()
end
function CheckFreeMove(symbol)
  local bGotoDungeon = false
  local bGotoGround = false
  if symbol == "@MAP_GOTO_DUNGEON_00" then
    bGotoDungeon = true
  elseif symbol == "@MAP_GOTO_DUNGEON_01" then
    bGotoDungeon = true
  elseif symbol == "@MAP_ODAYAKA_ABAGOORA_HOUSE" then
    WINDOW:SysMsg(-1876165732)
    bGotoGround = true
  end
  if bGotoDungeon then
    subFreePlayReachCommon()
    SCREEN_B:FadeOutAll(TimeSec(0.5), false)
    SCREEN_A:FadeOutAll(TimeSec(0.5), true)
    SCREEN_B:FadeOut(TimeSec(0), false)
    SCREEN_A:FadeOut(TimeSec(0), true)
    SYSTEM:EnterWorldMenu()
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
    if symbol == "PARTY1" then
      WINDOW:DrawFace(20, 88, SymAct(symbol), FACE_TYPE.NORMAL)
      WINDOW:Talk(SymAct(symbol), -1993291043)
      WINDOW:CloseMessage()
    else
      TalkDailyConversation(symbol)
    end
  end
end

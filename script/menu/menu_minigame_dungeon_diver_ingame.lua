function OpenMinigameDungeonDiverInGameIntroMenu()
  OpenMinigameDungeonDiverInGameMenu("intro")
end
function OpenMinigameDungeonDiverInGameGameOverMenu()
  OpenMinigameDungeonDiverInGameMenu("gameover")
end
function OpenMinigameDungeonDiverInGameGameClearMenu()
  OpenMinigameDungeonDiverInGameMenu("gameclear")
end
function OpenMinigameDungeonDiverInGameSpecialDungeonMenu()
  OpenMinigameDungeonDiverInGameMenu("specialDungeon")
end
function OpenMinigameDungeonDiverInGameEventProcessMenu()
  OpenMinigameDungeonDiverInGameMenu("eventProcess")
end
function OpenMinigameDungeonDiverInGameEventObstacleMenu()
  OpenMinigameDungeonDiverInGameMenu("eventObstacle")
end
function OpenMinigameDungeonDiverInGameEventBranchMenu()
  OpenMinigameDungeonDiverInGameMenu("eventBranch")
end
function OpenMinigameDungeonDiverInGameEventLuckyMenu()
  OpenMinigameDungeonDiverInGameMenu("eventLucky")
end
function OpenMinigameDungeonDiverInGameMenu(flowName)
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/menu_minigame_dungeon_diver_ingame.bin")
  local ownerAct = "HIMANATTSU"
  local ownerName = "\227\131\146\227\131\158\227\131\138\227\131\131\227\131\132"
  local Talk = function(text)
    if face == nil then
      face = FACE_TYPE.NORMAL
    end
    DUNGEON_DIVER:ResetWindowCloseCount()
    WINDOW:Talk_HideFrame(SymWord(""), MENU:ReplaceTagText(text))
    WINDOW:CloseMessage()
  end
  local SetTag = function(tag)
    if not tag.pokemon0 then
      tag.pokemon0 = 0
    end
    if not tag.item0 then
      tag.item0 = 0
    end
    if tag.pokemon0 ~= 0 then
      MENU:SetTag_MonsterIndex(0, tag.pokemon0)
      MENU:SetTag_MonsterIndex(1, tag.pokemon0)
    end
    if tag.item0 ~= 0 then
      MENU:SetTag_ItemIndex(0, tag.item0)
    end
    DUNGEON_DIVER:SetMessageBuffer(tag.pokemon0, tag.item0)
  end
  FlowSys:Start()
  ShopSys:Start()
  function FlowSys.Proc.intro()
    FlowSys:Next("introEnd")
  end
  function FlowSys.Proc.introEnd()
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  function FlowSys.Proc.gameover()
    Talk("\229\138\155\229\176\189\227\129\141\227\129\166\227\129\151\227\129\190\227\129\163\227\129\159\227\130\136\227\129\134\227\129\160\227\128\130")
    FlowSys:Next("gameoverEnd")
  end
  function FlowSys.Proc.gameoverEnd()
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  function FlowSys.Proc.gameclear()
    Talk("\227\129\168\227\129\134\227\129\168\227\129\134\227\129\147\227\129\147\227\129\190\227\129\167\227\129\159\227\129\169\227\130\138\227\129\164\227\129\132\227\129\159\227\130\136\227\129\134\227\129\160\227\129\158\239\188\129[R]\227\129\138\227\129\164\227\129\139\227\130\140\227\129\149\227\129\190\227\129\167\227\129\151\227\129\159\227\128\130")
    FlowSys:Next("gameclearEnd")
  end
  function FlowSys.Proc.gameclearEnd()
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  function FlowSys.Proc.specialDungeon()
    Talk(DUNGEON_DIVER:GetSpecialDungeonArriveExMessage())
    local item = DUNGEON_DIVER:SpecialDungeonReward()
    if item ~= 0 then
      SetTag({item0 = item})
      Talk(DUNGEON_DIVER:GetTreasureGetExMessage())
    end
    FlowSys:Next("specialDungeonEnd")
  end
  function FlowSys.Proc.specialDungeonEnd()
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  function FlowSys.Proc.eventProcess()
    FlowSys.Stat.evasion = false
    DUNGEON_DIVER:CalcEvent()
    SetTag({})
    Talk(DUNGEON_DIVER:GetAppearMessage())
    FlowSys:Next("eventEnd")
  end
  function FlowSys.Proc.eventObstacle()
    FlowSys.Stat.evasion = false
    SetTag({
      pokemon0 = DUNGEON_DIVER:GetEnemyPokemonIndex()
    })
    Talk(DUNGEON_DIVER:GetAppearMessage())
    FlowSys.Stat.itemIndex = DUNGEON_DIVER:CheckWareHouseHelpItem(false)
    if FlowSys.Stat.itemIndex ~= 0 then
      if DUNGEON_DIVER:IsUseHelpStockItemPolicy() then
        MENU:SetTag_ItemIndex(0, FlowSys.Stat.itemIndex)
        Talk(DUNGEON_DIVER:GetBranchMessage())
        FlowSys:Next("eventObstacleYes")
        return
      else
        FlowSys:Next("eventObstacleNo")
        return
      end
    else
      FlowSys:Next("eventObstacleNo")
      return
    end
  end
  function FlowSys.Proc.eventObstacleYes()
    DUNGEON_DIVER:UseWareHouseItem(FlowSys.Stat.itemIndex)
    MENU:SetTag_String(1, "" .. GROUND:GetItemWarehouseItemNowCount(FlowSys.Stat.itemIndex))
    Talk(DUNGEON_DIVER:GetBranchSubMessage())
    if DUNGEON_DIVER:RandomEvasion(true) then
      FlowSys.Stat.evasion = true
      SetTag({})
      Talk(DUNGEON_DIVER:GetWinMessage())
      local item = DUNGEON_DIVER:EventReward()
      if item ~= 0 then
        SetTag({item0 = item})
        Talk(DUNGEON_DIVER:GetTreasureGetExMessage())
      end
    else
      FlowSys.Stat.evasion = false
      DUNGEON_DIVER:CalcEvent()
      SetTag({})
      Talk(DUNGEON_DIVER:GetLoseMessage())
    end
    FlowSys:Next("eventEnd")
  end
  function FlowSys.Proc.eventObstacleNo()
    if DUNGEON_DIVER:RandomEvasion(false) then
      FlowSys.Stat.evasion = true
      SetTag({})
      Talk(DUNGEON_DIVER:GetEscapeMessage())
      local item = DUNGEON_DIVER:EventReward()
      if item ~= 0 then
        SetTag({item0 = item})
        Talk(DUNGEON_DIVER:GetTreasureGetExMessage())
      end
    else
      FlowSys.Stat.evasion = false
      DUNGEON_DIVER:CalcEvent()
      SetTag({})
      Talk(DUNGEON_DIVER:GetLoseMessage())
    end
    FlowSys:Next("eventEnd")
  end
  function FlowSys.Proc.eventLucky()
    FlowSys.Stat.evasion = false
    DUNGEON_DIVER:CalcEvent()
    SetTag({})
    Talk(DUNGEON_DIVER:GetAppearMessage())
    local item = DUNGEON_DIVER:EventReward()
    if item ~= 0 then
      SetTag({item0 = item})
    else
      SetTag({})
    end
    Talk(DUNGEON_DIVER:GetWinMessage())
    FlowSys:Next("eventEnd")
  end
  function FlowSys.Proc.eventEnd()
    DUNGEON_DIVER:SetEvasion(FlowSys.Stat.evasion)
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  if flowName then
    FlowSys:Call(flowName)
  end
  FlowSys:Finish()
  ShopSys:Finish()
end
function OpenMinigameDungeonDiverInGameHelpBasicMenu()
  CommonSys:OpenBasicMenu(MG_DD_COMMON_MESSAGE__HELP_CAPTION, MG_DD_COMMON_MESSAGE__HELP_INFO, nil)
end
function CloseMinigameDungeonDiverInGameHelpBasicMenu()
  CommonSys:CloseBasicMenu()
end
function OpenMinigameDungeonDiverInGameDebugMenu()
  MENU:LoadMenuTextPool("message/debug.bin")
  local menu = MENU:CreateParameterMenu()
  local stepTbl = {}
  local eventTbl = {}
  local warehouseTbl = {}
  local timeTbl = {}
  local supportTbl = {}
  menu:SetLayoutRectAndLines(16, 16, 0, 0)
  menu:SetCaption(MINIGAME_DEBUG__DD_CAPTION)
  menu:AddItemI(MINIGAME_DEBUG__DD_STEP, ValueParamEx(1, 9999, 1, 1, 10, 100), nil, stepTbl)
  menu:AddItem(MINIGAME_DEBUG__DD_EVENT, nil, eventTbl)
  menu:AddItem(MINIGAME_DEBUG__DD_HELP_ITEM, nil, warehouseTbl)
  menu:AddItemI(MINIGAME_DEBUG__DD_TIME_MIN, ValueParamEx(1, 120, DUNGEON_DIVER:Debug_GetConditionTimeUnit(), 1, 5, 10), nil, timeTbl)
  menu:AddItem(MINIGAME_DEBUG__DD_OUEN_ADD, nil, supportTbl)
  function menu:cancelAction()
    DUNGEON_DIVER:Debug_AddStep(0)
    DUNGEON_DIVER:Debug_SetEventType(0)
    self:Close()
  end
  function stepTbl:decideAction()
    DUNGEON_DIVER:Debug_AddStep(self.curItem.value)
    DUNGEON_DIVER:Debug_SetEventType(0)
    self:Close()
  end
  function eventTbl:decideAction()
    local eventMenu = MENU:CreatePageMenu()
    local stepTbl = {}
    local eventTypeTbl = {}
    local deleteTbl = {}
    eventMenu:SetCaption(MINIGAME_DEBUG__DD_EVENT)
    eventMenu:SetLayoutRectAndLines(self:GetLeft() + self:GetRight(), 16, 0, 0)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_HIMAGAYA1, {eventType = 1}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_HIMAGAYA2, {eventType = 2}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_HIMAGAYA3, {eventType = 3}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_ENEMY1, {eventType = 4}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_ENEMY2, {eventType = 5}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_ENEMY3, {eventType = 6}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_POISON1, {eventType = 7}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_POISON2, {eventType = 8}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_SLEEP, {eventType = 9}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_PARALYSE, {eventType = 10}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_SCARE, {eventType = 11}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_CONFUSE, {eventType = 13}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_SLOW, {eventType = 15}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_QUICK, {eventType = 16}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_TREASUREBOX, {eventType = 17}, eventTypeTbl)
    eventMenu:AddItem(MINIGAME_DEBUG__DD_EVENT_RECOVER, {eventType = 18}, eventTypeTbl)
    function eventMenu:cancelAction()
      DUNGEON_DIVER:Debug_AddStep(0)
      DUNGEON_DIVER:Debug_SetEventType(0)
      self:Close()
      MENU:SetFocus(menu)
    end
    function eventTypeTbl:decideAction()
      DUNGEON_DIVER:Debug_AddStep(0)
      DUNGEON_DIVER:Debug_SetEventType(self.curItem.obj.eventType)
      self:Close()
      MENU:SetFocus(menu)
      menu:Close()
    end
    NestMenu_OpenAndCloseWait(eventMenu)
  end
  function warehouseTbl:decideAction()
    local warehouseMenu = MENU:CreatePageMenu()
    warehouseMenu:SetCaption(MINIGAME_DEBUG__DD_HELP_ITEM)
    local itemTbl = {}
    local emptyTbl = {}
    warehouseMenu:SetLayoutRectAndLines(self:GetLeft() + self:GetRight(), 16, 0, 0)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_OREN_SEED) .. GROUND:GetItemWarehouseItemNowCount(113), {itemIndex = 113}, itemTbl)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_SYUNSOKU_SEED) .. GROUND:GetItemWarehouseItemNowCount(119), {itemIndex = 119}, itemTbl)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_MOMON_SEED) .. GROUND:GetItemWarehouseItemNowCount(120), {itemIndex = 120}, itemTbl)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_KURABO_SEED) .. GROUND:GetItemWarehouseItemNowCount(121), {itemIndex = 121}, itemTbl)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_KAGO_SEED) .. GROUND:GetItemWarehouseItemNowCount(128), {itemIndex = 128}, itemTbl)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_DONSOKU_BALL) .. GROUND:GetItemWarehouseItemNowCount(236), {itemIndex = 236}, itemTbl)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_SYUNSOKU_BALL) .. GROUND:GetItemWarehouseItemNowCount(237), {itemIndex = 237}, itemTbl)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_MOUGEKI_SEED) .. GROUND:GetItemWarehouseItemNowCount(133), {itemIndex = 133}, itemTbl)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_IYASHI_SEED) .. GROUND:GetItemWarehouseItemNowCount(112), {itemIndex = 112}, itemTbl)
    warehouseMenu:AddItem(MENU:GetTextPoolText(MINIGAME_DEBUG__DD_HELP_ITEM_WAREHOUSE_EMPTY), nil, emptyTbl)
    function warehouseMenu:cancelAction()
      self:Close()
      MENU:SetFocus(menu)
    end
    function itemTbl:decideAction()
      local itemIndex = self.curItem.obj.itemIndex
      local numMenu = MENU:CreateNumericMenuWindow(ScreenType.B)
      numMenu:SetLayoutRect(Rectangle(menu:GetLeft() + menu:GetRight() / 2, menu:GetTop() + menu:GetBottom(), 48, 48))
      numMenu:SetPlace(3)
      numMenu:SetDigit(3)
      numMenu:SetStartNum(1)
      numMenu:SetMinNum(1)
      numMenu:SetMaxNum(999)
      numMenu:SetType(NUM_MENU_TYPE.TYPE_DIGIT_ON)
      function numMenu:cancelAction()
        self:Close()
        MENU:SetFocus(warehouseMenu)
      end
      function numMenu:decideAction()
        GROUND_DEBUG:ItemWarehouseItemAdd(itemIndex, self:GetSettingData())
        self:Close()
        MENU:SetFocus(warehouseMenu)
        warehouseMenu:Close()
        MENU:SetFocus(menu)
      end
      NestMenu_OpenAndCloseWait(numMenu)
    end
    function emptyTbl:decideAction()
      GROUND_DEBUG:ItemWarehouseItemClear()
      self:Close()
      MENU:SetFocus(menu)
    end
    NestMenu_OpenAndCloseWait(warehouseMenu)
  end
  function timeTbl:decideAction()
  end
  function timeTbl:currentItemValueChange()
    DUNGEON_DIVER:Debug_SetConditionTimeUnit(self.curItem.value)
  end
  function supportTbl:decideAction()
    DUNGEON_DIVER:AddSupportCount()
  end
  NestMenu_OpenAndCloseWait(menu)
end

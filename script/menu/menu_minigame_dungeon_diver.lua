function OpenMinigameDungeonDiverMenu(shopIns, landIndex, spaceIndex, resumeNextFlow, resumeArgTbl)
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/menu_minigame_dungeon_diver.bin")
  local ownerAct = "HIMANATTSU"
  local ownerName = "\227\131\146\227\131\158\227\131\138\227\131\131\227\131\132"
  local SetTagDiverName = function()
    ShopSys:SetShopTag("\227\131\128\227\130\164\227\131\144\227\131\188\229\144\141", GROUND:GetPokemonWarehouseNameFromId(DUNGEON_DIVER:GetDiverPokemonWarehouseId()))
  end
  local SetTagSelectDiverName = function()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", GROUND:GetPokemonWarehouseNameFromId(FlowSys.Stat.selectWarehouseId))
  end
  local stGetRestMoneyCost = function()
  end
  local function DebugTalk(text, face)
    if face == nil then
      face = FACE_TYPE.NORMAL
    end
    WINDOW:DrawFace(20, 88, SymAct(ownerAct), face)
    WINDOW:Talk(SymWord(GROUND_MESSAGE__SPESICAL_SPEKER_5), MENU:ReplaceTagText(MENU:GetTextPoolText(text)))
  end
  local function Talk(text, face)
    if face == nil then
      face = FACE_TYPE.NORMAL
    end
    WINDOW:DrawFace(20, 88, SymAct(ownerAct), face)
    WINDOW:Talk(SymWord(ownerName), MENU:ReplaceTagText(text))
  end
  local function TalkAsk(text, face, cancelNext, ...)
    local askMenu = MENU:CreateAskMenu()
    local next = cancelNext
    askMenu:Setup(true, true, false)
    for i, v in pairs({
      ...
    }) do
      askMenu:AddItem(v.text, nil, {
        decideAction = function(self)
          next = v.next
          self:CloseAndClearFocus()
        end
      })
    end
    if cancelNext ~= "" then
      function askMenu:cancelAction()
        next = cancelNext
        self:CloseAndClearFocus()
      end
    end
    if face == nil then
      face = FACE_TYPE.NORMAL
    end
    WINDOW:DrawFace(20, 88, SymAct(ownerAct), face)
    WINDOW:Talk(SymWord(ownerName), MENU:ReplaceTagText(text))
    WINDOW:SelectSetLuaMenu(askMenu)
    WINDOW:SelectEndTalk(MENU_SELECT_MODE.ENABLE_CANCEL_NO_CLOSE)
    return next
  end
  local DispMoneyDepositInput = function(enterAct, cancelAct)
    local startMoney = 0
    local maxMoney = GROUND:GetPlayerMoney()
    if maxMoney > DUNGEON_DIVER:GetHelpStockMoneyLimit() - DUNGEON_DIVER:GetHelpStockMoney() then
      maxMoney = DUNGEON_DIVER:GetHelpStockMoneyLimit() - DUNGEON_DIVER:GetHelpStockMoney()
    end
    ShopSys:DispInputMenu({
      titleText = "[M:UNUSED]\227\129\132\227\129\143\227\130\137\227\129\130\227\129\154\227\129\145\227\130\139\239\188\159",
      digitNum = 5,
      startNum = startMoney,
      maxNum = maxMoney,
      decideAction = function()
        enterAct()
      end,
      cancelAction = function()
        cancelAct()
      end
    })
  end
  local OpenHelpStockMoneyMenu = function()
    local WINDOW_FRAME_OFFS1 = 8
    local WINDOW_FRAME_OFFS2 = 16 + WINDOW_FRAME_OFFS1
    local moneyBoardMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
    moneyBoardMenu:SetFontType(FontType.TYPE_12)
    moneyBoardMenu:SetTextOffset(0, 0)
    moneyBoardMenu:SetLayoutRect(Rectangle(8 + WINDOW_FRAME_OFFS1, 32 + WINDOW_FRAME_OFFS1, 176 - WINDOW_FRAME_OFFS2, 56 - WINDOW_FRAME_OFFS2))
    MENU:SetTag_String(0, "" .. GROUND:GetPlayerMoney())
    MENU:SetTag_String(1, "" .. DUNGEON_DIVER:GetHelpStockMoney())
    moneyBoardMenu:SetText("\227\129\138\227\129\139\227\129\173  [HO:56]\239\188\154[M:MONEYS][RT][string:0][R]" .. "\227\130\185\227\131\136\227\131\131\227\130\175[HO:56]\239\188\154[M:MONEYS][RT][string:1]")
    moneyBoardMenu:Open()
    local func = {}
    function func.Close()
      moneyBoardMenu:Close()
    end
    return func
  end
  local DepositHelpStockMoney = function()
    ShopSys:assertSelectNumber()
    GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() - ShopSys.shopping_selectNumber)
    DUNGEON_DIVER:SetHelpStockMoney(DUNGEON_DIVER:GetHelpStockMoney() + ShopSys.shopping_selectNumber)
  end
  local CheckWarehouseInHelpStockItemEmpty = function()
    for itemIndex in GROUND:EnumerateItemWarehouseItemIndex() do
      if not DUNGEON_DIVER:HelpStockItemFilter(itemIndex) then
        return false
      end
    end
    return true
  end
  local DispHelpStockItemSelectMenu = function(drawAct, cancelAct, expretionAct)
    local function dispNumInputMenu()
      local isClose = false
      local item = ShopSys:GetSelectWarehouseItem()
      ShopSys:DispInputMenu({
        titleText = ShopSys:GetSelectWarehouseItemNameText(),
        digitNum = 2,
        startNum = 1,
        minNum = 1,
        maxNum = DUNGEON_DIVER:GetHelpStockItemLimit(item.warehouseItemIndex, ShopSys:GetSelectWarehouseItemCount()),
        decideAction = function()
          isClose = true
          drawAct()
        end,
        cancelAction = function()
        end
      })
      return isClose
    end
    ShopSys:DispBasicItemBagMenu({
      titleText = "[M:KARI]\227\129\169\227\129\134\227\129\144\227\130\146\227\129\130\227\129\154\227\129\145\227\130\139",
      padHelpMainText = MINIGAME_DUNGEON_DIVER__MANUAL_DIVER,
      enumItemFunc = function()
        return coroutine.wrap(function()
          for v in GROUND:EnumerateItemWarehouseItemIndex() do
            coroutine.yield({warehouseItemIndex = v, warehouseItemCount = 0})
          end
        end)
      end,
      itemFilterFunc = function(item)
        return DUNGEON_DIVER:HelpStockItemFilter(item.warehouseItemIndex)
      end,
      itemTextFunc = function(item)
        MENU:SetTag_ItemIndex(0, item.warehouseItemIndex)
        MENU:SetTag_Value(1, item.warehouseItemCount)
        MENU:SetTag_Value(2, GROUND:GetItemWarehouseItemNowCount(item.warehouseItemIndex))
        return MENU:ReplaceTagText("[S:16][item_b:0][RT][value_s_b:2:3]")
      end,
      itemLineHelpFunc = function(item)
        return ITEM:GetItemOneLineExplainTextFromItemIndex(item.warehouseItemIndex)
      end,
      itemHelpFunc = function(item)
        return ITEM:GetItemExplainTextIdFromItemIndex(item.warehouseItemIndex)
      end,
      itemEqualFunc = function(item1, item2)
        return item1.warehouseItemIndex == item2.warehouseItemIndex
      end,
      commandItems = {
        {
          text = "[M:KARI]\227\129\130\227\129\154\227\129\145\227\130\139",
          action = function()
            return dispNumInputMenu()
          end,
          isCloseShopMenu = true
        },
        {
          text = "[M:KARI]\227\129\155\227\129\164\227\130\129\227\129\132",
          action = function()
            expretionAct()
          end,
          isCloseShopMenu = true,
          isSingleOnly = true
        }
      },
      cancelAct = function()
        cancelAct()
      end,
      isMultiSelect = false,
      isDispBagCountWindow = false
    })
  end
  local DepositHelpStockItem = function()
    ShopSys:assertSelectGoods()
    ShopSys:assertSelectNumber()
    local item = ShopSys:GetSelectWarehouseItem()
    local allOk = DUNGEON_DIVER:DrawOutItemWarehouseToHelpStock(item.warehouseItemIndex, ShopSys.shopping_selectNumber)
    return allOk == false
  end
  local OpenHelpStockItemListMenu = function()
    local str = ""
    local itemType = 0
    local itemIndex = DUNGEON_DIVER:GetHelpStockItemTypeToItemIndex(itemType)
    while itemIndex ~= 0 do
      MENU:SetTag_ItemIndex(0, itemIndex)
      MENU:SetTag_Value(2, DUNGEON_DIVER:GetHelpStockItemCount(itemType))
      str = str .. MENU:ReplaceTagText("[S:16][item_b:0][RT][value_s_b:2:2][R]")
      itemType = itemType + 1
      itemIndex = DUNGEON_DIVER:GetHelpStockItemTypeToItemIndex(itemType)
    end
    local WINDOW_FRAME_OFFS1 = 8
    local WINDOW_FRAME_OFFS2 = 16 + WINDOW_FRAME_OFFS1
    local moneyBoardMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
    moneyBoardMenu:SetFontType(FontType.TYPE_12)
    moneyBoardMenu:SetTextOffset(0, 0)
    local adjHeight = 40 - WINDOW_FRAME_OFFS2
    moneyBoardMenu:SetLayoutRect(Rectangle(8 + WINDOW_FRAME_OFFS1, 16 + WINDOW_FRAME_OFFS1, 176 - WINDOW_FRAME_OFFS2, adjHeight))
    moneyBoardMenu:SetText("\227\130\185\227\131\136\227\131\131\227\130\175[HO:56]\239\188\154[M:MONEYS][RT]" .. DUNGEON_DIVER:GetHelpStockMoney())
    local itemListBoardMenu = MENU:CreateExplainMenuWindow(ScreenType.B)
    itemListBoardMenu:SetFontType(FontType.TYPE_12)
    itemListBoardMenu:SetTextOffset(0, 0)
    itemListBoardMenu:SetLayoutRect(Rectangle(8 + WINDOW_FRAME_OFFS1, adjHeight + 32 + WINDOW_FRAME_OFFS1, 176 - WINDOW_FRAME_OFFS2, itemType * 16 + 24 - WINDOW_FRAME_OFFS2))
    itemListBoardMenu:SetText(str)
    function itemListBoardMenu:cancelAction()
      self:Close()
      moneyBoardMenu:Close()
    end
    function itemListBoardMenu:decideAction()
      self:Close()
      moneyBoardMenu:Close()
    end
    moneyBoardMenu:Open()
    NestMenu_OpenAndCloseWait(itemListBoardMenu)
  end
  local DispRewardItemListMenu = function(cancelAct, expretionAct)
    ShopSys:DispBasicItemBagMenu({
      titleText = "[M:KARI]\227\129\187\227\129\134\227\129\151\227\130\133\227\129\134\227\131\170\227\130\185\227\131\136",
      padHelpMainText = MINIGAME_DUNGEON_DIVER__MANUAL_DIVER,
      enumItemFunc = function()
        return coroutine.wrap(function()
          for v in DUNGEON_DIVER:EnumerateRewardItemIndex() do
            coroutine.yield({warehouseItemIndex = v, warehouseItemCount = 0})
          end
        end)
      end,
      itemTextFunc = function(item)
        MENU:SetTag_ItemIndex(0, item.warehouseItemIndex)
        MENU:SetTag_Value(2, DUNGEON_DIVER:GetRewardItemNowCount(item.warehouseItemIndex))
        return MENU:ReplaceTagText("[S:16][item_b:0][RT][value_s_b:2:3]")
      end,
      itemLineHelpFunc = function(item)
        return ITEM:GetItemOneLineExplainTextFromItemIndex(item.warehouseItemIndex)
      end,
      itemHelpFunc = function(item)
        return ITEM:GetItemExplainTextIdFromItemIndex(item.warehouseItemIndex)
      end,
      itemEqualFunc = function(item1, item2)
        return item1.warehouseItemIndex == item2.warehouseItemIndex
      end,
      commandItems = {
        {
          text = "[M:KARI]\227\129\155\227\129\164\227\130\129\227\129\132",
          action = function()
            expretionAct()
          end,
          isCloseShopMenu = true,
          isSingleOnly = true
        }
      },
      cancelAct = function()
        cancelAct()
      end,
      isMultiSelect = false,
      isDispBagCountWindow = false
    })
  end
  local DispDiverPlayerSelectMenu = function(flowOkAct, flowCancelAct)
    DispLeaderPokemonSelectMenu({
      flagNewChange = "CHANGE",
      flagSort = true,
      typeParty = "STORY_PARTY",
      typeDrawGroup = "DYVER_GROUP",
      decideAct = flowOkAct,
      cancelAct = flowCancelAct,
      flagIndexOnly = true
    })
  end
  local function enterMinigameAndResumeFlow(resumeFlow, resumeArgTbl, returnLandIndex, returnSpaceIndex)
    GROUND:SetLandShopSceneContinueFunction(function()
      OpenMinigameDungeonDiverMenu(shopIns, returnLandIndex, returnSpaceIndex, resumeFlow, resumeArgTbl)
    end)
    FLAG.MapMoveNoFade = CONST.FLAG_TRUE
    DUNGEON_DIVER:Entry()
    SOUND:FadeOutBgm(TimeSec(0.5))
    SOUND:WaitBgm()
    FUNC_COMMON:SetSdmcEnable(false)
    SYSTEM:EnterMinigame(returnLandIndex, returnSpaceIndex)
  end
  FlowSys:Start()
  ShopSys:Start()
  function FlowSys.Proc.setup()
    DUNGEON_DIVER:Setup()
    FlowSys:Next("checkGameOver")
  end
  function FlowSys.Proc.reload()
    DUNGEON_DIVER:Setup()
    SCREEN_A:FadeIn(TimeSec(0.3), false)
    SCREEN_B:FadeIn(TimeSec(0.3), true)
    if DUNGEON_DIVER:IsEndStateNothing() then
      FlowSys:Next("topOther")
      return
    elseif DUNGEON_DIVER:IsEndStateGameClear() then
      FlowSys:Next("diverExitEnd")
      return
    elseif DUNGEON_DIVER:IsEndStateGameOver() then
      FlowSys:Next("gameOver")
      return
    end
  end
  function FlowSys.Proc.reloadResume()
    MENU:LoadMenuTextPool("message/shop.bin", false)
    MENU:LoadMenuTextPool("message/menu_minigame_dungeon_diver.bin")
    if FlowSys.Stat.resumeNextFlow then
      local flow = FlowSys.Stat.resumeNextFlow
      FlowSys.Stat.resumeNextFlow = nil
      FlowSys:Next(flow)
    end
  end
  function FlowSys.Proc.checkGameOver()
    if DUNGEON_DIVER:CheckGameOver() then
      FlowSys.Stat.next = "gameOver"
    else
      FlowSys.Stat.next = "topStart"
    end
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.gameOver()
    SetTagDiverName()
    Talk(MINIGAME_DUNGEON_DIVER__DOWN)
    FlowSys:Next("reward", "gameOverChangeConfirm")
  end
  function FlowSys.Proc.gameOverChangeConfirm()
    if DUNGEON_DIVER:IsChangeDiverPokemon() then
      FlowSys:Next("gameOverChangeSelect")
    else
      FlowSys:Next("gameOverDown")
    end
  end
  function FlowSys.Proc.gameOverChangeSelect()
    FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__DOWN_CHANGE, FACE_TYPE.NORMAL, "gameOverGiveupConfirm", {
      text = MINIGAME_DUNGEON_DIVER__DOWN_CHANGE_YES,
      next = "gameOverChange"
    }, {
      text = MINIGAME_DUNGEON_DIVER__DOWN_CHANGE_NO,
      next = "gameOverGiveupConfirm"
    })
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.gameOverGiveupConfirm()
    FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__DOWN_CHANGE_CONFORM, FACE_TYPE.NORMAL, "gameOverGiveupCancel", {
      text = MINIGAME_DUNGEON_DIVER__DOWN_CHANGE_CONFORM_YES,
      next = "gameOverGiveup"
    }, {
      text = MINIGAME_DUNGEON_DIVER__DOWN_CHANGE_CONFORM_NO,
      next = "gameOverGiveupCancel"
    })
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.gameOverChange()
    Talk(MINIGAME_DUNGEON_DIVER__DOWN_CHANGE_MESSAGE)
    FlowSys:Next("gameOverDiverChange")
  end
  function FlowSys.Proc.gameOverGiveupCancel()
    Talk(MINIGAME_DUNGEON_DIVER__DOWN_CHANGE_CONFORM_MESSAGE)
    FlowSys:Next("gameOverDiverChange")
  end
  function FlowSys.Proc.gameOverDiverChange()
    WINDOW:CloseMessage()
    DispDiverPlayerSelectMenu(function()
      FlowSys.Stat.selectWarehouseId = ShopSys.shopping_selectPokemonWarehouseId
      FlowSys:Next("gameOverDiverChangeSelectConfirm")
    end, function()
      FlowSys:Next("gameOverGiveupConfirm")
    end)
  end
  function FlowSys.Proc.gameOverDiverChangeSelectConfirm()
    SetTagDiverName()
    SetTagSelectDiverName()
    FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__DOWN_SELECT_DAIVER, FACE_TYPE.NORMAL, "gameOverDiverChange", {
      text = MINIGAME_DUNGEON_DIVER__DOWN_SELECT_DAIVER_YES,
      next = "gameOverDiverChangeGo"
    }, {
      text = MINIGAME_DUNGEON_DIVER__DOWN_SELECT_DAIVER_NO,
      next = "gameOverDiverChange"
    })
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.gameOverDiverChangeGo()
    DUNGEON_DIVER:Enter(FlowSys.Stat.selectWarehouseId)
    Talk(MINIGAME_DUNGEON_DIVER__DOWN_SELECT_DAIVER_GO)
    FlowSys:Next("topOther")
  end
  function FlowSys.Proc.gameOverDown()
    DUNGEON_DIVER:Finish()
    Talk(MINIGAME_DUNGEON_DIVER__DOWN_GAME_OVER)
    FlowSys:Next("topOther")
  end
  function FlowSys.Proc.gameOverGiveup()
    DUNGEON_DIVER:Finish()
    Talk(MINIGAME_DUNGEON_DIVER__NO_WAIT_POKEMON)
    FlowSys:Next("topOther")
  end
  function FlowSys.Proc.topStart()
    FlowSys.Stat.askMessage = MINIGAME_DUNGEON_DIVER__WELCOME
    FlowSys:Next("top")
  end
  function FlowSys.Proc.topOther()
    FlowSys.Stat.askMessage = MINIGAME_DUNGEON_DIVER__SERIES
    FlowSys:Next("top")
  end
  function FlowSys.Proc.top()
    local next = "topOther"
    if DUNGEON_DIVER:IsContinue() then
      FlowSys.Stat.next = TalkAsk(FlowSys.Stat.askMessage, FACE_TYPE.NORMAL, "exit", {text = MINIGAME_DUNGEON_DIVER__SERIES_LOOK, next = "watch"}, {text = MINIGAME_DUNGEON_DIVER__SERIES_INSTRUCT, next = "instruct"}, {text = MINIGAME_DUNGEON_DIVER__SERIES_CARE, next = "care"}, {text = MINIGAME_DUNGEON_DIVER__SERIES_HELP, next = "helpA"})
    else
      FlowSys.Stat.next = TalkAsk(FlowSys.Stat.askMessage, FACE_TYPE.NORMAL, "exit", {text = MINIGAME_DUNGEON_DIVER__WELCOME_DIVER, next = "play"}, {text = MINIGAME_DUNGEON_DIVER__WELCOME_HELP, next = "helpA"})
    end
    FlowSys.Stat.askMessage = nil
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.instruct()
    if DUNGEON_DIVER:IsBreak() then
      FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__INSTRUCT, FACE_TYPE.NORMAL, "topOther", {
        text = MINIGAME_DUNGEON_DIVER__INSTRUCT_CHANGE,
        next = "diverChangeInto"
      }, {
        text = MINIGAME_DUNGEON_DIVER__INSTRUCT_START,
        next = "diverResume"
      }, {text = MINIGAME_DUNGEON_DIVER__INSTRUCT_BACK, next = "diverExit"})
    else
      FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__INSTRUCT, FACE_TYPE.NORMAL, "topOther", {
        text = MINIGAME_DUNGEON_DIVER__INSTRUCT_CHANGE,
        next = "diverChangeInto"
      }, {text = MINIGAME_DUNGEON_DIVER__INSTRUCT_REST, next = "diverBreak"}, {text = MINIGAME_DUNGEON_DIVER__INSTRUCT_BACK, next = "diverExit"})
    end
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.diverChangeInto()
    if DUNGEON_DIVER:IsChangeDiverPokemon() then
      Talk(MINIGAME_DUNGEON_DIVER__CHANGE_DIVER_INTO)
      FlowSys:Next("diverChange")
      return
    else
      Talk("[M:KARI]\228\186\164\228\187\163\227\129\167\227\129\141\227\130\139\227\131\157\227\130\177\227\131\162\227\131\179\227\129\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
      FlowSys:Next("instruct")
      return
    end
  end
  function FlowSys.Proc.diverChange()
    WINDOW:CloseMessage()
    DispDiverPlayerSelectMenu(function()
      FlowSys.Stat.selectWarehouseId = ShopSys.shopping_selectPokemonWarehouseId
      FlowSys:Next("diverChangeSelectConfirm")
    end, function()
      FlowSys:Next("instruct")
    end)
  end
  function FlowSys.Proc.diverChangeSelectConfirm()
    SetTagDiverName()
    SetTagSelectDiverName()
    FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__CHANGE_SELECT_DIVER, FACE_TYPE.NORMAL, "diverChange", {
      text = MINIGAME_DUNGEON_DIVER__CHANGE_SELECT_DIVER_YES,
      next = "diverChangeGo"
    }, {
      text = MINIGAME_DUNGEON_DIVER__CHANGE_SELECT_DIVER_NO,
      next = "diverChange"
    })
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.diverChangeGo()
    DUNGEON_DIVER:Enter(FlowSys.Stat.selectWarehouseId)
    Talk(MINIGAME_DUNGEON_DIVER__DOWN_SELECT_DAIVER_GO)
    FlowSys:Next("instruct")
  end
  function FlowSys.Proc.watch()
    if DUNGEON_DIVER:IsBreak() then
      FlowSys:Next("diverResume")
      return
    else
      Talk(MINIGAME_DUNGEON_DIVER__LOOK_INTO)
      FlowSys:Next("inGame")
      return
    end
  end
  function FlowSys.Proc.inGame()
    WINDOW:CloseMessage()
    SCREEN_A:FadeOut(TimeSec(0.3), false)
    SCREEN_B:FadeOut(TimeSec(0.3), true)
    enterMinigameAndResumeFlow("reload", nil, landIndex, spaceIndex)
  end
  function FlowSys.Proc.play()
    if DUNGEON_DIVER:IsChangeDiverPokemon() then
      Talk(MINIGAME_DUNGEON_DIVER__DAIVER_INTO)
      FlowSys:Next("diverSelect")
      return
    else
      Talk(MINIGAME_DUNGEON_DIVER__NO_WAIT_TEAM)
      FlowSys:Next("topOther")
      return
    end
  end
  function FlowSys.Proc.diverSelect()
    WINDOW:CloseMessage()
    DispDiverPlayerSelectMenu(function()
      FlowSys.Stat.selectWarehouseId = ShopSys.shopping_selectPokemonWarehouseId
      FlowSys:Next("diverSelectConfirm")
    end, function()
      FlowSys:Next("topOther")
    end)
  end
  function FlowSys.Proc.diverSelectConfirm()
    SetTagSelectDiverName()
    FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__DAIVER_GO, FACE_TYPE.NORMAL, "diverSelect", {text = MINIGAME_DUNGEON_DIVER__DAIVER_GO_YES, next = "diverGo"}, {
      text = MINIGAME_DUNGEON_DIVER__DAIVER_GO_NO,
      next = "diverSelect"
    })
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.diverGo()
    DUNGEON_DIVER:Enter(FlowSys.Stat.selectWarehouseId)
    Talk(MINIGAME_DUNGEON_DIVER__DIVER_GO_FINISH)
    FlowSys:Next("topOther")
  end
  function FlowSys.Proc.care()
    local next = "topOther"
    if DUNGEON_DIVER:IsContinue() then
      next = TalkAsk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_INTO, FACE_TYPE.NORMAL, "topOther", {text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_MODE, next = "careMode"}, {text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_ITEM, next = "itemCharge"}, {
        text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_MONEY,
        next = "moneyCharge"
      }, {
        text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_CONFIRM,
        next = "chargeCheck"
      }, {text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_HELP, next = "helpB"})
    else
      Talk(MINIGAME_DUNGEON_DIVER__NO_CHALLENGER)
      next = "topOther"
    end
    FlowSys:Next(next)
  end
  function FlowSys.Proc.careMode()
    local next = TalkAsk(MINIGAME_DUNGEON_DIVER__CARE_MODE, FACE_TYPE.NORMAL, "care", {
      text = MINIGAME_DUNGEON_DIVER__CARE_MODE_EVERY,
      next = "careModeEvery"
    }, {
      text = MINIGAME_DUNGEON_DIVER__CARE_MODE_LITE,
      next = "careModeLite"
    }, {
      text = MINIGAME_DUNGEON_DIVER__CARE_MODE_NONE,
      next = "careModeNone"
    })
    FlowSys:Next(next)
  end
  function FlowSys.Proc.careModeEvery()
    DUNGEON_DIVER:SetPolicyAlready()
    Talk(MINIGAME_DUNGEON_DIVER__CARE_MODE_EVERY_FINISH)
    FlowSys:Next("care")
  end
  function FlowSys.Proc.careModeLite()
    DUNGEON_DIVER:SetPolicyEconomy()
    Talk(MINIGAME_DUNGEON_DIVER__CARE_MODE_LITE_FINISH)
    FlowSys:Next("care")
  end
  function FlowSys.Proc.careModeNone()
    DUNGEON_DIVER:SetPolicyDisuse()
    Talk(MINIGAME_DUNGEON_DIVER__CARE_MODE_NONE_FINISH)
    FlowSys:Next("care")
  end
  function FlowSys.Proc.itemCharge()
    if DUNGEON_DIVER:IsHelpStockItemFull() then
      Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_ITEM_MAXITEM)
      FlowSys:Next("care")
      return
    elseif CheckWarehouseInHelpStockItemEmpty() == true then
      Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_ITEM_NOITEM)
      FlowSys:Next("care")
      return
    else
      Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_ITEM_SELECT)
      FlowSys:Next("itemChargeSelect")
      return
    end
  end
  function FlowSys.Proc.itemChargeSelect()
    WINDOW:CloseMessage()
    local next = "itemChargeConform"
    DispHelpStockItemSelectMenu(function()
      next = "itemChargeConform"
      local item = ShopSys:GetSelectWarehouseItem()
      FlowSys.Stat.itemIndex = item.warehouseItemIndex
      FlowSys.Stat.itemCount = ShopSys:GetSelectWarehouseItemCount()
    end, function()
      next = "care"
    end, function()
      next = "itemGuide"
    end)
    FlowSys:Next(next)
  end
  function FlowSys.Proc.itemChargeConform()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", ShopSys:GetSelectWarehouseItemNameText())
    local next
    next = TalkAsk(MINIGAME_DUNGEON_DIVER__CARE_ITEM_SELECT_CONFIRM, FACE_TYPE.NORMAL, "itemChargeSelect", {
      text = MINIGAME_DUNGEON_DIVER__CARE_ITEM_SELECT_CONFIRM_YES,
      next = "itemChargeEnd"
    }, {
      text = MINIGAME_DUNGEON_DIVER__CARE_ITEM_SELECT_CONFIRM_NO,
      next = "itemChargeSelect"
    })
    do break end
    next = TalkAsk(MINIGAME_DUNGEON_DIVER__CARE_ITEM_SELECT_CONFIRM_MULTI, FACE_TYPE.NORMAL, "itemChargeSelect", {
      text = MINIGAME_DUNGEON_DIVER__CARE_ITEM_SELECT_CONFIRM_MULTI_YES,
      next = "itemChargeEnd"
    }, {
      text = MINIGAME_DUNGEON_DIVER__CARE_ITEM_SELECT_CONFIRM_MULTI_NO,
      next = "itemChargeSelect"
    })
    FlowSys:Next(next)
  end
  function FlowSys.Proc.itemChargeEnd()
    DepositHelpStockItem()
    Talk(MINIGAME_DUNGEON_DIVER__CARE_ITEM_SELECT_FINISH)
    do break end
    Talk(MINIGAME_DUNGEON_DIVER__CARE_ITEM_SELECT_CONFIRM_MULTI_FINISH)
    FlowSys:Next("care")
  end
  function FlowSys.Proc.moneyCharge()
    if DUNGEON_DIVER:GetHelpStockMoneyLimit() - DUNGEON_DIVER:GetHelpStockMoney() <= 0 then
      Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_MAXMONEY)
      FlowSys.Stat.next = "care"
    elseif ShopSys:CheckPlayerMoneyZero() == true then
      Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_NOMONEY)
      FlowSys.Stat.next = "care"
    else
      Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_MONEY_SELECT)
      FlowSys.Stat.next = "moneyChargeSelect"
    end
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.moneyChargeSelect()
    WINDOW:CloseMessage()
    FlowSys.Stat.menu = OpenHelpStockMoneyMenu()
    DispMoneyDepositInput(function()
      ShopSys:assertSelectNumber()
      if ShopSys.shopping_selectNumber > 0 then
        FlowSys.Stat.next = "moneyChargeConform"
      else
        FlowSys.Stat.next = "care"
      end
    end, function()
      FlowSys.Stat.next = "care"
    end)
    FlowSys.Stat.menu.Close()
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.moneyChargeConform()
    FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_MONEY_SELECT_CONFIRM, FACE_TYPE.NORMAL, "moneyChargeSelect", {
      text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_MONEY_SELECT_CONFIRM_YES,
      next = "moneyChargeEnd"
    }, {
      text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_MONEY_SELECT_CONFIRM_NO,
      next = "moneyChargeSelect"
    })
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.moneyChargeEnd()
    DepositHelpStockMoney()
    Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_MONEY_SELECT_FINISH)
    FlowSys:Next("care")
  end
  function FlowSys.Proc.chargeCheck()
    if not DUNGEON_DIVER:IsHelpStockItemEmpty() or DUNGEON_DIVER:GetHelpStockMoney() > 0 then
      Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_CONFIRM_ANYTHING)
      WINDOW:CloseMessage()
      OpenHelpStockItemListMenu()
    else
      Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_CONFIRM_NOTHING)
    end
    FlowSys:Next("care")
  end
  function FlowSys.Proc.diverBreak()
    stGetRestMoneyCost()
    FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_REST_CONFIRM, FACE_TYPE.NORMAL, "topOther", {
      text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_REST_CONFIRM_YES,
      next = "diverBreakEnd"
    }, {text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_REST_CONFIRM_NO, next = "topOther"})
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.diverBreakEnd()
    DUNGEON_DIVER:Break()
    Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_REST_FINISH)
    FlowSys:Next("topOther")
  end
  function FlowSys.Proc.diverResume()
    FlowSys.Stat.next = TalkAsk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_AGAIN_CONFIRM, FACE_TYPE.NORMAL, "topOther", {
      text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_AGAIN_CONFIRM_YES,
      next = "diverResumeEnd"
    }, {text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_AGAIN_CONFIRM_NO, next = "topOther"})
    FlowSys:Next(FlowSys.Stat.next)
  end
  function FlowSys.Proc.diverResumeEnd()
    DUNGEON_DIVER:Resume()
    Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_AGAIN_FINISH)
    FlowSys:Next("topOther")
  end
  function FlowSys.Proc.diverExit()
    local next = TalkAsk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_BACK_CONFIRM, FACE_TYPE.NORMAL, "topOther", {
      text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_BACK_CONFIRM_YES,
      next = "diverExitEnd"
    }, {text = MINIGAME_DUNGEON_DIVER__DAIVER_CARE_BACK_CONFIRM_NO, next = "topOther"})
    FlowSys:Next(next)
  end
  function FlowSys.Proc.diverExitEnd()
    DUNGEON_DIVER:Finish()
    Talk(MINIGAME_DUNGEON_DIVER__DAIVER_CARE_BACK_FINISH)
    FlowSys:Next("reward", "topOther")
  end
  function FlowSys.Proc.reward(nextFlow)
    FlowSys.Stat.next = nextFlow
    if DUNGEON_DIVER:GetRewardItemCount() ~= 0 then
      FlowSys:Next("dispReward")
      return
    else
      FlowSys:Next("excuteReward")
      return
    end
  end
  function FlowSys.Proc.dispReward()
    if DUNGEON_DIVER:GetRewardItemCount() ~= 0 then
      DispRewardItemListMenu(function()
        FlowSys:Next("excuteReward")
      end, function()
        FlowSys:Next("itemGuide", "dispReward")
      end)
    else
      FlowSys:Next("excuteReward")
    end
  end
  function FlowSys.Proc.excuteReward()
    for i = 0, DUNGEON_DIVER:GetRewardItemCount() - 1 do
      local itemIndex = DUNGEON_DIVER:GetRewardItemIndex(i)
      local count = DUNGEON_DIVER:GetRewardItemNowCount(itemIndex)
      OverFlow:AddOverflowCheckItem(itemIndex, count, false)
    end
    local money = DUNGEON_DIVER:DepositMoneyToMoenyBank()
    if money ~= 0 then
      OverFlow:AddOverflowCheckItem(539, money, true)
    end
    OverFlow:OpenOrderOverflowMenu(true)
    Talk("[M:KARI]\227\129\145\227\129\132\227\129\145\227\130\147\227\129\161 \227\129\139\227\129\143\227\129\168\227\129\143 \227\131\161\227\131\131\227\130\187\227\131\188\227\130\184\227\130\146\230\181\129\227\129\151\227\129\190\227\129\153\227\128\130")
    if FlowSys.Stat.next then
      FlowSys:Next(FlowSys.Stat.next)
    else
      FlowSys:Next("topOther")
    end
  end
  function FlowSys.Proc.itemGuide(nextFlow)
    DispItemGuide()
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.helpA()
    Talk(MINIGAME_DUNGEON_DIVER__HELP)
    FlowSys:Next("topOther")
  end
  function FlowSys.Proc.helpB()
    Talk(MINIGAME_DUNGEON_DIVER__HELP_B)
    FlowSys:Next("topOther")
  end
  function FlowSys.Proc.exit()
    Talk(MINIGAME_DUNGEON_DIVER__EXIT)
    WINDOW:CloseMessage()
    DUNGEON_DIVER:Exit()
    FlowSys:Return()
  end
  if resumeNextFlow then
    FlowSys.Stat.resumeNextFlow = resumeNextFlow
    FlowSys.Stat.resumeArgTbl = resumeArgTbl
    FlowSys:Call("reloadResume")
  else
    FlowSys:Call("setup")
  end
  FlowSys:Finish()
  ShopSys:Finish()
end
function OpenMinigameDungeonDiverDebugMenu()
  MENU:LoadMenuTextPool("message/menu_minigame_dungeon_diver.bin", false)
  MENU:LoadMenuTextPool("message/ground.bin")
  if DUNGEON_DIVER:IsContinue() then
    local OpenPutDateMenu = function(self)
      local menu = MENU:CreateParameterMenu()
      local minutesTbl = {}
      local hoursTbl = {}
      local daysTbl = {}
      local weeksTbl = {}
      menu:SetCaption(-374703246)
      menu:SetLayoutRectAndLines(self:GetRight() - 64, self:GetTop(), 0, 0)
      menu:AddItemI(-1053865607, ValueParamEx(1, 60, 1, 1, 5, 10), nil, minutesTbl)
      menu:AddItemI(554232426, ValueParamEx(1, 24, 1, 1, 5, 10), nil, hoursTbl)
      menu:AddItemI(639087816, ValueParamEx(1, 7, 1, 1, 5, 10), nil, daysTbl)
      menu:AddItemI(-300870644, ValueParamEx(1, 99, 1, 1, 5, 10), nil, weeksTbl)
      menu:AddItem(-1121946143, nil, {
        decideAction = function(self)
          self:Close()
        end
      })
      function menu:cancelAction()
        self:Close()
      end
      function minutesTbl:decideAction()
        local value = self.curItem.value
        if DUNGEON_DIVER:Debug_PutDate(value * 60) then
          MENU:SetTag_String(0, value .. "")
          WINDOW:SysMsg(-1555526430)
        else
          WINDOW:SysMsg(-1438356556)
        end
        WINDOW:CloseMessage()
      end
      function hoursTbl:decideAction()
        local value = self.curItem.value
        if DUNGEON_DIVER:Debug_PutDate(value * 60 * 60) then
          MENU:SetTag_String(0, value .. "")
          WINDOW:SysMsg(-1818783045)
        else
          WINDOW:SysMsg(-1438356556)
        end
        WINDOW:CloseMessage()
      end
      function daysTbl:decideAction()
        local value = self.curItem.value
        if DUNGEON_DIVER:Debug_PutDate(value * 60 * 60 * 24) then
          MENU:SetTag_String(0, value .. "")
          WINDOW:SysMsg(1467681265)
        else
          WINDOW:SysMsg(-1438356556)
        end
        WINDOW:CloseMessage()
      end
      function weeksTbl:decideAction()
        local value = self.curItem.value
        if DUNGEON_DIVER:Debug_PutDate(value * 60 * 60 * 24 * 7) then
          MENU:SetTag_String(0, value .. "")
          WINDOW:SysMsg(-1542452004)
        else
          WINDOW:SysMsg(-1438356556)
        end
        WINDOW:CloseMessage()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    local OpenBackDateMenu = function(self)
      local menu = MENU:CreateParameterMenu()
      local minutesTbl = {}
      local hoursTbl = {}
      local daysTbl = {}
      local weeksTbl = {}
      menu:SetCaption(1689269897)
      menu:SetLayoutRectAndLines(self:GetRight() - 64, self:GetTop(), 0, 0)
      menu:AddItemI(-1053865607, ValueParamEx(1, 60, 1, 1, 5, 10), nil, minutesTbl)
      menu:AddItemI(554232426, ValueParamEx(1, 24, 1, 1, 5, 10), nil, hoursTbl)
      menu:AddItemI(639087816, ValueParamEx(1, 7, 1, 1, 5, 10), nil, daysTbl)
      menu:AddItemI(-300870644, ValueParamEx(1, 99, 1, 1, 5, 10), nil, weeksTbl)
      menu:AddItem(-1121946143, nil, {
        decideAction = function(self)
          self:Close()
        end
      })
      function menu:cancelAction()
        self:Close()
      end
      function minutesTbl:decideAction()
        local value = self.curItem.value
        if DUNGEON_DIVER:Debug_BackDate(value * 60) then
          MENU:SetTag_String(0, value .. "")
          WINDOW:SysMsg(962575435)
        else
          WINDOW:SysMsg(812206405)
        end
        WINDOW:CloseMessage()
      end
      function hoursTbl:decideAction()
        local value = self.curItem.value
        if DUNGEON_DIVER:Debug_BackDate(value * 60 * 60) then
          MENU:SetTag_String(0, value .. "")
          WINDOW:SysMsg(-896843872)
        else
          WINDOW:SysMsg(812206405)
        end
        WINDOW:CloseMessage()
      end
      function daysTbl:decideAction()
        local value = self.curItem.value
        if DUNGEON_DIVER:Debug_BackDate(value * 60 * 60 * 24) then
          MENU:SetTag_String(0, value .. "")
          WINDOW:SysMsg(-848545448)
        else
          WINDOW:SysMsg(812206405)
        end
        WINDOW:CloseMessage()
      end
      function weeksTbl:decideAction()
        local value = self.curItem.value
        if DUNGEON_DIVER:Debug_BackDate(value * 60 * 60 * 24 * 7) then
          MENU:SetTag_String(0, value .. "")
          WINDOW:SysMsg(-49503801)
        else
          WINDOW:SysMsg(812206405)
        end
        WINDOW:CloseMessage()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    local OpenStockItemFull = function()
      DUNGEON_DIVER:Debug_StockItemFull()
      WINDOW:SysMsg(-1405547839)
      WINDOW:CloseMessage()
    end
    local OpenStockItemEmpty = function()
      DUNGEON_DIVER:Debug_StockItemEmpty()
      WINDOW:SysMsg(759694291)
      WINDOW:CloseMessage()
    end
    local menu = MENU:CreatePageMenu()
    local actionTbl = {}
    menu:SetCaption(-374703246)
    menu:SetLayoutRectAndLines(16, 24, 0, 0)
    menu:AddItem(199688274, {func = OpenPutDateMenu}, actionTbl)
    menu:AddItem(1689269897, {func = OpenBackDateMenu}, actionTbl)
    menu:AddItem(1756330387, {func = OpenStockItemFull}, actionTbl)
    menu:AddItem(-54157311, {func = OpenStockItemEmpty}, actionTbl)
    menu:AddItem(-1121946143, nil, {
      decideAction = function(self)
        self:Close()
      end
    })
    function menu:cancelAction()
      self:Close()
    end
    function actionTbl:decideAction()
      if self.curItem.obj.func then
        local openFunc = self.curItem.obj.func
        if openFunc then
          openFunc(self)
        end
      end
      MENU:SetFocus(self)
    end
    NestMenu_OpenAndCloseWait(menu)
  else
    WINDOW:SysMsg(759112143)
    WINDOW:CloseMessage()
  end
end

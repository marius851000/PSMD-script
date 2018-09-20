function OpenShopWAZATrainingMenu(shopIns, landIndex, spaceIndex)
  local selectPokemonWarehouseId, selectWazaIndex, selectItem
  local EventPlay = {}
  function OpenTrainingMenu()
    WINDOW:CloseMessage()
    CommonSys:BeginUpperDarkFilter(false)
    selectPokemonWarehouseId = nil
    CommonSys:OpenBasicMenu(SHOP_WAZATRAINING__CAPTION_POKEMON, SHOP_WAZATRAINING__MANUAL_POKEMON, nil)
    local upScreenStatusWindow = MENU:CreateWazaStatusWindow(ScreenType.A)
    upScreenStatusWindow:SetWarehouseId(0)
    upScreenStatusWindow:SetLayoutRect(64, 40, 272, 172)
    upScreenStatusWindow:SetFacePos(68, 44)
    upScreenStatusWindow:SetNameWindowRect(64, 104, 64, 16)
    upScreenStatusWindow:SetType1Pos(80, 0)
    upScreenStatusWindow:SetType2Pos(184, 0)
    upScreenStatusWindow:SetLvPos(80, 20)
    upScreenStatusWindow:SetHpPos(80, 36)
    upScreenStatusWindow:SetAttackPos(80, 58)
    upScreenStatusWindow:SetDefendPos(176, 58)
    upScreenStatusWindow:SetAttackExPos(80, 74)
    upScreenStatusWindow:SetDefendExPos(176, 74)
    upScreenStatusWindow:SetAbilityPos(80, 90)
    upScreenStatusWindow:SetWaza1Pos(80, 110)
    upScreenStatusWindow:SetWaza2Pos(80, 126)
    upScreenStatusWindow:SetWaza3Pos(80, 142)
    upScreenStatusWindow:SetWaza4Pos(80, 158)
    upScreenStatusWindow:Open()
    local warehouseMenu = MENU:CreatePageMenu()
    warehouseMenu:SetLayoutRectAndLines(16, 40, 136, 8)
    warehouseMenu:ShowPageNum(true)
    for wareHouseId in GROUND:EnumeratePokemonWarehouseId() do
      if shopIns:IsSortie(wareHouseId) == false then
        if shopIns:IsHaveTrainingWaza(wareHouseId) == false then
          warehouseMenu:AddItem(GROUND:GetPokemonWarehouseNameLvFromId(wareHouseId, false), wareHouseId, nil)
        else
          warehouseMenu:AddItem(GROUND:GetPokemonWarehouseNameLvFromId(wareHouseId, true), wareHouseId, nil)
        end
      end
    end
    function warehouseMenu:itemPreOpenModifyAction()
      if self.curItem.obj ~= nil then
        local warehouseId = self.curItem.obj
        if GROUND:IsPokemonWarehouseSallyOtherMode(warehouseId) then
          self.curItem.grayed = true
        end
        if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true and FLAG.DunClearRestToParadise ~= CONST.FLAG_TRUE then
          if GROUND:IsPokemonWarehouseIdHero(warehouseId) == true then
            self.curItem.grayed = false
          end
          if GROUND:IsPokemonWarehouseIdPartner(warehouseId) == true then
            self.curItem.grayed = false
          end
        end
        if shopIns:IsHaveTrainingWaza(self.curItem.obj) == false then
          self.curItem.grayed = true
        end
      end
    end
    warehouseMenu.itemPreUpdateModifyAction = warehouseMenu.itemPreOpenModifyAction
    function warehouseMenu:openedAction()
      self:SetCursorItemIndex(ShopSys:ResumeCursorIndex("trainingSaveCursor", 0))
      upScreenStatusWindow:SetWarehouseId(self.curItem.obj)
    end
    function warehouseMenu:cancelAction()
      selectPokemonWarehouseId = nil
      self:Close()
    end
    function warehouseMenu:decideAction()
      selectPokemonWarehouseId = self.curItem.obj
      self:Close()
      ShopSys:SaveCursorIndex("trainingSaveCursor", self:GetCursorItemIndex())
    end
    function warehouseMenu:currentItemChange()
      upScreenStatusWindow:SetWarehouseId(self.curItem.obj)
    end
    BasicMenu_OpenAndCloseWait(warehouseMenu)
    upScreenStatusWindow:Close()
    CommonSys:CloseBasicMenu()
    CommonSys:EndUpperDarkFilter(false)
  end
  function OpenWazaMenu(type)
    WINDOW:CloseMessage()
    CommonSys:BeginUpperDarkFilter(false)
    if type == "TYPE_MENU" then
      selectWazaIndex = nil
      CommonSys:OpenBasicMenu(SHOP_WAZATRAINING__CAPTION_TRAINING, SHOP_WAZATRAINING__MANUAL_TRAINING, nil)
    elseif type == "TYPE_RESULT" then
      CommonSys:OpenBasicMenu(nil, SHOP_WAZATRAINING__MANUAL_TRAINING_FINISH, nil)
    end
    wazaDetailWindow = MENU:CreateWazaDetailWindow()
    wazaDetailWindow:SetWazaIndex(FUNC_COMMON:GetWazaIndexFromWarehouseId(selectPokemonWarehouseId, 0))
    if type == "TYPE_MENU" then
      wazaDetailWindow:Open()
    end
    if type == "TYPE_MENU" then
      local boardMenu = MENU:CreateWazaSelectWindow()
      boardMenu:SetWarehouseId(selectPokemonWarehouseId)
      local wazaCnt = FUNC_COMMON:GetWazaCountFromWarehouseId(selectPokemonWarehouseId)
      if wazaCnt == 0 then
        boardMenu:AddItem("", 0, nil)
      else
        for i = 0, wazaCnt - 1 do
          local selectFlag = true
          local wazaIndex = shopIns:GetWazaIndexFromWareHouse(selectPokemonWarehouseId, i)
          if shopIns:IsSameType(wazaIndex) == false then
            selectFlag = false
          end
          if shopIns:IsGrowupFinish(wazaIndex) then
            selectFlag = false
          end
          local pp = FUNC_COMMON:GetWazaPPFromWarehouseId(selectPokemonWarehouseId, i)
          MENU:SetTag_Value(0, pp)
          local textPP
          if pp == 0 then
            textPP = MENU:ReplaceTagText(1031111845)
          else
            textPP = MENU:ReplaceTagText(-1652712251)
          end
          if selectFlag == ture then
            MENU:SetTag_String(8, FUNC_COMMON:GetWazaNameFromWarehouseId(selectPokemonWarehouseId, i))
          else
            MENU:SetTag_String(8, FUNC_COMMON:GetWazaNameFromWarehouseIdNonColor(selectPokemonWarehouseId, i))
          end
          MENU:SetTag_String(9, textPP)
          MENU:SetTag_Value(1, FUNC_COMMON:GetWazaMaxPPFromWarehouseId(selectPokemonWarehouseId, i))
          local text = MENU:ReplaceTagText(429575614)
          boardMenu:AddItem(text, i, nil)
          if selectFlag == false then
            boardMenu:SetCurrentModifyItem(i)
            boardMenu.curItem.grayed = true
          end
        end
      end
      function boardMenu:decideAction()
        selectWazaIndex = self.curItem.obj
        self:Close()
      end
      function boardMenu:cancelAction()
        selectWazaIndex = nil
        self:Close()
      end
      function boardMenu:currentItemChange()
        wazaDetailWindow:SetWazaIndex(FUNC_COMMON:GetWazaIndexFromWarehouseId(selectPokemonWarehouseId, self.curItem.obj))
      end
      boardMenu:Open()
      MENU:SetFocus(boardMenu)
      FlowSys:WaitCloseMenu(boardMenu)
      wazaDetailWindow:Close()
      CommonSys:CloseBasicMenu()
    elseif type == "TYPE_RESULT" then
      wazaDetailWindow:SetWazaIndex(FUNC_COMMON:GetWazaIndexFromWarehouseId(selectPokemonWarehouseId, selectWazaIndex))
      function wazaDetailWindow:decideAction()
        self:Close()
      end
      function wazaDetailWindow:cancelAction()
        self:Close()
      end
      local upArrowFlag = 0
      if shopIns:IsUpCheck(1) then
        upArrowFlag = upArrowFlag + WazaDetailArrowFlag.FLAG_POWER_UP
      end
      if shopIns:IsUpCheck(2) then
        upArrowFlag = upArrowFlag + WazaDetailArrowFlag.FLAG_PP_UP
      end
      if shopIns:IsUpCheck(3) then
        upArrowFlag = upArrowFlag + WazaDetailArrowFlag.FLAG_HIT_UP
      end
      wazaDetailWindow:SetArrowFlags(upArrowFlag)
      CommonSys:OpenAndCloseWait(wazaDetailWindow)
    end
    CommonSys:EndUpperDarkFilter(false)
  end
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/top.bin", true)
  GROUND:SortPokemonWarehouseByNo()
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  function FlowSys.Proc.MenuTopFirst()
    ShopSys:SetSelectGoodsTbl(nil)
    ShopSys:SetShopTag("\233\129\147\229\160\180\229\144\141", shopIns:GetShopName())
    ShopSys:SetShopTag("\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151", shopIns:GetShopWazaTypeName())
    ShopSys:Talk(SHOP_WAZATRAINING__WELCOME_BEFORE, nil)
    WINDOW:CloseMessage()
    MENU:SetTag_Money(0, shopIns:GetTrainingRate())
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_WAZATRAINING__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "ExitShop"}, {
      text = SHOP_WAZATRAINING__WELCOME_TRAINING,
      next = "TopTrainingBefore"
    }, {text = SHOP_WAZATRAINING__WELCOME_USE_ITEM, next = "TopHiketsu"}, {text = SHOP_WAZATRAINING__WELCOME_HELP, next = "Help"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopLoop()
    ShopSys:SetSelectGoodsTbl(nil)
    ShopSys:SetShopTag("\233\129\147\229\160\180\229\144\141", shopIns:GetShopName())
    ShopSys:SetShopTag("\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151", shopIns:GetShopWazaTypeName())
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_WAZATRAINING__SERIES, nil, {cursorReset = true}, {next = "ExitShop"}, {
      text = SHOP_WAZATRAINING__SERIES_TRAINING,
      next = "TopTrainingBefore"
    }, {text = SHOP_WAZATRAINING__SERIES_USE_ITEM, next = "TopHiketsu"}, {text = SHOP_WAZATRAINING__SERIES_HELP, next = "Help"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.TopTrainingBefore()
    if shopIns:IsTrainingCount() == false then
      ShopSys:Talk(SHOP_WAZATRAINING__NOT_TRAINING_NO_MORE, nil)
      WINDOW:KeyWait()
      FlowSys:Next("MenuTopLoop")
      return
    end
    local myMoney = GROUND:GetPlayerMoney()
    local rateMoney = shopIns:GetTrainingRate()
    if myMoney - rateMoney < 0 then
      MENU:SetTag_Money(0, shopIns:GetTrainingRate())
      ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
      ShopSys:Talk(SHOP_WAZATRAINING__NO_MONEY, nil)
      FlowSys:Next("ExitShop")
      return
    end
    ShopSys:SetShopTag("\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151", shopIns:GetShopWazaTypeName())
    ShopSys:Talk(SHOP_WAZATRAINING__SELECT_TRAINING_POKEMON, nil)
    FlowSys:Next("TopTraining")
  end
  function FlowSys.Proc.TopTraining()
    OpenTrainingMenu()
    if selectPokemonWarehouseId == nil then
      FlowSys:Next("MenuTopLoop")
      return
    end
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", shopIns:GetPokemonName(selectPokemonWarehouseId))
    ShopSys:SetShopTag("\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151", shopIns:GetShopWazaTypeName())
    if shopIns:IsHaveTrainingWaza(selectPokemonWarehouseId) == false then
      ShopSys:Talk(SHOP_WAZATRAINING__NOT_TRAINING_NO_WAZA, nil)
      FlowSys:Next("TopTraining")
      return
    end
    if shopIns:IsAllGradeMax(selectPokemonWarehouseId) == true then
      ShopSys:Talk(SHOP_WAZATRAINING__NOT_TRAINING_MAX_WAZA, nil)
      FlowSys:Next("TopTraining")
      return
    end
    ShopSys:SetShopTag("\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151", shopIns:GetShopWazaTypeName())
    ShopSys:Talk(SHOP_WAZATRAINING__SELECT_TRAINING_WAZA, nil)
    FlowSys:Next("SelectWaza")
  end
  function FlowSys.Proc.SelectWaza()
    OpenWazaMenu("TYPE_MENU")
    if selectWazaIndex == nil then
      FlowSys:Next("TopTraining")
      return
    end
    FlowSys:Next("NonItem")
  end
  function FlowSys.Proc.ItemGuide(nextFlow)
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispItemGuide()
    CommonSys:EndLowerMenuNavi(true)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.NonItem()
    if shopIns:IsGradeMax(FUNC_COMMON:GetWazaIndexFromWarehouseId(selectPokemonWarehouseId, selectWazaIndex)) then
      FlowSys:Next("WazaParamaterAllMax")
      return
    end
    ShopSys:DispMoneyWindowOpen()
    selectItem = nil
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
    MENU:SetTag_Money(0, shopIns:GetTrainingRate())
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
    ShopSys:TalkAskFlowNoClose(SHOP_WAZATRAINING__TRAINING_WAZA_DECIDE, nil, nil, {
      next = "NonItemCansel"
    }, {text = SHOP_WAZATRAINING__TRAINING_WAZA_DECIDE_YES, next = "Training"}, {
      text = SHOP_WAZATRAINING__TRAINING_WAZA_DECIDE_NO,
      next = "NonItemCansel"
    })
    ShopSys:DispMoneyWindowClose()
  end
  function FlowSys.Proc.WazaParamaterAllMax()
    local wazaIndex = shopIns:GetWazaIndexFromWareHouse(selectPokemonWarehouseId, selectWazaIndex)
    if (shopIns:IsPowerZero(wazaIndex) or shopIns:CheckWazaMaxStatus(1, wazaIndex)) and shopIns:CheckWazaMaxStatus(2, wazaIndex) and shopIns:CheckWazaMaxStatus(3, wazaIndex) then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
      ShopSys:Talk(SHOP_WAZATRAINING__TRAINING_WAZA_ALL_MAX, nil)
      FlowSys:Next("SelectWaza")
      return
    end
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
    ShopSys:Talk(SHOP_WAZATRAINING__TRAINING_WAZA_LVMAX, nil)
    FlowSys:Next("SelectWaza")
    return
  end
  function FlowSys.Proc.NonItemCansel()
    ShopSys:Talk(SHOP_WAZATRAINING__TRAINING_CANCEL, nil)
    FlowSys:Next("SelectWaza")
  end
  function FlowSys.Proc.Training()
    local rateMoney = shopIns:GetTrainingRate()
    GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() - rateMoney)
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    FlowSys:Next("TrainingStart")
  end
  function FlowSys.Proc.TrainingStart()
    local wazaIndex = shopIns:GetWazaIndexFromWareHouse(selectPokemonWarehouseId, selectWazaIndex)
    EventPlay.eventWazaShopRun()
    local backupWazaNameId = FUNC_COMMON:GetWazaNameFromWazaIndex(wazaIndex)
    local burst = shopIns:IsBurstHit()
    SYSTEM:DebugPrint("+++++++++++++++EXP=" .. shopIns:GetTrainingExp(wazaIndex, burst))
    shopIns:ClearUpCheck()
    local gradeUp = shopIns:Growup(wazaIndex, burst)
    if burst == true then
      EventPlay.eventWazaShopResultSpecial(backupWazaNameId)
    else
      EventPlay.eventWazaShopResultNormal(backupWazaNameId)
    end
    if gradeUp == true then
      EventPlay.eventWazaShopResultLvup(wazaIndex, burst)
      SOUND:PlayMe(SymSnd("ME_MINIGAME_SOSO"))
      OpenWazaMenu("TYPE_RESULT")
      CommonSys:CloseBasicMenu()
    else
      SOUND:PlayMe(SymSnd("ME_WAZA"))
      CH("PLAYER"):SetManpu("MP_SPREE_LP")
      CH("PLAYER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
      CH("PLAYER"):WaitPlayMotion()
      CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", FUNC_COMMON:GetWazaNameFromWazaIndex(wazaIndex))
      if burst == true then
        ShopSys:SysMsg(SHOP_WAZATRAINING__TRAINING_WAZA_NO_LVUP_SPECIAL, nil)
      else
        ShopSys:SysMsg(SHOP_WAZATRAINING__TRAINING_WAZA_NO_LVUP, nil)
      end
      SOUND:WaitMe()
      WINDOW:CloseMessage()
      CH("PLAYER"):ResetManpu()
    end
    subEveDoubleJump(CH(shopIns:GetOwnerSymbol()))
    ShopSys:Talk(SHOP_WAZATRAINING__TRAINING_WAZA_FINISHI, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.TopHiketsu()
    ShopSys:SetShopTag("\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151", shopIns:GetShopWazaTypeName())
    ShopSys:Talk(SHOP_WAZATRAINING__HIKETSU_INTO, nil)
    FlowSys:Next("HiketsuSelectPokemon")
  end
  function FlowSys.Proc.HiketsuSelectPokemon()
    OpenTrainingMenu()
    if selectPokemonWarehouseId == nil then
      FlowSys:Next("MenuTopLoop")
      return
    end
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", shopIns:GetPokemonName(selectPokemonWarehouseId))
    ShopSys:SetShopTag("\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151", shopIns:GetShopWazaTypeName())
    if shopIns:IsHaveTrainingWaza(selectPokemonWarehouseId) == false then
      ShopSys:Talk(SHOP_WAZATRAINING__HIKETSU_POKEMON_NO_WAZA, nil)
      FlowSys:Next("HiketsuSelectPokemon")
      return
    end
    if shopIns:IsAllGrowupFinish(selectPokemonWarehouseId) == true then
      ShopSys:Talk(SHOP_WAZATRAINING__HIKETSU_POKEMON_MAX_WAZA, nil)
      FlowSys:Next("HiketsuSelectPokemon")
      return
    end
    ShopSys:SetShopTag("\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151", shopIns:GetShopWazaTypeName())
    ShopSys:Talk(SHOP_WAZATRAINING__SELECT_HIKETSU_WAZA, nil)
    FlowSys:Next("HiketsuSelectWaza")
  end
  function FlowSys.Proc.HiketsuSelectWaza()
    OpenWazaMenu("TYPE_MENU")
    if selectWazaIndex == nil then
      FlowSys:Next("HiketsuSelectPokemon")
      return
    end
    FlowSys:Next("HiketsuParametorMax")
  end
  function FlowSys.Proc.HiketsuParametorMax()
    local wazaIndex = shopIns:GetWazaIndexFromWareHouse(selectPokemonWarehouseId, selectWazaIndex)
    if (shopIns:IsPowerZero(wazaIndex) or shopIns:CheckWazaMaxStatus(1, wazaIndex)) and shopIns:CheckWazaMaxStatus(2, wazaIndex) and shopIns:CheckWazaMaxStatus(3, wazaIndex) then
      if shopIns:IsGradeMax(FUNC_COMMON:GetWazaIndexFromWarehouseId(selectPokemonWarehouseId, selectWazaIndex)) then
        ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
        ShopSys:Talk(SHOP_WAZATRAINING__HIKETSU_WAZA_PARAMATOR_MAX, nil)
        FlowSys:Next("HiketsuSelectWaza")
        return
      else
        ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
        ShopSys:Talk(SHOP_WAZATRAINING__HIKETSU_WAZA_ALL_MAX, nil)
        FlowSys:Next("HiketsuSelectWaza")
        return
      end
    end
    FlowSys:Next("UseItem")
  end
  function FlowSys.Proc.UseItem()
    local nextFlow
    local askMenu = MENU:CreateAskMenu()
    ShopSys:SetShopTag("\227\129\178\227\129\145\227\129\164\233\129\147\229\133\183\239\188\145", shopIns:GetTrainingItemName(1))
    ShopSys:SetShopTag("\227\129\178\227\129\145\227\129\164\233\129\147\229\133\183\239\188\146", shopIns:GetTrainingItemName(3))
    ShopSys:SetShopTag("\227\129\178\227\129\145\227\129\164\233\129\147\229\133\183\239\188\147", shopIns:GetTrainingItemName(2))
    askMenu:Setup(true, false, false)
    askMenu:AddItem(SHOP_WAZATRAINING__SELECT_ITEM_ATK, nil, {
      decideAction = function(self)
        nextFlow = "AtkItem"
        self:CloseAndClearFocus()
      end
    })
    askMenu:AddItem(SHOP_WAZATRAINING__SELECT_ITEM_PP, nil, {
      decideAction = function(self)
        nextFlow = "PpItem"
        self:CloseAndClearFocus()
      end
    })
    askMenu:AddItem(SHOP_WAZATRAINING__SELECT_ITEM_HIT, nil, {
      decideAction = function(self)
        nextFlow = "HitItem"
        self:CloseAndClearFocus()
      end
    })
    function askMenu:cancelAction()
      nextFlow = "HiketsuSelectWaza"
      self:CloseAndClearFocus()
    end
    if shopIns:IsHaveAtackItem() == false then
      askMenu:SetCurrentModifyItem(0)
      askMenu.curItem.grayed = true
    end
    if shopIns:IsHaveHitItem() == false then
      askMenu:SetCurrentModifyItem(2)
      askMenu.curItem.grayed = true
    end
    if shopIns:IsHavePpItem() == false then
      askMenu:SetCurrentModifyItem(1)
      askMenu.curItem.grayed = true
    end
    askMenu:Setup(true, true, false)
    WINDOW:DrawFace(20, 88, SymAct(ShopSys.ownerAct), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct(ShopSys.ownerAct), SHOP_WAZATRAINING__SELECT_ITEM)
    WINDOW:SelectSetLuaMenu(askMenu)
    WINDOW:SelectEndTalk(MENU_SELECT_MODE.ENABLE_CANCEL)
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.AtkItem()
    local wazaIndex = shopIns:GetWazaIndexFromWareHouse(selectPokemonWarehouseId, selectWazaIndex)
    if shopIns:IsPowerZero(wazaIndex) then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
      ShopSys:SetShopTag("\227\129\178\227\129\145\227\129\164\233\129\147\229\133\183\239\188\145", shopIns:GetTrainingItemName(1))
      ShopSys:Talk(SHOP_WAZATRAINING__TRAINING_ITEM_ATK_STOP, nil)
      FlowSys:Next("UseItem")
    elseif shopIns:CheckWazaMaxStatus(1, wazaIndex) then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
      ShopSys:Talk(SHOP_WAZATRAINING__TRAINING_ITEM_ATK, nil)
      FlowSys:Next("UseItem")
    else
      selectItem = 1
      FlowSys:Next("ItemTraining")
    end
  end
  function FlowSys.Proc.HitItem()
    local wazaIndex = shopIns:GetWazaIndexFromWareHouse(selectPokemonWarehouseId, selectWazaIndex)
    if shopIns:CheckWazaMaxStatus(3, wazaIndex) then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
      ShopSys:Talk(SHOP_WAZATRAINING__TRAINING_ITEM_HIT, nil)
      FlowSys:Next("UseItem")
    else
      selectItem = 3
      FlowSys:Next("ItemTraining")
    end
  end
  function FlowSys.Proc.PpItem()
    local wazaIndex = shopIns:GetWazaIndexFromWareHouse(selectPokemonWarehouseId, selectWazaIndex)
    if shopIns:CheckWazaMaxStatus(2, wazaIndex) then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
      ShopSys:Talk(SHOP_WAZATRAINING__TRAINING_ITEM_PP, nil)
      FlowSys:Next("UseItem")
    else
      selectItem = 2
      FlowSys:Next("ItemTraining")
    end
  end
  function FlowSys.Proc.ItemTraining()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
    ShopSys:SetShopTag("\228\191\174\232\161\140\233\129\147\229\133\183", shopIns:GetTrainingItemName(selectItem))
    ShopSys:TalkAskFlowNoClose(SHOP_WAZATRAINING__TRAINING_WAZA_DECIDE_ITEM, nil, nil, {
      next = "ItemTrainingCansel"
    }, {
      text = SHOP_WAZATRAINING__TRAINING_WAZA_DECIDE_ITEM_YES,
      next = "HiketsuTrainingStart"
    }, {
      text = SHOP_WAZATRAINING__TRAINING_WAZA_DECIDE_ITEM_NO,
      next = "ItemTrainingCansel"
    })
  end
  function FlowSys.Proc.ItemTrainingCansel()
    ShopSys:Talk(SHOP_WAZATRAINING__HIKETSU_TRAINING_CANCEL, nil)
    FlowSys:Next("HiketsuSelectWaza")
  end
  function FlowSys.Proc.HiketsuTrainingStart()
    local wazaIndex = shopIns:GetWazaIndexFromWareHouse(selectPokemonWarehouseId, selectWazaIndex)
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
    ShopSys:SetShopTag("\227\129\178\227\129\145\227\129\164\227\131\145\227\131\169\227\131\161\227\131\188\227\130\191", shopIns:GetTrainingParameterName(selectItem))
    ShopSys:SetShopTag("\228\191\174\232\161\140\233\129\147\229\133\183", shopIns:GetTrainingItemName(selectItem))
    EventPlay.eventWazaShopResultItemup()
    shopIns:ClearUpCheck()
    shopIns:ItemGrowup(selectItem, wazaIndex)
    if shopIns:CheckWazaMaxStatus(selectItem, wazaIndex) then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", shopIns:GetTrainingWazaName(selectPokemonWarehouseId, selectWazaIndex))
      ShopSys:SetShopTag("\227\129\178\227\129\145\227\129\164\227\131\145\227\131\169\227\131\161\227\131\188\227\130\191", shopIns:GetTrainingParameterName(selectItem))
      ShopSys:SetShopTag("\228\191\174\232\161\140\233\129\147\229\133\183", shopIns:GetTrainingItemName(selectItem))
      ShopSys:Talk(SHOP_WAZATRAINING__HIKETSU_TRAINING_WAZA_ITEM_MAX, nil)
    end
    SOUND:PlayMe(SymSnd("ME_MINIGAME_SOSO"))
    OpenWazaMenu("TYPE_RESULT")
    CommonSys:CloseBasicMenu()
    subEveDoubleJump(CH(shopIns:GetOwnerSymbol()))
    ShopSys:Talk(SHOP_WAZATRAINING__HIKETSU_TRAINING_WAZA_FINISHI, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.Help()
    ShopSys:SetShopTag("\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151", shopIns:GetShopWazaTypeName())
    ShopSys:Talk(SHOP_WAZATRAINING__HELP, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.ExitShop()
    ShopSys:Talk(SHOP_WAZATRAINING__EXIT, nil)
    FlowSys:Return()
  end
  function EventPlay.eventWazaShopRun()
    local SHOP_OWNER = CH(shopIns:GetOwnerSymbol())
    if shopIns:IsPeddlerMode() then
      local SHOP_COUNTER = SymPos(string.format("@SHOP_COUNTER%02d", spaceIndex))
      CAMERA:MoveFollow(SHOP_COUNTER, Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
      CAMERA:WaitMove()
    end
    TASK:Sleep(TimeSec(0.3))
    SHOP_OWNER:SetMotion(SymMot("BATTLE"), LOOP.ON)
    ShopSys:Talk(SHOP_WAZATRAINING__TRAINING_WAZA_DESIDE, nil)
    WINDOW:CloseMessage()
    SHOP_OWNER:SetMotion(SymMot("ATTACK"), LOOP.OFF)
    SHOP_OWNER:WaitPlayMotion()
    SHOP_OWNER:SetMotion(SymMot("WAIT02"), LOOP.ON)
    TASK:Sleep(TimeSec(0.2))
  end
  function EventPlay.eventWazaShopResultNormal(backupWazaNameId)
    SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
    subEveFlash()
    CAMERA:MoveToPlayer(Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    CAMERA:WaitMove()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", backupWazaNameId)
    ShopSys:SysMsg(SHOP_WAZATRAINING__TRAINING_WAZA_NOMAL, nil)
    WINDOW:CloseMessage()
  end
  function EventPlay.eventWazaShopResultSpecial(backupWazaNameId)
    SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
    subEveFlash()
    CAMERA:MoveToPlayer(Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    CAMERA:WaitMove()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", backupWazaNameId)
    ShopSys:SysMsg(SHOP_WAZATRAINING__TRAINING_WAZA_SPECIAL00, nil)
    WINDOW:CloseMessage()
    SOUND:PlaySe(SymSnd("SE_TR_DAIBAKUHA"))
    CAMERA:SetShake(Vector2(0.05, 0.05), TimeSec(1, TIME_TYPE.FRAME))
    TASK:Sleep(TimeSec(0.3))
    CAMERA:SetShake(Vector2(0, 0), TimeSec(0))
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", backupWazaNameId)
    ShopSys:SysMsg(SHOP_WAZATRAINING__TRAINING_WAZA_SPECIAL01, nil)
    WINDOW:CloseMessage()
  end
  function EventPlay.eventWazaShopResultItemup()
    local SHOP_OWNER = CH(shopIns:GetOwnerSymbol())
    if shopIns:IsPeddlerMode() then
      local SHOP_COUNTER = SymPos(string.format("@SHOP_COUNTER%02d", spaceIndex))
      CAMERA:MoveFollow(SHOP_COUNTER, Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
      CAMERA:WaitMove()
    end
    SHOP_OWNER:SetMotion(SymMot("BATTLE"), LOOP.ON)
    ShopSys:Talk(SHOP_WAZATRAINING__HIKETSU_TRAINING_WAZA_DESIDE, nil)
    WINDOW:CloseMessage()
    SHOP_OWNER:SetMotion(SymMot("ATTACK"), LOOP.OFF)
    SHOP_OWNER:WaitPlayMotion()
    SHOP_OWNER:SetMotion(SymMot("WAIT02"), LOOP.ON)
    TASK:Sleep(TimeSec(0.2))
    SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
    subEveFlash()
    CAMERA:MoveToPlayer(Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    CAMERA:WaitMove()
    SOUND:PlayMe(SymSnd("ME_RANKUP"), Volume(256))
    ShopSys:SysMsg(SHOP_WAZATRAINING__HIKETSU_TRAINING_WAZA_ITEM_UP, nil)
    SOUND:WaitMe()
    WINDOW:CloseMessage()
  end
  function EventPlay.eventWazaShopResultLvup(wazaIndex, burst)
    local PosShopStaff = CH("PLAYER"):GetPosition()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150", FUNC_COMMON:GetWazaNameFromWazaIndex(wazaIndex))
    SOUND:PlayMe(SymSnd("ME_WAZA"))
    CH("PLAYER"):SetManpu("MP_SPREE_LP")
    CH("PLAYER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
    CH("PLAYER"):WaitPlayMotion()
    CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    if burst == true then
      ShopSys:SysMsg(SHOP_WAZATRAINING__TRAINING_WAZA_LVUP_SPECIAL, nil)
    else
      ShopSys:SysMsg(SHOP_WAZATRAINING__TRAINING_WAZA_LVUP, nil)
    end
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    CH("PLAYER"):ResetManpu()
  end
  FlowSys:Call("MenuTopFirst")
  WINDOW:CloseMessage()
  FlowSys:Finish()
  ShopSys:Finish()
end

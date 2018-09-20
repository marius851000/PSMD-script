function MENU:CreateActionMenu(tgtObject, parentMenu)
  local actionMenu = MENU:CreatePageMenu()
  function actionMenu:AddActionItem(text, disableFilters, grayoutFilters, decideAction)
    local itemObj = {disableFilters = disableFilters, grayoutFilters = grayoutFilters}
    self:AddItem(text, itemObj, {decideAction = decideAction})
  end
  actionMenu.luaExt_tgtObject = tgtObject
  actionMenu.luaExt_parentMenu = parentMenu
  function actionMenu:itemPreOpenModifyAction()
    local filterApplySet = {
      {
        filter = self.curItem.obj.disableFilters,
        apply = function()
          self.curItem.disable = true
        end
      },
      {
        filter = self.curItem.obj.grayoutFilters,
        apply = function()
          self.curItem.grayed = true
        end
      }
    }
    for k, filterApply in pairs(filterApplySet) do
      if filterApply.filter ~= nil then
        if type(filterApply.filter) == "table" then
          for k, filterFunc in pairs(filterApply.filter) do
            if filterFunc(actionMenu.luaExt_parentMenu, self.luaExt_tgtObject) then
              filterApply.apply()
              break
            end
          end
        elseif filterApply.filter(actionMenu.luaExt_parentMenu, self.luaExt_tgtObject) then
          filterApply.apply()
        end
      end
    end
  end
  return actionMenu
end
function DisActFlt_multiSelect(menu, tgtObj)
  return menu:IsMultiSelect()
end
function FltGen_Item(itemPossibleFunc)
  return function(menu, item)
    return itemPossibleFunc(item) == false
  end
end
function MENU:CreateItemBagMenu()
  if menuOption == nil then
    menuOption = {}
  end
  local itemBagMenu = MENU:CreatePageGroupMenu()
  itemBagMenu.base = {}
  for k, v in pairs(class_info(itemBagMenu).methods) do
    itemBagMenu.base[k] = v
  end
  for k, v in pairs(class_info(itemBagMenu).attributes) do
    itemBagMenu.base[k] = v
  end
  itemBagMenu:SetLayoutRectAndLines(16, 40, 208, 8)
  itemBagMenu:ShowPageNum(true)
  function itemBagMenu:updateLineHelp(itemIns)
    if itemBagMenu.luaExt_GenItemLineHelpTextFunc then
      CommonSys:SetVisibleBasicMenu_LineHelp(true)
      CommonSys:UpdateBasicMenu_LineHelp(itemBagMenu.luaExt_GenItemLineHelpTextFunc(itemIns))
    else
      CommonSys:SetVisibleBasicMenu_LineHelp(false)
    end
  end
  local function createList(self)
    local id = 0
    self:ClearItems()
    if self.luaExt_itemEnumFunc then
      local flag = false
      for item in self.luaExt_itemEnumFunc() do
        local isFilter = false
        if self.luaExt_itemEnumFilterFunc and self.luaExt_itemEnumFilterFunc(item) then
          isFilter = true
        end
        if isFilter == false then
          self:AddItem("", item, nil)
          flag = true
        end
      end
      if flag then
        id = id + 1
      end
      if self.customTitleText then
        self.titleTbl[id] = self.customTitleText
      else
        self.titleTbl[id] = -293629216
      end
    end
    if SYSTEM:IsDungeon() and FUNC_COMMON:IsFootItemExist() then
      if id >= 1 then
        self.base.AddPageGroup(self)
      end
      if self.luaExt_footEnumFunc then
        for item in self.luaExt_footEnumFunc() do
          self:AddItem(id, "", item, nil)
        end
      end
      self:SetWindowSize(id, 0, 16)
      id = id + 1
      itemBagMenu.titleTbl[id] = 1902623495
    end
  end
  itemBagMenu.itemActMenu = nil
  itemBagMenu.titleTbl = {}
  itemBagMenu.luaExt_actionTbl = {}
  function itemBagMenu:SetTitle(text)
    self.customTitleText = text
    self:SetTitle_(text)
  end
  function itemBagMenu:SetTitle_(text)
    CommonSys:UpdateBasicMenu_Title(text)
    FUNC_COMMON:SetCaptionButtonHelp()
  end
  function itemBagMenu:SetPadHelp(padHelpMainText, padHelpSubText)
    self.luaExt_padHelpMainText = padHelpMainText
    self.luaExt_padHelpSubText = padHelpSubText
  end
  function itemBagMenu:SetItemEnumFunc(itemEnumFunc, filterFunc)
    self.luaExt_itemEnumFunc = itemEnumFunc
    self.luaExt_itemEnumFilterFunc = filterFunc
  end
  function itemBagMenu:SetFootEnumFunc(itemEnumFunc)
    self.luaExt_footEnumFunc = itemEnumFunc
  end
  function itemBagMenu:SetChestEnumFunc(itemEnumFunc)
    self.luaExt_chestEnumFunc = itemEnumFunc
  end
  function itemBagMenu:SetGenerateItemTextFunc(generateItemTextFunc)
    self.luaExt_GenItemTextFunc = generateItemTextFunc
  end
  function itemBagMenu:SetGenerateItemLineHelpTextFunc(generateItemLineHelpTextFunc)
    self.luaExt_GenItemLineHelpTextFunc = generateItemLineHelpTextFunc
  end
  function itemBagMenu:SetCheckSelectWarnColorItemFunc(checkSelectWarnColorItemFunc)
    self.luaExt_CheckSelectWarnColorItemFunc = checkSelectWarnColorItemFunc
  end
  function itemBagMenu:SetCheckMultiSelectOkItemFunc(checkMultiSelectOkItemFunc)
    self.luaExt_CheckMultiSelectOkItemFunc = checkMultiSelectOkItemFunc
  end
  function itemBagMenu:SetAction(text, disableFilters, grayoutFilters, optionTbl)
    table.insert(self.luaExt_actionTbl, {
      text = text,
      disableFilters = disableFilters,
      grayoutFilters = grayoutFilters,
      optionTbl = optionTbl
    })
  end
  function itemBagMenu:SetActions(actionsTbl)
    for i, action in ipairs(actionsTbl) do
      self:SetAction(action.text, action.disableFilters, action.grayoutFilters, action.optionTbl)
    end
  end
  function itemBagMenu:SetOption(tbl)
    if tbl.onePageLayout then
      self:ShowPageNum(false)
      itemBagMenu:SetLayoutRectAndLines(16, 40, 208, 9)
    end
    if tbl.sortButtonEnable then
      GROUND:SetBagAfterOpenSortFlag()
      function self:sortAction()
        SOUND:PlaySe(SymSnd("SE_SYS_SORT"))
        if self:IsMultiSelect() then
          self:ResetSelecting()
        end
        GROUND:SortAndReduceBagItem()
        createList(self)
        self:UpdateItemList()
        if FUNC_COMMON:GetBagItemCount() == 0 and not FUNC_COMMON:IsFootItemExist() then
          self:Close()
        end
        if self.curItem.obj then
          self:updateLineHelp(self.curItem.obj)
        end
        if self:GetPageGroupCount() ~= 0 then
          local id = self:GetCurrentPageGroupNum() + 1
          self:SetTitle_(self.titleTbl[id])
        end
        itemBagMenu:ChangeSelectEquip()
      end
    end
    self.base.SetOption(self, tbl)
  end
  function itemBagMenu:Open()
    CommonSys:SetVisibleBasicMenu(true)
    createList(self)
    self.base.Open(self)
  end
  function itemBagMenu:openedAction()
    if self.curItem.obj then
      self:updateLineHelp(self.curItem.obj)
    end
    CommonSys:UpdateBasicMenu_PadHelp(itemBagMenu.luaExt_padHelpMainText)
  end
  function itemBagMenu:closedAction()
    self.base.Close(self)
  end
  function itemBagMenu:SetVisible(flag)
    CommonSys:SetVisibleBasicMenu(flag)
    if self.itemActMenu then
      self.itemActMenu:SetVisible(flag)
    end
    self.base.SetVisible(self, flag)
  end
  function itemBagMenu:SetVisibleForExchange(flag)
    CommonSys:SetVisibleBasicMenu_LineHelp(flag)
    if self.itemActMenu then
      self.itemActMenu:SetVisible(flag)
    end
    self.base.SetVisible(self, flag)
  end
  function itemBagMenu:itemPreOpenModifyAction()
    if self.luaExt_GenItemTextFunc then
      self.curItem.text = self.luaExt_GenItemTextFunc(self.curItem.obj)
      if self.luaExt_CheckSelectWarnColorItemFunc and self.luaExt_CheckSelectWarnColorItemFunc(self, self.curItem.obj) then
        if type(self.curItem.text) == "number" then
          self.curItem.text = MENU:GetTextPoolText(self.curItem.text)
        end
        self.curItem.text = "[CS:Q]" .. self.curItem.text .. "[CR]"
      end
    else
      self.curItem.text = "\227\129\155\227\129\163\227\129\166\227\129\132\227\130\168\227\131\169\227\131\188"
    end
  end
  itemBagMenu.itemPreUpdateModifyAction = itemBagMenu.itemPreOpenModifyAction
  function itemBagMenu:itemMultiSelectModifyAction()
    if self.luaExt_CheckMultiSelectOkItemFunc then
      local selItem = self.curItem
      self:ClearMultiSelect(selItem.index)
      if self.luaExt_CheckMultiSelectOkItemFunc(self, selItem.obj) then
        self:AddMultiSelect(selItem.index)
      end
    end
  end
  function itemBagMenu:currentItemChange()
    if self.curItem.obj then
      self:updateLineHelp(self.curItem.obj)
    end
    if DUNGEON_MENU:IsValidSealEquipMenu() then
      DUNGEON_MENU:SetSealEquipMenuSelectItem(self.curItem.obj)
    end
    itemBagMenu:ChangeSelectEquip()
    FUNC_COMMON:SetCaptionButtonHelp()
  end
  function itemBagMenu:currentPageGroupChange()
    local id = self:GetCurrentPageGroupNum() + 1
    self:SetTitle_(self.titleTbl[id])
  end
  function itemBagMenu:touchButtonHelp()
    SYSTEM:DebugPrint("BagItem Call Test")
    MENU:ClearFocus(self)
    self:Close()
    FlowSys.Stat.itemBagTbl = {}
    FlowSys.Stat.itemBagTbl.selectItem = DungeonMenuSelectItems.SELECT_MENU_NON
    FlowSys.Stat.itemBagTbl.useItem = itemBagMenu.curItem.obj:GetBagIndex()
    FlowSys.Stat.itemBagTbl.bSelectPoke = false
    FlowSys.Stat.itemBagTbl.targetItem = DungeonMenuSelectItems.SELECT_MENU_NON
    FlowSys.Stat.itemBagTbl.pokemonId = DungeonMenuSelectItems.SELECT_MENU_NON
    FlowSys.Stat.itemBagTbl.itemIns = itemBagMenu.curItem.obj
  end
  function itemBagMenu:decideAction()
    local actionMenu = MENU:CreateActionMenu(self.curItem.obj, self)
    self.itemActMenu = actionMenu
    if self.actionMenuSetupAction then
      self.actionMenuSetupAction(self.itemActMenu)
    end
    actionMenu:SetLayoutRectAndLines(240, 40, 64, 0)
    local parentBagMenu = self
    for k, actionInfo in ipairs(self.luaExt_actionTbl) do
      do
        local closeFlag = false
        local function decideActionFunc(self)
          if parentBagMenu.decideSelectedItemsAction then
            local selectedItems = {}
            for item in parentBagMenu:EnumerateSelectedItems() do
              table.insert(selectedItems, item)
            end
            parentBagMenu.decideSelectedItemsAction(selectedItems)
          end
          if actionInfo.optionTbl.commandId and parentBagMenu.commandIdAction then
            closeFlag = parentBagMenu.commandIdAction(actionInfo.optionTbl.commandId) or closeFlag
          end
          if actionInfo.optionTbl.action then
            closeFlag = actionInfo.optionTbl.action(itemBagMenu) or closeFlag
          end
          if actionInfo.optionTbl.actMenuNoCloseFlg == nil then
            if actionInfo.optionTbl.bagCloseFlg or closeFlag then
              MENU:ClearFocus(self)
              self:Close()
              parentBagMenu:Close()
            elseif not actionInfo.optionTbl.notActionCloseFlg then
              MENU:SetFocus(parentBagMenu)
              self:Close()
            else
              MENU:SetFocus(self)
            end
          end
        end
        actionMenu:AddActionItem(actionInfo.text, actionInfo.disableFilters, actionInfo.grayoutFilters, decideActionFunc)
      end
    end
    function actionMenu:cancelAction()
      FUNC_COMMON:SetCaptionButtonHelp()
      MENU:SetFocus(parentBagMenu)
      self:Close()
    end
    function actionMenu:abortFocusAction()
      self:NotifyForceClose()
    end
    if self.luaExt_padHelpSubText then
      CommonSys:UpdateBasicMenu_PadHelp(self.luaExt_padHelpSubText)
    end
    actionMenu:Open()
    MENU:SetFocus(actionMenu)
    MENU:WaitClose(actionMenu)
    if self.luaExt_padHelpMainText then
      CommonSys:UpdateBasicMenu_PadHelp(self.luaExt_padHelpMainText)
    end
    self.itemActMenu = nil
  end
  if itemBagMenu.sortAction == nil then
    function itemBagMenu:sortAction()
    end
  end
  if itemBagMenu.luaExt_padHelpMainText == nil then
    if SYSTEM:IsGround() then
      itemBagMenu.luaExt_padHelpMainText = 83913937
    else
      itemBagMenu.luaExt_padHelpMainText = 1602929473
    end
  end
  if itemBagMenu.luaExt_padHelpSubText == nil then
    itemBagMenu.luaExt_padHelpSubText = -1804992760
  end
  return itemBagMenu
end
function CreatePokeItemWindow(itemIns, useFlag)
  local pokemonIndex = 0
  local pokeItemMenu = MENU:CreatePageMenu()
  pokeItemMenu.base = {}
  for k, v in pairs(class_info(pokeItemMenu).methods) do
    pokeItemMenu.base[k] = v
  end
  for k, v in pairs(class_info(pokeItemMenu).attributes) do
    pokeItemMenu.base[k] = v
  end
  pokeItemMenu:SetMela("mela/common/organization_pokemon.bml")
  local initInfo = function(info, posY, sizeH)
    info:SetPositionY(posY)
    info:SetSizeH(sizeH)
    info:SetTextOffset(16, (sizeH - 16) / 2)
    info:SetFontType(FontType.TYPE_16)
  end
  pokeItemMenu.partyWindow = MENU:CreatePartyMemberWindow()
  pokeItemMenu.partyWindow:SetLayoutPosition(128, 40)
  if not useFlag then
    pokeItemMenu.equipMenu = MENU:CreateMenuMela(ScreenType.B)
  end
  function pokeItemMenu:Open()
    local id = 0
    local caption = -57427781
    local kind = itemIns:GetKind()
    if useFlag then
      if kind == ITEM_KIND.KIND_SEED then
        caption = 1191978292
      elseif itemIns:IsDrink() then
        caption = 1942505587
      elseif kind == ITEM_KIND.KIND_WAZAMACHINE then
        caption = -1370133889
      elseif kind == ITEM_KIND.KIND_STUDS then
        caption = 1734768961
      else
        caption = 71496450
      end
    elseif kind == ITEM_KIND.KIND_SEED then
      caption = 880287579
    elseif itemIns:IsDrink() then
      caption = 761314207
    elseif kind == ITEM_KIND.KIND_ARROW then
      caption = -57427781
    elseif kind == ITEM_KIND.KIND_STONE then
      caption = 1722279450
    elseif kind == ITEM_KIND.KIND_ORB then
      caption = 957380085
    elseif kind == ITEM_KIND.KIND_EQUIP then
      caption = -380681730
    else
      caption = -1800227757
    end
    CommonSys:UpdateBasicMenu_Title(caption)
    CommonSys:UpdateBasicMenu_PadHelp(1964640690)
    self.partyWindow:SetMemberId(FUNC_COMMON:SearchDrawPartyNum(0))
    self.partyWindow:Open()
    if not useFlag then
      self.equipMenu:Open("mela/common/organization_pokemon_item.bml")
      self.equipMenu:SetMessageId("mess_01", 1028648109)
      self.equipMenu:SetMessageStr("mess_02", FUNC_COMMON:GetEquippedItemName(0))
    end
    for i = 1, FUNC_COMMON:GetDrawPartyMemberCount() do
      local bGrayed = false
      local partyNum = FUNC_COMMON:SearchDrawPartyNum(i - 1)
      if useFlag then
        bGrayed = not FUNC_COMMON:IsAlive(partyNum)
        bGrayed = bGrayed or not FUNC_COMMON:IsLearningWazaMachine(partyNum, itemIns:GetIndex())
        bGrayed = bGrayed or not FUNC_COMMON:IsUsingEvolutionItem(partyNum, itemIns:GetIndex())
        bGrayed = bGrayed or not FUNC_COMMON:IsUsingDevise(partyNum, itemIns:GetIndex())
        bGrayed = bGrayed or not FUNC_COMMON:IsUsableHelper(partyNum, itemIns:GetIndex())
        bGrayed = bGrayed or not FUNC_COMMON:IsUsableItem(partyNum)
        bGrayed = not SYSTEM:IsMultiPlayMode() or bGrayed or itemIns:IsWazaMachine() and not FUNC_COMMON:IsPlayer(partyNum)
      else
        if SYSTEM:IsMultiPlayMode() then
          bGrayed = not FUNC_COMMON:IsPlayer(partyNum)
        end
        bGrayed = bGrayed or not FUNC_COMMON:IsAlive(partyNum)
        bGrayed = bGrayed or FUNC_COMMON:IsBousou(partyNum)
      end
      local colorText = "[CS:F]"
      if FUNC_COMMON:IsPlayer(partyNum) then
        colorText = "[CS:Y]"
        self.playerIndex = partyNum
      end
      if bGrayed then
        colorText = ""
      end
      self:AddItem(colorText .. FUNC_COMMON:GetCharaName(partyNum), partyNum, nil)
      if bGrayed then
        self:SetCurrentModifyItem(i - 1)
        self.curItem.grayed = true
      end
    end
    self.base.Open(self)
  end
  function pokeItemMenu:Close()
    self.partyWindow:Close()
    if self.equipMenu ~= nil then
      self.equipMenu:Close()
    end
    self.base.Close(self)
  end
  function pokeItemMenu:cancelAction()
  end
  function pokeItemMenu:decideAction()
  end
  function pokeItemMenu:currentItemChange()
    if self.equipMenu ~= nil then
      self.equipMenu:SetMessageId("mess_01", 1028648109)
      self.equipMenu:SetMessageStr("mess_02", FUNC_COMMON:GetEquippedItemName(self.curItem.obj))
    end
    self.partyWindow:SetMemberId(self.curItem.obj)
  end
  return pokeItemMenu
end
function SetDungeonActions(itemBagMenu)
  local IsMystery = function(itemIns)
    return (not DUNGEON_MENU:HasMystery(DungeonMystery.INDEX_NO_USE_SEED) or not itemIns:IsEat()) and (not DUNGEON_MENU:HasMystery(DungeonMystery.INDEX_NO_USE_ORB) or itemIns:GetKind() ~= ITEM_KIND.KIND_ORB) and (not DUNGEON_MENU:HasMystery(DungeonMystery.INDEX_NO_USE_EQUIPMENT) or itemIns:GetKind() ~= ITEM_KIND.KIND_EQUIP)
  end
  itemBagMenu:SetAction(-630134922, {
    FltGen_Item(function(self)
      return self:IsPickup() and self:IsShopGoods()
    end)
  }, {
    FltGen_Item(function(self)
      return self.IsBagFull
    end)
  }, {
    sortKey = 10,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_GET,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1410101710, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsUseEnemy()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_ORB_USE,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1410101710, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsUseEnemy()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_ORB_USE,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-805702876, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsStuck() and self:IsEnableStuds()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_STUCK,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-805702876, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsStuck() and self:IsEnableStuds()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_STUCK,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-453757169, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsUseParty()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsMenuUseParty() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_OTHER_USE,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-453757169, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsUseParty()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsMenuUseParty() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_OTHER_USE,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(27623258, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsLearn()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsMenuUseParty() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_OTHER_USE,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(27623258, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsLearn()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsMenuUseParty() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_OTHER_USE,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1728372489, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsEat()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsMenuUseParty() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_EAT,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1728372489, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsEat()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsMenuUseParty() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_EAT,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-573829969, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsDrink()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsMenuUseParty() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_DRINK,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-573829969, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsDrink()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsMenuUseParty() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_DRINK,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-2082936170, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsShoot()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_SHOT,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-2082936170, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsShoot()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_SHOT,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(550511612, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsStone()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_STONE_THROW,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(550511612, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsStone()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_STONE_THROW,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-786114513, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsGift()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_GIFT,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-786114513, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsGift()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_GIFT,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(1621727948, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsSwing()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_SWING,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(1621727948, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsSwing()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_SWING,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-453757169, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsUseOther()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_TENT,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-453757169, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsUseOther()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_TENT,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1068156457, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsSummonCall()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_SUMMON,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1068156457, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsSummonCall()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_SUMMON,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1037030560, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsSummonReturn()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_SUMMON_RET,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1037030560, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsSummonReturn()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable() and IsMystery(self)
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_SUMMON_RET,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-10445995, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsStuckFromEquip() and self:IsEnableStudsFromEquip()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 30,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_STUCK_FROM_EQUIP,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-10445995, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsStuckFromEquip() and self:IsEnableStudsFromEquip()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 30,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_STUCK_FROM_EQUIP,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-540481653, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsStuckFromEquip() and self:IsEnableRemoveFromEquip()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 30,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_REMOVE_FROM_EQUIP,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-540481653, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsStuckFromEquip() and self:IsEnableRemoveFromEquip()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and self:IsUsable()
    end)
  }, {
    sortKey = 30,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_REMOVE_FROM_EQUIP,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(427725527, {
    FltGen_Item(function(self)
      return self:IsStep()
    end)
  }, nil, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_STEP,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-630134922, {
    FltGen_Item(function(self)
      return self:IsTrapPickup()
    end)
  }, nil, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_STEP,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(1816616435, {
    FltGen_Item(function(self)
      return self:IsMove()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_MOVE,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1784918740, {
    FltGen_Item(function(self)
      return self:IsQuest()
    end)
  }, nil, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_QUEST,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(1065099162, {
    FltGen_Item(function(self)
      return self:IsSave()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsUsable()
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_SAVE,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-511978769, {
    FltGen_Item(function(self)
      return self:IsEquip()
    end)
  }, nil, {
    sortKey = 30,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_EQUIP,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-630529344, {
    FltGen_Item(function(self)
      return self:IsReturn()
    end)
  }, {
    FltGen_Item(function(self)
      return not self:IsEquipPokemonBousou()
    end)
  }, {
    sortKey = 30,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_RETURN,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(2139108078, {
    FltGen_Item(function(self)
      return self:IsEquipExchange()
    end)
  }, {
    FltGen_Item(function(self)
      return not self:IsEquipPokemonBousou()
    end)
  }, {
    sortKey = 30,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_EQUIP_EXCHANGE,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1799716150, {
    FltGen_Item(function(self)
      return self:IsPut() and self:IsEnablePut()
    end)
  }, nil, {
    sortKey = 40,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_PUT,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(1036839834, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsThrow()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and IsMystery(self) and self:IsEnableThrow()
    end)
  }, {
    sortKey = 60,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_THROW,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(1036839834, {
    FltGen_Item(function(self)
      return self:IsPlaced() and self:IsThrow()
    end)
  }, {
    FltGen_Item(function(self)
      return DUNGEON_MENU:IsUseItem() and IsMystery(self) and self:IsEnableThrow()
    end)
  }, {
    sortKey = 60,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_THROW,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-630134922, {
    FltGen_Item(function(self)
      return self:IsPickup() and not self:IsShopGoods()
    end)
  }, {
    FltGen_Item(function(self)
      return self.IsBagFull
    end)
  }, {
    sortKey = 10,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_GET,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(499442888, {
    FltGen_Item(function(self)
      return self:IsExchange()
    end)
  }, nil, {
    sortKey = 50,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_FOOT_EXCHANGE,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(1110943739, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsSet()
    end)
  }, {
    FltGen_Item(function(self)
      return not self:IsShopGoods()
    end)
  }, {
    sortKey = 70,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_SET,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1683101407, {
    FltGen_Item(function(self)
      return not self:IsPlaced() and self:IsUnSet()
    end)
  }, nil, {
    sortKey = 70,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_UNSET,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-253472340, nil, nil, {
    sortKey = 80,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_NON,
      flag = false
    },
    bagCloseFlg = false,
    notActionCloseFlg = true
  })
end
function SetGroundActions(itemBagMenu)
  itemBagMenu:SetAction(27623258, {
    FltGen_Item(function(self)
      return not itemBagMenu:IsMultiSelect() and self:IsWazaMachine() and GROUND:IsWarehouseStatingPost()
    end)
  }, {
    FltGen_Item(function(self)
      return self:IsWazaMachine() and GROUND:IsWarehouseAllSearchWazamashine(self:GetIndex())
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_ORB_USE,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-971051164, {
    FltGen_Item(function(self)
      return not itemBagMenu:IsMultiSelect() and self:IsEquip() and not self:IsWazaMachine()
    end)
  }, {
    FltGen_Item(function(self)
      return false
    end)
  }, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_EQUIP,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(1517668404, {
    FltGen_Item(function(self)
      return not itemBagMenu:IsMultiSelect() and self:IsReturn()
    end)
  }, nil, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_RETURN,
      flag = true
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(-1119183738, {
    FltGen_Item(function(self)
      return true
    end)
  }, nil, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_ITEM_PUT,
      flag = false
    },
    bagCloseFlg = false
  })
  itemBagMenu:SetAction(1368386615, nil, nil, {
    sortKey = 20,
    commandId = {
      id = DungeonMenuSelectItems.SELECT_MENU_NON,
      flag = false
    },
    bagCloseFlg = false
  })
end

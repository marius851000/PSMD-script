OverFlow = {}
OverFlow.isMessage = true
OverFlow.isFriendRewardFlow = false
OverFlow.bufIngotNum = 0
function OverFlow:CreateOrderOverflowMenu()
  local itemBagMenu = MENU:CreatePageGroupMenu()
  itemBagMenu:SetLayoutRectAndLines(16, 40, 208, 8)
  itemBagMenu:ShowPageNum(true)
  itemBagMenu.selectItem = nil
  itemBagMenu.titleTbl = {}
  CommonSys:OpenBasicMenu(1430005139, -1519395408, "")
  function itemBagMenu:createList(self, showBag, showOver)
    if showBag == true and showOver == true then
      CommonSys:UpdateBasicMenu_PadHelp(-1519395408)
    else
      CommonSys:UpdateBasicMenu_PadHelp(765028974)
    end
    self:ClearItems()
    local group = 0
    local count = 0
    if showBag then
      for item in FUNC_COMMON:EnumlateBagItems() do
        self:AddItem(item:GetItemText_forGroundBag(), {
          obj = item,
          bag = 0,
          id = count
        }, nil)
        count = count + 1
      end
      group = group + 1
      itemBagMenu.titleTbl[group] = 1430005139
    end
    if showOver and 0 < FUNC_COMMON:GetOverflowItemCount() then
      if group > 0 then
        self:AddPageGroup()
      end
      count = 0
      for item in FUNC_COMMON:EnumlateOverflowItems() do
        self:AddItem(group, item:GetItemText_forGroundBag(), {
          obj = item,
          bag = 1,
          id = count
        }, nil)
        count = count + 1
      end
      group = group + 1
      itemBagMenu.titleTbl[group] = 291141861
    end
  end
  function itemBagMenu:ResetItemBag()
    if itemBagMenu.selectItem == nil then
      function itemBagMenu:decideAction()
        local parent = itemBagMenu
        local menu = MENU:CreatePageMenu()
        local selectTbl, infoTbl, endTbl = {}, {}, {}
        NestMenu_SetupDefaultAction(menu, parent)
        menu:SetLayoutRectAndLines(240, parent:GetTop(), 64, 0)
        menu:AddItem(-2111786501, nil, selectTbl)
        menu:SetCurrentModifyItem(0)
        menu:AddItem(-419596282, nil, infoTbl)
        menu:SetCurrentModifyItem(1)
        menu:AddItem(1869288129, nil, endTbl)
        menu:SetCurrentModifyItem(2)
        function selectTbl:decideAction()
          if parent.curItem.obj then
            itemBagMenu.selectItem = {
              bag = parent.curItem.obj.bag,
              id = parent.curItem.obj.id
            }
          end
          self:Close()
          if itemBagMenu.selectItem.bag == 0 then
            itemBagMenu:createList(itemBagMenu, false, true)
          else
            itemBagMenu:createList(itemBagMenu, true, false)
          end
          itemBagMenu.currentItemChange(self)
          itemBagMenu:UpdateItemList()
        end
        function selectTbl:cancelAction()
          itemBagMenu.selectItem = nil
          self:Close()
        end
        function infoTbl:decideAction()
          self:SetVisible(false)
          itemBagMenu:SetVisible(false)
          local textId = FUNC_COMMON:GetItemExplainTextId(parent.curItem.obj.obj:GetIndex())
          local expreinMenu = CommonSys:OpenBasicExplainMenu(textId, nil)
          MENU:SetFocus(expreinMenu)
          MENU:WaitClose(expreinMenu)
          itemBagMenu:SetVisible(true)
          itemBagMenu.selectItem = nil
          self:Close()
        end
        function infoTbl:cancelAction()
          itemBagMenu.selectItem = nil
          self:Close()
        end
        function endTbl:decideAction()
          itemBagMenu.selectItem = nil
          self:Close()
          parent:Close()
        end
        function endTbl:cancelAction()
          itemBagMenu.selectItem = nil
          self:Close()
        end
        NestMenu_OpenAndCloseWait(menu)
        itemBagMenu:ResetItemBag()
      end
      function itemBagMenu:cancelAction()
        self:Close()
      end
      local group = self:GetCurrentPageGroupNum() + 1
      self:SetTitle(self.titleTbl[group])
    else
      function itemBagMenu:decideAction()
        if self.curItem.obj and (itemBagMenu.selectItem.bag ~= self.curItem.obj.bag or itemBagMenu.selectItem.id ~= self.curItem.obj.id) then
          FUNC_COMMON:OverflowReplaceItem(itemBagMenu.selectItem.bag, itemBagMenu.selectItem.id, self.curItem.obj.bag, self.curItem.obj.id)
        end
        self:SetVisible(false)
        itemBagMenu:createList(itemBagMenu, true, true)
        itemBagMenu:UpdateItemList()
        itemBagMenu.selectItem = nil
        itemBagMenu:ResetItemBag()
        TASK:Sleep(TimeSec(0.2))
        self:SetVisible(true)
      end
      function itemBagMenu:cancelAction()
        itemBagMenu.selectItem = nil
        itemBagMenu:createList(itemBagMenu, true, true)
        itemBagMenu:UpdateItemList()
        itemBagMenu:ResetItemBag()
      end
      if itemBagMenu.selectItem.id == 0 then
        CommonSys:UpdateBasicMenu_Title(283467732)
      else
        CommonSys:UpdateBasicMenu_Title(786713428)
      end
    end
    itemBagMenu.currentItemChange(self)
  end
  function itemBagMenu:cancelAction()
    self:Close()
  end
  function itemBagMenu:openedAction()
    if self.curItem.obj then
      CommonSys:UpdateBasicMenu_LineHelp(self.curItem.obj.obj:GetItemOneLineExplainText())
    end
  end
  function itemBagMenu:currentItemChange()
    if self.curItem.obj then
      CommonSys:UpdateBasicMenu_LineHelp(self.curItem.obj.obj:GetItemOneLineExplainText())
    end
  end
  function itemBagMenu:SetTitle(text)
    CommonSys:UpdateBasicMenu_Title(text)
  end
  function itemBagMenu:currentPageGroupChange()
    local group = self:GetCurrentPageGroupNum() + 1
    self:SetTitle(self.titleTbl[group])
  end
  return itemBagMenu
end
function OverFlow_SetFriendRewardFlow(bEnable)
  OverFlow.isFriendRewardFlow = bEnable
end
function OverFlow_AddOverflowCheckItem(itemId, itemNum, isMessage)
  return OverFlow:AddOverflowCheckItem(itemId, itemNum, isMessage, false, false)
end
function OverFlow_AddOverflowCheckItem_toBox(itemId, itemNum, isMessage)
  return OverFlow:AddOverflowCheckItem(itemId, itemNum, isMessage, false, true)
end
function OverFlow_AddOverflowCheckItemForQuestReward(itemId, itemNum, isMessage)
  return OverFlow:AddOverflowCheckItem(itemId, itemNum, isMessage, true, false)
end
function OverFlow_AddOverflowCheckItemForQuestReward_toBox(itemId, itemNum, isMessage)
  return OverFlow:AddOverflowCheckItem(itemId, itemNum, isMessage, true, true)
end
function OverFlow:AddOverflowCheckItem(itemId, itemNum, isMessage, isQuestReward, isToBox)
  local ret
  OverFlow.isMessage = isMessage
  OverFlow.itemId = itemId
  if FUNC_COMMON:CheckIsPoke(itemId) then
    ret = OverFlow:OverflowGoldCheck(itemNum)
  elseif FUNC_COMMON:CheckIsIngot(itemId) then
    ret = OverFlow:OverflowIngotCheck(itemNum)
  elseif FUNC_COMMON:CheckIsMaterial(itemId) then
    ret = OverFlow:OverflowMaterialsCheck(itemId, itemNum)
  else
    ret = OverFlow:OverflowItemsCheck(itemId, itemNum, isQuestReward, isToBox)
  end
  return ret
end
function OverFlow:AddOverflowCheckGold(num, isMessage)
  return OverFlow:OverflowGoldCheck(num)
end
function OverFlow:AddOverflowCheckIngot(num, isMessage)
  return OverFlow:OverflowIngotCheck(num)
end
function OverFlow:AddOverflowCheckChest(itemId, content, itemNum, isMessage)
  local message, ret
  if FUNC_COMMON:GetOverflowChestToBag(itemId, content, itemNum) then
    message = -330435264
    ret = 0
  elseif FUNC_COMMON:GetOverflowChestToBag(itemId, content, itemNum) then
    message = 1489105969
    ret = 1
  elseif FUNC_COMMON:GetOverflowChestToBag(itemId, content, itemNum) then
    message = -618305653
    ret = 2
  else
    message = 183625786
    ret = 3
  end
  if isMessage then
    MENU:SetTag_ItemIndex(0, itemId)
    MENU:SetTag_Value(0, 1)
    MENU:SetTag_String(6, MENU:ReplaceTagText("[item_b:0]"))
    MENU:SetTag_String(7, MENU:ReplaceTagText("[value_b:0]"))
    WINDOW:SysMsg(message)
    WINDOW:CloseMessage()
  end
  return ret
end
function OverFlow:AddOverflowCheckPoint(point)
  OverFlow:OverflowPointCheck(point)
end
function OverFlow:CheckOverflowItems()
  local bag = OverFlow:CreateOrderOverflowMenu()
  bag:createList(bag, true, true)
  bag:ResetItemBag()
  BasicMenu_OpenAndCloseWait(bag)
  CommonSys:CloseBasicMenu()
end
function OverFlow:OverflowPointCheck(num)
  FUNC_COMMON:SetParadisePoint(num)
  MENU:SetTag_Value(0, num)
  MENU:SetTag_String(8, MENU:ReplaceTagText("[value_b:0]"))
  WINDOW:SysMsg(-983431362)
  WINDOW:CloseMessage()
end
function OverFlow:OverflowIngotCheck(num)
  local bKirakira = GROUND:IsOverflowKirakiraMode()
  local max = FUNC_COMMON:GetGoldIngotMax()
  local now = FUNC_COMMON:GetGoldIngot()
  local ret
  FUNC_COMMON:SetGoldIngot(now + num)
  local message
  if max < now + num then
    if bKirakira then
      message = -306878264
    else
      message = -381565401
    end
    ret = 2
  else
    if bKirakira then
      message = 1955610470
    else
      message = 1199686641
    end
    ret = 0
  end
  if OverFlow.isMessage then
    GROUND:SetTagItemCount(0, OverFlow.itemId, num)
    MENU:SetTag_String(5, MENU:ReplaceTagText("[item_b:0]"))
    MENU:SetTag_String(9, MENU:ReplaceTagText("[item_b:0]"))
    WINDOW:SysMsg(message)
    WINDOW:CloseMessage()
  end
  return ret
end
function OverFlow:OverflowGoldCheck(num)
  local bKirakira = GROUND:IsOverflowKirakiraMode()
  local max = GROUND:GetPlayerMoneyLimit()
  local now = GROUND:GetPlayerMoney()
  local drawNum = num
  local ret, message
  GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() + num)
  if num < 0 then
    drawNum = -num
    message = 1533207345
    ret = 0
  elseif max < now + num then
    num = num - (max - now)
    local bank = GROUND:GetBankMoney()
    local bankMax = GROUND:GetBankMoneyLimit()
    GROUND:SetBankMoney(GROUND:GetBankMoney() + num)
    if bankMax < bank + now then
      if bKirakira then
        message = -1505956933
      else
        message = -721050680
      end
      ret = 2
    else
      if bKirakira then
        message = 1813156686
      else
        message = 1731477724
      end
      ret = 1
    end
  else
    if bKirakira then
      message = 732557177
    else
      message = 1953536031
    end
    ret = 0
  end
  if OverFlow.isMessage then
    MENU:SetTag_Money(0, drawNum)
    ShopSys:SetShopTag("\229\160\177\233\133\172\233\135\145\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
    WINDOW:SysMsg(message)
    WINDOW:CloseMessage()
  end
  return ret
end
function OverFlow:OverflowMaterialsCheck(itemId, itemNum)
  local ret, message
  local result = FUNC_COMMON:GetOverflowMaterials(itemId, itemNum)
  if result then
    ret = 1
    message = -504840311
  else
    ret = 2
    message = 1922640543
  end
  if OverFlow.isMessage then
    MENU:SetTag_ItemIndex(0, itemId)
    MENU:SetTag_Value(0, itemNum)
    MENU:SetTag_String(6, MENU:ReplaceTagText("[item_b:0]"))
    MENU:SetTag_String(7, MENU:ReplaceTagText("[value_b:0]"))
    WINDOW:SysMsg(message)
    WINDOW:CloseMessage()
  end
  return ret
end
function OverFlow:OverflowItemsCheck(itemId, itemNum, isQuestReward, isToBox)
  local bKirakira = GROUND:IsOverflowKirakiraMode()
  local ret, message
  local num = itemNum
  if isToBox == false then
    num = FUNC_COMMON:GetOverflowItemsToBag(itemId, num)
  end
  if num > 0 then
    num = FUNC_COMMON:GetOverflowItemsToBox(itemId, num)
    if num > 0 then
      if FUNC_COMMON:AddOverflowItems(itemId, num) == true then
        if MENU:CheckGroupItem(itemId) == true then
          if bKirakira then
            message = -2042779057
          else
            message = 1635528650
          end
        elseif bKirakira then
          message = -1732662174
        else
          message = -618305653
        end
        ret = 2
      else
        if bKirakira then
          message = -283425183
        else
          message = 183625786
        end
        ret = 3
      end
    else
      if MENU:CheckGroupItem(itemId) == true then
        if bKirakira then
          message = 47489713
        else
          message = -561932133
        end
      elseif bKirakira then
        message = 1199756387
      else
        message = 1489105969
      end
      ret = 1
    end
  else
    if MENU:CheckGroupItem(itemId) == true then
      if bKirakira then
        message = 405437983
      elseif isQuestReward then
        message = 156501841
      else
        message = 1230107358
      end
    elseif bKirakira then
      message = 362624956
    elseif isQuestReward then
      message = 56242408
    else
      message = -330435264
    end
    ret = 0
  end
  if OverFlow.isMessage then
    if MENU:CheckGroupItem(itemId) == true then
      MENU:SetTag_ItemIndexAndCount(0, itemId, itemNum)
      MENU:SetTag_String(6, MENU:ReplaceTagText("[item_b:0]"))
    else
      MENU:SetTag_ItemIndexNoCount(0, itemId)
      MENU:SetTag_Value(0, itemNum)
      MENU:SetTag_String(6, MENU:ReplaceTagText("[item_b:0]"))
      MENU:SetTag_String(7, MENU:ReplaceTagText("[value_b:0]"))
    end
    WINDOW:SysMsg(message)
    WINDOW:CloseMessage()
    if ret == 0 and isQuestReward then
      WINDOW:CloseMessage()
      if OverFlow.isFriendRewardFlow then
        SYSTEM:ExecuteTutorialHint(SymHint("QUEST_TUTORIAL08"), true)
      end
    end
  end
  return ret
end
function OverFlow:OverflowAskMenu()
  local ret = false
  WINDOW:SysMsg(-195996718)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-744853984, 1)
  WINDOW:SelectChain(-1593189199, 2)
  WINDOW:DefaultCursor(2)
  local nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
  WINDOW:CloseMessage()
  if nResult == 1 then
    ret = true
  end
  return ret
end
function OverFlow_OpenOrderOverflowMenu(isMessage)
  return OverFlow:OpenOrderOverflowMenu(isMessage)
end
function OverFlow:OpenOrderOverflowMenu(isMessage)
  if FUNC_COMMON:GetOverflowItemCount() > 0 then
    local loop = true
    while loop do
      OverFlow:CheckOverflowItems()
      if OverFlow:OverflowAskMenu() then
        loop = false
      end
    end
    WINDOW:SysMsg(-2027983092)
  end
  FUNC_COMMON:ClearOverflowItems()
  WINDOW:CloseMessage()
end
function OverFlow:ArStartItem()
  OverFlow:ArClearItem()
end
function OverFlow:ArStartIngot()
  OverFlow.bufIngotNum = FUNC_COMMON:GetGoldIngot()
  FUNC_COMMON:SetGoldIngot(0)
end
function OverFlow:ArClearItem()
  FUNC_COMMON:ClearBagItem()
  GROUND:SetPlayerMoney(0)
end
function OverFlow:ArAddOverflowCheckItem()
  local item_ingot = 0
  local item_ingot_darw = 0
  local item_money = 0
  local item_flag = false
  local item_num = 0
  local item_move_over = false
  local function MoveItem()
    item_ingot = FUNC_COMMON:GetGoldIngot()
    for i = 0, FUNC_COMMON:GetBagItemCount() - 1 do
      local bagItem = FUNC_COMMON:GetBagItem(i)
      local item = bagItem:GetIndex()
      local num = bagItem:GetCount()
      if FUNC_COMMON:CheckIsPoke(item) then
        GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() + num)
      elseif FUNC_COMMON:CheckIsIngot(item) then
        item_ingot = item_ingot + num
        item_ingot_darw = item_ingot_darw + num
      elseif FUNC_COMMON:CheckIsMaterial(item) then
      else
        item_flag = true
        item_num = FUNC_COMMON:GetOverflowItemsToBox(item, num)
        if item_num > 0 then
          item_move_over = true
          local type = 1
          local item_price = FUNC_COMMON:GetItemPrice(item, type)
          item_money = item_money + item_price * item_num
        else
        end
      end
    end
  end
  local MoveBankIngot = function(ingot)
    local wk_ret = true
    local now = ingot
    local bank = FUNC_COMMON:GetGoldIngot()
    local bankMax = FUNC_COMMON:GetGoldIngotMax()
    FUNC_COMMON:SetGoldIngot(bank + now)
    if bankMax < bank + now then
      wk_ret = false
    else
      wk_ret = true
    end
    return wk_ret
  end
  local MoveBankMoney = function(money)
    local wk_ret = true
    local now = money
    local bank = GROUND:GetBankMoney()
    local bankMax = GROUND:GetBankMoneyLimit()
    GROUND:SetBankMoney(bank + now)
    if bankMax < bank + now then
      wk_ret = false
    else
      wk_ret = true
    end
    return wk_ret
  end
  MoveItem()
  local wk_money = GROUND:GetPlayerMoney()
  if wk_money ~= 0 then
    if MoveBankMoney(wk_money) == true then
      MENU:SetTag_Money(0, wk_money)
      ShopSys:SetShopTag("\229\160\177\233\133\172\233\135\145\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
      WINDOW:SysMsg(858550252)
    else
      WINDOW:SysMsg(1022259869)
    end
  end
  FUNC_COMMON:SetGoldIngot(OverFlow.bufIngotNum)
  if item_ingot ~= 0 then
    if MoveBankIngot(item_ingot) == true then
      MENU:SetTag_Value(0, item_ingot)
      ShopSys:SetShopTag("\233\129\184\230\138\158\233\135\145\229\161\138\230\149\176", MENU:ReplaceTagText("[value_b:0]"))
      WINDOW:SysMsg(-1999457141)
    else
      WINDOW:SysMsg(1360310098)
    end
  end
  if item_flag == true then
    if item_move_over == false then
      WINDOW:SysMsg(2087132083)
    else
      WINDOW:SysMsg(520808106)
      if MoveBankMoney(item_money) == true then
        MENU:SetTag_Money(0, item_money)
        ShopSys:SetShopTag("\229\160\177\233\133\172\233\135\145\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
        WINDOW:SysMsg(-464729063)
      else
        WINDOW:SysMsg(-1456663015)
      end
    end
  end
  WINDOW:CloseMessage()
end
function OverFlow_AddAcceptConfirmFlow(actorID)
  OverFlow:AddAcceptConfirmFlowCore(actorID, false, false, nill, nill)
end
function OverFlow_AddConfirmFlow(actorID)
  OverFlow:AddAcceptConfirmFlowCore(actorID, true, true, nill, nill)
end
function OverFlow:AddAcceptConfirmFlowCore(actorID, bSkipAccept, bSkipResultMessage, decideAct, cancelAct)
  local pokemonID = SYSTEM:ConvertPokemonIndex(actorID)
  local byeWarehouseID, byePokemonID
  local SetTagPokemonName = function(name)
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", "[CS:Y]" .. name .. "[CR]")
  end
  FlowSys:Start()
  function FlowSys.Proc.AcceptConfirm()
    SetTagPokemonName(GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID))
    WINDOW:SysMsg(-794864105)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-1404567852, 0)
    WINDOW:SelectChain(-2128958513, 1)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL_NO_CLOSE)
    if ret == 0 then
      FlowSys:Next("CheckWarehouse")
    end
    if ret == 1 then
      FlowSys:Next("RefuseConfirm")
    end
  end
  function FlowSys.Proc.AcceptLoop()
    WINDOW:SysMsg(-794864105)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-1404567852, 0)
    WINDOW:SelectChain(-2128958513, 1)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL_NO_CLOSE)
    if ret == 0 then
      FlowSys:Next("CheckWarehouse")
    end
    if ret == 1 then
      FlowSys:Next("RefuseConfirm")
    end
  end
  function FlowSys.Proc.RefuseConfirm()
    SetTagPokemonName(GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID))
    WINDOW:SysMsg(-649311397)
    WINDOW:SelectStart()
    WINDOW:SelectChain(1304877192, 1)
    WINDOW:SelectChain(1522540307, 0)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL_NO_CLOSE)
    if ret == 1 then
      FlowSys:Next("CancelExit")
    end
    if ret == 0 then
      FlowSys:Next("AcceptLoop")
    end
  end
  function FlowSys.Proc.CheckWarehouse()
    if GROUND:IsPokemonWarehouseIsSpace() == true then
      FlowSys:Next("JoinAnnounce")
    else
      FlowSys:Next("ReplaceConfirm")
    end
  end
  function FlowSys.Proc.ReplaceConfirm()
    MENU:SetTag_MonsterString(1, GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID))
    WINDOW:SysMsg(-801838057)
    WINDOW:SelectStart()
    WINDOW:SelectChain(1536757527, 0)
    WINDOW:SelectChain(1090987390, 1)
    WINDOW:DefaultCursor(1)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL_NO_CLOSE)
    if ret == 0 then
      FlowSys:Next("PokemonSelect")
    end
    if ret == 1 then
      FlowSys:Next("AnnounceGiveUp")
    end
  end
  function FlowSys.Proc.PokemonSelect()
    WINDOW:CloseMessage()
    DispLeaderPokemonSelectMenu({
      flagNewChange = "NEW",
      flagSort = true,
      typeParty = "STORY_PART",
      typeDrawGroup = "REMOVE",
      flagIndexOnly = true,
      decideAct = function(index)
        byePokemonID = index
        byeWarehouseID = ShopSys.shopping_selectPokemonWarehouseId
        FlowSys:Next("ByeConfirm")
      end,
      cancelAct = function()
        FlowSys:Next("GiveUpConfirm")
      end
    })
  end
  function FlowSys.Proc.GiveUpConfirm()
    SetTagPokemonName(GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID))
    WINDOW:SysMsg(2006179871)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-1983767546, 1)
    WINDOW:SelectChain(1680810059, 0)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL_NO_CLOSE)
    if ret == 1 then
      FlowSys:Next("AnnounceGiveUp")
    end
    if ret == 0 then
      FlowSys:Next("ReplaceConfirm")
    end
  end
  function FlowSys.Proc.AnnounceGiveUp()
    SetTagPokemonName(GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID))
    WINDOW:SysMsg(847878428)
    FlowSys:Next("CancelExit")
  end
  function FlowSys.Proc.ByeConfirm()
    MENU:SetTag_MonsterString(1, GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID))
    MENU:SetTag_MonsterString(2, GROUND:GetPokemonNameForPokemonWarehouseDefault(byePokemonID))
    WINDOW:SysMsg(-1977029387)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-1663354751, 1)
    WINDOW:SelectChain(1634720950, 0)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL_NO_CLOSE)
    if ret == 1 then
      FlowSys:Next("ByeAnnounce")
    end
    if ret == 0 then
      FlowSys:Next("ReplaceConfirm")
    end
  end
  function FlowSys.Proc.ByeConfirmTwice()
    SetTagPokemonName(GROUND:GetPokemonNameForPokemonWarehouseDefault(byePokemonID))
    WINDOW:SysMsg(1357810413)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-552078959, 1)
    WINDOW:SelectChain(1268834193, 0)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL_NO_CLOSE)
    if ret == 1 then
      FlowSys:Next("ByeAnnounce")
    end
    if ret == 0 then
      FlowSys:Next("ReplaceConfirm")
    end
  end
  function FlowSys.Proc.ByeAnnounce()
    MENU:SetTag_MonsterString(1, GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID))
    MENU:SetTag_MonsterString(2, GROUND:GetPokemonNameForPokemonWarehouseDefault(byePokemonID))
    WINDOW:SysMsg(-1167957367)
    if GROUND:IsPokemonWarehouseIdBuddy(byeWarehouseID) then
      ShopSys:SelectPokemonWarehouseId(byeWarehouseID)
      ShopSys:ChangeSelectPokemonStandby()
    end
    GROUND:RemovePokemonWarehouseFromId(byeWarehouseID)
    FlowSys:Next("JoinAnnounce")
  end
  local nicnameText = GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID)
  function FlowSys.Proc.NicknameInit()
    nicnameText = GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID)
    FlowSys:Next("Nickname")
  end
  function FlowSys.Proc.Nickname()
    SetTagPokemonName(GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonID))
    WINDOW:SysMsg(1824131716)
    WINDOW:CloseMessage()
    local menu = MENU:CreateNameInputMenu(ScreenType.B)
    menu:SetText(nicnameText)
    menu:SetTitleText(37995732)
    function menu:decideAction()
      nicnameText = menu:GetText()
      FlowSys:Next("NicknameConfirm")
      self:Close()
    end
    function menu:cancelAction()
      nicnameText = menu:GetText()
      FlowSys:Next("NicknameConfirm")
      self:Close()
    end
    function menu:ngAction()
      WINDOW:SetMessageScreenMode(ScreenType.B)
      WINDOW:SysMsg(998639762)
      WINDOW:CloseMessage()
      WINDOW:SetMessageScreenMode(ScreenType.A)
    end
    menu:Open()
    MENU:SetFocus(menu)
    MENU:WaitClose(menu)
  end
  function FlowSys.Proc.NicknameConfirm()
    SetTagPokemonName(nicnameText)
    WINDOW:SysMsg(926581009)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-680963830, 1)
    WINDOW:SelectChain(-1165048695, 0)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL_NO_CLOSE)
    if ret == 1 then
      FlowSys:Next("JoinAnnounce")
    end
    if ret == 0 then
      FlowSys:Next("Nickname")
    end
  end
  function FlowSys.Proc.JoinAnnounce()
    SetTagPokemonName(nicnameText)
    if bSkipResultMessage == false then
      WINDOW:SysMsg(1003663696)
    end
    local lv, warehouseId
    warehouseId = GROUND:AddPokemonWarehouse(actorID, 0)
    GROUND:SetPokemonWarehouseName(warehouseId, nicnameText)
    GROUND:SetJoinedActor(actorID)
    FlowSys:Next("DecideExit")
  end
  function FlowSys.Proc.DecideExit()
    if decideAct then
      decideAct()
    end
    FlowSys:Next("Exit")
  end
  function FlowSys.Proc.CancelExit()
    if cancelAct then
      cancelAct()
    end
    FlowSys:Next("Exit")
  end
  function FlowSys.Proc.Exit()
    FlowSys:Return()
  end
  if bSkipAccept then
    FlowSys:Call("CheckWarehouse")
  else
    FlowSys:Call("AcceptConfirm")
  end
  WINDOW:CloseMessage()
end

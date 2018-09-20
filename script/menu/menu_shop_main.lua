function GROUND:CheckParadiseMultiPlay()
  return ShopSys:DummyJudeAsk("[M:KARI]\227\129\168\227\130\130\227\129\160\227\129\161\227\130\178\227\131\188\227\131\136\227\129\140\233\150\139\227\129\132\227\129\166\227\129\132\227\130\139\239\188\159", true)
end
function DispBagDiposeSelectMenu(DiposeAct, cancelAct, expretionAct, ShopListTitle, DiposeActMes, expretionActMes)
  ShopSys:DispBasicItemBagMenu({
    titleText = ShopListTitle,
    itemTextFunc = function(item)
      return ShopSys:GetSellItemBagText(item)
    end,
    itemLineHelpFunc = function(item)
      return item:GetItemOneLineExplainText()
    end,
    commandItems = {
      {
        text = DiposeActMes,
        action = function()
          DiposeAct()
        end,
        isCloseShopMenu = true
      },
      {
        text = expretionActMes,
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
    isMultiSelect = true
  })
end
function DispShopSelectMenu(buyAct, cancelAct, expretionAct, ShopListTitle, buyActMes, expretionActMes)
  local multiSelectFuncPre_ = function(bagMenu, work)
    work.nowCount = 0
    work.nowPrice = 0
    work.noBagCount = false
    work.noMoney = false
    if bagMenu:IsMultiSelect() then
      for selItem in bagMenu:EnumerateSelectedItems() do
        work.nowCount = work.nowCount + 1
        work.nowPrice = work.nowPrice + ShopSys:GetBuyPrice(selItem)
      end
    end
  end
  local multiSelectFuncCheck_ = function(bagMenu, work, item, isAllSelect)
    local hasMoney = GROUND:GetPlayerMoney()
    local spaceCount = GROUND:GetBagItemMaxCount() - GROUND:GetBagItemCount()
    local addCount = 1
    if spaceCount < work.nowCount + addCount then
      work.noBagCount = true
      return false
    end
    local addPrice = ShopSys:GetBuyPrice(item)
    if hasMoney < work.nowPrice + addPrice then
      work.noMoney = true
      return false
    end
    return true
  end
  local multiSelectFuncAddAfter_ = function(bagMenu, work, item)
    local addCount = 1
    local addPrice = ShopSys:GetBuyPrice(item)
    work.nowCount = work.nowCount + addCount
    work.nowPrice = work.nowPrice + addPrice
  end
  local multiSelectFuncPost_ = function(bagMenu, work)
    if work.noBagCount then
      bagMenu:SetEffect("shake_bagCount")
    end
    if work.noMoney then
      bagMenu:SetEffect("shake_money")
    end
  end
  ShopSys:DispBasicShopGoodsMenu({
    titleText = ShopListTitle,
    padHelpMainText = -976386987,
    enumGoodsFunc = function()
      return ShopSys:EnumerateShopItems()
    end,
    goodsTextFunc = function(goods)
      return ShopSys:GetShopGoodsText(goods)
    end,
    goodsLineHelpFunc = function(goods)
      return goods:GetItemOneLineExplainText()
    end,
    commandItems = {
      {
        text = buyActMes,
        action = function()
          buyAct()
        end,
        isCloseShopMenu = true
      },
      {
        text = expretionActMes,
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
    isMultiSelect = true,
    isAllSelectEnable = true,
    extentMultiSelectPre = multiSelectFuncPre_,
    extentMultiSelectCheck = multiSelectFuncCheck_,
    extentMultiSelectAddAfter = multiSelectFuncAddAfter_,
    extentMultiSelectPost = multiSelectFuncPost_,
    calcDiffBagCountFunc = function(bagMenu)
      local addCount = 0
      if bagMenu:IsMultiSelect() then
        for selItem in bagMenu:EnumerateSelectedItems() do
          addCount = addCount + 1
        end
      end
      return addCount
    end,
    calcDiffMoneyFunc = function(bagMenu)
      local subMoney = 0
      if bagMenu:IsMultiSelect() then
        for selItem in bagMenu:EnumerateSelectedItems() do
          subMoney = subMoney - ShopSys:GetBuyPrice(selItem)
        end
      end
      return subMoney
    end
  })
end
function DispBagSelectMenu(sellAct, cancelAct, expretionAct, ShopListTitle, sellActMes, expretionActMes)
  local multiSelectFuncPre_ = function(bagMenu, work)
  end
  local multiSelectFuncCheck_ = function(bagMenu, work, item, isAllSelect)
    if isAllSelect and item:IsNowEquipped() then
      return false
    end
    return true
  end
  local multiSelectFuncAddAfter_ = function(bagMenu, work, item)
  end
  local multiSelectFuncPost_ = function(bagMenu, work)
  end
  ShopSys:DispBasicItemBagMenu({
    titleText = ShopListTitle,
    padHelpMainText = -287254634,
    itemTextFunc = function(item)
      return ShopSys:GetSellItemBagText(item)
    end,
    itemLineHelpFunc = function(item)
      return item:GetItemOneLineExplainText()
    end,
    commandItems = {
      {
        text = sellActMes,
        action = function()
          sellAct()
        end,
        isCloseShopMenu = true
      },
      {
        text = expretionActMes,
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
    isDispBagCountAndMoneyWindow = true,
    isMultiSelect = true,
    isAllSelectEnable = true,
    extentMultiSelectPre = multiSelectFuncPre_,
    extentMultiSelectCheck = multiSelectFuncCheck_,
    extentMultiSelectAddAfter = multiSelectFuncAddAfter_,
    extentMultiSelectPost = multiSelectFuncPost_,
    calcDiffBagCountFunc = function(bagMenu)
      local removeCount = 0
      if bagMenu:IsMultiSelect() then
        for selItem in bagMenu:EnumerateSelectedItems() do
          removeCount = removeCount - 1
        end
      end
      return removeCount
    end,
    calcDiffMoneyFunc = function(bagMenu)
      local addMoney = 0
      if bagMenu:IsMultiSelect() then
        for selItem in bagMenu:EnumerateSelectedItems() do
          addMoney = addMoney + ShopSys:GetSellPrice(selItem)
        end
      end
      return addMoney
    end,
    isSortButtonEnable = true
  })
end
function DispItemGuide()
  ShopSys:DispShopItemExpMenu()
end
function AddPokemonSortAndSearchAction(menu, optTbl)
  local initalNameTbl = {
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_A,
      charaSet = {"A", "a"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_B,
      charaSet = {"B", "b"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_C,
      charaSet = {"C", "c"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_D,
      charaSet = {"D", "d"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_E,
      charaSet = {"E", "e"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_F,
      charaSet = {"F", "f"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_G,
      charaSet = {"G", "g"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_H,
      charaSet = {"H", "h"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_I,
      charaSet = {"I", "i"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_J,
      charaSet = {"J", "j"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_K,
      charaSet = {"K", "k"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_L,
      charaSet = {"L", "l"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_M,
      charaSet = {"M", "m"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_N,
      charaSet = {"N", "n"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_O,
      charaSet = {"O", "o"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_P,
      charaSet = {"P", "p"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_Q,
      charaSet = {"Q", "q"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_R,
      charaSet = {"R", "r"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_S,
      charaSet = {"S", "s"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_T,
      charaSet = {"T", "t"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_U,
      charaSet = {"U", "u"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_V,
      charaSet = {"V", "v"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_W,
      charaSet = {"W", "w"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_X,
      charaSet = {"X", "x"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_Y,
      charaSet = {"Y", "y"}
    },
    {
      textId = SHOP_COMMON__POKEMON_LIST_FILTER_Z,
      charaSet = {"Z", "z"}
    },
    {textId = -1140075025, charaSet = nil}
  }
  local allCharaHashSet = {}
  for i, v in ipairs(initalNameTbl) do
    if v.charaSet then
      v.charaHashSet = {}
      for i, c in ipairs(v.charaSet) do
        allCharaHashSet[c] = true
        v.charaHashSet[c] = true
      end
    else
      v.charaHashSet = nil
    end
  end
  local sortCursorIdx = 0
  local filterCursorIdx = 0
  local interruptNextSearch = false
  local interruptNextSort = false
  local sortFlag
  sortFlag = false
  if optTbl.sortByNoAct or optTbl.sortByLvAct or optTbl.sortByNameAct or optTbl.sortByNicknameAct then
    sortFlag = true
  end
  local searchFlag
  searchFlag = false
  if optTbl.isFilterByType or optTbl.isFilterByName or optTbl.isFilterByNickname then
    searchFlag = true
  end
  local function createSortActionMenu(parentMenu)
    local sortActionMenu = MENU:CreateActionMenu(parentMenu.curItem.obj)
    sortActionMenu:SetLayoutRectAndLines(168, 40, 112, 0)
    function sortActionMenu:cancelAction()
      self:Close()
    end
    if optTbl.sortByNoAct then
      sortActionMenu:AddActionItem(1251895095, nil, nil, function(self)
        optTbl.sortByNoAct()
        self:Close()
      end)
    end
    if optTbl.sortByLvAct then
      sortActionMenu:AddActionItem(483994739, nil, nil, function(self)
        optTbl.sortByLvAct()
        self:Close()
      end)
    end
    if optTbl.sortByNameAct then
      sortActionMenu:AddActionItem(-929587901, nil, nil, function(self)
        optTbl.sortByNameAct()
        self:Close()
      end)
    end
    if optTbl.sortByNicknameAct then
      sortActionMenu:AddActionItem(861096907, nil, nil, function(self)
        optTbl.sortByNicknameAct()
        self:Close()
      end)
    end
    function sortActionMenu:openedAction()
      self:SetCursorItemIndex(sortCursorIdx)
    end
    function sortActionMenu:closedAction()
      sortCursorIdx = self:GetCursorItemIndex()
    end
    return sortActionMenu
  end
  local function createSearchActionMenu(parentMenu)
    local searchActionMenu = MENU:CreateActionMenu(parentMenu.curItem.obj)
    searchActionMenu:SetLayoutRectAndLines(168, 40, 112, 0)
    local function dispSearchWindow(searchType)
      local genFunc
      searchActionMenu:SetVisible(false)
      local selectMenu = MENU:CreatePageMenu()
      selectMenu:SetLayoutRectAndLines(168, 40, 112, 6)
      selectMenu:ShowPageNum(true)
      if searchType == "Type" then
        function genFunc(typeNo)
          return function(pokemonIndex, warehouseId)
            if GROUND:GetPokemonTypeFromIndex(pokemonIndex, 0) == typeNo or GROUND:GetPokemonTypeFromIndex(pokemonIndex, 1) == typeNo then
              return false
            end
            return true
          end
        end
        selectMenu:AddItem("[type:1]", PokemonType.NORMAL, nil)
        selectMenu:AddItem("[type:2]", PokemonType.GRASS, nil)
        selectMenu:AddItem("[type:3]", PokemonType.FIRE, nil)
        selectMenu:AddItem("[type:4]", PokemonType.WATER, nil)
        selectMenu:AddItem("[type:5]", PokemonType.ELECTRIC, nil)
        selectMenu:AddItem("[type:6]", PokemonType.ICE, nil)
        selectMenu:AddItem("[type:7]", PokemonType.FIGHTING, nil)
        selectMenu:AddItem("[type:8]", PokemonType.POISON, nil)
        selectMenu:AddItem("[type:9]", PokemonType.GROUND, nil)
        selectMenu:AddItem("[type:10]", PokemonType.FLYING, nil)
        selectMenu:AddItem("[type:11]", PokemonType.PSYCHIC, nil)
        selectMenu:AddItem("[type:12]", PokemonType.BUG, nil)
        selectMenu:AddItem("[type:13]", PokemonType.ROCK, nil)
        selectMenu:AddItem("[type:14]", PokemonType.GHOST, nil)
        selectMenu:AddItem("[type:15]", PokemonType.DRAGON, nil)
        selectMenu:AddItem("[type:16]", PokemonType.DARK, nil)
        selectMenu:AddItem("[type:17]", PokemonType.STEEL, nil)
      elseif searchType == "PokemonName" then
        function genFunc(charaHashSet)
          return function(pokemonIndex, warehouseId)
            local flg = false
            local inital = GROUND:GetInitialForPokemonName(pokemonIndex)
            if charaHashSet then
              if charaHashSet[inital] ~= nil then
                flg = true
              end
            elseif allCharaHashSet[inital] == nil then
              flg = true
            end
            return not flg
          end
        end
        for i, tbl in ipairs(initalNameTbl) do
          selectMenu:AddItem(tbl.textId, tbl.charaHashSet, nil)
        end
      elseif searchType == "NickName" then
        function genFunc(charaHashSet)
          return function(pokemonIndex, warehouseId)
            local flg = false
            local inital = GROUND:GetInitialForNickName(warehouseId)
            if charaHashSet then
              if charaHashSet[inital] ~= nil then
                flg = true
              end
            elseif allCharaHashSet[inital] == nil then
              flg = true
            end
            return not flg
          end
        end
        for i, tbl in ipairs(initalNameTbl) do
          selectMenu:AddItem(tbl.textId, tbl.charaHashSet, nil)
        end
      end
      function selectMenu:itemPreOpenModifyAction()
        local count = optTbl.getCountListFunc(genFunc(self.curItem.obj))
        if count == 0 then
          self.curItem.grayed = true
        end
      end
      function selectMenu:openedAction()
        self:currentItemChange()
      end
      function selectMenu:decideAction()
        parentMenu.lastFilterFunc = genFunc(self.curItem.obj)
        optTbl.reCreateListFunc(parentMenu.lastFilterFunc)
        self:Close()
        searchActionMenu:Close()
      end
      function selectMenu:cancelAction()
        optTbl.reCreateListFunc(parentMenu.lastFilterFunc)
        self:Close()
      end
      function selectMenu:closedAction()
        searchActionMenu:SetVisible(true)
        MENU:SetFocus(searchActionMenu)
      end
      function selectMenu:currentItemChange()
        if self.curItem.grayed == false then
          optTbl.reCreateListFunc(genFunc(self.curItem.obj))
        end
      end
      BasicMenu_OpenAndCloseWait(selectMenu)
      searchActionMenu:SetVisible(true)
    end
    if optTbl.isFilterByType then
      searchActionMenu:AddActionItem(1770983861, nil, nil, function(self)
        dispSearchWindow("Type")
      end)
    end
    if optTbl.isFilterByName then
      searchActionMenu:AddActionItem(-294470777, nil, nil, function(self)
        dispSearchWindow("PokemonName")
      end)
    end
    if optTbl.isFilterByNickname then
      searchActionMenu:AddActionItem(1280550454, nil, nil, function(self)
        dispSearchWindow("NickName")
      end)
    end
    if optTbl.isFilterByType or optTbl.isFilterByName or optTbl.isFilterByNickname then
      searchActionMenu:AddActionItem(-1222084501, nil, nil, function(self)
        parentMenu.lastFilterFunc = nil
        self:Close()
      end)
    end
    function searchActionMenu:cancelAction()
      self:Close()
    end
    function searchActionMenu:openedAction()
      self:SetCursorItemIndex(filterCursorIdx)
    end
    function searchActionMenu:closedAction()
      filterCursorIdx = self:GetCursorItemIndex()
    end
    return searchActionMenu
  end
  local function dispSortAndSearchMenu(parentMenu)
    while interruptNextSort or interruptNextSearch do
      if interruptNextSort then
        interruptNextSort = false
        local padHelp = -632729300
        CommonSys:OpenBasicMenu(952056027, padHelp)
        local sortmenu = createSortActionMenu(parentMenu)
        BasicMenu_OpenAndCloseWait(sortmenu)
      elseif interruptNextSearch then
        interruptNextSearch = false
        local padHelp = 1663906649
        CommonSys:OpenBasicMenu(1759086282, padHelp)
        local searchmenu = createSearchActionMenu(parentMenu)
        BasicMenu_OpenAndCloseWait(searchmenu)
      else
        break
      end
      if interruptNextSort or interruptNextSearch then
        TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
      end
      CommonSys:CloseBasicMenu()
    end
    MENU:SetFocus(parentMenu)
    optTbl.reCreateListFunc(parentMenu.lastFilterFunc)
  end
  if sortFlag == true then
    function menu:sortAction()
      SOUND:PlaySe(SymSnd("SE_SYS_SORT"))
      interruptNextSort = true
      dispSortAndSearchMenu(self)
    end
  end
  if searchFlag == true then
    function menu:searchAction()
      SOUND:PlaySe(SymSnd("SE_SYS_SORT"))
      interruptNextSearch = true
      dispSortAndSearchMenu(self)
    end
  end
end
function SAVEPARTY()
  GROUND:SetPartyBackup()
end
function LOADPARTY()
  GROUND:GetPartyBackup()
  GROUND:SortPartyMember(false)
end
function isSAVEPARTY()
  return GROUND:IsPartyBackup()
end

function OpenGiftShopMenu()
  local isFade
  MENU:LoadMenuTextPool("message/shop.bin", false)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_GIFT01")
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetOwner("CHIRACHIINO")
  ShopSys:SetShopKind(GroundItemShopKind.GIFT)
  isFade = false
  function FlowSys.Proc.MenuTopFirst()
    WINDOW:CloseMessage()
    SYSTEM:ExecuteTutorialHint(SymHint("SHOP_GIFT_FIRST"))
    ShopSys:SetSelectGoodsTbl(nil)
    ShopSys:Talk(SHOP_GIFT__WELCOME_MES, FACE_TYPE.HAPPY)
    WINDOW:CloseMessage()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_GIFT__WELCOME, FACE_TYPE.HAPPY, {cursorSaveName = "topfirst"}, {
      next = "ExitMerchant"
    }, {
      text = SHOP_GIFT__WELCOME_MAKE,
      next = "TopMakeBefore"
    }, {text = SHOP_GIFT__WELCOME_LIST, next = "TopList"}, {text = SHOP_GIFT__WELCOME_HELP, next = "Help"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopLoop()
    if isFade == true then
      SCREEN_A:FadeInAll(TimeSec(0.3), false)
      SCREEN_B:FadeInAll(TimeSec(0.3), false)
      isFade = false
    end
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_GIFT__SERIES, nil, {cursorSaveName = "topfirst"}, {
      next = "ExitMerchant"
    }, {
      text = SHOP_GIFT__SERIES_MAKE,
      next = "TopMakeBefore"
    }, {
      text = SHOP_GIFT__SERIES_LIST,
      next = "TopListBefore"
    }, {text = SHOP_GIFT__SERIES_HELP, next = "Help"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.TopMakeBefore()
    ShopSys:Talk(SHOP_GIFT__MAKE_INTO, nil)
    FlowSys:Next("TopMake")
  end
  function FlowSys.Proc.TopMake()
    if isFade == true then
      SCREEN_A:FadeInAll(TimeSec(0.3), false)
      SCREEN_B:FadeInAll(TimeSec(0.3), false)
      isFade = false
    end
    WINDOW:CloseMessage()
    DispGiftShopSelectMenu(function()
      FlowSys:Next("CheckBagOverGift")
    end, function()
      SCREEN_A:FadeOutAll(TimeSec(0.3), false)
      SCREEN_B:FadeOutAll(TimeSec(0.3), true)
      isFade = true
      FlowSys:Next("PictureBookInGiftList")
    end, function()
      FlowSys:Next("MenuTopLoop")
    end, function()
      FlowSys:Next("ItemGuide", "TopMake")
    end, SHOP_GIFT__CAPTION_GIFT, SHOP_GIFT__MAKE_SELECT_BUY, SHOP_GIFT__MAKE_SELECT_TARGET, SHOP_GIFT__MAKE_SELECT_EXPLAIN)
  end
  function FlowSys.Proc.PictureBookInGiftList()
    WINDOW:CloseMessage()
    OpenPokemonPictureBook(function(pokemonIndex)
      return ShopSys:IsSelectGiftContainsPokemon(pokemonIndex) == false
    end, nil, function()
      SCREEN_A:FadeOutAll(TimeSec(0.3), false)
      SCREEN_B:FadeOutAll(TimeSec(0.3), true)
      isFade = true
      FlowSys:Next("TopMake")
    end, FlowSys.Stat.saveLastCursor, SHOP_GIFT__CAPTION_GIFT_POKEMON, function()
      if isFade == true then
        SCREEN_A:FadeInAll(TimeSec(0.3), false)
        SCREEN_B:FadeInAll(TimeSec(0.3), false)
        isFade = false
      end
    end, false)
  end
  function FlowSys.Proc.ItemGuide(nextFlow)
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispItemGuide()
    CommonSys:EndLowerMenuNavi(true)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.CheckBagOverGift()
    if ShopSys:CheckBagFull() == true then
      ShopSys:Talk(SHOP_GIFT__MAKE_BAG_MAX)
      FlowSys:Next("TopMake")
      return
    end
    FlowSys:Next("MakeConfirmGift")
  end
  function FlowSys.Proc.MakeConfirmGift()
    ShopSys:SetShopTag("\228\189\156\230\136\144\227\129\153\227\130\139\227\130\174\227\131\149\227\131\136", ShopSys:GetSelectItemName())
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", ShopSys:GetBuyPriceText())
    ShopSys:TalkAskFlowNoClose(SHOP_GIFT__MAKE_CONFIRM, nil, nil, {next = "TopMake"}, {
      text = SHOP_GIFT__MAKE_CONFIRM_YES,
      next = "GiftMakeCheckGift"
    }, {text = SHOP_GIFT__MAKE_CONFIRM_NO, next = "TopMake"})
  end
  function FlowSys.Proc.GiftMakeCheckGift()
    FlowSys:Call("GiftMake")
    FlowSys:Next("MakeLoopCheckBag")
  end
  function FlowSys.Proc.MakeLoopCheckBag()
    if ShopSys:CheckBagFull() then
      FlowSys:Next("MenuTopLoop")
      return
    end
    FlowSys:Next("MakeSeries")
  end
  function FlowSys.Proc.MakeSeries()
    ShopSys:TalkAskFlowNoClose(SHOP_GIFT__MAKE_SERIES, nil, nil, {
      next = "MenuTopLoop"
    }, {text = SHOP_GIFT__MAKE_SERIES_YES, next = "TopMake"}, {
      text = SHOP_GIFT__MAKE_SERIES_NO,
      next = "MenuTopLoop"
    })
  end
  function FlowSys.Proc.CheckBagOverPokemon()
    if ShopSys:CheckBagFull() == true then
      ShopSys:Talk(SHOP_GIFT__MAKE_BAG_MAX)
      FlowSys:Next("MakeInPictureBook")
      return
    end
    FlowSys:Next("MakeConfirmPokemon")
  end
  function FlowSys.Proc.MakeConfirmPokemon()
    ShopSys:SetShopTag("\228\189\156\230\136\144\227\129\153\227\130\139\227\130\174\227\131\149\227\131\136", ShopSys:GetSelectItemName())
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", ShopSys:GetBuyPriceText())
    ShopSys:TalkAskFlowNoClose(SHOP_GIFT__MAKE_CONFIRM, nil, nil, {
      next = "MakeInPictureBook"
    }, {
      text = SHOP_GIFT__MAKE_CONFIRM_YES,
      next = "GiftMakeCheckPokemon"
    }, {
      text = SHOP_GIFT__MAKE_CONFIRM_NO,
      next = "MakeInPictureBook"
    })
  end
  function FlowSys.Proc.GiftMakeCheckPokemon()
    FlowSys:Call("GiftMake")
    FlowSys:Next("MakeInPictureBook")
  end
  function FlowSys.Proc.GiftMake()
    ShopSys:MakeGiftItem()
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:Talk(SHOP_GIFT__MAKE_THANKS)
    Event()
    FlowSys:Return()
  end
  function Event()
    WINDOW:CloseMessage()
    EFFECT:Create("effectStar", SymEff("NM_STAR_VR_PINK"))
    EFFECT:Create("effectHeart", SymEff("CH_HEART_PINK"))
    EFFECT:SetPosition("effectStar", SymPos("P00_EFFECT_NM_STAR_VR"))
    EFFECT:SetPosition("effectHeart", SymPos("P00_EFFECT_CH_HEART_PINK"))
    SOUND:PlaySe(SymSnd("SE_SHOP_GIFT"))
    EFFECT:Play("effectStar")
    CH("CHIRACHIINO"):SetFacialMotion(FACIAL_MOTION.HAPPY)
    CH("CHIRACHIINO"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
    ShopSys:SysMsg(SHOP_GIFT__MAKE_THANKS_FIRST)
    TASK:Sleep(TimeSec(0.3))
    EFFECT:Play("effectHeart")
    EFFECT:Wait("effectStar")
    WINDOW:ForceCloseMessage()
    ShopSys:Talk(SHOP_GIFT__MAKE_THANKS_SECOND, FACE_TYPE.HAPPY)
    subEveCloseMsg()
    CH("CHIRACHIINO"):SetFacialMotion(FACIAL_MOTION.NORMAL)
    CH("CHIRACHIINO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    return
  end
  function FlowSys.Proc.TopListBefore()
    ShopSys:Talk(SHOP_GIFT__LIST_INTO, nil)
    WINDOW:CloseMessage()
    FlowSys:Next("TopList")
  end
  function FlowSys.Proc.TopList()
    WINDOW:CloseMessage()
    TASK:Sleep(TimeSec(0))
    FlowSys.Stat.selectPokemonIndex = nil
    OpenPokemonPictureBook(nil, function(pokemonIndex, cursorIdx)
      SCREEN_A:FadeOutAll(TimeSec(0.3), false)
      SCREEN_B:FadeOutAll(TimeSec(0.3), true)
      isFade = true
      FlowSys.Stat.selectPokemonIndex = pokemonIndex
      FlowSys:Next("MakeInPictureBook")
      FlowSys.Stat.saveLastCursor = cursorIdx
    end, function()
      FlowSys:Next("MenuTopLoop")
      FlowSys.Stat.saveLastCursor = nil
    end, FlowSys.Stat.saveLastCursor, SHOP_GIFT__CAPTION_POKEMON, function()
      if isFade == true then
        SCREEN_A:FadeInAll(TimeSec(0.3), false)
        SCREEN_B:FadeInAll(TimeSec(0.3), false)
        isFade = false
      end
    end, true)
  end
  function FlowSys.Proc.MakeInPictureBook()
    if isFade == true then
      SCREEN_A:FadeInAll(TimeSec(0.3), false)
      SCREEN_B:FadeInAll(TimeSec(0.3), false)
      isFade = false
    end
    WINDOW:CloseMessage()
    DispGiftShopSelectMenuFromBook(function(self)
      FlowSys:Next("CheckBagOverPokemon")
    end, function()
      SCREEN_A:FadeOutAll(TimeSec(0.3), false)
      SCREEN_B:FadeOutAll(TimeSec(0.3), true)
      isFade = true
      FlowSys:Next("TopList")
    end, function()
      FlowSys:Next("ItemGuide", "MakeInPictureBook")
    end, SHOP_GIFT__CAPTION_POKEMON_GIFT, SHOP_GIFT__LIST_MAKE_SELECT_BUY, SHOP_GIFT__LIST_MAKE_SELECT_EXPLAIN, FlowSys.Stat.selectPokemonIndex)
  end
  function FlowSys.Proc.Help()
    ShopSys:Talk(SHOP_GIFT__HELP, nil)
    WINDOW:CloseMessage()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.ExitMerchant()
    ShopSys:Talk(SHOP_GIFT__EXIT, nil)
    FlowSys:Return()
  end
  FlowSys:Call("MenuTopFirst")
  WINDOW:CloseMessage()
  LOWER_SCREEN:ChangeLastWallpaper()
  FlowSys:Finish()
  ShopSys:Finish()
end
function DispGiftShopSelectMenu(makeAct, selectionAct, cancelAct, expretionAct, ShopListTitle, MakeActMes, SelectionActMes, expretionActMes, targetPokemonIndex)
  local grayoutMakeFlt = function(bagMenu, itemIns)
    ShopSys:SetSelectGoodsTbl({itemIns})
    if ShopSys:CheckBuyablePrice() == false then
      return true
    end
    for idx = 1, GROUND:GetGiftMaterialCount(itemIns:GetIndex()) do
      local needCount = GROUND:GetGiftMaterialNeedCount(itemIns:GetIndex(), idx - 1)
      local hasCount = GROUND:GetGiftMaterialHasCount(itemIns:GetIndex(), idx - 1)
      if needCount > hasCount then
        return true
      end
    end
    return false
  end
  local function disalbeSelectionFlt(bagMenu, itemIns)
    if SelectionActMes == nil then
      return true
    end
    return false
  end
  local function enumerateItemsFunc()
    if targetPokemonIndex then
      return coroutine.wrap(function()
        local coWrap = ShopSys:EnumerateShopItems()
        while true do
          local giftItem = coWrap()
          if giftItem == nil then
            break
          end
          if GROUND:IsGiftContainsPokemon(giftItem:GetIndex(), targetPokemonIndex) then
            coroutine.yield(giftItem)
          end
        end
      end)
    else
      return ShopSys:EnumerateShopItems()
    end
  end
  local titleTextTbl = {}
  local explainTextTbl = {}
  local priceTbl = {}
  for giftItem in ShopSys:EnumerateShopItems() do
    MENU:SetTag_ItemIndex(0, giftItem:GetIndex())
    titleTextTbl[giftItem:GetIndex()] = MENU:ReplaceTagText("[item_b:0]")
    explainTextTbl[giftItem:GetIndex()] = giftItem:GetItemExplainTextId()
    priceTbl[giftItem:GetIndex()] = GROUND:CalcBuyItemPrice({giftItem}, 1)
  end
  local upperMaterialMenu = ShopSys:OpenUpperMaterialMenu({
    enumMaterialFunc = function(giftItemIndex)
      return coroutine.wrap(function()
        for idx = 1, GROUND:GetGiftMaterialCount(giftItemIndex) do
          coroutine.yield({
            itemIndex = GROUND:GetGiftMaterialItemIndex(giftItemIndex, idx - 1),
            neecCount = GROUND:GetGiftMaterialNeedCount(giftItemIndex, idx - 1),
            hasCount = GROUND:GetGiftMaterialHasCount(giftItemIndex, idx - 1)
          })
        end
      end)
    end,
    getPriceFunc = function(giftItemIndex)
      return priceTbl[giftItemIndex]
    end,
    titleTextTbl = titleTextTbl,
    isGiftPrice = true
  })
  local commandItemsBuf
  if SelectionActMes then
    commandItemsBuf = {
      {
        text = MakeActMes,
        action = function()
          makeAct()
        end,
        isCloseShopMenu = true,
        grayoutFilter = grayoutMakeFlt
      },
      {
        text = SelectionActMes,
        action = function()
          selectionAct()
        end,
        isCloseShopMenu = true,
        disableFilter = disalbeSelectionFlt
      },
      {
        text = expretionActMes,
        action = function()
          expretionAct()
        end,
        isCloseShopMenu = true,
        isSingleOnly = true
      }
    }
  else
    commandItemsBuf = {
      {
        text = MakeActMes,
        action = function()
          makeAct()
        end,
        isCloseShopMenu = true,
        grayoutFilter = grayoutMakeFlt
      },
      {
        text = expretionActMes,
        action = function()
          expretionAct()
        end,
        isCloseShopMenu = true,
        isSingleOnly = true
      }
    }
  end
  ShopSys:DispBasicShopGoodsMenu({
    titleText = ShopListTitle,
    padHelpMainText = SHOP_GIFT__MANUAL_GIFT,
    enumGoodsFunc = function()
      return enumerateItemsFunc()
    end,
    goodsTextFunc = function(goods)
      return ShopSys:GetShopGoodsText(goods)
    end,
    goodsLineHelpFunc = function(goods)
      return goods:GetItemOneLineExplainText()
    end,
    commandItems = commandItemsBuf,
    cancelAct = function()
      cancelAct()
    end,
    isMultiSelect = false,
    updateItemInfoFunc = function(bagMenu, goods)
      upperMaterialMenu:UpdateInfo(goods:GetIndex())
    end,
    closedAct = function()
      upperMaterialMenu:Close()
    end,
    modifyBagMenuFunc = function(bagMenu)
      function bagMenu:inputLSelectAction()
        upperMaterialMenu:SwitchInfo(-1)
      end
      function bagMenu:inputRSelectAction()
        upperMaterialMenu:SwitchInfo(1)
      end
    end
  })
end
function DispGiftShopSelectMenuFromBook(makeAct, cancelAct, expretionAct, ShopListTitle, MakeActMes, expretionActMes, targetPokemonIndex)
  DispGiftShopSelectMenu(makeAct, nil, cancelAct, expretionAct, ShopListTitle, MakeActMes, nil, expretionActMes, targetPokemonIndex)
end
function OpenPokemonPictureBook(pokemonFilterFunc, targetGiftAct, cancelAct, defaultCursorIdx, shopTitle, fadeAct, tutorialFlag)
  GROUND__2:PictureBookStartup1()
  TASK:Sleep(TimeSec(0))
  GROUND__2:PictureBookStartup2()
  fadeAct()
  local nameMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
  nameMenu:SetLayoutRect(Rectangle(16, 16, 96, 16))
  nameMenu:SetTextOffset(0, 0)
  nameMenu:SetFontType(FontType.TYPE_16)
  nameMenu:SetText(GROUND__2:GetText_PictualBookPokemonName())
  nameMenu:Open()
  nameMenu:SetParallaxFromLevel(PARALLAX_LEVEL.NEAR_1)
  local typeMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
  typeMenu:SetLayoutRect(Rectangle(16, 52, 96, 104))
  typeMenu:SetTextOffset(0, 0)
  typeMenu:SetText(GROUND__2:GetText_PictualBookTypeInfo())
  typeMenu:Open()
  typeMenu:SetParallaxFromLevel(PARALLAX_LEVEL.NEAR_1)
  local infoMenu = MENU:CreateArrowBoardMenuWindow(ScreenType.A)
  infoMenu:SetLayoutRect(Rectangle(16, 176, 368, 48))
  infoMenu:SetTextOffset(40, 0)
  infoMenu:SetFontType(FontType.TYPE_16)
  infoMenu:SetText(GROUND__2:GetText_PictualBookInformation())
  infoMenu:Open()
  infoMenu:SetParallaxFromLevel(PARALLAX_LEVEL.NEAR_1)
  local infoMenu2 = MENU:CreateInfomationMenuWindow(ScreenType.A)
  infoMenu2:SetLayoutPositionY(176)
  infoMenu2:SetLayoutSizeH(0)
  infoMenu2:SetTextOffset(40, 2)
  infoMenu2:SetOption({font = "FONT_12", showBgFrame = false})
  infoMenu2:SetText(GROUND__2:GetText_PictualBookInformation2())
  infoMenu2:Open()
  infoMenu2:SetParallaxFromLevel(PARALLAX_LEVEL.NEAR_1)
  local infoMenuLR = MENU:CreateInfomationMenuWindow(ScreenType.A)
  infoMenuLR:SetLayoutPositionY(192)
  infoMenuLR:SetLayoutSizeH(0)
  infoMenuLR:SetOption({font = "FONT_16", showBgFrame = false})
  infoMenuLR:SetText("[HO:26][M:B08][HO:358][M:B07]")
  infoMenuLR:Open()
  infoMenuLR:SetParallaxFromLevel(PARALLAX_LEVEL.NEAR_1)
  infoMenu:SetLeftArrowPos(-4, 32)
  infoMenu:SetRightArrowPos(356, 32)
  if GROUND__2:PictureBookIsShowArrow() then
    infoMenu:ShowLeftArrow(true)
    infoMenu:ShowRightArrow(true)
  else
    infoMenu:ShowLeftArrow(false)
    infoMenu:ShowRightArrow(false)
  end
  if targetGiftAct == nil then
    CommonSys:OpenBasicMenu(shopTitle, SHOP_GIFT__MANUAL_GIFT_POKEMON, nil)
  else
    CommonSys:OpenBasicMenu(shopTitle, SHOP_GIFT__MANUAL_POKEMON, nil)
  end
  menu = MENU:CreatePageTimerMenu(ScreenType.B)
  menu:SetLayoutRectAndLines(16, 40, 136, 8)
  menu:ShowPageNum(true)
  menu:SetTimerLimit(30)
  if targetGiftAct == nil then
    menu:SetDecideSound(false)
  end
  local pokemonCnt = GROUND__2:GetPictureBookPokemonNum()
  for i = 0, pokemonCnt - 1 do
    local pokemonIndex = GROUND__2:PictureBookGetOrganizationSortToPokemonIndex(i)
    if GROUND__2:GetPictureBookPokemonFilter(pokemonIndex, i) == true and (pokemonFilterFunc == nil or pokemonFilterFunc(pokemonIndex) == false) then
      menu:AddItem(GROUND__2:GetText_PuctorialBookName(pokemonIndex - 1), pokemonIndex - 1, nil)
    end
  end
  function menu:itemPreOpenModifyAction()
    if GROUND__2:PictureBookIsWatch(self.curItem.obj + 1) == false then
      self.curItem.grayed = true
    end
  end
  menu.itemPreUpdateModifyAction = menu.itemPreOpenModifyAction
  local function createList(filterFunc)
    menu:ClearItems()
    local pokemonCnt = GROUND__2:GetPictureBookPokemonNum()
    for i = 0, pokemonCnt - 1 do
      local pokemonIndex = GROUND__2:PictureBookGetOrganizationSortToPokemonIndex(i)
      if GROUND__2:GetPictureBookPokemonFilter(pokemonIndex, i) == true and (pokemonFilterFunc == nil or pokemonFilterFunc(pokemonIndex) == false) and (filterFunc == nil or filterFunc(pokemonIndex, pokemonIndex - 1) == false) then
        menu:AddItem(GROUND__2:GetText_PuctorialBookName(pokemonIndex - 1), pokemonIndex - 1, nil)
      end
    end
  end
  local function reCreateList(filterFunc)
    createList(filterFunc)
    menu:UpdateItemList()
  end
  local function getCountList(filterFunc)
    local count = 0
    local pokemonCnt = GROUND__2:GetPictureBookPokemonNum()
    for i = 0, pokemonCnt - 1 do
      local pokemonIndex = i + 1
      if GROUND__2:GetPictureBookPokemonFilter(pokemonIndex, i) == true and (pokemonFilterFunc == nil or pokemonFilterFunc(pokemonIndex) == false) and (filterFunc == nil or filterFunc(pokemonIndex, i) == false) then
        count = count + 1
      end
    end
    return count
  end
  if tutorialFlag == true then
    AddPokemonSortAndSearchAction(menu, {
      reCreateListFunc = reCreateList,
      getCountListFunc = getCountList,
      isFilterByType = true,
      isFilterByName = true,
      isFilterByNickname = false
    })
  end
  function menu:updateItemListAction()
    menu:ResetTimer()
  end
  function menu:currentItemChange()
    menu:ResetTimer()
  end
  function menu:decideAction()
    if targetGiftAct == nil then
      return
    end
    if GROUND__2:PictureBookIsWatch(self.curItem.obj + 1) == false then
      return
    end
    local actionMenu = MENU:CreateActionMenu(self.curItem.obj, self)
    actionMenu:SetLayoutRectAndLines(168, 40, 144, 0)
    local function decideAct(parent)
      local pokemonIndex = self.curItem.obj + 1
      targetGiftAct(pokemonIndex, self:GetCursorItemIndex())
      self:Close()
      parent:Close()
    end
    local function isGlayoutStandby()
      local pokemonIndex = self.curItem.obj + 1
      local coWrap = ShopSys:EnumerateShopItems()
      local flagGlayout = true
      while true do
        local giftItem = coWrap()
        if giftItem == nil then
          break
        end
        if GROUND__2:IsGiftContainsPokemon(giftItem:GetIndex(), pokemonIndex) then
          flagGlayout = false
        end
      end
      return flagGlayout
    end
    actionMenu:AddActionItem(SHOP_GIFT__LIST_SELECT_TARGET, nil, isGlayoutStandby, decideAct)
    function actionMenu.cancelAction(selfAct)
      MENU:SetFocus(self)
      selfAct:Close()
    end
    actionMenu:Open()
    MENU:SetFocus(actionMenu)
    MENU:WaitClose(actionMenu)
  end
  function menu:cancelAction()
    if cancelAct then
      cancelAct()
    end
    self:Close()
  end
  function menu:RSelectAction()
    GROUND__2:PictureBookChangeInfoPage(1)
    infoMenu:PushRightArrow()
    infoMenu:SetText(GROUND__2:GetText_PictualBookInformation())
    infoMenu2:SetText(GROUND__2:GetText_PictualBookInformation2())
    if GROUND__2:PictureBookIsShowArrow() then
      SOUND:PlaySe(SymSnd("SE_SYS_MARK"))
    else
      SOUND:PlaySe(SymSnd("SE_SYS_NO_SELECT"))
    end
  end
  function menu:LSelectAction()
    GROUND__2:PictureBookChangeInfoPage(-1)
    infoMenu:PushLeftArrow()
    infoMenu:SetText(GROUND__2:GetText_PictualBookInformation())
    infoMenu2:SetText(GROUND__2:GetText_PictualBookInformation2())
    if GROUND__2:PictureBookIsShowArrow() then
      SOUND:PlaySe(SymSnd("SE_SYS_MARK"))
    else
      SOUND:PlaySe(SymSnd("SE_SYS_NO_SELECT"))
    end
  end
  function menu:currentChange()
    local pictIndex = self.curItem.obj
    GROUND__2:PictureBookChangePokemon(pictIndex)
    nameMenu:SetText(GROUND__2:GetText_PictualBookPokemonName())
    typeMenu:SetText(GROUND__2:GetText_PictualBookTypeInfo())
    GROUND__2:PictureBookChangeInfoPage(0)
    infoMenu:SetText(GROUND__2:GetText_PictualBookInformation())
    infoMenu2:SetText(GROUND__2:GetText_PictualBookInformation2())
    if GROUND__2:PictureBookIsShowArrow() then
      infoMenuLR:SetVisible(true)
      infoMenu:ShowLeftArrow(true)
      infoMenu:ShowRightArrow(true)
    else
      infoMenuLR:SetVisible(false)
      infoMenu:ShowLeftArrow(false)
      infoMenu:ShowRightArrow(false)
    end
  end
  function menu:openedAction()
    if defaultCursorIdx then
      self:SetCursorItemIndex(defaultCursorIdx)
    end
    self:currentChange()
  end
  function menu.closedAction()
    menu:ChangeOff()
  end
  MULTI_PLAY:SetMultiplayerVisible(false)
  menu:Open()
  if tutorialFlag == true then
    SYSTEM:ExecuteTutorialHint(SymHint("SHOP_GIFT_PICTURE"))
  end
  SCREEN_A:WaitFade()
  MENU:SetFocus(menu)
  MENU:WaitClose(menu)
  nameMenu:Close()
  typeMenu:Close()
  infoMenu:Close()
  infoMenu2:Close()
  infoMenuLR:Close()
  CommonSys:CloseBasicMenu()
  GROUND__2:PictureBookShutdown()
  MULTI_PLAY:SetMultiplayerVisible(true)
end

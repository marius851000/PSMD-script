gRecycleParameter = {}
function OpenRecycleMenu(shopIns)
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  shopIns:SetItemList()
  local selectItemId = 0
  local WallPaperSetup = function()
    SPRITE:CreatePatternSet("upperBgSet", {
      name = "bg",
      img = "WALLPAPER_MAIN_NOTICE01",
      u = 0,
      v = 0,
      w = 512,
      h = 240,
      cx = 256,
      cy = 120,
      allocateFromMap = true
    })
    SPRITE:CreateSprite("upperBg")
    SPRT("upperBg"):SetPattern({
      setName = "upperBgSet",
      ptnName = "bg",
      ofsX = 0,
      ofsY = 0,
      ofsPrio = 0
    })
    SPRT("upperBg"):SetOption({
      pos = Vector2(200, 120),
      visible = false,
      prio = 600
    })
    SPRITE:CreateSprite("upperNotice")
    SPRT("upperNotice"):SetOption({
      visible = false,
      prio = 550,
      blendType = ALPHA_BLEND.MUL
    })
    SPRT("upperNotice"):SetPosition(Vector2(128, 112))
  end
  local OpenWallpaper = function()
    SPRT("upperBg"):SetVisible(true)
    SPRT("upperNotice"):SetVisible(true)
  end
  local CloseWallpaper = function()
    SPRITE:DestroySprite("upperBg")
    SPRITE:DestroySprite("upperNotice")
    SPRITE:DestroyPatternSet("upperBgSet")
    SPRITE:DestroyPatternSet("autoLoadNoticeSet")
  end
  function FlowSys.Proc.MenuTopRecycle()
    ShopSys:SetSelectGoodsTbl(nil)
    ShopSys:Talk(SHOP_RECYCLE__WELCOME_MES, nil)
    WINDOW:KeyWait()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_RECYCLE__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {
      next = "ExitRecycle"
    }, {
      text = SHOP_RECYCLE__WELCOME_RECYCLE,
      next = "RecycleTopBefore"
    }, {
      text = SHOP_RECYCLE__WELCOME_HELP,
      next = "RecycleHelp"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopRecycleLoop()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_RECYCLE__SERIES, nil, {cursorReset = true}, {
      next = "ExitRecycle"
    }, {
      text = SHOP_RECYCLE__SERIES_RECYCLE,
      next = "RecycleTopBefore"
    }, {
      text = SHOP_RECYCLE__SERIES_HELP,
      next = "RecycleHelp"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.RecycleTopBefore()
    if shopIns:IsSetLossLeaderItem() then
      if FlowSys.Stat.TalkFirst then
        shopIns:SetTalkOnce(true)
        if shopIns:IsLossLeaderLastDays() then
          ShopSys:Talk(SHOP_RECYCLE__RECYCLE_SPECIAL_LAST, nil)
        else
          ShopSys:Talk(SHOP_RECYCLE__RECYCLE_SPECIAL_INTO, nil)
        end
      else
        ShopSys:Talk(SHOP_RECYCLE__RECYCLE_INTO, nil)
      end
    else
      ShopSys:Talk(SHOP_RECYCLE__RECYCLE_INTO, nil)
    end
    FlowSys.Stat.TalkFirst = false
    FlowSys:Next("RecycleTop")
  end
  local function upWallBoarOpen()
    WallPaperSetup()
    gRecycleParameter.infoTitle = MENU:CreateBoardMenuWindow(ScreenType.A)
    gRecycleParameter.infoTitle:SetOption({showBgFrame = false})
    gRecycleParameter.infoTitle:SetFontType(FontType.TYPE_16)
    gRecycleParameter.infoTitle:SetTextOffset(32, 24)
    gRecycleParameter.infoTitle:SetLayoutRect(Rectangle(0, 0, 0, 0))
    gRecycleParameter.infoListHead = MENU:CreateBoardMenuWindow(ScreenType.A)
    gRecycleParameter.infoListHead:SetOption({showBgFrame = false})
    gRecycleParameter.infoListHead:SetFontType(FontType.TYPE_12)
    gRecycleParameter.infoListHead:SetTextOffset(240, 40)
    gRecycleParameter.infoListHead:SetLayoutRect(Rectangle(0, 0, 0, 0))
    gRecycleParameter.infoList = MENU:CreateBoardMenuWindow(ScreenType.A)
    gRecycleParameter.infoList:SetOption({showBgFrame = false})
    gRecycleParameter.infoList:SetFontType(FontType.TYPE_12)
    gRecycleParameter.infoList:SetTextOffset(0, 64)
    gRecycleParameter.infoList:SetLayoutRect(Rectangle(0, 0, 0, 0))
    OpenWallpaper()
    gRecycleParameter.infoTitle:Open()
    gRecycleParameter.infoListHead:Open()
    gRecycleParameter.infoList:Open()
  end
  local function upWallBoarClose()
    CloseWallpaper()
    gRecycleParameter.infoTitle:Close()
    gRecycleParameter.infoListHead:Close()
    gRecycleParameter.infoList:Close()
  end
  function FlowSys.Proc.RecycleTop()
    WINDOW:CloseMessage()
    selectItemId = 0
    upWallBoarOpen()
    DispRecycleShopSelectMenu(shopIns, function()
      FlowSys:Next("CheckRexycleItem")
    end, function()
      FlowSys:Next("MenuTopRecycleLoop")
    end, function()
      FlowSys:Next("RecycleItemGuide", "RecycleTop")
    end, function(goods)
      local index = goods:GetIndex()
      gRecycleParameter.infoTitle:SetText(shopIns:GetText_RecycleDataTitle(index))
      gRecycleParameter.infoListHead:SetText(SHOP_PRG_MSG__RECYCLE_TITLE)
      gRecycleParameter.infoList:SetText(shopIns:GetText_RecycleDataList(index))
      gRecycleParameter.itemIndex = index
    end)
    upWallBoarClose()
  end
  function FlowSys.Proc.RecycleItemGuide(nextFlow)
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispItemGuide()
    CommonSys:EndLowerMenuNavi(true)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.CheckRexycleItem()
    if ShopSys:CheckBagFull() == true then
      ShopSys:Talk(SHOP_RECYCLE__RECYCLE_BAG_MAX)
      FlowSys:Next("RecycleTop")
    else
      FlowSys:Next("CheckRecycle")
    end
  end
  function FlowSys.Proc.CheckRecycle()
    selectItemId = ShopSys:GetSelectItemId()
    if shopIns:IsNonTypeItems(selectItemId) then
      FlowSys:Next("SelectNonTypeItems")
    elseif shopIns:CheckEnoughItem(selectItemId) then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", shopIns:GetText_RecycleItemName(selectItemId))
      ShopSys:TalkAskFlowNoClose(SHOP_RECYCLE__BUY_CONFIRM_PLURAL, nil, nil, {next = "RecycleTop"}, {
        text = SHOP_RECYCLE__BUY_CONFIRM_PLURAL_YES,
        next = "Trade",
        default = true
      }, {text = SHOP_RECYCLE__BUY_CONFIRM_PLURAL_NO, next = "RecycleTop"})
    else
      ShopSys:Talk(SHOP_RECYCLE__RECYCLE_NO_ITEM, nil)
      FlowSys:Next("RecycleTop")
    end
  end
  function FlowSys.Proc.SelectNonTypeItems()
    ShopSys:Talk(SHOP_RECYCLE__RECYCLE_SELECT, nil)
    if ShopSys:CheckWarehouseEmptyItem() == true then
      ShopSys:Talk(SHOP_RECYCLE__RECYCLE_BOX_NO_ITEM, nil)
      FlowSys:Next("RecycleTop")
      return
    end
    FlowSys:Next("DrawItemHandling_Init")
  end
  function FlowSys.Proc.DrawItemHandling_Init()
    WINDOW:CloseMessage()
    gRecycleParameter.itemHandlingIn = true
    gRecycleParameter.itemHandlingOut = false
    FlowSys:Next("DrawItemHandling")
  end
  function FlowSys.Proc.DrawItemHandling()
    upWallBoarOpen()
    gRecycleParameter.infoTitle:SetText(shopIns:GetText_RecycleDataTitle(gRecycleParameter.itemIndex))
    gRecycleParameter.infoListHead:SetText(SHOP_PRG_MSG__RECYCLE_TITLE)
    gRecycleParameter.infoList:SetText(shopIns:GetText_RecycleDataList(gRecycleParameter.itemIndex))
    if gRecycleParameter.itemHandlingIn == true then
      gRecycleParameter.itemHandlingIn = false
      gRecycleParameter.resumeShopSysData = ShopSys:Suspend()
      ShopSys:Start()
    end
    local nextFlow1 = "DrawItemHandling_ActCheck"
    local nextFlow2
    DispDrawSelectMenuRecycle(function()
      gRecycleParameter.itemHandlingOut = true
      nextFlow1 = "DrawItemHandling_ActCheck"
    end, function()
      gRecycleParameter.itemHandlingOut = true
      nextFlow1 = "DrawItemHandling_Cancel"
    end, function()
      nextFlow1 = "DrawItemHandling_ItemGuide"
      nextFlow2 = "DrawItemHandling"
    end, function()
    end, SHOP_RECYCLE__CAPTION_BOX, SHOP_RECYCLE__RECYCLE_MULTI_SELECT_ACTION, SHOP_RECYCLE__RECYCLE_MULTI_SELECT_EXPLAIN, shopIns:GetChangeItemMax(selectItemId))
    if gRecycleParameter.itemHandlingOut == true then
      gRecycleParameter.itemHandlingOut = false
      gRecycleParameter.selectGoodsTbl = ShopSys:GetSelectGoodsTbl()
      ShopSys:Finish()
      ShopSys:Resume(gRecycleParameter.resumeShopSysData)
    end
    FlowSys:Next(nextFlow1, nextFlow2)
    upWallBoarClose()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.DrawItemHandling_ActCheck()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\229\149\134\229\147\129", shopIns:GetText_RecycleItemName(selectItemId))
    ShopSys:TalkAskFlowNoClose(SHOP_RECYCLE__RECYCLE_CONFIRM, nil, {cursorReset = true}, {
      next = "DrawItemHandling_Act_No"
    }, {
      text = SHOP_RECYCLE__RECYCLE_CONFIRM_YES,
      next = "DrawItemHandling_Act_Yes",
      default = true
    }, {
      text = SHOP_RECYCLE__RECYCLE_CONFIRM_NO,
      next = "DrawItemHandling_Act_No"
    })
  end
  function FlowSys.Proc.DrawItemHandling_Act_No()
    ShopSys:Talk(SHOP_RECYCLE__RECYCLE_CONFIRM_RE_SELECT, nil)
    FlowSys:Next("DrawItemHandling_Init")
  end
  function FlowSys.Proc.DrawItemHandling_ItemGuide(nextFlow)
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispItemGuide()
    CommonSys:EndLowerMenuNavi(true)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.DrawItemHandling_Cancel()
    ShopSys:Talk(SHOP_RECYCLE__RECYCLE_SELECT_CANCEL, nil)
    FlowSys:Next("RecycleTop")
  end
  function FlowSys.Proc.DrawItemHandling_Act_Yes()
    GROUND:SetRecycleItemToBag(selectItemId, 1)
    for i, item in ipairs(gRecycleParameter.selectGoodsTbl) do
      GROUND:DrawOutItemWarehouseToDelete(item.warehouseItemIndex, 1)
    end
    SOUND:PlaySe(SymSnd("SE_EVT_HAND"), Volume(256))
    ShopSys:Talk(SHOP_RECYCLE__RECYCLE_THANKS, nil)
    ShopSys:SetSelectGoodsTbl(nil)
    FlowSys:Next("RecycleTop")
  end
  function DispDrawSelectMenuRecycle(drawAct, cancelAct, expretionAct, numberAct, ShopListTitle, drawActMes, expretionActMes, _maxCount)
    ShopSys:SetSelectGoodsTbl(nil)
    local function drawAction(self)
      drawAct()
    end
    local disableFilter = function(bagMenu, item)
      return false
    end
    local function grayoutDrawFlt(bagMenu, item)
      local nowCount = 0
      local maxCount = _maxCount
      local selectCount = 0
      if bagMenu:IsMultiSelect() then
        for selItem in bagMenu:EnumerateSelectedItems() do
          selectCount = 1 + selectCount
        end
      end
      if maxCount <= nowCount + selectCount then
        return false
      else
        return true
      end
      return false
    end
    ShopSys:DispBasicItemBagMenu({
      titleText = ShopListTitle,
      padHelpMainText = SHOP_RECYCLE__MANUAL_BOX,
      enumItemFunc = function()
        return coroutine.wrap(function()
          for v in GROUND:EnumerateItemWarehouseItemIndex() do
            if ITEM:GetItemKind(v) ~= ITEM_KIND.KIND_KENZAI then
              coroutine.yield({warehouseItemIndex = v, warehouseItemCount = 0})
            end
          end
        end)
      end,
      itemTextFunc = function(item)
        MENU:SetTag_ItemIndex(0, item.warehouseItemIndex)
        MENU:SetTag_Value(1, item.warehouseItemCount)
        MENU:SetTag_Value(2, GROUND:GetItemWarehouseItemNowCount(item.warehouseItemIndex))
        return MENU:ReplaceTagText("[S:8][item_b:0][RT][IS][value_s_b:2:3][IE]")
      end,
      itemLineHelpFunc = function(item)
        return ITEM:GetItemOneLineExplainTextFromItemIndex(item.warehouseItemIndex)
      end,
      itemHelpFunc = function(item)
        return ITEM:GetItemExplainTextIdFromItemIndex(item.warehouseItemIndex)
      end,
      itemEqualFunc = function(item1, item2)
        return false
      end,
      commandItems = {
        {
          text = drawActMes,
          action = function(self)
            drawAction(self)
          end,
          isCloseShopMenu = true,
          disableFilter = disableFilter,
          grayoutFilter = grayoutDrawFlt
        },
        {
          text = expretionActMes,
          action = function(self)
            expretionAct()
          end,
          isCloseShopMenu = true,
          isSingleOnly = true
        }
      },
      cancelAct = function()
        cancelAct()
      end,
      checkMultiSelectOkItemFunc = function(bagMenu, item)
        local nowCount = 0
        local maxCount = _maxCount
        local selectCount = 0
        local addCount = 1
        if bagMenu:IsMultiSelect() then
          for selItem in bagMenu:EnumerateSelectedItems() do
            selectCount = 1 + selectCount
          end
        end
        if maxCount < nowCount + selectCount + addCount then
          bagMenu:SetEffect("shake_recycleCoun")
        end
        return maxCount >= nowCount + selectCount + addCount
      end,
      calcDiffBagCountFunc = function(bagMenu)
        local addCount = 0
        if bagMenu:IsMultiSelect() then
          for selItem in bagMenu:EnumerateSelectedItems() do
            addCount = addCount + 1
          end
        end
        return addCount
      end,
      isMultiSelect = true,
      isDispRecycleCountWindow = true,
      numRecycleMax = _maxCount
    })
  end
  function FlowSys.Proc.Trade()
    shopIns:TradeRecycleItem(selectItemId)
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\229\149\134\229\147\129", shopIns:GetText_RecycleItemName(selectItemId))
    SOUND:PlaySe(SymSnd("SE_EVT_HAND"), Volume(256))
    ShopSys:Talk(SHOP_RECYCLE__RECYCLE_THANKS)
    FlowSys:Next("RecycleTop")
  end
  function FlowSys.Proc.RecycleHelp()
    ShopSys:Talk(SHOP_RECYCLE__HELP, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopRecycleLoop")
  end
  function FlowSys.Proc.ExitRecycle()
    ShopSys:Talk(SHOP_RECYCLE__EXIT, nil)
    FlowSys:Next("RecycleEnd")
  end
  function FlowSys.Proc.RecycleEnd()
    FlowSys:Return()
  end
  FlowSys.Stat.TalkFirst = true
  FlowSys:Call("MenuTopRecycle")
  WINDOW:CloseMessage()
  FlowSys:Finish()
  ShopSys:Finish()
end
function DispRecycleShopSelectMenu(shopIns, buyAct, cancelAct, expretionAct, updateUpMenu)
  ShopSys:DispBasicShopGoodsMenu({
    titleText = SHOP_RECYCLE__CAPTION_RECYCLE,
    padHelpMainText = SHOP_RECYCLE__MANUAL_RECYCLE,
    enumGoodsFunc = function()
      return shopIns:EnumerateRecycleShopItems()
    end,
    goodsTextFunc = function(goods)
      return goods:GetItemText_RecycleShopItem()
    end,
    goodsLineHelpFunc = function(goods)
      updateUpMenu(goods)
      return goods:GetItemOneLineExplainText()
    end,
    commandItems = {
      {
        text = SHOP_RECYCLE__RECYCLE_SELECT_BUY,
        action = function()
          buyAct()
        end,
        isCloseShopMenu = true
      },
      {
        text = SHOP_RECYCLE__RECYCLE_SELECT_EXPLAIN,
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
    isDispBagCountAndMoneyWindow = false,
    isDispBagCountWindow = true
  })
end

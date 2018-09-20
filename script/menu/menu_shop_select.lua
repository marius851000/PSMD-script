dofile("script/menu/menu_shop_main_sellf_low.lua")
function OpenBrokenSelectShopMenu(resumeFlow, resumeArgTbl)
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  function FlowSys.Proc.FadeIn()
    SCREEN_A:FadeOut(TimeSec(0), false)
    SCREEN_B:FadeOut(TimeSec(0), false)
    SCREEN_A:FadeIn(TimeSec(0.3), false)
    SCREEN_B:FadeIn(TimeSec(0.3), true)
    FlowSys:Return()
  end
  FlowSys:Call("FadeIn")
  FlowSys:Finish()
  ShopSys:Finish()
end
function OpenShopSelectMenu(shopIns)
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  local reloadEntryAndResumeFlow = function(resumeFlow, resumeArgTbl)
    GROUND:SetLandShopSceneContinueFunction(function()
      OpenBrokenSelectShopMenu(resumeFlow, resumeArgTbl)
    end)
    FLAG.MapMoveNoFade = CONST.FLAG_TRUE
    SYSTEM:ReloadLandEntry()
  end
  ShopSys.shopping_ratioBuy = shopIns:GetBuyRate()
  ShopSys.shopping_ratioSell = shopIns:GetSellRate()
  function FlowSys.Proc.TopCheckShutOpShop()
    SYSTEM:ExecuteTutorialHint(SymHint("SHOP_SELECT_FIRST"))
    if shopIns:IsCloseOutSale() then
      FlowSys:Next("MenuTopCloseoutSale")
      return
    end
    FlowSys:Next("MenuTopFirst")
  end
  function FlowSys.Proc.MenuTopFirst()
    ShopSys:SetSelectGoodsTbl(nil)
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", shopIns:GetOwnerName())
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_SELECT__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "Exit"}, {
      text = SHOP_SELECT__WELCOME_BUY,
      next = "TopBuyBefore"
    }, {text = SHOP_SELECT__WELCOME_SELL, next = "TopSell"}, {text = SHOP_SELECT__WELCOME_SELL_ALL, next = "SellAll"}, {text = SHOP_SELECT__WELCOME_HELP, next = "Help"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopCloseoutSale()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_SELECT__CLOSE_DOWN, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "Exit"}, {
      text = SHOP_SELECT__CLOSE_DOWN_BUY,
      next = "TopBuyBefore"
    }, {text = SHOP_SELECT__CLOSE_DOWN_SELL, next = "TopSell"}, {text = SHOP_SELECT__CLOSE_DOWN_SELL_ALL, next = "SellAll"}, {text = SHOP_SELECT__CLOSE_DOWN_HELP, next = "Help"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopLoop()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_SELECT__SERIES, nil, {cursorReset = true}, {next = "Exit"}, {
      text = SHOP_SELECT__SERIES_BUY,
      next = "TopBuyBefore"
    }, {text = SHOP_SELECT__SERIES_SELL, next = "TopSell"}, {text = SHOP_SELECT__SERIES_SELL_ALL, next = "SellAll"}, {text = SHOP_SELECT__SERIES_HELP, next = "Help"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.TopBuyBefore()
    if shopIns:CheckLineup() == false then
      ShopSys:Talk(SHOP_SELECT__SOLDOUT, nil)
      FlowSys:Next("MenuTopLoop")
      return
    end
    ShopSys:Talk(SHOP_SELECT__BUY_INTO, nil)
    FlowSys:Next("TopBuy")
  end
  function FlowSys.Proc.TopBuy()
    WINDOW:CloseMessage()
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispSelectShopSelectMenu(shopIns, function()
      CommonSys:EndLowerMenuNavi(true)
      FlowSys:Next("Buy")
    end, function()
      CommonSys:EndLowerMenuNavi(true)
      FlowSys:Next("MenuTopLoop")
    end, function()
      FlowSys:Next("ItemGuide", "TopBuy")
    end, SHOP_SELECT__CAPTION_BUY, SHOP_SELECT__BUY_SELECT_BUY, SHOP_SELECT__BUY_SELECT_EXPLAIN)
  end
  function FlowSys.Proc.ItemGuide(nextFlow)
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispItemGuide()
    CommonSys:EndLowerMenuNavi(true)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.Buy()
    if ShopSys:CheckBuyablePrice() == false then
      ShopSys:Talk(SHOP_SELECT__BUY_NO_MONEY, nil)
      FlowSys:Next("TopBuy")
      return
    end
    if ShopSys:CheckBagOver() == true then
      ShopSys:Talk(SHOP_SELECT__BUY_NO_ITEMMAX, nil)
      FlowSys:Next("TopBuy")
      return
    end
    FlowSys:Next("ManyBuy")
  end
  function FlowSys.Proc.ManyBuy()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", ShopSys:GetSelectItemName())
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", ShopSys:GetBuyPriceText())
    if ShopSys:CheckMultiSelect() == true then
      ShopSys:TalkAskFlowNoClose(SHOP_SELECT__BUY_CONFIRM_PLURAL, nil, nil, {next = "TopBuy"}, {
        text = SHOP_SELECT__BUY_CONFIRM_PLURAL_YES,
        next = "Payment",
        default = true
      }, {text = SHOP_SELECT__BUY_CONFIRM_PLURAL_NO, next = "TopBuy"})
    else
      ShopSys:TalkAskFlowNoClose(SHOP_SELECT__BUY_CONFIRM, nil, nil, {next = "TopBuy"}, {
        text = SHOP_SELECT__BUY_CONFIRM_YES,
        next = "Payment",
        default = true
      }, {text = SHOP_SELECT__BUY_CONFIRM_NO, next = "TopBuy"})
    end
  end
  function FlowSys.Proc.Payment()
    ShopSys:Buy()
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:Talk(SHOP_SELECT__BUY_THANKS)
    FlowSys:Next("SoldOut")
  end
  function FlowSys.Proc.SoldOut()
    if shopIns:CheckLineup() == false then
      ShopSys:Talk(SHOP_SELECT__BUY_SOLDOUT, nil)
      FlowSys:Next("MenuTopLoop")
      return
    end
    if ShopSys:CheckMultiSelect() == true then
      FlowSys:Next("MenuTopLoop")
      return
    end
    if ShopSys:CheckBagFull() then
      FlowSys:Next("MenuTopLoop")
      return
    end
    ShopSys:TalkAskFlowNoClose(SHOP_SELECT__BUY_SERIES, nil, nil, {
      next = "MenuTopLoop"
    }, {text = SHOP_SELECT__BUY_SERIES_YES, next = "TopBuy"}, {
      text = SHOP_SELECT__BUY_SERIES_NO,
      next = "MenuTopLoop"
    })
  end
  SetupCommonFlow_ShopSellFlow({
    TEXT_SELL_ITEM_SELECT = SHOP_SELECT__SELL_ITEM_SELECT,
    TEXT_SELL_ALL = SHOP_SELECT__SELL_ALL,
    TEXT_SELL_ALL_YES = SHOP_SELECT__SELL_ALL_YES,
    TEXT_SELL_ALL_NO = SHOP_SELECT__SELL_ALL_NO,
    TEXT_SELL_NO_ITEM = SHOP_SELECT__SELL_NO_ITEM,
    TEXT_SELL_NO_SELLITEM = SHOP_SELECT__SELL_NO_SELLITEM,
    TEXT_SELL_MAX_MONEY = SHOP_SELECT__SELL_MAX_MONEY,
    TEXT_SELL_ALL_BANK = SHOP_SELECT__SELL_ALL_BANK,
    TEXT_SELL_MAX_BANK = SHOP_SELECT__SELL_MAX_BANK,
    TEXT_SELL_MAX_BANK_YES = SHOP_SELECT__SELL_MAX_BANK_YES,
    TEXT_SELL_MAX_BANK_NO = SHOP_SELECT__SELL_MAX_BANK_NO,
    TEXT_SELL_MAX_THANKS = SHOP_SELECT__SELL_MAX_THANKS,
    TEXT_CAPTION_SELL = SHOP_SELECT__CAPTION_SELL,
    TEXT_SELL_SELECT_SELL = SHOP_SELECT__SELL_SELECT_SELL,
    TEXT_SELL_SELECT_EXPLAIN = SHOP_SELECT__SELL_SELECT_EXPLAIN,
    TEXT_SELL_CONFIRM_PLURAL = SHOP_SELECT__SELL_CONFIRM_PLURAL,
    TEXT_SELL_CONFIRM_PLURAL_YES = SHOP_SELECT__SELL_CONFIRM_PLURAL_YES,
    TEXT_SELL_CONFIRM_PLURAL_NO = SHOP_SELECT__SELL_CONFIRM_PLURAL_NO,
    TEXT_SELL_CONFIRM_NO_SELLITEM = SHOP_SELECT__SELL_CONFIRM_NO_SELLITEM,
    TEXT_SELL_CONFIRM = SHOP_SELECT__SELL_CONFIRM,
    TEXT_SELL_CONFIRM_YES = SHOP_SELECT__SELL_CONFIRM_YES,
    TEXT_SELL_CONFIRM_NO = SHOP_SELECT__SELL_CONFIRM_NO,
    TEXT_SELL_MAX_MONEY_TO_BANK = SHOP_SELECT__SELL_MAX_MONEY_TO_BANK,
    TEXT_SELL_MAX_BANK = SHOP_SELECT__SELL_MAX_BANK,
    TEXT_SELL_MAX_BANK_YES = SHOP_SELECT__SELL_MAX_BANK_YES,
    TEXT_SELL_MAX_BANK_NO = SHOP_SELECT__SELL_MAX_BANK_NO,
    TEXT_SELL_MAX_THANKS = SHOP_SELECT__SELL_MAX_THANKS,
    TEXT_SELL_THANKS = SHOP_SELECT__SELL_THANKS,
    TEXT_SELL_SERIES = SHOP_SELECT__SELL_SERIES,
    TEXT_SELL_SERIES_YES = SHOP_SELECT__SELL_SERIES_YES,
    TEXT_SELL_SERIES_NO = SHOP_SELECT__SELL_SERIES_NO
  })
  function FlowSys.Proc.Help()
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", shopIns:GetOwnerName())
    ShopSys:Talk(SHOP_SELECT__HELP, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.Exit()
    ShopSys:Talk(SHOP_SELECT__EXIT, nil)
    FlowSys:Return()
  end
  FlowSys:Call("TopCheckShutOpShop")
  FlowSys:Finish()
  ShopSys:Finish()
end
function SelectShopClose()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  TASK:Sleep(TimeSec(0))
  local PosShopStaff = CH(GROUND__2:GetBrokenSelectShopLabel()):GetPosition()
  PosShopStaff.y = CH(GROUND__2:GetBrokenSelectShopLabel()):GetGroundHeight()
  EFFECT:Create("effectKogarashi", SymEff("EV_WIND_SAD"))
  EFFECT:SetPosition("effectKogarashi", PosShopStaff)
  CAMERA:SetTgtAndFreeMoveEye(CH(GROUND__2:GetBrokenSelectShopLabel()))
  CAMERA:Zoom(Distance(5), TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  SOUND:FadeOutBgm(TimeSec(0.3))
  SCREEN_A:FadeIn(TimeSec(0.3), false)
  SCREEN_B:FadeIn(TimeSec(0.3), false)
  SCREEN_A:FadeInAll(TimeSec(0.3), false)
  SCREEN_B:FadeInAll(TimeSec(0.3), false)
  TASK:Sleep(TimeSec(2))
  SCREEN_A:FadeOut(TimeSec(0.3), false)
  SCREEN_B:FadeOut(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(1))
  CAMERA:Zoom(Distance(10), TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  SCREEN_A:FadeIn(TimeSec(0.3), false)
  SCREEN_B:FadeIn(TimeSec(0.3), false)
  TASK:Sleep(TimeSec(3))
  SOUND:PlaySe(SymSnd("SE_SHOP_CLOSE_WIND"))
  EFFECT:Play("effectKogarashi")
  TASK:Sleep(TimeSec(2))
  ShopSys:SysMsg(SHOP_SELECT__CLOSE_DOWN_NOTE)
  WINDOW:CloseMessage()
  EFFECT:Remove("effectKogarashi")
  SCREEN_A:FadeOut(TimeSec(0.3), false)
  SCREEN_B:FadeOut(TimeSec(0.3), true)
  FlowSys:Finish()
  ShopSys:Finish()
end
function DispSelectShopSelectMenu(shopIns, buyAct, cancelAct, expretionAct, ShopListTitle, buyActMes, expretionActMes)
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
    padHelpMainText = SHOP_SELECT__MANUAL_BUY,
    enumGoodsFunc = function()
      return shopIns:EnumerateShopItems()
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
    end,
    checkMultiSelectOkItemFunc = function(bagMenu, item)
      local nowCount = GROUND:GetBagItemCount()
      local maxCount = GROUND:GetBagItemMaxCount()
      local selectCount = 0
      local nowMoney = GROUND:GetPlayerMoney()
      local selectPrice = 0
      if bagMenu:IsMultiSelect() then
        for selItem in bagMenu:EnumerateSelectedItems() do
          selectCount = 1 + selectCount
        end
        for selItem in bagMenu:EnumerateSelectedItems() do
          selectPrice = selectPrice + ShopSys:GetBuyPrice(selItem)
        end
      end
      if maxCount < nowCount + selectCount then
        bagMenu:SetEffect("shake_bagCount")
        return false
      end
      if nowMoney < selectPrice then
        bagMenu:SetEffect("shake_money")
        return false
      end
      return true
    end
  })
end

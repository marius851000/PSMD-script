dofile("script/menu/menu_shop_main_sellf_low.lua")
function OpenShopSpecialMerchantMenu(shopIns)
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  FlowSys.Stat.TalkFirst = true
  function FlowSys.Proc.MenuTopFirst()
    SYSTEM:ExecuteTutorialHint(SymHint("SHOP_SPECIAL_FIRST"))
    ShopSys:SetSelectGoodsTbl(nil)
    ShopSys:SetShopTag("\229\176\130\233\150\128\229\186\151\229\144\141", shopIns:GetShopName())
    local SpecialMerchantType = shopIns:GetShopLabel()
    if SpecialMerchantType == "shop_special_merchant_plant" then
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__WELCOME_SEED_BEFORE, nil)
      WINDOW:CloseMessage()
      CommonSys:OpenBasicMenu(nil, -1733859855, nil)
      ShopSys:TalkAskFlowNoClose(SHOP_SPECIAL_MERCHANT__WELCOME_SEED, FACE_TYPE.NORMAL, {cursorReset = true}, {
        next = "ExitMerchant"
      }, {
        text = SHOP_SPECIAL_MERCHANT__WELCOME_BUY,
        next = "TopBuyBefore"
      }, {text = SHOP_SPECIAL_MERCHANT__WELCOME_SELL, next = "TopSell"}, {text = SHOP_SPECIAL_MERCHANT__WELCOME_SELL_ALL, next = "SellAll"}, {text = SHOP_SPECIAL_MERCHANT__WELCOME_HELP, next = "Help"})
    elseif SpecialMerchantType == "shop_special_merchant_orb" then
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__WELCOME_BEFORE, nil)
      WINDOW:CloseMessage()
      CommonSys:OpenBasicMenu(nil, -1733859855, nil)
      ShopSys:TalkAskFlowNoClose(SHOP_SPECIAL_MERCHANT__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {
        next = "ExitMerchant"
      }, {
        text = SHOP_SPECIAL_MERCHANT__WELCOME_BUY,
        next = "TopBuyBefore"
      }, {text = SHOP_SPECIAL_MERCHANT__WELCOME_SELL, next = "TopSell"}, {text = SHOP_SPECIAL_MERCHANT__WELCOME_SELL_ALL, next = "SellAll"}, {text = SHOP_SPECIAL_MERCHANT__WELCOME_HELP, next = "Help"})
    end
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopLoop()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_SPECIAL_MERCHANT__SERIES, nil, {cursorReset = true}, {
      next = "ExitMerchant"
    }, {
      text = SHOP_SPECIAL_MERCHANT__SERIES_BUY,
      next = "TopBuyBefore"
    }, {text = SHOP_SPECIAL_MERCHANT__SERIES_SELL, next = "TopSell"}, {text = SHOP_SPECIAL_MERCHANT__SERIES_SELL_ALL, next = "SellAll"}, {text = SHOP_SPECIAL_MERCHANT__SERIES_HELP, next = "Help"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.TopBuyBefore()
    if ShopSys:CheckLineup() == false then
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__SOLDOUT, nil)
      FlowSys:Next("MenuTopLoop")
      return
    end
    if shopIns:CheckExistFeaturedProductItem() == true then
      if FlowSys.Stat.TalkFirst then
        if shopIns:CheckFeaturedProductItemLasyDay() == true then
          ShopSys:Talk(SHOP_SPECIAL_MERCHANT__BUY_SPECIAL_LAST, nil)
        else
          ShopSys:Talk(SHOP_SPECIAL_MERCHANT__BUY_SPECIAL_INTO, nil)
        end
      else
        ShopSys:Talk(SHOP_SPECIAL_MERCHANT__BUY_INTO, nil)
      end
    else
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__BUY_INTO, nil)
    end
    FlowSys.Stat.TalkFirst = false
    FlowSys:Next("TopBuy")
  end
  function FlowSys.Proc.TopBuy()
    WINDOW:CloseMessage()
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispShopSelectMenu(function()
      CommonSys:EndLowerMenuNavi(true)
      FlowSys:Next("Buy")
    end, function()
      CommonSys:EndLowerMenuNavi(true)
      FlowSys:Next("MenuTopLoop")
    end, function()
      FlowSys:Next("ItemGuide", "TopBuy")
    end, SHOP_SPECIAL_MERCHANT__CAPTION_BUY, SHOP_SPECIAL_MERCHANT__BUY_SELECT_BUY, SHOP_SPECIAL_MERCHANT__BUY_SELECT_EXPLAIN)
  end
  function FlowSys.Proc.ItemGuide(nextFlow)
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispItemGuide()
    CommonSys:EndLowerMenuNavi(true)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.Buy()
    if ShopSys:CheckBuyablePrice() == false then
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__BUY_NO_MONEY, nil)
      FlowSys:Next("TopBuy")
      return
    end
    if ShopSys:CheckBagOver() == true then
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__BUY_NO_ITEMMAX, nil)
      FlowSys:Next("TopBuy")
      return
    end
    FlowSys:Next("ManyBuy")
  end
  function FlowSys.Proc.ManyBuy()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", ShopSys:GetSelectItemName())
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", ShopSys:GetBuyPriceText())
    if ShopSys:CheckMultiSelect() == true then
      ShopSys:TalkAskFlowNoClose(SHOP_SPECIAL_MERCHANT__BUY_CONFIRM_PLURAL, nil, nil, {next = "TopBuy"}, {text = SHOP_SPECIAL_MERCHANT__BUY_CONFIRM_PLURAL_YES, next = "Payment"}, {
        text = SHOP_SPECIAL_MERCHANT__BUY_CONFIRM_PLURAL_NO,
        next = "TopBuy",
        default = true
      })
    else
      ShopSys:TalkAskFlowNoClose(SHOP_SPECIAL_MERCHANT__BUY_CONFIRM, nil, nil, {next = "TopBuy"}, {text = SHOP_SPECIAL_MERCHANT__BUY_CONFIRM_YES, next = "Payment"}, {
        text = SHOP_SPECIAL_MERCHANT__BUY_CONFIRM_NO,
        next = "TopBuy",
        default = true
      })
    end
  end
  function FlowSys.Proc.Payment()
    ShopSys:Buy()
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:Talk(SHOP_SPECIAL_MERCHANT__BUY_THANKS)
    FlowSys:Next("SoldOut")
  end
  function FlowSys.Proc.SoldOut()
    if ShopSys:CheckLineup() == false then
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__BUY_SOLDOUT, nil)
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
    ShopSys:TalkAskFlowNoClose(SHOP_SPECIAL_MERCHANT__BUY_SERIES, nil, nil, {
      next = "MenuTopLoop"
    }, {text = SHOP_SPECIAL_MERCHANT__BUY_SERIES_YES, next = "TopBuy"}, {
      text = SHOP_SPECIAL_MERCHANT__BUY_SERIES_NO,
      next = "MenuTopLoop"
    })
  end
  SetupCommonFlow_ShopSellFlow({
    TEXT_SELL_ITEM_SELECT = SHOP_SPECIAL_MERCHANT__SELL_ITEM_SELECT,
    TEXT_SELL_ALL = SHOP_SPECIAL_MERCHANT__SELL_ALL,
    TEXT_SELL_ALL_YES = SHOP_SPECIAL_MERCHANT__SELL_ALL_YES,
    TEXT_SELL_ALL_NO = SHOP_SPECIAL_MERCHANT__SELL_ALL_NO,
    TEXT_SELL_NO_ITEM = SHOP_SPECIAL_MERCHANT__SELL_NO_ITEM,
    TEXT_SELL_NO_SELLITEM = SHOP_SPECIAL_MERCHANT__SELL_NO_SELLITEM,
    TEXT_SELL_MAX_MONEY = SHOP_SPECIAL_MERCHANT__SELL_MAX_MONEY,
    TEXT_SELL_ALL_BANK = SHOP_SPECIAL_MERCHANT__SELL_ALL_BANK,
    TEXT_SELL_MAX_BANK = SHOP_SPECIAL_MERCHANT__SELL_MAX_BANK,
    TEXT_SELL_MAX_BANK_YES = SHOP_SPECIAL_MERCHANT__SELL_MAX_BANK_YES,
    TEXT_SELL_MAX_BANK_NO = SHOP_SPECIAL_MERCHANT__SELL_MAX_BANK_NO,
    TEXT_SELL_MAX_THANKS = SHOP_SPECIAL_MERCHANT__SELL_MAX_THANKS,
    TEXT_CAPTION_SELL = SHOP_SPECIAL_MERCHANT__CAPTION_SELL,
    TEXT_SELL_SELECT_SELL = SHOP_SPECIAL_MERCHANT__SELL_SELECT_SELL,
    TEXT_SELL_SELECT_EXPLAIN = SHOP_SPECIAL_MERCHANT__SELL_SELECT_EXPLAIN,
    TEXT_SELL_CONFIRM_PLURAL = SHOP_SPECIAL_MERCHANT__SELL_CONFIRM_PLURAL,
    TEXT_SELL_CONFIRM_PLURAL_YES = SHOP_SPECIAL_MERCHANT__SELL_CONFIRM_PLURAL_YES,
    TEXT_SELL_CONFIRM_PLURAL_NO = SHOP_SPECIAL_MERCHANT__SELL_CONFIRM_PLURAL_NO,
    TEXT_SELL_CONFIRM_NO_SELLITEM = SHOP_SPECIAL_MERCHANT__SELL_CONFIRM_NO_SELLITEM,
    TEXT_SELL_CONFIRM = SHOP_SPECIAL_MERCHANT__SELL_CONFIRM,
    TEXT_SELL_CONFIRM_YES = SHOP_SPECIAL_MERCHANT__SELL_CONFIRM_YES,
    TEXT_SELL_CONFIRM_NO = SHOP_SPECIAL_MERCHANT__SELL_CONFIRM_NO,
    TEXT_SELL_MAX_MONEY_TO_BANK = SHOP_SPECIAL_MERCHANT__SELL_MAX_MONEY_TO_BANK,
    TEXT_SELL_MAX_BANK = SHOP_SPECIAL_MERCHANT__SELL_MAX_BANK,
    TEXT_SELL_MAX_BANK_YES = SHOP_SPECIAL_MERCHANT__SELL_MAX_BANK_YES,
    TEXT_SELL_MAX_BANK_NO = SHOP_SPECIAL_MERCHANT__SELL_MAX_BANK_NO,
    TEXT_SELL_MAX_THANKS = SHOP_SPECIAL_MERCHANT__SELL_MAX_THANKS,
    TEXT_SELL_THANKS = SHOP_SPECIAL_MERCHANT__SELL_THANKS,
    TEXT_SELL_SERIES = SHOP_SPECIAL_MERCHANT__SELL_SERIES,
    TEXT_SELL_SERIES_YES = SHOP_SPECIAL_MERCHANT__SELL_SERIES_YES,
    TEXT_SELL_SERIES_NO = SHOP_SPECIAL_MERCHANT__SELL_SERIES_NO
  })
  function FlowSys.Proc.Help()
    ShopSys:SetShopTag("\229\176\130\233\150\128\229\186\151\229\144\141", shopIns:GetShopName())
    local SpecialMerchantType = shopIns:GetShopLabel()
    if SpecialMerchantType == "shop_special_merchant_plant" then
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__HELP_SPECIAL1, nil)
    elseif SpecialMerchantType == "shop_special_merchant_throw" then
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__HELP_SPECIAL2, nil)
    elseif SpecialMerchantType == "shop_special_merchant_orb" then
      ShopSys:Talk(SHOP_SPECIAL_MERCHANT__HELP_SPECIAL3, nil)
    end
    WINDOW:CloseMessage()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.ExitMerchant()
    ShopSys:Talk(SHOP_SPECIAL_MERCHANT__EXIT, nil)
    FlowSys:Next("TESTEND")
  end
  function FlowSys.Proc.TESTEND()
    FlowSys:Return()
  end
  FlowSys:Call("MenuTopFirst")
  WINDOW:CloseMessage()
  FlowSys:Finish()
  ShopSys:Finish()
end

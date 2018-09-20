function SetupCommonFlow_ShopSellFlow(optTbl)
  local needTextCheck = {
    "TEXT_SELL_ITEM_SELECT",
    "TEXT_SELL_ALL",
    "TEXT_SELL_ALL_YES",
    "TEXT_SELL_ALL_NO",
    "TEXT_SELL_NO_ITEM",
    "TEXT_SELL_NO_SELLITEM",
    "TEXT_SELL_MAX_MONEY",
    "TEXT_SELL_ALL_BANK",
    "TEXT_SELL_MAX_BANK",
    "TEXT_SELL_MAX_BANK_YES",
    "TEXT_SELL_MAX_BANK_NO",
    "TEXT_SELL_MAX_THANKS",
    "TEXT_CAPTION_SELL",
    "TEXT_SELL_SELECT_SELL",
    "TEXT_SELL_SELECT_EXPLAIN",
    "TEXT_SELL_CONFIRM_PLURAL",
    "TEXT_SELL_CONFIRM_PLURAL_YES",
    "TEXT_SELL_CONFIRM_PLURAL_NO",
    "TEXT_SELL_CONFIRM_NO_SELLITEM",
    "TEXT_SELL_CONFIRM",
    "TEXT_SELL_CONFIRM_YES",
    "TEXT_SELL_CONFIRM_NO",
    "TEXT_SELL_MAX_MONEY_TO_BANK",
    "TEXT_SELL_MAX_BANK",
    "TEXT_SELL_MAX_BANK_YES",
    "TEXT_SELL_MAX_BANK_NO",
    "TEXT_SELL_MAX_THANKS",
    "TEXT_SELL_THANKS",
    "TEXT_SELL_SERIES",
    "TEXT_SELL_SERIES_YES",
    "TEXT_SELL_SERIES_NO"
  }
  for i, text in ipairs(needTextCheck) do
    assert(optTbl[text], "\227\131\134\227\130\173\227\130\185\227\131\136\227\129\140\232\182\179\227\130\138\227\129\190\227\129\155\227\130\147" .. text)
  end
  function FlowSys.Proc.TopSell()
    if FlowSys:Call("CheckSellBefore", false) then
      return
    end
    ShopSys:Talk(optTbl.TEXT_SELL_ITEM_SELECT, nil)
    FlowSys:Next("SellMenu")
  end
  function FlowSys.Proc.SellAll()
    if FlowSys:Call("CheckSellBefore", true) then
      return
    end
    ShopSys:SelectAllBagGoods()
    ShopSys:SetShopTag("\229\144\136\232\168\136\229\163\178\229\141\180\233\161\141", ShopSys:GetSellPriceText())
    ShopSys:TalkAskFlowNoClose(optTbl.TEXT_SELL_ALL, nil, nil, {
      next = "MenuTopLoop"
    }, {
      text = optTbl.TEXT_SELL_ALL_YES,
      next = "CheckSellOverAll"
    }, {
      text = optTbl.TEXT_SELL_ALL_NO,
      next = "MenuTopLoop",
      default = true
    })
  end
  function FlowSys.Proc.CheckSellBefore(isAllSell)
    GROUND:ReduceBagMoney()
    if ShopSys:CheckBagEmpty() then
      ShopSys:Talk(optTbl.TEXT_SELL_NO_ITEM, nil)
      WINDOW:KeyWait()
      FlowSys:ReturnNext("MenuTopLoop")
      return
    end
    if ShopSys:CheckBagSellItemEmpty({isAllSell = isAllSell}) then
      ShopSys:Talk(optTbl.TEXT_SELL_NO_SELLITEM, nil)
      WINDOW:KeyWait()
      FlowSys:ReturnNext("MenuTopLoop")
      return
    end
    if ShopSys:CheckPlayerMoneyMax() then
      ShopSys:Talk(optTbl.TEXT_SELL_MAX_MONEY, nil)
      WINDOW:KeyWait()
      FlowSys:ReturnNext("MenuTopLoop")
      return
    end
    FlowSys:Return()
  end
  function FlowSys.Proc.CheckSellOverAll()
    if ShopSys:CheckSellMoneyPlayerOver() == false then
      FlowSys:Next("SellPayment")
      return
    end
    ShopSys:Talk(optTbl.TEXT_SELL_ALL_BANK, nil)
    if ShopSys:CheckSellMoneyPlayerAndBankOver() == false then
      FlowSys:Next("SellPayment")
      return
    end
    ShopSys:TalkAskFlowNoClose(optTbl.TEXT_SELL_MAX_BANK, nil, nil, {
      next = "MenuTopLoop"
    }, {
      text = optTbl.TEXT_SELL_MAX_BANK_YES,
      next = "SellPaymentAll"
    }, {
      text = optTbl.TEXT_SELL_MAX_BANK_NO,
      next = "MenuTopLoop",
      default = true
    })
  end
  function FlowSys.Proc.SellPaymentAll()
    ShopSys:Sell()
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:Talk(optTbl.TEXT_SELL_MAX_THANKS)
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.SellMenu()
    WINDOW:CloseMessage()
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispBagSelectMenu(function()
      CommonSys:EndLowerMenuNavi(true)
      FlowSys:Next("Sell")
    end, function()
      CommonSys:EndLowerMenuNavi(true)
      FlowSys:Next("MenuTopLoop")
    end, function()
      FlowSys:Next("ItemGuide", "SellMenu")
    end, optTbl.TEXT_CAPTION_SELL, optTbl.TEXT_SELL_SELECT_SELL, optTbl.TEXT_SELL_SELECT_EXPLAIN)
  end
  function FlowSys.Proc.Sell()
    if ShopSys:CheckMultiSelect() == true then
      ShopSys:SetShopTag("\229\144\136\232\168\136\229\163\178\229\141\180\233\161\141", ShopSys:GetSellPriceText())
      ShopSys:TalkAskFlowNoClose(optTbl.TEXT_SELL_CONFIRM_PLURAL, nil, nil, {
        next = "MenuTopLoop"
      }, {
        text = optTbl.TEXT_SELL_CONFIRM_PLURAL_YES,
        next = "CheckSellOver"
      }, {
        text = optTbl.TEXT_SELL_CONFIRM_PLURAL_NO,
        next = "MenuTopLoop",
        default = true
      })
      return
    end
    if ShopSys:CheckNotForSell() then
      ShopSys:Talk(optTbl.TEXT_SELL_CONFIRM_NO_SELLITEM, nil)
      FlowSys:Next("SellSeries")
      return
    end
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", ShopSys:GetSelectItemName())
    ShopSys:SetShopTag("\229\144\136\232\168\136\229\163\178\229\141\180\233\161\141", ShopSys:GetSellPriceText())
    ShopSys:TalkAskFlowNoClose(optTbl.TEXT_SELL_CONFIRM, nil, nil, {
      next = "MenuTopLoop"
    }, {
      text = optTbl.TEXT_SELL_CONFIRM_YES,
      next = "CheckSellOver"
    }, {
      text = optTbl.TEXT_SELL_CONFIRM_NO,
      next = "SellMenu",
      default = true
    })
  end
  function FlowSys.Proc.CheckSellOver()
    if ShopSys:CheckSellMoneyPlayerOver() == false then
      FlowSys:Next("SellPayment")
      return
    end
    ShopSys:Talk(optTbl.TEXT_SELL_MAX_MONEY_TO_BANK, nil)
    if ShopSys:CheckSellMoneyPlayerAndBankOver() == false then
      FlowSys:Next("SellPayment")
      return
    end
    ShopSys:TalkAskFlowNoClose(optTbl.TEXT_SELL_MAX_BANK, nil, nil, {
      next = "MenuTopLoop"
    }, {
      text = optTbl.TEXT_SELL_MAX_BANK_YES,
      next = "SellPayment"
    }, {
      text = optTbl.TEXT_SELL_MAX_BANK_NO,
      next = "MenuTopLoop",
      default = true
    })
  end
  function FlowSys.Proc.SellPayment()
    ShopSys:Sell()
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:Talk(optTbl.TEXT_SELL_THANKS)
    WINDOW:KeyWait()
    FlowSys:Next("CheckSellAfter")
  end
  function FlowSys.Proc.CheckSellAfter()
    if ShopSys:CheckMultiSelect() == true then
      FlowSys:Next("MenuTopLoop")
      return
    end
    if ShopSys:CheckBagSellItemEmpty({isAllSell = false}) then
      FlowSys:Next("MenuTopLoop")
      return
    end
    if ShopSys:CheckPlayerMoneyMax() then
      FlowSys:Next("MenuTopLoop")
      return
    end
    FlowSys:Next("SellSeries")
  end
  function FlowSys.Proc.SellSeries()
    ShopSys:TalkAskFlowNoClose(optTbl.TEXT_SELL_SERIES, nil, nil, {
      next = "MenuTopLoop"
    }, {
      text = optTbl.TEXT_SELL_SERIES_YES,
      next = "SellMenu",
      default = true
    }, {
      text = optTbl.TEXT_SELL_SERIES_NO,
      next = "MenuTopLoop"
    })
  end
end

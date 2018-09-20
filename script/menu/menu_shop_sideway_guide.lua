function OpenShopSideWayGuideMenu(shopIns)
  function OpenSidewayDungeonMenu()
    WINDOW:CloseMessage()
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    CommonSys:OpenBasicMenu(SHOP_SIDEWAY_GUIDE__CAPTION_LIST, SHOP_SIDEWAY_GUIDE__MANUAL_LIST, "")
    shopIns:CheckShopListOpen()
    local pageMenu = MENU:CreatePageMenu()
    pageMenu:SetLayoutRectAndLines(16, 40, 224, 8)
    pageMenu:ShowPageNum(true)
    for i = 0, shopIns:GetDundeonListCount() - 1 do
      pageMenu:AddItem(shopIns:GetDungeonNameText(i), i, nil)
    end
    function pageMenu:cancelAction()
      self:Close()
    end
    function pageMenu:decideAction()
      self:Close()
    end
    function pageMenu:openedAction()
      CommonSys:UpdateBasicMenu_LineHelp(shopIns:GetSidewayInfoText(self.curItem.obj))
    end
    function pageMenu:currentItemChange()
      CommonSys:UpdateBasicMenu_LineHelp(shopIns:GetSidewayInfoText(pageMenu:GetCursorItemIndex()))
    end
    pageMenu:Open()
    MENU:SetFocus(pageMenu)
    FlowSys:WaitCloseMenu(pageMenu)
    CommonSys:EndLowerMenuNavi(true)
    CommonSys:CloseBasicMenu()
  end
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  function FlowSys.Proc.MenuTopFirst()
    ShopSys:SetSelectGoodsTbl(nil)
    local level = shopIns:GetShopLevel()
    if level == 0 then
      CommonSys:OpenBasicMenu(nil, -1733859855, nil)
      ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "ExitShop"}, {text = SHOP_SIDEWAY_GUIDE__WELCOME_REMIND, next = "TopRemind"}, {text = SHOP_SIDEWAY_GUIDE__WELCOME_HELP, next = "Help"})
      CommonSys:CloseBasicMenu()
    elseif level == 1 then
      CommonSys:OpenBasicMenu(nil, -1733859855, nil)
      ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "ExitShop"}, {text = SHOP_SIDEWAY_GUIDE__WELCOME_REMIND, next = "TopRemind"}, {text = SHOP_SIDEWAY_GUIDE__WELCOME_LIST, next = "TopList"}, {text = SHOP_SIDEWAY_GUIDE__WELCOME_HELP, next = "Help"})
      CommonSys:CloseBasicMenu()
    else
      CommonSys:OpenBasicMenu(nil, -1733859855, nil)
      ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "ExitShop"}, {text = SHOP_SIDEWAY_GUIDE__WELCOME_REMIND, next = "TopRemind"}, {text = SHOP_SIDEWAY_GUIDE__WELCOME_LIST, next = "TopList"}, {text = SHOP_SIDEWAY_GUIDE__WELCOME_KEY, next = "TopKey"}, {text = SHOP_SIDEWAY_GUIDE__WELCOME_HELP, next = "Help"})
      CommonSys:CloseBasicMenu()
    end
  end
  function FlowSys.Proc.MenuTopLoop()
    ShopSys:SetSelectGoodsTbl(nil)
    local level = shopIns:GetShopLevel()
    if level == 0 then
      CommonSys:OpenBasicMenu(nil, -1733859855, nil)
      ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__SERIES, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "ExitShop"}, {text = SHOP_SIDEWAY_GUIDE__SERIES_REMIND, next = "TopRemind"}, {text = SHOP_SIDEWAY_GUIDE__SERIES_HELP, next = "Help"})
      CommonSys:CloseBasicMenu()
    elseif level == 1 then
      CommonSys:OpenBasicMenu(nil, -1733859855, nil)
      ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__SERIES, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "ExitShop"}, {text = SHOP_SIDEWAY_GUIDE__SERIES_REMIND, next = "TopRemind"}, {text = SHOP_SIDEWAY_GUIDE__SERIES_LIST, next = "TopList"}, {text = SHOP_SIDEWAY_GUIDE__SERIES_HELP, next = "Help"})
      CommonSys:CloseBasicMenu()
    else
      CommonSys:OpenBasicMenu(nil, -1733859855, nil)
      ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__SERIES, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "ExitShop"}, {text = SHOP_SIDEWAY_GUIDE__SERIES_REMIND, next = "TopRemind"}, {text = SHOP_SIDEWAY_GUIDE__SERIES_LIST, next = "TopList"}, {text = SHOP_SIDEWAY_GUIDE__SERIES_KEY, next = "TopKey"}, {text = SHOP_SIDEWAY_GUIDE__SERIES_HELP, next = "Help"})
      CommonSys:CloseBasicMenu()
    end
  end
  function FlowSys.Proc.TopRemind()
    local defaultOn = true
    local defaultOff = false
    if shopIns:GetSidewayFlag() == true then
      ShopSys:SetShopTag("\231\143\190\229\156\168\227\129\174\232\168\173\229\174\154\231\138\182\230\133\139", SHOP_SIDEWAY_GUIDE__REMIND_SET_ON)
      defaultOn = true
      defaultOff = false
    else
      ShopSys:SetShopTag("\231\143\190\229\156\168\227\129\174\232\168\173\229\174\154\231\138\182\230\133\139", SHOP_SIDEWAY_GUIDE__REMIND_SET_OFF)
      defaultOn = false
      defaultOff = true
    end
    ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__REMIND_SET, nil, nil, {
      next = "MenuTopLoop"
    }, {
      text = SHOP_SIDEWAY_GUIDE__REMIND_SET_ON,
      next = "RemindSetMessageOn",
      default = defaultOn
    }, {
      text = SHOP_SIDEWAY_GUIDE__REMIND_SET_OFF,
      next = "RemindSetMessageOff",
      default = defaultOff
    })
  end
  function FlowSys.Proc.RemindSetMessageOn()
    shopIns:SetSidewayFlag(true)
    ShopSys:Talk(SHOP_SIDEWAY_GUIDE__REMIND_SET_ON_FINISH, nil)
    local PosShopStaff = CH(shopIns:GetOwnerSymbol()):GetPosition()
    EFFECT:Create("effect", SymEff("NM_PULSE_VR_YELLOW"))
    EFFECT:SetPosition("effect", PosShopStaff)
    EFFECT:Play("effect")
    SOUND:PlaySe(SymSnd("SE_SHOP_WAKIMICHI_TELL"))
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.RemindSetMessageOff()
    shopIns:SetSidewayFlag(false)
    ShopSys:Talk(SHOP_SIDEWAY_GUIDE__REMIND_SET_OFF_FINISH, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.TopList()
    if shopIns:GetDundeonListCount() == 0 then
      ShopSys:Talk(SHOP_SIDEWAY_GUIDE__LIST_NOT_YET, nil)
      WINDOW:KeyWait()
      FlowSys:Next("MenuTopLoop")
      return
    end
    ShopSys:Talk(SHOP_SIDEWAY_GUIDE__LIST_INTO, nil)
    FlowSys:Next("SideWayList")
  end
  function FlowSys.Proc.SideWayList()
    OpenSidewayDungeonMenu()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.TopKey()
    if shopIns:GetShopItemCount() == 0 then
      ShopSys:Talk(SHOP_SIDEWAY_GUIDE__SOLD_OUT, nil)
      WINDOW:KeyWait()
      FlowSys:Next("MenuTopLoop")
      return
    end
    ShopSys:Talk(SHOP_SIDEWAY_GUIDE__KEY_INTO, nil)
    FlowSys:Next("KeyShop")
  end
  function FlowSys.Proc.KeyShop()
    WINDOW:CloseMessage()
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispSidewayShopSelectMenu(shopIns, function()
      CommonSys:EndLowerMenuNavi(true)
      FlowSys:Next("Buy")
    end, function()
      CommonSys:EndLowerMenuNavi(true)
      FlowSys:Next("MenuTopLoop")
    end, function()
      FlowSys:Next("ItemGuide", "KeyShop")
    end, SHOP_SIDEWAY_GUIDE__CAPTION_BUY, SHOP_SIDEWAY_GUIDE__KEY_SELECT_BUY, SHOP_SIDEWAY_GUIDE__KEY_SELECT_EXPLAIN)
  end
  function FlowSys.Proc.ItemGuide(nextFlow)
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispItemGuide()
    CommonSys:EndLowerMenuNavi(true)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.Buy()
    if ShopSys:CheckBuyablePrice() == false then
      ShopSys:Talk(SHOP_SIDEWAY_GUIDE__BUY_NO_MONEY, nil)
      FlowSys:Next("KeyShop")
      return
    end
    if ShopSys:CheckBagOver() == true then
      ShopSys:Talk(SHOP_SIDEWAY_GUIDE__BUY_NO_ITEMMAX, nil)
      FlowSys:Next("KeyShop")
      return
    end
    FlowSys:Next("ManyBuy")
  end
  function FlowSys.Proc.ManyBuy()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", ShopSys:GetSelectItemName())
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", ShopSys:GetBuyPriceText())
    if ShopSys:CheckMultiSelect() == true then
      ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__BUY_CONFIRM_PLURAL, nil, nil, {next = "KeyShop"}, {
        text = SHOP_SIDEWAY_GUIDE__BUY_CONFIRM_PLURAL_YES,
        next = "Payment",
        default = true
      }, {text = SHOP_SIDEWAY_GUIDE__BUY_CONFIRM_PLURAL_NO, next = "KeyShop"})
    else
      ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__BUY_CONFIRM, nil, nil, {next = "KeyShop"}, {
        text = SHOP_SIDEWAY_GUIDE__BUY_CONFIRM_YES,
        next = "Payment",
        default = true
      }, {text = SHOP_SIDEWAY_GUIDE__BUY_CONFIRM_NO, next = "KeyShop"})
    end
  end
  function FlowSys.Proc.Payment()
    ShopSys:Buy()
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:Talk(SHOP_SIDEWAY_GUIDE__BUY_THANKS)
    FlowSys:Next("SoldOut")
  end
  function FlowSys.Proc.SoldOut()
    if shopIns:GetShopItemCount() == 0 then
      ShopSys:Talk(SHOP_SIDEWAY_GUIDE__BUY_SOLDOUT, nil)
      WINDOW:KeyWait()
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
    ShopSys:TalkAskFlowNoClose(SHOP_SIDEWAY_GUIDE__BUY_SERIES, nil, nil, {
      next = "MenuTopLoop"
    }, {text = SHOP_SIDEWAY_GUIDE__BUY_SERIES_YES, next = "KeyShop"}, {
      text = SHOP_SIDEWAY_GUIDE__BUY_SERIES_NO,
      next = "MenuTopLoop"
    })
  end
  function FlowSys.Proc.Help()
    ShopSys:Talk(SHOP_SIDEWAY_GUIDE__HELP, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.ExitShop()
    ShopSys:Talk(SHOP_SIDEWAY_GUIDE__EXIT, nil)
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
function DispSidewayShopSelectMenu(shopIns, buyAct, cancelAct, expretionAct, ShopListTitle, buyActMes, expretionActMes)
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
    padHelpMainText = SHOP_SIDEWAY_GUIDE__MANUAL_BUY,
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
    end
  })
end

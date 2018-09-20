function getWarehouseItemSetTbl_()
  local setItemTbl = {
    {
      name = -1250848888,
      exp = 262061121,
      items = {
        113,
        112,
        143,
        225,
        255
      }
    },
    {
      name = -1638081461,
      exp = 615772034,
      items = {
        126,
        126,
        131,
        131,
        135,
        244,
        245,
        258
      }
    },
    {
      name = -2025329398,
      exp = 1034477251,
      items = {
        115,
        128,
        235,
        236,
        237,
        244,
        245,
        249
      }
    },
    {
      name = -939099187,
      exp = 1927890948,
      items = {
        225,
        143,
        258
      }
    }
  }
  return setItemTbl
end
function OpenWarehouseBankMenu()
  local IsUsableWarehouse = function()
    return true
  end
  local CheckItemAttributeDeposit = function()
    return true
  end
  function ScriptEventOpen()
    if GIMMICK:IsExist("AZUKARI_BOX") then
      SOUND:PlaySe(SymSnd("SE_SHOP_STORAGE_OPEN"))
      GM("AZUKARI_BOX"):SetMotion(SymMot("OPEN"), LOOP.OFF)
      GM("AZUKARI_BOX"):WaitPlayMotion()
    end
    return
  end
  function ScriptEventClose()
    if GIMMICK:IsExist("AZUKARI_BOX") then
      SOUND:PlaySe(SymSnd("SE_SHOP_STORAGE_CLOSE"))
      GM("AZUKARI_BOX"):SetMotion(SymMot("CLOSE"), LOOP.OFF)
    end
    return
  end
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  function FlowSys.Proc.MenuTopFirst()
    if IsUsableWarehouse() == false then
      ShopSys:SysMsg(-1336644586)
      FlowSys:Next("ExitWarehouse")
      return
    end
    ScriptEventOpen()
    SYSTEM:ExecuteTutorialHint(SymHint("SHOP_WHAREHOUSE_FIRST"))
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    FlowSys:Next("TopMenuFirst")
  end
  function FlowSys.Proc.TopHelp()
    ShopSys:SysMsg(945996625)
    WINDOW:CloseMessage()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
    FlowSys:Return()
  end
  function FlowSys.Proc.ItemGuide(nextFlow)
    DispItemGuide()
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.TopMenuFirst()
    FlowSys:Next("TopMenuFade")
  end
  function FlowSys.Proc.TopMenuFade()
    WINDOW:CloseMessage()
    SCREEN_B:FadeOutAll(TimeSec(2, TIME_TYPE.FRAME), true)
    SCREEN_B:LoadWallpaper("WALLPAPER_SUB_BANK")
    SCREEN_B:FadeInAll(TimeSec(4, TIME_TYPE.FRAME), false)
    FlowSys:Next("TopMenu")
  end
  function FlowSys.Proc.TopMenu()
    ShopSys:SaveCursorIndex("saveItem", nil)
    ShopSys:SaveCursorIndex("saveMoney", nil)
    WINDOW:CloseMessage()
    CommonSys:OpenBasicMenu(-1463688231, nil, nil, true)
    CommonSys:SetVisibleBasicMenu_LineHelp(true)
    CommonSys:SetVisibleBasicMenu_PadHelp(true)
    WarehouseSys:OpenItemWarehouseBankTopMenu(true)
    DispItemWarehouseTop(false, "saveTop", "ExitWarehouse", {
      text = -1081647233,
      next = "TopItemFade",
      exp = 2035312748
    }, {
      text = -23447790,
      next = "TopMoneyFade",
      exp = 667424088
    }, {
      text = -1500049151,
      next = "TopMaterialFade",
      exp = 1342803449,
      disable = not FUNC_COMMON:IsDottekotsuOpen()
    }, {
      text = 969125193,
      call = "TopHelp",
      exp = -15426982
    }, {
      text = 1312595179,
      next = "ExitWarehouse",
      exp = -1997820936
    })
    WarehouseSys:CloseItemWarehouseBankTopMenu()
    WINDOW:ForceCloseMessage()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.TopItemFade()
    WINDOW:CloseMessage()
    SCREEN_B:FadeOutAll(TimeSec(2, TIME_TYPE.FRAME), true)
    SCREEN_B:LoadWallpaper("WALLPAPER_SUB_BANK_ITEM")
    SCREEN_B:FadeInAll(TimeSec(4, TIME_TYPE.FRAME), false)
    FlowSys:Next("TopItem")
  end
  function FlowSys.Proc.TopItem()
    WINDOW:CloseMessage()
    CommonSys:OpenBasicMenu(-2069940243, nil, nil, true)
    ShopSys:SetSelectGoodsTbl(nil)
    WarehouseSys:OpenItemWarehouseBankTopMenu(false)
    DispItemWarehouseTop(false, "saveItem", "TopMenuFade", {
      text = 2124971136,
      next = "itemDeposit",
      exp = 1496226725
    }, {
      text = -611348891,
      next = "itemDraw",
      exp = -864956452
    }, {
      text = -1474228416,
      next = "SetDraw",
      exp = 1050467494
    }, {
      text = -1764719810,
      next = "chestDraw",
      exp = -1576210377
    })
    WarehouseSys:CloseItemWarehouseBankTopMenu()
    WINDOW:ForceCloseMessage()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.TopMoneyFade()
    WINDOW:CloseMessage()
    SCREEN_B:FadeOutAll(TimeSec(2, TIME_TYPE.FRAME), true)
    SCREEN_B:LoadWallpaper("WALLPAPER_SUB_BANK_MONEY")
    SCREEN_B:FadeInAll(TimeSec(4, TIME_TYPE.FRAME), false)
    FlowSys:Next("TopMoney")
  end
  function FlowSys.Proc.TopMoney()
    WINDOW:CloseMessage()
    CommonSys:OpenBasicMenu(-24900104, nil, nil, true)
    WarehouseSys:OpenBankTopMenu()
    if ShopSys:CheckBankDepositMax() then
      DispItemWarehouseTop(true, "saveMoney", "TopMenuFade", {
        text = -1161518294,
        next = "MoneyDeposit",
        exp = -2036408010
      }, {
        text = -541766572,
        next = "MoneyDraw",
        exp = -1713617667
      }, {
        text = -1188494664,
        next = "MoneyContribute",
        exp = 1724856387
      })
    else
      DispItemWarehouseTop(true, "saveMoney", "TopMenuFade", {
        text = -1161518294,
        next = "MoneyDeposit",
        exp = -2036408010
      }, {
        text = -541766572,
        next = "MoneyDraw",
        exp = -1713617667
      })
    end
    WarehouseSys:CloseBankTopMenu()
    WINDOW:ForceCloseMessage()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.itemDeposit()
    GROUND:ReduceBagMoney()
    if ShopSys:CheckBagEmpty() == true then
      ShopSys:SysMsg(-960476066)
      FlowSys:Next("TopItem")
      return
    end
    FlowSys:Next("DepositItemHandling")
  end
  function FlowSys.Proc.DepositItemHandling()
    WINDOW:CloseMessage()
    WarehouseSys:CloseItemWarehouseBankTopMenu()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
    CommonSys:OpenBasicMenu(1232296878, nil, nil, true)
    DispDeppsitSelectMenu(function()
      FlowSys:Next("CheckDepositItemAttribute")
    end, function()
      FlowSys:Next("TopItem")
    end, function()
      FlowSys:Next("ItemGuide", "DepositItemHandling")
    end, 1232296878, 832054002, 2083021255)
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.CheckDepositItemAttribute()
    FlowSys:Next("CheckDepositItemPlural")
  end
  function FlowSys.Proc.CheckDepositItemPlural()
    FlowSys:Call("DepositItemConform", ShopSys:CheckMultiSelect(), "DepositOneItem", "DepositPluralItem", "DepositItemHandling")
  end
  function FlowSys.Proc.DepositItemConform(multimode, flowYesOne, flowYesMulti, flowNo)
    if multimode == false then
      FlowSys:ReturnNext(flowYesOne)
    else
      FlowSys:ReturnNext(flowYesMulti)
    end
  end
  function FlowSys.Proc.DepositOneItem()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", ShopSys:GetSelectItemName())
    if ShopSys:DepositItemToWarehouseWithCheckOver() == true then
      ShopSys:SysMsg(-1915520046)
    else
      ShopSys:SysMsg(-1756305004)
    end
    FlowSys:Next("DepositItemAgain")
  end
  function FlowSys.Proc.DepositPluralItem()
    if ShopSys:DepositItemToWarehouseWithCheckOver() == true then
      ShopSys:SysMsg(-1270780688)
    else
      ShopSys:SysMsg(571197294)
    end
    FlowSys:Next("DepositItemAgain")
  end
  function FlowSys.Proc.DepositItemAgain()
    if ShopSys:CheckBagNoneDepositItem() == true then
      FlowSys:Next("TopItem")
      return
    end
    FlowSys:Next("DepositItemHandling")
  end
  function FlowSys.Proc.itemDraw()
    if ShopSys:CheckWarehouseEmptyItem() == true then
      ShopSys:SysMsg(635000761)
      FlowSys:Next("TopItem")
      return
    end
    FlowSys:Next("DrawItemHandling")
  end
  function FlowSys.Proc.DrawItemHandling()
    WINDOW:CloseMessage()
    WarehouseSys:CloseItemWarehouseBankTopMenu()
    CommonSys:OpenBasicMenu(-1813813259, nil, nil, true)
    DispDrawSelectMenu(function()
      FlowSys:Next("DrawItemConform")
    end, function()
      FlowSys:Next("TopItem")
    end, function()
      FlowSys:Next("ItemGuide", "DrawItemHandling")
    end, function()
      FlowSys:Next("DrawInputNumber")
    end, -1813813259, 2000744770, 367597559)
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.DrawItemConform()
    FlowSys:Next("DrawItem")
  end
  function FlowSys.Proc.DrawInputNumber()
    CommonSys:OpenBasicMenu(331705421, 279441652, ShopSys:GetSelectWarehouseItemOneLineExp(), true)
    DispDrawSelectCountInputMenu(function()
      FlowSys:Next("DrawItem")
    end, function()
      FlowSys:Next("DrawItemHandling")
    end)
  end
  function FlowSys.Proc.DrawItem()
    CommonSys:OpenBasicMenu(-2069940243, nil, nil, true)
    ShopSys:DrawItemFromWarehouseWithCheckOver()
    if ShopSys:CheckMultiSelect() == true then
      ShopSys:SysMsg(-1068643275, nil)
    else
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", ShopSys:GetSelectWarehouseItemNameText())
      ShopSys:SysMsg(183054215, nil)
    end
    if ShopSys:CheckWarehouseEmptyItem() == true then
      FlowSys:Next("TopItem")
      return
    end
    FlowSys:Next("DrawItemHandling")
  end
  function FlowSys.Proc.SetDraw()
    FlowSys:Next("DrawSetHandling")
  end
  function FlowSys.Proc.DrawSetHandling()
    WINDOW:CloseMessage()
    WarehouseSys:CloseItemWarehouseBankTopMenu()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
    CommonSys:OpenBasicMenu(-546701809, 430539087, "", true)
    local setItemTbl = getWarehouseItemSetTbl_()
    DispSetItemWarehouse(setItemTbl, function(selectItem)
      FlowSys:Next("DrawSetCheck")
    end, function()
      FlowSys:Next("TopItem")
    end)
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.DrawSetCheck()
    CommonSys:OpenBasicMenu(-2069940243, nil, nil, true)
    if WarehouseSys:CheckSetItemEmpty() then
      ShopSys:SysMsg(103480115, nil)
      FlowSys:Next("SetDraw")
      return
    end
    if ShopSys:CheckBagFull() == true then
      ShopSys:SysMsg(-1373435496)
      FlowSys:Next("SetDraw")
      return
    end
    if WarehouseSys:CheckSetItemHasAll() == false then
      FlowSys:Next("DrawSetCheckSelectNG")
      return
    end
    FlowSys:Next("DrawSetCheckSelectOK")
  end
  function FlowSys.Proc.DrawSetCheckSelectOK()
    CommonSys:OpenBasicMenu(-2069940243, nil, nil, true)
    WarehouseSys:OpenSetItemWideList()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\187\227\131\131\227\131\136", WarehouseSys:GetSelectSetItemName())
    ShopSys:SysMsgAskFlowNoClose(493929891, nil, {
      next = "DrawSetHandling"
    }, {text = -699609323, next = "DrawSet"}, {
      text = -2121469167,
      next = "DrawSetHandling"
    })
    WarehouseSys:CloseSetItemWideList()
  end
  function FlowSys.Proc.DrawSetCheckSelectNG()
    CommonSys:OpenBasicMenu(-2069940243, nil, nil, true)
    WarehouseSys:OpenSetItemWideList()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\187\227\131\131\227\131\136", WarehouseSys:GetSelectSetItemName())
    ShopSys:SysMsgAskFlowNoClose(-903107644, nil, {
      next = "DrawSetHandling"
    }, {text = -1971910030, next = "DrawSet"}, {
      text = 649440969,
      next = "DrawSetHandling"
    })
    WarehouseSys:CloseSetItemWideList()
  end
  function FlowSys.Proc.DrawSet()
    CommonSys:OpenBasicMenu(-2069940243, nil, nil, true)
    local setName = WarehouseSys:GetSelectSetItemName()
    local isOk = WarehouseSys:DrawSetItem()
    if isOk == false then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\187\227\131\131\227\131\136", setName)
      ShopSys:SysMsg(-571531507, nil)
    else
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\187\227\131\131\227\131\136", setName)
      ShopSys:SysMsg(1873884647, nil)
    end
    FlowSys:Next("SetDraw")
  end
  function FlowSys.Proc.itemHelp()
    WINDOW:CloseMessage()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
    FlowSys:Return()
  end
  function FlowSys.Proc.itemExit()
    FlowSys:Next("TopMenu")
  end
  function FlowSys.Proc.MoneyDeposit()
    if ShopSys:CheckBankDepositMax() == true then
      ShopSys:SysMsg(-636075910, nil)
      FlowSys:Next("TopMoney")
      return
    end
    if ShopSys:CheckPlayerMoneyZero() == true then
      ShopSys:SysMsg(746377749)
      FlowSys:Next("TopMoney")
      return
    end
    WINDOW:CloseMessage()
    FlowSys:Next("MoneyDepositInput")
  end
  function FlowSys.Proc.MoneyDepositInput()
    CommonSys:OpenBasicMenu(-679183934, -1286627360, 1331396973, true)
    DispBankMoneyDepositInput(function()
      FlowSys:Next("MoneyDepositAction")
    end, function()
      FlowSys:Next("MoneyDepositCancel")
    end)
  end
  function FlowSys.Proc.MoneyDepositAction()
    CommonSys:OpenBasicMenu(-24900104, nil, nil, true)
    ShopSys:DepositBankMoney()
    WarehouseSys:UpdateBankTopMenu()
    ShopSys:SetShopTag("\233\129\184\230\138\158\233\135\145\233\161\141", ShopSys:GetSelectNumber())
    CommonSys:SetVisibleBasicMenu_LineHelp(false)
    CommonSys:SetVisibleBasicMenu_PadHelp(false)
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:SysMsg(1638265714)
    FlowSys:Next("TopMoney")
  end
  function FlowSys.Proc.MoneyDepositCancel()
    FlowSys:Next("TopMoney")
  end
  function FlowSys.Proc.MoneyDraw()
    if ShopSys:CheckBankDepositZero() == true then
      ShopSys:SysMsg(1184043333, nil)
      FlowSys:Next("TopMoney")
      return
    end
    if ShopSys:CheckPlayerMoneyMax() == true then
      ShopSys:SysMsg(1010587971)
      FlowSys:Next("TopMoney")
      return
    end
    WINDOW:CloseMessage()
    FlowSys:Next("MoneyDrawInput")
  end
  function FlowSys.Proc.MoneyDrawInput()
    CommonSys:OpenBasicMenu(-2135767795, -34209130, 1279067912, true)
    DispBankMoneyDrawInput(function()
      FlowSys:Next("MoneyDrawAction")
    end, function()
      FlowSys:Next("MoneyDrawCancel")
    end)
  end
  function FlowSys.Proc.MoneyDrawAction()
    ShopSys:DrawBankMoney()
    WarehouseSys:UpdateBankTopMenu()
    ShopSys:SetShopTag("\233\129\184\230\138\158\233\135\145\233\161\141", ShopSys:GetSelectNumber())
    CommonSys:SetVisibleBasicMenu_LineHelp(false)
    CommonSys:SetVisibleBasicMenu_PadHelp(false)
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:SysMsg(1100950231)
    FlowSys:Next("TopMoney")
  end
  function FlowSys.Proc.MoneyDrawCancel()
    FlowSys:Next("TopMoney")
  end
  function FlowSys.Proc.MoneyContribute()
    if ShopSys:CheckPlayerMoneyZero() == true then
      ShopSys:SysMsg(-192252864)
      FlowSys:Next("TopMoney")
      return
    end
    WINDOW:CloseMessage()
    FlowSys:Next("ContributeConfirm")
  end
  function FlowSys.Proc.ContributeConfirm()
    ShopSys:DispMoneyWindowOpen()
    ShopSys:SysMsgAskFlowNoClose(1191154992, nil, {next = "TopMoney"}, {
      text = -189543065,
      next = "ContributeFinish"
    }, {text = -138526965, next = "TopMoney"})
    ShopSys:DispMoneyWindowClose()
  end
  function FlowSys.Proc.ContributeFinish()
    GROUND:SetPlayerMoney(0)
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:SysMsg(623498661)
    FlowSys:Next("TopMoney")
  end
  function FlowSys.Proc.MoneyHelp()
    WINDOW:CloseMessage()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
    FlowSys:Return()
  end
  function FlowSys.Proc.chestDraw()
    if ShopSys:CheckWarehouseNoChest() == true then
      ShopSys:SysMsg(-1711206369)
      FlowSys:Next("TopItem")
      return
    end
    FlowSys:Next("ChestDrawHandling")
  end
  function FlowSys.Proc.ChestDrawHandlingLoop()
    WINDOW:CloseMessage()
    FlowSys:Next("ChestDrawHandling")
  end
  function FlowSys.Proc.ChestDrawHandling()
    WINDOW:CloseMessage()
    WarehouseSys:CloseItemWarehouseBankTopMenu()
    CommonSys:OpenBasicMenu(576772487, nil, nil, true)
    DispChestDrawSelectMenu(function()
      FlowSys:Next("CheckChestDrawPlural")
    end, function()
      FlowSys:Next("TopItem")
    end, function()
      FlowSys:Next("ItemGuide", "ChestDrawHandlingLoop")
    end, 576772487, 1416914274, -1586936544)
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.CheckChestDrawPlural()
    FlowSys:Next("DrawChest")
  end
  function FlowSys.Proc.DrawChest()
    ShopSys:DrawChestFromWarehouseWithCheckOver()
    if ShopSys:CheckMultiSelect() then
      ShopSys:SysMsg(-478586859)
    else
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", ShopSys:GetSelectItemName())
      ShopSys:SysMsg(49842098)
    end
    FlowSys:Next("ChestDrawAgain")
  end
  function FlowSys.Proc.ChestDrawAgain()
    if ShopSys:CheckWarehouseNoChest() == true then
      FlowSys:Next("TopItem")
      return
    end
    if ShopSys:CheckBagFull() == true then
      FlowSys:Next("TopItem")
      return
    end
    FlowSys:Next("ChestDrawHandlingLoop")
  end
  function FlowSys.Proc.TopMaterialFade()
    WINDOW:CloseMessage()
    SCREEN_B:FadeOutAll(TimeSec(2, TIME_TYPE.FRAME), true)
    SCREEN_B:LoadWallpaper("WALLPAPER_SUB_BANK_MATERIAL")
    SCREEN_B:FadeInAll(TimeSec(4, TIME_TYPE.FRAME), false)
    FlowSys:Next("TopMaterial")
  end
  function FlowSys.Proc.TopMaterial()
    if ShopSys:CheckWarehouseEmptyKenzai() == true then
      ShopSys:SysMsg(299209854)
      FlowSys:Next("TopMenuFade")
      return
    end
    WINDOW:CloseMessage()
    WarehouseSys:CloseItemWarehouseBankTopMenu()
    CommonSys:OpenBasicMenu(966397385, nil, nil, true)
    DispShowMaterialMenu(function()
      FlowSys:Next("TopMenuFade")
    end, function()
      FlowSys:Next("ItemGuide", "TopMaterial")
    end, 966397385, 1565649899, -1125096827)
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.itemExit()
    FlowSys:Next("TopMenu")
  end
  function FlowSys.Proc.ExitWarehouse()
    CommonSys:CloseBasicMenu()
    WarehouseSys:CloseItemWarehouseBankTopMenu()
    CommonSys:EndLowerMenuNavi(false)
    ScriptEventClose()
    FlowSys:Return()
  end
  WINDOW:SetMessageScreenMode(ScreenType.B)
  FlowSys:Call("MenuTopFirst")
  FlowSys:Finish()
  ShopSys:Finish()
end
WarehouseSys = {}
function WarehouseSys:SetSelectSetItem(setItem)
  self.setItem = setItem
end
function WarehouseSys:GetSelectSetItemName()
  return self.setItem.name
end
function WarehouseSys:CheckSetItemEmpty()
  for i, itemIndex in ipairs(self.setItem.items) do
    if GROUND:GetItemWarehouseItemNowCount(itemIndex) > 0 then
      return false
    end
  end
  return true
end
function WarehouseSys:CheckSetItemHasAll()
  local setItemCountLUT = {}
  for i, itemIdx in ipairs(self.setItem.items) do
    if setItemCountLUT[itemIdx] == nil then
      setItemCountLUT[itemIdx] = 0
    end
    setItemCountLUT[itemIdx] = setItemCountLUT[itemIdx] + 1
  end
  for itemIndex, count in pairs(setItemCountLUT) do
    if count > GROUND:GetItemWarehouseItemNowCount(itemIndex) then
      return false
    end
  end
  return true
end
function WarehouseSys:DrawSetItem()
  local bOk = true
  for i, itemIdx in ipairs(self.setItem.items) do
    if GROUND:GetItemWarehouseItemNowCount(itemIdx) > 0 and GROUND:DrawOutItemWarehouseToBag(itemIdx, 1) == false then
      bOk = false
    end
  end
  self.setItem = nil
  return bOk
end
function WarehouseSys:OpenSetItemWideList()
  local itemListMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
  itemListMenu:SetLayoutRect(CommonSys:ArgsLayoutRect(8, 40, 248, 152))
  itemListMenu:SetTextOffset(0, 0)
  itemListMenu:SetFontType(FontType.TYPE_12)
  local nowWarehouseCountLUT = {}
  for i, itemIdx in ipairs(self.setItem.items) do
    if nowWarehouseCountLUT[itemIdx] == nil then
      nowWarehouseCountLUT[itemIdx] = GROUND:GetItemWarehouseItemNowCount(itemIdx)
    end
  end
  local text = "" .. MENU:ReplaceTagText(self.setItem.name) .. "[R][VO:12][CN][LINE:0:14][R]"
  for i, itemIdx in ipairs(self.setItem.items) do
    MENU:SetTag_ItemIndexNoCount(0, itemIdx)
    local x = math.floor((i - 1) % 2) * 120
    local y = math.floor((i - 1) / 2) * 16 + 28
    local itemText = MENU:ReplaceTagText(string.format("[HO:%d][VO:%d][item_b:0]", x, y))
    if nowWarehouseCountLUT[itemIdx] > 0 then
      nowWarehouseCountLUT[itemIdx] = nowWarehouseCountLUT[itemIdx] - 1
    else
      itemText = string.format("[CS:Q]%s[CR]", itemText)
    end
    text = text .. itemText
  end
  itemListMenu:SetText(text)
  itemListMenu:Open()
  self.setItemWideListWindow = itemListMenu
end
function WarehouseSys:CloseSetItemWideList()
  self.setItemWideListWindow:Close()
  self.setItemWideListWindow = nil
end
function WarehouseSys:OpenItemWarehouseBankTopMenu(bTop)
  if self.bagMoneyBoardMenu ~= nil then
    return
  end
  local bagCountWindow, moneyWindow
  if bTop then
    bagCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    bagCountWindow:SetFontType(FontType.TYPE_12)
    bagCountWindow:SetTextOffset(0, 0)
    bagCountWindow:SetLayoutRect(Rectangle(240, 40, 64, 16))
    moneyWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    moneyWindow:SetFontType(FontType.TYPE_12)
    moneyWindow:SetTextOffset(0, 0)
    moneyWindow:SetLayoutRect(Rectangle(240, 72, 64, 16))
  else
    bagCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    bagCountWindow:SetFontType(FontType.TYPE_12)
    bagCountWindow:SetTextOffset(0, 0)
    bagCountWindow:SetLayoutRect(Rectangle(240, 40, 64, 16))
    bagCountWindow:SetText(-1807035551)
  end
  if bagCountWindow then
    local nowCount = GROUND:GetBagItemCount()
    local maxCount = GROUND:GetBagItemMaxCount()
    MENU:SetTag_Value(0, nowCount)
    MENU:SetTag_Value(1, maxCount)
    bagCountWindow:SetText(-1807035551)
  end
  if moneyWindow then
    local nowCount = GROUND:GetPlayerMoney()
    MENU:SetTag_Value(0, nowCount)
    moneyWindow:SetText(-724016476)
  end
  local bagMoneyBoardMenu = {}
  function bagMoneyBoardMenu:Open()
    if bagCountWindow then
      bagCountWindow:Open()
    end
    if moneyWindow then
      moneyWindow:Open()
    end
  end
  function bagMoneyBoardMenu:Close()
    if bagCountWindow then
      bagCountWindow:Close()
    end
    if moneyWindow then
      moneyWindow:Close()
    end
  end
  bagMoneyBoardMenu:Open()
  self.bagMoneyBoardMenu = bagMoneyBoardMenu
end
function WarehouseSys:CloseItemWarehouseBankTopMenu()
  if self.bagMoneyBoardMenu == nil then
    return
  end
  self.bagMoneyBoardMenu:Close()
  self.bagMoneyBoardMenu = nil
end
function WarehouseSys:OpenBankTopMenu(optTbl)
  if self.bankBoardMenu ~= nil then
    return
  end
  local bankBoardMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
  bankBoardMenu:SetFontType(FontType.TYPE_12)
  bankBoardMenu:SetTextOffset(0, 0)
  local x = 160
  local y = 32
  if optTbl and optTbl.x then
    x = optTbl.x
  end
  if optTbl and optTbl.y then
    y = optTbl.y
  end
  bankBoardMenu:SetLayoutRect(Rectangle(x + 8, y + 8, 136, 32))
  bankBoardMenu:Open()
  MENU:SetTag_BankMuji(0, GROUND:GetPlayerMoney())
  MENU:SetTag_BankMuji(1, GROUND:GetBankMoney())
  bankBoardMenu:SetText(-1160470560)
  bankBoardMenu:Open()
  self.bankBoardMenu = bankBoardMenu
end
function WarehouseSys:UpdateBankTopMenu(optTbl)
  if self.bankBoardMenu == nil then
    return
  end
  MENU:SetTag_Bank(0, GROUND:GetPlayerMoney())
  MENU:SetTag_Bank(1, GROUND:GetBankMoney())
  self.bankBoardMenu:SetText(-1160470560)
end
function WarehouseSys:CloseBankTopMenu()
  if self.bankBoardMenu == nil then
    return
  end
  self.bankBoardMenu:Close()
  self.bankBoardMenu = nil
end
function DispItemWarehouseTop(isbank, saveCursorName, cancelNext, ...)
  local nextFlow
  local ArgsLayoutRectAndLine = function(left, top, right, lines)
    return left + 8, top + 8, right - left - 16, lines
  end
  local info = MENU:CreateInfomationMenuWindow(ScreenType.B)
  local sizeH = 128
  info:SetPositionY(160)
  info:SetSizeH(88)
  info:SetTextOffset(24, 24)
  info:SetFontType(FontType.TYPE_16)
  info:Open()
  info:SetMsgLineFeedHeight()
  local function itemChangeAct(exp)
    info:SetText(exp)
  end
  local topMenu = MENU:CreatePageMenu()
  if isbank then
    topMenu:SetLayoutRectAndLines(ArgsLayoutRectAndLine(8, 32, 160, 0))
  else
    topMenu:SetLayoutRectAndLines(ArgsLayoutRectAndLine(8, 32, 232, 0))
  end
  topMenu:ShowPageNum(false)
  for i, command in ipairs({
    ...
  }) do
    if not command.disable then
      topMenu:AddItem(command.text, command, nil)
    end
  end
  function topMenu:openedAction()
    self:SetCursorItemIndex(ShopSys:ResumeCursorIndex(saveCursorName, 0))
    itemChangeAct(self.curItem.obj.exp)
  end
  function topMenu:closedAction()
    ShopSys:SaveCursorIndex(saveCursorName, self:GetCursorItemIndex())
    info:Close()
  end
  function topMenu:decideAction()
    if self.curItem.obj.call then
      info:SetVisible(false)
      MENU:ClearFocus(topMenu)
      FlowSys:Call(self.curItem.obj.call)
      MENU:SetFocus(topMenu)
      info:SetVisible(true)
    else
      FlowSys:Next(self.curItem.obj.next)
      topMenu:SetDefaultCursorDispIndex(ShopSys:ResumeCursorIndex(saveCursorName, 0))
      self:Close()
    end
  end
  function topMenu:cancelAction()
    FlowSys:Next(cancelNext)
    self:Close()
  end
  function topMenu:currentItemChange()
    itemChangeAct(self.curItem.obj.exp)
  end
  BasicMenu_OpenAndCloseWait(topMenu)
end
function DispSetItemWarehouse(setItemTbl, selectAction, cancelAction)
  local itemListMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
  itemListMenu:SetLayoutRect(CommonSys:ArgsLayoutRect(160, 32, 308, 192))
  itemListMenu:SetTextOffset(0, 0)
  itemListMenu:SetFontType(FontType.TYPE_12)
  local bagCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
  bagCountWindow:SetFontType(FontType.TYPE_12)
  bagCountWindow:SetTextOffset(0, 0)
  bagCountWindow:SetLayoutRect(CommonSys:ArgsLayoutRect(8, 160, 96, 192))
  bagCountWindow:Open()
  local function updateDisp(setItem)
    local addCount = 0
    local nowWarehouseCountLUT = {}
    for i, itemIdx in ipairs(setItem.items) do
      if nowWarehouseCountLUT[itemIdx] == nil then
        nowWarehouseCountLUT[itemIdx] = GROUND:GetItemWarehouseItemNowCount(itemIdx)
      end
    end
    local text = MENU:ReplaceTagText(1551764941)
    for i, itemIdx in ipairs(setItem.items) do
      MENU:SetTag_ItemIndexNoCount(0, itemIdx)
      local itemText = MENU:ReplaceTagText(string.format("[VO:%d][HO:0][item_b:0]", i * 16 + 4))
      if nowWarehouseCountLUT[itemIdx] > 0 then
        nowWarehouseCountLUT[itemIdx] = nowWarehouseCountLUT[itemIdx] - 1
        addCount = addCount + 1
      else
        itemText = string.format("[CS:X]%s[CR]", itemText)
      end
      text = text .. itemText
    end
    itemListMenu:SetText(text)
    local nowCount = GROUND:GetBagItemCount()
    local maxCount = GROUND:GetBagItemMaxCount()
    if maxCount <= nowCount + addCount then
      MENU:SetTag_Value(0, maxCount)
      MENU:SetTag_Value(1, maxCount)
      bagCountWindow:SetText("[M:BAGS][RT][IS][CS:Q][value_p_s_b:0][CR]/[value_p_s_b:1][IE]")
    elseif addCount ~= 0 then
      MENU:SetTag_Value(0, nowCount + addCount)
      MENU:SetTag_Value(1, maxCount)
      bagCountWindow:SetText("[M:BAGS][RT][IS][CS:H][value_p_s_b:0][CR]/[value_p_s_b:1][IE]")
    else
      MENU:SetTag_Value(0, nowCount + addCount)
      MENU:SetTag_Value(1, maxCount)
      bagCountWindow:SetText("[M:BAGS][RT][IS][value_p_s_b:0][CR]/[value_p_s_b:1][IE]")
    end
  end
  local setMenu = MENU:CreatePageMenu()
  setMenu:SetLayoutRectAndLines(CommonSys:ArgsLayoutRectAndLines(8, 32, 160, 4))
  setMenu:ShowPageNum(false)
  for i, v in ipairs(setItemTbl) do
    setMenu:AddItem(v.name, v, nil)
  end
  function setMenu:openedAction()
    itemListMenu:Open()
    bagCountWindow:Open()
    updateDisp(self.curItem.obj)
    CommonSys:UpdateBasicMenu_LineHelp(self.curItem.obj.exp)
  end
  function setMenu:currentItemChange()
    updateDisp(self.curItem.obj)
    CommonSys:UpdateBasicMenu_LineHelp(self.curItem.obj.exp)
  end
  function setMenu:cancelAction()
    cancelAction()
    self:Close()
  end
  function setMenu:closedAction()
    itemListMenu:Close()
    bagCountWindow:Close()
  end
  function setMenu:decideAction()
    selectAction(self.curItem.obj)
    WarehouseSys:SetSelectSetItem(self.curItem.obj)
    self:Close()
  end
  BasicMenu_OpenAndCloseWait(setMenu)
end
function DispDrawSelectMenu(drawAct, cancelAct, expretionAct, numberAct, ShopListTitle, drawActMes, expretionActMes)
  ShopSys:SetSelectGoodsTbl(nil)
  local function drawAction(self)
    local item = self.curItem.obj
    if item.warehouseItemCount == 0 then
      if ITEM:IsItemGrouped(item.warehouseItemIndex) then
        item.warehouseItemCount = GROUND:GetItemWarehouseItemNowCount(item.warehouseItemIndex)
        if item.warehouseItemCount > 99 then
          item.warehouseItemCount = 99
        end
      else
        item.warehouseItemCount = 1
      end
    end
    drawAct()
  end
  local disableFilter = function(bagMenu, item)
    return ITEM:GetItemKind(item.warehouseItemIndex) == ITEM_KIND.KIND_KENZAI
  end
  local grayoutDrawFlt = function(bagMenu, item)
    local nowCount = GROUND:GetBagItemCount()
    local maxCount = GROUND:GetBagItemMaxCount()
    if bagMenu:IsMultiSelect() then
      return false
    end
    return nowCount >= maxCount
  end
  ShopSys:DispBasicItemBagMenu({
    titleText = ShopListTitle,
    padHelpMainText = -1558150499,
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
      MENU:SetTag_ItemIndexNoCount(0, item.warehouseItemIndex)
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
      return item1.warehouseItemIndex == item2.warehouseItemIndex
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
      local nowCount = GROUND:GetBagItemCount()
      local maxCount = GROUND:GetBagItemMaxCount()
      local selectCount = 0
      local addCount = 1
      if bagMenu:IsMultiSelect() then
        for selItem in bagMenu:EnumerateSelectedItems() do
          selectCount = 1 + selectCount
        end
      end
      if maxCount < nowCount + selectCount + addCount then
        bagMenu:SetEffect("shake_bagCount")
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
    isDispBagCountWindow = true,
    modifyBagMenuFunc = function(bagMenu)
      function bagMenu:inputLSelectAction()
        local nowCount = GROUND:GetBagItemCount()
        local maxCount = GROUND:GetBagItemMaxCount()
        if nowCount >= maxCount then
          bagMenu:SetEffect("shake_bagCount")
          SOUND:PlaySe(SymSnd("SE_SYS_NO_SELECT"))
        else
          SOUND:PlaySe(SymSnd("SE_SYS_DECIDE"))
          ShopSys:SetSelectGoodsTbl({
            self.curItem.obj
          })
          numberAct()
          self:Close()
        end
      end
      local oldMultiSelectedActionAct = bagMenu.multiSelectedAction
      function bagMenu:multiSelectedAction()
        local item = self.curItem.obj
        if self.curItem.selected then
          if ITEM:IsItemGrouped(item.warehouseItemIndex) then
            item.warehouseItemCount = GROUND:GetItemWarehouseItemNowCount(item.warehouseItemIndex)
            if item.warehouseItemCount > 99 then
              item.warehouseItemCount = 99
            end
          else
            item.warehouseItemCount = 1
          end
        else
          item.warehouseItemCount = 0
        end
        if oldMultiSelectedActionAct then
          oldMultiSelectedActionAct(self)
        end
      end
    end
  })
end
function DispDrawSelectCountInputMenu(drawAct, cancelAct)
  local item = ShopSys:GetSelectWarehouseItem()
  local bagCountWindow, warehouseCountWindow
  bagCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
  bagCountWindow:SetFontType(FontType.TYPE_12)
  bagCountWindow:SetTextOffset(0, 0)
  bagCountWindow:SetLayoutRect(Rectangle(240, 168, 64, 16))
  bagCountWindow:Open()
  warehouseCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
  warehouseCountWindow:SetFontType(FontType.TYPE_12)
  warehouseCountWindow:SetTextOffset(0, 0)
  warehouseCountWindow:SetLayoutRect(CommonSys:ArgsLayoutRect(232, 128, 312, 160))
  warehouseCountWindow:Open()
  local function updateFunc(num)
    local bagCount = ITEM:IsItemGrouped(item.warehouseItemIndex) and math.floor((num + 98) / 99) or num
    local diffCount = bagCount
    local nowCount = GROUND:GetBagItemCount()
    local maxCount = GROUND:GetBagItemMaxCount()
    if maxCount <= nowCount + diffCount then
      MENU:SetTag_Value(0, maxCount)
      MENU:SetTag_Value(1, maxCount)
      bagCountWindow:SetText(-534034656)
    elseif diffCount ~= 0 then
      MENU:SetTag_Value(0, nowCount + diffCount)
      MENU:SetTag_Value(1, maxCount)
      bagCountWindow:SetText(2066476600)
    else
      MENU:SetTag_Value(0, nowCount + diffCount)
      MENU:SetTag_Value(1, maxCount)
      bagCountWindow:SetText(-1807035551)
    end
    local diffCount = -num
    local nowCount = GROUND:GetItemWarehouseItemNowCount(item.warehouseItemIndex)
    local maxCount = GROUND:GetItemWarehouseItemMaxCount(item.warehouseItemIndex)
    if maxCount <= nowCount + diffCount then
      MENU:SetTag_Value(0, maxCount)
      MENU:SetTag_Value(1, maxCount)
      warehouseCountWindow:SetText(1249105473)
    elseif diffCount ~= 0 then
      MENU:SetTag_Value(0, nowCount + diffCount)
      MENU:SetTag_Value(1, maxCount)
      warehouseCountWindow:SetText(-780959911)
    else
      MENU:SetTag_Value(0, nowCount)
      MENU:SetTag_Value(1, maxCount)
      warehouseCountWindow:SetText(-1244440918)
    end
  end
  local isDecide = false
  MENU:SetTag_ItemIndexNoCount(0, item.warehouseItemIndex)
  local titleText = MENU:ReplaceTagText("[CN][item_b:0][R]")
  local maxCount = GROUND:GetBagItemMaxCount() - GROUND:GetBagItemCount()
  if ITEM:IsItemGrouped(item.warehouseItemIndex) then
    maxCount = maxCount * 99
  end
  if maxCount > GROUND:GetItemWarehouseItemNowCount(item.warehouseItemIndex) then
    maxCount = GROUND:GetItemWarehouseItemNowCount(item.warehouseItemIndex)
  end
  if maxCount == 0 then
    updateFunc(0)
  else
    updateFunc(1)
  end
  ShopSys:DispInputMenu({
    titleText = titleText,
    digitNum = 3,
    startNum = 1,
    maxNum = maxCount,
    minNum = 1,
    isTitleUnderLine = true,
    decideAction = function(num)
      drawAct()
      item.warehouseItemCount = num
      isDecide = true
    end,
    cancelAction = function()
    end,
    changeAction = function(num)
      updateFunc(num)
    end
  })
  bagCountWindow:Close()
  warehouseCountWindow:Close()
  if isDecide then
    drawAct()
  else
    cancelAct()
  end
end
function DispBankMoneyDepositInput(enterAct, cancelAct, ShopListTitle)
  local maxMoney = GROUND:GetPlayerMoney()
  if GROUND:GetBankMoneyLimit() < maxMoney + GROUND:GetBankMoney() then
    maxMoney = GROUND:GetBankMoneyLimit() - GROUND:GetBankMoney()
  end
  WarehouseSys:OpenBankTopMenu()
  ShopSys:DispInputMenu({
    titleText = ShopListTitle,
    digitNum = 4,
    startNum = maxMoney,
    maxNum = maxMoney,
    minNum = 1,
    fixdWidth = 120,
    decideAction = function()
      enterAct()
    end,
    cancelAction = function()
      cancelAct()
    end
  })
  WarehouseSys:CloseBankTopMenu()
end
function DispBankMoneyDrawInput(enterAct, cancelAct, ShopListTitle)
  local maxMoney = GROUND:GetBankMoney()
  if GROUND:GetPlayerMoneyLimit() < maxMoney + GROUND:GetPlayerMoney() then
    maxMoney = GROUND:GetPlayerMoneyLimit() - GROUND:GetPlayerMoney()
  end
  WarehouseSys:OpenBankTopMenu()
  ShopSys:DispInputMenu({
    titleText = ShopListTitle,
    digitNum = 4,
    startNum = maxMoney,
    maxNum = maxMoney,
    minNum = 1,
    fixdWidth = 120,
    decideAction = function()
      enterAct()
    end,
    cancelAction = function()
      cancelAct()
    end
  })
  WarehouseSys:CloseBankTopMenu()
end
function DispChestDrawSelectMenu(drawAct, cancelAct, expretionAct, ShopListTitle, drawActMes, expretionActMes)
  local grayoutDrawFlt = function(bagMenu, item)
    local nowCount = GROUND:GetBagItemCount()
    local maxCount = GROUND:GetBagItemMaxCount()
    if bagMenu:IsMultiSelect() then
      return false
    end
    return nowCount >= maxCount
  end
  local multiSelectFuncPre_ = function(bagMenu, work)
    work.nowCount = 0
    work.noBagCount = false
    if bagMenu:IsMultiSelect() then
      for selItem in bagMenu:EnumerateSelectedItems() do
        work.nowCount = work.nowCount + 1
      end
    end
  end
  local multiSelectFuncCheck_ = function(bagMenu, work, item, isAllSelect)
    local spaceCount = GROUND:GetBagItemMaxCount() - GROUND:GetBagItemCount()
    local addCount = 1
    if spaceCount < work.nowCount + addCount then
      work.noBagCount = true
      return false
    end
    return true
  end
  local multiSelectFuncAddAfter_ = function(bagMenu, work, item)
    local addCount = 1
    work.nowCount = work.nowCount + addCount
  end
  local multiSelectFuncPost_ = function(bagMenu, work)
    if work.noBagCount then
      bagMenu:SetEffect("shake_bagCount")
    end
  end
  ShopSys:DispBasicItemBagMenu({
    titleText = ShopListTitle,
    padHelpMainText = 1596202524,
    enumItemFunc = function()
      return GROUND:EnumerateChestWarehouseItem()
    end,
    itemTextFunc = function(item)
      return item:GetItemText_forDungeonBag()
    end,
    itemLineHelpFunc = function(item)
      return item:GetItemOneLineExplainText()
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
    commandItems = {
      {
        text = drawActMes,
        action = function()
          drawAct()
        end,
        isCloseShopMenu = true,
        grayoutFilter = grayoutDrawFlt
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
    isDispBagCountWindow = true
  })
end
function DispShowMaterialMenu(cancelAct, expretionAct, ShopListTitle, shopPadHelp, expretionActMes)
  ShopSys:DispBasicItemBagMenu({
    titleText = ShopListTitle,
    padHelpMainText = shopPadHelp,
    enumItemFunc = function()
      return coroutine.wrap(function()
        for v in GROUND:EnumerateItemWarehouseItemIndex() do
          if ITEM:GetItemKind(v) == ITEM_KIND.KIND_KENZAI then
            coroutine.yield(v)
          end
        end
      end)
    end,
    itemTextFunc = function(item)
      MENU:SetTag_ItemIndexNoCount(0, item)
      MENU:SetTag_Value(1, GROUND:GetItemWarehouseItemNowCount(item))
      return MENU:ReplaceTagText("[S:8][item_b:0][RT][IS][value_s_b:1:3][IE]")
    end,
    itemLineHelpFunc = function(item)
      return ITEM:GetItemOneLineExplainTextFromItemIndex(item)
    end,
    itemHelpFunc = function(item)
      return ITEM:GetItemExplainTextIdFromItemIndex(item)
    end,
    commandItems = {
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
    isMultiSelect = false,
    isDispBagCountWindow = false,
    openTutorialFunc = function()
      SYSTEM:ExecuteTutorialHint(SymHint("SHOP_OPEN_KENZAI"), false)
    end
  })
end
function DispDeppsitSelectMenu(depositAct, cancelAct, expretionAct, ShopListTitle, depositActMes, expretionActMes)
  local grayoutDepositFlt = function(bagMenu, item)
    local index = item:GetIndex()
    local isChest = item:GetKind() == ITEM_KIND.KIND_CHEST
    local nowCount = isChest and GROUND:GetChestWarehouseItemCount() or GROUND:GetItemWarehouseItemNowCount(index)
    local maxCount = isChest and GROUND:GetChestWarehouseItemMaxCount() or GROUND:GetItemWarehouseItemMaxCount(index)
    if bagMenu:IsMultiSelect() then
      return false
    end
    return nowCount >= maxCount
  end
  local multiSelectFuncPre_ = function(bagMenu, work)
    work.noWarehouseCount = false
  end
  local multiSelectFuncCheck_ = function(bagMenu, work, item, isAllSelect)
    local index = item:GetIndex()
    local isChest = item:GetKind() == ITEM_KIND.KIND_CHEST
    local nowCount = isChest and GROUND:GetChestWarehouseItemCount() or GROUND:GetItemWarehouseItemNowCount(index)
    local maxCount = isChest and GROUND:GetChestWarehouseItemMaxCount() or GROUND:GetItemWarehouseItemMaxCount(index)
    local selectCount = 0
    if bagMenu:IsMultiSelect() then
      for selItem in bagMenu:EnumerateSelectedItems() do
        if isChest and selItem:GetKind() == ITEM_KIND.KIND_CHEST or selItem:GetIndex() == index then
          selectCount = selItem:GetCount() + selectCount
        end
      end
    end
    if maxCount < nowCount + selectCount + item:GetCount() then
      work.noWarehouseCount = true
    end
    return maxCount >= nowCount + selectCount + item:GetCount()
  end
  local multiSelectFuncAddAfter_ = function(bagMenu, work, item)
  end
  local multiSelectFuncPost_ = function(bagMenu, work)
    if work.noWarehouseCount then
      bagMenu:SetEffect("shake_warehouseCount")
    end
  end
  ShopSys:DispBasicItemBagMenu({
    titleText = ShopListTitle,
    padHelpMainText = 225655374,
    itemTextFunc = function(item)
      return item:GetItemText_forDungeonBag()
    end,
    itemLineHelpFunc = function(item)
      return item:GetItemOneLineExplainText()
    end,
    checkSelectWarnColorItemFunc = function(bagMenu, item)
      local index = item:GetIndex()
      local isChest = item:GetKind() == ITEM_KIND.KIND_CHEST
      local nowCount = isChest and GROUND:GetChestWarehouseItemCount() or GROUND:GetItemWarehouseItemNowCount(index)
      local maxCount = isChest and GROUND:GetChestWarehouseItemMaxCount() or GROUND:GetItemWarehouseItemMaxCount(index)
      return nowCount >= maxCount
    end,
    calcDiffWarehouseCountFunc = function(bagMenu)
      local item = bagMenu.curItem.obj
      local index = item:GetIndex()
      local isChest = item:GetKind() == ITEM_KIND.KIND_CHEST
      local selectCount = 0
      if bagMenu:IsMultiSelect() then
        for selItem in bagMenu:EnumerateSelectedItems() do
          if isChest and selItem:GetKind() == ITEM_KIND.KIND_CHEST or selItem:GetIndex() == index then
            selectCount = selItem:GetCount() + selectCount
          end
        end
      end
      return selectCount
    end,
    calcDiffBagCountFunc = function(bagMenu)
      local item = bagMenu.curItem.obj
      local index = item:GetIndex()
      local removeCount = 0
      if bagMenu:IsMultiSelect() then
        for selItem in bagMenu:EnumerateSelectedItems() do
          local isChest = selItem:GetKind() == ITEM_KIND.KIND_CHEST
          if isChest or GROUND:IsPossibleDepositItemWarehouse({selItem}) then
            removeCount = removeCount - 1
          end
        end
      end
      return removeCount
    end,
    commandItems = {
      {
        text = depositActMes,
        action = function()
          depositAct()
        end,
        isCloseShopMenu = true,
        grayoutFilter = grayoutDepositFlt
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
    closedAct = function()
    end,
    isMultiSelect = true,
    isAllSelectEnable = true,
    extentMultiSelectPre = multiSelectFuncPre_,
    extentMultiSelectCheck = multiSelectFuncCheck_,
    extentMultiSelectAddAfter = multiSelectFuncAddAfter_,
    extentMultiSelectPost = multiSelectFuncPost_,
    isDispBagCountWindow = true,
    isDispWarehouseCountWindow = true,
    isSortButtonEnable = true
  })
end

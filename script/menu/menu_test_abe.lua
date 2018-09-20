gEcMenuParameter = {}
function _CreateParameter()
  gEcMenuParameter.dialogWindow = nil
end
function _DestroyParameter()
  gEcMenuParameter = {}
end
demo_disp_table = {
  {
    title = 1350044038,
    subTitle = 200373891,
    merit = -569810821,
    new = "TRUE",
    purchase = "TRUE",
    shopping = "FALSE",
    received = "FALSE",
    release = "2012/08/15",
    block = "33\227\131\150\227\131\173\227\131\131\227\130\175",
    money = "0\229\134\134"
  },
  {
    title = 739847261,
    subTitle = 2087691379,
    merit = 893311864,
    new = "TRUE",
    purchase = "TRUE",
    shopping = "TRUE",
    received = "FALSE",
    release = "2012/08/15",
    block = "24\227\131\150\227\131\173\227\131\131\227\130\175",
    money = "100\229\134\134"
  },
  {
    title = -1323905749,
    subTitle = -406132708,
    merit = -620974010,
    new = "FALSE",
    purchase = "TRUE",
    shopping = "TRUE",
    received = "TRUE",
    release = "2012/08/01",
    block = "28\227\131\150\227\131\173\227\131\131\227\130\175",
    money = "300\229\134\134"
  },
  {
    title = -723818517,
    subTitle = -1823342189,
    merit = 941665087,
    new = "FALSE",
    purchase = "TRUE",
    shopping = "FALSE",
    received = "FALSE",
    release = "2012/08/01",
    block = "10\227\131\150\227\131\173\227\131\131\227\130\175",
    money = "500\229\134\134"
  },
  {
    title = 1238664861,
    subTitle = 150425084,
    merit = -673005567,
    new = "FALSE",
    purchase = "TRUE",
    shopping = "FALSE",
    received = "FALSE",
    release = "2012/08/01",
    block = "6\227\131\150\227\131\173\227\131\131\227\130\175",
    money = "799\229\134\134"
  }
}
function EcAddContentsMenu()
  MENU:DebugReloadMenuScript("script/menu/menu_test_abe.lua")
  MENU:DebugReloadMenuScript("script/menu/menu_shop_main.lua")
  MENU:DebugReloadMenuScript("script/menu/menu_shop_common.lua")
  SOUND:PlayBgm(SymSnd("BGM_DUN_SHOP"), Volume(256))
  _CreateParameter()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  local test_mode = false
  local m_iStateInit, ecSelectMenu
  local bEcSelectMenuFlag = false
  local exitButtonMenu, decideButtonMenu
  item_max = 5
  disp_item_max = 3
  disp_item_offset = 1
  menu_exit = false
  function FlowSys.Proc.PurchaseStartup()
    test_mode = false
    FlowSys:Next("PurchaseStartup_TestSelectMenu")
  end
  function FlowSys.Proc.PurchaseStartup_TestSelectMenu()
    if menu_exit == true then
      FlowSys:Next("PurchaseEnd")
    else
      FlowSys:Next("PurchaseListContents")
    end
  end
  function FlowSys.Proc.PurchaseListContentsTest()
    test_mode = true
    FlowSys:Next("PurchaseListContents")
  end
  function FlowSys.Proc.PurchaseListContents()
    menu_exit = true
    FlowSys:Next("PurchaseListContents01")
  end
  function FlowSys.Proc.PurchaseListContents01()
    FlowSys:Next("PurchaseListContents02")
  end
  function FlowSys.Proc.PurchaseListContents02()
    m_iStateInit = 1
    FlowSys:Next("PurchaseListContents03")
  end
  function FlowSys.Proc.PurchaseListContents03()
    iResult = 1
    if test_mode == false then
      iResult = EC:GetListContents(m_iStateInit)
    end
    m_iStateInit = 0
    TASK:Sleep(TimeSec(0))
    if iResult == 0 then
      FlowSys:Next("PurchaseListContents03")
    elseif iResult == 1 then
      if EC:GetNumOfItem() == 0 then
        FlowSys:Next("PurchaseItemError")
      else
        FlowSys:Next("PurchaseSelectItem")
      end
    elseif iResult == -1 then
      FlowSys:Next("PurchaseError")
    end
  end
  function FlowSys.Proc.PurchaseSelectItem()
    m_iStateInit = 1
    FlowSys:Next("PurchaseSelectItem01")
  end
  function FlowSys.Proc.PurchaseSelectItem01()
    local iResult = 1
    if test_mode == false then
      iResult = EC:SelectItem(m_iStateInit)
    end
    m_iStateInit = 0
    if iResult == 0 then
      TASK:Sleep(TimeSec(0))
      FlowSys:Next("PurchaseSelectItem01")
    elseif iResult == 1 then
      do
        local nextstate = ""
        local loop = false
        exitButtonMenu = MENU:CreateButtonMenu()
        exitButtonMenu:AddFixedPatternItem(2088416083, 0, 8, ButtonFixedPattern.EC_ICON, 108, 204, {
          font = "font16",
          result = "",
          nextFunc = ""
        }, nil)
        exitButtonMenu:SetItemLink4(0, 0, 0, 0, 0)
        exitButtonMenu:SetOption({inputMode = "LINK", iconCursor = "EC"})
        exitButtonMenu:Open()
        exitButtonMenu:SetVisibleIconCursor(false)
        ecSelectMenu = MENU:CreateEcSelectMenu()
        bEcSelectMenuFlag = true
        function exitButtonMenu:InputUp()
          _SetVisibleDialogWindowText(true)
          if bEcSelectMenuFlag == true then
            ecSelectMenu:SetIsRequireFocusFlag(false)
            ecSelectMenu:SetChangeFoucs(true)
          end
          exitButtonMenu:SetVisibleIconCursor(false)
          if bEcSelectMenuFlag == true then
            ecSelectMenu:SetChangeFoucs_Up()
          end
          TASK:Sleep(TimeSec(0))
          if bEcSelectMenuFlag == true then
            MENU:SetFocus(ecSelectMenu)
          end
        end
        function exitButtonMenu:InputDown()
          _SetVisibleDialogWindowText(true)
          if bEcSelectMenuFlag == true then
            ecSelectMenu:SetIsRequireFocusFlag(false)
            ecSelectMenu:SetChangeFoucs(true)
          end
          exitButtonMenu:SetVisibleIconCursor(false)
          if bEcSelectMenuFlag == true then
            ecSelectMenu:SetChangeFoucs_Down()
          end
          TASK:Sleep(TimeSec(0))
          if bEcSelectMenuFlag == true then
            MENU:SetFocus(ecSelectMenu)
          end
        end
        function exitButtonMenu:decideAction()
          if bEcSelectMenuFlag == true then
            ecSelectMenu:SetUpdateCallFlag(true)
            MENU:SetFocus(ecSelectMenu)
          end
        end
        function exitButtonMenu:cancelAction()
          if bEcSelectMenuFlag == true then
            ecSelectMenu:SetUpdateCallFlag(true)
            MENU:SetFocus(ecSelectMenu)
          end
        end
        function exitButtonMenu:abortFocusAction()
          _SetVisibleDialogWindowText(true)
          if bEcSelectMenuFlag == true then
            ecSelectMenu:SetIsRequireFocusFlag(false)
            ecSelectMenu:SetChangeFoucs(true)
          end
          exitButtonMenu:SetVisibleIconCursor(false)
          function ecSelectMenu:abortFocusActionSelect()
          end
          function ecSelectMenu:abortFocusActionExit()
            ecSelectMenu:SetChangeFoucs(false)
            exitButtonMenu:SetVisibleIconCursor(true)
          end
          ecSelectMenu:SetChangeFoucs_Touch()
        end
        if test_mode == false then
          disp_item_max = 3
          item_max = EC:GetNumOfMatchedItem()
          local max = disp_item_offset + disp_item_max
          if max > item_max + 1 then
            max = item_max + 1
          end
          for i = disp_item_offset, max - 1 do
            demo_disp_table[i] = {}
            if EC:GetItemIsPurchasable(i - 1) == true then
              demo_disp_table[i].purchase = "TRUE"
            else
              demo_disp_table[i].purchase = "FALSE"
            end
            if EC:GetItemIsPurchased(i - 1) == true then
              demo_disp_table[i].shopping = "TRUE"
            else
              demo_disp_table[i].shopping = "FALSE"
            end
            if EC:GetItemIsDownloaded(i - 1) == true then
              demo_disp_table[i].received = "TRUE"
            else
              demo_disp_table[i].received = "FALSE"
            end
            if EC:GetItemIsNewSince(i - 1) == true then
              demo_disp_table[i].new = "TRUE"
            else
              demo_disp_table[i].new = "FALSE"
            end
            demo_disp_table[i].title = EC:GetItemTitleName(i - 1)
            demo_disp_table[i].subTitle = EC:GetItemLongTextName(i - 1)
            demo_disp_table[i].merit = EC:GetItemTextName(i - 1)
            demo_disp_table[i].block = tostring(EC:GetItemRequiredBlock(i - 1)) .. MENU:GetTextPoolText(-974428007)
            if EC:GetItemIsPurchased(i - 1) == true then
              demo_disp_table[i].money = 1748378639
            elseif EC:GetItemIsPurchasable(i - 1) == true then
              demo_disp_table[i].money = EC:GetDisplayCurrencyPrefix() .. EC:GetItemStrAmount(i - 1) .. EC:GetDisplayCurrencySuffix()
            else
              demo_disp_table[i].money = 1849988949
            end
            local since = EC:GetItemNewSince(i - 1)
            local eLanguageType = SYSTEM:GetLanguageType()
            if eLanguageType == LANGUAGE_TYPE.GE then
              demo_disp_table[i].release = string.format("%02d", since - math.floor(since / 256) * 256) .. "." .. string.format("%02d", math.floor(since / 256) - math.floor(since / 65536) * 256) .. "." .. tostring(math.floor(since / 65536))
            elseif eLanguageType == LANGUAGE_TYPE.SP then
              demo_disp_table[i].release = string.format("%02d", since - math.floor(since / 256) * 256) .. "-" .. string.format("%02d", math.floor(since / 256) - math.floor(since / 65536) * 256) .. "-" .. tostring(math.floor(since / 65536))
            else
              demo_disp_table[i].release = string.format("%02d", since - math.floor(since / 256) * 256) .. "/" .. string.format("%02d", math.floor(since / 256) - math.floor(since / 65536) * 256) .. "/" .. tostring(math.floor(since / 65536))
            end
          end
        end
        local itemNum = item_max + 1 - disp_item_offset
        if itemNum > disp_item_max then
          itemNum = disp_item_max
        end
        ecSelectMenu:SetNumOfItem(itemNum)
        local pageIndex = math.floor(disp_item_offset / 3 + 1)
        local pageNum = math.floor((item_max + 3 - 1) / 3)
        local dispStr = MENU:GetTextPoolText(2056227232) .. tostring(pageIndex) .. "/" .. tostring(pageNum) .. MENU:GetTextPoolText(1900503951)
        CommonSys:OpenBasicMenu(dispStr, nil, nil, true)
        local leftArrow = pageNum > 1
        local rightArrow = pageNum > 1
        ecSelectMenu:SetLeftArrow(leftArrow)
        ecSelectMenu:SetRightArrow(rightArrow)
        local max = disp_item_offset + disp_item_max
        if max > item_max + 1 then
          max = item_max + 1
        end
        for i = disp_item_offset, max - 1 do
          if test_mode == false then
            ecSelectMenu:AddItemData({
              title = demo_disp_table[i].title,
              subTitle = demo_disp_table[i].subTitle,
              merit = demo_disp_table[i].merit,
              new = demo_disp_table[i].new,
              purchase = demo_disp_table[i].purchase,
              shopping = demo_disp_table[i].shopping,
              received = demo_disp_table[i].received,
              release = demo_disp_table[i].release,
              block = demo_disp_table[i].block,
              money = demo_disp_table[i].money
            }, nil)
          else
            ecSelectMenu:AddItemData({
              title = MENU:GetTextPoolText(demo_disp_table[i].title),
              subTitle = MENU:GetTextPoolText(demo_disp_table[i].subTitle),
              merit = MENU:GetTextPoolText(demo_disp_table[i].merit),
              new = demo_disp_table[i].new,
              purchase = demo_disp_table[i].purchase,
              shopping = demo_disp_table[i].shopping,
              received = demo_disp_table[i].received,
              release = demo_disp_table[i].release,
              block = demo_disp_table[i].block,
              money = demo_disp_table[i].money
            }, nil)
          end
        end
        function ecSelectMenu:decideAction()
          if demo_disp_table[ecSelectMenu:GetCursorIndex() + disp_item_offset].purchase == "TRUE" or demo_disp_table[ecSelectMenu:GetCursorIndex() + disp_item_offset].shopping == "TRUE" then
            SOUND:PlaySe(SymSnd("SE_SYS_DECIDE"))
            ecSelectMenu:SelectItem()
            gEcMenuParameter.dialogWindow:SelectItem()
            ecSelectMenu:SetArrowVisible(false)
            exitButtonMenu:SetVisible(false)
            local stResult = "cancel"
            local stNext = "cancel"
            decideButtonMenu = MENU:CreateButtonMenu()
            NestMenu_SetupDefaultAction(decideButtonMenu, ecSelectMenu)
            decideButtonMenu:AddFixedPatternItem(2017577510, 0, 8, ButtonFixedPattern.EC_ICON, 0, 204, {
              font = "font16",
              result = "item_buy_charge",
              nextFunc = "PurchaseBalance"
            }, nil)
            decideButtonMenu:SetItemLink4(0, 2, 1, 0, 0)
            local index = ecSelectMenu:GetCursorIndex() + disp_item_offset
            local _msg = -183163664
            local _func = "PurchasePurchaseContent"
            if demo_disp_table[index].received == "TRUE" then
              _msg = 327314613
              _func = "PurchaseDeleteContent"
            elseif demo_disp_table[index].shopping == "TRUE" then
              _msg = 803246371
              _func = "PurchaseReDownloadContent"
            end
            decideButtonMenu:AddFixedPatternItem(_msg, 0, 8, ButtonFixedPattern.EC_ICON, 108, 204, {
              font = "font16",
              result = "item_buy_select",
              nextFunc = _func
            }, nil)
            decideButtonMenu:SetItemLink4(1, 0, 2, 1, 1)
            decideButtonMenu:AddFixedPatternItem(538288248, 0, 8, ButtonFixedPattern.EC_ICON, 216, 204, {
              font = "font16",
              result = "item_buy_end",
              nextFunc = nil
            }, nil)
            decideButtonMenu:SetItemLink4(2, 1, 0, 2, 2)
            decideButtonMenu:SetOption({inputMode = "LINK", iconCursor = "EC"})
            function decideButtonMenu:decideAction()
              if self.curItem.obj.nextFunc ~= nil then
                nextstate = self.curItem.obj.nextFunc
                if test_mode == false then
                  EC:SetSelectIndex(ecSelectMenu:GetCursorIndex())
                end
                self:Close()
                ecSelectMenu:Close()
                bEcSelectMenuFlag = false
                exitButtonMenu:Close()
              else
                self:Close()
                ecSelectMenu:SetArrowVisible(true)
                exitButtonMenu:SetVisible(true)
                ecSelectMenu:UnselectItem()
                gEcMenuParameter.dialogWindow:UnselectItem()
              end
            end
            function decideButtonMenu:cancelAction()
              nextstate = "PurchaseSelectItem01"
              self:Close()
              ecSelectMenu:SetArrowVisible(true)
              exitButtonMenu:SetVisible(true)
              ecSelectMenu:UnselectItem()
              gEcMenuParameter.dialogWindow:UnselectItem()
            end
            function decideButtonMenu:currentItemChange()
            end
            decideButtonMenu:SetCursorItemIndex(2)
            NestMenu_OpenAndCloseWait(decideButtonMenu)
          else
            SOUND:PlaySe(SymSnd("SE_SYS_NO_SELECT"))
          end
        end
        function ecSelectMenu:cancelAction()
          nextstate = "PurchaseStartup"
          self:Close()
          bEcSelectMenuFlag = false
          exitButtonMenu:Close()
        end
        function ecSelectMenu:callUpdate()
          nextstate = "PurchaseStartup"
          self:SetUpdateCallFlag(false)
          self:Close()
          bEcSelectMenuFlag = false
          exitButtonMenu:Close()
        end
        function ecSelectMenu:currentItemChange()
          SOUND:PlaySe(SymSnd("SE_SYS_CURSOR"))
          _UpdateDialogWindow(ecSelectMenu:GetCursorIndex() + disp_item_offset, disp_item_offset)
        end
        function ecSelectMenu:changeFocus()
          ecSelectMenu:SetIsRequireFocusFlag(true)
          ecSelectMenu:SetChangeFoucs(false)
          exitButtonMenu:SetVisibleIconCursor(true)
          _SetVisibleDialogWindowText(false)
          MENU:SetFocus(exitButtonMenu)
        end
        function ecSelectMenu:inputRSelectAction()
          disp_item_offset = disp_item_offset + 3
          SYSTEM:DebugPrint(string.format("r select\n"))
          if disp_item_offset <= item_max then
          else
            disp_item_offset = 1
          end
          SOUND:PlaySe(SymSnd("SE_SYS_SLIDE"))
          if test_mode == false then
            EC:SetCatalogOffset(disp_item_offset - 1)
          end
          nextstate = "PurchaseSelectItem"
          _SetVisibleDialogWindowItemIcon(false)
          self:Close()
          bEcSelectMenuFlag = false
          SYSTEM:DebugPrint(string.format("r close\n"))
          exitButtonMenu:Close()
        end
        function ecSelectMenu:inputLSelectAction()
          disp_item_offset = disp_item_offset - 3
          SYSTEM:DebugPrint(string.format("l select\n"))
          if disp_item_offset >= 1 then
          else
            disp_item_offset = math.floor((item_max - 1) / 3) * 3 + 1
          end
          SOUND:PlaySe(SymSnd("SE_SYS_SLIDE"))
          if test_mode == false then
            EC:SetCatalogOffset(disp_item_offset - 1)
          end
          nextstate = "PurchaseSelectItem"
          _SetVisibleDialogWindowItemIcon(false)
          self:Close()
          bEcSelectMenuFlag = false
          SYSTEM:DebugPrint(string.format("l close\n"))
          exitButtonMenu:Close()
        end
        local nowamount = MENU:GetTextPoolText(1138412227)
        if test_mode == false then
          nowamount = MENU:GetTextPoolText(-77840359) .. " " .. EC:GetDisplayCurrencyPrefix() .. EC:GetNowAmount() .. EC:GetDisplayCurrencySuffix()
        end
        _OpenDialogWindow(disp_item_offset, nowamount, disp_item_offset)
        _SetVisibleDialogWindow(true)
        NestMenu_OpenAndCloseWait(ecSelectMenu)
        bEcSelectMenuFlag = false
        _CloseDialogWindow()
        CommonSys:CloseBasicMenu()
        TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
        TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
        FlowSys:Next(nextstate)
      end
    elseif iResult == -1 then
      FlowSys:Next("PurchaseError")
    end
  end
  function FlowSys.Proc.PurchaseSelectItemDecide()
    FlowSys:Next("PurchaseEnd")
  end
  function FlowSys.Proc.PurchaseBalance()
    m_iStateInit = 1
    FlowSys:Next("PurchaseBalance01")
  end
  function FlowSys.Proc.PurchaseBalance01()
    local iResult = 1
    if test_mode == false then
      iResult = EC:Balance(m_iStateInit)
    end
    m_iStateInit = 0
    if iResult == 0 then
      TASK:Sleep(TimeSec(0))
      FlowSys:Next("PurchaseBalance01")
    elseif iResult == 1 then
      FlowSys:Next("PurchaseSelectItem")
    elseif iResult == -1 then
      FlowSys:Next("PurchaseError")
    end
  end
  function FlowSys.Proc.PurchasePurchaseContent()
    m_iStateInit = 1
    FlowSys:Next("PurchasePurchaseContent01")
  end
  function FlowSys.Proc.PurchasePurchaseContent01()
    local iResult = 1
    if test_mode == false then
      iResult = EC:PurchaseContent(m_iStateInit)
    end
    m_iStateInit = 0
    if iResult == 0 then
      TASK:Sleep(TimeSec(0))
      FlowSys:Next("PurchasePurchaseContent01")
    elseif iResult == 1 then
      FlowSys:Next("PurchaseSelectItem")
    elseif iResult == -1 then
      FlowSys:Next("PurchaseError")
    end
  end
  function FlowSys.Proc.PurchaseDeleteContent()
    m_iStateInit = 1
    FlowSys:Next("PurchaseDeleteContent01")
  end
  function FlowSys.Proc.PurchaseDeleteContent01()
    local iResult = 1
    if test_mode == false then
      iResult = EC:DeleteContent(m_iStateInit)
    end
    m_iStateInit = 0
    if iResult == 0 then
      TASK:Sleep(TimeSec(0))
      FlowSys:Next("PurchaseDeleteContent01")
    elseif iResult == 1 then
      FlowSys:Next("PurchaseSelectItem")
    elseif iResult == -1 then
      FlowSys:Next("PurchaseError")
    end
  end
  function FlowSys.Proc.PurchaseReDownloadContent()
    m_iStateInit = 1
    FlowSys:Next("PurchaseReDownloadContent01")
  end
  function FlowSys.Proc.PurchaseReDownloadContent01()
    local iResult = 1
    if test_mode == false then
      iResult = EC:ReDownloadContent(m_iStateInit)
    end
    m_iStateInit = 0
    if iResult == 0 then
      TASK:Sleep(TimeSec(0))
      FlowSys:Next("PurchaseReDownloadContent01")
    elseif iResult == 1 then
      FlowSys:Next("PurchaseSelectItem")
    elseif iResult == -1 then
      FlowSys:Next("PurchaseError")
    end
  end
  function FlowSys.Proc.PurchaseError()
    FlowSys:Next("PurchaseStartup")
  end
  function FlowSys.Proc.PurchaseItemError()
    WINDOW:SetMessageScreenMode(ScreenType.B)
    WINDOW:SysMsg(DLC_CONTENTS__DLC_NO_ITEM_ERROR)
    WINDOW:CloseMessage()
    WINDOW:SetMessageScreenMode(ScreenType.A)
    FlowSys:Next("PurchaseEnd")
  end
  function FlowSys.Proc.PurchaseEnd()
    FlowSys:Return()
  end
  SCREEN_A:LoadWallpaper("WALLPAPER_MAIN_DLC")
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_DLC")
  SCREEN_A:FadeInAll(TimeSec(2, TIME_TYPE.FRAME), false)
  SCREEN_B:FadeInAll(TimeSec(2, TIME_TYPE.FRAME), true)
  FlowSys:Call("PurchaseStartup")
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0.5), false)
  SCREEN_B:FadeOutAll(TimeSec(0.5), true)
  FlowSys:Finish()
  ShopSys:Finish()
  ecSelectMenu = nil
  _DestroyParameter()
end
function _OpenDialogWindow(num, am, offset)
  _CloseDialogWindow()
  gEcMenuParameter.dialogWindow = MENU:CreateEcMenuWindow(ScreenType.A)
  gEcMenuParameter.dialogWindow:SetTextAmount(am)
  gEcMenuParameter.dialogWindow:SetLayoutPosition(0, 0)
  gEcMenuParameter.dialogWindow:SetOption({font = "FONT_16"})
  gEcMenuParameter.dialogWindow:Open()
  gEcMenuParameter.dialogWindow:SetVisible(false)
  _UpdateDialogWindow(num, offset)
end
function _SetVisibleDialogWindow(enable)
  gEcMenuParameter.dialogWindow:SetVisible(enable)
end
function _SetVisibleDialogWindowText(bVisible)
  gEcMenuParameter.dialogWindow:SetVisibleText(bVisible)
end
function _SetVisibleDialogWindowItemIcon(bVisible)
  gEcMenuParameter.dialogWindow:SetVisibleItemIcon(bVisible)
end
function _UpdateDialogWindow(num, offset)
  gEcMenuParameter.dialogWindow:SetTextOffset(88, 16)
  gEcMenuParameter.dialogWindow:SetText(demo_disp_table[num].title)
  gEcMenuParameter.dialogWindow:SetTextOffsetDesc(88, 32)
  gEcMenuParameter.dialogWindow:SetTextDesc(demo_disp_table[num].subTitle)
  gEcMenuParameter.dialogWindow:SetTextOffsetDif(108, 48)
  gEcMenuParameter.dialogWindow:SetTextDif(demo_disp_table[num].merit)
  gEcMenuParameter.dialogWindow:SetTextOffsetRelease(88, 16)
  gEcMenuParameter.dialogWindow:SetTextRelease(demo_disp_table[num].release)
  gEcMenuParameter.dialogWindow:SetTextOffsetBlock(88, 32)
  gEcMenuParameter.dialogWindow:SetTextBlock(demo_disp_table[num].block)
  gEcMenuParameter.dialogWindow:SetTextOffsetPrice(108, 48)
  gEcMenuParameter.dialogWindow:SetTextPrice(demo_disp_table[num].money)
  gEcMenuParameter.dialogWindow:SetVisibleNew(demo_disp_table[num].new == "TRUE")
  gEcMenuParameter.dialogWindow:SetVisibleReceived(demo_disp_table[num].received == "TRUE")
  gEcMenuParameter.dialogWindow:SetVisibleDoneShopping(demo_disp_table[num].shopping == "TRUE")
  gEcMenuParameter.dialogWindow:SetIndex(num - offset)
end
function _CloseDialogWindow()
  if gEcMenuParameter.dialogWindow then
    gEcMenuParameter.dialogWindow:Close()
    gEcMenuParameter.dialogWindow = nil
  end
end
function _OpenMoneyWindow()
  _CloseMoneyWindow()
  gEcMenuParameter.moneyWindow = MENU:CreateEcMenuWindow(ScreenType.A)
  gEcMenuParameter.moneyWindow:SetLayoutPosition(0, 0)
  gEcMenuParameter.moneyWindow:SetOption({font = "FONT_16"})
  gEcMenuParameter.moneyWindow:Open()
  gEcMenuParameter.moneyWindow:SetVisible(false)
  _UpdateMoneyWindow(100)
end
function _SetVisibleMoneyWindow(enable)
  gEcMenuParameter.moneyWindow:SetVisible(enable)
end
function _UpdateMoneyWindow(iMoney)
  MENU:SetTag_Value(0, iMoney)
  gEcMenuParameter.moneyWindow:SetText(-77840359)
end
function _CloseMoneyWindow()
  if gEcMenuParameter.moneyWindow then
    gEcMenuParameter.moneyWindow:Close()
    gEcMenuParameter.moneyWindow = nil
  end
end
function ______EcAddContentsMenu()
  SYSTEM:DebugPrint("Reload.. menu_shop_warehouse.lua")
  MENU:DebugReloadMenuScript("script/menu/menu_test_abe.lua")
  MENU:DebugReloadMenuScript("script/menu/menu_shop_main.lua")
  MENU:DebugReloadMenuScript("script/menu/menu_shop_common.lua")
  FlowSys:SetDebugPrintEnable(true)
  _CreateParameter()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  local m_iStateInit, ecMenu, ecSelectMenu, decideButtonMenu, dialogWindow, button1Window, button2Window, button3Window
  local test_mode = false
  function FlowSys.Proc.PurchaseStartup()
    ecMenu = MENU:CreateEcSelectMenu()
    dialogWindow = MENU:CreateEcMenuWindow(ScreenType.A)
    dialogWindow:SetLayoutPosition(0, 0)
    dialogWindow:SetOption({font = "FONT_16"})
    dialogWindow:SetTextOffset(140, 16)
    dialogWindow:SetText(1350044038)
    dialogWindow:SetTextOffsetDesc(140, 32)
    dialogWindow:SetTextDesc(200373891)
    dialogWindow:SetTextOffsetDif(160, 48)
    dialogWindow:SetTextDif(-569810821)
    dialogWindow:Open()
    dialogWindow:SetVisible(false)
    SAJI:CreateSajiPlayer("item_cursor", "DLC_CURSOR")
    SJ("item_cursor"):SetScreenType(ScreenType.B)
    SJ("item_cursor"):SetPosition(Vector2(56, 36))
    SJ("item_cursor"):SetVisible(false)
    button1Window = MENU:CreateButtonMenuWindow()
    button1Window:SetLayoutPosition(4, 216)
    button1Window:SetOption({font = "FONT_12"})
    button1Window:SetText(1482059964)
    button1Window:Open()
    button1Window:SetVisible(false)
    button2Window = MENU:CreateButtonMenuWindow()
    button2Window:SetLayoutPosition(112, 216)
    button2Window:SetOption({font = "FONT_12"})
    button2Window:SetText(-1964687384)
    button2Window:Open()
    button2Window:SetVisible(false)
    button3Window = MENU:CreateButtonMenuWindow()
    button3Window:SetLayoutPosition(220, 216)
    button3Window:SetOption({font = "FONT_12"})
    button3Window:SetText(538288248)
    button3Window:Open()
    button3Window:SetVisible(false)
    FlowSys:Next("PurchaseStartup_MakeScreen")
  end
  function FlowSys.Proc.PurchaseStartup_MakeScreen()
    SCREEN_B:FadeOut(TimeSec(2, TIME_TYPE.FRAME), true)
    SCREEN_A:LoadWallpaper("WALLPAPER_MAIN_DLC")
    SCREEN_B:LoadWallpaper("WALLPAPER_SUB_DLC")
    SCREEN_B:FadeIn(TimeSec(4, TIME_TYPE.FRAME), false)
    FlowSys:Next("PurchaseStartup_Menu")
  end
  function FlowSys.Proc.PurchaseStartup_Menu()
    ShopSys:SaveCursorIndex("saveItem", nil)
    ShopSys:SaveCursorIndex("saveMoney", nil)
    CommonSys:OpenBasicMenu(SHOP_WAREHOUSE__CAPTION_TOP, nil, nil, true)
    DispTopFunction("saveTop", "ExitWarehouse", {
      text = -1254126922,
      next = "PurchaseListContents",
      exp = SHOP_WAREHOUSE__EXP_SELECT_ITEM
    }, {
      text = 190547068,
      next = "PurchaseListContentsTest",
      exp = SHOP_WAREHOUSE__EXP_SELECT_MONEY
    }, {
      text = 1000739703,
      next = "PurchaseEnd",
      exp = SHOP_WAREHOUSE__EXP_SELECT_MONEY
    })
    WINDOW:ForceCloseMessage()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
  end
  function FlowSys.Proc.PurchaseListContents()
    WINDOW:CloseMessage()
    SCREEN_B:FadeOut(TimeSec(2, TIME_TYPE.FRAME), true)
    SCREEN_B:FadeIn(TimeSec(4, TIME_TYPE.FRAME), false)
    FlowSys:Next("PurchaseListContents01")
  end
  function FlowSys.Proc.PurchaseListContentsTest()
    test_mode = true
    FlowSys:Next("PurchaseListContents")
  end
  function FlowSys.Proc.PurchaseListContents01()
    WINDOW:CloseMessage()
    FlowSys:Next("PurchaseListContents02")
  end
  function FlowSys.Proc.PurchaseListContents02()
    m_iStateInit = 1
    FlowSys:Next("PurchaseListContents03")
  end
  function FlowSys.Proc.PurchaseListContents03()
    iResult = 1
    if test_mode == false then
      iResult = EC:GetListContents(m_iStateInit)
    end
    m_iStateInit = 0
    if iResult == 0 then
      TASK:Sleep(TimeSec(0))
      FlowSys:Next("PurchaseListContents03")
    elseif iResult == 1 then
      FlowSys:Next("PurchaseSelectItem")
    elseif iResult == -1 then
      FlowSys:Next("PurchaseError")
    end
  end
  function FlowSys.Proc.PurchaseSelectItem()
    m_iStateInit = 1
    dialogWindow:SetVisible(true)
    button1Window:SetVisible(true)
    button2Window:SetVisible(true)
    button3Window:SetVisible(true)
    SPRT("dialogA"):SetVisible(true)
    SPRT("dialogA2"):SetVisible(true)
    SPRT("select1"):SetVisible(true)
    SPRT("select2"):SetVisible(true)
    SPRT("select3"):SetVisible(true)
    SPRT("addmoney"):SetVisible(true)
    SPRT("purchase"):SetVisible(true)
    SPRT("exit"):SetVisible(true)
    SJ("item_cursor"):Play(LOOP.ON)
    SJ("item_cursor"):SetVisible(true)
    button1Window:SetVisible(true)
    button2Window:SetVisible(true)
    button3Window:SetVisible(true)
    FlowSys:Next("PurchaseSelectItem01")
  end
  function FlowSys.Proc.PurchaseSelectItem01()
    local iResult = 1
    if text_mode == false then
    end
    m_iStateInit = 0
    if iResult == 0 then
      TASK:Sleep(TimeSec(0))
      FlowSys:Next("PurchaseSelectItem01")
    elseif iResult == 1 then
      WINDOW:CloseMessage()
      CommonSys:OpenBasicMenu(2056227232, nil, nil, true)
      WINDOW:ForceCloseMessage()
      TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
      return
    elseif iResult == -1 then
      FlowSys:Next("PurchaseSelectItem01")
    end
  end
  function FlowSys.Proc.PurchaseSelectItem01()
    local iResult = 1
    if text_mode == false then
    end
    m_iStateInit = 0
    if iResult == 0 then
      TASK:Sleep(TimeSec(0))
      FlowSys:Next("PurchaseSelectItem01")
    elseif iResult == 1 then
      WINDOW:CloseMessage()
      CommonSys:OpenBasicMenu(2056227232, nil, nil, true)
      WINDOW:ForceCloseMessage()
      TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
      return
    elseif iResult == -1 then
      FlowSys:Next("PurchaseSelectItem01")
    end
  end
  function FlowSys.Proc.PurchasePurchaseContent()
    m_iStateInit = 1
    FlowSys:Next("PurchasePurchaseContent01")
  end
  function FlowSys.Proc.PurchasePurchaseContent01()
    local iResult = 1
    if text_mode == false then
      iResult = EC:PurchaseContent(m_iStateInit)
    end
    m_iStateInit = 0
    if iResult == 0 then
      TASK:Sleep(TimeSec(0))
      FlowSys:Next("PurchasePurchaseContent01")
    elseif iResult == 1 then
      FlowSys:Next("PurchaseSelectItem")
    elseif iResult == -1 then
      FlowSys:Next("PurchaseError")
    end
  end
  function FlowSys.Proc.PurchaseEnd()
    FlowSys:Return()
  end
  WINDOW:SetMessageScreenMode(ScreenType.B)
  FlowSys:Call("PurchaseStartup")
  FlowSys:Finish()
  ShopSys:Finish()
  EcMenu:Close()
end
function DispTopFunction(saveCursorName, cancelNext, ...)
  local nextFlow
  local ArgsLayoutRectAndLine = function(left, top, right, lines)
    return left + 8, top + 8, right - left - 16, lines
  end
  local sizeH = 128
  local itemChangeAct = function(exp)
  end
  local topMenu = MENU:CreatePageMenu()
  topMenu:SetLayoutRectAndLines(ArgsLayoutRectAndLine(8, 32, 160, 0))
  topMenu:ShowPageNum(false)
  for i, command in ipairs({
    ...
  }) do
    topMenu:AddItem(command.text, command, nil)
  end
  function topMenu:openedAction()
    self:SetCursorItemIndex(ShopSys:ResumeCursorIndex(saveCursorName, 0))
    itemChangeAct(self.curItem.obj.exp)
  end
  function topMenu:closedAction()
    ShopSys:SaveCursorIndex(saveCursorName, self:GetCursorItemIndex())
  end
  function topMenu:decideAction()
    if self.curItem.obj.call then
      MENU:ClearFocus(topMenu)
      FlowSys:Call(self.curItem.obj.call)
      MENU:SetFocus(topMenu)
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
  _DestroyParameter()
end
function DispDlcAskMessage(msg, id1, id2)
  local infoMenu = OpenDlcMessage(msg)
  local result = false
  local askButtonMenu = MENU:CreateButtonMenu()
  if id2 == -1 then
    askButtonMenu:AddFixedPatternItem(id1, 0, 8, ButtonFixedPattern.EC_ICON, 108, 204, {font = "font16", result = true}, nil)
    askButtonMenu:SetItemLink4(0, 0, 0, 0, 0)
  else
    askButtonMenu:AddFixedPatternItem(id1, 0, 8, ButtonFixedPattern.EC_ICON, 44, 204, {font = "font16", result = true}, nil)
    askButtonMenu:AddFixedPatternItem(id2, 0, 8, ButtonFixedPattern.EC_ICON, 172, 204, {font = "font16", result = false}, nil)
    askButtonMenu:SetItemLink4(0, 1, 1, 0, 0)
    askButtonMenu:SetItemLink4(1, 0, 0, 1, 1)
  end
  askButtonMenu:SetOption({inputMode = "LINK", iconCursor = "EC"})
  askButtonMenu:Open()
  function askButtonMenu:decideAction()
    result = self.curItem.obj.result
    askButtonMenu:Close()
    CloseDlcMessage(infoMenu)
  end
  function askButtonMenu:cancelAction()
    askButtonMenu:Close()
    CloseDlcMessage(infoMenu)
  end
  BasicMenu_OpenAndCloseWait(askButtonMenu)
  return result
end
function OpenDlcMessage(_msg)
  local msg = MENU:ReplaceTagText(_msg)
  local w = 280
  local h = (MENU:GetTextReturnNum(msg) + 1) * 24 + 32
  local infoMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
  infoMenu:SetLayoutRect(Rectangle((320 - w) / 2, (240 - h) / 2, w, h))
  infoMenu:SetTextOffset(0, 0)
  infoMenu:SetOption({
    frameMode = FrameMode.INFOMATION
  })
  infoMenu:Open()
  WINDOW:SetMessageScreenMode(ScreenType.B)
  WINDOW:Explanation(string.format("[VO:%d]", (240 - h) / 2 - 16) .. msg)
  WINDOW:SetMessageScreenMode(ScreenType.A)
  return infoMenu
end
function CloseDlcMessage(_infoMenu)
  _infoMenu:Close()
  WINDOW:ForceCloseMessage()
end

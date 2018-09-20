function OpenLotteryMenu(shopIns, landIndex, spaceIndex)
  local m_ticketPrice = 100
  local m_lotteryNum = 0
  local m_lotType = 0
  local m_scratchUpdateItem = 0
  local m_selectLotteryType = 0
  local m_selectScratchType = 0
  local m_lotteryType = {
    none = 0,
    speed = 1,
    scratch = 2,
    days = 3
  }
  local m_ticketType = {
    none = -1,
    bronze = 0,
    silver = 1,
    gold = 2
  }
  local m_selectTicketType = m_ticketType.none
  local m_colorType = {
    none = 0,
    red = 1,
    blue = 2,
    yellow = 3
  }
  local m_selectColorType = m_colorType.none
  local m_resultType = {
    crtHit = 0,
    hit = 1,
    blank = 2
  }
  local m_speedLotResult = m_resultType.none
  local m_priceList = {
    ["lot"] = 100,
    ["100"] = 100,
    ["500"] = 300,
    ["1000"] = 500
  }
  local m_speedSelectNameRed = 0
  local m_speedSelectNameBlue = 0
  local m_speedSelectNameYellow = 0
  local m_speedSelectColorDecideMessage = 0
  local m_bSpeedSelectColorCancel = false
  local m_bDaysTopNext = false
  local premiumsList
  local EventPlay = {}
  function GROUND:IsEnoughMoney(price)
    local money = GROUND:GetPlayerMoney()
    return price <= money
  end
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  SCREEN_B:FadeOutAll(TimeSec(0.1), true)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_LOT01")
  SCREEN_B:FadeInAll(TimeSec(0.1), false)
  function OpenSpeedPremiumsList()
    if premiumsList == nil then
      CommonSys:OpenBasicMenu(SHOP_LOTTERY__CAPTION_SPEED, SHOP_LOTTERY__MANUAL_SPEED, SHOP_LOTTERY__LINE_MESSAGE_SPEED)
      premiumsList = MENU:CreateBoardMenuWindow(ScreenType.B)
      premiumsList:SetLayoutRect(Rectangle(20, 36, 280, 152))
      premiumsList:SetOption({font = "FONT_12"})
      premiumsList:SetTextOffset(0, 0)
      premiumsList:SetText(SHOP_PRG_MSG__LOTTERY_SPEED_PREMIUM)
      function premiumsList:drawFunc()
        premiumsList:DrawHorizontalLine(0, 20, 272)
      end
      premiumsList:Open()
    end
  end
  function CloseSpeedPremiumsList()
    if premiumsList then
      premiumsList:Close()
      premiumsList = nil
    end
    CommonSys:CloseBasicMenu()
  end
  function SpeedPremiumsListCurrentItemChange(index)
    if premiumsList then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152\229\188\149\227\129\141\229\136\184", shopIns:GetText_SpeedLotteryTicket(index))
      CommonSys:UpdateBasicMenu_LineHelp(SHOP_LOTTERY__LINE_MESSAGE_SPEED)
      shopIns:SetPremiumsText(index)
      premiumsList:SetText(SHOP_PRG_MSG__LOTTERY_SPEED_PREMIUM)
    end
  end
  function OpenScratchPremiumsList(isUnderMenu)
    if premiumsList == nil then
      if isUnderMenu then
        CommonSys:OpenBasicMenu(SHOP_LOTTERY__CAPTION_SCRATCH_SELECT, SHOP_LOTTERY__MANUAL_SCRATCH_SELECT, SHOP_LOTTERY__LINE_MESSAGE_SCRATCH)
        premiumsList = MENU:CreateLotteryPremiumsMenu(ScreenType.B)
        premiumsList:SetLayoutRect(Rectangle(24, 40, 272, 144))
      else
        premiumsList = MENU:CreateLotteryPremiumsMenu(ScreenType.A)
        premiumsList:SetLayoutRect(Rectangle(64, 40, 272, 144))
      end
      premiumsList:SetLotteryType(0)
      premiumsList:SetTextOffset(8, 0)
      premiumsList:SetOption({font = "FONT_16"})
      premiumsList:SetText(SHOP_PRG_MSG__LOTTERY_SCRATCH_PREMIUM)
      function premiumsList:drawFunc()
        premiumsList:DrawHorizontalLine(0, 30, 272)
        premiumsList:DrawHorizontalLine(0, 90, 272)
      end
      premiumsList:Open()
    end
  end
  function CloseScratchPremiumsList()
    if premiumsList then
      premiumsList:Close()
      premiumsList = nil
    end
    CommonSys:CloseBasicMenu()
  end
  function ScratchPremiumsListCurrentItemChange(index)
    if premiumsList then
      shopIns:SetScratchPremiumsText(index)
      premiumsList:SetLotteryType(index)
      premiumsList:SetText(SHOP_PRG_MSG__LOTTERY_SCRATCH_PREMIUM)
      premiumsList:Update()
    end
  end
  function FlowSys.Proc.MenuTopLot()
    m_lotType = m_lotteryType.none
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_LOTTERY__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "LotExit"}, {
      text = SHOP_LOTTERY__WELCOME_SPEED,
      next = "SpeedTopBefore"
    }, {
      text = SHOP_LOTTERY__WELCOME_SCRATCH,
      next = "ScratchTopBefore"
    }, {
      text = SHOP_LOTTERY__WELCOME_LOTTERY,
      next = "LotteryTopBefore"
    }, {text = SHOP_LOTTERY__WELCOME_HELP, next = "LotHelp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopLotLoop()
    m_lotType = m_lotteryType.none
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_LOTTERY__SERIES, nil, {cursorReset = true}, {next = "LotExit"}, {
      text = SHOP_LOTTERY__SERIES_SPEED,
      next = "SpeedTopBefore"
    }, {
      text = SHOP_LOTTERY__SERIES_SCRATCH,
      next = "ScratchTopBefore"
    }, {
      text = SHOP_LOTTERY__SERIES_LOTTERY,
      next = "LotteryTopBefore"
    }, {text = SHOP_LOTTERY__SERIES_HELP, next = "LotHelp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.LotHelp()
    ShopSys:Talk(SHOP_LOTTERY__HELP, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLotLoop")
  end
  function FlowSys.Proc.LotExit()
    ShopSys:Talk(SHOP_LOTTERY__EXIT, nil)
    FlowSys:Return()
  end
  function OpenBuyLotteryMenu(lotType)
    CommonSys:OpenBasicMenu(SHOP_LOTTERY__CAPTION_LOTTERY_NUMBER, SHOP_LOTTERY__MANUAL_LOTTERY_NUMBER, nil)
    local moneyMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
    moneyMenu:SetLayoutRect(Rectangle(240, 40, 64, 32))
    moneyMenu:SetTextOffset(0, 0)
    moneyMenu:SetFontType(FontType.TYPE_12)
    moneyMenu:SetText(shopIns:GetText_LotteryMoney(0))
    moneyMenu:Open()
    local menu = MENU:CreateNumericMenuWindow(ScreenType.B)
    menu:SetLayoutRect(Rectangle(106, 88, 108, 68))
    menu:SetPlace(1)
    menu:SetDigit(2)
    menu:SetStartNum(0)
    menu:SetMaxNum(shopIns:GetHaveTicketNum(lotType))
    menu:SetType(NUM_MENU_TYPE.TYPE_DIGIT_ON)
    menu:SetTextOffset(38, 34)
    menu:SetTagLine(0, 17, 108)
    menu:SetActiveFlag(true)
    local decideNum = 0
    function menu:decideAction()
      decideNum = self:GetSettingData()
      local money = GROUND:GetPlayerMoney()
      local price = decideNum * 100
      self:Close()
    end
    function menu:cancelAction()
      self:Close()
    end
    function menu:inputAction()
      moneyMenu:SetText(shopIns:GetText_LotteryMoney(self:GetSettingData()))
    end
    menu:Open()
    menu:SetTagText(MENU:GetTextPoolText(SHOP_PRG_MSG__LOTTERY_TICKET_NUM_MENU_CAPTION))
    MENU:SetFocus(menu)
    MENU:WaitClose(menu)
    moneyMenu:Close()
    CommonSys:CloseBasicMenu()
    return decideNum
  end
  function FlowSys.Proc.SpeedTopBefore()
    m_selectTicketType = m_ticketType.none
    m_lotType = m_lotteryType.speed
    local level = shopIns:GetShopLevel()
    local gold = shopIns:GetTicketNum(m_ticketType.gold)
    local silver = shopIns:GetTicketNum(m_ticketType.silver)
    local blonze = shopIns:GetTicketNum(m_ticketType.bronze)
    local nAddCount = 0
    local haveTickets = false
    local nextFlow
    local askMenu = MENU:CreateAskMenu()
    if level >= 1 then
      askMenu:AddItem(shopIns:GetText_SpeedLotteryTicket(m_ticketType.bronze), nil, {
        decideAction = function(self)
          m_selectTicketType = m_ticketType.bronze
          nextFlow = "SelectLotTicketBlonze"
          self:CloseAndClearFocus()
        end
      })
      if blonze > 0 then
        haveTickets = true
      else
        askMenu:SetCurrentModifyItem(0)
        askMenu.curItem.grayed = true
      end
      nAddCount = nAddCount + 1
    end
    if level >= 2 then
      askMenu:AddItem(shopIns:GetText_SpeedLotteryTicket(m_ticketType.silver), nil, {
        decideAction = function(self)
          m_selectTicketType = m_ticketType.silver
          nextFlow = "SelectLotTicketSilver"
          self:CloseAndClearFocus()
        end
      })
      if silver > 0 then
        haveTickets = true
      else
        askMenu:SetCurrentModifyItem(1)
        askMenu.curItem.grayed = true
      end
      nAddCount = nAddCount + 1
    end
    if level >= 3 then
      askMenu:AddItem(shopIns:GetText_SpeedLotteryTicket(m_ticketType.gold), nil, {
        decideAction = function(self)
          m_selectTicketType = m_ticketType.gold
          nextFlow = "SelectLotTicketGold"
          self:CloseAndClearFocus()
        end
      })
      if gold > 0 then
        haveTickets = true
      else
        askMenu:SetCurrentModifyItem(2)
        askMenu.curItem.grayed = true
      end
      nAddCount = nAddCount + 1
    end
    function askMenu:cancelAction()
      CloseSpeedPremiumsList()
      nextFlow = "MenuTopLotLoop"
      self:CloseAndClearFocus()
    end
    function askMenu:currentItemChange()
      SpeedPremiumsListCurrentItemChange(self:GetCursorItemIndex())
    end
    local bColorCancel = m_bSpeedSelectColorCancel
    m_bSpeedSelectColorCancel = false
    if haveTickets then
      local firstListMenuType = 0
      askMenu:Setup(true, true, false)
      WINDOW:DrawFace(20, 88, SymAct(ShopSys.ownerAct), FACE_TYPE.NORMAL)
      local nCheckKind = 0
      if gold > 0 and level >= 3 then
        nCheckKind = nCheckKind + 1
      end
      if silver > 0 and level >= 2 then
        nCheckKind = nCheckKind + 1
      end
      if blonze > 0 then
        nCheckKind = nCheckKind + 1
      end
      if nCheckKind == 1 then
        MENU:DestroyMenu(askMenu)
        askMenu = nil
        local askYesNoMenu = MENU:CreateAskMenu()
        if blonze > 0 then
          m_selectTicketType = m_ticketType.bronze
          askYesNoMenu:AddItem(SHOP_LOTTERY__SELECT_TICKET_ONLY_YES, nil, {
            decideAction = function(self)
              nextFlow = "SelectLotTicketBlonze"
              self:CloseAndClearFocus()
            end
          })
          MENU:SetTag_String(3, shopIns:GetText_SpeedLotteryTicket(m_ticketType.bronze))
        elseif silver > 0 then
          m_selectTicketType = m_ticketType.silver
          askYesNoMenu:AddItem(SHOP_LOTTERY__SELECT_TICKET_ONLY_YES, nil, {
            decideAction = function(self)
              nextFlow = "SelectLotTicketSilver"
              self:CloseAndClearFocus()
            end
          })
          MENU:SetTag_String(3, shopIns:GetText_SpeedLotteryTicket(m_ticketType.silver))
        elseif gold > 0 then
          m_selectTicketType = m_ticketType.gold
          askYesNoMenu:AddItem(SHOP_LOTTERY__SELECT_TICKET_ONLY_YES, nil, {
            decideAction = function(self)
              nextFlow = "SelectLotTicketGold"
              self:CloseAndClearFocus()
            end
          })
          MENU:SetTag_String(3, shopIns:GetText_SpeedLotteryTicket(m_ticketType.gold))
        end
        askYesNoMenu:AddItem(SHOP_LOTTERY__SELECT_TICKET_ONLY_NO, nil, {
          decideAction = function(self)
            CloseSpeedPremiumsList()
            nextFlow = "MenuTopLotLoop"
            self:CloseAndClearFocus()
          end
        })
        function askYesNoMenu:cancelAction()
          CloseSpeedPremiumsList()
          nextFlow = "MenuTopLotLoop"
          self:CloseAndClearFocus()
        end
        WINDOW:Talk(SymAct(ShopSys.ownerAct), SHOP_LOTTERY__SELECT_TICKET_ONLY)
        WINDOW:SelectSetLuaMenu(askYesNoMenu)
        firstListMenuType = m_selectTicketType
      else
        WINDOW:Talk(SymAct(ShopSys.ownerAct), SHOP_LOTTERY__SELECT_TICKET)
        WINDOW:SelectSetLuaMenu(askMenu)
      end
      if bColorCancel == false then
        shopIns:CreateSpeedPremium()
      end
      shopIns:SetPremiumsText(firstListMenuType)
      OpenSpeedPremiumsList()
      SpeedPremiumsListCurrentItemChange(firstListMenuType)
      WINDOW:SelectEndTalk(MENU_SELECT_MODE.ENABLE_CANCEL)
      FlowSys:Next(nextFlow)
    else
      MENU:DestroyMenu(askMenu)
      askMenu = nil
      if level == 1 and (gold > 0 or silver > 0) or level == 2 and gold > 0 then
        ShopSys:Talk(SHOP_LOTTERY__NO_TICKET_02, nil)
        WINDOW:KeyWait()
      else
        ShopSys:Talk(SHOP_LOTTERY__NO_TICKET, nil)
        WINDOW:KeyWait()
      end
      FlowSys:Next("MenuTopLotLoop")
    end
  end
  function FlowSys.Proc.SelectLotTicketGold()
    m_selectTicketType = m_ticketType.gold
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152\229\188\149\227\129\141\229\136\184", shopIns:GetText_SpeedLotteryTicket(m_selectTicketType))
    ShopSys:Talk(SHOP_LOTTERY__SPEED_SELECT_GOLD, nil)
    m_speedSelectNameRed = SHOP_LOTTERY__SPEED_COLOR_SELECT_RED_GOLD
    m_speedSelectNameBlue = SHOP_LOTTERY__SPEED_COLOR_SELECT_BLUE_GOLD
    m_speedSelectNameYellow = SHOP_LOTTERY__SPEED_COLOR_SELECT_YELLOW_GOLD
    FlowSys:Next("SelectColorSpeed")
  end
  function FlowSys.Proc.SelectLotTicketSilver()
    m_selectTicketType = m_ticketType.silver
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152\229\188\149\227\129\141\229\136\184", shopIns:GetText_SpeedLotteryTicket(m_selectTicketType))
    ShopSys:Talk(SHOP_LOTTERY__SPEED_SELECT_SILVER, nil)
    m_speedSelectNameRed = SHOP_LOTTERY__SPEED_COLOR_SELECT_RED_SILVER
    m_speedSelectNameBlue = SHOP_LOTTERY__SPEED_COLOR_SELECT_BLUE_SILVER
    m_speedSelectNameYellow = SHOP_LOTTERY__SPEED_COLOR_SELECT_YELLOW_SILVER
    FlowSys:Next("SelectColorSpeed")
  end
  function FlowSys.Proc.SelectLotTicketBlonze()
    m_selectTicketType = m_ticketType.bronze
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152\229\188\149\227\129\141\229\136\184", shopIns:GetText_SpeedLotteryTicket(m_selectTicketType))
    ShopSys:Talk(SHOP_LOTTERY__SPEED_SELECT_NORMAL, nil)
    m_speedSelectNameRed = SHOP_LOTTERY__SPEED_COLOR_SELECT_RED_NORMAL
    m_speedSelectNameBlue = SHOP_LOTTERY__SPEED_COLOR_SELECT_BLUE_NORMAL
    m_speedSelectNameYellow = SHOP_LOTTERY__SPEED_COLOR_SELECT_YELLOW_NORMAL
    FlowSys:Next("SelectColorSpeed")
  end
  function FlowSys.Proc.SelectLotTicketCancel()
    m_selectTicketType = m_ticketType.bronze
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152\229\188\149\227\129\141\229\136\184", shopIns:GetText_SpeedLotteryTicket(m_selectTicketType))
    ShopSys:Talk(SHOP_LOTTERY__SPEED_SELECT_NORMAL, nil)
    m_speedSelectNameRed = SHOP_LOTTERY__SPEED_COLOR_SELECT_RED_NORMAL
    m_speedSelectNameBlue = SHOP_LOTTERY__SPEED_COLOR_SELECT_BLUE_NORMAL
    m_speedSelectNameYellow = SHOP_LOTTERY__SPEED_COLOR_SELECT_YELLOW_NORMAL
    FlowSys:Next("SelectColorSpeed")
  end
  function FlowSys.Proc.SelectColorSpeed()
    m_selectColorType = m_colorType.none
    m_speedLotResult = m_resultType.none
    ShopSys:TalkAskFlowNoClose(SHOP_LOTTERY__SPEED_COLOR_SELECT, nil, {cursorReset = true}, {
      next = "CanselSelectColorSpeed"
    }, {
      text = m_speedSelectNameRed,
      next = "SpeedDecideColorRed"
    }, {
      text = m_speedSelectNameBlue,
      next = "SpeedDecideColorBlue"
    }, {
      text = m_speedSelectNameYellow,
      next = "SpeedDecideColorYellow"
    })
  end
  function FlowSys.Proc.CanselSelectColorSpeed()
    ShopSys:Talk(SHOP_LOTTERY__SPEED_COLOR_SELECT_CANSEL, nil)
    m_bSpeedSelectColorCancel = true
    FlowSys:Next("SpeedTopBefore")
  end
  function FlowSys.Proc.SpeedDecideColorRed()
    m_selectColorType = m_colorType.red
    m_speedSelectColorDecideMessage = SHOP_LOTTERY__SPEED_SELECT_COLOR_DECIDE_NORMAL
    FlowSys:Next("SpeedDecideColor")
  end
  function FlowSys.Proc.SpeedDecideColorBlue()
    m_selectColorType = m_colorType.blue
    m_speedSelectColorDecideMessage = SHOP_LOTTERY__SPEED_SELECT_COLOR_DECIDE_SILVER
    FlowSys:Next("SpeedDecideColor")
  end
  function FlowSys.Proc.SpeedDecideColorYellow()
    m_selectColorType = m_colorType.yellow
    m_speedSelectColorDecideMessage = SHOP_LOTTERY__SPEED_SELECT_COLOR_DECIDE_GOLD
    FlowSys:Next("SpeedDecideColor")
  end
  function FlowSys.Proc.SpeedDecideColor()
    local colorName = ""
    if m_selectColorType == m_colorType.red then
      colorName = m_speedSelectNameRed
    elseif m_selectColorType == m_colorType.blue then
      colorName = m_speedSelectNameBlue
    elseif m_selectColorType == m_colorType.yellow then
      colorName = m_speedSelectNameYellow
    end
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\232\137\178", colorName)
    ShopSys:TalkAskFlowNoClose(m_speedSelectColorDecideMessage, nil, nil, {
      next = "SelectColorSpeed"
    }, {
      text = SHOP_LOTTERY__SPEED_SELECT_COLOR_DECIDE_EXPLAIN,
      next = "DecideSpeedLotteryResult",
      default = true
    }, {
      text = SHOP_LOTTERY__SPEED_SELECT_COLOR_DECIDE_EXIT,
      next = "SelectColorSpeed"
    })
  end
  function FlowSys.Proc.DecideSpeedLotteryResult()
    CloseSpeedPremiumsList()
    ShopSys:Talk(SHOP_LOTTERY__SPEED_CHALLENGE, nil)
    m_speedLotResult = shopIns:LotterySpeedLot(m_selectTicketType, m_selectColorType)
    local nextFlow
    local hitType = shopIns:GetCurrentHitType(m_lotType)
    if hitType == m_resultType.crtHit then
      EventPlay.eventShopLotterySpecialHit(spaceIndex)
      nextFlow = "LotteryGift"
    elseif hitType == m_resultType.hit then
      EventPlay.eventShopLotteryHit(spaceIndex)
      nextFlow = "LotteryGift"
    else
      EventPlay.eventShopLotteryBlank()
      shopIns:DeleteCurrentItems(m_lotType)
      nextFlow = "CheckFinishLottery"
    end
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.ScratchTopBefore()
    m_lotType = m_lotteryType.scratch
    local level = shopIns:GetShopLevel()
    nextFlow = nil
    local askMenu = MENU:CreateAskMenu()
    if level == 1 then
      askMenu:AddItem(SHOP_LOTTERY__SELECT_SCRATCH_ONLY_YES, nil, {
        decideAction = function(self)
          nextFlow = "SelectScratch100"
          self:CloseAndClearFocus()
        end
      })
      askMenu:AddItem(SHOP_LOTTERY__SELECT_SCRATCH_ONLY_NO, nil, {
        decideAction = function(self)
          CloseScratchPremiumsList()
          nextFlow = "MenuTopLotLoop"
          self:CloseAndClearFocus()
        end
      })
    else
      askMenu:AddItem(shopIns:GetText_ScratchLotteryName(0), nil, {
        decideAction = function(self)
          nextFlow = "SelectScratch100"
          self:CloseAndClearFocus()
        end
      })
      if level >= 2 then
        askMenu:AddItem(shopIns:GetText_ScratchLotteryName(1), nil, {
          decideAction = function(self)
            nextFlow = "SelectScratch500"
            self:CloseAndClearFocus()
          end
        })
      end
      if level >= 3 then
        askMenu:AddItem(shopIns:GetText_ScratchLotteryName(2), nil, {
          decideAction = function(self)
            nextFlow = "SelectScratch1000"
            self:CloseAndClearFocus()
          end
        })
      end
      function askMenu:currentItemChange()
        ScratchPremiumsListCurrentItemChange(self:GetCursorItemIndex())
      end
    end
    function askMenu:cancelAction()
      CloseScratchPremiumsList()
      nextFlow = "MenuTopLotLoop"
      self:CloseAndClearFocus()
    end
    askMenu:Setup(true, true, false)
    WINDOW:DrawFace(20, 88, SymAct(ShopSys.ownerAct), FACE_TYPE.NORMAL)
    if level == 1 then
      ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", MENU:ReplaceTagText(shopIns:GetText_ScratchLotteryName(0)))
      WINDOW:Talk(SymAct(ShopSys.ownerAct), SHOP_LOTTERY__SELECT_SCRATCH_ONLY)
    else
      WINDOW:Talk(SymAct(ShopSys.ownerAct), SHOP_LOTTERY__SELECT_SCRATCH)
    end
    WINDOW:SelectSetLuaMenu(askMenu)
    ShopSys:DispMoneyWindowOpen()
    shopIns:SetScratchPremiumsText(0)
    OpenScratchPremiumsList(true)
    WINDOW:SelectEndTalk(MENU_SELECT_MODE.ENABLE_CANCEL)
    ShopSys:DispMoneyWindowClose()
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.SelectScratch100()
    if GROUND:IsEnoughMoney(m_priceList["100"]) then
      m_selectScratchType = 0
      FlowSys:Next("CheckScratch")
    else
      CloseScratchPremiumsList()
      ShopSys:Talk(SHOP_LOTTERY__NO_MONEY_SCRATCH, nil)
      FlowSys:Next("ScratchTopBefore")
    end
  end
  function FlowSys.Proc.SelectScratch500()
    if GROUND:IsEnoughMoney(m_priceList["500"]) then
      m_selectScratchType = 1
      FlowSys:Next("CheckScratch")
    else
      CloseScratchPremiumsList()
      ShopSys:Talk(SHOP_LOTTERY__NO_MONEY_SCRATCH, nil)
      FlowSys:Next("ScratchTopBefore")
    end
  end
  function FlowSys.Proc.SelectScratch1000()
    if GROUND:IsEnoughMoney(m_priceList["1000"]) then
      m_selectScratchType = 2
      FlowSys:Next("CheckScratch")
    else
      CloseScratchPremiumsList()
      ShopSys:Talk(SHOP_LOTTERY__NO_MONEY_SCRATCH, nil)
      FlowSys:Next("ScratchTopBefore")
    end
  end
  function FlowSys.Proc.CheckScratch()
    CloseScratchPremiumsList()
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:Talk(SHOP_LOTTERY__SCRATCH_INTO, nil)
    local price = 0
    if m_selectScratchType == 0 then
      price = m_priceList["100"]
    elseif m_selectScratchType == 1 then
      price = m_priceList["500"]
    else
      price = m_priceList["1000"]
    end
    GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() - price)
    FlowSys:Next("Scratch")
  end
  function openScratchMenu()
    WINDOW:CloseMessage()
    SCREEN_B:FadeOutAll(TimeSec(0.1), true)
    CommonSys:BeginLowerMenuNaviFilter(nil, nil, false)
    CommonSys:OpenBasicMenu(SHOP_LOTTERY__SCRATCH_CONTROL_CAPTION, nil, nil)
    local menu = MENU:CreateScratchMenu()
    menu:SetLayoutRect(Rectangle(8, 8, 304, 204))
    menu:SetScratchType(m_selectScratchType)
    local result
    function menu:finishAction()
      SCREEN_B:FadeOutAll(TimeSec(0.1), true)
      CommonSys:EndLowerMenuNaviFilter(false)
      CloseScratchPremiumsList()
      SCREEN_B:FadeInAll(TimeSec(0.5), false)
      result = menu:GetResult()
      self:Close()
    end
    menu:Open()
    menu:StartupScratch()
    MENU:SetFocus(menu)
    SCREEN_B:FadeInAll(TimeSec(0.5), false)
    OpenScratchPremiumsList(false)
    ScratchPremiumsListCurrentItemChange(m_selectScratchType)
    MENU:WaitClose(menu)
    return result
  end
  function FlowSys.Proc.Scratch()
    local result = openScratchMenu()
    if result == 0 then
      EventPlay.eventShopLotteryScratchSpecialHit()
    elseif result == 1 then
      EventPlay.eventShopLotteryScratchHit()
    else
      EventPlay.eventShopLotteryScratchBlank(spaceIndex)
    end
    m_scratchUpdateItem = 1
    if result == 2 then
      FlowSys:Next("CheckFinishLottery")
    else
      shopIns:LotteryScratchLot(m_selectScratchType, result)
      FlowSys:Next("LotteryGift")
    end
  end
  function FlowSys.Proc.LotteryTopBefore()
    m_lotType = m_lotteryType.days
    m_selectLotteryType = 0
    m_lotteryNum = 0
    local level = shopIns:GetShopLevel()
    if m_bDaysTopNext then
      ShopSys:Talk(SHOP_LOTTERY__SOLDOUT_LOTTERY, nil)
      m_bDaysTopNext = false
    else
      ShopSys:Talk(SHOP_LOTTERY__SELECT_LOTTERY, nil)
    end
    m_bDaysTopNext = false
    WINDOW:CloseMessage()
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    WINDOW:SetMessageScreenMode(ScreenType.B)
    local infoMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
    infoMenu:SetLayoutRect(Rectangle(16, 172, 288, 72))
    infoMenu:SetOption({
      font = "FONT_12",
      frameMode = FrameMode.INFOMATION
    })
    infoMenu:SetTextOffset(16, 20)
    CommonSys:OpenBasicMenu(SHOP_LOTTERY__CAPTION_LOTTERY, nil, nil)
    local selectMenu = MENU:CreatePageMenu()
    selectMenu:SetLayoutRectAndLines(16, 40, 0, 0, 16)
    for i = 0, level - 1 do
      selectMenu:AddItem(shopIns:GetText_DaysLotteryName(i + 1), i, nil)
    end
    local nextProc
    local selectId = 0
    function selectMenu:openedAction()
      infoMenu:SetText(shopIns:GetText_DaysLotteryInfo(1))
      infoMenu:Open()
    end
    function selectMenu.closedAction()
      infoMenu:Close()
    end
    function selectMenu:decideAction()
      m_selectLotteryType = self:GetCursorItemIndex() + 1
      nextProc = "CheckMoneyFirst"
      self:Close()
    end
    function selectMenu:cancelAction()
      nextProc = "MenuTopLotLoop"
      self:Close()
    end
    function selectMenu:currentItemChange()
      infoMenu:SetText(shopIns:GetText_DaysLotteryInfo(self:GetCursorItemIndex() + 1))
      CommonSys:UpdateBasicMenu_LineHelp(shopIns:GetText_DaysLotteryInfo(self:GetCursorItemIndex() + 1))
    end
    selectMenu:Open()
    MENU:SetFocus(selectMenu)
    MENU:WaitClose(selectMenu)
    CommonSys:CloseBasicMenu()
    WINDOW:CloseMessage()
    CommonSys:EndLowerMenuNavi(false)
    WINDOW:SetMessageScreenMode(ScreenType.A)
    FlowSys:Next(nextProc)
  end
  function FlowSys.Proc.LotteryType1()
    m_selectLotteryType = 1
    FlowSys:Next("CheckMoneyFirst")
  end
  function FlowSys.Proc.LotteryType2()
    m_selectLotteryType = 2
    FlowSys:Next("CheckMoneyFirst")
  end
  function FlowSys.Proc.LotteryType3()
    m_selectLotteryType = 3
    FlowSys:Next("CheckMoneyFirst")
  end
  function FlowSys.Proc.CheckMoneyFirst()
    if shopIns:GetHaveTicketNum(m_selectLotteryType) == 0 then
      m_bDaysTopNext = true
      FlowSys:Next("LotteryTopBefore")
      return
    end
    if GROUND:IsEnoughMoney(m_priceList.lot) then
      FlowSys:Next("SelectLotteryNum")
    else
      ShopSys:Talk(SHOP_LOTTERY__NO_MONEY_LOTTERY, nil)
      FlowSys:Next("LotteryTopBefore")
    end
  end
  function FlowSys.Proc.SelectLotteryNum()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152", shopIns:GetText_DaysLotteryName(m_selectLotteryType))
    ShopSys:Talk(SHOP_LOTTERY__LOTTERY_SELECT_NUMBER, nil)
    WINDOW:CloseMessage()
    CommonSys:BeginLowerMenuNavi(nil, nil, true)
    m_lotteryNum = OpenBuyLotteryMenu(m_selectLotteryType)
    CommonSys:EndLowerMenuNavi(false)
    if m_lotteryNum > 0 then
      if GROUND:IsEnoughMoney(m_priceList.lot * m_lotteryNum) then
        ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152", shopIns:GetText_DaysLotteryName(m_selectLotteryType))
        ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\229\143\163\230\149\176", shopIns:GetText_DaysLotteryNum(m_lotteryNum))
        ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152\233\135\145\233\161\141", shopIns:GetText_DaysLotteryPrice(m_lotteryNum))
        ShopSys:TalkAskFlowNoClose(SHOP_LOTTERY__LOTTERY_SELECT, nil, nil, {
          next = "LotteryTopBefore"
        }, {
          text = SHOP_LOTTERY__LOTTERY_SELECT_EXPLAIN,
          next = "BuyLottery",
          default = true
        }, {
          text = SHOP_LOTTERY__LOTTERY_SELECT_EXIT,
          next = "LotteryTopBefore"
        })
      else
        ShopSys:Talk(SHOP_LOTTERY__NO_MONEY_LOTTERY, nil)
        FlowSys:Next("LotteryTopBefore")
      end
    else
      FlowSys:Next("LotteryTopBefore")
    end
  end
  function FlowSys.Proc.BuyLottery()
    shopIns:DaysBuyLottery(m_selectLotteryType, m_lotteryNum)
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:Talk(SHOP_LOTTERY__LOTTERY_FINISH, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLotLoop")
  end
  function FlowSys.Proc.LotteryHelp()
    ShopSys:Talk(SHOP_LOTTERY__HELP, nil)
    WINDOW:KeyWait()
    FlowSys:Next("LotteryTopBefore")
  end
  function FlowSys.Proc.LotteryGift()
    local item = shopIns:GetCurrentHitItem(m_lotType)
    local num = shopIns:GetCurrentHitItemNum(m_lotType)
    SOUND:PlayMe(SymSnd("ME_REWARD"))
    OverFlow:AddOverflowCheckItem(item, num, true)
    SOUND:WaitMe()
    WINDOW:KeyWait()
    OverFlow:OpenOrderOverflowMenu(true)
    shopIns:DeleteCurrentItems(m_lotType)
    FlowSys:Next("CheckFinishLottery")
  end
  function FlowSys.Proc.TrashMoney()
    shopIns:DeleteCurrentItems(m_lotType)
    FlowSys:Next("CheckFinishLottery")
  end
  function FlowSys.Proc.CheckFinishLottery()
    if m_scratchUpdateItem == 1 then
      shopIns:UpdateScratchPremiums()
    end
    if m_lotType == m_lotteryType.speed then
      local gold = shopIns:GetTicketNum(m_ticketType.gold)
      local silver = shopIns:GetTicketNum(m_ticketType.silver)
      local blonze = shopIns:GetTicketNum(m_ticketType.bronze)
      if gold + silver + blonze > 0 then
        ShopSys:TalkAskFlowNoClose(SHOP_LOTTERY__SPEED_SERIES, nil, nil, {
          next = "MenuTopLotLoop"
        }, {
          text = SHOP_LOTTERY__SPEED_SERIES_YES,
          next = "SpeedTopBefore",
          default = true
        }, {
          text = SHOP_LOTTERY__SPEED_SERIES_NO,
          next = "MenuTopLotLoop"
        })
      else
        FlowSys:Next("MenuTopLotLoop")
      end
    elseif m_lotType == m_lotteryType.scratch then
      if GROUND:IsEnoughMoney(m_priceList["100"]) then
        ShopSys:TalkAskFlowNoClose(SHOP_LOTTERY__SCRATCH_SERIES, nil, nil, {
          next = "MenuTopLotLoop"
        }, {
          text = SHOP_LOTTERY__SCRATCH_SERIES_YES,
          next = "ScratchTopBefore",
          default = true
        }, {
          text = SHOP_LOTTERY__SCRATCH_SERIES_NO,
          next = "MenuTopLotLoop"
        })
      else
        FlowSys:Next("MenuTopLotLoop")
      end
    else
      FlowSys:Next("MenuTopLotLoop")
    end
  end
  function CheckIsBuyTicketResult(lot)
    local landMax = GROUND:GetLandIndexMax()
    local spaceMax = GROUND:GetSpaceIndexMax()
    for i = 0, landMax - 1 do
      for j = 0, spaceMax - 1 do
        if GROUND:IsLotteryShop(i, j) and GROUND:IsBuyDaysLottery(lot, i, j) then
          return true
        end
      end
    end
    return false
  end
  function FlowSys.Proc.CheckDaysLotteryResult()
    local landMax = GROUND:GetLandIndexMax()
    local spaceMax = GROUND:GetSpaceIndexMax()
    local lotMax = GROUND:GetDaysLotteryMax()
    local isAllFirst = true
    for k = 0, lotMax - 1 do
      local isLotFirst = true
      local isBuy = false
      local name
      for i = 0, landMax - 1 do
        for j = 0, spaceMax - 1 do
          if GROUND:IsLotteryShop(i, j) and GROUND:IsBuyDaysLottery(k, i, j) then
            name = GROUND:GetLotteryName(k, i, j)
            if isAllFirst then
              ShopSys:Talk(SHOP_LOTTERY__LOTTERY_RESULTS_INTO, nil)
              isAllFirst = false
            end
            if GROUND:IsHitLotteryPrize(k, i, j) then
              if isLotFirst == true then
                ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152", name)
                EventPlay.eventShopLotterySelectHit()
                isLotFirst = false
              end
              local loop = true
              while true do
                if loop then
                  do
                    local hitItemId = GROUND:GetLotteryCurrentId(k, i, j)
                    if hitItemId > 0 then
                      local hitItemNum = GROUND:GetLotteryCurrentCount(k, i, j)
                      OverFlow:AddOverflowCheckItem(hitItemId, hitItemNum, true)
                      GROUND:DeleteLotteryCurrent(k, i, j)
                    end
                    loop = false
                  end
                else
                end
              end
            else
            end
            isBuy = true
          end
        end
        OverFlow:OpenOrderOverflowMenu(true)
      end
      if isLotFirst == true and isBuy == true then
        ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152", name)
        EventPlay.eventShopLotterySelectBlank()
      end
      local nexRet = false
      local nNexLotType = k + 1
      if k < 2 and CheckIsBuyTicketResult(nNexLotType) then
        nexRet = true
      end
      if isAllFirst == false and nexRet then
        ShopSys:Talk(SHOP_LOTTERY__LOTTERY_RESULTS_NEXT, nil)
      end
    end
    if isAllFirst == false then
      ShopSys:Talk(SHOP_LOTTERY__LOTTERY_RESULTS_EXIT, nil)
      GROUND:ShutdownDaysLottery()
    end
    FlowSys:Next("MenuTopLot")
  end
  function EventPlay.eventShopLotteryBlank()
    subEveCloseMsg()
    SOUND:PlayMe(SymSnd("ME_MINIGAME_BAD"))
    ShopSys:Talk(SHOP_LOTTERY__SPEED_BLANK, nil)
    shopIns:DeleteCurrentItems(m_lotType)
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"))
    CH("PLAYER"):SetManpu("MP_SWEAT_L")
    CH("PLAYER"):WaitManpu()
  end
  function EventPlay.eventShopLotteryHit(spaceIndex)
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    local PosShopStaff = CH("PLAYER"):GetPosition()
    subEveCloseMsg()
    SHOP_OWNER:SetManpu("MP_LAUGH_LP")
    SOUND:PlayMe(SymSnd("ME_MINIGAME_GOOD"))
    ShopSys:Talk(SHOP_LOTTERY__SPEED_HIT, nil)
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    subEveDoubleJump(SHOP_OWNER)
    SOUND:PlaySe(SymSnd("SE_WAZA_ODATERU"))
    EFFECT:Create("effect", SymEff("EV_PAPERBLOW"))
    EFFECT:SetScale("effect", Scale(2))
    EFFECT:SetPosition("effect", PosShopStaff)
    EFFECT:Play("effect")
    CH("PLAYER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
    CH("PLAYER"):WaitPlayMotion()
    TASK:Sleep(TimeSec(0.3))
    CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    SHOP_OWNER:ResetManpu()
  end
  function EventPlay.eventShopLotterySpecialHit(spaceIndex)
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    local PosShopStaff = CH("PLAYER"):GetPosition()
    subEveCloseMsg()
    SHOP_OWNER:SetManpu("MP_LAUGH_LP")
    SOUND:PlayMe(SymSnd("ME_MINIGAME_PERFECT"))
    ShopSys:Talk(SHOP_LOTTERY__SPEED_SPECIAL_HIT, nil)
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    subEveDoubleJump(SHOP_OWNER)
    SOUND:PlaySe(SymSnd("SE_WAZA_ENCORE"))
    EFFECT:Create("effect", SymEff("EV_PAPERBLOW_VR_COMB"))
    EFFECT:SetScale("effect", Scale(2))
    EFFECT:SetPosition("effect", PosShopStaff)
    EFFECT:Play("effect")
    CH("PLAYER"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
    CH("PLAYER"):WaitPlayMotion()
    TASK:Sleep(TimeSec(0.3))
    CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    SHOP_OWNER:ResetManpu()
  end
  function EventPlay.eventShopLotteryScratchBlank()
    subEveCloseMsg()
    ShopSys:Talk(SHOP_LOTTERY__SCRATCH_BLANK, nil)
    WINDOW:CloseMessage()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"))
    CH("PLAYER"):SetManpu("MP_SWEAT_L")
    CH("PLAYER"):WaitManpu()
  end
  function EventPlay.eventShopLotteryScratchHit()
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    local PosShopStaff = CH("PLAYER"):GetPosition()
    subEveCloseMsg()
    SHOP_OWNER:SetManpu("MP_LAUGH_LP")
    SOUND:PlayMe(SymSnd("ME_MINIGAME_GOOD"))
    ShopSys:Talk(SHOP_LOTTERY__SCRACH_HIT, nil)
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    subEveDoubleJump(SHOP_OWNER)
    SOUND:PlaySe(SymSnd("SE_WAZA_ODATERU"))
    EFFECT:Create("effect", SymEff("EV_PAPERBLOW"))
    EFFECT:SetScale("effect", Scale(2))
    EFFECT:SetPosition("effect", PosShopStaff)
    EFFECT:Play("effect")
    CH("PLAYER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
    CH("PLAYER"):WaitPlayMotion()
    TASK:Sleep(TimeSec(0.3))
    CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    SHOP_OWNER:ResetManpu()
  end
  function EventPlay.eventShopLotteryScratchSpecialHit()
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    local PosShopStaff = CH("PLAYER"):GetPosition()
    subEveCloseMsg()
    SHOP_OWNER:SetManpu("MP_LAUGH_LP")
    SOUND:PlayMe(SymSnd("ME_MINIGAME_PERFECT"))
    ShopSys:Talk(SHOP_LOTTERY__SCRATCH_SPECIAL_HIT, nil)
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    subEveDoubleJump(SHOP_OWNER)
    SOUND:PlaySe(SymSnd("SE_WAZA_ENCORE"))
    EFFECT:Create("effect", SymEff("EV_PAPERBLOW_VR_COMB"))
    EFFECT:SetScale("effect", Scale(2))
    EFFECT:SetPosition("effect", PosShopStaff)
    EFFECT:Play("effect")
    CH("PLAYER"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
    CH("PLAYER"):WaitPlayMotion()
    TASK:Sleep(TimeSec(0.3))
    CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    SHOP_OWNER:ResetManpu()
  end
  function EventPlay.eventShopLotterySelectBlank()
    subEveCloseMsg()
    ShopSys:Talk(SHOP_LOTTERY__SELECT_LOTTERY_BLANK01, nil)
    WINDOW:CloseMessage()
    SOUND:PlayMe(SymSnd("ME_MINIGAME_BAD"))
    ShopSys:Talk(SHOP_LOTTERY__SELECT_LOTTERY_BLANK02, nil)
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"))
    CH("PLAYER"):SetManpu("MP_SWEAT_L")
    CH("PLAYER"):WaitManpu()
  end
  function EventPlay.eventShopLotterySelectHit()
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    local PosShopStaff = CH("PLAYER"):GetPosition()
    subEveCloseMsg()
    ShopSys:Talk(SHOP_LOTTERY__SELECT_LOTTERY_HIT01, nil)
    WINDOW:CloseMessage()
    SOUND:PlayMe(SymSnd("ME_MINIGAME_GOOD"))
    SHOP_OWNER:SetManpu("MP_LAUGH_LP")
    ShopSys:Talk(SHOP_LOTTERY__SELECT_LOTTERY_HIT02, nil)
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    subEveDoubleJump(SHOP_OWNER)
    SOUND:PlaySe(SymSnd("SE_WAZA_ODATERU"))
    EFFECT:Create("effect", SymEff("EV_PAPERBLOW"))
    EFFECT:SetScale("effect", Scale(2))
    EFFECT:SetPosition("effect", PosShopStaff)
    EFFECT:Play("effect")
    CH("PLAYER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
    CH("PLAYER"):WaitPlayMotion()
    TASK:Sleep(TimeSec(0.3))
    CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    SHOP_OWNER:ResetManpu()
  end
  FlowSys:Call("CheckDaysLotteryResult")
  WINDOW:CloseMessage()
  FlowSys:Finish()
  ShopSys:Finish()
  SCREEN_B:FadeOutAll(TimeSec(0.1), true)
  LOWER_SCREEN:ChangeLastWallpaper()
  SCREEN_B:FadeInAll(TimeSec(0.1), false)
end
function OpenLotteryNextDay()
end

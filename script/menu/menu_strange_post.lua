function OpenStrangePostMenu()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  local OpenDummyBranchMenu = function(text, textYes, textNo)
    local branch = false
    ShopSys:SysMsgAskFlowNoClose("[CN][M:UNUSED]\227\129\182\227\130\147\227\129\141\239\188\136\227\131\128\227\131\159\227\131\188\239\188\137[R]" .. text, nil, nil, {
      text = textYes,
      next = "",
      actTbl = {
        decideAction = function(self)
          branch = true
        end
      }
    }, {
      text = textNo,
      next = "",
      actTbl = {
        decideAction = function(self)
          branch = false
        end
      }
    })
    return branch
  end
  local OpenDummySelectMenu = function(caption, cancelAct, ...)
    local menu = MENU:CreatePageMenu()
    local actionTbl = {}
    menu:SetLayoutRectAndLines(16, 40, 0, 0)
    menu:SetCaption(caption)
    for i, v in pairs({
      ...
    }) do
      if v.actName and v.actFunc then
        SYSTEM:DebugPrint(v.actName)
        menu:AddItem(v.actName, {
          act = v.actFunc
        }, actionTbl)
      end
    end
    function menu:cancelAction()
      self:Close()
      cancelAct()
    end
    function actionTbl:decideAction()
      self:Close()
      self.curItem.obj.act()
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  local OpenTopMenu = function(supplyAct, recallAct, checkAct, usePostAct, helpAct, exitAct)
    WINDOW:CloseMessage()
    local title = STRANGE_POST__CAPTION_TOP
    local menu = MENU:CreatePageMenu()
    local actionTbl = {}
    menu:SetLayoutRectAndLines(16, 40, 0, 0)
    menu:AddItem(STRANGE_POST__WELCOME_SET, {act = supplyAct, info = STRANGE_POST__SET_LINE_MESSAGE}, actionTbl)
    menu:AddItem(STRANGE_POST__WELCOME_RECALL, {act = recallAct, info = STRANGE_POST__RECALL_LINE_MESSAGE}, actionTbl)
    if 0 < POST:GetPassingCount() then
      menu:AddItem(STRANGE_POST__WELCOME_CHECK, {act = checkAct, info = STRANGE_POST__CHECK_LINE_MESSAGE}, actionTbl)
    end
    menu:AddItem(STRANGE_POST__WELCOME_HELP, {act = helpAct, info = STRANGE_POST__HELP_LINE_MESSAGE}, actionTbl)
    function menu:cancelAction()
      self:Close()
      exitAct()
    end
    function menu:currentItemChange()
      CommonSys:UpdateBasicMenu_LineHelp(self.curItem.obj.info)
    end
    function actionTbl:decideAction()
      self:Close()
      self.curItem.obj.act()
    end
    CommonSys:BeginLowerMenuNavi()
    CommonSys:OpenBasicMenu(title, STRANGE_POST__MANUAL_BUY, STRANGE_POST__SET_LINE_MESSAGE)
    NestMenu_OpenAndCloseWait(menu)
    CommonSys:CloseBasicMenu()
    CommonSys:EndLowerMenuNavi()
  end
  local OpenSupplyStockSelectMenu = function(decideAct, cancelAct, noneAct)
    WINDOW:CloseMessage()
    local maxNum = POST:GetPostFukkatsuSeedMax() - POST:GetPostFukkatsuSeed()
    local nowNum = GROUND:GetBagAndWarehouseItemTotalCount(115)
    if maxNum > nowNum then
      maxNum = nowNum
    end
    local itemMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
    itemMenu:SetLayoutRect(Rectangle(16, 40, 136, 16))
    itemMenu:SetTextOffset(0, 0)
    itemMenu:SetFontType(FontType.TYPE_12)
    MENU:SetTag_Value(0, nowNum)
    itemMenu:SetText(STRANGE_POST__OWNED_SEED_NUMBER)
    CommonSys:BeginLowerMenuNavi()
    CommonSys:OpenBasicMenu(STRANGE_POST__CAPTION_FUKKATU, STRANGE_POST__MANUAL_FUKKATU, STRANGE_POST__LINE_HINT_FUKKATU)
    itemMenu:Open()
    ShopSys:DispInputMenu({
      titleText = STRANGE_POST__HOWMANY_DEPOSIT,
      digitNum = 2,
      startNum = 1,
      minNum = 1,
      maxNum = maxNum,
      decideAction = function()
        local num = ShopSys:GetSelectNumber()
        decideAct(num)
      end,
      cancelAction = function()
        cancelAct()
      end
    })
    CommonSys:CloseBasicMenu()
    itemMenu:Close()
    CommonSys:EndLowerMenuNavi()
  end
  local WharehouseMaxCheck = function(itemindex)
    local nowCount = GROUND:GetItemWarehouseItemNowCount(itemindex)
    local maxCount = GROUND:GetItemWarehouseItemMaxCount(itemindex)
    local emptyCount = maxCount - nowCount
    if emptyCount == 0 then
      return true
    else
      return false
    end
  end
  FlowSys:Start()
  ShopSys:Start()
  function FlowSys.Proc.MultiPlayCheck()
    if MULTI_PLAY:IsLogined() then
      if MULTI_PLAY:IsMaster() then
        ShopSys:SysMsg(STRANGE_POST__MULTI_INFO_HOST)
        WINDOW:CloseMessage()
        FlowSys:Next("exit")
      else
        ShopSys:SysMsg(STRANGE_POST__MULTI_INFO_GUEST)
        WINDOW:CloseMessage()
        FlowSys:Next("exit")
      end
    else
      FlowSys:Next("FirstContact")
    end
  end
  function FlowSys.Proc.FirstContact()
    if FLAG.ParaPostGetFukkatu == CONST.FLAG_FALSE then
      if ShopSys:CheckBagFull() then
        ShopSys:SysMsg(STRANGE_POST__FIRST_CONTACT_ERROR_BAG_MAX)
        WINDOW:CloseMessage()
        FlowSys:Next("exit")
      else
        ShopSys:SysMsg(STRANGE_POST__FIRST_CONTACT_SUCCESS)
        FLAG.ParaPostGetFukkatu = CONST.FLAG_TRUE
        OverFlow:AddOverflowCheckItem(115, 1, true)
        SOUND:PlayMe(SymSnd("ME_REWARD"))
        SOUND:WaitMe()
        WINDOW:CloseMessage()
        SYSTEM:ExecuteTutorialHint(SymHint("POST_FIRST_GUIDE"))
        FlowSys:Next("checkEula")
      end
    else
      FlowSys:Next("checkEula")
      return
    end
  end
  function FlowSys.Proc.checkEula()
    POST:EnableHomeButton(false)
    if POST:IsAgreedEula() then
      FlowSys:Next("checkParentalControl")
    else
      ShopSys:SysMsg(STRANGE_POST__PASSING_CHECK_EULA)
      WINDOW:KeyWait()
      if POST:ExecuteEulaApplet() == true then
        FlowSys:Next("checkParentalControl")
      else
        ShopSys:SysMsg(STRANGE_POST__PASSING_ERROR_EULA)
        FlowSys:Next("failedCecBox")
      end
    end
    POST:EnableHomeButton(true)
  end
  function FlowSys.Proc.checkParentalControl()
    if POST:IsRestrictP2pCec() then
      ShopSys:SysMsg(STRANGE_POST__PASSING_ERROR_PARENTAL)
      FlowSys:Next("deleteCecBox")
    else
      FlowSys:Next("checkCecBox")
    end
  end
  function FlowSys.Proc.checkCecBox()
    if POST:IsMessageBox() then
      FlowSys:Next("successCecBox")
    else
      ShopSys:SysMsgAskFlowNoClose(STRANGE_POST__SWITCH_INFO, nil, nil, {
        text = STRANGE_POST__SWITCH_USE,
        next = "createCecBox"
      }, {
        text = STRANGE_POST__SWITCH_NOUSE,
        next = "cancelCecBox"
      })
    end
  end
  function FlowSys.Proc.cancelCecBox()
    ShopSys:SysMsg(STRANGE_POST__SWITCH_CANCEL)
    FlowSys:Next("failedCecBox")
  end
  function FlowSys.Proc.createCecBox()
    if POST:CreateMessageBox() then
      FlowSys:Next("updateSendMsg", "successCecBox")
    else
      ShopSys:SysMsg(STRANGE_POST__PASSING_ERROR_FULL_BOX)
      FlowSys:Next("failedCecBox")
    end
  end
  function FlowSys.Proc.successCecBox()
    FlowSys:Next("topMenu")
  end
  function FlowSys.Proc.failedCecBox()
    FlowSys:Next("exit")
  end
  function FlowSys.Proc.deleteCecBox()
    POST:DeleteMessageBox()
    FlowSys:Next("exit")
  end
  function FlowSys.Proc.topMenu()
    if POST:IsRecvMessage() or POST:IsUnOpenedPostData() then
      ShopSys:SysMsgAskFlowNoClose(STRANGE_POST__GET, nil, nil, {text = STRANGE_POST__GET_YES, next = "get"}, {text = STRANGE_POST__GET_NO, next = "exit"})
    else
      FlowSys:Next("topMenuLoop")
    end
  end
  function FlowSys.Proc.topMenuLoop()
    SYSTEM:ExecuteTutorialHint(SymHint("PASSING_BACKGROUND"))
    MENU:SetTag_String(6, POST:GetPostFukkatsuSeed() .. "")
    OpenTopMenu(function()
      FlowSys:Next("supplyStockCheck")
    end, function()
      FlowSys:Next("RecallSupplyStockCheck")
    end, function()
      FlowSys:Next("passingCheck")
    end, function()
      FlowSys:Next("usePost")
    end, function()
      FlowSys:Next("help")
    end, function()
      FlowSys:Next("exitMessage")
    end)
  end
  function FlowSys.Proc.usePost()
    ShopSys:SysMsgAskFlowNoClose(STRANGE_POST__SWITCH_INFO, nil, nil, {
      text = STRANGE_POST__SWITCH_USE,
      next = "switchInfoOn"
    }, {
      text = STRANGE_POST__SWITCH_NOUSE,
      next = "switchInfoOff"
    })
    return
  end
  function FlowSys.Proc.switchInfoOff()
    FlowSys:Next("deleteSendMsg", "switchInfoOffFinish")
  end
  function FlowSys.Proc.switchInfoOffFinish()
    ShopSys:SysMsg(STRANGE_POST__SWITCH_NOUSE_FINISH)
    FlowSys:Next("topMenuLoop")
  end
  function FlowSys.Proc.switchInfoOn()
    FlowSys:Next("updateSendMsg", "switchInfoOnFinish")
  end
  function FlowSys.Proc.switchInfoOnFinish()
    ShopSys:SysMsg(STRANGE_POST__SWITCH_USE_FINISH)
    FlowSys:Next("supplyStockCheck")
  end
  function FlowSys.Proc.supplyStockCheck()
    if POST:IsPostFukkatsuSeedFull() then
      MENU:SetTag_String(6, POST:GetPostFukkatsuSeed() .. "")
      ShopSys:SysMsg(STRANGE_POST__SUPPLY_STOCK_MAX)
      FlowSys:Next("topMenuLoop")
      return
    elseif GROUND:GetBagAndWarehouseItemTotalCount(115) < 1 then
      ShopSys:SysMsg(STRANGE_POST__SUPPLY_ITEM_NONE)
      FlowSys:Next("topMenuLoop")
      return
    else
      FlowSys:Next("supplyStockSelect")
      return
    end
  end
  function FlowSys.Proc.supplyStockSelect()
    local emptyNum = POST:GetPostFukkatsuSeedMax() - POST:GetPostFukkatsuSeed()
    MENU:SetTag_String(6, POST:GetPostFukkatsuSeed() .. "")
    MENU:SetTag_String(7, emptyNum .. "")
    ShopSys:SysMsg(STRANGE_POST__SUPPLY_STOCK_SELECT_NUMBER)
    OpenSupplyStockSelectMenu(function(num)
      FlowSys.Stat.itemCount = num
      FlowSys:Next("supplyStockConfirm")
    end, function()
      FlowSys:Next("topMenuLoop")
    end)
  end
  function FlowSys.Proc.supplyStockConfirm()
    MENU:SetTag_String(7, FlowSys.Stat.itemCount .. "")
    ShopSys:SysMsg(STRANGE_POST__SUPPLY_STOCK_CONFIRM)
    WINDOW:CloseMessage()
    FlowSys:Next("supplyStockSave")
  end
  function FlowSys.Proc.supplyStockSave()
    GROUND:ConsumeItemFromBagAndWarehouse(115, FlowSys.Stat.itemCount)
    POST:AddPostFukkatsuSeed(FlowSys.Stat.itemCount)
    FlowSys:Next("updateSendMsg", "supplyStockFinish")
  end
  function FlowSys.Proc.supplyStockFinish()
    FlowSys:Next("topMenuLoop")
  end
  function FlowSys.Proc.supplyAfterSwitchUse()
    FlowSys:Next("updateSendMsg", "supplyAfterSwitchUseFinish")
  end
  function FlowSys.Proc.supplyAfterSwitchUseFinish()
    ShopSys:SysMsg(STRANGE_POST__SUPPLY_SWITCH_USE_FINISH)
    FlowSys:Next("topMenuLoop")
  end
  function FlowSys.Proc.supplyAfterSwitchNoUse()
    ShopSys:SysMsg(STRANGE_POST__SUPPLY_SWITCH_NOUSE_FINISH)
    FlowSys:Next("topMenuLoop")
  end
  function FlowSys.Proc.RecallSupplyStockCheck()
    if POST:GetPostFukkatsuSeed() == 0 then
      ShopSys:SysMsg(STRANGE_POST__RECALL_NO_STOCK)
      FlowSys:Next("topMenuLoop")
      return
    elseif WharehouseMaxCheck(115) then
      ShopSys:SysMsg(STRANGE_POST__RECALL_BOX_MAX)
      FlowSys:Next("topMenuLoop")
      return
    end
    FlowSys:Next("RecallSelect")
  end
  function FlowSys.Proc.RecallSelect()
    ShopSys:SysMsgAskFlowNoClose(STRANGE_POST__RECALL_CONFIRM, nil, nil, {
      text = STRANGE_POST__RECALL_CONFIRM_YES,
      next = "RecallBoxCheck"
    }, {
      text = STRANGE_POST__RECALL_CONFIRM_NO,
      next = "topMenuLoop"
    })
  end
  function FlowSys.Proc.RecallBoxCheck()
    FlowSys.Stat.restCount = FUNC_COMMON:GetOverflowItemsToBox(115, POST:GetPostFukkatsuSeed())
    FlowSys.Stat.decCount = POST:GetPostFukkatsuSeed() - FlowSys.Stat.restCount
    POST:DecPostFukkatsuSeed(FlowSys.Stat.decCount)
    FlowSys:Next("updateSendMsg", "RecallBoxFinish")
  end
  function FlowSys.Proc.RecallBoxFinish()
    MENU:SetTag_String(12, FlowSys.Stat.decCount .. "")
    MENU:SetTag_String(6, FlowSys.Stat.restCount .. "")
    if FlowSys.Stat.restCount > 0 then
      ShopSys:SysMsg(STRANGE_POST__RECALL_OVER)
    else
      ShopSys:SysMsg(STRANGE_POST__RECALL_FINISH)
    end
    FlowSys:Next("topMenuLoop")
  end
  function FlowSys.Proc.get()
    FlowSys:Next("updateRecvMsg", "getStart")
  end
  function FlowSys.Proc.getStart()
    if POST:IsUnOpenedPostData() == false then
      FlowSys:Next("notUnOpenedData")
      return
    end
    POST:CreatePrizeData()
    FlowSys.Stat.passingCount = POST:GetPassingCount()
    FlowSys.Stat.rescueCount = 0
    SYSTEM:ExecuteTutorialHint(SymHint("POST_FINISH_GUIDE"))
    MENU:SetTag_Value(0, POST:GetUnOpenedPostDataCount())
    MENU:SetTag_String(13, MENU:ReplaceTagText("[value_p_b:0]"))
    ShopSys:SysMsg(STRANGE_POST__GET_INFO)
    FlowSys:Next("getTeamCount")
  end
  function FlowSys.Proc.notUnOpenedData()
    ShopSys:SysMsg(STRANGE_POST__GET_ERROR_NO_DATA)
    FlowSys:Next("topMenuLoop")
  end
  function FlowSys.Proc.getTeamCount()
    FlowSys.Stat.passingCount = FlowSys.Stat.passingCount + 1
    FlowSys.Stat.heroName = POST:GetTopUnOpenedDataHeroName()
    FlowSys.Stat.teamName = POST:GetTopUnOpenedDataTeamName()
    FlowSys.Stat.rescueFlag = POST:IsTopUnOpenedDataRescueFlag()
    MENU:SetTag_String(2, FlowSys.Stat.heroName)
    MENU:SetTag_String(5, FlowSys.Stat.teamName)
    ShopSys:SysMsg(STRANGE_POST__GET_ANNOUNCE)
    FlowSys:Next("getCheckHelp")
  end
  function FlowSys.Proc.getCheckHelp()
    if FlowSys.Stat.rescueFlag and POST:DecPostFukkatsuSeed(1) then
      FlowSys:Next("getThanksItem")
      return
    end
    FlowSys:Next("getLoopCheck")
  end
  function FlowSys.Proc.getThanksItem()
    FlowSys.Stat.rescueCount = FlowSys.Stat.rescueCount + 1
    POST:AddRescueCount(1)
    MENU:SetTag_String(2, FlowSys.Stat.heroName)
    MENU:SetTag_String(5, FlowSys.Stat.teamName)
    ShopSys:SysMsg(STRANGE_POST__GET_RESCUE_ANNOUNCE_1)
    SOUND:PlayMe(SymSnd("ME_MINIGAME_SOSO"))
    SOUND:WaitMe()
    MENU:SetTag_String(2, FlowSys.Stat.heroName)
    MENU:SetTag_String(5, FlowSys.Stat.teamName)
    ShopSys:SysMsg(STRANGE_POST__GET_RESCUE_ANNOUNCE_2)
    WINDOW:CloseMessage()
    SOUND:PlayMe(SymSnd("ME_REWARD"))
    local itemIndex = POST:GetItemRescueBonus()
    local count = POST:GetItemRescueBonusCount(itemIndex)
    OverFlow:AddOverflowCheckItem(itemIndex, count, true)
    OverFlow:OpenOrderOverflowMenu(true)
    SOUND:WaitMe()
    FlowSys:Next("getLoopCheck")
  end
  function FlowSys.Proc.getLoopCheck()
    POST:SetTopUnOpenedDataOpen()
    if POST:IsUnOpenedPostData() then
      FlowSys:Next("getTeamCount")
    else
      FlowSys:Next("getLoopFinish")
    end
  end
  function FlowSys.Proc.getLoopFinish()
    ShopSys:SysMsg(STRANGE_POST__GET_FINISH)
    if FlowSys.Stat.rescueCount > 0 then
      FlowSys:Next("getRescue")
      return
    end
    FlowSys:Next("addPassingCount")
  end
  function FlowSys.Proc.getRescue()
    MENU:SetTag_String(7, POST:GetPostFukkatsuSeed() .. "")
    ShopSys:SysMsg(STRANGE_POST__GET_RESCUE_ITEM_COUNT)
    FlowSys:Next("addPassingCount")
    return
  end
  function FlowSys.Proc.addPassingCount()
    if POST:AddPassingCount(FlowSys.Stat.passingCount, 1) then
      FlowSys:Next("checkPassingBonus")
    else
      FlowSys:Next("getFinish")
    end
  end
  function FlowSys.Proc.checkPassingBonus()
    if POST:IsPassingBonus() then
      FlowSys:Next("getPassingBonus")
    else
      FlowSys:Next("addPassingCount")
    end
  end
  function FlowSys.Proc.getPassingBonus()
    MENU:SetTag_String(11, POST:GetPassingCount() .. "")
    ShopSys:SysMsg(STRANGE_POST__GET_RESCUE_COUNT_BONUS_1)
    SOUND:PlayMe(SymSnd("ME_MINIGAME_GOOD"))
    SOUND:WaitMe()
    ShopSys:SysMsg(STRANGE_POST__GET_RESCUE_COUNT_BONUS_2)
    WINDOW:CloseMessage()
    local itemIndex = POST:GetItemPassingBonus()
    local count = POST:GetItemPassingBonusCount(itemIndex)
    SOUND:PlayMe(SymSnd("ME_REWARD"))
    OverFlow:AddOverflowCheckItem(itemIndex, count, true)
    OverFlow:OpenOrderOverflowMenu(true)
    SOUND:WaitMe()
    FlowSys:Next("addPassingCount")
  end
  function FlowSys.Proc.getFinish()
    POST:DeletePrizeData()
    ShopSys:SysMsg(STRANGE_POST__GET_AFTER_SAVE)
    WINDOW:CloseMessage()
    FlowSys:Next("updateSendMsg", "topMenuLoop")
  end
  function FlowSys.Proc.passingCheck()
    local passingCount = POST:GetPassingCount()
    local restCount = POST:RestPassingBonusCount()
    local rescueCount = POST:GetRescueCount()
    MENU:SetTag_String(9, passingCount .. "")
    MENU:SetTag_String(10, rescueCount .. "")
    ShopSys:SysMsg(STRANGE_POST__PASSSING_CHECK)
    if rescueCount > 0 then
      ShopSys:SysMsg(STRANGE_POST__RESCUE_CHECK)
    else
      ShopSys:SysMsg(STRANGE_POST__RESCUE_NONE)
    end
    if restCount ~= -1 then
      local nextCount = passingCount + restCount
      MENU:SetTag_String(11, nextCount .. "")
      ShopSys:SysMsg(STRANGE_POST__RESCUE_CHECK_NEXT)
    end
    WINDOW:CloseMessage()
    FlowSys:Next("topMenuLoop")
  end
  function FlowSys.Proc.exitMessage()
    ShopSys:SysMsg(STRANGE_POST__WIRELESS_OFF_ANNOUNCE)
    FlowSys:Next("exit")
  end
  function FlowSys.Proc.exit()
    WINDOW:CloseMessage()
    FlowSys:Return()
    return
  end
  function FlowSys.Proc.help()
    ShopSys:SysMsg(STRANGE_POST__HELP)
    FlowSys:Next("topMenuLoop")
  end
  function FlowSys.Proc.updateSendMsg(nextFlow)
    CommonSys:BeginSurechigaiWaitMessage(-1321857007)
    POST:SetSendMessage(false)
    CommonSys:EndSurechigaiWaitMessage(true)
    Ground_SaveNoneRestMessage("normal")
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.deleteSendMsg(nextFlow)
    CommonSys:BeginSurechigaiWaitMessage(-1321857007)
    POST:DeleteSendMessage()
    CommonSys:EndSurechigaiWaitMessage(true)
    Ground_SaveNoneRestMessage("normal")
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.updateRecvMsg(nextFlow)
    CommonSys:BeginSurechigaiWaitMessage(-1321857007)
    POST:ReflectRecvMessageWithDelete()
    CommonSys:EndSurechigaiWaitMessage(true)
    Ground_SaveNoneRestMessage("normal")
    SOUND:PlaySe(SymSnd("SE_EVT_HAND"))
    GM("TOMODACHI_POST_TEGAMI"):SetVisible(false)
    GM("TOMODACHI_POST"):SetVisible(true)
    FlowSys:Next(nextFlow)
  end
  FlowSys:Call("MultiPlayCheck")
  FlowSys:Finish()
  ShopSys:Finish()
end
function OpenStrangePost_Debug()
  local menu = MENU:CreatePageMenu()
  local setPostDataTbl = {}
  local setFukkatsuSeedTbl = {}
  local setPassingCountTbl = {}
  local setRescueCountTbl = {}
  local resetTbl = {}
  menu:SetCaption(-858328460)
  menu:SetLayoutRectAndLines(16, 16, 0, 0)
  menu:AddItem(-1743181985, nil, setPostDataTbl)
  menu:AddItem(66683037, nil, setFukkatsuSeedTbl)
  menu:AddItem(-171027071, nil, setPassingCountTbl)
  menu:AddItem(-981618886, nil, setRescueCountTbl)
  menu:AddItem(-1174995224, nil, resetTbl)
  menu:AddItem(1431582888, nil, {
    decideAction = function(self)
      self:Close()
    end
  })
  function menu:cancelAction()
    self:Close()
  end
  local OpenInputMenuAndGetValue = function(title, maxNum)
    local num = 0
    ShopSys:DispInputMenu({
      titleText = title,
      digitNum = 6,
      startNum = 1,
      minNum = 1,
      maxNum = maxNum,
      decideAction = function()
        num = ShopSys:GetSelectNumber()
      end,
      cancelAction = function()
      end
    })
    return num
  end
  function setPostDataTbl:decideAction()
    local num = OpenInputMenuAndGetValue(nil, 50)
    if num > 0 then
      POST:DebugSetPostData(num)
      MENU:SetTag_String(5, num .. "")
      WINDOW:SysMsg(604854483)
      WINDOW:CloseMessage()
    end
    MENU:SetFocus(self)
  end
  function setFukkatsuSeedTbl:decideAction()
    local maxNum = POST:GetPostFukkatsuSeedMax() - POST:GetPostFukkatsuSeed()
    if maxNum > 0 then
      MENU:SetTag_String(6, POST:GetPostFukkatsuSeed() .. "")
      local num = OpenInputMenuAndGetValue(752389161, maxNum)
      if num > 0 then
        POST:AddPostFukkatsuSeed(num)
        MENU:SetTag_String(5, num .. "")
        MENU:SetTag_String(6, POST:GetPostFukkatsuSeed() .. "")
        WINDOW:SysMsg(772864250)
        WINDOW:CloseMessage()
      end
    else
      WINDOW:SysMsg(-763345666)
      WINDOW:CloseMessage()
    end
    MENU:SetFocus(self)
  end
  function setPassingCountTbl:decideAction()
    local maxNum = POST:GetPassingCountMax() - POST:GetPassingCount()
    if maxNum > 0 then
      MENU:SetTag_String(6, POST:GetPassingCount() .. "")
      local num = OpenInputMenuAndGetValue(552988088, maxNum)
      if num > 0 then
        POST:AddPassingCount(POST:GetPassingCountMax(), num)
        MENU:SetTag_String(5, num .. "")
        MENU:SetTag_String(6, POST:GetPassingCount() .. "")
        WINDOW:SysMsg(586441364)
        WINDOW:CloseMessage()
      end
    else
      WINDOW:SysMsg(-763345666)
      WINDOW:CloseMessage()
    end
    MENU:SetFocus(self)
  end
  function setRescueCountTbl:decideAction()
    local maxNum = POST:GetRescueCountMax() - POST:GetRescueCount()
    if maxNum > 0 then
      MENU:SetTag_String(6, POST:GetRescueCount() .. "")
      local num = OpenInputMenuAndGetValue(552988088, maxNum)
      if num > 0 then
        POST:AddRescueCount(num)
        MENU:SetTag_String(5, num .. "")
        MENU:SetTag_String(6, POST:GetRescueCount() .. "")
        WINDOW:SysMsg(1410929839)
        WINDOW:CloseMessage()
      end
    else
      WINDOW:SysMsg(-763345666)
      WINDOW:CloseMessage()
    end
    MENU:SetFocus(self)
  end
  function resetTbl:decideAction()
    POST:DebugAllReset()
    WINDOW:SysMsg(-573149672)
    WINDOW:CloseMessage()
    MENU:SetFocus(self)
  end
  NestMenu_OpenAndCloseWait(menu)
end

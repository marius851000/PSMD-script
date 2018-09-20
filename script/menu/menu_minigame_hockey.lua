function OpenMinigameHockeyMenu(shopIns, landIndex, spaceIndex, resumeNextFlow, resumeArgTbl)
  MENU:LoadMenuTextPool("message/shop.bin", false)
  local OpenDummyBranchMenu = function(text, textYes, textNo)
    local branch = false
    ShopSys:SysMsgAskFlowNoClose("[CN][M:KARI]\227\129\182\227\130\147\227\129\141\239\188\136\227\131\128\227\131\159\227\131\188\239\188\137[R]" .. text, nil, nil, {
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
  local OpenScoreMenu = function(decideAct, cancelAct)
    local menu = MENU:CreateBoardMenuWindow(ScreenType.B)
    menu:SetLayoutRect(Rectangle(16, 40, 284, 156))
    menu:SetTextOffset(0, 0)
    menu:SetFontType(FontType.TYPE_12)
    function menu:drawFunc()
    end
    function menu:cancelAction()
      self:Close()
      decideAct()
    end
    function menu:decideAction()
      self:Close()
      cancelAct()
    end
    menu:SetText(GetRecordContentText())
    CommonSys:OpenBasicMenu("[M:KARI]\227\129\141\227\130\141\227\129\143\227\129\132\227\129\161\227\130\137\227\130\147", nil, nil)
    NestMenu_OpenAndCloseWait(menu)
    CommonSys:CloseBasicMenu()
  end
  local DispRewardItemListMenu = function(cancelAct, expretionAct)
  end
  local function reloadEntryAndResumeFlow(resumeFlow, resumeArgTbl, returnLandIndex, returnSpaceIndex)
    GROUND:SetLandShopSceneContinueFunction(function()
      OpenMinigameHockeyMenu(shopIns, returnLandIndex, returnSpaceIndex, resumeFlow, resumeArgTbl)
    end)
    FLAG.MapMoveNoFade = CONST.FLAG_TRUE
    HOCKEY:Entry()
    SOUND:FadeOutBgm(TimeSec(0.5))
    SOUND:WaitBgm()
    FUNC_COMMON:SetSdmcEnable(false)
    SYSTEM:EnterMinigame(returnLandIndex, returnSpaceIndex)
  end
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetOwner("TSUNBEAA", "\227\131\132\227\131\179\227\131\153\227\130\162\227\131\188")
  function FlowSys.Proc.errorCheck(nextFlow)
    local error = false
    if error then
      FlowSys:Next("error")
      return
    else
      FlowSys:Next(nextFlow)
      return
    end
  end
  function FlowSys.Proc.error()
    FlowSys:Next("exit")
  end
  function FlowSys.Proc.reloadSolo()
    CAMERA:MoveToPlayer(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.NONE)
    SCREEN_A:FadeInAll(TimeSec(0.3), false)
    SCREEN_B:FadeInAll(TimeSec(0.3), true)
    FlowSys:Next("rewardSolo")
  end
  function FlowSys.Proc.reloadMulti()
    CAMERA:MoveToPlayer(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.NONE)
    SCREEN_A:FadeInAll(TimeSec(0.3), false)
    SCREEN_B:FadeInAll(TimeSec(0.3), true)
    FlowSys:Next("rewardMulti")
  end
  function FlowSys.Proc.reloadResume()
    MENU:LoadMenuTextPool("message/shop.bin", false)
    if FlowSys.Stat.resumeNextFlow then
      local flow = FlowSys.Stat.resumeNextFlow
      FlowSys.Stat.resumeNextFlow = nil
      FlowSys:Next(flow)
    end
  end
  function FlowSys.Proc.who()
    FlowSys:Next("welcome")
    return
  end
  function FlowSys.Proc.welcome()
    SYSTEM:DebugPrint("FlowSys.Proc.welcome()")
    ShopSys:DispMoneyWindowOpen()
    local price = HOCKEY:GetHockeyCharge()
    MENU:SetTag_Money(0, price)
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(MINIGAME_CURLING__WELCOME, nil, nil, {next = "exit"}, {text = MINIGAME_CURLING__WELCOME_SOLOPLAY, next = "soloPlay"}, {text = MINIGAME_CURLING__WELCOME_PRIZE, next = "checkPrize"}, {text = MINIGAME_CURLING__WELCOME_HELP, next = "soloHelp"})
    CommonSys:CloseBasicMenu()
    return
  end
  function FlowSys.Proc.seriesA()
    WINDOW:CloseMessage()
    ShopSys:DispMoneyWindowOpen()
    local price = HOCKEY:GetHockeyCharge()
    MENU:SetTag_Money(0, price)
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(MINIGAME_CURLING__A_SERIES, nil, nil, {next = "exit"}, {text = MINIGAME_CURLING__A_SERIES_SOLOPLAY, next = "soloPlay"}, {text = MINIGAME_CURLING__A_SERIES_PRIZE, next = "checkPrize"}, {text = MINIGAME_CURLING__A_SERIES_HELP, next = "soloHelp"})
    CommonSys:CloseBasicMenu()
    return
  end
  function FlowSys.Proc.soloPlay()
    local price = HOCKEY:GetHockeyCharge()
    if price > GROUND:GetPlayerMoney() then
      ShopSys:Talk(MINIGAME_CURLING__NO_MONEY)
      WINDOW:CloseMessage()
      ShopSys:DispMoneyWindowClose()
      FlowSys:Return()
      return
    end
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() - price)
    ShopSys:DispMoneyWindowClose()
    FlowSys:Next("StartGame")
  end
  function FlowSys.Proc.StartGame()
    WINDOW:CloseMessage()
    if FlowSys.Stat.viewPlayGuide == 1 then
      ShopSys:Talk(MINIGAME_CURLING__SOLO_INTO)
    else
      ShopSys:Talk(MINIGAME_CURLING__SOLO_INTO_FIRST)
    end
    FlowSys:Next("inGame")
  end
  function FlowSys.Proc.soloHelp()
    ShopSys:DispMoneyWindowClose()
    FlowSys:Next("help", "seriesA")
  end
  function FlowSys.Proc.inGame()
    WINDOW:CloseMessage()
    SCREEN_A:FadeOut(TimeSec(0.3), false)
    SCREEN_B:FadeOut(TimeSec(0.3), true)
    LOWER_SCREEN:SetWallpaperVisible(false)
    reloadEntryAndResumeFlow("reloadSolo", nil, landIndex, spaceIndex)
    LOWER_SCREEN:SetWallpaperVisible(true)
  end
  function FlowSys.Proc.multiPlay()
    ShopSys:Talk(MINIGAME_CURLING__MULTI_INTO)
    FlowSys:Next("multiPlayEntry")
  end
  function FlowSys.Proc.multiRecord()
    FlowSys:Next("record", "seriesB")
  end
  function FlowSys.Proc.multiHelp()
    FlowSys:Next("help", "seriesB")
  end
  function FlowSys.Proc.multiPlayEntry()
    local resumeFlowSysData = FlowSys:Suspend()
    local resumeShopSysData = ShopSys:Suspend()
    local nextFlow = "inGameMulti"
    OpenMultiPlaySynchronizeMenu_Hockey(function()
      nextFlow = "inGameMulti"
    end, function()
      nextFlow = "seriesB"
    end, function()
      nextFlow = "seriesB"
    end, function()
      nextFlow = "error"
    end)
    FlowSys:Resume(resumeFlowSysData)
    ShopSys:Resume(resumeShopSysData)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.multiPlayEntryCancel()
    ShopSys:Talk(MINIGAME_SALVAGE__MULTI_PLAY_CANCEL)
    FlowSys:Next("seriesB")
  end
  function FlowSys.Proc.inGameMulti()
    ShopSys:Talk(MINIGAME_CURLING__SOLO_PLAY)
    WINDOW:CloseMessage()
    SCREEN_A:FadeOut(TimeSec(0.3), false)
    SCREEN_B:FadeOut(TimeSec(0.3), true)
    MULTI_PLAY:ReleaseParadiseShopLock(landIndex, spaceIndex)
    reloadEntryAndResumeFlow("reloadMulti", nil, landIndex, spaceIndex)
  end
  function FlowSys.Proc.multiWelcomeGuest()
    local resumeFlowSysData = FlowSys:Suspend()
    local resumeShopSysData = ShopSys:Suspend()
    local nextFlow = "exit"
    OpenMultiPlaySynchronizeGuestMenu(function()
      nextFlow = "inGameMultiGuest"
    end, function()
      nextFlow = "exit"
    end, function()
      nextFlow = "error"
    end)
    FlowSys:Resume(resumeFlowSysData)
    ShopSys:Resume(resumeShopSysData)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.inGameMultiGuest()
    local landIndex = PARADISE_LAND_INDEX.INDEX_00
    local spaceIndex = PARADISE_SPACE_INDEX.INDEX_00
    SCREEN_A:FadeOut(TimeSec(0.3), false)
    SCREEN_B:FadeOut(TimeSec(0.3), true)
    reloadEntryAndResumeFlow("reloadMulti", nil, landIndex, spaceIndex)
  end
  function FlowSys.Proc.rewardSolo()
    FlowSys:Next("dispRewardSolo")
  end
  function FlowSys.Proc.dispRewardSolo()
    local rank = HOCKEY:GetRank()
    local nextFunc = "excuteRewardSolo"
    if rank == 0 then
      ShopSys:Talk(MINIGAME_CURLING__SOLO_HIGH_SCORE)
    elseif rank == 1 then
      ShopSys:Talk(MINIGAME_CURLING__SOLO_MIDDLE_SCORE)
    elseif rank == 2 then
      ShopSys:Talk(MINIGAME_CURLING__SOLO_LOW_SCORE)
    else
      ShopSys:Talk(MINIGAME_CURLING__SOLO_BAD_SCORE)
      nextFunc = "seriesA"
    end
    FlowSys.Stat.viewPlayGuide = 1
    FlowSys:Next(nextFunc)
  end
  function FlowSys.Proc.excuteRewardSolo()
    OverFlow:AddOverflowCheckItem(HOCKEY:GetRewardItemIndex(), HOCKEY:GetRewardItemCount(), true)
    SOUND:PlayMe(SymSnd("ME_REWARD"))
    SOUND:WaitMe()
    HOCKEY:AddReward()
    OverFlow:OpenOrderOverflowMenu(true)
    FlowSys:Next("seriesA")
  end
  function FlowSys.Proc.dispRewardMulti()
    MENU:SetTag_String(7, "?")
    local rank = HOCKEY:GetRank()
    if rank == 0 then
      ShopSys:Talk(MINIGAME_CURLING__RESULT_1ST)
    elseif rank == 1 then
      ShopSys:Talk(MINIGAME_CURLING__RESULT_2ND)
    elseif rank == 2 then
      ShopSys:Talk(MINIGAME_CURLING__RESULT_3RD)
    elseif rank == 3 then
      ShopSys:Talk(MINIGAME_CURLING__RESULT_4TH)
    end
    FlowSys:Next("excuteRewardMulti")
  end
  function FlowSys.Proc.excuteRewardMulti()
    SOUND:PlayMe(SymSnd("ME_REWARD"))
    OverFlow:AddOverflowCheckItem(HOCKEY:GetRewardItemIndex(), HOCKEY:GetRewardItemCount(), true)
    SOUND:WaitMe()
    OverFlow:OpenOrderOverflowMenu(true)
    MULTI_PLAY:GetParadiseShopLock(landIndex, spaceIndex)
    ShopSys:Talk(MINIGAME_CURLING__MULTI_EXIT)
    FlowSys:Next("Multiexit")
  end
  function FlowSys.Proc.Multiexit()
    ShopSys:Talk(MINIGAME_CURLING__EXIT)
    FlowSys:Return()
  end
  function FlowSys.Proc.rewardMulti()
    ShopSys:Talk(MINIGAME_CURLING__MULTI_FINISH)
    FlowSys:Next("dispRewardMulti")
  end
  function FlowSys.Proc.itemGuide(nextFlow)
    DispItemGuide()
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.checkPrize()
    ShopSys:DispMoneyWindowClose()
    ShopSys:Talk(MINIGAME_CURLING__PRIZE_INTO)
    WINDOW:CloseMessage()
    CommonSys:BeginUpperDarkFilter(true)
    CommonSys:OpenBasicMenu(nil, MINIGAME_CURLING__MANUAL_PRIZE, nil)
    local rewardWindow = MENU:CreateHockeyRewardWindow()
    function rewardWindow:decideAction()
      self:Close()
    end
    function rewardWindow:cancelAction()
      self:Close()
    end
    rewardWindow:Open()
    MENU:SetFocus(rewardWindow)
    MENU:WaitClose(rewardWindow)
    CommonSys:CloseBasicMenu()
    CommonSys:EndUpperDarkFilter(true)
    FlowSys:Next("seriesA")
  end
  function FlowSys.Proc.record(nextFlow)
    local bRecordExist = false
    if bRecordExist then
    else
      ShopSys:Talk(MINIGAME_CURLING__NO_SCORE)
    end
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.help(nextFlow)
    ShopSys:Talk(MINIGAME_CURLING__HELP)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.exit()
    ShopSys:DispMoneyWindowClose()
    ShopSys:Talk(MINIGAME_CURLING__EXIT)
    FlowSys:Return()
  end
  SYSTEM:DebugPrint("Hockey Flow start!!")
  if resumeNextFlow then
    FlowSys.Stat.resumeNextFlow = resumeNextFlow
    FlowSys.Stat.resumeArgTbl = resumeArgTbl
    FlowSys:Call("reloadResume")
  else
    FlowSys.Stat.viewPlayGuide = 0
    SYSTEM:DebugPrint("FlowSys:Call(who)")
    FlowSys:Call("who")
  end
  FlowSys:Finish()
  ShopSys:Finish()
end

math.random = nil
function GroundAskSave(type)
  TASK:Sleep(TimeSec(0.2))
  if type == "normal" then
    if Ground_Save("ground") then
      return
    end
  elseif type == "island_first" then
    SOUND:PlayMe(SymSnd("ME_INFORMATION"), Volume(256))
    WINDOW:SysMsg(854055037)
    WINDOW:SysMsg(737995068)
    WINDOW:SysMsg(13744895)
    WINDOW:SysMsg(432704446)
    WINDOW:SysMsg(1451957625)
    WINDOW:CloseMessage()
    TASK:Sleep(TimeSec(0.5))
    if Ground_Save("ground") then
      return
    end
  elseif type == "ending_after" then
    WINDOW:SysMsg(1334848568)
    WINDOW:CloseMessage()
    if Ground_Save("normal_top") then
      return
    end
  end
end
function GroundCycle_CheckCycleEnd(restActPoint)
  if restActPoint <= 0 then
    WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
    WINDOW:SwitchTalk({PARTNER_0 = 1690140667, PARTNER_1 = 2108051130})
    WINDOW:CloseMessage()
    WINDOW:SysMsg(-96578955)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-484089036, 0)
    WINDOW:SelectChain(884616403, 1)
    WINDOW:DefaultCursor(1)
    local result = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    WINDOW:CloseMessage()
    if result == 0 then
      WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
      WINDOW:SwitchTalk({PARTNER_0 = 765533586, PARTNER_1 = 109858385})
      WINDOW:SwitchTalk({PARTNER_0 = 530022160, PARTNER_1 = 1356261847})
      WINDOW:CloseMessage()
      return "go_next_day"
    else
      return ""
    end
  end
end
function GroundCycle_SelectDailyGoal()
  if CHARA:IsExist("PARTNER") then
    CH("HERO"):DirTo(CH("PARTNER"), Speed(350), ROT_TYPE.NEAR)
    CH("PARTNER"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    TASK:Sleep(TimeSec(0.3))
    WINDOW:DrawFace(20, 88, SymAct("PARTNER"), FACE_TYPE.NORMAL)
    WINDOW:SwitchTalk({PARTNER_0 = 1238227094, PARTNER_1 = 1658882901})
    WINDOW:CloseMessage()
  end
end
function GroundCycle_QuestTalkBefore(dailyGoalType, restActPoint)
end
function GroundCycle_AtlasMenuBefore(isOrbLooked)
  return ""
end
function GroundCycle_DungeonAfter(restActPoint, bIsReward, bIsExistClearQuest, bIsTalkRAPURASU, RareItemIndex)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  local resultMenu = CreateDungeonResultWindow()
  resultMenu:Open()
  SCREEN_A:FadeInAll(TimeSec(0.3), true)
  if FUNC_COMMON:IsDungeonClear() then
    SOUND:PlaySe(SymSnd("ME_GAMECLEAR"), Volume(256))
  else
    SOUND:PlaySe(SymSnd("ME_GAMEOVER"), Volume(256))
  end
  function resultMenu:decideAction()
    resultMenu:ShowDownCursor(false)
    SCREEN_A:FadeOutAll(TimeSec(0.5), true)
    self:Close()
  end
  TASK:Sleep(TimeSec(0.5))
  resultMenu:ShowDownCursor(true)
  NestMenu_CloseWait(resultMenu)
  if FUNC_COMMON:IsDungeonClear() then
    SOUND:FadeOutSe(SymSnd("ME_GAMECLEAR"), TimeSec(0.5))
  else
    SOUND:FadeOutSe(SymSnd("ME_GAMEOVER"), TimeSec(0.5))
  end
  SCREEN_A:FadeInAll(TimeSec(0), false)
  SYSTEM:RareItemDirection(RareItemIndex)
  WINDOW:SysMsg(2080094740)
  WINDOW:CloseMessage()
  if bIsExistClearQuest then
    WINDOW:SysMsg(-60578085)
    WINDOW:CloseMessage()
  end
  if bIsReward then
    SOUND:PlayMe(SymSnd("ME_INFORMATION"), Volume(256))
    WINDOW:SysMsg(-445081702)
    WINDOW:CloseMessage()
  end
  if bIsTalkRAPURASU then
    WINDOW:DrawFace(324, 88, SymAct("RAPURASU"), FACE_TYPE.HAPPY)
    WINDOW:Talk(SymAct("RAPURASU"), 638550845)
    WINDOW:CloseMessage()
  end
end
function GroundCycle_DungeonAfterIsLand()
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  local resultMenu = CreateDungeonResultWindow()
  resultMenu:Open()
  SCREEN_A:FadeInAll(TimeSec(0.3), true)
  if FUNC_COMMON:IsDungeonClear() then
    SOUND:PlaySe(SymSnd("ME_GAMECLEAR"), Volume(256))
  else
    SOUND:PlaySe(SymSnd("ME_GAMEOVER"), Volume(256))
  end
  function resultMenu:decideAction()
    resultMenu:ShowDownCursor(false)
    SCREEN_A:FadeOutAll(TimeSec(0.5), true)
    self:Close()
  end
  TASK:Sleep(TimeSec(0.5))
  resultMenu:ShowDownCursor(true)
  NestMenu_CloseWait(resultMenu)
  if FUNC_COMMON:IsDungeonClear() then
    SOUND:FadeOutSe(SymSnd("ME_GAMECLEAR"), TimeSec(0.5))
  else
    SOUND:FadeOutSe(SymSnd("ME_GAMEOVER"), TimeSec(0.5))
  end
  SCREEN_A:FadeInAll(TimeSec(0), false)
end
function GroundCycle_DungeonAfterMansion(bIsReplay)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  if bIsReplay == false then
    if FUNC_COMMON:IsDungeonClear() then
      local eLanguageType = SYSTEM:GetLanguageType()
      if eLanguageType == LANGUAGE_TYPE.FR then
        SAJI:CreateSajiPlayer("theater", "REQUEST_SCCESS_FR")
      elseif eLanguageType == LANGUAGE_TYPE.GE then
        SAJI:CreateSajiPlayer("theater", "REQUEST_SCCESS_GE")
      elseif eLanguageType == LANGUAGE_TYPE.IT then
        SAJI:CreateSajiPlayer("theater", "REQUEST_SCCESS_IT")
      elseif eLanguageType == LANGUAGE_TYPE.SP then
        SAJI:CreateSajiPlayer("theater", "REQUEST_SCCESS_SP")
      else
        SAJI:CreateSajiPlayer("theater", "REQUEST_SCCESS")
      end
      SOUND:PlayMe(SymSnd("ME_MINIGAME_PERFECT"), Volume(256))
    else
      local eLanguageType = SYSTEM:GetLanguageType()
      if eLanguageType == LANGUAGE_TYPE.FR then
        SAJI:CreateSajiPlayer("theater", "REQUEST_FAILURE_FR")
      elseif eLanguageType == LANGUAGE_TYPE.GE then
        SAJI:CreateSajiPlayer("theater", "REQUEST_FAILURE_GE")
      elseif eLanguageType == LANGUAGE_TYPE.IT then
        SAJI:CreateSajiPlayer("theater", "REQUEST_FAILURE_IT")
      elseif eLanguageType == LANGUAGE_TYPE.SP then
        SAJI:CreateSajiPlayer("theater", "REQUEST_FAILURE_SP")
      else
        SAJI:CreateSajiPlayer("theater", "REQUEST_FAILURE")
      end
      SOUND:PlayMe(SymSnd("ME_MINIGAME_BAD"), Volume(256))
    end
    SJ("theater"):SetPosition(Vector2(200, 120))
    SJ("theater"):Play(LOOP.OFF)
    SJ("theater"):SetScreenType(ScreenType.A)
    SJ("theater"):SetDrawPriority(0)
    SJ("theater"):WaitEnd()
    local resultMenu
    resultMenu = CreateDungeonResultWindow()
    resultMenu:Open()
    function resultMenu:decideAction()
      self:Close()
    end
    SCREEN_A:FadeInAll(TimeSec(0.3), true)
    TASK:Sleep(TimeSec(0.5))
    resultMenu:ShowDownCursor(true)
    NestMenu_CloseWait(resultMenu)
    resultMenu:ShowDownCursor(false)
    if FUNC_COMMON:IsDungeonClear() or FUNC_COMMON:IsTheaterDungeonEscape() then
      TASK:Sleep(TimeSec(0.5))
      WINDOW:SysMsg(-887351076)
      WINDOW:CloseMessage()
    end
    SCREEN_A:FadeOutAll(TimeSec(0.5), true)
    SAJI:DestroySajiPlayer("theater")
  else
    local resultMenu
    resultMenu = CreateDungeonReplayResultWindow()
    resultMenu:Open()
    function resultMenu:decideAction()
      self:Close()
    end
    SCREEN_A:FadeInAll(TimeSec(0.3), true)
    if FUNC_COMMON:IsDungeonClear() then
      SOUND:PlaySe(SymSnd("ME_GAMECLEAR"), Volume(256))
    else
      SOUND:PlaySe(SymSnd("ME_GAMEOVER"), Volume(256))
    end
    TASK:Sleep(TimeSec(0.5))
    resultMenu:ShowDownCursor(true)
    NestMenu_CloseWait(resultMenu)
    resultMenu:ShowDownCursor(false)
    SCREEN_A:FadeOutAll(TimeSec(0.5), true)
    if FUNC_COMMON:IsDungeonClear() then
      SOUND:FadeOutSe(SymSnd("ME_GAMECLEAR"), TimeSec(0.5))
    else
      SOUND:FadeOutSe(SymSnd("ME_GAMEOVER"), TimeSec(0.5))
    end
  end
  SCREEN_A:FadeInAll(TimeSec(0), false)
end
function StaginPost_TalkENTER()
  WINDOW:SysMsg(1058321020)
  WINDOW:SelectStart()
  WINDOW:SelectChain(339337663, 0)
  WINDOW:SelectChain(220385534, 1)
  WINDOW:DefaultCursor(1)
  local result = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  WINDOW:CloseMessage()
  if result == 0 then
    return "yes"
  else
    return "no"
  end
end
function StaginPost_TalkENTER2()
end
function StaginPost_TalkBACK()
  WINDOW:SysMsg(1113802297)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1534621560, 0)
  WINDOW:SelectChain(1884628155, 1)
  WINDOW:DefaultCursor(1)
  local result = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  WINDOW:CloseMessage()
  if result == 0 then
    return "yes"
  else
    return "no"
  end
end

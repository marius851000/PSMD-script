function OpenGroundToParadiseFlow(isDungeon, resumeFlow, resumeArgTbl)
  local resumeData = FlowSys:Suspend()
  local retFlag = false
  local gotoTutorialFlag = false
  local isTutorialReturnFlag = false
  FlowSys:Start()
  ShopSys:Start()
  SPRITE:CreatePatternSet("upperSet", {
    name = "bg",
    img = "WALLPAPER_MAIN_UTILITY01",
    u = 0,
    v = 0,
    w = 400,
    h = 240,
    cx = 200,
    cy = 120,
    allocateFromMap = true
  })
  SPRITE:CreatePatternSet("underSet", {
    name = "bg",
    img = "WALLPAPER_SUB_UTILITY01",
    u = 0,
    v = 0,
    w = 320,
    h = 240,
    cx = 160,
    cy = 120,
    allocateFromMap = true
  })
  SPRITE:CreateSprite("upperBg"):SetPattern({
    setName = "upperSet",
    ptnName = "bg",
    ofsX = 0,
    ofsY = 0,
    ofsPrio = 0
  })
  SPRITE:CreateSprite("underBg"):SetPattern({
    setName = "underSet",
    ptnName = "bg",
    ofsX = 0,
    ofsY = 0,
    ofsPrio = 0
  })
  SPRT("upperBg"):SetOption({
    pos = Vector2(200, 120),
    visible = false,
    prio = 600
  })
  SPRT("underBg"):SetOption({
    pos = Vector2(160, 120),
    visible = false,
    prio = 600,
    screen = ScreenType.B
  })
  function FlowSys.Proc.ChangeAsk()
    if FLAG.ParaExpCount == CONST.CNT_1 then
      FLAG.ParaExpCount = CONST.CNT_2
      SCREEN_A:FadeOutAll(TimeSec(0.5), false)
      SCREEN_B:FadeOutAll(TimeSec(0.5), true)
      FlowSys:Next("GotoTutorial")
    elseif FLAG.ParaExpCount == CONST.CNT_2 then
      FLAG.ParaExpCount = CONST.CNT_3
      FlowSys:Next("ChangeAskForTutorial")
    else
      FlowSys:Next("ChangeAskForNormal")
    end
  end
  function FlowSys.Proc.ChangeAskForNormal()
    ShopSys:SysMsgAskFlowNoClose(MODECHANGE__CHANGE_SELECT, nil, {next = "FlowEnd"}, {text = MODECHANGE__CHANGE_SELECT_YES, next = "SaveStart"}, {text = MODECHANGE__CHANGE_SELECT_NO, next = "FlowEnd"})
  end
  function FlowSys.Proc.GotoTutorial()
    gotoTutorialFlag = true
    FlowSys:Return()
  end
  function FlowSys.Proc.ChangeAskForTutorial()
    isTutorialReturnFlag = true
    ShopSys:SysMsgAskFlowNoClose(MODECHANGE__CHANGE_SELECT_AFTER_TUTORIAL, nil, {next = "FlowEnd"}, {
      text = MODECHANGE__CHANGE_SELECT_AFTER_TUTORIAL_YES,
      next = "SaveStartAfterTutorial"
    }, {text = MODECHANGE__CHANGE_SELECT_AFTER_TUTORIAL_NO, next = "FlowEnd"})
  end
  function FlowSys.Proc.SaveStart()
    if QUEST:IsCurrentQuestInfo() then
      ShopSys:SysMsgAskFlowNoClose(MODECHANGE__QUEST_GATE_CHK_SELECT, nil, {next = "FlowEnd"}, {text = MODECHANGE__QUEST_GATE_CHK_SELECT_YES, next = ""}, {
        text = MODECHANGE__QUEST_GATE_CHK_SELECT_NO,
        next = "FlowEnd",
        default = true
      })
      if ShopSys:NeedReturnFlow() then
        return
      end
      if QUEST:IsCurrentQuestInfo_Multi() then
        GM("TOMODACHI_GATE"):SetMotion(SymMot("close"), LOOP.OFF)
      else
        GM("IRAI_GATE"):SetMotion(SymMot("close"), LOOP.OFF)
      end
      QUEST:ResetCurrentQuestInfo()
      ShopSys:SysMsg(MODECHANGE__QUEST_GATE_CHK_FINISH)
    end
    if GROUND:IsExistNoSallyPokemon() == false then
      ShopSys:SysMsg(MODECHANGE__NO_WAIT_POKEMON)
      FlowSys:Next("FlowEnd")
      return
    end
    FlowSys:Next("SaveExec")
  end
  function FlowSys.Proc.SaveStartAfterTutorial()
    if QUEST:IsCurrentQuestInfo() then
      ShopSys:SysMsgAskFlowNoClose(MODECHANGE__QUEST_GATE_CHK_SELECT, nil, {next = "FlowEnd"}, {text = MODECHANGE__QUEST_GATE_CHK_SELECT_YES, next = ""}, {
        text = MODECHANGE__QUEST_GATE_CHK_SELECT_NO,
        next = "FlowEnd",
        default = true
      })
      if ShopSys:NeedReturnFlow() then
        return
      end
      QUEST:ResetCurrentQuestInfo()
      ShopSys:SysMsg(MODECHANGE__QUEST_GATE_CHK_FINISH)
    end
    if GROUND:IsExistNoSallyPokemon() == false then
      ShopSys:SysMsg(MODECHANGE__NO_WAIT_POKEMON)
      FlowSys:Next("FlowEnd")
      return
    end
    SYSTEM:SetNextSaveWithOutPlacement()
    FlowSys:Next("SaveExec")
  end
  function FlowSys.Proc.SaveExec()
    if isDungeon then
      if SYSTEM:IsParadiseMode() == true then
        if Dungeon_Giveup() == false then
          FlowSys:Next("FlowEnd")
          return
        end
      elseif Dungeon_Save("dungeon_to_paradise", "normal", false) == false then
        FlowSys:Next("FlowEnd")
        return
      end
    else
      WINDOW:SysMsg(-124596352)
      if SYSTEM:SaveGame() == false then
        FlowSys:Next("FlowEnd")
        return
      end
      WINDOW:ForceCloseMessage()
      ShopSys:SysMsg(-1617239266)
    end
    ShopSys:SysMsg(MODECHANGE__CHOICE_POKEMON)
    FlowSys:Next("SelectPokemon")
  end
  function FlowSys.Proc.SelectPokemon()
    WINDOW:CloseMessage()
    if FLAG.DunClearRest == CONST.FLAG_TRUE then
      FLAG.DunClearRestToParadise = CONST.FLAG_TRUE
      FLAG.DunClearRest = CONST.FLAG_FALSE
    end
    EFFECT:SpotWipeOut(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), false)
    EFFECT:SpotWipeWait()
    EFFECT:SpotWipeIn(TimeSec(0), false)
    SCREEN_A:FadeOutAll(TimeSec(0), false)
    SCREEN_B:FadeOutAll(TimeSec(0), false)
    SCREEN_A:FadeOut(TimeSec(0), false)
    SCREEN_B:FadeOut(TimeSec(0), false)
    TASK:Sleep(TimeSec(0.8))
    SPRT("upperBg"):SetVisible(true)
    SPRT("underBg"):SetVisible(true)
    SCREEN_A:FadeIn(TimeSec(0), false)
    SCREEN_B:FadeIn(TimeSec(0), false)
    SCREEN_A:FadeInAll(TimeSec(0.5), false)
    SCREEN_B:FadeInAll(TimeSec(0.5), false)
    FlowSys.Stat.selectWarehosueId = nil
    local group
    if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true then
      group = "ALL"
    else
      group = "SOUKO"
    end
    DispLeaderPokemonSelectMenu({
      titleText = MODECHANGE__CAPTION_CHOICE,
      flagNewChange = "NEW",
      flagSort = true,
      typeParty = "CHANGE_PARTY",
      typeDrawGroup = group,
      killButStart = true,
      decideAct = function()
        SCREEN_A:FadeOutAll(TimeSec(0.5), false)
        SCREEN_B:FadeOutAll(TimeSec(0.5), true)
        SCREEN_A:FadeOut(TimeSec(0), false)
        SCREEN_B:FadeOut(TimeSec(0), false)
        FlowSys.Stat.selectWarehosueId = ShopSys.shopping_selectPokemonWarehouseId
        FlowSys:Next("ChoiseCheer")
      end,
      cancelAct = function()
        LOWER_SCREEN:SetVisible(false)
        SCREEN_A:FadeOutAll(TimeSec(0.5), false)
        SCREEN_B:FadeOutAll(TimeSec(0.5), true)
        SCREEN_A:FadeOut(TimeSec(0), false)
        SCREEN_B:FadeOut(TimeSec(0), false)
        FlowSys:Next("BackStory")
      end
    })
    SCREEN_A:FadeInAll(TimeSec(0), false)
    SCREEN_B:FadeInAll(TimeSec(0), false)
    if FlowSys.Stat.selectWarehosueId then
      TASK:Sleep(TimeSec(0.2))
    end
  end
  function FlowSys.Proc.BackStory()
    LOWER_SCREEN:SetVisible(false)
    if isDungeon then
      ShopSys:SysMsg(MODECHANGE__BACK_DUNGEON)
      WINDOW:CloseMessage()
    else
      ShopSys:SysMsg(MODECHANGE__BACK_STORY)
      WINDOW:CloseMessage()
    end
    if FLAG.DunClearRestToParadise == CONST.FLAG_TRUE then
      FLAG.DunClearRest = CONST.FLAG_TRUE
      FLAG.DunClearRestToParadise = CONST.FLAG_FALSE
    end
    SCREEN_A:FadeOut(TimeSec(0), false)
    SCREEN_B:FadeOut(TimeSec(0), false)
    SCREEN_A:FadeOutAll(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    LOWER_SCREEN:SetVisible(true)
    SPRT("upperBg"):SetVisible(false)
    SPRT("underBg"):SetVisible(false)
    if isTutorialReturnFlag == false then
      TASK:Sleep(TimeSec(0.3))
      SCREEN_A:FadeIn(TimeSec(0), false)
      SCREEN_B:FadeIn(TimeSec(0), false)
      SCREEN_A:FadeInAll(TimeSec(0), false)
      SCREEN_B:FadeInAll(TimeSec(0.5), false)
      EFFECT:SpotWipeIn(TimeSec(0.5), false)
    end
    FlowSys:Next("FlowEnd")
  end
  function FlowSys.Proc.ChoiseCheer()
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", GROUND:GetPokemonWarehouseNameFromId(FlowSys.Stat.selectWarehosueId))
    ShopSys:SysMsg(MODECHANGE__CHOICE_CHEER)
    WINDOW:CloseMessage()
    SOUND:FadeOutBgm(TimeSec(0.5))
    SOUND:FadeOutEnv(TimeSec(0.5))
    SCREEN_A:FadeOutAll(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    SCREEN_A:FadeOut(TimeSec(0), false)
    SCREEN_B:FadeOut(TimeSec(0), false)
    SPRT("upperBg"):SetVisible(false)
    SPRT("underBg"):SetVisible(false)
    FlowSys:Next("ModeEntry")
  end
  function FlowSys.Proc.ModeEntry()
    FLAG.ParaModeChange = CONST.FLAG_TRUE
    FLAG.ParaArea1st = CONST.FLAG_TRUE
    if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true then
      FLAG.NuooCounter = CONST.CNT_2
    end
    FUNC_COMMON:SetSdmcEnable(false)
    SCREEN_A:FadeInAll(TimeSec(0.5), true)
    subMapCameraDefMode()
    if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true then
      WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), MODECHANGE__CHOICE_OTHER_SIDE_HERO)
      WINDOW:CloseMessage()
    else
      WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), MODECHANGE__CHOICE_OTHER_SIDE)
      WINDOW:CloseMessage()
    end
    FlowSys:Next("FlowComplete")
  end
  function FlowSys.Proc.FlowEnd()
    retFlag = false
    FlowSys:Return()
  end
  function FlowSys.Proc.FlowComplete()
    WINDOW:CloseMessage()
    retFlag = true
    FlowSys:Return()
  end
  FlowSys:Call("ChangeAsk")
  WINDOW:CloseMessage()
  SPRITE:DestroySprite("upperBg")
  SPRITE:DestroySprite("underBg")
  SPRITE:DestroyPatternSet("upperSet")
  SPRITE:DestroyPatternSet("underSet")
  FlowSys:Finish()
  ShopSys:Finish()
  if gotoTutorialFlag then
    SYSTEM:BackupNowEntry_ToTemporary()
    SYSTEM:NextSpecialEntry(SymSpecialEntry("PARA_MODE_TUTORIAL_00"))
    return
  end
  FlowSys:Resume(resumeData)
  return retFlag
end
function DungeonToParadiseMenu()
  MENU:LoadMenuTextPool("message/ground.bin")
  local stResult = false
  if OpenGroundToParadiseFlow(true) then
    stResult = true
  end
  return stResult
end
function OpenReturnParadiseMenu()
  local resumeData = FlowSys:Suspend()
  local retFlag = false
  FlowSys:Start()
  function FlowSys.Proc.ChangeAsk()
    ShopSys:SysMsgAskFlowNoClose(MODECHANGE__RETRUN_SELECT, nil, nil, {text = MODECHANGE__RETRUN_SELECT_YES, next = "PreCheck"}, {text = MODECHANGE__RETRUN_SELECT_NO, next = "FlowEnd"})
  end
  function FlowSys.Proc.PreCheck()
    FlowSys.Stat.OverItem = false
    FlowSys.Stat.OverMoney = false
    do break end
    ShopSys:SysMsgAskFlowNoClose(MODECHANGE__CLOSE_SELECT, nil, nil, {text = MODECHANGE__CLOSE_SELECT_YES, next = ""}, {
      text = MODECHANGE__CLOSE_SELECT_NO,
      next = "FlowEnd",
      default = true
    })
    if ShopSys:NeedReturnFlow() then
      return
    end
    if QUEST:IsCurrentQuestInfo_Multi() then
      GM("TOMODACHI_GATE"):SetMotion(SymMot("close"), LOOP.OFF)
    else
      GM("IRAI_GATE"):SetMotion(SymMot("close"), LOOP.OFF)
    end
    ShopSys:SysMsg(MODECHANGE__CLOSE_FINISH)
    if QUEST:IsCurrentQuestInfo() then
      ShopSys:SysMsgAskFlowNoClose(MODECHANGE__QUEST_SELECT, nil, nil, {text = MODECHANGE__QUEST_SELECT_YES, next = ""}, {
        text = MODECHANGE__QUEST_SELECT_NO,
        next = "FlowEnd",
        default = true
      })
      if ShopSys:NeedReturnFlow() then
        return
      end
      if QUEST:IsCurrentQuestInfo_Multi() then
        GM("TOMODACHI_GATE"):SetMotion(SymMot("close"), LOOP.OFF)
      else
        GM("IRAI_GATE"):SetMotion(SymMot("close"), LOOP.OFF)
      end
      QUEST:ResetCurrentQuestInfo()
      ShopSys:SysMsg(MODECHANGE__QUEST_FINISH)
    end
    if FlowSys:Call("AllDeposit") then
      return
    end
    ShopSys:SysMsg(MODECHANGE__FINISH_DEPOSIT)
    FlowSys:Next("SaveExec")
  end
  function FlowSys.Proc.AllDeposit()
    local bagChests = {}
    local bagItems = {}
    for item in GROUND:EnumerateBagItems() do
      if item:GetKind() == ITEM_KIND.KIND_CHEST then
        table.insert(bagChests, item)
      else
        table.insert(bagItems, item)
      end
    end
    if GROUND:IsPossibleDepositItemWarehouse(bagItems) == false then
      FlowSys.Stat.OverItem = true
    end
    if GROUND:IsPossibleDepositItemWarehouse(bagChests) == false then
      FlowSys.Stat.OverItem = true
    end
    local sumMoney = GROUND:GetPlayerMoney() + GROUND:GetBankMoney()
    FlowSys.Stat.sumMoney = sumMoney
    if sumMoney > GROUND:GetBankMoneyLimit() then
      FlowSys.Stat.OverMoney = true
    end
    if FlowSys.Stat.OverItem == true then
      if FlowSys.Stat.OverMoney == true then
        select_message = MODECHANGE__CHANGE_SAVE_SELECT
      else
        select_message = MODECHANGE__CHANGE_SAVE_SELECT_ITEM
      end
    elseif FlowSys.Stat.OverMoney == true then
      select_message = MODECHANGE__CHANGE_SAVE_SELECT_MONEY
    end
    if FlowSys.Stat.OverItem == true or FlowSys.Stat.OverMoney == true then
      ShopSys:SysMsgAskFlowNoClose(select_message, nil, nil, {text = MODECHANGE__CHANGE_SAVE_SELECT_YES, next = ""}, {
        text = MODECHANGE__CHANGE_SAVE_SELECT_NO,
        returnNext = "FlowEnd",
        default = true,
        cancelUse = true
      })
      if ShopSys:NeedReturnFlow() then
        return
      end
    end
    GROUND:DepositItemWarehouse(bagItems)
    GROUND:DepositChestWarehouse(bagChests)
    bagChests = {}
    bagItems = {}
    for item in GROUND:EnumerateBagItems() do
      if item:GetKind() == ITEM_KIND.KIND_CHEST then
        table.insert(bagChests, item)
      else
        table.insert(bagItems, item)
      end
    end
    GROUND:DiscardBagItems(bagItems)
    GROUND:DiscardBagItems(bagChests)
    bagItems = nil
    bagChests = nil
    if FlowSys.Stat.sumMoney > GROUND:GetBankMoneyLimit() then
      FlowSys.Stat.sumMoney = GROUND:GetBankMoneyLimit()
    end
    GROUND:SetPlayerMoney(0)
    GROUND:SetBankMoney(FlowSys.Stat.sumMoney)
    FlowSys:Return()
  end
  function FlowSys.Proc.SaveStart()
    ShopSys:SysMsgAskFlowNoClose(MODECHANGE__CHANGE_SAVE_SELECT, nil, {next = "FlowEnd"}, {text = MODECHANGE__CHANGE_SAVE_SELECT_YES, next = "SaveExec"}, {text = MODECHANGE__CHANGE_SAVE_SELECT_NO, next = "FlowEnd"})
  end
  function FlowSys.Proc.SaveExec()
    WINDOW:SysMsg(-124596352)
    if SYSTEM:SaveGame() == false then
      FlowSys:Next("FlowEnd")
      return
    end
    WINDOW:ForceCloseMessage()
    ShopSys:SysMsg(-1617239266)
    WINDOW:CloseMessage()
    FlowSys:Next("ModeEntry")
  end
  function FlowSys.Proc.ModeEntry()
    FLAG.ParaModeChange = CONST.FLAG_TRUE
    if FLAG.DunClearRestToParadise == CONST.FLAG_TRUE then
      FLAG.DunClearRest = CONST.FLAG_TRUE
      FLAG.DunClearRestToParadise = CONST.FLAG_FALSE
    end
    FUNC_COMMON:SetSdmcEnable(false)
    SOUND:FadeOutBgm(TimeSec(0.5))
    SOUND:FadeOutEnv(TimeSec(0.5))
    EFFECT:SpotWipeOut(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), false)
    EFFECT:SpotWipeWait()
    EFFECT:SpotWipeIn(TimeSec(0), false)
    SCREEN_A:FadeOutAll(TimeSec(0), false)
    SCREEN_B:FadeOutAll(TimeSec(0), false)
    SCREEN_A:FadeOut(TimeSec(0), false)
    SCREEN_B:FadeOut(TimeSec(0), false)
    subMapCameraDefMode()
    SCREEN_A:FadeInAll(TimeSec(0.5), true)
    if FUNC_COMMON:CheckScenarioLevelOpenFlag("ending_clear") == true then
      WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), MODECHANGE__STORY_SAME_TIME_HERO)
      WINDOW:CloseMessage()
    else
      WINDOW:Narration(TimeSec(0.5), TimeSec(0.5), MODECHANGE__STORY_SAME_TIME)
      WINDOW:CloseMessage()
    end
    SCREEN_A:FadeOutAll(TimeSec(0), false)
    FlowSys:Next("FlowComplete")
  end
  function FlowSys.Proc.FlowEnd()
    WINDOW:CloseMessage()
    retFlag = false
    FlowSys:Return()
  end
  function FlowSys.Proc.FlowComplete()
    retFlag = true
    FlowSys:Return()
  end
  FlowSys:Call("ChangeAsk")
  FlowSys:Finish()
  FlowSys:Resume(resumeData)
  return retFlag
end

dofile("script/menu/menu_shop_main_sellf_low.lua")
function OpenParadiseHome_HenseiMenuLv1()
  OpenParadiseHome_HenseiMenu(false)
end
function OpenParadiseHome_HenseiMenuLv2()
  OpenParadiseHome_HenseiMenu(true)
end
function OpenParadiseHome_HenseiMenu(isOpenFormation)
  local menuChangeFadeFlag
  MENU:LoadMenuTextPool("message/menu_shop_paradise.bin", false)
  MENU:LoadMenuTextPool("message/shop.bin")
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_PARTY01")
  ShopSys:SetOwner("NUOO", "\227\131\140\227\130\170\227\131\188")
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetOwner("NUOO", "\227\131\140\227\130\170\227\131\188")
  ShopSys:SetShopKind(GroundItemShopKind.NUOO)
  menuChangeFadeFlag = true
  function FlowSys.Proc.henseiMenuOpen()
    FlowSys:Call("welcomeTalk")
    FlowSys:Next("henseiMenuEnd")
  end
  function FlowSys.Proc.welcomeTalk()
    if isOpenFormation == false then
      FlowSys:Next("welcomeTalkRegular")
    elseif MULTI_PLAY:IsLogined() then
      FlowSys:Next("welcomeMultiTalkFull")
    elseif SYSTEM:IsParadiseMode() then
      FlowSys:Next("welcomeParaTalkFull")
    else
      FlowSys:Next("welcomeTalkFull")
    end
  end
  function FlowSys.Proc.otherAskTalk()
    if isOpenFormation == false then
      FlowSys:Next("otherAskTalkRegular")
    elseif MULTI_PLAY:IsLogined() then
      FlowSys:Next("otherMultiAskTalkFull")
    elseif SYSTEM:IsParadiseMode() then
      FlowSys:Next("otherParaAskTalkFull")
    else
      FlowSys:Next("otherAskTalkFull")
    end
  end
  function FlowSys.Proc.welcomeTalkRegular()
    FlowSys:Next("shopMenu")
  end
  function FlowSys.Proc.otherAskTalkRegular()
    FlowSys:Next("shopMenu")
  end
  function FlowSys.Proc.welcomeTalkFull()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__WELCOME_FULL, FACE_TYPE.NORMAL, {cursorSaveName = "top"}, {returnNext = ""}, {
      text = SHOP_FORMATION__WELCOME_CHECK,
      next = "formationMenuCheckMulti"
    }, {
      text = SHOP_FORMATION__WELCOME_BYE,
      next = "formationByeMenuCheck"
    }, {text = SHOP_FORMATION__WELCOME_ITEM, next = "shopMenu"}, {text = SHOP_FORMATION__WELCOME_HELP, next = "shopExp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.otherAskTalkFull()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__SERIES, FACE_TYPE.NORMAL, {cursorSaveName = "top"}, {returnNext = ""}, {
      text = SHOP_FORMATION__SERIES_CHECK,
      next = "formationMenuCheckMulti"
    }, {
      text = SHOP_FORMATION__SERIES_BYE,
      next = "formationByeMenuCheck"
    }, {text = SHOP_FORMATION__SERIES_ITEM, next = "shopMenu"}, {text = SHOP_FORMATION__SERIES_HELP, next = "shopExp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.welcomeParaTalkFull()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__WELCOME_FULL, FACE_TYPE.NORMAL, {cursorSaveName = "top"}, {returnNext = ""}, {
      text = SHOP_FORMATION__WELCOME_CHECK,
      next = "formationMenuCheckMulti"
    }, {
      text = SHOP_FORMATION__WELCOME_LEADER,
      next = "formationLeaderMenuCheckMulti"
    }, {text = SHOP_FORMATION__WELCOME_ITEM, next = "shopMenu"}, {text = SHOP_FORMATION__WELCOME_HELP, next = "shopExp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.otherParaAskTalkFull()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__SERIES, FACE_TYPE.NORMAL, {cursorSaveName = "top"}, {returnNext = ""}, {
      text = SHOP_FORMATION__SERIES_CHECK,
      next = "formationMenuCheckMulti"
    }, {
      text = SHOP_FORMATION__WELCOME_LEADER,
      next = "formationLeaderMenuCheckMulti"
    }, {text = SHOP_FORMATION__SERIES_ITEM, next = "shopMenu"}, {text = SHOP_FORMATION__SERIES_HELP, next = "shopExp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.welcomeMultiTalkFull()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__WELCOME_MULTI, FACE_TYPE.NORMAL, {cursorSaveName = "top"}, {returnNext = ""}, {
      text = SHOP_FORMATION__WELCOME_MULTI_CHANGE,
      next = "formationLeaderMenuCheckMulti"
    }, {text = SHOP_FORMATION__WELCOME_MULTI_ITEM, next = "shopMenu"}, {text = SHOP_FORMATION__WELCOME_MULTI_HELP, next = "shopExp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.otherMultiAskTalkFull()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__SERIES_MULTI, FACE_TYPE.NORMAL, {cursorSaveName = "top"}, {returnNext = ""}, {
      text = SHOP_FORMATION__SERIES_MULTI_CHANGE,
      next = "formationLeaderMenuCheckMulti"
    }, {text = SHOP_FORMATION__SERIES_MULTI_ITEM, next = "shopMenu"}, {text = SHOP_FORMATION__SERIES_MULTI_HELP, next = "shopExp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.formationMenuCheckMulti()
    if MULTI_PLAY:IsLogined() then
      FlowSys:Next("formationMenuMulti")
      return
    end
    FlowSys:Next("formationMenu")
  end
  function FlowSys.Proc.formationLeaderMenuCheckMulti()
    FlowSys:Next("formationLeaderMenu")
  end
  function FlowSys.Proc.formationMenu()
    WINDOW:CloseMessage()
    SYSTEM:ExecuteTutorialHint(SymHint("SHOP_FORMATION_FIRST"))
    GROUND:SetPartyBuf(1)
    GROUND:SetPartyEquBuf()
    local function decAct()
      CommonSys:OpenBasicMenu(-1336456702, 1964640690)
      WINDOW:DrawFace(20, 88, SymAct(ShopSys.ownerAct), FACE_TYPE.NORMAL)
      WINDOW:Talk(SymAct(ShopSys.ownerAct), SHOP_FORMATION__MEMBER_CHOICE)
      WINDOW:SelectStart()
      WINDOW:SelectChain(SHOP_FORMATION__MEMBER_OK, 0)
      WINDOW:SelectChain(SHOP_FORMATION__MEMBER_MEMBER_CHG, 1)
      if SYSTEM:IsParadiseMode() then
      end
      WINDOW:SelectChain(SHOP_FORMATION__MEMBER_CANCEL, 3)
      local ret = WINDOW:SelectEndTalk(MENU_SELECT_MODE.ENABLE_CANCEL_HIDDEN)
      local nextFlow
      WINDOW:CloseMessage()
      CommonSys:CloseBasicMenu()
      if SYSTEM:IsParadiseMode() then
        nextFlow = "otherParaAskTalkFull"
      else
        nextFlow = "otherAskTalkFull"
      end
      if ret == 0 then
        CommonSys:OpenBasicMenu(nil, nil, nil, true)
        GROUND:SortPartyMember(false)
        ShopSys:Talk(SHOP_FORMATION__JOIN, FACE_TYPE.HAPPY)
        WINDOW:CloseMessage()
        FlowSys:Next(nextFlow)
        return true
      end
      if ret == 1 then
        return false
      end
      if ret == 2 then
        menuChangeFadeFlag = false
        FlowSys:Next("formationLeaderMenu")
        return true
      end
      if ret == 3 then
        CommonSys:OpenBasicMenu(nil, nil, nil, true)
        GROUND:GetPartyBufNoneSely(1)
        GROUND:GetPartyEquBuf()
        GROUND:SortPartyMember(false)
        FlowSys:Next(nextFlow)
        return true
      end
      return false
    end
    if menuChangeFadeFlag == true then
      SCREEN_A:FadeOutAll(TimeSec(0.5), false)
      SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    end
    menuChangeFadeFlag = true
    if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true and GROUND:IsPartyModeParadise() == true then
      DispMemberPokemonSelectMenu({
        padHelp = -1769773087,
        padHelpSub = -1885841760,
        flagNewChange = "CHANGE",
        flagSort = true,
        typeParty = "STORY_PARTY",
        typeDrawGroup = "ALL",
        cancelParty = false,
        decideAct = decAct,
        cancelAct = decAct,
        changeNameFlow = "changeName",
        fadeFlag = true,
        buddyCheck = true
      })
    else
      DispMemberPokemonSelectMenu({
        padHelp = -1769773087,
        padHelpSub = -1885841760,
        flagNewChange = "CHANGE",
        flagSort = true,
        typeParty = "STORY_PARTY",
        typeDrawGroup = "SOUKO",
        cancelParty = false,
        decideAct = decAct,
        cancelAct = decAct,
        changeNameFlow = "changeName",
        fadeFlag = true,
        buddyCheck = true
      })
    end
    if menuChangeFadeFlag == true then
      SCREEN_A:FadeInAll(TimeSec(0.5), false)
      SCREEN_B:FadeInAll(TimeSec(0.5), true)
    end
  end
  local formationLeaderMenu_PartyReset = function()
    GROUND:GetPartyBufNoneSely(1)
    GROUND:GetPartyEquBuf()
    if MULTI_PLAY:IsLogined() == true then
      GROUND:CallMultiUpdatePartyPokemonStatus()
    end
  end
  function FlowSys.Proc.formationLeaderMenu()
    WINDOW:CloseMessage()
    GROUND:SetPartyBuf(1)
    GROUND:SetPartyEquBuf()
    local function decAct(id)
      CommonSys:OpenBasicMenu(SHOP_FORMATION__CAPTION_CHG_LEADER, -1885841760)
      ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText(id))
      WINDOW:DrawFace(20, 88, SymAct(ShopSys.ownerAct), FACE_TYPE.NORMAL)
      WINDOW:Talk(SymAct(ShopSys.ownerAct), SHOP_FORMATION__LEADER_CHOICE)
      WINDOW:SelectStart()
      WINDOW:SelectChain(SHOP_FORMATION__LEADER_OK, 0)
      WINDOW:SelectChain(SHOP_FORMATION__LEADER_LEADER_CHG, 1)
      if MULTI_PLAY:IsLogined() then
      else
      end
      WINDOW:SelectChain(SHOP_FORMATION__LEADER_CANCEL, 3)
      local ret = WINDOW:SelectEndTalk(MENU_SELECT_MODE.ENABLE_CANCEL_HIDDEN)
      local nextFlow
      CommonSys:CloseBasicMenu()
      WINDOW:CloseMessage()
      if MULTI_PLAY:IsLogined() then
        nextFlow = "otherMultiAskTalkFull"
      elseif SYSTEM:IsParadiseMode() then
        nextFlow = "otherParaAskTalkFull"
      else
        nextFlow = "otherAskTalkFull"
      end
      if ret == 0 then
        CommonSys:OpenBasicMenu(nil, nil, nil, true)
        ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText(id))
        ShopSys:Talk(SHOP_FORMATION__LEADER_JOIN, FACE_TYPE.HAPPY)
        WINDOW:CloseMessage()
        FlowSys:Next(nextFlow)
        return true
      end
      if ret == 1 then
        formationLeaderMenu_PartyReset()
        return false
      end
      if ret == 2 then
        menuChangeFadeFlag = false
        FlowSys:Next("formationMenu")
        return true
      end
      if ret == 3 then
        CommonSys:OpenBasicMenu(nil, nil, nil, true)
        formationLeaderMenu_PartyReset()
        FlowSys:Next(nextFlow)
        return true
      end
      formationLeaderMenu_PartyReset()
      return false
    end
    local function canAct()
      formationLeaderMenu_PartyReset()
      if MULTI_PLAY:IsLogined() then
        FlowSys:Next("otherMultiAskTalkFull")
      elseif SYSTEM:IsParadiseMode() then
        FlowSys:Next("otherParaAskTalkFull")
      else
        FlowSys:Next("otherAskTalkFull")
      end
    end
    local NC
    if MULTI_PLAY:IsLogined() then
      NC = "MULTI"
    else
      NC = "CHANGE"
    end
    local DG
    if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true and GROUND:IsPartyModeParadise() == true then
      DG = "ALL"
    elseif FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true and MULTI_PLAY:IsLogined() then
      DG = "ALL"
    else
      DG = "SOUKO"
    end
    if menuChangeFadeFlag == true then
      SCREEN_A:FadeOutAll(TimeSec(0.5), false)
      SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    end
    menuChangeFadeFlag = true
    DispLeaderPokemonSelectMenu({
      titleText = SHOP_FORMATION__CAPTION_CHG_LEADER,
      flagNewChange = NC,
      flagSort = true,
      typeParty = "STORY_PARTY",
      typeDrawGroup = DG,
      decideAct = decAct,
      cancelAct = canAct,
      killButStart = true,
      fadeFlag = true,
      buddyCheck = true
    })
    if menuChangeFadeFlag == true then
      SCREEN_A:FadeInAll(TimeSec(0.5), false)
      SCREEN_B:FadeInAll(TimeSec(0.5), true)
    end
    if MULTI_PLAY:IsLogined() ~= true then
      GROUND:SortPartyMember(false)
    else
      GROUND:SortMultiPlayerParty()
    end
    if MULTI_PLAY:IsLogined() == true then
      MULTI_PLAY:SendBroadcastEquipItemChange(false)
      if MULTI_PLAY:IsMaster() then
        MULTI_PLAY:SetUpdateAppData()
      end
    end
  end
  local isPokemonSelectRemove = function()
    local ret = false
    for wareHouseId in GROUND:EnumeratePokemonWarehouseId() do
      if GROUND:IsPokemonWarehouseIdPartPossible(wareHouseId) == true and GROUND:IsPokemonWarehouseIdBuddy(wareHouseId) == false then
        ret = true
      end
    end
    return ret
  end
  function FlowSys.Proc.formationByeMenuCheck()
    WINDOW:CloseMessage()
    ShopSys:Talk(SHOP_FORMATION__PART_ANA, FACE_TYPE.SURPRISE)
    if isPokemonSelectRemove() == false then
      ShopSys:Talk(SHOP_FORMATION__PART_NO_DECIDE_CHAR, FACE_TYPE.SURPRISE)
      WINDOW:CloseMessage()
      if MULTI_PLAY:IsLogined() then
        FlowSys:Next("otherMultiAskTalkFull")
      elseif SYSTEM:IsParadiseMode() then
        FlowSys:Next("otherParaAskTalkFull")
      else
        FlowSys:Next("otherAskTalkFull")
      end
      return
    end
    FlowSys:Next("formationByeMenu")
  end
  function FlowSys.Proc.formationByeMenu()
    ShopSys:Talk(SHOP_FORMATION__PART_CHOICE, FACE_TYPE.SAD)
    WINDOW:CloseMessage()
    local decAct = function(id)
      local byePokemonID = id
      local byeWarehouseID = ShopSys.shopping_selectPokemonWarehouseId
      CommonSys:OpenBasicMenu(SHOP_FORMATION__CAPTION_PART, -1885841760, nil, true)
      ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText(id))
      WINDOW:DrawFace(20, 88, SymAct(ShopSys.ownerAct), FACE_TYPE.NORMAL)
      WINDOW:Talk(SymAct(ShopSys.ownerAct), SHOP_FORMATION__PART)
      WINDOW:SelectStart()
      WINDOW:SelectChain(SHOP_FORMATION__PART_YES, 1)
      WINDOW:SelectChain(SHOP_FORMATION__PART_NO, 0)
      local ret = WINDOW:SelectEndTalk(MENU_SELECT_MODE.ENABLE_CANCEL_HIDDEN)
      local nextFlow
      CommonSys:OpenBasicMenu(nil, nil, nil, true)
      WINDOW:CloseMessage()
      if MULTI_PLAY:IsLogined() then
        nextFlow = "otherMultiAskTalkFull"
      elseif SYSTEM:IsParadiseMode() then
        nextFlow = "otherParaAskTalkFull"
      else
        nextFlow = "otherAskTalkFull"
      end
      if ret == 1 then
        ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText(byePokemonID))
        ShopSys:Talk(SHOP_FORMATION__PART_YES_DECIDE)
        WINDOW:CloseMessage()
        SOUND:PlayMe(SymSnd("ME_SEEYOU"))
        ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText(byePokemonID))
        WINDOW:SysMsg(SHOP_FORMATION__PART_YES_DECIDE_SYS_MES)
        SOUND:WaitMe()
        WINDOW:CloseMessage()
        if GROUND:IsPokemonWarehouseIdBuddy(byeWarehouseID) then
          ShopSys:SelectPokemonWarehouseId(byeWarehouseID)
          ShopSys:ChangeSelectPokemonStandby()
        end
        GROUND:RemovePokemonWarehouseFromId(byeWarehouseID)
        WINDOW:CloseMessage()
        FlowSys:Next(nextFlow)
        return true
      end
      if ret == 0 then
      end
      ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText(id))
      ShopSys:Talk(SHOP_FORMATION__PART_NO_DECIDE)
      WINDOW:CloseMessage()
      FlowSys:Next(nextFlow)
      return true
    end
    local canAct = function()
      if SYSTEM:IsParadiseMode() then
        FlowSys:Next("otherParaAskTalkFull")
      else
        FlowSys:Next("otherAskTalkFull")
      end
    end
    SCREEN_A:FadeOutAll(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    DispLeaderPokemonSelectMenu({
      titleText = SHOP_FORMATION__CAPTION_PART,
      flagNewChange = "CHANGE",
      padHelp = -1531640477,
      flagSort = true,
      typeParty = "STORY_PARTY",
      typeDrawGroup = "REMOVE",
      flagIndexOnly = true,
      decideAct = decAct,
      cancelAct = canAct,
      killButStart = true,
      fadeFlag = true,
      buddyCheck = true
    })
    SCREEN_A:FadeInAll(TimeSec(0.5), false)
    SCREEN_B:FadeInAll(TimeSec(0.5), true)
  end
  function partSelect()
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText())
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__PART, FACE_TYPE.NORMAL, nil, nil, {
      text = SHOP_FORMATION__PART_YES,
      next = "welcomeTalkFull",
      obj = {index = true}
    }, {
      text = SHOP_FORMATION__PART_NO,
      returnNext = "",
      default = true,
      obj = {index = false}
    })
    if ShopSys:GetLastAskSelectObj().index == false then
      ShopSys:Talk(SHOP_FORMATION__PART_NO_DECIDE, FACE_TYPE.NORMAL)
      return false
    end
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText())
    ShopSys:Talk(SHOP_FORMATION__PART_YES_DECIDE, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    SOUND:PlayMe(SymSnd("ME_SEEYOU"))
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText())
    WINDOW:SysMsg(SHOP_FORMATION__PART_YES_DECIDE_SYS_MES)
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    return true
  end
  function FlowSys.Proc.leaderSelect()
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText())
    ShopSys:Talk(SHOP_FORMATION__LEADER, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  function FlowSys.Proc.standbySelect()
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText())
    ShopSys:Talk(SHOP_FORMATION__STANDBY, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  function FlowSys.Proc.joinSelect()
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText())
    ShopSys:Talk(SHOP_FORMATION__JOIN, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  function FlowSys.Proc.partSelectCancel()
    ShopSys:Talk(SHOP_FORMATION__PART_NO_DECIDE, FACE_TYPE.NORMAL)
    FlowSys:Next("formationMenuCheckMulti")
  end
  function FlowSys.Proc.checkSelect()
    ShopSys:DispPokemonStatusMenu()
    FlowSys:Return()
  end
  function FlowSys.Proc.changeName()
    local defaultName = ShopSys:GetSelectPokemonWarehouseNameText()
    local tempName = defaultName
    local nameInputMenu = MENU:CreateNameInputMenu(ScreenType.B)
    nameInputMenu:SetText(defaultName)
    function nameInputMenu:decideAction()
      defaultName = nameInputMenu:GetText()
      self:Close()
    end
    function nameInputMenu:cancelAction()
      defaultName = nameInputMenu:GetText()
      self:Close()
    end
    function nameInputMenu:currentItemChange()
    end
    function nameInputMenu:openedAction()
    end
    function nameInputMenu:closedAction()
    end
    function nameInputMenu:ngAction()
      WINDOW:SetMessageScreenMode(ScreenType.B)
      WINDOW:SysMsg(998639762)
      WINDOW:CloseMessage()
      WINDOW:SetMessageScreenMode(ScreenType.A)
    end
    nameInputMenu:Open()
    MENU:SetFocus(nameInputMenu)
    MENU:WaitClose(nameInputMenu)
    GROUND:ChangePartyNameFromWarehouse(ShopSys.shopping_selectPokemonWarehouseId, defaultName)
    FlowSys:Return()
  end
  function FlowSys.Proc.formationMenuMulti()
    WINDOW:CloseMessage()
    if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true and GROUND:IsPartyModeParadise() == true then
      DispLeaderPokemonSelectMenu({
        flagNewChange = "NEW",
        flagSort = true,
        typeParty = "STORY_PARTY",
        typeDrawGroup = "ALL",
        decideAct = function()
          FlowSys:Next("leaderChenge")
        end,
        cancelAct = function()
          FlowSys:Next("formationMenuCheckMulti")
        end,
        buddyCheck = true
      })
    else
      DispLeaderPokemonSelectMenu({
        flagNewChange = "NEW",
        flagSort = true,
        typeParty = "STORY_PARTY",
        typeDrawGroup = "SOUKO",
        decideAct = function()
          FlowSys:Next("leaderChenge")
        end,
        cancelAct = function()
          FlowSys:Next("formationMenuCheckMulti")
        end,
        buddyCheck = true
      })
    end
    FlowSys:Return()
  end
  function FlowSys.Proc.leaderChenge()
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText())
    ShopSys:Talk(SHOP_FORMATION__LEADER_CHANGE, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  function FlowSys.Proc.shopMenu()
    if isOpenFormation == false then
      FlowSys:Next("shopMenuRegular")
    else
      FlowSys:Next("shopMenuFull")
    end
  end
  function FlowSys.Proc.shopMenuRegular()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__ITEM_REGULAR, FACE_TYPE.NORMAL, {cursorReset = true}, {returnNext = ""}, {
      text = SHOP_FORMATION__ITEM_BUY,
      next = "TopBuyBefore"
    }, {text = SHOP_FORMATION__ITEM_SELL, next = "TopSell"}, {text = SHOP_FORMATION__ITEM_SELL_ALL, next = "SellAll"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.shopMenuFull()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, 1331611147, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__ITEM, FACE_TYPE.NORMAL, {cursorSaveName = "ShopTop"}, {
      next = "ExitMerchant"
    }, {
      text = SHOP_FORMATION__ITEM_BUY,
      next = "TopBuyBefore"
    }, {text = SHOP_FORMATION__ITEM_SELL, next = "TopSell"}, {text = SHOP_FORMATION__ITEM_SELL_ALL, next = "SellAll"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopLoop()
    if isOpenFormation == false then
      FlowSys:Next("shopMenuRegularLoop")
    else
      FlowSys:Next("shopMenuFullLoop")
    end
  end
  function FlowSys.Proc.shopMenuRegularLoop()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__ITEM_AGAIN, nil, {cursorSaveName = "ShopTop"}, {returnNext = ""}, {
      text = SHOP_FORMATION__ITEM_AGAIN_BUY,
      next = "TopBuyBefore"
    }, {text = SHOP_FORMATION__ITEM_AGAIN_SELL, next = "TopSell"}, {text = SHOP_FORMATION__ITEM_AGAIN_SELL_ALL, next = "SellAll"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.shopMenuFullLoop()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, 1331611147, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__ITEM_AGAIN, nil, {cursorReset = true}, {
      next = "ExitMerchant"
    }, {
      text = SHOP_FORMATION__ITEM_AGAIN_BUY,
      next = "TopBuyBefore"
    }, {text = SHOP_FORMATION__ITEM_AGAIN_SELL, next = "TopSell"}, {text = SHOP_FORMATION__ITEM_AGAIN_SELL_ALL, next = "SellAll"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.TopBuyBefore()
    if ShopSys:CheckLineup() == false then
      ShopSys:Talk(SHOP_FORMATION__SOLDOUT, nil)
      WINDOW:KeyWait()
      FlowSys:Next("MenuTopLoop")
      return
    end
    ShopSys:Talk(SHOP_FORMATION__BUY_INTO, nil)
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
    end, SHOP_FORMATION__CAPTION_BUY, SHOP_FORMATION__BUY_SELECT_BUY, SHOP_FORMATION__BUY_SELECT_EXPLAIN)
  end
  function FlowSys.Proc.ItemGuide(nextFlow)
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    DispItemGuide()
    CommonSys:EndLowerMenuNavi(true)
    FlowSys:Next(nextFlow)
  end
  function FlowSys.Proc.Buy()
    if ShopSys:CheckBuyablePrice() == false then
      ShopSys:Talk(SHOP_FORMATION__BUY_NO_MONEY, nil)
      FlowSys:Next("TopBuy")
      return
    end
    if ShopSys:CheckBagOver() == true then
      ShopSys:Talk(SHOP_FORMATION__BUY_NO_ITEMMAX, nil)
      FlowSys:Next("TopBuy")
      return
    end
    FlowSys:Next("ManyBuy")
  end
  function FlowSys.Proc.ManyBuy()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183", ShopSys:GetSelectItemName())
    ShopSys:SetShopTag("\229\144\136\232\168\136\229\163\178\229\141\180\233\161\141", ShopSys:GetBuyPriceText())
    if ShopSys:CheckMultiSelect() == true then
      ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__BUY_CONFIRM_PLURAL, nil, nil, {next = "TopBuy"}, {
        text = SHOP_FORMATION__BUY_CONFIRM_PLURAL_YES,
        next = "Payment",
        default = true
      }, {text = SHOP_FORMATION__BUY_CONFIRM_PLURAL_NO, next = "TopBuy"})
    else
      ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__BUY_CONFIRM, nil, nil, {next = "TopBuy"}, {
        text = SHOP_FORMATION__BUY_CONFIRM_YES,
        next = "Payment",
        default = true
      }, {text = SHOP_FORMATION__BUY_CONFIRM_NO, next = "TopBuy"})
    end
  end
  function FlowSys.Proc.Payment()
    ShopSys:Buy()
    SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
    ShopSys:Talk(SHOP_FORMATION__BUY_THANKS)
    FlowSys:Next("SoldOut")
  end
  function FlowSys.Proc.SoldOut()
    if ShopSys:CheckLineup() == false then
      ShopSys:Talk(SHOP_FORMATION__BUY_SOLDOUT, nil)
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
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__BUY_SERIES, nil, nil, {
      next = "MenuTopLoop"
    }, {
      text = SHOP_FORMATION__BUY_SERIES_YES,
      next = "TopBuy",
      default = true
    }, {
      text = SHOP_FORMATION__BUY_SERIES_NO,
      next = "MenuTopLoop"
    })
  end
  SetupCommonFlow_ShopSellFlow({
    TEXT_SELL_ITEM_SELECT = SHOP_FORMATION__SELL_ITEM_SELECT,
    TEXT_SELL_ALL = SHOP_FORMATION__SELL_ALL,
    TEXT_SELL_ALL_YES = SHOP_FORMATION__SELL_ALL_YES,
    TEXT_SELL_ALL_NO = SHOP_FORMATION__SELL_ALL_NO,
    TEXT_SELL_NO_ITEM = SHOP_FORMATION__SELL_NO_ITEM,
    TEXT_SELL_NO_SELLITEM = SHOP_FORMATION__SELL_NO_SELLITEM,
    TEXT_SELL_MAX_MONEY = SHOP_FORMATION__SELL_MAX_MONEY,
    TEXT_SELL_ALL_BANK = SHOP_FORMATION__SELL_ALL_BANK,
    TEXT_SELL_MAX_BANK = SHOP_FORMATION__SELL_MAX_BANK,
    TEXT_SELL_MAX_BANK_YES = SHOP_FORMATION__SELL_MAX_BANK_YES,
    TEXT_SELL_MAX_BANK_NO = SHOP_FORMATION__SELL_MAX_BANK_NO,
    TEXT_SELL_MAX_THANKS = SHOP_FORMATION__SELL_MAX_THANKS,
    TEXT_CAPTION_SELL = SHOP_FORMATION__CAPTION_SELL,
    TEXT_SELL_SELECT_SELL = SHOP_FORMATION__SELL_SELECT_SELL,
    TEXT_SELL_SELECT_EXPLAIN = SHOP_FORMATION__SELL_SELECT_EXPLAIN,
    TEXT_SELL_CONFIRM_PLURAL = SHOP_FORMATION__SELL_CONFIRM_PLURAL,
    TEXT_SELL_CONFIRM_PLURAL_YES = SHOP_FORMATION__SELL_CONFIRM_PLURAL_YES,
    TEXT_SELL_CONFIRM_PLURAL_NO = SHOP_FORMATION__SELL_CONFIRM_PLURAL_NO,
    TEXT_SELL_CONFIRM_NO_SELLITEM = SHOP_FORMATION__SELL_CONFIRM_NO_SELLITEM,
    TEXT_SELL_CONFIRM = SHOP_FORMATION__SELL_CONFIRM,
    TEXT_SELL_CONFIRM_YES = SHOP_FORMATION__SELL_CONFIRM_YES,
    TEXT_SELL_CONFIRM_NO = SHOP_FORMATION__SELL_CONFIRM_NO,
    TEXT_SELL_MAX_MONEY_TO_BANK = SHOP_FORMATION__SELL_MAX_MONEY_TO_BANK,
    TEXT_SELL_MAX_BANK = SHOP_FORMATION__SELL_MAX_BANK,
    TEXT_SELL_MAX_BANK_YES = SHOP_FORMATION__SELL_MAX_BANK_YES,
    TEXT_SELL_MAX_BANK_NO = SHOP_FORMATION__SELL_MAX_BANK_NO,
    TEXT_SELL_MAX_THANKS = SHOP_FORMATION__SELL_MAX_THANKS,
    TEXT_SELL_THANKS = SHOP_FORMATION__SELL_THANKS,
    TEXT_SELL_SERIES = SHOP_FORMATION__SELL_SERIES,
    TEXT_SELL_SERIES_YES = SHOP_FORMATION__SELL_SERIES_YES,
    TEXT_SELL_SERIES_NO = SHOP_FORMATION__SELL_SERIES_NO
  })
  function FlowSys.Proc.Help()
    if isOpenFormation == false then
      FlowSys:Next("HelpShop")
      return
    end
    CommonSys:OpenBasicMenu(nil, 1331611147, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__HELP_SELECT, nil, nil, {
      next = "MenuTopLoop"
    }, {
      text = SHOP_FORMATION__HELP_SELECT_SHOP,
      next = "HelpShopFull"
    }, {
      text = SHOP_FORMATION__HELP_SELECT_TEAMSKILL,
      next = "HelpTeamSkill"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.HelpTeamSkill()
    ShopSys:Talk(SHOP_FORMATION__HELP_TEAMSKILL, nil)
    WINDOW:CloseMessage()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.HelpShop()
    ShopSys:Talk(SHOP_FORMATION__HELP_1, nil)
    WINDOW:CloseMessage()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.HelpShopFull()
    ShopSys:Talk(SHOP_FORMATION__HELP_2, nil)
    WINDOW:CloseMessage()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.HelpParaMode1()
    ShopSys:Talk(SHOP_FORMATION__HELP_PARAMODE1, nil)
    WINDOW:CloseMessage()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.HelpParaMode2()
    ShopSys:Talk(SHOP_FORMATION__HELP_PARAMODE1, nil)
    WINDOW:CloseMessage()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.ExitMerchant()
    FlowSys:Next("otherAskTalk")
  end
  function FlowSys.Proc.shopExp()
    if isOpenFormation == false then
      FlowSys:Next("shopExpShop")
      return
    end
    if MULTI_PLAY:IsLogined() then
      FlowSys:Next("shopExpMultiPlay")
      return
    end
    if SYSTEM:IsParadiseMode() then
      FlowSys:Next("shopExpSinglePlayPara")
    else
      FlowSys:Next("shopExpShopFull2")
    end
  end
  function FlowSys.Proc.shopExpSinglePlay()
    CommonSys:OpenBasicMenu(nil, 1331611147, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__HELP_SELECT, FACE_TYPE.NORMAL, nil, {
      next = "otherAskTalk"
    }, {
      text = SHOP_FORMATION__HELP_SELECT_SHOP,
      next = "shopExpShopFull"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.shopExpSinglePlayPara()
    CommonSys:OpenBasicMenu(nil, 1331611147, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__HELP_SELECT, FACE_TYPE.NORMAL, nil, {
      next = "otherAskTalk"
    }, {
      text = SHOP_FORMATION__HELP_SELECT_SHOP,
      next = "shopExpShopFull"
    }, {
      text = SHOP_FORMATION__HELP_SELECT_PARAMODE1,
      next = "shopExpShopParaMode1"
    }, {
      text = SHOP_FORMATION__HELP_SELECT_PARAMODE2,
      next = "shopExpShopParaMode2"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.shopExpMultiPlay()
    CommonSys:OpenBasicMenu(nil, 1331611147, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FORMATION__HELP_SELECT, FACE_TYPE.NORMAL, nil, {
      next = "otherAskTalk"
    }, {
      text = SHOP_FORMATION__HELP_SELECT_MULTI,
      next = "shopExpShopMultiPlay"
    }, {
      text = SHOP_FORMATION__HELP_SELECT_MULTI_CHG,
      next = "shopExpShopMultiLeader"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.shopExpTeamSkill()
    ShopSys:Talk(SHOP_FORMATION__HELP_TEAMSKILL, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Next("shopExp")
  end
  function FlowSys.Proc.henseiMenuEnd()
    ShopSys:Talk(SHOP_FORMATION__EXIT, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  function FlowSys.Proc.shopExpShop()
    ShopSys:Talk(SHOP_FORMATION__HELP_1, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Next("shopExp")
  end
  function FlowSys.Proc.shopExpShopFull()
    ShopSys:Talk(SHOP_FORMATION__HELP_2, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Next("shopExp")
  end
  function FlowSys.Proc.shopExpShopFull2()
    ShopSys:Talk(SHOP_FORMATION__HELP_2, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Next("otherAskTalkFull")
  end
  function FlowSys.Proc.shopExpShopMultiPlay()
    ShopSys:Talk(SHOP_FORMATION__HELP_3, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Next("shopExp")
  end
  function FlowSys.Proc.shopExpShopParaMode1()
    ShopSys:Talk(SHOP_FORMATION__HELP_PARAMODE1, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Next("otherAskTalk")
  end
  function FlowSys.Proc.shopExpShopParaMode2()
    ShopSys:Talk(SHOP_FORMATION__HELP_PARAMODE2, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Next("otherAskTalk")
  end
  function FlowSys.Proc.shopExpShopMultiLeader()
    ShopSys:Talk(SHOP_FORMATION__HELP_LEADER_CHANGE, FACE_TYPE.NORMAL)
    WINDOW:CloseMessage()
    FlowSys:Next("otherAskTalk")
  end
  FlowSys:Call("henseiMenuOpen")
  WINDOW:CloseMessage()
  LOWER_SCREEN:ChangeLastWallpaper()
  FlowSys:Finish()
  ShopSys:Finish()
end

dofile("script/include/debug/inc_debug_menu_action.lua")
function groundDebugMenu_PopupResult(self, text)
  local menu = MENU:CreatePageMenu()
  menu:SetCaption("\227\130\138\227\129\150\227\130\139\227\129\168")
  menu:SetLayoutRectAndLines(60, 100, 200, 0)
  NestMenu_SetupDefaultAction(menu, self)
  menu:AddItem(text, nil, {
    decideAction = function(self)
      self:Close()
    end
  })
  NestMenu_OpenAndCloseWait(menu)
end
GROUND._dummyResumeCursorTbl = {}
function GROUND:GetResumeCursorIndex(name)
  local curIdx = self._dummyResumeCursorTbl[name]
  if curIdx ~= nil then
    return curIdx
  end
  return 0
end
function GROUND:SetResumeCursorIndex(name, curIdx)
  GROUND._dummyResumeCursorTbl[name] = curIdx
end
function GROUND:IsExistNoSallyPokemon()
  for wareHouseId in GROUND:EnumeratePokemonWarehouseId() do
    if GROUND:IsPokemonWarehouseSally(wareHouseId) == false then
      return true
    end
  end
  return false
end
function ChangeTaikiFreeMoveChara()
  SYSTEM:FreeMoveScriptEventStartForMenu()
  if CHARA:IsExist("HERO") then
    CH("HERO"):SetTaiki()
  end
  if CHARA:IsExist("PARTNER") then
    CH("PARTNER"):SetTaiki()
  end
  if CHARA:IsExist("PLAYER") then
    CH("PLAYER"):SetTaiki()
  end
end
function Ground_Save(save_type)
  return Ground_SaveCore(save_type, true, true)
end
function Ground_SaveNoneRestMessage(save_type)
  return Ground_SaveCore(save_type, false, true)
end
function Ground_SaveNotException(save_type)
  return Ground_SaveCore(save_type, true, false)
end
function Ground_SaveCore(save_type, bGameRestMessage, bException)
  local nResult = 0
  local bScreenB = false
  if SCREEN_B:IsFadeOutAllComplete() then
    bScreenB = true
    SCREEN_B:FadeInAll(TimeSec(0, TIME_TYPE.FRAME), false)
  end
  if save_type == "normal_top" then
    nResult = 2
  elseif save_type ~= "normal" then
    local bLoop = true
    FUNC_COMMON:OpenTopMenuWindow()
    while bLoop == true do
      WINDOW:SysMsg(-623398217)
      WINDOW:SelectStart()
      if save_type ~= "staging_post" then
        WINDOW:SelectChain(1251256327, 1)
      end
      WINDOW:SelectChain(1401919814, 2)
      WINDOW:SelectChain(2023934597, 0)
      if save_type ~= "staging_post" then
        WINDOW:DefaultCursor(1)
      else
        WINDOW:DefaultCursor(2)
      end
      nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
      if SYSTEM:GetSaveStatus() ~= SAVE_STATUS.START and (nResult == 1 or nResult == 2) then
        WINDOW:SysMsg(-1319460650)
        WINDOW:SelectStart()
        WINDOW:SelectChain(-320184181, 0)
        WINDOW:SelectChain(-168734262, 1)
        WINDOW:DefaultCursor(0)
        local nResult2 = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
        if nResult2 == 0 then
          bLoop = false
        end
      else
        bLoop = false
      end
    end
    FUNC_COMMON:CloseTopMenuWindow()
  else
    nResult = 1
  end
  if nResult ~= 0 and nResult ~= -1 then
    WINDOW:SysMsg(-124596352)
    local bResult = false
    if save_type == "dungeon" then
      bResult = SYSTEM:SaveDungeon(false, false)
    elseif save_type == "dungeon_to_paradise" then
      bResult = SYSTEM:SaveDungeon(false, false)
    elseif save_type == "staging_post" then
      bResult = SYSTEM:SaveDungeon(false, false)
    else
      bResult = SYSTEM:SaveGame()
    end
    WINDOW:ForceCloseMessage()
    if bResult then
      if nResult == 2 then
        FUNC_COMMON:OpenTopMenuWindowForSaveAfter()
        WINDOW:SysMsg(-1209879105)
        if bGameRestMessage then
          SYSTEM:CheckGameRestMessage()
        end
      else
        FUNC_COMMON:OpenTopMenuWindowForSaveAfter()
        WINDOW:SysMsg(-1617239266)
        if bGameRestMessage then
          SYSTEM:CheckGameRestMessage()
        end
      end
    else
      WINDOW:SysMsg(1697017689)
    end
    WINDOW:CloseMessage()
    FUNC_COMMON:CloseTopMenuWindow()
  end
  local bFlowResult = false
  if nResult == 2 then
    SOUND:FadeOut(TimeSec(0.5))
    FUNC_COMMON:ClearNoticeSimpleRequest()
    if SCREEN_B:IsFadeOutAllComplete() == false then
      SCREEN_A:FadeOutAll(TimeSec(0.5), false)
      SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    else
      SCREEN_A:FadeOutAll(TimeSec(0.5), true)
    end
    SYSTEM:ReturnTopMenuException()
    bFlowResult = true
  end
  if bScreenB then
    SCREEN_B:FadeOutAll(TimeSec(0, TIME_TYPE.FRAME), false)
  end
  return bFlowResult
end
function Ground_OpenMenu(flowSymbol)
  if flowSymbol == "itemFlow" then
  elseif flowSymbol == "partyFlow" then
  elseif flowSymbol == "otherFlow" then
  elseif flowSymbol == "save" then
  elseif flowSymbol == "debugFlow" then
  end
  local loadTextPool = function()
    MENU:LoadMenuTextPool("message/menu_ground.bin", false)
    MENU:LoadMenuTextPool("message/menu_dungeon.bin")
    MENU:LoadMenuTextPool("message/top.bin")
    if not SYSTEM:IsDungeon() then
      MENU:LoadMenuTextPool("message/shop.bin")
    end
  end
  loadTextPool()
  ChangeTaikiFreeMoveChara()
  local groundMenuSys = {}
  local function openGroundInfoMenuSet()
    CommonSys:OpenBasicMenu(nil, -671326613, "")
    groundMenuSys.iconX = 0
    groundMenuSys.iconY = 0
    groundMenuSys.iconCount = 0
    groundMenuSys.iconLinkL = 0
    groundMenuSys.iconLinkR = 0
    groundMenuSys.iconLinkU = 0
    groundMenuSys.iconLinkD = 0
  end
  local setVisibleGroundInfoMenuSet = function(isVisible)
    CommonSys:SetVisibleBasicMenu(isVisible)
  end
  local closeGroundInfoMenuSet = function()
    CommonSys:CloseBasicMenu()
  end
  FlowSys:Start()
  FlowSys.Proc.dungeonMenuExplainWindow = dungeonMenuExplainWindow
  function OpenGroundPartyMenu()
    FlowSys.Stat.nextFunc = "groundMenuExit"
    dungeonMenuPartyProc()
    FlowSys.Stat.useWarehouseId = false
    FlowSys:Next(FlowSys.Stat.nextFunc)
  end
  function groundMenuItemHelp()
    local textId = FUNC_COMMON:GetItemExplainTextId(FlowSys.Stat.itemBagTbl.itemIns:GetIndex())
    local explainWindow = CommonSys:OpenBasicExplainMenu(textId, nil)
    MENU:SetFocus(explainWindow)
    MENU:WaitClose(explainWindow)
    FlowSys.Stat.nextFunc = "itemFlow"
  end
  function groundMenuItemPokemon()
    if SYSTEM:IsMultiPlayMode() then
      FUNC_COMMON:ResetMultiMemberChange()
    end
    FlowSys.Stat.selectFlag = true
    FlowSys.Stat.nextFunc = "itemFlow"
    SYSTEM:DebugPrint("groundMenuItemPokemon")
    local selectItem = FlowSys.Stat.itemBagTbl.selectItem
    local pokemonId = FlowSys.Stat.itemBagTbl.pokemonId
    local useItem = FlowSys.Stat.itemBagTbl.useItem
    local itemIns = FlowSys.Stat.itemBagTbl.itemIns
    local targetItem = FlowSys.Stat.itemBagTbl.targetItem
    local charaMenu = CreatePokeItemWindow(itemIns, selectItem ~= DungeonMenuSelectItems.SELECT_MENU_ITEM_EQUIP)
    function charaMenu:cancelAction()
      self:Close()
      FlowSys.Stat.itemBagTbl = nil
      FlowSys.Stat.selectFlag = false
    end
    function charaMenu:decideAction()
      if SYSTEM:IsMultiPlayMode() and FUNC_COMMON:GetMultiMemberChangeNotEquip() then
        self:cancelAction()
      else
        pokemonId = self.curItem.obj
        self:Close()
        FlowSys.Stat.selectFlag = true
      end
    end
    function charaMenu:currentItemChange()
      if SYSTEM:IsMultiPlayMode() and FUNC_COMMON:GetMultiMemberChangeNotEquip() then
        self:cancelAction()
      else
        if self.equipMenu ~= nil then
          self.equipMenu:ClearMessage()
          self.equipMenu:SetMessageId("mess_01", 1028648109)
          self.equipMenu:SetMessageStr("mess_02", FUNC_COMMON:GetEquippedItemName(self.curItem.obj))
        end
        self.partyWindow:SetMemberId(self.curItem.obj)
      end
    end
    CommonSys:OpenBasicMenu("", "")
    charaMenu:Open()
    MENU:SetFocus(charaMenu)
    MENU:WaitClose(charaMenu)
    CommonSys:CloseBasicMenu()
  end
  function groundUseItem()
    if SYSTEM:IsMultiPlayMode() then
      FUNC_COMMON:ResetMultiMemberChange()
    end
    local selectItem = FlowSys.Stat.itemBagTbl.selectItem
    local pokemonId = FlowSys.Stat.itemBagTbl.pokemonId
    local useItem = FlowSys.Stat.itemBagTbl.useItem
    local itemIns = FlowSys.Stat.itemBagTbl.itemIns
    CommonSys:DisableLowerMenuNaviAll()
    upScreenStatusWindow = MENU:CreateWazaStatusWindow(ScreenType.A)
    upScreenStatusWindow:SetLayoutRect(64, 40, 272, 172)
    upScreenStatusWindow:SetFacePos(68, 44)
    upScreenStatusWindow:SetNameWindowRect(64, 104, 64, 16)
    upScreenStatusWindow:SetType1Pos(80, 0)
    upScreenStatusWindow:SetType2Pos(184, 0)
    upScreenStatusWindow:SetLvPos(80, 20)
    upScreenStatusWindow:SetHpPos(80, 36)
    upScreenStatusWindow:SetAttackPos(80, 58)
    upScreenStatusWindow:SetDefendPos(176, 58)
    upScreenStatusWindow:SetAttackExPos(80, 74)
    upScreenStatusWindow:SetDefendExPos(176, 74)
    upScreenStatusWindow:SetAbilityPos(80, 90)
    upScreenStatusWindow:SetWaza1Pos(80, 110)
    upScreenStatusWindow:SetWaza2Pos(80, 126)
    upScreenStatusWindow:SetWaza3Pos(80, 142)
    upScreenStatusWindow:SetWaza4Pos(80, 158)
    upScreenStatusWindow:Open()
    upScreenStatusWindow:SetMemberId(FUNC_COMMON:SearchDrawPartyNum(0))
    local charaMenu = CreatePokeItemWindow(itemIns, selectItem ~= DungeonMenuSelectItems.SELECT_MENU_ITEM_EQUIP)
    function charaMenu:cancelAction()
      self:Close()
      FlowSys.Stat.itemBagTbl = nil
      FlowSys.Stat.selectFlag = false
      if upScreenStatusWindow ~= nil then
        upScreenStatusWindow:Close()
        CommonSys:EnableLowerMenuNaviAll()
      end
    end
    function charaMenu:decideAction()
      if SYSTEM:IsMultiPlayMode() and FUNC_COMMON:GetMultiMemberChangeNotEquip() then
        self:cancelAction()
      else
        pokemonId = self.curItem.obj
        self:Close()
        FlowSys.Stat.selectFlag = true
        if upScreenStatusWindow ~= nil then
          upScreenStatusWindow:Close()
          if not itemIns:IsWazaMachine() or FUNC_COMMON:GetWazaCountFromStatus(pokemonId) < 4 then
            CommonSys:EnableLowerMenuNaviAll()
          end
        end
      end
    end
    function charaMenu:currentItemChange()
      if SYSTEM:IsMultiPlayMode() and FUNC_COMMON:GetMultiMemberChangeNotEquip() then
        self:cancelAction()
      else
        if self.equipMenu ~= nil then
          self.equipMenu:ClearMessage()
          self.equipMenu:SetMessageId("mess_01", 1028648109)
          self.equipMenu:SetMessageStr("mess_02", FUNC_COMMON:GetEquippedItemName(self.curItem.obj))
        end
        self.partyWindow:SetMemberId(self.curItem.obj)
        if upScreenStatusWindow ~= nil then
          upScreenStatusWindow:SetMemberId(self.curItem.obj)
        end
      end
    end
    CommonSys:OpenBasicMenu("", "")
    charaMenu:Open()
    MENU:SetFocus(charaMenu)
    MENU:WaitClose(charaMenu)
    CommonSys:CloseBasicMenu()
    if not FlowSys.Stat.selectFlag or SYSTEM:IsMultiPlayMode() and FUNC_COMMON:GetMultiMemberChangeNotEquip() then
    elseif itemIns:IsWazaMachine() then
      CommonSys:EndLowerMenuNavi(true)
      SOUND:PlaySe(SymSnd("SE_AT_INVOKE_PLAYER"))
      if CHARA:IsExist("PARTY" .. pokemonId) and CH("PARTY" .. pokemonId):GetVisible() then
        local hEffect = SYSTEM:CreateEffect("CH_INVOKE")
        SYSTEM:SetEffectPosition(hEffect, CH("PARTY" .. pokemonId), BODY_POINT.CENTER)
        SYSTEM:WaitEffect(hEffect)
      end
      local wazaIndex = FUNC_COMMON:GetWazaIndexFromWazamachine(itemIns:GetIndex())
      local forgetWazaIndex, forgetWazaIndexGlobal
      if FUNC_COMMON:GetWazaCountFromStatus(pokemonId) >= 4 then
        forgetWazaIndex = WazaSelectMenuForWazaCountOver(pokemonId, wazaIndex)
        if forgetWazaIndex > -1 and forgetWazaIndex < 4 then
          forgetWazaIndexGlobal = FUNC_COMMON:GetWazaIndex(pokemonId, forgetWazaIndex)
          FUNC_COMMON:ForgetWazaForParty(pokemonId, forgetWazaIndex)
        else
          if SYSTEM:IsDungeon() then
            caption = DUNGEON_MENU:GetDungeonName()
          end
          CommonSys:BeginLowerMenuNavi(caption, true, true)
        end
      end
      if not FUNC_COMMON:UseWazaMachine(useItem, pokemonId) then
        return
      end
      FUNC_COMMON:UpdateWarehouseStatusFromPartyPokemonStatus()
      if forgetWazaIndex then
        if forgetWazaIndex > -1 and forgetWazaIndex < 4 then
          MENU:SetTag_MonsterString(0, FUNC_COMMON:GetCharaName(pokemonId))
          MENU:SetTag_String(1, FUNC_COMMON:GetWazaNameFromWazaIndex(wazaIndex))
          MENU:SetTag_String(0, FUNC_COMMON:GetWazaNameFromWazaIndex(forgetWazaIndexGlobal))
          SOUND:PlayMe(SymSnd("ME_WAZA"))
          WINDOW:SysMsg(683725231)
          WINDOW:CloseMessage()
        end
      else
        MENU:SetTag_MonsterString(0, FUNC_COMMON:GetCharaName(pokemonId))
        MENU:SetTag_String(0, FUNC_COMMON:GetWazaNameFromWazaIndex(wazaIndex))
        SOUND:PlayMe(SymSnd("ME_WAZA"))
        WINDOW:SysMsg(-823369474)
        WINDOW:CloseMessage()
      end
      if SYSTEM:IsDungeon() then
        caption = DUNGEON_MENU:GetDungeonName()
      end
      CommonSys:BeginLowerMenuNavi(caption, true, true)
    end
    FlowSys.Stat.nextFunc = "itemFlow"
  end
  local groundEquipItem = function()
    if SYSTEM:IsMultiPlayMode() then
      FUNC_COMMON:ResetMultiMemberChange()
    end
    local selectItem = FlowSys.Stat.itemBagTbl.selectItem
    local pokemonId = FlowSys.Stat.itemBagTbl.pokemonId
    local useItem = FlowSys.Stat.itemBagTbl.useItem
    local itemIns = FlowSys.Stat.itemBagTbl.itemIns
    local charaMenu = CreatePokeItemWindow(itemIns, selectItem ~= DungeonMenuSelectItems.SELECT_MENU_ITEM_EQUIP)
    function charaMenu:cancelAction()
      self:Close()
      FlowSys.Stat.itemBagTbl = nil
      FlowSys.Stat.selectFlag = false
    end
    function charaMenu:decideAction()
      if SYSTEM:IsMultiPlayMode() and FUNC_COMMON:GetMultiMemberChangeNotEquip() then
        self:cancelAction()
      else
        pokemonId = self.curItem.obj
        self:Close()
        FlowSys.Stat.selectFlag = true
        FUNC_COMMON:EquipmentItem(useItem, pokemonId)
      end
    end
    function charaMenu:currentItemChange()
      if SYSTEM:IsMultiPlayMode() and FUNC_COMMON:GetMultiMemberChangeNotEquip() then
        self:cancelAction()
      else
        if self.equipMenu ~= nil then
          self.equipMenu:ClearMessage()
          self.equipMenu:SetMessageId("mess_01", 1028648109)
          self.equipMenu:SetMessageStr("mess_02", FUNC_COMMON:GetEquippedItemName(self.curItem.obj))
        end
        self.partyWindow:SetMemberId(self.curItem.obj)
      end
    end
    CommonSys:OpenBasicMenu("", "")
    charaMenu:Open()
    MENU:SetFocus(charaMenu)
    MENU:WaitClose(charaMenu)
    CommonSys:CloseBasicMenu()
    FlowSys.Stat.nextFunc = "itemFlow"
  end
  local groundReturnItem = function()
    local useItem = FlowSys.Stat.itemBagTbl.useItem
    FUNC_COMMON:ReturnEquipmentItem(useItem)
    FlowSys.Stat.nextFunc = "itemFlow"
  end
  local groundUseItemWazamachine = function()
    local selectItem = FlowSys.Stat.itemBagTbl.selectItem
    local pokemonId = FlowSys.Stat.itemBagTbl.pokemonId
    local useItem = FlowSys.Stat.itemBagTbl.useItem
    local itemIns = FlowSys.Stat.itemBagTbl.itemIns
    CommonSys:DisableLowerMenuNaviAll()
    MENU:WaitSync()
    GROUND:CallWazamachinePokemonSelect(itemIns:GetIndex(), useItem)
    CommonSys:BeginLowerMenuNavi(caption, true, true)
  end
  local groundDropItem = function()
    local isMultiSelect = FlowSys.Stat.itemBagTbl.isMultiSelect
    local itemInsTbl
    if isMultiSelect then
      itemInsTbl = FlowSys.Stat.itemBagTbl.itemInsTbl
    else
      itemInsTbl = {
        FlowSys.Stat.itemBagTbl.itemIns
      }
    end
    WINDOW:SetMessageScreenMode(ScreenType.B)
    local ret = false
    local itemText = itemInsTbl[1]:GetItemText_forShopTalk()
    local askMenu = MENU:CreateAskMenu()
    askMenu:Setup(true, false, false)
    askMenu:SetLayoutRectAndLines(263, 120, 41, 0)
    function askMenu:cancelAction()
      self:CloseAndClearFocus()
    end
    askMenu:SetDefaultCursorDispIndex(1)
    if isMultiSelect then
      WINDOW:SysMsg(1167654045)
      askMenu:AddItem(1608098041, nil, {
        decideAction = function(self)
          ret = true
          self:CloseAndClearFocus()
        end
      })
      askMenu:AddItem(-1405217858, nil, {
        decideAction = function(self)
          self:CloseAndClearFocus()
        end
      })
    else
      MENU:SetTag_ItemString(0, itemText)
      WINDOW:SysMsg(-2047899600)
      askMenu:AddItem(1608098041, nil, {
        decideAction = function(self)
          ret = true
          self:CloseAndClearFocus()
        end
      })
      askMenu:AddItem(-1405217858, nil, {
        decideAction = function(self)
          self:CloseAndClearFocus()
        end
      })
    end
    WINDOW:SelectSetLuaMenu(askMenu)
    WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    WINDOW:CloseMessage()
    if ret then
      GROUND:DiscardBagItems(itemInsTbl)
      if isMultiSelect then
        WINDOW:SysMsg(-1666791314)
      else
        MENU:SetTag_ItemString(0, itemText)
        WINDOW:SysMsg(1403004059)
      end
      WINDOW:CloseMessage()
    end
    WINDOW:SetMessageScreenMode(ScreenType.A)
    if 0 < FUNC_COMMON:GetBagItemCount() then
      FlowSys:Next("itemFlow")
    else
      FlowSys:Next("groundMenuExit")
    end
  end
  local groundItemMenu = function()
  end
  local function OpenGroundItemMenu()
    GROUND:ReduceBagMoney()
    if GROUND:GetBagItemCount() == 0 then
      CommonSys:EndLowerMenuNavi(true)
      WINDOW:SysMsg(1236059106)
      WINDOW:CloseMessage()
      GroundMenuLowerNaviOn()
      local caption
      if SYSTEM:IsDungeon() then
        caption = DUNGEON_MENU:GetDungeonName()
      end
      FlowSys:Next("groundMenuExit")
      return
    end
    FlowSys.Stat.selectFlag = false
    local itemBagMenu = CreateDungeonItemBagMenu()
    itemBagMenu:SetOption({sortButtonEnable = true})
    FlowSys:SetupMenuEventAction(itemBagMenu)
    CommonSys:OpenBasicMenu("", "", "")
    local index = GROUND:GetResumeCursorIndex(DungeonMenuMenuCursor.MENU_CURSOR_ITEM_ITEM)
    itemBagMenu:Open()
    itemBagMenu:SetCursorItemIndex(index)
    itemBagMenu:currentItemChange()
    itemBagMenu:currentPageGroupChange()
    MENU:SetFocus(itemBagMenu)
    local itemBagMenuClosedAction = itemBagMenu.closedAction
    function itemBagMenu:closedAction()
      if itemBagMenuClosedAction ~= nil then
        itemBagMenuClosedAction(self)
      end
      GROUND:SetResumeCursorIndex(DungeonMenuMenuCursor.MENU_CURSOR_ITEM_ITEM, itemBagMenu:GetCursorItemIndex())
    end
    FlowSys:WaitCloseMenu(itemBagMenu)
    CommonSys:CloseBasicMenu()
    CommonSys:ChangeMenuWait()
    if FlowSys.Stat.itemBagTbl == nil then
      SYSTEM:DebugPrint("FlowSys.Stat.itemBagTbl == nil\n")
      MENU:WaitSync()
      MENU:WaitSync()
      FlowSys:Return()
    elseif FlowSys.Stat.itemBagTbl.selectItem == DungeonMenuSelectItems.SELECT_MENU_ITEM_ORB_USE then
      groundUseItemWazamachine()
      FlowSys:Next("itemFlow")
      return
    elseif FlowSys.Stat.itemBagTbl.selectItem == DungeonMenuSelectItems.SELECT_MENU_ITEM_EQUIP then
      groundEquipItem()
      FlowSys:Next("itemFlow")
      return
    elseif FlowSys.Stat.itemBagTbl.selectItem == DungeonMenuSelectItems.SELECT_MENU_ITEM_RETURN then
      groundReturnItem()
      FlowSys:Next("itemFlow")
      return
    elseif FlowSys.Stat.itemBagTbl.selectItem == DungeonMenuSelectItems.SELECT_MENU_ITEM_PUT then
      groundDropItem()
      FlowSys:Next("itemFlow")
      return
    elseif FlowSys.Stat.itemBagTbl.selectItem == DungeonMenuSelectItems.SELECT_MENU_NON then
      groundMenuItemHelp()
      CommonSys:ChangeMenuWait()
      FlowSys:Next("itemFlow")
      return
    else
      if FlowSys.Stat.itemBagTbl.bSelectPoke then
        groundMenuItemPokemon()
      else
      end
    end
    if FlowSys.Stat.selectFlag then
      CommonSys:EndLowerMenuNavi(true)
      FlowSys:Return()
    else
      FlowSys:Next("groundMenuExit")
    end
  end
  local OpenQuestMenu = function()
    CommonSys:EndLowerMenuNavi(true)
    SCREEN_A:FadeOutAll(TimeSec(4, TIME_TYPE.FRAME), false)
    SCREEN_B:FadeOutAll(TimeSec(4, TIME_TYPE.FRAME), true)
    SCREEN_B:LoadWallpaper("WALLPAPER_SUB_REQUEST01")
    SCREEN_A:FadeInAll(TimeSec(4, TIME_TYPE.FRAME), false)
    SCREEN_B:FadeInAll(TimeSec(4, TIME_TYPE.FRAME), false)
    local bCanOpen = OpenQuestMyListMenu({
      parentMenu = self,
      decideActionFunc = OpenMyListDecideFunc,
      isWallPaper = true,
      bFadeStart = false,
      bFadeEnd = true
    })
    LOWER_SCREEN:ChangeLastWallpaper()
    local caption
    if SYSTEM:IsDungeon() then
      caption = DUNGEON_MENU:GetDungeonName()
    end
    CommonSys:BeginLowerMenuNavi(caption, true, true)
    FlowSys:Next("groundMenuExit")
    return bCanOpen
  end
  function FlowSys.Proc.itemFlow()
    FlowSys.Proc.dungeonMenuItemPokemon = dungeonMenuItemPokemon
    OpenGroundItemMenu()
  end
  function FlowSys.Proc.iraiFlow()
    local bCanOpen = OpenQuestMenu()
    if bCanOpen == true then
      FUNC_COMMON:SetUsedMenuLog(UsedMenuKind.USED_MENU_KIND_COMMON_QUEST)
    end
  end
  function FlowSys.Proc.partyFlow()
    FlowSys.Proc.dungeonMenuTsuyosa = dungeonMenuTsuyosa
    FlowSys.Proc.dungeonMenuTokutyo = dungeonMenuTokutyo
    FlowSys.Proc.dungeonMenuWazaSelect = dungeonMenuWazaSelect
    FlowSys.Proc.dungeonMenuTeamSkill = dungeonMenuTeamSkill
    FlowSys.Proc.dungeonMenuOperation = dungeonMenuOperation
    FlowSys.Proc.dungeonMenuParty = OpenGroundPartyMenu
    OpenGroundPartyMenu()
  end
  function FlowSys.Proc.suspendFlow()
    CommonSys:EndLowerMenuNavi(true)
    if FLAG.ParaMode ~= CONST.PARA_MODE_SCENARIO and FLAG.DunClearRest == CONST.FLAG_TRUE then
      ShopSys:SysMsg(-1611702678)
      WINDOW:CloseMessage()
      FlowSys:Return()
      return
    end
    if SYSTEM:IsMultiPlayMode() then
      ShopSys:SysMsg(-1083693377)
      WINDOW:CloseMessage()
      FlowSys:Return()
      return
    end
    if GROUND:IsEncountField() == true then
      if Dungeon_Save("dungeon", "normal", true) == true then
        SYSTEM:GroundEncountSuspend()
      end
    elseif GROUND:IsStagingPost() == true then
      Ground_SaveNotException("staging_post")
    else
      Ground_SaveNotException("ground")
    end
    FlowSys:Next("groundMenuExit")
  end
  function FlowSys.Proc.otherFlow()
    FlowSys.Proc.dungeonMenuOption = dungeonMenuOption
    FlowSys.Proc.dungeonMenuVWave = dungeonMenuVWave
    FlowSys.Proc.dungeonMenuMessage = dungeonMenuMessage
    FlowSys.Proc.dungeonMenuWorldMap = dungeonMenuWorldMap
    FlowSys.Proc.dungeonMenuPlayHint = dungeonMenuPlayHint
    FlowSys.Proc.dungeonMenuTutorialHint = dungeonMenuTutorialHint
    FlowSys.Proc.dungeonMenuOthers = dungeonMenuOthers
    FlowSys.Proc.bossAccess = bossAccess
    dungeonMenuOthers()
  end
  function FlowSys.Proc.groundMenuGotoStart()
    CommonSys:EndLowerMenuNavi(true)
    SCREEN_A:FadeOut(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    SYSTEM:GoToMapStartEntry()
    FlowSys:Next("groundMenuExit")
  end
  function FlowSys.Proc.materialFlow()
    FUNC_COMMON:SetUsedMenuLog(UsedMenuKind.USED_MENU_KIND_GROUND_MATERIAL)
    OpenGroundMaterialList()
    FlowSys:Next("groundMenuExit")
  end
  function FlowSys.Proc.paradiseModeFlow()
    CommonSys:EndLowerMenuNavi(true)
    if SYSTEM:IsMultiPlayMode() then
      ShopSys:SysMsg(1666314723)
      WINDOW:CloseMessage()
      FlowSys:Return()
      return
    end
    if FLAG.ParaMode ~= CONST.PARA_MODE_SCENARIO and FLAG.DunClearRest == CONST.FLAG_TRUE then
      ShopSys:SysMsg(322979706)
      WINDOW:CloseMessage()
      FlowSys:Return()
      return
    end
    if FLAG.ParaMode == CONST.PARA_MODE_SCENARIO and FLAG.DunClearRest == CONST.FLAG_TRUE and QUEST:IsCurrentQuestInfo() then
      ShopSys:SysMsg(-1069970653)
      WINDOW:CloseMessage()
      FlowSys:Return()
      return
    end
    if FLAG.ParaMode == CONST.PARA_MODE_SCENARIO then
      if OpenGroundToParadiseFlow() then
        FlowSys:Next("changeAndGoParadiseMode")
      else
        FlowSys:Next("groundMenuExit")
      end
    elseif OpenReturnParadiseMenu() then
      FlowSys:Next("changeAndGoParadiseMode")
    else
      FlowSys:Next("groundMenuExit")
    end
  end
  function FlowSys.Proc.multiFlow()
    FUNC_COMMON:SetUsedMenuLog(UsedMenuKind.USED_MENU_KIND_GROUND_LOCAL)
    if FLAG.ParaMode == CONST.PARA_MODE_SCENARIO then
      CommonSys:EndLowerMenuNavi(true)
      WINDOW:SysMsg(-495784387)
      WINDOW:CloseMessage()
      FlowSys:Next("groundMenuExit")
      return
    end
    if FLAG.ParaMode ~= CONST.PARA_MODE_SCENARIO and FLAG.DunClearRest == CONST.FLAG_TRUE then
      CommonSys:EndLowerMenuNavi(true)
      WINDOW:SysMsg(-2114772163)
      WINDOW:CloseMessage()
      FlowSys:Next("groundMenuExit")
      return
    end
    CommonSys:EndLowerMenuNavi(true)
    local resumeData = FlowSys:Suspend()
    OpenFriendGateMenu()
    FlowSys:Resume(resumeData)
    CommonSys:BeginLowerMenuNavi(nil, true, true)
    FlowSys:Next("groundMenuExit")
  end
  function FlowSys.Proc.changeAndGoParadiseMode()
    SYSTEM:NextEntryAndChangeParadiseMode(false)
    FlowSys:Return()
  end
  function FlowSys.Proc.debugFlow()
    local resumeData = FlowSys:Suspend()
    OpenGroundDebugMenu()
    FlowSys:Resume(resumeData)
    FlowSys:Next("groundMenuExit")
  end
  function FlowSys.Proc.debugSwitchFlow()
    local resumeData = FlowSys:Suspend()
    OpenDebugSwitchMenu()
    FlowSys:Resume(resumeData)
    FlowSys:Next("groundMenuExit")
  end
  function FlowSys.Proc.groundMenuExit()
    FlowSys:Return()
  end
  SOUND:PlaySe(SymSnd("SE_SYS_WINDOW"))
  if flowSymbol == "itemFlow" then
    DUNGEON_MENU:BeginSealEquipMenu()
    FlowSys:Call("itemFlow")
    DUNGEON_MENU:EndSealEquipMenu()
  elseif flowSymbol == "partyFlow" then
    FlowSys:Call("partyFlow")
  elseif flowSymbol == "otherFlow" then
    FlowSys:Call("otherFlow")
  elseif flowSymbol == "save" then
    FlowSys:Call("suspendFlow")
  elseif flowSymbol == "debugFlow" then
    FlowSys:Call("debugFlow")
  elseif flowSymbol == "debugSwitchFlow" then
    FlowSys:Call("debugSwitchFlow")
  end
  FlowSys:Finish()
end
function GroundMenuLowerNaviOn()
  if CommonSys:IsOpenLowerMenuNavi() == false and SYSTEM:IsGround() then
    if SYSTEM:IsPerippaaMode() then
      local textPerippaa = "" .. MENU:ReplaceTagText(608981373)
      CommonSys:BeginLowerMenuNavi(textPerippaa, true, true)
    elseif GROUND:IsWorldContinentDraw() then
      CommonSys:BeginLowerMenuNavi_GroundItem(GROUND:GetWorldContinentName(), GROUND:GetWorldPlaceName(), true, true)
    else
      CommonSys:BeginLowerMenuNavi(GROUND:GetWorldPlaceName(), true, true)
    end
  end
end
function GroundMenuLowerNaviOff()
  CommonSys:EndLowerMenuNavi(true)
end

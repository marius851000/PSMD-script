local debugSyllabaryHashTbl = {
  1287230516,
  -2074075588,
  1645691745,
  685068592,
  -767903302,
  587494480,
  -337772968,
  229286661,
  1198043476,
  -1115203106,
  -1230435552,
  2121302312,
  -1744315275,
  -758788572,
  673851054,
  729691033,
  -475547247,
  97576140,
  1326642845,
  -1241702889,
  349865058,
  -603779478,
  980702007,
  1890992486,
  -1973835284,
  833739710,
  -110603850,
  522128619,
  1440554682,
  -1355614672,
  107948940,
  -826891900,
  683801817,
  1644424840,
  -1729362430,
  -652940476,
  -138789871,
  1201129162,
  236284997,
  -959650227,
  549174032,
  1786358081,
  -1869200949,
  969645175,
  -1488408071,
  -1824352083
}
local SetWazaViewerMenuNoParam = function()
  DUNGEON_MENU:SetSelectMenuParam(DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON)
end
WAZA_VIEWER_MENU._dummyResumeCursorTbl = {}
function WAZA_VIEWER_MENU:GetResumeCursorIndex(name)
  local curIdx = self._dummyResumeCursorTbl[name]
  if curIdx ~= nil then
    return curIdx
  end
  return 0
end
function WAZA_VIEWER_MENU:SetResumeCursorIndex(name, curIdx)
  self._dummyResumeCursorTbl[name] = curIdx
end
DUNGEON_DEBUG__2._dummyResumeCursorTbl2 = {}
function DUNGEON_DEBUG__2:GetResumeCursorIndex2(name)
  local curIdx = self._dummyResumeCursorTbl2[name]
  if curIdx ~= nil then
    return curIdx
  end
  return 0
end
function DUNGEON_DEBUG__2:SetResumeCursorIndex2(name, curIdx)
  self._dummyResumeCursorTbl2[name] = curIdx
end
function SetDungeonMenuParam()
end
local frameCount = 0
local suppeleTbl = {}
function OpenWazaViewerMenu()
  FlowSys:Start()
  ShopSys:Start()
  function FlowSys.Proc.WazaViewerMenuWaza()
    FlowSys.Stat.returnFlag = false
    FlowSys.Stat.nextFunc = nil
    local menu = MENU:CreateWazaViewerParameterMenu()
    local wazaAttackTbl, wazaSelectTbl, wazaPartySelectTbl, loopTbl, stopTbl = {}, {}, {}, {}, {}
    local effectTbl, pokeSelectTbl, debugMenuTbl, itemMenuTbl = {}, {}, {}, {}
    local enemySelectTbl, endTbl, debugBGTbl, statusTbl = {}, {}, {}, {}
    local bossMapTbl, returnMapTbl = {}, {}
    local id = 0
    local wazaIndex = 0
    NestMenu_SetupDefaultAction(menu, self)
    menu:SetLayoutRectAndLines(8, 8, 0, 0)
    menu:SetFooter(false)
    menu:AddItemS(918293275, ValueParamStr(0, 0, 0, 1, 10, 100, false), "attack", wazaAttackTbl)
    local wazaNumTbl = DUNGEON_DEBUG__2:GetWazaNumericalArray()
    local indexTbl = {}
    for i = 1, wazaNumTbl.hashArray:size() do
      indexTbl[i] = {
        hash = wazaNumTbl.hashArray[i - 1]
      }
    end
    for i = 1, wazaNumTbl.idArray:size() do
      indexTbl[i].id = wazaNumTbl.idArray[i - 1]
    end
    for i = 1, table.maxn(indexTbl) do
      MENU:SetTag_Value(0, indexTbl[i].id)
      local text = MENU:ReplaceTagText("[value_s_b:0:3]")
      local index = indexTbl[i].id
      menu:AddSelectString(text .. ":" .. MENU:GetTextPoolText(indexTbl[i].hash), indexTbl[i].id)
    end
    local id = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_USE) + 1
    WAZA_VIEWER_MENU:SetWaza(indexTbl[id].id)
    MENU:SetTag_Value(0, indexTbl[id].id)
    local text = MENU:ReplaceTagText("[value_s_b:0:3]")
    menu:SetSelectStringIndex(text .. ":" .. MENU:GetTextPoolText(indexTbl[id].hash))
    menu:AddItem(441215229, "waza", wazaSelectTbl)
    menu:AddItem(-1187637960, "party_waza", wazaPartySelectTbl)
    menu:AddItemS(-101917111, ValueParamStr(0, 0, 0, 1, 1, 1, false), "loop", loopTbl)
    menu:AddSelectString(-1358471895, true)
    menu:AddSelectString(1943195446, false)
    id = 1943195446
    menu:SetSelectStringIndex(id)
    menu:AddItemS(895881110, ValueParamStr(0, 0, 0, 1, 1, 1, false), "stop", stopTbl)
    menu:AddSelectString(-1358471895)
    menu:AddSelectString(1943195446)
    id = 1943195446
    if WAZA_VIEWER_MENU:GetStop() then
      id = -1358471895
    end
    menu:SetSelectStringIndex(id)
    menu:AddItem(-648598816, "poke", pokeSelectTbl)
    menu:AddItem(1280686361, "enemy", enemySelectTbl)
    menu:AddItem(-1008441662, "debug", debugMenuTbl)
    menu:AddItem(-642372918, "bg", debugBGTbl)
    menu:AddItem(98184113, "status", statusTbl)
    menu:AddItem(-388308893, "boss_map", bossMapTbl)
    menu:AddItem(-1179048102, "return_map", returnMapTbl)
    menu:AddItem(497303278, "end", endTbl)
    if WAZA_VIEWER_MENU:GetMapType() ~= WazaViewerMenuMenuCursor.MAP_TYPE_NORMAL then
      menu:SetCursorItemIndex(8)
      menu:SetCurrentModifyItem(8)
      menu.curItem.grayed = true
    else
      menu:SetCursorItemIndex(11)
      menu:SetCurrentModifyItem(11)
      menu.curItem.grayed = true
    end
    function menu:autoDecideAction()
      WAZA_VIEWER_MENU:AttackAtWaza()
    end
    function wazaAttackTbl:decideAction()
      WAZA_VIEWER_MENU:AttackAtWaza()
    end
    function wazaAttackTbl:currentItemValueChange()
      WAZA_VIEWER_MENU:SetWaza(self.curItem.selectValueObj)
      WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_USE, self.curItem.selectValueObj - 1)
    end
    local parentMenu = menu
    function wazaSelectTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption("")
      menu:SetLayoutRectAndLines(self:GetLeft() + 112, 80, 56, 5)
      DUNGEON_DEBUG__2:InitWazaSyllabaryMap()
      for i = 1, table.maxn(debugSyllabaryHashTbl) do
        menu:AddItem(debugSyllabaryHashTbl[i], i - 1, nil)
      end
      function menu:itemPreOpenModifyAction()
        if not DUNGEON_DEBUG__2:IsWazaSyllabaryValid(self.curItem.obj) then
          self.curItem.grayed = true
        end
      end
      function menu:decideAction()
        local menu = MENU:CreatePageMenu()
        NestMenu_SetupDefaultAction(menu, self)
        menu:SetCaption(441215229)
        menu:SetLayoutRectAndLines(self:GetRight() + 16, 32, 0, 0)
        local wazaNameTbl = DUNGEON_DEBUG__2:GetWazaSyllabaryArray(self.curItem.obj)
        local indexTbl = {}
        for i = 1, wazaNameTbl.hashArray:size() do
          indexTbl[i] = {
            hash = wazaNameTbl.hashArray[i - 1]
          }
        end
        for i = 1, wazaNameTbl.idArray:size() do
          indexTbl[i].id = wazaNameTbl.idArray[i - 1]
        end
        for i = 1, table.maxn(indexTbl) do
          MENU:SetTag_Value(0, indexTbl[i].id)
          local text = MENU:ReplaceTagText("[value_s_b:0:3]")
          menu:AddItem(text .. ":" .. MENU:GetTextPoolText(indexTbl[i].hash), indexTbl[i].id, nil)
        end
        menu:AddItem(1007389591, nil, {
          decideAction = function(self)
            self:Close()
          end
        })
        function menu:decideAction()
          WAZA_VIEWER_MENU:SetWaza(self.curItem.obj)
          parentMenu:SetCurrentModifyItem(0)
          parentMenu.curItem.value = self.curItem.obj - 1
          parentMenu:SetCurrentModifyItem(1)
          WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_USE, self.curItem.obj - 1)
          self:Close()
        end
        local index = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_NAME)
        menu:Open()
        menu:SetCursorItemIndex(index)
        menu:SetCurrentModifyItem(index)
        MENU:SetFocus(menu)
        MENU:WaitClose(menu)
        WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_NAME, menu:GetCursorItemIndex())
        if menu:IsResult() and menu.curItem.obj ~= nil then
          self:Close()
        end
      end
      local index = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_INITIAL)
      menu:Open()
      menu:SetCursorItemIndex(index)
      menu:SetCurrentModifyItem(index)
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_INITIAL, menu:GetCursorItemIndex())
    end
    function wazaPartySelectTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption("")
      menu:SetLayoutRectAndLines(self:GetLeft() + 112, 80, 56, 5)
      DUNGEON_DEBUG__2:InitWazaSyllabaryMap()
      for i = 1, table.maxn(debugSyllabaryHashTbl) do
        menu:AddItem(debugSyllabaryHashTbl[i], i - 1, nil)
      end
      function menu:itemPreOpenModifyAction()
        if not DUNGEON_DEBUG__2:IsWazaSyllabaryValid(self.curItem.obj) then
          self.curItem.grayed = true
        end
      end
      function menu:decideAction()
        local menu = MENU:CreatePageMenu()
        NestMenu_SetupDefaultAction(menu, self)
        menu:SetCaption(441215229)
        menu:SetLayoutRectAndLines(self:GetRight() + 16, 32, 0, 0)
        local wazaNameTbl = DUNGEON_DEBUG__2:GetWazaSyllabaryArray(self.curItem.obj)
        local indexTbl = {}
        for i = 1, wazaNameTbl.hashArray:size() do
          indexTbl[i] = {
            hash = wazaNameTbl.hashArray[i - 1]
          }
        end
        for i = 1, wazaNameTbl.idArray:size() do
          indexTbl[i].id = wazaNameTbl.idArray[i - 1]
        end
        for i = 1, table.maxn(indexTbl) do
          MENU:SetTag_Value(0, indexTbl[i].id)
          local text = MENU:ReplaceTagText("[value_s_b:0:3]")
          menu:AddItem(text .. ":" .. MENU:GetTextPoolText(indexTbl[i].hash), indexTbl[i].id, nil)
        end
        menu:AddItem(1007389591, nil, {
          decideAction = function(self)
            self:Close()
          end
        })
        function menu:decideAction()
          WAZA_VIEWER_MENU:SetPartyWaza(self.curItem.obj)
          WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_PARTY, self.curItem.obj - 1)
          self:Close()
        end
        local index = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_PARTY)
        menu:Open()
        menu:SetCursorItemIndex(index)
        menu:SetCurrentModifyItem(index)
        MENU:SetFocus(menu)
        MENU:WaitClose(menu)
        WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_WAZA_PARTY, menu:GetCursorItemIndex())
        if menu:IsResult() and menu.curItem.obj ~= nil then
          self:Close()
        end
      end
      local index = 0
      menu:Open()
      menu:SetCursorItemIndex(index)
      menu:SetCurrentModifyItem(index)
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
    end
    function pokeSelectTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption("")
      menu:SetLayoutRectAndLines(self:GetLeft() + 112, 80, 56, 5)
      DUNGEON_DEBUG:InitPokeSyllabaryMap()
      for i = 1, table.maxn(debugSyllabaryHashTbl) do
        menu:AddItem(debugSyllabaryHashTbl[i], i - 1, nil)
      end
      function menu:itemPreOpenModifyAction()
        if not DUNGEON_DEBUG:IsPokeSyllabaryValid(self.curItem.obj) then
          self.curItem.grayed = true
        end
      end
      function menu:decideAction()
        local menu = MENU:CreatePageMenu()
        NestMenu_SetupDefaultAction(menu, self, true)
        menu:SetCaption(self.curItem.text)
        menu:SetLayoutRectAndLines(self:GetLeft(), self:GetTop(), 0, 0)
        local pokeNameTbl = DUNGEON_DEBUG:GetPokeSyllabaryArray(self.curItem.obj)
        local indexTbl = {}
        for i = 1, pokeNameTbl.hashArray:size() do
          indexTbl[i] = {
            hash = pokeNameTbl.hashArray[i - 1]
          }
        end
        for i = 1, pokeNameTbl.idArray:size() do
          indexTbl[i].id = pokeNameTbl.idArray[i - 1]
        end
        for i = 1, table.maxn(indexTbl) do
          MENU:SetTag_Value(0, indexTbl[i].id)
          local text = MENU:ReplaceTagText("[value_s_b:0:3]")
          local supplement = ""
          for n, m in ipairs(suppeleTbl) do
            if indexTbl[i].id == m.id then
              supplement = MENU:GetTextPoolText(m.text)
            end
          end
          menu:AddItem(text .. ":" .. MENU:GetTextPoolText(indexTbl[i].hash) .. supplement, indexTbl[i].id, nil)
        end
        menu:AddItem(1007389591, nil, {
          decideAction = function(self)
            self:Close()
          end
        })
        function menu:decideAction()
          WAZA_VIEWER_MENU:ReplacePlayer(self.curItem.obj)
          FlowSys.Stat.returnFlag = true
          self:Close()
        end
        local index = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_POKE_NAME)
        menu:Open()
        menu:SetCursorItemIndex(index)
        menu:SetCurrentModifyItem(index)
        MENU:SetFocus(menu)
        MENU:WaitClose(menu)
        WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_POKE_NAME, menu:GetCursorItemIndex())
        if menu:IsResult() and menu.curItem.obj ~= nil then
          self:Close()
        end
      end
      local index = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_POKE_INITIAL)
      menu:Open()
      menu:SetCursorItemIndex(index)
      menu:SetCurrentModifyItem(index)
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_POKE_INITIAL, menu:GetCursorItemIndex())
      if menu:IsResult() then
        self:Close()
      end
    end
    function enemySelectTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption("")
      menu:SetLayoutRectAndLines(self:GetLeft() + 112, 80, 56, 5)
      DUNGEON_DEBUG:InitPokeSyllabaryMap()
      for i = 1, table.maxn(debugSyllabaryHashTbl) do
        menu:AddItem(debugSyllabaryHashTbl[i], i - 1, nil)
      end
      function menu:itemPreOpenModifyAction()
        if not DUNGEON_DEBUG:IsPokeSyllabaryValid(self.curItem.obj) then
          self.curItem.grayed = true
        end
      end
      function menu:decideAction()
        local menu = MENU:CreatePageMenu()
        NestMenu_SetupDefaultAction(menu, self, true)
        menu:SetCaption(self.curItem.text)
        menu:SetLayoutRectAndLines(self:GetLeft(), self:GetTop(), 0, 0)
        local pokeNameTbl = DUNGEON_DEBUG:GetPokeSyllabaryArray(self.curItem.obj)
        local indexTbl = {}
        for i = 1, pokeNameTbl.hashArray:size() do
          indexTbl[i] = {
            hash = pokeNameTbl.hashArray[i - 1]
          }
        end
        for i = 1, pokeNameTbl.idArray:size() do
          indexTbl[i].id = pokeNameTbl.idArray[i - 1]
        end
        for i = 1, table.maxn(indexTbl) do
          MENU:SetTag_Value(0, indexTbl[i].id)
          local text = MENU:ReplaceTagText("[value_s_b:0:3]")
          local supplement = ""
          for n, m in ipairs(suppeleTbl) do
            if indexTbl[i].id == m.id then
              supplement = MENU:GetTextPoolText(m.text)
            end
          end
          menu:AddItem(text .. ":" .. MENU:GetTextPoolText(indexTbl[i].hash) .. supplement, indexTbl[i].id, nil)
        end
        menu:AddItem(1007389591, nil, {
          decideAction = function(self)
            self:Close()
          end
        })
        function menu:decideAction()
          WAZA_VIEWER_MENU:ReplaceEnemy(self.curItem.obj)
          FlowSys.Stat.returnFlag = true
          self:Close()
        end
        local index = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_ENEMY_NAME)
        menu:Open()
        menu:SetCursorItemIndex(index)
        menu:SetCurrentModifyItem(index)
        MENU:SetFocus(menu)
        MENU:WaitClose(menu)
        WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_ENEMY_NAME, menu:GetCursorItemIndex())
        if menu:IsResult() and menu.curItem.obj ~= nil then
          self:Close()
        end
      end
      local index = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_ENEMY_INITIAL)
      menu:Open()
      menu:SetCursorItemIndex(index)
      menu:SetCurrentModifyItem(index)
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_ENEMY_INITIAL, menu:GetCursorItemIndex())
      if menu:IsResult() then
        self:Close()
      end
    end
    function loopTbl:currentItemValueChange()
      self:SetAutoDecide(self.curItem.selectValueObj)
    end
    function debugMenuTbl:decideAction()
      FlowSys.Stat.nextFunc = "WazaViewerMenuDebug"
      self:Close()
    end
    function itemMenuTbl:decideAction()
      FlowSys.Stat.nextFunc = "WazaViewerMenuItem"
      self:Close()
    end
    function stopTbl:decideAction()
      WAZA_VIEWER_MENU:SetSlowMotion()
      menu:SetCurrentModifyItem(4)
      menu.curItem.value = 0
    end
    function effectTbl:decideAction()
    end
    function debugBGTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(self:GetLeft() + 120, 80, 0, 0)
      for i = 0, DUNGEON_DEBUG__2:GetRandomMapBGNum() - 1 do
        menu:AddItem(DUNGEON_DEBUG__2:GetRandomMapBGName(i), i, nil)
      end
      menu:AddItem(1007389591, nil, {
        decideAction = function(self)
          self:Close()
        end
      })
      function menu:decideAction()
        DUNGEON_MENU:SetSelectMenuParam(DungeonMenuSelectItems.SELECT_DEBUG_MAP_BG_CHANGE, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON)
        DUNGEON_MENU:SetDebugBGChange(self.curItem.obj)
        DUNGEON_MENU:SetDebugTurnFlg(true)
        self:Close()
      end
      local index = DUNGEON_DEBUG__2:GetResumeCursorIndex2(WazaViewerMenuMenuCursor.MENU_CURSOR_MAP_BG)
      menu:Open()
      menu:SetCursorItemIndex(index)
      menu:SetCurrentModifyItem(index)
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      DUNGEON_DEBUG__2:SetResumeCursorIndex2(WazaViewerMenuMenuCursor.MENU_CURSOR_MAP_BG, menu:GetCursorItemIndex())
      if menu:IsResult() and menu.curItem.obj ~= nil then
        self:Close()
      end
    end
    function statusTbl:decideAction()
      WAZA_VIEWER_MENU:AllRecreateChara()
      self:Close()
    end
    function bossMapTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(self:GetLeft() + 120, 80, 0, 0)
      for i = WazaViewerMenuMenuCursor.MAP_TYPE_DB01_EV_PARTSMAP_502, WazaViewerMenuMenuCursor.MAP_TYPE_MAX - 1 do
        menu:AddItem(WAZA_VIEWER_MENU:GetMapName(i), i, nil)
      end
      menu:AddItem(1007389591, nil, {
        decideAction = function(self)
          self:Close()
        end
      })
      function menu:decideAction()
        DUNGEON_MENU:SetSelectMenuParam(DungeonMenuSelectItems.SELECT_DEBUG_WAZA_VIEWER_MAP_CHANGE, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON)
        DUNGEON_MENU:SetDebugTurnFlg(true)
        WAZA_VIEWER_MENU:SetMapType(self.curItem.obj)
        self:Close()
      end
      menu:Open()
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      if menu:IsResult() and menu.curItem.obj ~= nil then
        self:Close()
      end
    end
    function returnMapTbl:decideAction()
      DUNGEON_MENU:SetSelectMenuParam(DungeonMenuSelectItems.SELECT_DEBUG_WAZA_VIEWER_MAP_CHANGE, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON)
      DUNGEON_MENU:SetDebugTurnFlg(true)
      WAZA_VIEWER_MENU:SetMapType(WazaViewerMenuMenuCursor.MAP_TYPE_NORMAL)
      self:Close()
    end
    function endTbl:decideAction()
      WAZA_VIEWER_MENU:WazaViewerExit()
      DUNGEON_MENU:SetSelectMenuParam(DungeonMenuSelectItems.SELECT_DEBUG_WAZA_VIEWER_EXIT, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON, DungeonMenuSelectItems.SELECT_MENU_NON)
      self:Close()
    end
    function menu:currentItemValueChange()
      if self.curItem.obj == "loop" then
        WAZA_VIEWER_MENU:SetWazaLoop(not WAZA_VIEWER_MENU:GetWazaLoop())
      elseif self.curItem.obj == "stop" then
        WAZA_VIEWER_MENU:SetStop(not WAZA_VIEWER_MENU:GetStop())
      end
    end
    function menu:preUpdate()
      if WAZA_VIEWER_MENU:GetWazaLoop() then
        WAZA_VIEWER_MENU:AttackAtWaza()
      end
    end
    function menu:cancelAction()
      FlowSys.Stat.returnFlag = true
      self:Close()
    end
    DUNGEON_DEBUG:ShowAllMap()
    local index = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_MAIN)
    menu:Open()
    menu:SetCursorItemIndex(index)
    menu:SetCurrentModifyItem(index)
    MENU:SetFocus(menu)
    FlowSys:WaitCloseMenu(menu)
    WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_MAIN, menu:GetCursorItemIndex())
    WAZA_VIEWER_MENU:SetStop(false)
    if FlowSys.Stat.nextFunc then
      FlowSys:Next(FlowSys.Stat.nextFunc)
    else
      FlowSys:Return()
    end
  end
  function FlowSys.Proc.WazaViewerMenuItem()
    if FUNC_COMMON:GetBagItemCount() == 0 and not FUNC_COMMON:IsFootItemExist() then
      WINDOW:SysMsg(12076874)
      WINDOW:CloseMessage()
      FlowSys:Next("WazaViewerMenuWaza")
      return
    end
    FlowSys.Stat.selectFlag = false
    local itemBagMenu = CreateDungeonItemBagMenu()
    FlowSys:SetupMenuEventAction(itemBagMenu)
    CommonSys:OpenBasicMenu("", "", "")
    local index = WAZA_VIEWER_MENU:GetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_ITEM_ITEM)
    itemBagMenu:Open()
    itemBagMenu:SetCursorItemIndex(index)
    itemBagMenu:SetCurrentModifyItem(index)
    MENU:SetFocus(itemBagMenu)
    FlowSys:WaitCloseMenu(itemBagMenu)
    WAZA_VIEWER_MENU:SetResumeCursorIndex(WazaViewerMenuMenuCursor.MENU_CURSOR_ITEM_ITEM, itemBagMenu:GetCursorItemIndex())
    CommonSys:CloseBasicMenu()
    if FlowSys.Stat.selectFlag then
      FlowSys:Return()
    else
      FlowSys:Next("WazaViewerMenuWaza")
    end
  end
  function FlowSys.Proc.WazaViewerMenuDebug()
    collectgarbage("collect")
    SetWazaViewerMenuNoParam()
    if OpenDungeonDebugMenu() then
      FlowSys:Return()
    else
      collectgarbage("collect")
      FlowSys:Next("WazaViewerMenuWaza")
    end
  end
  FlowSys:Call("WazaViewerMenuWaza")
  FlowSys:Finish()
  ShopSys:Finish()
end

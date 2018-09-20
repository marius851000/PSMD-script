dofile("script/include/debug/inc_debug_menu_action.lua")
function groundDebugMenu_PopupResult(self, text)
  FUNC_COMMON:NoticeSimpleRequest(text, 1)
  TASK:Sleep(TimeSec(0))
end
function OpenDebugSwitchMenu()
  local bChange = {false}
  local changeCnt = 0
  local getValue = {}
  getValue[1] = FUNC_COMMON:GetDebugSoundSwitch()
  getValue[2] = FUNC_COMMON:GetDebugQROutCameraSwitch()
  getValue[3] = FUNC_COMMON:GetDebugOPOutCameraSwitch()
  local SetFuncTbl = {
    FUNC_COMMON.SetDebugSoundSwitch,
    FUNC_COMMON.SetDebugQROutCameraSwitch,
    FUNC_COMMON.SetDebugOPOutCameraSwitch
  }
  local menu = MENU:CreateParameterMenu()
  local soundVolumeSwitchTbl = {}
  local qrOutCameraVolumeSwitchTbl = {}
  local opOutCameraVolumeSwitchTbl = {}
  menu:SetMela("mela/common/common_option_list.bml")
  menu:SetLayoutRectAndLines(16, 32, 288, 0)
  menu:AddItemS(-320932396, 1, soundVolumeSwitchTbl)
  menu:AddSelectString(2121749441, 0)
  menu:AddSelectString(-1902160101, 1)
  menu:SetSelectStringIndexObj(getValue[1])
  menu:AddItemS(-786347104, 2, qrOutCameraVolumeSwitchTbl)
  menu:AddSelectString(-1689112659, 0)
  menu:AddSelectString(1802616577, 1)
  menu:AddSelectString(1079831746, 2)
  menu:AddSelectString(1497881987, 3)
  menu:AddSelectString(369511236, 4)
  menu:AddSelectString(253590021, 5)
  menu:AddSelectString(607136198, 6)
  menu:AddSelectString(1026234503, 7)
  menu:SetSelectStringIndexObj(getValue[2])
  menu:AddItemS(-113079669, 3, qrOutCameraVolumeSwitchTbl)
  menu:AddSelectString(720755875, 0)
  menu:AddSelectString(1628220559, 1)
  menu:AddSelectString(1243742028, 2)
  menu:AddSelectString(1396362765, 3)
  menu:AddSelectString(477845706, 4)
  menu:SetSelectStringIndexObj(getValue[2])
  function menu:currentItemValueChange()
    local index = self.curItem.obj
    if getValue[index] ~= self.curItem.value then
      if not bChange[index] then
        changeCnt = changeCnt + 1
        bChange[index] = true
      end
    elseif bChange[index] then
      changeCnt = changeCnt - 1
      bChange[index] = false
    end
    SetFuncTbl[index](FUNC_COMMON, self.curItem.selectValueObj)
  end
  function menu:currentItemChange()
  end
  function menu:decideAction()
    self:Close()
  end
  function menu:cancelAction()
    self:Close()
  end
  menu:Open()
  menu:SetPageIconPos(136, 256)
  MENU:SetFocus(menu)
  FlowSys:WaitCloseMenu(menu)
end
function OpenInterruptGroundDebugMenu()
  OpenGroundDebugMenu()
end
function OpenGroundDebugMenu()
  OpenGroundDebugMenuCore("ground")
end
function OpenGroundDebugMenuForTopMenu()
  OpenGroundDebugMenuCore("set_top_debug")
end
function OpenGroundDebugMenuCore(setType)
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/menu_ground.bin")
  local menu = MENU:CreatePageMenu()
  local debugCameraActionTbl = {}
  local pokemonWarehouseActionTbl = {}
  local itemAndMoneyActionTbl = {}
  local heroPartnerChangeActionTbl = {}
  local heroPartnerGenderChangeActionTbl = {}
  local partyChangeActionTbl = {}
  local parameterActionTbl = {}
  local placeCaptureActionTbl = {}
  local shopTestActionTbl = {}
  local forScriptActionTbl = {}
  local toTopMenuActionTbl = {}
  local otherMenuActionTbl = {}
  local wazaTestActionTbl = {}
  local multiMenuActionTbl = {}
  local soundTestActionTbl = {}
  local shopDebugMenuActionTbl = {}
  local shopDebug2MenuActionTbl = {}
  local questTestActionTbl = {}
  local dungeonDiverTestActionTbl = {}
  local cecTestActionTbl = {}
  local paradiseMenuActionTbl = {}
  local dungeonEnterActionTbl = {}
  local dlcListActionTbl = {}
  local setAlphaMenuAction = function(menu)
    function menu:enterFocusAction()
      self:SetFrameAlpha(255)
      self:SetTextAlpha(255)
    end
    function menu:leaveFocusAction()
      self:SetFrameAlpha(170)
      self:SetTextAlpha(170)
    end
  end
  setAlphaMenuAction(menu)
  local secondMenuLeft = 128
  NestMenu_SetupDefaultAction(menu, nil)
  menu:SetCaption(-402870234)
  menu:SetLayoutRectAndLines(20, 40, 0, 0)
  if setType == "ground" then
    menu:AddItem(-980758626, nil, debugCameraActionTbl)
    menu:AddItem(-559436234, nil, pokemonWarehouseActionTbl)
    menu:AddItem(-2036776272, nil, itemAndMoneyActionTbl)
    menu:AddItem(-820931116, nil, heroPartnerChangeActionTbl)
    menu:AddItem(-512620768, nil, partyChangeActionTbl)
    menu:AddItem(1651928027, nil, parameterActionTbl)
    menu:AddItem(-1278556949, nil, placeCaptureActionTbl)
    menu:AddItem(-495847474, nil, forScriptActionTbl)
    menu:AddItem(196777147, nil, otherMenuActionTbl)
    menu:AddItem(239625508, nil, paradiseMenuActionTbl)
    menu:AddItem(-1170507346, nil, shopTestActionTbl)
    menu:AddItem(-1339810230, nil, shopDebugMenuActionTbl)
    menu:AddItem(-1444609718, nil, soundTestActionTbl)
    menu:AddItem(-1425251556, nil, questTestActionTbl)
    menu:AddItem(904170038, nil, cecTestActionTbl)
    menu:AddItem(1890846613, nil, {
      decideAction = function(self)
        MenuScriptReloadFunc()
        groundDebugMenu_PopupResult(self, "\227\130\138\227\130\141\227\131\188\227\129\169\227\129\151\227\129\190\227\129\151\227\129\159")
        self:Close()
      end
    })
    menu:AddItem(1696430949, nil, {
      decideAction = function(self)
        MENU:DebugReloadGlobalGameSetting()
        groundDebugMenu_PopupResult(self, "\227\130\138\227\130\141\227\131\188\227\129\169\227\129\151\227\129\190\227\129\151\227\129\159")
        self:Close()
      end
    })
    menu:AddItem(1784741244, nil, dungeonEnterActionTbl)
    menu:AddItem(-1522381045, nil, dlcListActionTbl)
    menu:AddItem(-1613266624, nil, toTopMenuActionTbl)
    menu:AddItem(1470539907, nil, {
      decideAction = function(self)
        self:Close()
      end
    })
  else
    if setType == "set_top_debug" then
      menu:AddItem(-820931116, nil, heroPartnerChangeActionTbl)
      menu:AddItem(640278598, nil, heroPartnerGenderChangeActionTbl)
    else
    end
  end
  function debugCameraActionTbl:decideAction()
    local camBoard = MENU:CreateBoardMenuWindow(ScreenType.B)
    camBoard:SetLayoutRect(Rectangle(238, 18, 82, 8))
    camBoard:SetTextOffset(4, -6)
    camBoard:SetText(126345774)
    camBoard:Open()
    self:SetVisible(false)
    GROUND_DEBUG:ExecDebugCameraMode()
    self:SetVisible(true)
    camBoard:Close()
  end
  function pokemonWarehouseActionTbl:decideAction()
    local addWarehouseCursor = 0
    local warehouseCursor = 0
    local mainMenu = self
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
    local function OpenAddWarehouseMenu()
      local menu = MENU:CreatePageMenu()
      menu:SetLayoutRectAndLines(32, 60, 0, 0)
      menu:ShowPageNum(true)
      for actorIndex = 3, 923 do
        MENU:SetTag_MonsterIndex(0, GROUND:GetActorIndexToPokemonIndex(actorIndex))
        menu:AddItemWithRepText("[pokemon_b:0]", actorIndex, nil)
      end
      function menu:cancelAction()
        self:Close()
      end
      function menu:decideAction()
        GROUND:AddPokemonWarehouse(self.curItem.obj, 1)
        self:Close()
      end
      function menu:openedAction()
        self:SetCursorItemIndex(addWarehouseCursor)
      end
      function menu:closedAction()
        addWarehouseCursor = self:GetCursorItemIndex()
      end
      menu:Open()
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
    end
    local function OpenListWarehouseMenu()
      local menu = MENU:CreatePageMenu()
      menu:SetLayoutRectAndLines(32, 60, 0, 0)
      menu:ShowPageNum(true)
      for wareHouseId in GROUND:EnumeratePokemonWarehouseId() do
        menu:AddItem(GROUND:GetPokemonWarehouseNameFromId(wareHouseId), wareHouseId, nil)
      end
      function menu:cancelAction()
        self:Close()
      end
      function menu:decideAction()
        self:Close()
      end
      function menu:openedAction()
        self:SetCursorItemIndex(warehouseCursor)
      end
      function menu:closedAction()
        warehouseCursor = self:GetCursorItemIndex()
      end
      menu:Open()
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
    end
    local function PokemonWarehouseFull()
      while GROUND:CheckPokemonWarehouseSpace() do
        for pokemonIndex = 30, 955 do
          if GROUND_DEBUG:IsPokemonWarehouseAddOk(pokemonIndex) then
            GROUND:AddPokemonWarehouse(pokemonIndex, 5)
          end
        end
      end
      groundDebugMenu_PopupResult(self, 742677083)
    end
    menu:AddItem(-1077604835, nil, {
      decideAction = function(self)
        OpenAddWarehouseMenu()
        MENU:SetFocus(self)
      end
    })
    menu:AddItem(730263694, nil, {
      decideAction = function(self)
        OpenListWarehouseMenu()
        MENU:SetFocus(self)
      end
    })
    menu:AddItem(773916437, nil, {
      decideAction = function(self)
        PokemonWarehouseFull()
        MENU:SetFocus(self)
      end
    })
    NestMenu_OpenAndCloseWait(menu)
  end
  function itemAndMoneyActionTbl:decideAction()
    local function dispMoneyMenu(startMoney)
      local money
      local menu = MENU:CreateNumericMenuWindow(ScreenType.B)
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRect(Rectangle(50, 80, 120, 64))
      menu:SetStartNum(startMoney)
      menu:SetPlace(8)
      menu:SetDigit(8)
      menu:SetType(1)
      function menu:decideAction()
        money = menu:GetSettingData()
        self:Close()
      end
      function menu:cancelAction()
        self:Close()
      end
      menu:Open()
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      return money
    end
    local function dispIngotMenu(startIngot)
      local gold
      local menu = MENU:CreateNumericMenuWindow(ScreenType.B)
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRect(Rectangle(50, 80, 120, 64))
      menu:SetStartNum(startIngot)
      menu:SetPlace(6)
      menu:SetDigit(6)
      menu:SetType(1)
      function menu:decideAction()
        gold = menu:GetSettingData()
        self:Close()
      end
      function menu:cancelAction()
        self:Close()
      end
      menu:Open()
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      return gold
    end
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    menu:SetCaption(740213326)
    local bagActTbl = {}
    local bagActTbl2 = {}
    local itemWarehosueActTbl = {}
    local materialWarehosueActTbl = {}
    local playerMoneyActTbl = {}
    local bankMoneyActTbl = {}
    local goldActTbl = {}
    menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
    menu:AddItem(-1222172129, nil, bagActTbl)
    menu:AddItem(-1265385773, nil, bagActTbl2)
    menu:AddItem(2117825991, nil, itemWarehosueActTbl)
    menu:AddItem(1116079819, nil, materialWarehosueActTbl)
    menu:AddItem(-1727346572, nil, playerMoneyActTbl)
    menu:AddItem(929444838, nil, bankMoneyActTbl)
    menu:AddItem(1746766006, nil, goldActTbl)
    local posX = self:GetLeft()
    function bagActTbl:decideAction()
      local decideFlg = false
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption("\227\129\169\227\129\134\227\129\144")
      menu:SetLayoutRectAndLines(posX, 60, 0, 0)
      menu:AddItem("\227\129\169\227\129\134\227\129\144\227\129\132\227\129\163\227\129\177\227\129\132", 0, {
        decideAction = function(self)
          local tbl = {
            {name = 789854517, item = 1},
            {name = -1256167532, item = 6},
            {name = -547395825, item = 11},
            {name = 1997756755, item = 101},
            {name = -1626520982, item = 112},
            {name = 962898074, item = 143},
            {name = -110661048, item = 168},
            {name = -2000930925, item = 225},
            {name = 334233071, item = 448},
            {name = 358054504, item = 484},
            {name = 1472000587, item = 539},
            {name = 988514290, item = 579},
            {name = 1212743807, item = ITEM_INDEX_RECRUIT_PIKACHUU}
          }
          local menu = MENU:CreatePageMenu()
          NestMenu_SetupDefaultAction(menu, self)
          menu:SetCaption(-2137717798)
          menu:SetLayoutRectAndLines(posX, 60, 0, 0)
          for i, v in ipairs(tbl) do
            menu:AddItem(v.name, v.item, {
              decideAction = function(self)
                GROUND_DEBUG:BagItemFull(v.item)
                decideFlg = true
                self:Close()
              end
            })
          end
          NestMenu_OpenAndCloseWait(menu)
          if decideFlg then
            self:Close()
          end
        end
      })
      menu:AddItem(236981827, 0, {
        decideAction = function(self)
          GROUND_DEBUG:BagChestFull()
          decideFlg = true
          self:Close()
        end
      })
      menu:AddItem(145220639, 0, {
        decideAction = function(self)
          GROUND_DEBUG:BagSkillChestFull()
          decideFlg = true
          self:Close()
        end
      })
      menu:AddItem(670437605, 0, {
        decideAction = function(self)
          GROUND_DEBUG:BagItemClear()
          decideFlg = true
          self:Close()
        end
      })
      NestMenu_OpenAndCloseWait(menu)
      if decideFlg then
        self:Close()
      end
    end
    function bagActTbl2:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption(-1591048899)
      menu:SetLayoutRectAndLines(posX, 60, 0, 0)
      local i = 1
      while i <= ITEM_INDEX_RECRUIT_MASTER do
        menu:AddItem(string.format("[item:%d]", i), i, {
          decideAction = function(self)
            GROUND_DEBUG:BagItemAdd(self.curItem.obj, 1)
            decideFlg = true
            self:Close()
          end
        })
        i = i + 1
      end
      menu:Open()
      menu:SetCursorItemIndex(FUNC_COMMON:GetDebugCursorPosition(DebugGroundCursorPositionKind.ITEM_BAG2))
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      FUNC_COMMON:SetDebugCursorPosition(DebugGroundCursorPositionKind.ITEM_BAG2, menu:GetCursorItemIndex())
      if decideFlg then
      end
    end
    function itemWarehosueActTbl:decideAction()
      local decideFlg = false
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption(-1591048899)
      menu:SetLayoutRectAndLines(posX, 60, 0, 0)
      menu:AddItem(-1713444819, 0, {
        decideAction = function(self)
          GROUND_DEBUG:ItemWarehouseItemFull()
          decideFlg = true
          self:Close()
        end
      })
      menu:AddItem(1626798409, 0, {
        decideAction = function(self)
          GROUND_DEBUG:ItemWarehouseItemClear()
          decideFlg = true
          self:Close()
        end
      })
      menu:AddItem(362054958, 0, {
        decideAction = function(self)
          self:SetVisible(false)
          OpenWarehouseBankMenu()
          self:SetVisible(true)
          decideFlg = true
          self:Close()
        end
      })
      NestMenu_OpenAndCloseWait(menu)
      if decideFlg then
        self:Close()
      end
    end
    function materialWarehosueActTbl:decideAction()
      local decideFlg = false
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption(-222251533)
      menu:SetLayoutRectAndLines(posX, 60, 0, 0)
      for itemIdx = ITEM_INDEX_KENZAI_TSUCHI_C, ITEM_INDEX_KENZAI_YOBI8 do
        menu:AddItem(string.format("[item:%d]", itemIdx), itemIdx, nil)
      end
      function menu:decideAction()
        local itemIdx = self.curItem.obj
        local decideNum
        ShopSys:DispInputMenu({
          titleText = self.curItem.text,
          digitNum = 3,
          startNum = GROUND:GetItemWarehouseItemNowCount(itemIdx),
          decideAction = function(num)
            decideNum = num
          end
        })
        if decideNum then
          GROUND_DEBUG:ItemWarehouseItemSet(itemIdx, decideNum)
        end
        MENU:SetFocus(self)
      end
      NestMenu_OpenAndCloseWait(menu)
      if decideFlg then
        self:Close()
      end
    end
    function playerMoneyActTbl:decideAction()
      local money = dispMoneyMenu(GROUND:GetPlayerMoney())
      if money then
        GROUND:SetPlayerMoney(money)
      end
      MENU:SetFocus(self)
    end
    function bankMoneyActTbl:decideAction()
      local money = dispMoneyMenu(GROUND:GetBankMoney())
      if money then
        GROUND:SetBankMoney(money)
      end
      MENU:SetFocus(self)
    end
    function goldActTbl:decideAction()
      local gold = dispIngotMenu(FUNC_COMMON:GetGoldIngot())
      if gold then
        FUNC_COMMON:SetGoldIngot(gold)
      end
      MENU:SetFocus(self)
    end
    menu:Open()
    menu:SetCursorItemIndex(FUNC_COMMON:GetDebugCursorPosition(DebugGroundCursorPositionKind.ITEM))
    MENU:SetFocus(menu)
    MENU:WaitClose(menu)
    FUNC_COMMON:SetDebugCursorPosition(DebugGroundCursorPositionKind.ITEM, menu:GetCursorItemIndex())
  end
  function heroPartnerChangeActionTbl:decideAction()
    local menu = MENU:CreatePageMenu()
    local posX = self:GetLeft()
    NestMenu_SetupDefaultAction(menu, self)
    local changeCharaActionTbl = {}
    menu:SetCaption(-820931116)
    menu:SetLayoutRectAndLines(secondMenuLeft, 60, 0, 0)
    menu:AddItem("HERO", 0, changeCharaActionTbl)
    menu:AddItem("PARTNER", 1, changeCharaActionTbl)
    function changeCharaActionTbl:decideAction()
      local selectTargetId = self.curItem.obj
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(posX, 60, 0, 0)
      local modifyActTbl = {
        itemPreOpenModifyAction = function(self)
          MENU:SetTag_MonsterIndex(0, self.curItem.obj)
        end
      }
      menu:AddItem("[PB:0]", 30, modifyActTbl)
      menu:AddItem("[PB:0]", 31, modifyActTbl)
      menu:AddItem("[PB:0]", 537, modifyActTbl)
      menu:AddItem("[PB:0]", 538, modifyActTbl)
      menu:AddItem("[PB:0]", 1, modifyActTbl)
      menu:AddItem("[PB:0]", 2, modifyActTbl)
      menu:AddItem("[PB:0]", 3, modifyActTbl)
      menu:AddItem("[PB:0]", 5, modifyActTbl)
      menu:AddItem("[PB:0]", 6, modifyActTbl)
      menu:AddItem("[PB:0]", 7, modifyActTbl)
      menu:AddItem("[PB:0]", 10, modifyActTbl)
      menu:AddItem("[PB:0]", 11, modifyActTbl)
      menu:AddItem("[PB:0]", 12, modifyActTbl)
      menu:AddItem("[PB:0]", 197, modifyActTbl)
      menu:AddItem("[PB:0]", 198, modifyActTbl)
      menu:AddItem("[PB:0]", 199, modifyActTbl)
      menu:AddItem("[PB:0]", 200, modifyActTbl)
      menu:AddItem("[PB:0]", 201, modifyActTbl)
      menu:AddItem("[PB:0]", 202, modifyActTbl)
      menu:AddItem("[PB:0]", 203, modifyActTbl)
      menu:AddItem("[PB:0]", 204, modifyActTbl)
      menu:AddItem("[PB:0]", 205, modifyActTbl)
      menu:AddItem("[PB:0]", 322, modifyActTbl)
      menu:AddItem("[PB:0]", 323, modifyActTbl)
      menu:AddItem("[PB:0]", 324, modifyActTbl)
      menu:AddItem("[PB:0]", 325, modifyActTbl)
      menu:AddItem("[PB:0]", 326, modifyActTbl)
      menu:AddItem("[PB:0]", 327, modifyActTbl)
      menu:AddItem("[PB:0]", 329, modifyActTbl)
      menu:AddItem("[PB:0]", 330, modifyActTbl)
      menu:AddItem("[PB:0]", 331, modifyActTbl)
      menu:AddItem("[PB:0]", 479, modifyActTbl)
      menu:AddItem("[PB:0]", 480, modifyActTbl)
      menu:AddItem("[PB:0]", 481, modifyActTbl)
      menu:AddItem("[PB:0]", 482, modifyActTbl)
      menu:AddItem("[PB:0]", 483, modifyActTbl)
      menu:AddItem("[PB:0]", 484, modifyActTbl)
      menu:AddItem("[PB:0]", 485, modifyActTbl)
      menu:AddItem("[PB:0]", 486, modifyActTbl)
      menu:AddItem("[PB:0]", 487, modifyActTbl)
      menu:AddItem("[PB:0]", 592, modifyActTbl)
      menu:AddItem("[PB:0]", 593, modifyActTbl)
      menu:AddItem("[PB:0]", 594, modifyActTbl)
      menu:AddItem("[PB:0]", 595, modifyActTbl)
      menu:AddItem("[PB:0]", 596, modifyActTbl)
      menu:AddItem("[PB:0]", 597, modifyActTbl)
      menu:AddItem("[PB:0]", 598, modifyActTbl)
      menu:AddItem("[PB:0]", 599, modifyActTbl)
      menu:AddItem("[PB:0]", 600, modifyActTbl)
      menu:AddItem("[PB:0]", 766, modifyActTbl)
      menu:AddItem("[PB:0]", 767, modifyActTbl)
      menu:AddItem("[PB:0]", 768, modifyActTbl)
      menu:AddItem("[PB:0]", 769, modifyActTbl)
      menu:AddItem("[PB:0]", 770, modifyActTbl)
      menu:AddItem("[PB:0]", 771, modifyActTbl)
      menu:AddItem("[PB:0]", 772, modifyActTbl)
      menu:AddItem("[PB:0]", 773, modifyActTbl)
      menu:AddItem("[PB:0]", 774, modifyActTbl)
      menu:AddItem("[PB:0]", 401, modifyActTbl)
      menu:AddItem("[PB:0]", 319, modifyActTbl)
      menu:AddItem("[PB:0]", 318, modifyActTbl)
      menu:AddItem("[PB:0]", 750, modifyActTbl)
      menu:AddItem("[PB:0]", 109, modifyActTbl)
      menu:AddItem("[PB:0]", 110, modifyActTbl)
      function menu:decideAction()
        if selectTargetId == 0 then
          GROUND_DEBUG:SetWareHouse_HERO(self.curItem.obj)
        else
          GROUND_DEBUG:SetWareHouse_PARTENER(self.curItem.obj)
        end
        groundDebugMenu_PopupResult(self, -222458716)
        self:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function heroPartnerGenderChangeActionTbl:decideAction()
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    local changeCharaActionTbl = {}
    menu:SetCaption(640278598)
    menu:SetLayoutRectAndLines(secondMenuLeft, 60, 0, 0)
    menu:AddItem(1644389460, 0, changeCharaActionTbl)
    menu:AddItem(-773165669, 1, changeCharaActionTbl)
    function changeCharaActionTbl:decideAction()
      local selectTargetId = self.curItem.obj
      if selectTargetId == 0 then
        SYSTEM:SetPartnerSex(SEX.MALE)
        groundDebugMenu_PopupResult(self, -198408561)
      else
        SYSTEM:SetPartnerSex(SEX.FEMALE)
        groundDebugMenu_PopupResult(self, -988358999)
      end
      self:Close()
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function partyChangeActionTbl:decideAction()
    local function openMenuFunc()
      local parentMenu = self
      local partyChangeMenu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(partyChangeMenu, self)
      local changePartyActionTbl = {}
      local addPartyActionTbl = {}
      local addPartyDefaultActionTbl = {}
      partyChangeMenu:SetCaption(1651928027)
      partyChangeMenu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
      for memberId in GROUND:EnumeratePartyMemberId() do
        partyChangeMenu:AddItem(GROUND:GetPartyNameFromId(memberId), memberId, changePartyActionTbl)
      end
      if GROUND:GetPartyMemberCount() < 4 then
        partyChangeMenu:AddItem(-1026769700, nil, addPartyActionTbl)
        partyChangeMenu:AddItem(1388009462, nil, addPartyDefaultActionTbl)
      end
      local reOpenFlag = false
      local function reOpen()
        partyChangeMenu:Close()
        reOpenFlag = true
      end
      function changePartyActionTbl:decideAction()
        local selectMemberId = self.curItem.obj
        local menu = MENU:CreatePageMenu()
        NestMenu_SetupDefaultAction(menu, self)
        menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 80, 0, 0)
        menu:AddItem(-2074755954, nil, {
          decideAction = function(self)
            GROUND:SetPartyPlayerFromId(selectMemberId)
            self:Close()
            reOpen()
          end
        })
        menu:AddItem(-991248705, nil, {
          decideAction = function(self)
            GROUND:RemovePartyFromId(selectMemberId)
            self:Close()
            reOpen()
          end
        })
        NestMenu_OpenAndCloseWait(menu)
      end
      function changePartyActionTbl:itemPreOpenModifyAction()
        if GROUND:IsPartyPlayerFromId(self.curItem.obj) then
          self.curItem.text = self.curItem.text .. "(Player)"
        end
      end
      function addPartyActionTbl:decideAction()
        local menu = MENU:CreatePageMenu()
        NestMenu_SetupDefaultAction(menu, self)
        menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 80, 0, 0)
        menu:ShowPageNum(true)
        for wareHouseId in GROUND:EnumeratePokemonWarehouseId() do
          menu:AddItem(GROUND:GetPokemonWarehouseNameFromId(wareHouseId), wareHouseId, nil)
        end
        function menu:cancelAction()
          self:Close()
        end
        function menu:decideAction()
          GROUND:AddPartyFromWarehouse(self.curItem.obj)
          self:Close()
          reOpen()
        end
        function menu:itemPreOpenModifyAction()
          if GROUND:IsPokemonWarehouseSally(self.curItem.obj) then
            self.curItem.grayed = true
          end
        end
        NestMenu_OpenAndCloseWait(menu)
      end
      function addPartyDefaultActionTbl:decideAction()
        local defaultSet = {
          728,
          733,
          631
        }
        local warehouseIdTbl = {}
        for wareHouseId in GROUND:EnumeratePokemonWarehouseId() do
          for i, pokemonIndex in ipairs(defaultSet) do
            if pokemonIndex == GROUND:GetPokemonWarehousePokemonIndex(wareHouseId) then
              warehouseIdTbl[pokemonIndex] = wareHouseId
            end
          end
        end
        for wareHouseId in GROUND:EnumeratePokemonWarehouseId() do
          for i, pokemonIndex in ipairs(defaultSet) do
            if warehouseIdTbl[pokemonIndex] == nil then
              warehouseIdTbl[pokemonIndex] = GROUND:AddPokemonWarehouse(pokemonIndex, 1)
            end
          end
        end
        for i, pokemonIndex in ipairs(defaultSet) do
          if GROUND:IsPartyFull() then
            break
          end
          if warehouseIdTbl[pokemonIndex] ~= nil then
            GROUND:AddPartyFromWarehouse(warehouseIdTbl[pokemonIndex])
          end
        end
        reOpen()
      end
      NestMenu_OpenAndCloseWait(partyChangeMenu)
      return reOpenFlag
    end
    while true do
      if openMenuFunc() then
      end
    end
  end
  function parameterActionTbl:decideAction()
    local function dispMoneyMenu(startMoney)
      local money
      local menu = MENU:CreateNumericMenuWindow(ScreenType.B)
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRect(Rectangle(40, 80, 120, 64))
      menu:SetStartNum(startMoney)
      menu:SetPlace(8)
      menu:SetDigit(8)
      menu:SetType(1)
      function menu:decideAction()
        money = menu:GetSettingData()
        self:Close()
      end
      function menu:cancelAction()
        self:Close()
      end
      menu:Open()
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      return money
    end
    local function dispIngotMenu(startIngot)
      local gold
      local menu = MENU:CreateNumericMenuWindow(ScreenType.B)
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRect(Rectangle(50, 80, 120, 64))
      menu:SetStartNum(startIngot)
      menu:SetPlace(6)
      menu:SetDigit(6)
      menu:SetType(1)
      function menu:decideAction()
        gold = menu:GetSettingData()
        self:Close()
      end
      function menu:cancelAction()
        self:Close()
      end
      menu:Open()
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      return gold
    end
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    menu:SetCaption(1651928027)
    local wazaTestActionTbl = {}
    local itemWarehosueActTbl = {}
    local playerMoneyActTbl = {}
    local bankMoneyActTbl = {}
    local goldActTbl = {}
    menu:SetLayoutRectAndLines(self:GetRight() - 32, 90, 0, 0)
    menu:AddItem(-2101510189, nil, wazaTestActionTbl)
    local posX = self:GetLeft()
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
    function wazaTestActionTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self, true)
      menu:SetCaption(1221152936)
      menu:SetLayoutRectAndLines(self:GetLeft(), self:GetTop(), 80, 5)
      GROUND_DEBUG:InitWazaSyllabaryMap()
      for i = 1, table.maxn(debugSyllabaryHashTbl) do
        menu:AddItem(debugSyllabaryHashTbl[i], i - 1, nil)
      end
      function menu:itemPreOpenModifyAction()
        if not GROUND_DEBUG:IsWazaSyllabaryValid(self.curItem.obj) then
          self.curItem.grayed = true
        end
      end
      function menu:decideAction()
        local menu = MENU:CreatePageMenu()
        NestMenu_SetupDefaultAction(menu, self)
        menu:SetCaption(-1605142516)
        menu:SetLayoutRectAndLines(48, self:GetTop() + 32, 0, 0)
        local wazaNameTbl = GROUND_DEBUG:GetWazaSyllabaryArray(self.curItem.obj)
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
          local text = "[value_s_b:0:3]." .. MENU:GetTextPoolText(indexTbl[i].hash)
          menu:AddItem(MENU:ReplaceTagText(text), indexTbl[i].id, nil)
        end
        menu:AddItem(1007389591, nil, {
          decideAction = function(self)
            self:Close()
          end
        })
        function menu:decideAction()
          local index = self.curItem.obj
          local menu = MENU:CreateParameterMenu()
          local gradeTbl, expTbl, powerTbl, hitTbl, ppTbl = {}, {}, {}, {}, {}
          NestMenu_SetupDefaultAction(menu, self, true)
          menu:SetCaption(1221152936)
          menu:SetLayoutRectAndLines(self:GetLeft(), self:GetTop(), 0, 0)
          menu:AddItemI(1189699546, ValueParamEx(0, 24, GROUND_DEBUG:GetWazaGrade(index)), nil, gradeTbl)
          menu:AddItemI(-88950467, ValueParamEx(0, GROUND_DEBUG:GetMaxWazaExperience(index), GROUND_DEBUG:GetWazaExperience(index)), nil, expTbl)
          menu:AddItemI(211149764, ValueParamEx(GROUND_DEBUG:GetDefaultWazaPower(index), GROUND_DEBUG:GetMaxWazaPower(index), GROUND_DEBUG:GetWazaPower(index)), nil, powerTbl)
          menu:AddItemI(1668691213, ValueParamEx(GROUND_DEBUG:GetDefaultWazaHitRate(index), GROUND_DEBUG:GetMaxWazaHitRate(index), GROUND_DEBUG:GetWazaHitRate(index)), nil, hitTbl)
          menu:AddItemI(1483613782, ValueParamEx(GROUND_DEBUG:GetDefaultWazaMaxPP(index), GROUND_DEBUG:GetMaxWazaMaxPP(index), GROUND_DEBUG:GetWazaMaxPP(index)), nil, ppTbl)
          function gradeTbl:currentItemValueChange()
            GROUND_DEBUG:SetWazaGrade(index, self.curItem.value)
            self:SetCurrentModifyItem(1)
            self.curItem.max = GROUND_DEBUG:GetMaxWazaExperience(index)
            self.curItem.value = GROUND_DEBUG:GetWazaExperience(index)
            self:SetCurrentModifyItem(2)
            self.curItem.value = GROUND_DEBUG:GetWazaPower(index)
            self:SetCurrentModifyItem(3)
            self.curItem.value = GROUND_DEBUG:GetWazaHitRate(index)
            self:SetCurrentModifyItem(4)
            self.curItem.value = GROUND_DEBUG:GetWazaMaxPP(index)
            self:SetCurrentModifyItem(0)
          end
          function expTbl:currentItemValueChange()
            GROUND_DEBUG:SetWazaExperience(index, self.curItem.value)
          end
          function powerTbl:currentItemValueChange()
            GROUND_DEBUG:SetWazaPower(index, self.curItem.value)
          end
          function hitTbl:currentItemValueChange()
            GROUND_DEBUG:SetWazaHitRate(index, self.curItem.value)
          end
          function ppTbl:currentItemValueChange()
            GROUND_DEBUG:SetWazaMaxPP(index, self.curItem.value)
          end
          function menu:decideAction()
            self:Close()
          end
          local curIndex = GROUND:GetResumeCursorIndex(DungeonDebugManagerMenuCursor.MENU_CURSOR_WAZA_IMPROVE_T)
          menu:Open()
          menu:SetCursorItemIndex(curIndex)
          menu:SetCurrentModifyItem(curIndex)
          MENU:SetFocus(menu)
          MENU:WaitClose(menu)
          GROUND:SetResumeCursorIndex(DungeonDebugManagerMenuCursor.MENU_CURSOR_WAZA_IMPROVE_T, menu:GetCursorItemIndex())
        end
        local index = GROUND:GetResumeCursorIndex(DungeonDebugManagerMenuCursor.MENU_CURSOR_WAZA_IMPROVE)
        menu:Open()
        menu:SetCursorItemIndex(index)
        menu:SetCurrentModifyItem(index)
        MENU:SetFocus(menu)
        MENU:WaitClose(menu)
        GROUND:SetResumeCursorIndex(DungeonDebugManagerMenuCursor.MENU_CURSOR_WAZA_IMPROVE, menu:GetCursorItemIndex())
        if menu:IsResult() and menu.curItem.obj ~= nil then
          self:Close()
        end
      end
      local index = GROUND:GetResumeCursorIndex(DungeonDebugManagerMenuCursor.MENU_CURSOR_WAZA_IMPROVE_I)
      menu:Open()
      menu:SetCursorItemIndex(index)
      menu:SetCurrentModifyItem(index)
      MENU:SetFocus(menu)
      MENU:WaitClose(menu)
      GROUND:SetResumeCursorIndex(DungeonDebugManagerMenuCursor.MENU_CURSOR_WAZA_IMPROVE_I, menu:GetCursorItemIndex())
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function heroPartnerChangeActionTbl:decideAction()
    local menu = MENU:CreatePageMenu()
    local posX = self:GetLeft()
    NestMenu_SetupDefaultAction(menu, self)
    local changeCharaActionTbl = {}
    menu:SetCaption(-820931116)
    menu:SetLayoutRectAndLines(secondMenuLeft, 60, 0, 0)
    menu:AddItem("HERO", 0, changeCharaActionTbl)
    menu:AddItem("PARTNER", 1, changeCharaActionTbl)
    function changeCharaActionTbl:decideAction()
      local selectTargetId = self.curItem.obj
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(posX, 60, 0, 0)
      local modifyActTbl = {
        itemPreOpenModifyAction = function(self)
          MENU:SetTag_MonsterIndex(0, self.curItem.obj)
        end
      }
      menu:AddItem("[PB:0]", 30, modifyActTbl)
      menu:AddItem("[PB:0]", 31, modifyActTbl)
      menu:AddItem("[PB:0]", 537, modifyActTbl)
      menu:AddItem("[PB:0]", 538, modifyActTbl)
      menu:AddItem("[PB:0]", 1, modifyActTbl)
      menu:AddItem("[PB:0]", 2, modifyActTbl)
      menu:AddItem("[PB:0]", 3, modifyActTbl)
      menu:AddItem("[PB:0]", 5, modifyActTbl)
      menu:AddItem("[PB:0]", 6, modifyActTbl)
      menu:AddItem("[PB:0]", 7, modifyActTbl)
      menu:AddItem("[PB:0]", 10, modifyActTbl)
      menu:AddItem("[PB:0]", 11, modifyActTbl)
      menu:AddItem("[PB:0]", 12, modifyActTbl)
      menu:AddItem("[PB:0]", 197, modifyActTbl)
      menu:AddItem("[PB:0]", 198, modifyActTbl)
      menu:AddItem("[PB:0]", 199, modifyActTbl)
      menu:AddItem("[PB:0]", 200, modifyActTbl)
      menu:AddItem("[PB:0]", 201, modifyActTbl)
      menu:AddItem("[PB:0]", 202, modifyActTbl)
      menu:AddItem("[PB:0]", 203, modifyActTbl)
      menu:AddItem("[PB:0]", 204, modifyActTbl)
      menu:AddItem("[PB:0]", 205, modifyActTbl)
      menu:AddItem("[PB:0]", 322, modifyActTbl)
      menu:AddItem("[PB:0]", 323, modifyActTbl)
      menu:AddItem("[PB:0]", 324, modifyActTbl)
      menu:AddItem("[PB:0]", 325, modifyActTbl)
      menu:AddItem("[PB:0]", 326, modifyActTbl)
      menu:AddItem("[PB:0]", 327, modifyActTbl)
      menu:AddItem("[PB:0]", 329, modifyActTbl)
      menu:AddItem("[PB:0]", 330, modifyActTbl)
      menu:AddItem("[PB:0]", 331, modifyActTbl)
      menu:AddItem("[PB:0]", 479, modifyActTbl)
      menu:AddItem("[PB:0]", 480, modifyActTbl)
      menu:AddItem("[PB:0]", 481, modifyActTbl)
      menu:AddItem("[PB:0]", 482, modifyActTbl)
      menu:AddItem("[PB:0]", 483, modifyActTbl)
      menu:AddItem("[PB:0]", 484, modifyActTbl)
      menu:AddItem("[PB:0]", 485, modifyActTbl)
      menu:AddItem("[PB:0]", 486, modifyActTbl)
      menu:AddItem("[PB:0]", 487, modifyActTbl)
      menu:AddItem("[PB:0]", 592, modifyActTbl)
      menu:AddItem("[PB:0]", 593, modifyActTbl)
      menu:AddItem("[PB:0]", 594, modifyActTbl)
      menu:AddItem("[PB:0]", 595, modifyActTbl)
      menu:AddItem("[PB:0]", 596, modifyActTbl)
      menu:AddItem("[PB:0]", 597, modifyActTbl)
      menu:AddItem("[PB:0]", 598, modifyActTbl)
      menu:AddItem("[PB:0]", 599, modifyActTbl)
      menu:AddItem("[PB:0]", 600, modifyActTbl)
      menu:AddItem("[PB:0]", 766, modifyActTbl)
      menu:AddItem("[PB:0]", 767, modifyActTbl)
      menu:AddItem("[PB:0]", 768, modifyActTbl)
      menu:AddItem("[PB:0]", 769, modifyActTbl)
      menu:AddItem("[PB:0]", 770, modifyActTbl)
      menu:AddItem("[PB:0]", 771, modifyActTbl)
      menu:AddItem("[PB:0]", 772, modifyActTbl)
      menu:AddItem("[PB:0]", 773, modifyActTbl)
      menu:AddItem("[PB:0]", 774, modifyActTbl)
      menu:AddItem("[PB:0]", 401, modifyActTbl)
      menu:AddItem("[PB:0]", 319, modifyActTbl)
      menu:AddItem("[PB:0]", 318, modifyActTbl)
      menu:AddItem("[PB:0]", 750, modifyActTbl)
      menu:AddItem("[PB:0]", 109, modifyActTbl)
      menu:AddItem("[PB:0]", 110, modifyActTbl)
      function menu:decideAction()
        if selectTargetId == 0 then
          GROUND_DEBUG:SetWareHouse_HERO(self.curItem.obj)
        else
          GROUND_DEBUG:SetWareHouse_PARTENER(self.curItem.obj)
        end
        groundDebugMenu_PopupResult(self, -222458716)
        self:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function placeCaptureActionTbl:decideAction()
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
    menu:AddItem(612704619, nil, nil)
    menu:AddItem(844014294, nil, {
      decideAction = function(self)
        self:Close()
      end
    })
    function menu:decideAction()
      if GROUND_DEBUG:ExecPlacementDataCapture() then
        groundDebugMenu_PopupResult(self, -1106407410)
      else
        groundDebugMenu_PopupResult(self, -1953551963)
      end
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function shopTestActionTbl:decideAction()
    local mainMenu = self
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    local shopActionTbl = {}
    local shopActionTblForPara = {}
    menu:SetCaption(-1170507346)
    menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
    menu:AddItem(-1092794312, OpenWarehouseBankMenu, shopActionTbl)
    menu:AddItem(1573440641, OpenShopMerchantMenu, shopActionTbl)
    menu:AddItem(-1543007335, OpenShopSpecialMerchantMenu, shopActionTblForPara)
    menu:AddItem(814056587, OpenShopSpecialproductMenu, shopActionTbl)
    menu:AddItem(1717926681, OpenShopSelectMenu, shopActionTblForPara)
    menu:AddItem(-1070006682, function()
      GROUND__2:DebugCommand_SelectShopClosed()
    end, shopActionTbl)
    menu:AddItem(1891452046, OpenGiftShopMenu, shopActionTbl)
    menu:AddItem(-598821773, function()
      GROUND__2:DebugCommand_BookAllOpen()
    end, shopActionTbl)
    menu:AddItem(-869727911, OpenJudgmentShopMenu, shopActionTbl)
    menu:AddItem(1847290716, OpenGoldIngotShopMenu, shopActionTbl)
    menu:AddItem(1967992458, OpenPeddlerShopMenu, shopActionTblForPara)
    menu:AddItem(-1687765720, OpenGroundEnterDungeonMenu, shopActionTbl)
    menu:AddItem(-1600732166, OpenGroundVoyagePartySelectMenu, shopActionTbl)
    menu:AddItem(-334549033, OpenQuestBoardMenu, shopActionTbl)
    menu:AddItem(-527756653, OpenQuestMultiBoardMenu, shopActionTbl)
    menu:AddItem(-1612032974, OpenStrangePostMenu, shopActionTbl)
    menu:AddItem(495982297, OpenFriendGateMenu, shopActionTbl)
    menu:AddItem(943561919, OpenQuestCounterMenu, shopActionTbl)
    menu:AddItem(1251237932, OpenQuestEnterDungeonMenu, shopActionTbl)
    menu:AddItem(844421068, OpenQuestSuccessDungeonResultMenu, shopActionTbl)
    menu:AddItem(-749622289, OpenQuestSuccessDungeonGetRewardMenu, shopActionTbl)
    menu:AddItem(1495636234, OpenGameMenuPasswordMenu, shopActionTbl)
    menu:AddItem(651196846, OpenCarpenterShopMenu, shopActionTbl)
    menu:AddItem(790892947, OpenParadiseHome_HenseiMenuLv1, shopActionTbl)
    menu:AddItem(67715664, OpenParadiseHome_HenseiMenuLv2, shopActionTbl)
    menu:AddItem(-267237110, OpenExampleShopMenu, shopActionTbl)
    menu:AddItem(2106869600, OpenMinigameSalvageMenu, shopActionTbl)
    menu:AddItem(-339369337, OpenMinigameHockeyMenu, shopActionTbl)
    menu:AddItem(412920941, OpenRecycleMenu, shopActionTblForPara)
    menu:AddItem(-2128790452, OpenLotteryMenu, shopActionTblForPara)
    menu:AddItem(1381967914, OpenLotteryNextDay, shopActionTblForPara)
    menu:AddItem(867186478, OpenTreasureMenu, shopActionTblForPara)
    menu:AddItem(1137755016, OpenDigMenu, shopActionTblForPara)
    menu:AddItem(-2095480885, OpenDebugDigLot, shopActionTbl)
    menu:AddItem(1596528396, OpenJukeboxShopMenu, shopActionTbl)
    menu:AddItem(-1727698907, OpenShopWAZATrainingMenu, shopActionTblForPara)
    menu:AddItem(1046478748, OpenShopSideWayGuideMenu, shopActionTblForPara)
    menu:AddItem(-442985019, OpenWAZAShopMenu, shopActionTbl)
    menu:AddItem(1282664503, OpenVrouletteShopMenu, shopActionTbl)
    menu:AddItem(869105451, OpenVWaveReportFlow, shopActionTbl)
    menu:AddItem(-1706410734, function()
      OpenGroundCharaSelectFlow("hero")
    end, shopActionTbl)
    menu:AddItem(-1567313741, function()
      OpenGroundCharaSelectFlow("partner")
    end, shopActionTbl)
    menu:AddItem(-1248169731, function()
      OpenGroundCharaSelectNameInputFlow("team")
    end, shopActionTbl)
    menu:AddItem(-1102440939, function()
      GROUND_DEBUG:SetParadisePoint(GROUND_DEBUG:GetNowParadisePoint() + GROUND_DEBUG:GetNeedParadisePoint())
      MENU:DebugReloadMenuScript("script/menu/menu_shop_main.lua")
      OpenParadiseRankUpMenu()
    end, shopActionTbl)
    menu:AddItem(-1193914999, nil, {
      decideAction = function(self)
        self:Close()
      end
    })
    function shopActionTbl:decideAction()
      self:SetVisible(false)
      mainMenu:SetVisible(false)
      local openFunc = self.curItem.obj
      openFunc()
      MENU:SetFocus(self)
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    function shopActionTblForPara:decideAction()
      self:SetVisible(false)
      mainMenu:SetVisible(false)
      local openFunc = self.curItem.obj
      openFunc({})
      MENU:SetFocus(self)
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    function shopActionTbl:forceClosedAction()
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    shopActionTblForPara.forceClosedAction = shopActionTbl.forceClosedAction
    function shopActionTbl:errClosedAction()
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    shopActionTblForPara.errClosedAction = shopActionTbl.errClosedAction
    NestMenu_OpenAndCloseWait(menu)
  end
  local AddDebugSwitchAndValueItemFunc = function(parameterMenu)
    function parameterMenu:AddItemDebugSwitch(itemTitle, switchType, falseText, trueText)
      local switchTypeActTbl = {
        decideAction = function(self)
          DEBUG:SetDebugSwitch(self.curItem.obj, self.curItem.selectValueObj)
          self.curItem.text = " " .. itemTitle
        end,
        currentItemValueChange = function(self)
          if self.curItem.selectValueObj == DEBUG:GetDebugSwitch(switchType) then
            self.curItem.text = " " .. itemTitle
          elseif string.sub(self.curItem.text, 1, 1) ~= "*" then
            self.curItem.text = MENU:ReplaceTagText("*" .. itemTitle)
          end
        end
      }
      self:AddItemS(" " .. itemTitle, switchType, switchTypeActTbl)
      self:AddSelectString(falseText, false)
      self:AddSelectString(trueText, true)
      self:SetSelectStringIndexObj(DEBUG:GetDebugSwitch(switchType))
    end
    function parameterMenu:AddItemDebugValue(itemTitle, valueType, itemTbl)
      local valueTypeActTbl = {
        decideAction = function(self)
          DEBUG:SetDebugValue(self.curItem.obj, self.curItem.selectValueObj)
          self.curItem.text = " " .. itemTitle
        end,
        currentItemValueChange = function(self)
          if self.curItem.selectValueObj == DEBUG:GetDebugValue(valueType) then
            self.curItem.text = " " .. itemTitle
          elseif string.sub(self.curItem.text, 1, 1) ~= "*" then
            self.curItem.text = MENU:ReplaceTagText("*" .. itemTitle)
          end
        end
      }
      self:AddItemS(" " .. itemTitle, valueType, valueTypeActTbl)
      for i, item in ipairs(itemTbl) do
        self:AddSelectString(item.text, item.value)
      end
      self:SetSelectStringIndexObj(DEBUG:GetDebugValue(valueType))
    end
  end
  function shopDebugMenuActionTbl:decideAction()
    local mainMenu = self
    local menu = MENU:CreateParameterMenu()
    menu.parentMenu = self
    NestMenu_SetupDefaultAction(menu, self, true)
    menu:SetCaption(-1339810230)
    menu:SetLayoutRectAndLines(8, 32, 304, 0)
    AddDebugSwitchAndValueItemFunc(menu)
    menu:AddItemDebugSwitch(-1212649866, DebugSwitchType.SWITCH_SHOP__SPECIAL_MARCHANT_FP_QUICK_RESTOCK, -1050133564, -663549307)
    menu:AddItem("[CS:H]\227\130\187\227\131\172\227\130\175\227\131\136\227\130\183\227\131\167\227\131\131\227\131\151[CR][M:OP01]", nil, {
      decideAction = function(self)
        local menu = MENU:CreateParameterMenu()
        menu.parentMenu = self
        menu:SetCaption(1595786223)
        menu:SetLayoutRectAndLines(8, 32, 304, 0)
        AddDebugSwitchAndValueItemFunc(menu)
        NestMenu_SetupDefaultAction(menu, self, true)
        menu:AddItemDebugSwitch(-372467279, DebugSwitchType.SWITCH_SHOP__SELECT_CLOSE_100PER, 201759349, 354265908)
        menu:AddItemDebugSwitch(-1653338033, DebugSwitchType.SWITCH_SHOP__SELECT_SALE_100PER, -1251495226, -1401126009)
        menu:AddItemDebugValue("\227\129\173\227\129\160\227\130\147", DebugValueType.VALUE_SHOP__SELECT_PRICE_RANK, {
          {
            text = 917794657,
            value = DEBUG_SHOP_SELECT_RANK.NONE
          },
          {
            text = 1883004682,
            value = DEBUG_SHOP_SELECT_RANK.RANK_0
          },
          {
            text = 1764191819,
            value = DEBUG_SHOP_SELECT_RANK.RANK_1
          },
          {
            text = 1107967368,
            value = DEBUG_SHOP_SELECT_RANK.RANK_2
          },
          {
            text = 1527844041,
            value = DEBUG_SHOP_SELECT_RANK.RANK_3
          }
        })
        menu:AddItemDebugValue("\227\129\139\227\129\132\227\129\168\227\130\138", DebugValueType.VALUE_SHOP__SELECT_BUY_RANK, {
          {
            text = 917794657,
            value = DEBUG_SHOP_SELECT_RANK.NONE
          },
          {
            text = 1883004682,
            value = DEBUG_SHOP_SELECT_RANK.RANK_0
          },
          {
            text = 1764191819,
            value = DEBUG_SHOP_SELECT_RANK.RANK_1
          },
          {
            text = 1107967368,
            value = DEBUG_SHOP_SELECT_RANK.RANK_2
          },
          {
            text = 1527844041,
            value = DEBUG_SHOP_SELECT_RANK.RANK_3
          }
        })
        menu:AddItemDebugValue("\227\131\172\227\130\162\227\129\169", DebugValueType.VALUE_SHOP__SELECT_RARE_RANK, {
          {
            text = 917794657,
            value = DEBUG_SHOP_SELECT_RANK.NONE
          },
          {
            text = 1883004682,
            value = DEBUG_SHOP_SELECT_RANK.RANK_0
          },
          {
            text = 1764191819,
            value = DEBUG_SHOP_SELECT_RANK.RANK_1
          },
          {
            text = 1107967368,
            value = DEBUG_SHOP_SELECT_RANK.RANK_2
          },
          {
            text = 1527844041,
            value = DEBUG_SHOP_SELECT_RANK.RANK_3
          }
        })
        NestMenu_OpenAndCloseWait(menu)
      end
    })
    menu:AddItem(-1890037075, nil, {
      decideAction = function(self)
        local menu = MENU:CreateParameterMenu()
        menu.parentMenu = self
        menu:SetCaption(644572020)
        menu:SetLayoutRectAndLines(8, 32, 304, 0)
        AddDebugSwitchAndValueItemFunc(menu)
        NestMenu_SetupDefaultAction(menu, self, true)
        menu:AddItemDebugValue(-2133742465, DebugValueType.VALUE_SHOP__LOTTERY_SPEED_JUDGE, {
          {
            text = -1554149133,
            value = DEBUG_SHOP_LOTTERY_JUDGE.NONE
          },
          {
            text = 2070545561,
            value = DEBUG_SHOP_LOTTERY_JUDGE.HIT
          },
          {
            text = 1687002879,
            value = DEBUG_SHOP_LOTTERY_JUDGE.BIG_HIT
          },
          {
            text = 257183763,
            value = DEBUG_SHOP_LOTTERY_JUDGE.MISS
          }
        })
        menu:AddItemDebugSwitch(1065887630, DebugSwitchType.SWITCH_SHOP__LOTTERY_SCRATCH_100PER, -1554149133, 1038362804)
        menu:AddItemDebugValue(491418667, DebugValueType.VALUE_SHOP__LOTTERY_DAYS_JUDGE, {
          {
            text = -1554149133,
            value = DEBUG_SHOP_LOTTERY_JUDGE.NONE
          },
          {
            text = 2070545561,
            value = DEBUG_SHOP_LOTTERY_JUDGE.HIT
          },
          {
            text = 1687002879,
            value = DEBUG_SHOP_LOTTERY_JUDGE.BIG_HIT
          },
          {
            text = 257183763,
            value = DEBUG_SHOP_LOTTERY_JUDGE.MISS
          }
        })
        NestMenu_OpenAndCloseWait(menu)
      end
    })
    menu:AddItemDebugSwitch("\227\130\143\227\129\150\227\129\169\227\129\134\227\129\152\227\130\135\227\129\134", DebugSwitchType.SWITCH_SHOP__WAZATRAINING_SUPER_UP_100PER, "\227\129\157\227\129\174\227\129\190\227\129\190", "\231\136\134\231\153\186\230\136\144\233\149\183\239\188\145\239\188\144\239\188\144\239\188\133")
    menu:AddItemDebugSwitch("\227\129\187\227\130\138\227\129\130\227\129\166\227\130\132", DebugSwitchType.SWITCH_SHOP__DIG_APPEAR_100PER, "\227\129\157\227\129\174\227\129\190\227\129\190", "\229\135\186\231\143\190\239\188\145\239\188\144\239\188\144\239\188\133")
    menu:AddItemDebugValue("\227\129\187\227\129\163\227\129\159\227\130\130\227\129\174(\230\156\170\229\174\159\232\163\133)", DebugValueType.VALUE_SHOP__DIG_ITEM_RANK, {
      {
        text = "\227\129\157\227\129\174\227\129\190\227\129\190",
        value = DEBUG_SHOP_DIG_ITEM_RANK.NONE
      },
      {
        text = "\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179",
        value = DEBUG_SHOP_DIG_ITEM_RANK.DUNGEON
      },
      {
        text = "\227\131\172\227\130\162\227\129\169\227\129\134\227\129\144",
        value = DEBUG_SHOP_DIG_ITEM_RANK.RARE_ITEM_HIT
      },
      {
        text = "\227\129\169\227\129\134\227\129\144",
        value = DEBUG_SHOP_DIG_ITEM_RANK.ITEM
      },
      {
        text = "\227\129\141\227\130\147\227\129\139\227\129\132",
        value = DEBUG_SHOP_DIG_ITEM_RANK.INGOT
      },
      {
        text = "\227\129\138\227\129\139\227\129\173",
        value = DEBUG_SHOP_DIG_ITEM_RANK.MONEY
      }
    })
    menu:AddItem("[CS:H]\227\129\142\227\130\135\227\129\134\227\129\151\227\130\135\227\129\134\227\129\171\227\130\147[CR][M:OP01]", nil, {
      decideAction = function(self)
        local menu = MENU:CreateParameterMenu()
        menu.parentMenu = self
        menu:SetCaption("\227\129\143\227\129\152\227\129\179\227\129\141")
        menu:SetLayoutRectAndLines(8, 32, 304, 0)
        AddDebugSwitchAndValueItemFunc(menu)
        NestMenu_SetupDefaultAction(menu, self, true)
        menu:AddItemDebugValue("\227\129\142\227\130\135\227\129\134\227\129\151\227\130\135\227\129\134\227\129\171\227\130\147\239\188\145\239\188\144\239\188\144\239\188\133", DebugValueType.VALUE_SHOP__PEDDLER_FORCE_TYPE, {
          {
            text = "\227\129\157\227\129\174\227\129\190\227\129\190",
            value = DEBUG_SHOP_PEDDLER_TYPE.NONE
          },
          {
            text = "\227\129\175\227\129\159\227\129\145",
            value = DEBUG_SHOP_PEDDLER_TYPE.FARM
          },
          {
            text = "\227\131\170\227\130\181\227\130\164\227\130\175\227\131\171",
            value = DEBUG_SHOP_PEDDLER_TYPE.RECYLE
          },
          {
            text = "\227\129\143\227\129\152\227\129\179\227\129\141",
            value = DEBUG_SHOP_PEDDLER_TYPE.LOTTERY
          },
          {
            text = "\227\129\155\227\130\147\227\130\130\227\130\147",
            value = DEBUG_SHOP_PEDDLER_TYPE.SPECIAL_MERCHANT
          },
          {
            text = "\227\130\187\227\131\172\227\130\175\227\131\136",
            value = DEBUG_SHOP_PEDDLER_TYPE.SELECT
          },
          {
            text = "\227\130\143\227\129\150\233\129\147\229\160\180",
            value = DEBUG_SHOP_PEDDLER_TYPE.WAZATRAINING
          },
          {
            text = "\227\130\143\227\129\141\227\129\191\227\129\161",
            value = DEBUG_SHOP_PEDDLER_TYPE.SIDEWAY
          }
        })
        menu:AddItemDebugSwitch("\227\129\190\227\129\132\227\129\171\227\129\161\227\129\132\227\130\140\227\129\139\227\129\136", DebugSwitchType.SWITCH_SHOP__PEDDLER_EVERY_DAY_CHANGE, "\227\129\157\227\129\174\227\129\190\227\129\190", "\227\129\190\227\129\132\227\129\171\227\129\161")
        NestMenu_OpenAndCloseWait(menu)
      end
    })
    menu:AddItemDebugSwitch("\227\129\175\227\129\159\227\129\145\227\128\128\227\131\169\227\131\131\227\130\173\227\131\188\227\130\162\227\130\164\227\131\134\227\131\160", DebugSwitchType.SWITCH_SHOP__FARM_LUCKY_ITEM_100PER, "\227\129\157\227\129\174\227\129\190\227\129\190", "\229\135\186\231\143\190\239\188\145\239\188\144\239\188\144\239\188\133")
    menu:AddItemDebugValue("\227\130\143\227\129\141\227\129\191\227\129\161", DebugValueType.VALUE_SHOP__SIDEWAY_TYPE, {
      {
        text = "\227\129\157\227\129\174\227\129\190\227\129\190",
        value = DEBUG_SHOP_SIDEWAY_FLAG.NONE
      },
      {
        text = "\227\129\175\227\129\163\227\129\145\227\130\147",
        value = DEBUG_SHOP_SIDEWAY_FLAG.FING_ALL
      },
      {
        text = "\227\129\156\227\130\147\227\129\139\227\129\132",
        value = DEBUG_SHOP_SIDEWAY_FLAG.OPEN_ALL
      }
    })
    menu:AddItemDebugSwitch("\239\188\179\239\188\168\239\188\175\239\188\176\227\131\149\227\131\173\227\131\188\227\128\128\239\188\169\239\188\166\227\128\128\239\188\164\239\188\165\239\188\162\239\188\181\239\188\167", DebugSwitchType.SWITCH_SHOP__FLOW_SYSTEM_IF_DEBUG, "\227\129\157\227\129\174\227\129\190\227\129\190", "\230\157\161\228\187\182\232\161\168\231\164\186")
    NestMenu_OpenAndCloseWait(menu)
  end
  function forScriptActionTbl:decideAction()
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    menu:SetLayoutRectAndLines(32, 60, 0, 0)
    for k, v in pairs(DebugGroundMenuActionTable) do
      menu:AddItem(v[1], nil, {
        decideAction = function(self)
          v[2]()
        end
      })
    end
    menu:AddItem("\227\130\130\227\129\169\227\130\139", nil, {
      decideAction = function(self)
        self:Close()
      end
    })
    NestMenu_OpenAndCloseWait(menu)
  end
  function toTopMenuActionTbl:decideAction()
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
    menu:AddItem("\227\130\130\227\129\169\227\130\139", nil, nil)
    menu:AddItem("\227\130\132\227\130\129\227\130\139", nil, {
      decideAction = function(self)
        self:Close()
      end
    })
    function menu:decideAction()
      GROUND_DEBUG:GotoTopMenu()
      NestMenu_CloseAllNest(self)
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function otherMenuActionTbl:decideAction()
    local topMenu = menu
    local menu = MENU:CreatePageMenu()
    local nextDayTbl = {}
    local debugMenuSwitchTbl = {}
    local mostTestTbl = {}
    local trigDebugTbl = {}
    local collisionDebugTbl = {}
    local sisaTestTbl = {}
    local paraRankTbl = {}
    local paraPointTbl = {}
    local paraAllTbl = {}
    local paraAllDevelopTbl = {}
    local paraAllFarmTbl = {}
    local paraModeChangeTbl = {}
    local collisionIngoreTbl = {}
    local wallCollisionIngoreTbl = {}
    local debugTracePrintTbl = {}
    local vwaveTbl = {}
    local eazyMultiConnectTbl = {}
    local matchingTestTbl = {}
    local parentMenu = self
    function menu:openedAction()
      parentMenu:SetFrameAlpha(80)
    end
    function menu:closedAction()
      parentMenu:SetFrameAlpha(255)
    end
    NestMenu_SetupDefaultAction(menu, self)
    menu:SetCaption(196777147)
    menu:SetLayoutRectAndLines(self:GetLeft() + 16, 60, 0, 0)
    menu:AddItem(1830032477, nil, nextDayTbl)
    menu:AddItem(1659401917, nil, vwaveTbl)
    menu:AddItem(1669775442, nil, debugMenuSwitchTbl)
    menu:AddItem("\227\130\179\227\131\170\227\130\184\227\131\167\227\131\179\227\130\128\227\129\151\227\131\162\227\131\188\227\131\137", nil, collisionIngoreTbl)
    menu:AddItem("\227\129\139\227\129\185\227\130\179\227\131\170\227\130\184\227\131\167\227\131\179\227\131\162\227\131\188\227\131\137", nil, wallCollisionIngoreTbl)
    menu:AddItem("RANGE\227\129\178\227\130\135\227\129\134\227\129\152", nil, trigDebugTbl)
    menu:AddItem("\227\130\179\227\131\170\227\130\184\227\131\167\227\131\179\227\129\178\227\130\135\227\129\134\227\129\152", nil, collisionDebugTbl)
    menu:AddItem("\232\166\150\229\183\174\227\131\134\227\130\185\227\131\136", nil, sisaTestTbl)
    menu:AddItem("\227\131\135\227\131\144\227\131\131\227\130\176\227\131\136\227\131\172\227\131\188\227\130\185\227\129\151\227\130\133\227\129\164\227\130\138\227\130\135\227\129\143", nil, debugTracePrintTbl)
    menu:AddItem("\227\129\168\227\129\163\227\129\166\227\130\130\227\129\166\227\129\153\227\129\168", nil, mostTestTbl)
    function nextDayTbl:decideAction()
      SYSTEM:UpdateNextDayParameter()
      SYSTEM:GoToMapStartEntry()
    end
    function vwaveTbl:decideAction()
      DEBUG:ResetVWaveForecast()
      groundDebugMenu_PopupResult(self, -526803494)
      self:Close()
    end
    function sisaTestTbl:decideAction()
      local menu = MENU:CreateParameterMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption("[M:KARI]\232\166\150\229\183\174\227\131\134\227\130\185\227\131\136")
      menu:SetLayoutRectAndLines(self:GetLeft() + 16, 80, 0, 0)
      local zoomCheck = function()
        CAMERA:Zoom(Distance(6), TimeSec(0.4), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
        TASK:Sleep(TimeSec(1))
        CAMERA:ZoomReset(TimeSec(0.4), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
      end
      CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
      menu:AddItemI("\232\166\150\229\183\174", ValueParamEx(1, 16, 2), "sisa", nil)
      menu:AddItem("\227\130\186\227\131\188\227\131\160\227\131\129\227\130\167\227\131\131\227\130\175", nil, {decideAction = zoomCheck})
      function menu:decideAction()
        self:Close()
      end
      function menu:currentItemValueChange()
        if self.curItem.obj == "sisa" then
          CAMERA:SetAzimuthDifferenceVolume(Volume(self.curItem.value))
        end
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    function trigDebugTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
      menu:AddItem("ON", true, nil)
      menu:AddItem("OFF", false, nil)
      function menu:decideAction()
        SYSTEM:SetDebugDispTriggerRange(self.curItem.obj)
        self:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    function collisionDebugTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
      menu:AddItem("ON", true, nil)
      menu:AddItem("OFF", false, nil)
      function menu:decideAction()
        GROUND_DEBUG:SetDispCollision(self.curItem.obj)
        self:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    function collisionIngoreTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
      menu:AddItem("\239\188\175\239\188\174", true, nil)
      menu:AddItem("\239\188\175\239\188\166\239\188\166", false, nil)
      function menu:decideAction()
        GROUND_DEBUG:SetIngoreCollision(self.curItem.obj)
        self:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    function wallCollisionIngoreTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
      menu:AddItem("\227\130\134\227\129\134\227\129\147\227\129\134", true, nil)
      menu:AddItem("\227\130\128\227\129\147\227\129\134", false, nil)
      function menu:decideAction()
        GROUND_DEBUG:SetWallCollisionEnable(self.curItem.obj)
        self:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    function debugTracePrintTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
      menu:AddItem("\239\188\175\239\188\174", true, nil)
      menu:AddItem("\239\188\175\239\188\166\239\188\166", false, nil)
      function menu:decideAction()
        if self.curItem.obj then
          SYSTEM:SetDebugLineTraceFunction(CommonSys.GlobalDebugTraceLineFunc)
        else
          SYSTEM:SetDebugLineTraceFunction()
        end
        self:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function paradiseMenuActionTbl:decideAction()
    local menu = MENU:CreatePageMenu()
    local paraRankTbl = {}
    local paraPointTbl = {}
    local paraAllTbl = {}
    local paraAllDevelopTbl = {}
    local paraAllFarmTbl = {}
    local paraModeChangeTbl = {}
    local paraAllBuildTbl = {}
    local paraAddBuildTbl = {}
    local paraAllBrokenTbl = {}
    local paraAllLvUp = {}
    local paraAllColorChangeTbl = {}
    local parentMenu = self
    function menu:openedAction()
      parentMenu:SetFrameAlpha(80)
    end
    function menu:closedAction()
      parentMenu:SetFrameAlpha(255)
    end
    NestMenu_SetupDefaultAction(menu, self)
    menu:SetCaption(239625508)
    menu:SetLayoutRectAndLines(self:GetLeft() + 16, 60, 0, 0)
    menu:AddItem(1487354312, nil, paraAllTbl)
    menu:AddItem(-355343291, nil, paraRankTbl)
    menu:AddItem(-1899757606, nil, paraPointTbl)
    menu:AddItem(1307202230, nil, paraAllDevelopTbl)
    menu:AddItem(-1452438553, nil, paraAllBuildTbl)
    menu:AddItem(-1334396250, nil, paraAddBuildTbl)
    menu:AddItem(702749128, nil, paraAllBrokenTbl)
    menu:AddItem(1189126859, nil, paraAllLvUp)
    menu:AddItem(-936580761, nil, paraAllColorChangeTbl)
    menu:AddItem(-34070296, nil, paraAllFarmTbl)
    function paraAllTbl:decideAction()
      SYSTEM:Debug_SetPointFromParadiseRank(10)
      groundDebugMenu_PopupResult(self, 1169996459)
      local tbl = {
        PARADISE_LAND_INDEX.INDEX_00,
        PARADISE_LAND_INDEX.INDEX_01,
        PARADISE_LAND_INDEX.INDEX_02,
        PARADISE_LAND_INDEX.INDEX_03,
        PARADISE_LAND_INDEX.INDEX_04,
        PARADISE_LAND_INDEX.INDEX_05,
        PARADISE_LAND_INDEX.INDEX_06,
        PARADISE_LAND_INDEX.INDEX_07
      }
      for i, landIdx in ipairs(tbl) do
        GROUND:DevelopParadiseLand(landIdx, PARADISE_LAND_TYPE.PRAIRIE)
      end
      groundDebugMenu_PopupResult(self, 587507295)
      GROUND_DEBUG:ItemWarehouseItemFull(ITEM_KIND.KIND_KENZAI)
      groundDebugMenu_PopupResult(self, 1901492716)
      GROUND:SetPlayerMoney(GROUND:GetPlayerMoneyLimit())
      groundDebugMenu_PopupResult(self, -2027381191)
      self:Close()
    end
    function paraRankTbl:decideAction()
      local menu = MENU:CreateParameterMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetCaption(-355343291)
      menu:SetLayoutRectAndLines(self:GetLeft() + 16, 80, 0, 0)
      menu:AddItemI(-1855247349, ValueParamEx(0, 10, GROUND:GetParadiseRank()), "rank", nil)
      function menu:decideAction()
        SYSTEM:Debug_SetPointFromParadiseRank(self.curItem.value)
        self:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    function paraPointTbl:decideAction()
      local infoMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
      infoMenu:SetLayoutRect(Rectangle(100, 32, 120, 20))
      infoMenu:SetTextOffset(0, 0)
      local rankText = MENU:ReplaceTagText(1784140406)
      infoMenu:SetText(string.format(rankText .. " %d", GROUND_DEBUG:GetNeedParadisePoint()))
      infoMenu:Open()
      ShopSys:DispInputMenu({
        titleText = "\227\131\145\227\131\169\227\131\128\227\130\164\227\130\185\227\131\157\227\130\164\227\131\179\227\131\136",
        digitNum = 6,
        startNum = GROUND_DEBUG:GetNowParadisePoint(),
        maxNum = 99999,
        minNum = 1,
        decideAction = function(num)
          GROUND_DEBUG:SetParadisePoint(num)
          isDecide = true
        end,
        cancelAction = function()
        end,
        changeAction = function(num)
          local diff = num - GROUND_DEBUG:GetNowParadisePoint()
          local nextPoint = GROUND_DEBUG:GetNeedParadisePoint() - diff
          infoMenu:SetText(string.format(rankText .. " %d", nextPoint))
        end
      })
      infoMenu:Close()
      MENU:SetFocus(self)
    end
    function paraAllDevelopTbl:decideAction()
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
      menu:AddItem(625839224, PARADISE_LAND_TYPE.WILDERNESS, nil)
      menu:AddItem(1012317497, PARADISE_LAND_TYPE.PRAIRIE, nil)
      menu:AddItem(393998074, PARADISE_LAND_TYPE.FOREST, nil)
      menu:AddItem(241229755, PARADISE_LAND_TYPE.ROCKY_HILL, nil)
      menu:AddItem(1092700540, PARADISE_LAND_TYPE.WATER, nil)
      function menu:decideAction()
        local tbl = {
          PARADISE_LAND_INDEX.INDEX_00,
          PARADISE_LAND_INDEX.INDEX_01,
          PARADISE_LAND_INDEX.INDEX_02,
          PARADISE_LAND_INDEX.INDEX_03,
          PARADISE_LAND_INDEX.INDEX_04,
          PARADISE_LAND_INDEX.INDEX_05,
          PARADISE_LAND_INDEX.INDEX_06,
          PARADISE_LAND_INDEX.INDEX_07
        }
        for i, landIdx in ipairs(tbl) do
          GROUND:DevelopParadiseLand(landIdx, self.curItem.obj)
        end
        GROUND:SetOpenedDevelopLandBonusLv(99)
        GROUND:SetOpenedBuildShopBonusLv(99)
        self:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    function paraAllBuildTbl:decideAction()
      local shopLabelTbl = {}
      for idx = 0, GROUND:GetLandShopLabelCount() - 1 do
        local shopLabel = GROUND:GetLandShopLabelName(idx)
        if GROUND:IsLandShopLabelBuildOk(shopLabel) then
          table.insert(shopLabelTbl, shopLabel)
        end
      end
      local parentMenu = self
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(32, 60, 0, 0)
      local test_flag
      local farmTbl = {
        "shop_farm_heal",
        "shop_farm_oren",
        "shop_farm_megusuri",
        "shop_farm_fukkatsu",
        "shop_farm_blind",
        "shop_farm_quick",
        "shop_farm_confuse",
        "shop_farm_sleep",
        "shop_farm_warp",
        "shop_farm_blast",
        "shop_farm_kouchoku",
        "shop_farm_jaaku",
        "shop_farm_pure",
        "shop_farm_mougeki",
        "shop_farm_tanren",
        "shop_farm_hagemi"
      }
      local wazaTbl = {
        "shop_wazatraining_normal",
        "shop_wazatraining_fighting",
        "shop_wazatraining_poison",
        "shop_wazatraining_ground",
        "shop_wazatraining_flying",
        "shop_wazatraining_bug",
        "shop_wazatraining_rock",
        "shop_wazatraining_ghost",
        "shop_wazatraining_steel",
        "shop_wazatraining_fire",
        "shop_wazatraining_water",
        "shop_wazatraining_electric",
        "shop_wazatraining_grass",
        "shop_wazatraining_ice",
        "shop_wazatraining_psychic",
        "shop_wazatraining_dragon",
        "shop_wazatraining_dark"
      }
      local miscTbl = {
        "shop_recycle",
        "shop_lottery",
        "shop_select",
        "shop_sideway_guide",
        "shop_jukebox",
        "minigame_salvage",
        "minigame_curling",
        "shop_special_merchant_plant",
        "shop_special_merchant_orb"
      }
      menu:AddItem(-588864944, farmTbl, nil)
      menu:AddItem(-973237487, wazaTbl, nil)
      menu:AddItem(-288309038, miscTbl, nil)
      for i, label in ipairs(shopLabelTbl) do
        menu:AddItem(GROUND:GetLandShopNameTextId(label), label, nil)
      end
      function menu:decideAction()
        local tbl = {
          PARADISE_LAND_INDEX.INDEX_00,
          PARADISE_LAND_INDEX.INDEX_01,
          PARADISE_LAND_INDEX.INDEX_02,
          PARADISE_LAND_INDEX.INDEX_03,
          PARADISE_LAND_INDEX.INDEX_04,
          PARADISE_LAND_INDEX.INDEX_05,
          PARADISE_LAND_INDEX.INDEX_06,
          PARADISE_LAND_INDEX.INDEX_07
        }
        local spaceIdxTbl = {
          PARADISE_SPACE_INDEX.INDEX_00,
          PARADISE_SPACE_INDEX.INDEX_01,
          PARADISE_SPACE_INDEX.INDEX_02,
          PARADISE_SPACE_INDEX.INDEX_03
        }
        local shopLabel = self.curItem.obj
        local cnt = 0
        for i, landIdx in ipairs(tbl) do
          if GROUND:IsDevelopedParadiseLand(landIdx) then
            for i, spaceIdx in ipairs(spaceIdxTbl) do
              if GROUND:IsLandShopExist(landIdx, spaceIdx) == false then
                if type(shopLabel) == "table" then
                  GROUND:BuildLandShop(landIdx, spaceIdx, shopLabel[cnt % #shopLabel + 1])
                else
                  GROUND:BuildLandShop(landIdx, spaceIdx, shopLabel)
                end
                cnt = cnt + 1
              end
            end
          end
        end
        groundDebugMenu_PopupResult(self, 1276177721)
        self:Close()
        parentMenu:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    function paraAddBuildTbl:decideAction()
      local shopLabelTbl = {}
      for idx = 0, GROUND:GetLandShopLabelCount() - 1 do
        local shopLabel = GROUND:GetLandShopLabelName(idx)
        if GROUND:IsLandShopLabelBuildOk(shopLabel) then
          table.insert(shopLabelTbl, shopLabel)
        end
      end
      local parentMenu = self
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(32, 60, 0, 0)
      local test_flag
      for i, label in ipairs(shopLabelTbl) do
        menu:AddItem(GROUND:GetLandShopNameTextId(label), label, nil)
      end
      function menu:decideAction()
        local tbl = {
          PARADISE_LAND_INDEX.INDEX_07,
          PARADISE_LAND_INDEX.INDEX_06,
          PARADISE_LAND_INDEX.INDEX_05,
          PARADISE_LAND_INDEX.INDEX_04,
          PARADISE_LAND_INDEX.INDEX_03,
          PARADISE_LAND_INDEX.INDEX_02,
          PARADISE_LAND_INDEX.INDEX_01,
          PARADISE_LAND_INDEX.INDEX_00
        }
        local spaceIdxTbl = {
          PARADISE_SPACE_INDEX.INDEX_00,
          PARADISE_SPACE_INDEX.INDEX_01,
          PARADISE_SPACE_INDEX.INDEX_02,
          PARADISE_SPACE_INDEX.INDEX_03
        }
        local shopLabel = self.curItem.obj
        local loop_flag = false
        for i, landIdx in ipairs(tbl) do
          if GROUND:IsDevelopedParadiseLand(landIdx) then
            for i, spaceIdx in ipairs(spaceIdxTbl) do
              if loop_flag == false and GROUND:IsLandShopExist(landIdx, spaceIdx) == false then
                GROUND:BuildLandShop(landIdx, spaceIdx, shopLabel)
                loop_flag = true
              end
            end
          end
        end
        if loop_flag == true then
          groundDebugMenu_PopupResult(self, -1754085524)
        else
          groundDebugMenu_PopupResult(self, -1323432287)
          self:Close()
        end
      end
      NestMenu_OpenAndCloseWait(menu)
    end
    function paraAllBrokenTbl:decideAction()
      local tbl = {
        PARADISE_LAND_INDEX.INDEX_00,
        PARADISE_LAND_INDEX.INDEX_01,
        PARADISE_LAND_INDEX.INDEX_02,
        PARADISE_LAND_INDEX.INDEX_03,
        PARADISE_LAND_INDEX.INDEX_04,
        PARADISE_LAND_INDEX.INDEX_05,
        PARADISE_LAND_INDEX.INDEX_06,
        PARADISE_LAND_INDEX.INDEX_07
      }
      local spaceIdxTbl = {
        PARADISE_SPACE_INDEX.INDEX_00,
        PARADISE_SPACE_INDEX.INDEX_01,
        PARADISE_SPACE_INDEX.INDEX_02,
        PARADISE_SPACE_INDEX.INDEX_03
      }
      for i, landIdx in ipairs(tbl) do
        if GROUND:IsDevelopedParadiseLand(landIdx) then
          for i, spaceIdx in ipairs(spaceIdxTbl) do
            if GROUND:IsLandShopExist(landIdx, spaceIdx) then
              GROUND:BrokenLandShop(landIdx, spaceIdx)
            end
          end
        end
      end
      groundDebugMenu_PopupResult(self, 1181507662)
      self:Close()
    end
    function paraAllLvUp:decideAction()
      local tbl = {
        PARADISE_LAND_INDEX.INDEX_00,
        PARADISE_LAND_INDEX.INDEX_01,
        PARADISE_LAND_INDEX.INDEX_02,
        PARADISE_LAND_INDEX.INDEX_03,
        PARADISE_LAND_INDEX.INDEX_04,
        PARADISE_LAND_INDEX.INDEX_05,
        PARADISE_LAND_INDEX.INDEX_06,
        PARADISE_LAND_INDEX.INDEX_07
      }
      local spaceIdxTbl = {
        PARADISE_SPACE_INDEX.INDEX_00,
        PARADISE_SPACE_INDEX.INDEX_01,
        PARADISE_SPACE_INDEX.INDEX_02,
        PARADISE_SPACE_INDEX.INDEX_03
      }
      for i, landIdx in ipairs(tbl) do
        if GROUND:IsDevelopedParadiseLand(landIdx) then
          for i, spaceIdx in ipairs(spaceIdxTbl) do
            if GROUND:IsLandShopExist(landIdx, spaceIdx) and GROUND:IsLandShopExtendOk(landIdx, spaceIdx) then
              GROUND:ExtendLandShop(landIdx, spaceIdx)
            end
          end
        end
      end
      self:Close()
    end
    function paraAllColorChangeTbl:decideAction()
      local colorList = {}
      for colorLabel in GROUND:EnumerateColorChengeOkLabel(PARADISE_COLOR_CHANGE_TYPE.FARM) do
        local sortPrio = GROUND:GetLandShopSortPrio(colorLabel)
        table.insert(colorList, {
          label = colorLabel,
          sortPrio = sortPrio,
          isFarm = true
        })
      end
      for colorLabel in GROUND:EnumerateColorChengeOkLabel(PARADISE_COLOR_CHANGE_TYPE.SHOP) do
        local sortPrio = GROUND:GetLandShopSortPrio(colorLabel)
        table.insert(colorList, {
          label = colorLabel,
          sortPrio = sortPrio,
          isFarm = false
        })
      end
      local parentMenu = self
      local menu = MENU:CreatePageMenu()
      local hatakeText = MENU:ReplaceTagText(1428786885)
      local shopText = MENU:ReplaceTagText(1278394244)
      NestMenu_SetupDefaultAction(menu, self)
      menu:SetLayoutRectAndLines(32, 60, 0, 0)
      for i, color in ipairs(colorList) do
        menu:AddItem(MENU:ReplaceTagText(GROUND:GetLandShopNameTextId(color.label)) .. (color.isFarm and hatakeText or shopText), color, nil)
      end
      function menu:decideAction()
        local tbl = {
          PARADISE_LAND_INDEX.INDEX_00,
          PARADISE_LAND_INDEX.INDEX_01,
          PARADISE_LAND_INDEX.INDEX_02,
          PARADISE_LAND_INDEX.INDEX_03,
          PARADISE_LAND_INDEX.INDEX_04,
          PARADISE_LAND_INDEX.INDEX_05,
          PARADISE_LAND_INDEX.INDEX_06,
          PARADISE_LAND_INDEX.INDEX_07
        }
        local spaceIdxTbl = {
          PARADISE_SPACE_INDEX.INDEX_00,
          PARADISE_SPACE_INDEX.INDEX_01,
          PARADISE_SPACE_INDEX.INDEX_02,
          PARADISE_SPACE_INDEX.INDEX_03
        }
        local colorLabel = self.curItem.obj.label
        local isFarm = self.curItem.obj.isFarm
        local cnt = 0
        for i, landIdx in ipairs(tbl) do
          if GROUND:IsDevelopedParadiseLand(landIdx) then
            for i, spaceIdx in ipairs(spaceIdxTbl) do
              if GROUND:IsLandShopExist(landIdx, spaceIdx) and GROUND:IsLandShopChangeColorOk(landIdx, spaceIdx) then
                local shopLabel = GROUND:GetLandShopLabel(landIdx, spaceIdx)
                local shopLevel = GROUND:GetLandShopLevel(landIdx, spaceIdx)
                local graphicLabel = GROUND:GetLandShopGraphicLabel(shopLabel, shopLevel)
                local colorChangeType
                if graphicLabel == "PARA_SHOP_FARM_1" or graphicLabel == "PARA_SHOP_FARM_2" then
                  if isFarm == true then
                    GROUND:ChangeColorLandShop(landIdx, spaceIdx, colorLabel)
                  end
                elseif isFarm == false then
                  GROUND:ChangeColorLandShop(landIdx, spaceIdx, colorLabel)
                end
                cnt = cnt + 1
              end
            end
          end
        end
        groundDebugMenu_PopupResult(self, 1929279050)
        self:Close()
        parentMenu:Close()
      end
      NestMenu_OpenAndCloseWait(menu)
      self:Close()
    end
    function paraAllFarmTbl:decideAction()
      local tbl = {
        PARADISE_LAND_INDEX.INDEX_00,
        PARADISE_LAND_INDEX.INDEX_01,
        PARADISE_LAND_INDEX.INDEX_02,
        PARADISE_LAND_INDEX.INDEX_03,
        PARADISE_LAND_INDEX.INDEX_04,
        PARADISE_LAND_INDEX.INDEX_05,
        PARADISE_LAND_INDEX.INDEX_06,
        PARADISE_LAND_INDEX.INDEX_07
      }
      local spaceIdxTbl = {
        PARADISE_SPACE_INDEX.INDEX_00,
        PARADISE_SPACE_INDEX.INDEX_01,
        PARADISE_SPACE_INDEX.INDEX_02,
        PARADISE_SPACE_INDEX.INDEX_03
      }
      local bFirst = true
      for i, landIdx in ipairs(tbl) do
        if GROUND:IsDevelopedParadiseLand(landIdx) then
          for i, spaceIdx in ipairs(spaceIdxTbl) do
            if GROUND:IsLandShopExist(landIdx, spaceIdx) == false then
              if bFirst then
                bFirst = false
              else
                GROUND:BuildLandShop(landIdx, spaceIdx, "shop_farm_oren")
              end
            end
          end
        end
      end
      groundDebugMenu_PopupResult(self, -1420438788)
      self:Close()
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function soundTestActionTbl:decideAction()
    DEBUG:SoundTest()
    MENU:SetFocus(self)
  end
  function questTestActionTbl:decideAction()
    local mainMenu = self
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    local questActionTbl = {}
    menu:SetCaption(-1425251556)
    menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
    menu:AddItem(748023931, OpenAddQuestMenu_Test, questActionTbl)
    menu:AddItem(-78355339, nil, {
      decideAction = function(self)
        self:Close()
      end
    })
    function questActionTbl:decideAction()
      self:SetVisible(false)
      mainMenu:SetVisible(false)
      local openFunc = self.curItem.obj
      openFunc()
      MENU:SetFocus(self)
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    function questActionTbl:forceClosedAction()
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    function questActionTbl:errClosedAction()
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function dungeonDiverTestActionTbl:decideAction()
    local mainMenu = self
    mainMenu:SetVisible(false)
    OpenMinigameDungeonDiverDebugMenu()
    MENU:SetFocus(self)
    mainMenu:SetVisible(true)
  end
  function cecTestActionTbl:decideAction()
    local mainMenu = self
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    local cecSystemActionTbl = {}
    menu:SetCaption(904170038)
    menu:SetLayoutRectAndLines(self:GetRight() + 16 - 32, 60, 0, 0)
    menu:AddItem(-133316039, OpenCecSystemMenu_Test, cecSystemActionTbl)
    menu:AddItem(-518589576, OpenStrangePost_Debug, cecSystemActionTbl)
    menu:AddItem(150183123, nil, {
      decideAction = function(self)
        self:Close()
      end
    })
    function cecSystemActionTbl:decideAction()
      self:SetVisible(false)
      mainMenu:SetVisible(false)
      local openFunc = self.curItem.obj
      openFunc()
      MENU:SetFocus(self)
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    function cecSystemActionTbl:forceClosedAction()
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    function cecSystemActionTbl:errClosedAction()
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function dungeonEnterActionTbl:decideAction()
    local mainMenu = self
    local menu = MENU:CreatePageMenu()
    NestMenu_SetupDefaultAction(menu, self)
    local dgEnterActionTbl = {}
    menu:SetLayoutRectAndLines(12, 32, 0, 10)
    menu:ShowPageNum(true)
    menu:SetCaption(-876634163)
    for idx = 1, GROUND:GetDungeonCount() - 1 do
      local dgIndex = GROUND:GetDungeonIndex(idx)
      MENU:SetTag_DungeonIndex(0, dgIndex, DungeonNameType.FULL_KANA)
      local dgName = MENU:ReplaceTagText(string.format("%02d[st_dungeon:0]", dgIndex))
      if GROUND:IsDungeonOpen(dgIndex) then
        dgName = dgName .. " \226\128\166 open"
      elseif GROUND:IsInvisbleDungeon(dgIndex) then
        dgName = dgName .. " \226\128\166 invi"
      else
        dgName = dgName .. " \226\128\166 [CS:Q]close![CR]"
      end
      local flowNo = FUNC_COMMON:GetDungeonFlowTypeNo(dgIndex)
      if flowNo ~= 0 then
        dgName = dgName .. " \226\128\166 [CS:H]\227\129\175\227\130\147\227\130\136\227\129\134[CR]"
      end
      menu:AddItem(MENU:ReplaceTagText(dgName), dgIndex, dgEnterActionTbl)
    end
    menu:AddItem(-1159415721, nil, {
      decideAction = function()
        for idx = 1, GROUND:GetDungeonCount() - 1 do
          local dgIndex = GROUND:GetDungeonIndex(idx)
          GROUND:SetDungeonOpen(dgIndex)
        end
        SYSTEM:UpdateNextDayParameter()
        FLAG.MapFlags = CONST.MAP_CROSSROAD
        SYSTEM:NextMapEntry(CONST.MAP_PARA_CENTER)
      end
    })
    menu:AddItem(295918648, nil, {
      decideAction = function(self)
        self:Close()
      end
    })
    function dgEnterActionTbl:decideAction()
      self:SetVisible(false)
      mainMenu:SetVisible(false)
      if LUA_SYSTEM:CheckPreEnterDlcDungeon(Dg(self.curItem.obj)) == false then
        WINDOW:SysMsg(-337590048)
        WINDOW:CloseMessage()
        MENU:SetFocus(self)
        self:SetVisible(true)
        mainMenu:SetVisible(true)
        return
      end
      GROUND:SetDungeonOpen(self.curItem.obj)
      SYSTEM:EnterDungeon(Dg(self.curItem.obj))
      MENU:SetFocus(self)
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    function dgEnterActionTbl:forceClosedAction()
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    function dgEnterActionTbl:errClosedAction()
      mainMenu:SetVisible(true)
      self:SetVisible(true)
    end
    function menu:inputYSelectAction()
      local dgIndex = self.curItem.obj
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      local dlcActionTbl = {}
      menu:SetLayoutRectAndLines(16, 60, 0, 0)
      menu:AddItem(-1250785073, nil, {
        decideAction = function(self)
          local menu = MENU:CreateParameterMenu()
          NestMenu_SetupDefaultAction(menu, self)
          menu:SetCaption(-1284705310)
          menu:SetLayoutRectAndLines(self:GetLeft() + 16, 80, 0, 0)
          menu:AddItemI(725925442, ValueParamEx(0, 5, GROUND_DEBUG:GetDungeonMysteryPoint(dgIndex)), "husigi", nil)
          function menu:decideAction()
            GROUND_DEBUG:SetDungeonMysteryPoint(dgIndex, self.curItem.value)
            self:Close()
          end
          NestMenu_OpenAndCloseWait(menu)
        end
      })
      menu:AddItem(1541838876, nil, {
        decideAction = function(self)
          self:Close()
        end
      })
      NestMenu_OpenAndCloseWait(menu)
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  function dlcListActionTbl:decideAction()
    GROUND_DEBUG:UpdateDlcTitle()
    local mainMenu = self
    local menu = MENU:CreatePageMenu()
    menu:SetOption({multiSelectable = true})
    NestMenu_SetupDefaultAction(menu, self)
    local dlcActionTbl = {}
    menu:SetLayoutRectAndLines(16, 60, 0, 0)
    menu:ShowPageNum(true)
    local getName = function(dlcIdx)
      local text = string.format("%03d.", dlcIdx)
      local name = GROUND_DEBUG:GetDlcName(dlcIdx)
      if #name ~= 0 then
        return text .. name
      end
      local eText = MENU:ReplaceTagText(1485575634)
      return text .. eText
    end
    for dlcIdx = 1, 102 do
      menu:AddItem(getName(dlcIdx), dlcIdx, dlcActionTbl)
    end
    function dlcActionTbl:decideAction()
      local selSet = {}
      if self:IsMultiSelect() then
        selSet = {}
        for dlcIdx in menu:EnumerateSelectedItems() do
          table.insert(selSet, dlcIdx)
        end
      else
        selSet = {
          self.curItem.obj
        }
      end
      local parentMenu = menu
      local menu = MENU:CreatePageMenu()
      NestMenu_SetupDefaultAction(menu, self)
      local dlcActionTbl = {}
      menu:SetLayoutRectAndLines(self:GetRight() + 16, 60, 0, 0)
      menu:AddItem(-1439362603, nil, {
        decideAction = function()
          for i, dlcIdx in ipairs(selSet) do
            parentMenu:SetCurrentModifyItem(dlcIdx - 1)
            if GROUND_DEBUG:CheckDlc(dlcIdx) then
              parentMenu.curItem.text = getName(dlcIdx) .. " [CS:H]OK![CR]"
            else
              parentMenu.curItem.text = getName(dlcIdx) .. " [CS:Q]Data Error![CR]"
            end
            TASK:Sleep(TimeSec(0))
            parentMenu:ClearMultiSelect(dlcIdx - 1)
          end
        end
      })
      menu:AddItem(-1288822636, nil, {
        decideAction = function()
          for i, dlcIdx in ipairs(selSet) do
            GROUND_DEBUG:DeleteDlc(dlcIdx)
            parentMenu:SetCurrentModifyItem(dlcIdx - 1)
            parentMenu.curItem.text = 1047276818
            TASK:Sleep(TimeSec(0))
            parentMenu:ClearMultiSelect(dlcIdx - 1)
          end
          GROUND_DEBUG:UpdateDlcTitle()
        end
      })
      menu:AddItem(-1744604329, nil, {
        decideAction = function(self)
          self:Close()
        end
      })
      NestMenu_OpenAndCloseWait(menu)
    end
    NestMenu_OpenAndCloseWait(menu)
  end
  local lastVisible = LOWER_SCREEN:IsVisible()
  LOWER_SCREEN:SetVisible(false)
  NestMenu_OpenAndCloseWait(menu)
  LOWER_SCREEN:SetVisible(lastVisible)
end
function OpenDlcInfoMenu()
  local dlcInfoMenu = {}
  function dlcInfoMenu:Open()
    self.infoMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
    local w = 368
    self.infoMenu:SetLayoutRect(Rectangle((400 - w) / 2, 16, w, 160))
    self.infoMenu:SetTextOffset(0, 0)
    self.infoMenu:SetText("[VO:72][HO:64][LINE:0:15]")
    self.infoMenu:SetOption({
      frameMode = FrameMode.HINT_OPAQUE
    })
    self.infoMenu:Open()
    self.infoMoneyMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
    local w = 320
    self.infoMoneyMenu:SetLayoutRect(Rectangle((400 - w) / 2, 200, w, 24))
    self.infoMoneyMenu:SetTextOffset(0, 0)
    self.infoMoneyMenu:SetOption({
      frameMode = FrameMode.HINT_OPAQUE
    })
    self.infoMoneyMenu:SetText("")
    self.infoMoneyMenu:Open()
    local pokemonIndex = 30
    self.faceMenu = MENU:CreateFaceMenuWindow(ScreenType.A)
    self.faceMenu:SetFacePos(28, 32)
    self.faceMenu:SetPokemonIndex(pokemonIndex)
    self.faceMenu:SetFaceType(FACE_TYPE.NORMAL)
    self.faceMenu:Open()
    self.infoTitleMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
    self.infoTitleMenu:SetLayoutRect(Rectangle(0, 0, 400, 240))
    self.infoTitleMenu:SetTextOffset(96, 32)
    self.infoTitleMenu:SetOption({font = "FONT_16", showBgFrame = false})
    self.infoTitleMenu:SetText("")
    self.infoTitleMenu:Open()
    self.infoExpMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
    self.infoExpMenu:SetLayoutRect(Rectangle(0, 0, 400, 240))
    self.infoExpMenu:SetTextOffset(96, 48)
    self.infoExpMenu:SetOption({font = "FONT_12", showBgFrame = false})
    self.infoExpMenu:SetText("")
    self.infoExpMenu:Open()
    self.infoReleaseMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
    self.infoReleaseMenu:SetLayoutRect(Rectangle(0, 0, 320, 240))
    self.infoReleaseMenu:SetTextOffset(128, 112)
    self.infoReleaseMenu:SetOption({font = "FONT_12", showBgFrame = false})
    self.infoReleaseMenu:SetText("")
    self.infoReleaseMenu:Open()
  end
  function dlcInfoMenu:Close()
    self.infoMenu:Close()
    self.faceMenu:Close()
    self.infoMoneyMenu:Close()
    self.infoTitleMenu:Close()
    self.infoReleaseMenu:Close()
    self.infoExpMenu:Close()
  end
  function dlcInfoMenu:SetTexts(textTbl)
    self.infoTitleMenu:SetText(textTbl.title)
    self.infoExpMenu:SetText(textTbl.exp)
    self.infoReleaseMenu:SetText(textTbl.release)
    self.infoMoneyMenu:SetText(textTbl.money)
  end
  dlcInfoMenu:Open()
  return dlcInfoMenu
end
function MeroTest01()
  subFreePlayReachCommonAll()
  local result = subUsuComFuncTalkInBase01(CH("MEROETTA_VOICE"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("MEROETTA_VOICE"):SetManpu("MP_EXCLAMATION")
  CH("MEROETTA_VOICE"):WaitManpu()
  CH("MEROETTA_STEP"):SetVisible(false)
  CH("MEROETTA_VOICE"):SetVisible(true)
  CH("MEROETTA_STEP"):SetMotion(SymMot("WAIT02"), LOOP.OFF)
  TASK:Sleep(TimeSec(1.5))
  CH("MEROETTA_VOICE"):SetVisible(false)
  CH("MEROETTA_STEP"):SetVisible(true)
end

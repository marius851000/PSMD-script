ResidentMenuTable = {
  {
    isReload = true,
    src = "script/menu/menu_common.lua"
  },
  {
    isReload = false,
    src = "script/menu/menu_common_flowSys.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_new_dungeon.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_new_ground.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_item_bag.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_boss_event.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_common.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_main.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_cafe.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_chest.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_ingot.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_majin.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_mansion.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_merchant.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_perippaa.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_rankup.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_shinka.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_voyage.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_shop_waza.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_numric.lua"
  },
  {
    isReload = true,
    src = "script/menu/lower_screen_dungeon.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_cec_debug.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_order_overflow.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_initialize.lua"
  },
  {
    isReload = true,
    src = "script/menu/menu_guide_map.lua"
  },
  {
    isReload = true,
    src = "script/usual/quest/quest_production.lua"
  },
  {
    isReload = true,
    src = "script/usual/quest/quest_scene.lua"
  },
  {
    isReload = true,
    src = "script/usual/quest/quest_scene_errand.lua"
  },
  {
    isReload = true,
    src = "script/usual/quest/quest_scene_judge.lua"
  },
  {
    isReload = true,
    src = "script/usual/quest/quest_scene_rescue.lua"
  },
  {
    isReload = true,
    src = "script/usual/quest/quest_scene_challenger.lua"
  },
  {
    isReload = true,
    src = "script/usual/quest/quest_scene_search_item.lua"
  },
  {
    isReload = true,
    src = "script/usual/quest/quest_scene_defeat.lua"
  },
  {
    isReload = true,
    src = "script/usual/talk/talk_main.lua"
  },
  {
    isReload = true,
    src = "script/usual/talk/talk_scene.lua"
  },
  {
    isReload = true,
    src = "script/usual/talk/talk_production.lua"
  }
}
if SYSTEM:IsBuildFinal() == false then
  table.insert(ResidentMenuTable, {
    isReload = true,
    src = "script/menu/menu_dungeon_debug_play.lua"
  })
  table.insert(ResidentMenuTable, {
    isReload = true,
    src = "script/menu/menu_waza_viewer.lua"
  })
end
NonResidentMenuTable = {
  {
    func = "OpenGroundCharaSelectFlow",
    src = "script/menu/menu_ground_chara_select.lua"
  },
  {
    func = "OpenGroundCharaSelectNameInputFlow",
    src = "script/menu/menu_ground_chara_select.lua"
  },
  {
    func = "OpenExampleShopMenu",
    src = "script/menu/menu_shop_example.lua"
  },
  {
    func = "OpenShopMerchantMenu",
    src = "script/menu/menu_shop_merchant.lua"
  },
  {
    func = "OpenPeddlerShopMenu",
    src = "script/menu/menu_shop_peddler.lua"
  },
  {
    func = "OpenWarehouseBankMenu",
    src = "script/menu/menu_shop_warehouse.lua"
  },
  {
    func = "OpenShopSpecialMerchantMenu",
    src = "script/menu/menu_shop_special_merchant.lua"
  },
  {
    func = "OpenParadiseHome_HenseiMenuLv1",
    src = "script/menu/menu_shop_formation_factor.lua"
  },
  {
    func = "OpenParadiseHome_HenseiMenuLv2",
    src = "script/menu/menu_shop_formation_factor.lua"
  },
  {
    func = "OpenShopSpecialproductMenu",
    src = "script/menu/menu_shop_special_product.lua"
  },
  {
    func = "OpenBrokenSelectShopMenu",
    src = "script/menu/menu_shop_select.lua"
  },
  {
    func = "OpenShopSelectMenu",
    src = "script/menu/menu_shop_select.lua"
  },
  {
    func = "SelectShopClose",
    src = "script/menu/menu_shop_select.lua"
  },
  {
    func = "OpenRecycleMenu",
    src = "script/menu/menu_shop_recycle.lua"
  },
  {
    func = "OpenLotteryMenu",
    src = "script/menu/menu_shop_lottery.lua"
  },
  {
    func = "OpenLotteryNextDay",
    src = "script/menu/menu_shop_lottery.lua"
  },
  {
    func = "OpenTreasureMenu",
    src = "script/menu/menu_shop_treasure.lua"
  },
  {
    func = "OpenDigMenuOutSide",
    src = "script/menu/menu_shop_dig.lua"
  },
  {
    func = "OpenDigMenuInSide",
    src = "script/menu/menu_shop_dig.lua"
  },
  {
    func = "OpenGiftShopMenu",
    src = "script/menu/menu_shop_gift.lua"
  },
  {
    func = "OpenJudgmentShopMenu",
    src = "script/menu/menu_shop_chest.lua"
  },
  {
    func = "OpenJukeboxShopMenu",
    src = "script/menu/menu_shop_jukebox.lua"
  },
  {
    func = "OpenShopWAZATrainingMenu",
    src = "script/menu/menu_shop_wazatraining.lua"
  },
  {
    func = "OpenShopSideWayGuideMenu",
    src = "script/menu/menu_shop_sideway_guide.lua"
  },
  {
    func = "OpenShopFarmMenu",
    src = "script/menu/menu_shop_farm.lua"
  },
  {
    func = "OpenGoldIngotShopMenu",
    src = "script/menu/menu_shop_ingot.lua"
  },
  {
    func = "OpenCarpenterShopMenu",
    src = "script/menu/menu_shop_carpenter.lua"
  },
  {
    func = "OpenWAZAShopMenu",
    src = "script/menu/menu_shop_waza.lua"
  },
  {
    func = "OpenVrouletteShopMenu",
    src = "script/menu/menu_shop_v_roulette.lua"
  },
  {
    func = "OpenVWaveReportFlow",
    src = "script/menu/menu_shop_v_wave_report.lua"
  },
  {
    func = "OpenParadiseLand_SignboardMenu",
    src = "script/menu/menu_shop_signboard.lua"
  },
  {
    func = "OpenTestTakahashiMenu",
    src = "script/menu/menu_test_takahashi.lua"
  },
  {
    func = "OpenTestShinkawaMenu",
    src = "script/menu/menu_test_shinkawa.lua"
  },
  {
    func = "OpenTestKojimaMenu",
    src = "script/menu/menu_test_kojima.lua"
  },
  {
    func = "OpenTestKojimaMenu2",
    src = "script/menu/menu_test_kojima2.lua"
  },
  {
    func = "OpenStrangePostMenu",
    src = "script/menu/menu_strange_post.lua"
  },
  {
    func = "OpenStrangePost_Debug",
    src = "script/menu/menu_strange_post.lua"
  },
  {
    func = "OpenFriendGateMenu",
    src = "script/menu/menu_friend_gate.lua"
  },
  {
    func = "OpenGroundEnterDungeonMenu",
    src = "script/menu/menu_ground_dungeon_enter.lua"
  },
  {
    func = "OpenPassingCommunicationMenu",
    src = "script/menu/menu_passing_communication.lua"
  },
  {
    func = "OpenPassingCommunicationMenu_Win",
    src = "script/menu/menu_passing_communication.lua"
  },
  {
    func = "OpenInterruptGroundDebugMenu",
    src = "script/menu/menu_ground_debug.lua",
    withFullGc = true
  },
  {
    func = "OpenGroundDebugMenu",
    src = "script/menu/menu_ground_debug.lua",
    withFullGc = true
  },
  {
    func = "OpenGroundDebugMenuForTopMenu",
    src = "script/menu/menu_ground_debug.lua",
    withFullGc = true
  },
  {
    func = "OpenDebugSwitchMenu",
    src = "script/menu/menu_ground_debug.lua",
    withFullGc = true
  },
  {
    func = "TopMenu_Main",
    src = "script/menu/menu_top.lua"
  },
  {
    func = "TopMenu_DeleteSave",
    src = "script/menu/menu_top.lua"
  },
  {
    func = "OpenGroundToParadiseFlow",
    src = "script/menu/menu_ground_mode_change.lua"
  },
  {
    func = "DungeonToParadiseMenu",
    src = "script/menu/menu_ground_mode_change.lua"
  },
  {
    func = "OpenReturnParadiseMenu",
    src = "script/menu/menu_ground_mode_change.lua"
  },
  {
    func = "OpenDungeonDebugMenu",
    src = "script/menu/menu_dungeon_debug.lua"
  },
  {
    func = "OpenGameMenuPasswordMenu",
    src = "script/menu/menu_gamemenu_password.lua"
  },
  {
    func = "OpenGroundMaterialList",
    src = "script/menu/menu_ground_material_list.lua"
  },
  {
    func = "DispSelectColorMenu",
    src = "script/menu/menu_shop_main_material_menu.lua"
  },
  {
    func = "DispSelectLandTypeMenu",
    src = "script/menu/menu_shop_main_material_menu.lua"
  },
  {
    func = "DispBuildSelectMenu",
    src = "script/menu/menu_shop_main_material_menu.lua"
  },
  {
    func = "OpenParadiseRankUpMenu",
    src = "script/menu/menu_shop_main_material_menu.lua"
  },
  {
    func = "DispLeaderPokemonSelectMenu",
    src = "script/menu/menu_shop_main_pokemon_select_menu.lua"
  },
  {
    func = "DispMemberPokemonSelectMenu",
    src = "script/menu/menu_shop_main_pokemon_select_menu.lua"
  },
  {
    func = "OpenMinigameSalvageMenu",
    src = "script/menu/menu_minigame_salvage.lua"
  },
  {
    func = "OpenMinigameSalvageDebugMenu",
    src = "script/menu/menu_minigame_salvage.lua"
  },
  {
    func = "OpenMinigameHockeyMenu",
    src = "script/menu/menu_minigame_hockey.lua"
  }
}
for k, v in ipairs(ResidentMenuTable) do
  dofile(v.src)
end
for k, v in ipairs(NonResidentMenuTable) do
  do
    local makeVariableArgs = function(args)
      local argNum = #args
      if argNum == 0 then
        return
      elseif argNum == 1 then
        return args[1]
      elseif argNum == 2 then
        return args[1], args[2]
      elseif argNum == 3 then
        return args[1], args[2], args[3]
      elseif argNum == 4 then
        return args[1], args[2], args[3], args[4]
      elseif argNum == 5 then
        return args[1], args[2], args[3], args[4], args[5]
      elseif argNum == 6 then
        return args[1], args[2], args[3], args[4], args[5], args[6]
      elseif argNum == 7 then
        return args[1], args[2], args[3], args[4], args[5], args[6], args[7]
      elseif argNum == 8 then
        return args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]
      elseif argNum == 9 then
        return args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]
      else
        assert(nil, "\229\188\149\230\149\176\227\129\140\229\164\154\227\129\153\227\129\142\227\129\190\227\129\153")
      end
    end
    local function f(...)
      local args = {
        ...
      }
      local ret
      MENU:CallLuaFunctionWithLuaGlobalEnvGuard(function()
        local tmp = f
        local srcTbl
        if type(v.src) == "table" then
          srcTbl = v.src
        else
          srcTbl = {
            v.src
          }
        end
        local loadedTbl = {}
        for i, src in ipairs(srcTbl) do
          dofile(src)
        end
        if f ~= getfenv(1)[v.func] then
          ret = getfenv(1)[v.func](makeVariableArgs(args))
        else
          SYSTEM:DebugPrint(string.format("%s \227\129\171 %s \227\129\140\227\129\191\227\129\164\227\129\139\227\130\137\227\129\170\227\129\132\227\130\136\227\129\134\227\129\167\227\129\153", srcTbl[1], v.func))
        end
      end)
      if v.withFullGc then
        collectgarbage("collect")
      end
      return ret
    end
    _G[v.func] = f
    getfenv(0)[v.func] = f
  end
end
function MenuScriptReloadFunc()
  SYSTEM:DebugPrint(string.format("%s %s", tostring(getfenv(0)), tostring(getfenv(1))))
  for k, v in ipairs(ResidentMenuTable) do
    if v.isReload then
      MENU:DebugReloadMenuScript(v.src)
    end
  end
end
function MenuAction_AddPost(menu, actionName, actionFunc)
  if menu[actionName] ~= nil then
    do
      local actionFuncPre = menu[actionName]
      menu[actionName] = function(self)
        actionFuncPre(self)
        actionFunc(self)
      end
    end
  else
    menu[actionName] = actionFunc
  end
end
function MenuAction_AddPre(menu, actionName, actionFunc)
  if menu[actionName] ~= nil then
    do
      local actionFuncPre = menu[actionName]
      menu[actionName] = function(self)
        actionFuncPre(self)
        actionFunc(self)
      end
    end
  else
    menu[actionName] = actionFunc
  end
end
function NestMenu_SetupDefaultAction(menu, parentNestMenu, hideFlag)
  local decideAction = function(self)
  end
  local cancelAction = function(self)
    self:Close()
  end
  local abortFocusAction = function(self)
    self:NotifyForceClose()
  end
  local function closedAction(self)
    SYSTEM:DebugPrint("closedAction type:" .. type(self))
    if self:IsForceClosed() then
      if parentNestMenu ~= nil and not parentNestMenu:IsFocus() then
        parentNestMenu:NotifyForceClose()
      end
    elseif parentNestMenu ~= nil then
      MENU:SetFocus(parentNestMenu)
      if hideFlag then
        parentNestMenu:SetVisible(true)
      end
      if menu.LuaExt_ParentClose then
        parentNestMenu.LuaExt_ParentClose = true
        parentNestMenu:Close()
      end
    end
  end
  MenuAction_AddPost(menu, "decideAction", decideAction)
  MenuAction_AddPost(menu, "cancelAction", cancelAction)
  MenuAction_AddPost(menu, "abortFocusAction", abortFocusAction)
  MenuAction_AddPost(menu, "closedAction", closedAction)
  if hideFlag then
    parentNestMenu:SetVisible(false)
  end
end
function NestMenu_OpenAndCloseWait(menu)
  menu:Open()
  MENU:SetFocus(menu)
  MENU:WaitClose(menu)
end
function NestMenu_CloseWait(menu)
  MENU:SetFocus(menu)
  MENU:WaitClose(menu)
end
function NestMenu_CloseAllNest(menu)
  menu.LuaExt_ParentClose = true
  menu:Close()
end
function BasicMenu_OpenAndCloseWait(menu)
  menu:Open()
  MENU:SetFocus(menu)
  MENU:WaitClose(menu)
end
function DumpResistry()
  SYSTEM:DebugPrint("-------------------------------")
  local count = 0
  for i, v in pairs(debug.getregistry().tolua_gc) do
    count = count + 1
  end
  local count1 = 0
  for i, v in pairs(debug.getregistry()) do
    if type(i) ~= "number" then
      count1 = count1 + 1
    end
  end
  SYSTEM:DebugPrint("-------------------------------")
  SYSTEM:DebugPrint(tostring(count))
  SYSTEM:DebugPrint(tostring(count1))
end
function BasicMenu_Finalize(menu)
  if menu then
    for i, v in pairs(getmetatable(menu)) do
      if type(v) == "function" then
        if string.sub(i, 1, 2) ~= "__" and string.sub(i, 1, 1) ~= "." and i ~= "new" and i ~= "new_local" then
          menu[i] = nil
        end
      else
        menu[i] = nil
      end
    end
  end
end
function ActionGen_CloseSelf()
  local f = function(self)
    self:Close()
  end
  return f
end
function ActionGen_ClearFocus(focusGroupName)
  if focusGroupName == nil then
    focusGroupName = ""
  end
  local function f(self)
    MENU:ClearFocus(focusGroupName)
  end
  return f
end

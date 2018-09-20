dofile("script/include/inc_usual.lua")
LUA_SYSTEM = {}
function LUA_SYSTEM:CheckKenzai_DotekkotsuFirst()
  for itemIndex in GROUND:EnumerateItemWarehouseItemIndex() do
    if itemIndex == ITEM_INDEX_KENZAI_TSURU_B then
      return true
    end
  end
  return false
end
function LUA_SYSTEM:ConsumePayKenzai_DotekkotsuFirst()
  GROUND:ConsumeItemFromBagAndWarehouse(ITEM_INDEX_KENZAI_TSURU_B, 1)
end
function LUA_SYSTEM:CheckKenzai_MusicParadise()
  if GROUND:IsLandShopDevelopMaterialOk("shop_jukebox", 0) == false then
    return false
  end
  if GROUND:IsLandShopDevelopMoneyOk("shop_jukebox", 0) == false then
    return false
  end
  return true
end
function LUA_SYSTEM:BuildMeroetta_MusicParadise()
  GROUND:PaymentDevelopLandShop("shop_jukebox", 0)
  GROUND:BuildLandShop(GROUND:GetNowLandIndex(), GROUND:GetMeroettaAppearSpaceIndex(), "shop_jukebox")
  GROUND:SetOpenLimitState_LandShopLabel("shop_jukebox", PARADISE_OPEN_LIMIT_STATE.OPEN)
end
function LUA_SYSTEM:GetNokotchiQuest_ItemIndex1()
  return 126
end
function LUA_SYSTEM:GetNokotchiQuest_ItemCount1()
  return 1
end
function LUA_SYSTEM:GetNokotchiQuest_ItemIndex2()
  return 484
end
function LUA_SYSTEM:GetNokotchiQuest_ItemCount2()
  return 1
end
function LUA_SYSTEM:GetNokotchiQuest_Money()
  return 100
end
function LUA_SYSTEM:GetDotekkotsuQuest_CheckKenzaiItemIndex()
  return ITEM_INDEX_KENZAI_TSURU_B
end
function LUA_SYSTEM:CheckPreEnterDlcDungeon(dungeon)
  local result = SYSTEM:CheckDlcDungeon(dungeon)
  if result == DLC_ERROR.MEDIA_NOT_FOUND then
    return false
  elseif result == DLC_ERROR.MOUNT_ERROR then
    return false
  elseif result == DLC_ERROR.NOT_FORMATTED then
    return false
  end
  return true
end
function LUA_SYSTEM:MultiplayEventNotify_VisitPlayer()
  SOUND:PlayMe(SymSnd("SE_SHOP_BELL"), Volume(256))
  FUNC_COMMON:NoticeSimpleRequest(1109194885, 1)
end
function LUA_SYSTEM:MultiplayEventNotify_VWaveChange()
  SOUND:PlayMe(SymSnd("ME_EVT_V_FANFARE"), Volume(256))
  FUNC_COMMON:NoticeSimpleRequest(-525996156, 1)
end
function LUA_SYSTEM:MultiplayEventNotify_QuestChancel()
  SOUND:PlayMe(SymSnd("SE_ST_BAD"), Volume(256))
  FUNC_COMMON:NoticeSimpleRequest(-343266406, 1)
end
function LUA_SYSTEM:MultiplayEventNotify_LeavePlayer()
  SOUND:PlayMe(SymSnd("ME_SEEYOU"), Volume(256))
  FUNC_COMMON:NoticeSimpleRequest(1284394372, 1)
end
function LUA_SYSTEM:MultiplayEventNotify_ChangePlayer()
  FUNC_COMMON:NoticeSimpleRequest(994811605, 1)
  FUNC_COMMON:NoticeSimpleRequest(275172630, 1)
end
function LUA_SYSTEM:MultiplayEventNotify_ChangeEquipItem()
  FUNC_COMMON:NoticeSimpleRequest(-1690930755, 1)
end

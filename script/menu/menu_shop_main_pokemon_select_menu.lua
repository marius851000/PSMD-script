function DispLeaderPokemonSelectMenu(optTbl)
  local lower_flag
  lower_flag = LOWER_SCREEN:IsVisible()
  optTbl.flagLeader = true
  optTbl.maxParty = 1
  LOWER_SCREEN:SetVisible(false)
  DispBasePokemonSelectMenu(optTbl)
  LOWER_SCREEN:SetVisible(lower_flag)
end
function DispMemberPokemonSelectMenu(optTbl)
  local lower_flag
  lower_flag = LOWER_SCREEN:IsVisible()
  optTbl.flagLeader = false
  if optTbl.maxParty == nil then
    optTbl.maxParty = 4
  end
  LOWER_SCREEN:SetVisible(false)
  DispBasePokemonSelectMenu(optTbl)
  LOWER_SCREEN:SetVisible(lower_flag)
end
local isPokemonSelectRemove = function(warehouseId)
  if GROUND:IsPokemonWarehouseIdPartPossible(warehouseId) == false then
    return false
  end
  if GROUND:IsPokemonWarehouseIdBuddy(warehouseId) == true then
    return false
  end
  return true
end
local function isPokemonSelectRemoveAll()
  local ret = false
  for wareHouseId in GROUND:EnumeratePokemonWarehouseId() do
    local pokemonIndex = GROUND:GetPokemonWarehousePokemonIndex(wareHouseId)
    if isPokemonSelectRemove(wareHouseId) == true then
      ret = true
    end
  end
  return ret
end
function DispBasePokemonSelectMenu(flowTbl)
  local isDisableLeader = function(menu, wareHouseId)
    if GROUND:IsPokemonWarehouseIdBuddy(wareHouseId) == true and GROUND:IsLeaderChangeEnable() then
      return false
    end
    return true
  end
  local function isDisalbeStandby(menu, wareHouseId)
    if flowTbl.typeDrawGroup ~= "ALL" then
      if GROUND:IsPokemonWarehouseIdHero(wareHouseId) == true then
        return false
      end
      if GROUND:IsPokemonWarehouseIdPartner(wareHouseId) == true then
        return false
      end
      if GROUND:IsPokemonWarehouseIdLeader(wareHouseId) == true then
        return false
      end
    elseif GROUND:IsPokemonWarehouseIdLeader(wareHouseId) == true then
      return false
    end
    if GROUND:IsPokemonWarehouseIdBuddy(wareHouseId) == true then
      return false
    end
    return true
  end
  local function isDisalbeJoin(menu, wareHouseId)
    if flowTbl.typeDrawGroup ~= "ALL" then
      if GROUND:IsPokemonWarehouseIdLeader(wareHouseId) then
        return true
      end
      if GROUND:IsPokemonWarehouseIdPartner(wareHouseId) then
        return true
      end
    elseif GROUND:IsPokemonWarehouseIdLeader(wareHouseId) == true then
      return true
    end
    if GROUND:IsPokemonWarehouseIdBuddy(wareHouseId) then
      return true
    end
    return false
  end
  local function isGlayoutStandby(menu, wareHouseId)
    if flowTbl.typeDrawGroup ~= "ALL" then
      if GROUND:IsPokemonWarehouseIdHero(wareHouseId) == true then
        return true
      end
      if GROUND:IsPokemonWarehouseIdPartner(wareHouseId) == true then
        return true
      end
      if GROUND:IsPokemonWarehouseIdLeader(wareHouseId) == true then
        return true
      end
    elseif GROUND:IsPokemonWarehouseIdLeader(wareHouseId) == true then
      return true
    end
    return false
  end
  local isGlayoutJoin = function(menu, wareHouseId)
    if GROUND:IsPartyFull() then
      return true
    end
    return false
  end
  local isDisalbePart = function(menu, wareHouseId)
    if GROUND:IsPokemonWarehouseIdPartPossible(wareHouseId) then
      return false
    end
    return true
  end
  local isDisalbeNameChange = function(menu, wareHouseId)
    if SYSTEM:IsDebugMasterSwitch() then
      return false
    end
    return true
  end
  local warehouseMenu = MENU:CreatePokemonSelect()
  warehouseMenu:Open()
  function warehouseMenu:cancelAction()
    local closeFlag
    closeFlag = true
    if flowTbl.cancelAct then
      local pokemonIndex = 0
      closeFlag = flowTbl.cancelAct(pokemonIndex)
    end
    if flowTbl.fadeFlag == true then
      SCREEN_A:FadeOutAll(TimeSec(0.5), false)
      SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    end
    self:Close()
  end
  function warehouseMenu:decideAction()
    ShopSys:SelectPokemonWarehouseId(warehouseMenu:GetWarehouseId())
    local pokemonIndex = GROUND:GetPokemonWarehousePokemonIndex(warehouseMenu:GetWarehouseId())
    if flowTbl.decideAct then
      local dec_flag
      dec_flag = flowTbl.decideAct(pokemonIndex)
      if dec_flag == false then
        return
      end
    end
    if flowTbl.fadeFlag == true then
      SCREEN_A:FadeOutAll(TimeSec(0.5), false)
      SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    end
    self:Close()
    return
  end
  CommonSys:BeginLowerMenuNaviFilter(TimeSec(0))
  if flowTbl.fadeFlag == true then
    SCREEN_A:FadeInAll(TimeSec(0.5), false)
    SCREEN_B:FadeInAll(TimeSec(0.5), false)
  end
  BasicMenu_OpenAndCloseWait(warehouseMenu)
  GROUND:SortPartyMember(false)
  CommonSys:EndLowerMenuNaviFilter(TimeSec(0))
end

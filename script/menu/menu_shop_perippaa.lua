function MenuPerippaaRescue_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:SetTag_MonsterString(0, GROUND:GetPokemonWarehouseNameFromId(0))
end
function MenuPerippaaRescue_End()
  SCREEN_A:FadeOutAll(TimeSec(0.5), false)
  SCREEN_B:FadeOutAll(TimeSec(0.5), true)
end
function MenuPerippaaCommunication_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_PERIPPA_01")
  CH("PERIPPAA"):DirTo(CH("PLAYER"), Speed(350), ROT_TYPE.NEAR)
  CH("PERIPPAA"):WaitRotate()
  MENU:SetTag_MonsterString(0, GROUND:GetPokemonWarehouseNameFromId(0))
end
function MenuPerippaaCommunication_End()
  LOWER_SCREEN:ChangeLastWallpaper()
end
function MenuPerippaaPokemonName_SetTag()
  local wareId = GROUND:ShopFlowSystem_PokemonSelect_WarehouseId()
  MENU:SetTag_MonsterString(2, GROUND:GetPokemonWarehouseNameFromId(wareId))
end
function MenuPerippaaDisplayPassword()
end

dofile("script/menu/menu_shop_main_sellf_low.lua")
function MenuShinkaShop_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/top.bin", true)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_EVOLUTION")
end
function MenuShinkaShop_ReStart()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/top.bin", true)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_EVOLUTION")
  CH("ZERUNEASU"):DirTo(CH("PLAYER"), Speed(350), ROT_TYPE.NEAR)
  CH("ZERUNEASU"):WaitRotate()
  TASK:Sleep(TimeSec(0.3))
  SCREEN_A:WhiteInAll(TimeSec(0.5), false)
  SCREEN_B:WhiteInAll(TimeSec(0.5), true)
end
function MenuShinkaShop_SetTag()
  local wareId = GROUND:ShopFlowSystem_PokemonSelect_WarehouseId()
  local pokemonIndex = GROUND:ShopFlowSystem_PokemonSelect()
  local beforeNickname = GROUND:GetPokemonWarehouseNameFromId(wareId)
  local beforePokemonName = GROUND:GetPokemonNameForPokemonWarehouseDefault(pokemonIndex)
  if wareId == 0 or wareId == 1 then
    MENU:SetTag_MonsterString(2, beforeNickname)
  else
    MENU:SetTag_MonsterString(2, beforePokemonName)
  end
  MENU:SetTag_MonsterIndex(3, GROUND:ShopFlowSystem_PokemonEvolution())
  MENU:SetTag_MonsterString(4, beforePokemonName)
end
function MenuShinkaShop_End()
end

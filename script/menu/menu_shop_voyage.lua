dofile("script/menu/menu_shop_main_sellf_low.lua")
function MenuVoyageShop_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/top.bin", true)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_RAPURASU")
end
function MenuVoyageShopReturnMode_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/top.bin", true)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_RAPURASU")
end
function MenuVoyageShop_SetTag()
  GROUND:ShopFlowSystem_SetVoyageContinentTag(0)
end
function MenuVoyageShop_ResultSetTag()
  GROUND:ShopFlowSystem_SetVoyageContinentAndPlaceTag(1, 2)
end
function MenuVoyageShop_End()
  LOWER_SCREEN:ChangeLastWallpaper()
end

function MenuCafeShop_Start()
  SYSTEM:DebugPrint("+++++Start+++++")
  MENU:LoadMenuTextPool("message/shop.bin", false)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_CAFE")
end
function MenuCafeShop_SetTag_Goukeikingaku()
  local sumMoney = GROUND:ShopFlowSystem_GetMoney()
  MENU:SetTag_Money(0, sumMoney)
end
function MenuCafeShop_SetTag_Kanteishitai()
  local itemIndex = GROUND:ShopFlowSystem_CafeSelect()
  if itemIndex ~= 0 then
    index = ShopSys:GetShopTagIndex("\233\145\145\229\174\154\227\129\151\227\129\159\227\129\132\229\174\157\231\174\177")
    MENU:SetTag_ItemIndex(index, itemIndex)
  end
end
function MenuCafeShop_SetTag_Kanteiitem()
  local itemIndex = GROUND:ShopFlowSystem_CafeResultItem()
  local itemCount = GROUND:ShopFlowSystem_CafeResultItemCount()
  if itemIndex ~= 0 then
    index = ShopSys:GetShopTagIndex("\233\145\145\229\174\154\227\130\162\227\130\164\227\131\134\227\131\160\229\144\141")
    MENU:SetTag_ItemIndexAndCount(index, itemIndex, itemCount)
  end
end
function MenuCafeShop_SetTag_Atatta()
  local itemIndex = GROUND:ShopFlowSystem_CafeResultItem()
  if itemIndex ~= 0 then
    index = ShopSys:GetShopTagIndex("\229\189\147\227\129\159\227\129\163\227\129\159\230\153\175\229\147\129")
    MENU:SetTag_ItemIndex(index, itemIndex)
  end
end
function MenuCafeShop_SetTag_Sentakushita()
  local itemIndex = GROUND:ShopFlowSystem_CafeDelSelectItem()
  if itemIndex ~= 0 then
    index = ShopSys:GetShopTagIndex("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\169\227\129\134\227\129\144")
    MENU:SetTag_ItemIndex(index, itemIndex)
  end
end
function MenuCafeShop_Judgment()
end
function MenuCafeShop_BoxCafe1()
  CH("GARUURA"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  TASK:Sleep(TimeSec(0.4))
  CH("GARUURA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
end
function MenuCafeShop_BoxCafe3()
  CH("GARUURA"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  TASK:Sleep(TimeSec(0.4))
  SOUND:PlaySe(SymSnd("SE_SHOP_RUCHABURU_FLASH"), Volume(256))
  SCREEN_A:WhiteChange(Level(0), Level(1), TimeSec(0.02), true)
  TASK:Sleep(TimeSec(0.02))
  SCREEN_A:WhiteChange(Level(1), Level(0), TimeSec(0.02), true)
  TASK:Sleep(TimeSec(0.02))
  SOUND:PlaySe(SymSnd("SE_SHOP_RUCHABURU_FLASH"), Volume(256))
  SCREEN_A:WhiteChange(Level(0), Level(1), TimeSec(0.02), true)
  TASK:Sleep(TimeSec(0.02))
  SCREEN_A:WhiteChange(Level(1), Level(0), TimeSec(0.02), true)
  TASK:Sleep(TimeSec(0.02))
  CH("GARUURA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
end
function MenuCafeShop_BoxCafe1_GRADE()
  CH("GARUURA"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  TASK:Sleep(TimeSec(0.4))
  CH("GARUURA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
end
function MenuCafeShop_BoxCafe3_GRADE()
  CH("GARUURA"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  TASK:Sleep(TimeSec(0.4))
  SOUND:PlaySe(SymSnd("SE_SHOP_RUCHABURU_FLASH"), Volume(256))
  SCREEN_A:WhiteChange(Level(0), Level(1), TimeSec(0.02), true)
  TASK:Sleep(TimeSec(0.02))
  SCREEN_A:WhiteChange(Level(1), Level(0), TimeSec(0.02), true)
  TASK:Sleep(TimeSec(0.02))
  SOUND:PlaySe(SymSnd("SE_SHOP_RUCHABURU_FLASH"), Volume(256))
  SCREEN_A:WhiteChange(Level(0), Level(1), TimeSec(0.02), true)
  TASK:Sleep(TimeSec(0.02))
  SCREEN_A:WhiteChange(Level(1), Level(0), TimeSec(0.02), true)
  TASK:Sleep(TimeSec(0.02))
  CH("GARUURA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  SYSTEM:DebugPrint("+++++1\n")
  local chestCount = GROUND:ShopFlowSystem_CafeHighClassCount()
  SYSTEM:DebugPrint("+++++" + chestCount)
  for i = 0, chestCount do
  end
end
function MenuCafeShop_End()
  LOWER_SCREEN:ChangeLastWallpaper()
end

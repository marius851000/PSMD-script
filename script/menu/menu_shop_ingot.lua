function MenuIngotShop_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_GOLD01")
  ShopSys:SetOwner("DESUKAAN")
end
function MenuIngotShop_SetTag_Kinkaisu()
  local index, num
  index = ShopSys:GetShopTagIndex("\233\129\184\230\138\158\233\135\145\229\161\138\230\149\176")
  num = GROUND:ShopFlowSystem_GetIngot()
  MENU:SetTag_Value(index, num)
  index = ShopSys:GetShopTagIndex("\229\144\136\232\168\136\233\135\145\229\161\138\230\149\176")
  MENU:SetTag_Value(index, num)
end
function MenuIngotShop_SetTag_Baikyaku()
  local moneyNum
  moneyNum = GROUND:ShopFlowSystem_GetMoney()
  MENU:SetTag_Money(1, moneyNum)
end
function MenuIngotShop_SetTag_dougu()
  local itemIndex, index
  itemIndex = GROUND:ShopFlowSystem_ItemSelect()
  itemNum = GROUND:ShopFlowSystem_ItemSelectNum()
  if itemIndex ~= 0 then
    index = ShopSys:GetShopTagIndex("\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183")
    MENU:SetTag_ItemIndexAndCount(index, itemIndex, itemNum)
  end
end
function MenuIngotShop_SetTag_IngotItemCountCheck()
  local itemCount
  itemCount = GROUND:ShopFlowSystem_IngotItemCount()
  MENU:SetTag_Value(4, itemCount)
end
function MenuIngotShop_SetTag_rare01()
  GROUND:ShopFlowSystem_SetString_FirstRareExhibition(1)
end
function MenuIngotShop_SetTag_rare02()
  GROUND:ShopFlowSystem_SetString_FirstRareOneComp(2)
end
function MenuIngotShop_Judgment()
end
function MenuIngotShop_End()
  LOWER_SCREEN:ChangeLastWallpaper()
end

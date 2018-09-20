dofile("script/menu/menu_shop_main_sellf_low.lua")
function MenuMerchantShop_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/top.bin", true)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_K_SHOP01")
end
function MenuMerchantShop_SetSellAllFlagOn()
  GROUND:ShopFlowSystem_SetSellAllFlag(true)
end
function MenuMerchantShop_SetSellAllFlagOff()
  GROUND:ShopFlowSystem_SetSellAllFlag(false)
end
function MenuMerchantShop_SetTag()
  MENU:SetTag_Money(0, GROUND:ShopFlowSystem_GetMoney())
  MENU:SetTag_Money(1, GROUND:ShopFlowSystem_GetMoney())
  local itemIndex = GROUND:ShopFlowSystem_ItemSelect()
  local itemNum = GROUND:ShopFlowSystem_ItemSelectNum()
  if itemIndex ~= 0 then
    MENU:SetTag_ItemIndexAndCount(3, itemIndex, itemNum)
  end
end
function MenuMerchantShop_SetTagTicket()
  MENU:SetTag_Money(0, GROUND:ShopFlowSystem_GetMoney())
  MENU:SetTag_Money(1, GROUND:ShopFlowSystem_GetMoney())
  MENU:SetTag_TicketIndex(3, GROUND:ShopFlowSystem_TicketSelect())
end
function MenuWazaShop_ItemGuide()
  local itemIndex = GROUND:ShopFlowSystem_ItemSelect()
  local textId = ITEM:GetItemExplainTextIdFromItemIndex(itemIndex)
  local expreinMenu = CommonSys:OpenBasicExplainMenu(textId, nil)
  MENU:SetFocus(expreinMenu)
  MENU:WaitClose(expreinMenu)
end
function MenuMerchantShop_End()
  LOWER_SCREEN:ChangeLastWallpaper()
end

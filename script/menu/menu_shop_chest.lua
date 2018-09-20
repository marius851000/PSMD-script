function MenuChestShop_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_TREASURE01")
end
function MenuChestShop_SetTag_Player()
  GROUND:SetStringPlayerName(1)
end
function MenuChestShop_SetTag_Goukeikingaku()
  local sumMoney = GROUND:ShopFlowSystem_GetMoney()
  MENU:SetTag_Money(0, sumMoney)
end
function MenuChestShop_SetTag_Kanteishitai()
  local itemIndex = GROUND:ShopFlowSystem_ChestSelect()
  if itemIndex ~= 0 then
    index = ShopSys:GetShopTagIndex("\233\145\145\229\174\154\227\129\151\227\129\159\227\129\132\229\174\157\231\174\177")
    MENU:SetTag_ItemIndex(index, itemIndex)
  end
end
function MenuChestShop_SetTag_Kanteiitem()
  local itemIndex = GROUND:ShopFlowSystem_ChestResultItem()
  local itemCount = GROUND:ShopFlowSystem_ChestResultItemCount()
  if itemIndex ~= 0 then
    index = ShopSys:GetShopTagIndex("\233\145\145\229\174\154\227\130\162\227\130\164\227\131\134\227\131\160\229\144\141")
    MENU:SetTag_ItemIndexAndCount(index, itemIndex, itemCount)
  end
end
function MenuChestShop_SetTag_Atatta()
  local itemIndex = GROUND:ShopFlowSystem_ChestResultItem()
  if itemIndex ~= 0 then
    index = ShopSys:GetShopTagIndex("\229\189\147\227\129\159\227\129\163\227\129\159\230\153\175\229\147\129")
    MENU:SetTag_ItemIndex(index, itemIndex)
  end
end
function MenuChestShop_SetTag_Sentakushita()
  local itemIndex = GROUND:ShopFlowSystem_ChestDelSelectItem()
  if itemIndex ~= 0 then
    index = ShopSys:GetShopTagIndex("\233\129\184\230\138\158\227\129\151\227\129\159\227\129\169\227\129\134\227\129\144")
    MENU:SetTag_ItemIndex(index, itemIndex)
  end
end
function MenuChestShop_Judgment()
end
function MenuChestShop_BoxChest1()
  SOUND:PlaySe(SymSnd("SE_SHOP_KLEFKI_BOX_OPEN"))
  CH("KUREFFI"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  TASK:Sleep(TimeSec(0.4))
  CH("KUREFFI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
end
function MenuChestShop_BoxChest3()
  SOUND:PlaySe(SymSnd("SE_SHOP_KLEFKI_BOX_OPEN"))
  CH("KUREFFI"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
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
  CH("KUREFFI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
end
function MenuChestShop_BoxChest1_GRADE()
  SOUND:PlaySe(SymSnd("SE_SHOP_KLEFKI_BOX_OPEN"))
  CH("KUREFFI"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  TASK:Sleep(TimeSec(0.4))
  CH("KUREFFI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
end
function MenuChestShop_BoxChest3_GRADE()
  SOUND:PlaySe(SymSnd("SE_SHOP_KLEFKI_BOX_OPEN"))
  CH("KUREFFI"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
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
  CH("KUREFFI"):SetMotion(SymMot("WAIT02"), LOOP.ON)
end
function MenuChestShop_End()
  LOWER_SCREEN:ChangeLastWallpaper()
end
function DispAppraisalSelectMenu(depositAct, cancelAct, expretionAct, ShopListTitle, DecideActMes, expretionActMes)
  ShopSys:DispBasicItemBagMenu({
    titleText = ShopListTitle,
    padHelpMainText = 364683035,
    itemFilterFunc = function(item)
      return item:GetKind() ~= ITEM_KIND.KIND_CHEST
    end,
    itemTextFunc = function(item)
      return item:GetItemText_forDungeonBag()
    end,
    itemLineHelpFunc = function(item)
      return item:GetItemOneLineExplainText()
    end,
    commandItems = {
      {
        text = DecideActMes,
        action = function(bagMenu)
          depositAct(bagMenu)
        end,
        isCloseShopMenu = true
      },
      {
        text = expretionActMes,
        action = function()
          expretionAct()
        end,
        isCloseShopMenu = true,
        isSingleOnly = true
      }
    },
    cancelAct = function()
      cancelAct()
    end,
    isMultiSelect = false,
    isDispBagCountWindow = true,
    isSortButtonEnable = false
  })
end

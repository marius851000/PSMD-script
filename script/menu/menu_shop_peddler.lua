function OpenPeddlerShopMenu(shopIns, shopCallFunc)
  local isBuildShopNow = function(checkLabel)
    local isBuildNow = false
    for landIdx = 1, 8 do
      for spaceIdx = 1, 4 do
        if checkLabel == GROUND:GetLandShopLabel(landIdx - 1, spaceIdx - 1) then
          isBuildNow = true
        end
      end
    end
    return isBuildNow
  end
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  function FlowSys.Proc.MenuTopFirst()
    if FLAG.ParaShopPeddler1st == CONST.FLAG_TRUE then
      FLAG.ParaShopPeddler1st = CONST.FLAG_FALSE
      FlowSys:Next("FirstContact")
    else
      FlowSys:Next("PreTalk")
    end
  end
  function FlowSys.Proc.FirstContact()
    ShopSys:Talk(SHOP_PADDLE__FIRST_CONTACT)
    FlowSys:Next("ToShop")
  end
  function FlowSys.Proc.PreTalk()
    if shopIns:IsDayFirstTalk() then
      if isBuildShopNow(shopIns:GetShopLabel()) then
        ShopSys:Talk(SHOP_PADDLE__NORMAL_TALK_1ST)
      else
        local openState = GROUND:GetOpenLimitState_LandShopLabel(shopIns:GetShopLabel())
        if openState == PARADISE_OPEN_LIMIT_STATE.OPEN_NEW or openState == PARADISE_OPEN_LIMIT_STATE.CLOSE then
          ShopSys:Talk(SHOP_PADDLE__NO_BUILD)
        else
          ShopSys:Talk(SHOP_PADDLE__BUILD_AND_CLOSE)
        end
      end
    else
      ShopSys:Talk(SHOP_PADDLE__NORMAL_TALK_2ND)
    end
    FlowSys:Next("ToShop")
  end
  function FlowSys.Proc.ToShop()
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
    FlowSys:Return()
  end
  FlowSys:Call("MenuTopFirst")
  FlowSys:Finish()
  ShopSys:Finish()
  shopCallFunc()
  shopIns:SetDayFirstTalk(false)
end

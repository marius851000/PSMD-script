function OpenShopFarmMenu(shopIns, landIndex, spaceIndex)
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  local EventPlay = {}
  function FlowSys.Proc.MenuTop()
    if shopIns:Farm_IsGrowSeed() then
      ShopSys:SetShopTag("\230\164\141\227\129\136\227\129\159\227\130\130\227\129\174", shopIns:GetText_FarmPlantName())
      EventPlay.eventFarmFarvest()
      FlowSys:Next("MenuHarvest")
    else
      FlowSys:Next("MenuTopFirst")
    end
  end
  function FlowSys.Proc.MenuTopFirst()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:SetShopTag("\231\149\145\227\129\174\230\150\189\232\168\173\229\144\141", shopIns:GetText_FarmName())
    ShopSys:SetShopTag("\230\164\141\227\129\136\227\130\137\227\130\140\227\130\139\227\130\191\227\131\141", shopIns:GetText_FarmPlantName())
    ShopSys:TalkAskFlowNoClose(SHOP_FARM__WELCOME, nil, {cursorReset = true}, {next = "MenuExit"}, {
      text = SHOP_FARM__WELCOME_PLANT,
      next = "MenuPlantSeedBefore"
    }, {text = SHOP_FARM__WELCOME_HELP, next = "MenuHelp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopLoop()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_FARM__SERIES, nil, {cursorReset = true}, {next = "MenuExit"}, {
      text = SHOP_FARM__SERIES_PLANT,
      next = "MenuPlantSeedBefore"
    }, {text = SHOP_FARM__SERIES_HELP, next = "MenuHelp"})
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuPlantSeedBefore()
    if shopIns:Farm_AllreadyPlantSeed() then
      ShopSys:SetShopTag("\230\164\141\227\129\136\227\129\159\227\130\130\227\129\174", shopIns:GetText_FarmPlantName())
      ShopSys:Talk(SHOP_FARM__NOT_PLANT_NO_MORE, nil)
      FlowSys:Next("MenuEnd")
    elseif shopIns:Farm_IsHaveSeeds() then
      FlowSys:Next("MenuPlantSeedYesNo")
    else
      ShopSys:SetShopTag("\230\164\141\227\129\136\227\130\137\227\130\140\227\130\139\227\130\191\227\131\141", shopIns:GetText_FarmPlantName())
      ShopSys:Talk(SHOP_FARM__NOT_PLANT_NO_ITEM, nil)
      FlowSys:Next("MenuEnd")
    end
  end
  function FlowSys.Proc.MenuPlantSeedYesNo()
    ShopSys:SetShopTag("\230\164\141\227\129\136\227\130\137\227\130\140\227\130\139\227\130\191\227\131\141", shopIns:GetText_FarmPlantName())
    ShopSys:TalkAskFlowNoClose(SHOP_FARM__PLANT_INTO_ITEM_SELECT, nil, nil, {
      next = "MenuTopLoop"
    }, {
      text = SHOP_FARM__PLANT_INTO_ITEM_SELECT_YES,
      next = "MenuPlantSeedProc",
      default = true
    }, {
      text = SHOP_FARM__PLANT_INTO_ITEM_SELECT_NO,
      next = "MenuTopLoop"
    })
  end
  function FlowSys.Proc.MenuPlantSeedProc()
    shopIns:PlantSeed()
    ShopSys:SetShopTag("\230\164\141\227\129\136\227\130\137\227\130\140\227\130\139\227\130\191\227\131\141", shopIns:GetText_FarmPlantName())
    EventPlay.eventFarmPlant()
    FlowSys:Next("MenuEnd")
  end
  function FlowSys.Proc.MenuHarvest()
    local normalItem = shopIns:GetNormalHarvestItem()
    local normalNum = shopIns:GetNormalHarvestCount()
    OverFlow:AddOverflowCheckItem(normalItem, normalNum, true)
    shopIns:DeleteNormalItem()
    local luckyItem = shopIns:GetLuckyHarvestItem()
    if luckyItem > 0 then
      FlowSys:Next("MenuHarvestLucky")
      return
    end
    FlowSys:Next("MenuOverflow")
  end
  function FlowSys.Proc.MenuHarvestLucky()
    EventPlay.eventFarmFarvestLucky()
    local luckyItem = shopIns:GetLuckyHarvestItem()
    local luckyNum = shopIns:GetLuckyHarvestCount()
    OverFlow:AddOverflowCheckItem(luckyItem, luckyNum, true)
    OverFlow:OpenOrderOverflowMenu(true)
    WINDOW:CloseMessage()
    shopIns:DeleteLuckyItem()
    FlowSys:Next("MenuOverflow")
  end
  function FlowSys.Proc.MenuOverflow()
    OverFlow:OpenOrderOverflowMenu(true)
    WINDOW:CloseMessage()
    shopIns:ShutdownHarvest()
    FlowSys:Next("MenuTopFirst")
  end
  function FlowSys.Proc.MenuCleanBox()
    shopIns:Farm_Harvest()
    FlowSys:Next("MenuTopFirst")
  end
  function FlowSys.Proc.MenuHelp()
    ShopSys:SetShopTag("\230\164\141\227\129\136\227\130\137\227\130\140\227\130\139\227\130\191\227\131\141", shopIns:GetText_FarmPlantName())
    ShopSys:Talk(SHOP_FARM__HELP, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.MenuExit()
    ShopSys:Talk(SHOP_FARM__EXIT, nil)
    FlowSys:Next("MenuEnd")
  end
  function FlowSys.Proc.MenuEnd()
    FlowSys:Return()
  end
  function EventPlay.eventFarmPlant()
    local POINT_CENTER = SymPos(string.format("@SHOP_CENTER%02d", spaceIndex))
    local SHOP_COUNTER = SymPos(string.format("@SHOP_COUNTER%02d", spaceIndex))
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    local SHOP_OWNER_DEF = SHOP_OWNER:GetDir()
    SHOP_OWNER:DirTo(POINT_CENTER, Speed(500), ROT_TYPE.NEAR)
    CAMERA:MoveFollow(SHOP_COUNTER, Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    SHOP_OWNER:WaitRotate()
    SHOP_OWNER:SetMotion(SymMot("SPEAK"), LOOP.ON)
    CAMERA:WaitMove()
    WINDOW:DrawFace(20, 88, SymAct(string.format("LAND_SHOP_STAFF_%02d", spaceIndex)), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct(string.format("LAND_SHOP_STAFF_%02d", spaceIndex)), SHOP_FARM__PLANT_FINISH01)
    WINDOW:CloseMessage()
    SOUND:PlaySe(SymSnd("SE_SHOP_HATAKE_BUD"))
    EFFECT:Create("effect", SymEff("NM_SEEDLING_GREEN"))
    EFFECT:SetScale("effect", Scale(1))
    EFFECT:SetPosition("effect", SymPos(string.format("@EFFECT_POINT%02d", spaceIndex), PosOffs(0, -0.5)))
    EFFECT:Play("effect")
    TASK:Sleep(TimeSec(0.8))
    shopIns:PlantSeedEffectOn()
    SHOP_OWNER:DirTo(RotateTarget(SHOP_OWNER_DEF), Speed(500), ROT_TYPE.NEAR)
    CAMERA:MoveToPlayer(Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    CAMERA:WaitMove()
    WINDOW:DrawFace(20, 88, SymAct(string.format("LAND_SHOP_STAFF_%02d", spaceIndex)), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct(string.format("LAND_SHOP_STAFF_%02d", spaceIndex)), SHOP_FARM__PLANT_FINISH02)
    WINDOW:CloseMessage()
  end
  function EventPlay.eventFarmFarvest()
    local POINT_CENTER = SymPos(string.format("@SHOP_CENTER%02d", spaceIndex))
    local SHOP_COUNTER = SymPos(string.format("@SHOP_COUNTER%02d", spaceIndex))
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    local SHOP_OWNER_DEF = SHOP_OWNER:GetDir()
    WINDOW:DrawFace(20, 88, SymAct(string.format("LAND_SHOP_STAFF_%02d", spaceIndex)), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct(string.format("LAND_SHOP_STAFF_%02d", spaceIndex)), SHOP_FARM__RESULT_HARVEST)
    WINDOW:CloseMessage()
    SHOP_OWNER:DirTo(POINT_CENTER, Speed(500), ROT_TYPE.NEAR)
    CAMERA:MoveFollow(SHOP_COUNTER, Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    SHOP_OWNER:WaitRotate()
    SOUND:PlaySe(SymSnd("SE_EVT_DIG"))
    SHOP_OWNER:SetMotion(SymMot("SPEAK"), LOOP.ON)
    CAMERA:WaitMove()
    TASK:Sleep(TimeSec(0.5))
    shopIns:DeleteEffect()
    SHOP_OWNER:DirTo(RotateTarget(SHOP_OWNER_DEF), Speed(500), ROT_TYPE.NEAR)
    CAMERA:MoveToPlayer(Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    CAMERA:WaitMove()
    SOUND:PlayMe(SymSnd("ME_REWARD"), Volume(256))
  end
  function EventPlay.eventFarmFarvestLucky()
    SOUND:WaitMe()
    WINDOW:CloseMessage()
    local POINT_CENTER = SymPos(string.format("@SHOP_CENTER%02d", spaceIndex))
    local SHOP_COUNTER = SymPos(string.format("@SHOP_COUNTER%02d", spaceIndex))
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    local SHOP_OWNER_DEF = SHOP_OWNER:GetDir()
    SOUND:PlaySe(SymSnd("SE_WAZA_POWER_JEM_1"))
    EFFECT:Create("effectKirakira", SymEff("EV_GLITTER_YELLOW"))
    EFFECT:SetPosition("effectKirakira", SymPos(string.format("@EFFECT_POINT%02d", spaceIndex), PosOffs(0, -0.5)))
    EFFECT:Play("effectKirakira")
    EFFECT:Wait("effectKirakira")
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"))
    SHOP_OWNER:SetManpu("MP_EXCLAMATION")
    SHOP_OWNER:WaitManpu()
    TASK:Sleep(TimeSec(0.1))
    SHOP_OWNER:DirTo(POINT_CENTER, Speed(500), ROT_TYPE.NEAR)
    CAMERA:MoveFollow(SHOP_COUNTER, Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    SHOP_OWNER:WaitRotate()
    SOUND:PlaySe(SymSnd("SE_EVT_DIG"))
    SHOP_OWNER:SetMotion(SymMot("SPEAK"), LOOP.ON)
    CAMERA:WaitMove()
    TASK:Sleep(TimeSec(0.5))
    SHOP_OWNER:DirTo(RotateTarget(SHOP_OWNER_DEF), Speed(500), ROT_TYPE.NEAR)
    CAMERA:MoveToPlayer(Speed(3.5, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
    CAMERA:WaitMove()
    TASK:Regist(subEveDoubleJump, {SHOP_OWNER})
    MENU:SetTag_String(8, shopIns:GetText_FarmLuckyName())
    ShopSys:Talk(SHOP_FARM__RESULT_HARVEST_BOUNUS)
    WINDOW:CloseMessage()
    SOUND:PlayMe(SymSnd("ME_REWARD"), Volume(256))
  end
  FlowSys:Call("MenuTop")
  WINDOW:CloseMessage()
  FlowSys:Finish()
  ShopSys:Finish()
end

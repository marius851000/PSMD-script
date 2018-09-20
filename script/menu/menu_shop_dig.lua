function OpenDigMenuOutSide(resumeFlow, resumeArgTbl, spaceIndex)
  local DIG_PRICE_RATE_10M = 100
  local depth = 0
  local EventPlay = {}
  local GoodRateFlag = false
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetOwner("MOGURYUU")
  local reloadEntryAndResumeFlow = function(resumeFlow, resumeArgTbl)
    SYSTEM:DebugPrint("##### 1 #####")
    GROUND:SetLandShopSceneContinueFunction(function()
      OpenDigMenuOutSide(resumeFlow, resumeArgTbl)
    end)
    FlowSys:Finish()
    ShopSys:Finish()
    FLAG.MapMoveNoFade = CONST.FLAG_TRUE
    GROUND__2:GroundBrokenLandShopForDigShop()
    SYSTEM:ReloadLandEntry()
  end
  local reloadEntryAndResumeFlow2 = function(resumeFlow, resumeArgTbl)
    SYSTEM:DebugPrint("##### 2 #####")
    GROUND:SetLandShopSceneContinueFunction(function()
      OpenDigMenuOutSide(resumeFlow, resumeArgTbl)
    end)
    FlowSys:Finish()
    ShopSys:Finish()
    FLAG.MapMoveNoFade = CONST.FLAG_TRUE
    GROUND__2:GroundBuildDigShop()
    GROUND__2:SetDigDepth(GROUND__2:GetDigDepthBuf())
    GROUND__2:SetGoodRateFlagDig(GROUND__2:IsGoodRateFlagDigBuf())
    GROUND__2:ClearDigShopOwner()
    SYSTEM:ReloadLandEntry()
  end
  function FlowSys.Proc.DigMenuOutSideTop()
    EventPlay.eventShopDigStart()
    ShopSys:TalkAskFlowNoClose(SHOP_DIG__OUTSIDE_DIG, nil, nil, {
      next = "DigMenuOutSideCansel"
    }, {
      text = SHOP_DIG__OUTSIDE_DIG_YES,
      next = "DigMenuOutSideBuildCheck"
    }, {
      text = SHOP_DIG__OUTSIDE_DIG_NO,
      next = "DigMenuOutSideCansel",
      default = true
    })
    CH("DIG_SHOP_OWNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  end
  function FlowSys.Proc.DigMenuOutSideBuildCheck()
    GoodRateFlag = false
    if GROUND__2:DigIsBuildPlace() then
      FlowSys:Next("DigMenuOutSideDestructionCheck")
    else
      FlowSys:Next("DigMenuSelectDigDepthEvent")
    end
  end
  function FlowSys.Proc.DigMenuOutSideDestructionCheck()
    EventPlay.eventShopDigBuildingStart()
    ShopSys:TalkAskFlowNoClose(SHOP_DIG__OUTSIDE_DESTRUCTION, nil, nil, {
      next = "DigMenuOutSideDestructionCansel"
    }, {
      text = SHOP_DIG__OUTSIDE_DESTRUCTION_YES,
      next = "DigMenuSelectDigDepthEventRateChange"
    }, {
      text = SHOP_DIG__OUTSIDE_DESTRUCTION_NO,
      next = "DigMenuOutSideDestructionCansel",
      default = true
    })
    CH("DIG_SHOP_OWNER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  end
  function FlowSys.Proc.DigMenuSelectDigDepthEventRateChange()
    GoodRateFlag = true
    FlowSys:Next("DigMenuSelectDigDepthEvent")
  end
  function FlowSys.Proc.DigMenuSelectDigDepthEvent()
    EventPlay.eventShopDigDepthStart()
    FlowSys:Next("DigMenuSelectDigDepthFirst")
  end
  function FlowSys.Proc.DigMenuSelectDigDepthFirst()
    depth = 0
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_DIG__OUTSIDE_DIG_INTO02, FACE_TYPE.NORMAL, {cursorReset = true}, {
      next = "DigMenuOutSide2Cansel"
    }, {
      text = SHOP_DIG__DIG_DEPTH_1ST_MSG_10,
      next = "DigMenuDepthSelect10"
    }, {
      text = SHOP_DIG__DIG_DEPTH_1ST_MSG_50,
      next = "DigMenuDepthSelect50"
    }, {
      text = SHOP_DIG__DIG_DEPTH_1ST_MSG_100,
      next = "DigMenuDepthSelect100"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.DigMenuDepthSelect10()
    depth = 1
    FlowSys:Next("DigMenuDecideDigDepth01")
  end
  function FlowSys.Proc.DigMenuDepthSelect50()
    depth = 5
    FlowSys:Next("DigMenuDecideDigDepth01")
  end
  function FlowSys.Proc.DigMenuDepthSelect100()
    depth = 10
    FlowSys:Next("DigMenuDecideDigDepth01")
  end
  function FlowSys.Proc.DigMenuDecideDigDepth01()
    local price = DIG_PRICE_RATE_10M * depth
    MENU:SetTag_Value(0, depth * 10)
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\230\183\177\227\129\149", MENU:ReplaceTagText("[value_b:0]"))
    MENU:SetTag_Money(0, price)
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
    ShopSys:DispMoneyWindowOpen()
    ShopSys:TalkAskFlowNoClose(SHOP_DIG__OUTSIDE_DIG_1ST_SELECT, nil, nil, {
      next = "DigMenuSelectDigDepthFirst"
    }, {
      text = SHOP_DIG__OUTSIDE_DIG_1ST_SELECT_YES,
      next = "DigMenuCheckEnoughMoneyForDepth1st"
    }, {
      text = SHOP_DIG__OUTSIDE_DIG_1ST_SELECT_NO,
      next = "DigMenuSelectDigDepthFirst",
      default = true
    })
    ShopSys:DispMoneyWindowClose()
  end
  function FlowSys.Proc.DigMenuCheckEnoughMoneyForDepth1st()
    local price = DIG_PRICE_RATE_10M * depth
    if price <= GROUND:GetPlayerMoney() then
      SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
      GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() - price)
      EventPlay.eventShopDigThanks1st()
      FlowSys:Next("DigMenuBuildDigShop")
    else
      EventPlay.eventShopDigNoMoney1st()
      FlowSys:Next("DigMenuSelectDigDepthFirst")
    end
  end
  function FlowSys.Proc.DigMenuBuildDigShop()
    SOUND:VolumeBgm(Volume(64), TimeSec(0.8))
    SCREEN_A:FadeOut(TimeSec(0.3), false)
    SCREEN_B:FadeOut(TimeSec(0.3), true)
    SOUND:PlaySe(SymSnd("SE_WAZA_ANAWOHORU_1"))
    TASK:Sleep(TimeSec(0.6))
    SOUND:PlaySe(SymSnd("SE_WAZA_ANAWOHORU_1"))
    SOUND:WaitSe(SymSnd("SE_WAZA_ANAWOHORU_1"))
    GROUND__2:SetDigDepthBuf(depth)
    GROUND__2:SetGoodRateFlagDigBuf(GoodRateFlag)
    FlowSys:Next("DigMenuOutSideDig")
  end
  function FlowSys.Proc.DigMenuOutSideDig()
    reloadEntryAndResumeFlow("DigMenuOutSideDig2")
  end
  function FlowSys.Proc.DigMenuOutSideDig2()
    reloadEntryAndResumeFlow2("DigMenuBuildDigShopAfter")
  end
  function FlowSys.Proc.DigMenuBuildDigShopAfter()
    SCREEN_A:FadeOut(TimeSec(0), false)
    SCREEN_B:FadeOut(TimeSec(0), false)
    SCREEN_A:FadeIn(TimeSec(0.3), false)
    SCREEN_B:FadeIn(TimeSec(0.3), true)
    FlowSys:Next("DigMenuEnd")
    SOUND:VolumeBgm(Volume(256), TimeSec(0.8))
  end
  function FlowSys.Proc.DigMenuOutSideCansel()
    EventPlay.eventShopDigStartFall()
    FlowSys:Next("DigMenuEnd")
  end
  function FlowSys.Proc.DigMenuOutSide2Cansel()
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DIG_DEPTH_CANCEL, nil)
    GoodRateFlag = false
    FlowSys:Next("DigMenuEnd")
  end
  function FlowSys.Proc.DigMenuOutSideDestructionCansel()
    EventPlay.eventShopDigBuildingStartFall()
    FlowSys:Next("DigMenuEnd")
  end
  function FlowSys.Proc.DigMenuEnd()
    FlowSys:Return()
  end
  function EventPlay.eventShopDigStart()
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DIG01, nil)
    WINDOW:CloseMessage()
    subEveDoubleJump(CH("DIG_SHOP_OWNER"))
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DIG02, nil)
    WINDOW:CloseMessage()
    CH("DIG_SHOP_OWNER"):SetMotion(SymMot("SPEAK"), LOOP.ON)
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DIG03, nil)
    WINDOW:CloseMessage()
    CH("DIG_SHOP_OWNER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
    CH("DIG_SHOP_OWNER"):WaitPlayMotion()
  end
  function EventPlay.eventShopDigStartFall()
    CH("DIG_SHOP_OWNER"):SetManpu("MP_SWEAT_L")
    CH("DIG_SHOP_OWNER"):SetNeckRot(RotateTarget(0), RotateTarget(-35), RotateTarget(0), TimeSec(0.3))
    CH("DIG_SHOP_OWNER"):WaitNeckRot()
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DIG_CANCEL01, nil)
    WINDOW:CloseMessage()
    CH("DIG_SHOP_OWNER"):ResetNeckRot(TimeSec(0.15))
    CH("DIG_SHOP_OWNER"):WaitNeckRot()
    subEveJump(CH("DIG_SHOP_OWNER"))
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DIG_CANCEL02, nil)
    WINDOW:CloseMessage()
  end
  function EventPlay.eventShopDigBuildingStart()
    ShopSys:SetShopTag("\229\187\186\227\129\163\227\129\166\227\129\132\227\130\139\229\187\186\231\137\169", GROUND__2:GetText_DigBrokenShopName())
    CH("DIG_SHOP_OWNER"):SetMotion(SymMot("SPEAK"), LOOP.ON)
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DESTRUCTION01, nil)
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DESTRUCTION02, nil)
    WINDOW:CloseMessage()
  end
  function EventPlay.eventShopDigBuildingStartFall()
    CH("DIG_SHOP_OWNER"):SetManpu("MP_SWEAT_L")
    CH("DIG_SHOP_OWNER"):SetNeckRot(RotateTarget(0), RotateTarget(-35), RotateTarget(0), TimeSec(0.3))
    CH("DIG_SHOP_OWNER"):WaitNeckRot()
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DESTRUCTION_CANCEL01, nil)
    WINDOW:CloseMessage()
    CH("DIG_SHOP_OWNER"):ResetNeckRot(TimeSec(0.15))
    CH("DIG_SHOP_OWNER"):WaitNeckRot()
    subEveJump(CH("DIG_SHOP_OWNER"))
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DESTRUCTION_CANCEL02, nil)
    WINDOW:CloseMessage()
  end
  function EventPlay.eventShopDigDepthStart()
    ShopSys:Talk(SHOP_DIG__OUTSIDE_DIG_INTO01, nil)
    WINDOW:CloseMessage()
    subEveDoubleJump(CH("DIG_SHOP_OWNER"))
  end
  function EventPlay.eventShopDigNoMoney1st()
    ShopSys:Talk(SHOP_DIG__DIG_NO_MONEY, nil)
    WINDOW:CloseMessage()
  end
  function EventPlay.eventShopDigThanks1st()
    subEveDoubleJump(CH("DIG_SHOP_OWNER"))
    ShopSys:Talk(SHOP_DIG__DIG_THANKS_FIRST, nil)
    WINDOW:CloseMessage()
  end
  if resumeFlow then
    FlowSys:Call(resumeFlow)
  else
    FlowSys:Call("DigMenuOutSideTop")
  end
  WINDOW:CloseMessage()
  FlowSys:Finish()
  ShopSys:Finish()
  LOWER_SCREEN:SetVisible(true)
end
function OpenDigMenuInSide(shopIns, landIndex, spaceIndex)
  local DIG_STATE = {
    DIG = 1,
    REWARD = 2,
    NOT_GET_ITEMS = 3
  }
  local DIG_PRICE_RATE_10M = 100
  local depth = 0
  local EventPlay = {}
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  function FlowSys.Proc.DigMenuInSideCheck()
    if shopIns:DigGetDungeonFlag() == false then
      if shopIns:GetTalk() then
        if shopIns:GetState() == DIG_STATE.DIG then
          ShopSys:Talk(SHOP_DIG__ALREADY_DIG, nil)
          FlowSys:Next("DigMenuEnd")
        else
          FlowSys:Next("DigMenuInSideTop")
        end
      else
        shopIns:SetTalk(true)
        if shopIns:GetState() == DIG_STATE.REWARD or shopIns:GetState() == DIG_STATE.NOT_GET_ITEMS then
          FlowSys:Next("DigMenuDigTreasure")
        else
          FlowSys:Next("DigMenuInSideTop")
        end
      end
    else
      FlowSys:Next("TestDungeonFlow")
    end
  end
  function FlowSys.Proc.DigMenuInSideTop()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_DIG__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {
      next = "DigMenuFinish"
    }, {text = SHOP_DIG__WELCOME_DIG, next = "DigMenuDig"}, {
      text = SHOP_DIG__WELCOME_HELP,
      next = "DigMenuHelp"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.DigMenuInSideTopLoop()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_DIG__SERIES, FACE_TYPE.NORMAL, {cursorReset = true}, {
      next = "DigMenuFinish"
    }, {text = SHOP_DIG__SERIES_DIG, next = "DigMenuDig"}, {
      text = SHOP_DIG__SERIES_HELP,
      next = "DigMenuHelp"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.DigMenuDigTreasure()
    if shopIns:IsItemHit() then
      EventPlay.eventShopDigDetectItem()
      FlowSys:Next("DigMenuGetItems")
    elseif shopIns:IsDungeonHit() then
      FlowSys:Next("DigMenuGetDungeon")
    else
      EventPlay.eventShopDigDetectNo()
      FlowSys:Next("DigMenuInSideTopLoop")
    end
  end
  function FlowSys.Proc.DigMenuGetItems()
    if shopIns:IsItemHit() then
      local item = shopIns:GetDigItemId()
      local num = shopIns:GetDigItemCount()
      OverFlow:AddOverflowCheckItem(item, num, true)
      SOUND:PlayMe(SymSnd("ME_REWARD"))
      shopIns:DeleteCurrentDigItem()
      SOUND:WaitMe()
      FlowSys:Next("DigMenuGetItems")
    elseif shopIns:IsDungeonHit() then
      OverFlow:OpenOrderOverflowMenu(true)
      EventPlay.eventShopDigDetectDungeon()
      FlowSys:Next("DigMenuGetDungeon")
    else
      OverFlow:OpenOrderOverflowMenu(true)
      FlowSys:Next("DigMenuInSideTopLoop")
    end
  end
  function FlowSys.Proc.DigMenuGetDungeon()
    SOUND:PlayMe(SymSnd("ME_EVT_DAN_01"))
    ShopSys:Talk(SHOP_DIG__DIG_DUNGEON, nil)
    WINDOW:KeyWait()
    SOUND:PlayMe(SymSnd("ME_DUNGEON_OPEN"))
    ShopSys:SysMsg(SHOP_DIG__GET_DUNGEON, nil)
    SOUND:WaitMe()
    WINDOW:KeyWait()
    ShopSys:Talk(SHOP_DIG__DIG_FINISH, nil)
    shopIns:DigSetDungeonFlag(true)
    FlowSys:Next("DigMenuDeleteDungeon")
  end
  function FlowSys.Proc.DigMenuDeleteDungeon()
    FlowSys:Next("DigMenuEnd")
  end
  function FlowSys.Proc.DigMenuDig()
    FlowSys:Next("DigMenuSelectDigDepth")
  end
  function FlowSys.Proc.DigMenuSelectDigDepth()
    depth = 0
    CommonSys:OpenBasicMenu(nil, 1331611147, nil)
    ShopSys:TalkAskFlowNoClose(SHOP_DIG__DIG_INTO, FACE_TYPE.NORMAL, {cursorReset = true}, {
      next = "DigMenuInSideTopLoop"
    }, {
      text = SHOP_DIG__DIG_DEPTH_MSG_10,
      next = "DigMenuDepthSelect10"
    }, {
      text = SHOP_DIG__DIG_DEPTH_MSG_50,
      next = "DigMenuDepthSelect50"
    }, {
      text = SHOP_DIG__DIG_DEPTH_MSG_100,
      next = "DigMenuDepthSelect100"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.DigMenuDepthSelect10()
    depth = 1
    FlowSys:Next("DigMenuDecideDigDepth")
  end
  function FlowSys.Proc.DigMenuDepthSelect50()
    depth = 5
    FlowSys:Next("DigMenuDecideDigDepth")
  end
  function FlowSys.Proc.DigMenuDepthSelect100()
    depth = 10
    FlowSys:Next("DigMenuDecideDigDepth")
  end
  function FlowSys.Proc.DigMenuDecideDigDepth()
    local price = DIG_PRICE_RATE_10M * depth
    MENU:SetTag_Value(0, depth * 10)
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\230\183\177\227\129\149", MENU:ReplaceTagText("[value_b:0]"))
    MENU:SetTag_Money(0, price)
    ShopSys:SetShopTag("\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141", MENU:ReplaceTagText("[st_money:0]"))
    ShopSys:DispMoneyWindowOpen()
    ShopSys:TalkAskFlowNoClose(SHOP_DIG__OUTSIDE_DIG_SELECT, nil, nil, {
      next = "DigMenuSelectDigDepth"
    }, {
      text = SHOP_DIG__OUTSIDE_DIG_SELECT_YES,
      next = "DigMenuCheckEnoughMoneyForDepth"
    }, {
      text = SHOP_DIG__OUTSIDE_DIG_SELECT_NO,
      next = "DigMenuSelectDigDepth",
      default = true
    })
    ShopSys:DispMoneyWindowClose()
  end
  function FlowSys.Proc.DigMenuCheckEnoughMoneyForDepth()
    local price = DIG_PRICE_RATE_10M * depth
    if price <= GROUND:GetPlayerMoney() then
      GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() - price)
      shopIns:SetDigCount(depth)
      EventPlay.eventShopDigThanks()
      FlowSys:Next("DigMenuEnd")
    else
      EventPlay.eventShopDigNoMoney()
      FlowSys:Next("DigMenuSelectDigDepth")
    end
  end
  function FlowSys.Proc.TestDungeonFlow()
    ShopSys:Talk(SHOP_DIG__DUNGEON_INTO, nil)
    WINDOW:CloseMessage()
    ShopSys:SysMsg(SHOP_DIG__DUNGEON_ANNOUNCE, nil)
    WINDOW:CloseMessage()
    if FLAG.ParaLandType == CONST.PARA_LAND_TYPE_PRAIRIE then
      ShopSys:Talk(SHOP_DIG__TYPE_WEED, nil)
      WINDOW:CloseMessage()
    elseif FLAG.ParaLandType == CONST.PARA_LAND_TYPE_WATER then
      ShopSys:Talk(SHOP_DIG__TYPE_WATER, nil)
      WINDOW:CloseMessage()
    elseif FLAG.ParaLandType == CONST.PARA_LAND_TYPE_ROCKY_HILL then
      ShopSys:Talk(SHOP_DIG__TYPE_ROCK, nil)
      WINDOW:CloseMessage()
    elseif FLAG.ParaLandType == CONST.PARA_LAND_TYPE_FOREST then
      ShopSys:Talk(SHOP_DIG__TYPE_WOOD, nil)
      WINDOW:CloseMessage()
    end
    ShopSys:TalkAskFlowNoClose(SHOP_DIG__GO_DUNGEON, nil, nil, {
      next = "DigMenuFinish"
    }, {
      text = SHOP_DIG__GO_DUNGEON_YES,
      next = "DungeonExplore"
    }, {
      text = SHOP_DIG__GO_DUNGEON_NO,
      next = "DigMenuFinish",
      default = true
    })
  end
  function FlowSys.Proc.DungeonExplore()
    ShopSys:Talk(SHOP_DIG__GO_DUNGEON_START, nil)
    WINDOW:CloseMessage()
    SOUND:FadeOutBgm(TimeSec(0.5))
    SCREEN_A:FadeOutAll(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    SCREEN_B:FadeOut(TimeSec(0), false)
    SCREEN_A:FadeOut(TimeSec(0), false)
    GROUND:BrokenLandShopWaitNone(GROUND:GetNowLandIndex(), spaceIndex)
    subMapCameraDefMode()
    SYSTEM:ResetRescueCount()
    SYSTEM:IncAdventureCount()
    FUNC_COMMON:SetSdmcEnable(false)
    if FLAG.ParaLandType == CONST.PARA_LAND_TYPE_PRAIRIE then
      SYSTEM:EnterDungeon(Dg(83))
    elseif FLAG.ParaLandType == CONST.PARA_LAND_TYPE_WATER then
      SYSTEM:EnterDungeon(Dg(84))
    elseif FLAG.ParaLandType == CONST.PARA_LAND_TYPE_ROCKY_HILL then
      SYSTEM:EnterDungeon(Dg(85))
    elseif FLAG.ParaLandType == CONST.PARA_LAND_TYPE_FOREST then
      SYSTEM:EnterDungeon(Dg(86))
    end
    FlowSys:Next("DigMenuEnd")
  end
  function FlowSys.Proc.DigMenuHelp()
    ShopSys:Talk(SHOP_DIG__HELP, nil)
    WINDOW:CloseMessage()
    FlowSys:Next("DigMenuInSideTopLoop")
  end
  function FlowSys.Proc.DigMenuFinish()
    ShopSys:Talk(SHOP_DIG__EXIT, nil)
    FlowSys:Next("DigMenuEnd")
  end
  function FlowSys.Proc.DigMenuEnd()
    FlowSys:Return()
  end
  function EventPlay.eventShopDigNoMoney()
    ShopSys:Talk(SHOP_DIG__DIG_NO_MONEY, nil)
    WINDOW:CloseMessage()
  end
  function EventPlay.eventShopDigThanks()
    subEveDoubleJump(CH(shopIns:GetOwnerSymbol()))
    ShopSys:Talk(SHOP_DIG__DIG_THANKS, nil)
    WINDOW:CloseMessage()
  end
  function EventPlay.eventShopDigDetectNo()
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    local POINT_CENTER = SymPos(string.format("@SHOP_CENTER%02d", spaceIndex))
    local SHOP_OWNER_DEF = SHOP_OWNER:GetDir()
    ShopSys:Talk(SHOP_DIG__CANT_DIG01, nil)
    WINDOW:CloseMessage()
    SHOP_OWNER:DirTo(POINT_CENTER, Speed(500), ROT_TYPE.NEAR)
    SHOP_OWNER:SetNeckRot(RotateTarget(0), RotateTarget(-35), RotateTarget(0), TimeSec(0.3))
    SHOP_OWNER:WaitNeckRot()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"))
    SHOP_OWNER:SetManpu("MP_SWEAT_L")
    ShopSys:Talk(SHOP_DIG__CANT_DIG02, nil)
    ShopSys:Talk(SHOP_DIG__CANT_DIG03, nil)
    WINDOW:CloseMessage()
    SHOP_OWNER:ResetNeckRot(TimeSec(0.15))
    SHOP_OWNER:WaitNeckRot()
    SHOP_OWNER:DirTo(RotateTarget(SHOP_OWNER_DEF), Speed(500), ROT_TYPE.NEAR)
    SHOP_OWNER:WaitRotate()
  end
  function EventPlay.eventShopDigDetectItem()
    local SHOP_OWNER = CH(string.format("LAND_SHOP_STAFF_%02d", spaceIndex))
    subEveJump(CH(shopIns:GetOwnerSymbol()))
    SHOP_OWNER:SetManpu("MP_LAUGH_LP")
    ShopSys:Talk(SHOP_DIG__DIG_TREASURE, nil)
    WINDOW:CloseMessage()
    SHOP_OWNER:ResetManpu()
  end
  function EventPlay.eventShopDigDetectDungeon()
    subEveDoubleJump(CH(shopIns:GetOwnerSymbol()))
    ShopSys:Talk(SHOP_DIG__DIG_TREASURE_DUNGEON, nil)
    WINDOW:CloseMessage()
  end
  FlowSys:Call("DigMenuInSideCheck")
  WINDOW:CloseMessage()
  FlowSys:Finish()
  ShopSys:Finish()
end

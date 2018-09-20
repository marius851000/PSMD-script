VrouletteSys = {}
VrouletteSys.pokemonTypeInfoTbl = {
  {
    Type = PokemonType.NORMAL,
    Name = "[type:1]",
    Icon = "[M:TNORMAL]"
  },
  {
    Type = PokemonType.GRASS,
    Name = "[type:2]",
    Icon = "[M:TGRASS]"
  },
  {
    Type = PokemonType.FIRE,
    Name = "[type:3]",
    Icon = "[M:TFIRE]"
  },
  {
    Type = PokemonType.WATER,
    Name = "[type:4]",
    Icon = "[M:TWATER]"
  },
  {
    Type = PokemonType.ELECTRIC,
    Name = "[type:5]",
    Icon = "[M:TELECTRIC]"
  },
  {
    Type = PokemonType.ICE,
    Name = "[type:6]",
    Icon = "[M:TICE]"
  },
  {
    Type = PokemonType.FIGHTING,
    Name = "[type:7]",
    Icon = "[M:TFIGHTING]"
  },
  {
    Type = PokemonType.POISON,
    Name = "[type:8]",
    Icon = "[M:TPOISON]"
  },
  {
    Type = PokemonType.GROUND,
    Name = "[type:9]",
    Icon = "[M:TGROUND]"
  },
  {
    Type = PokemonType.FLYING,
    Name = "[type:10]",
    Icon = "[M:TFLYING]"
  },
  {
    Type = PokemonType.PSYCHIC,
    Name = "[type:11]",
    Icon = "[M:TPSYCHIC]"
  },
  {
    Type = PokemonType.BUG,
    Name = "[type:12]",
    Icon = "[M:TBUG]"
  },
  {
    Type = PokemonType.ROCK,
    Name = "[type:13]",
    Icon = "[M:TROCK]"
  },
  {
    Type = PokemonType.GHOST,
    Name = "[type:14]",
    Icon = "[M:TGHOST]"
  },
  {
    Type = PokemonType.DRAGON,
    Name = "[type:15]",
    Icon = "[M:TDRAGON]"
  },
  {
    Type = PokemonType.DARK,
    Name = "[type:16]",
    Icon = "[M:TDARK]"
  },
  {
    Type = PokemonType.STEEL,
    Name = "[type:17]",
    Icon = "[M:TSTEEL]"
  }
}
VrouletteSys.pokemonTypeInfoLutTbl = {
  [PokemonType.NORMAL] = VrouletteSys.pokemonTypeInfoTbl[1],
  [PokemonType.GRASS] = VrouletteSys.pokemonTypeInfoTbl[2],
  [PokemonType.FIRE] = VrouletteSys.pokemonTypeInfoTbl[3],
  [PokemonType.WATER] = VrouletteSys.pokemonTypeInfoTbl[4],
  [PokemonType.ELECTRIC] = VrouletteSys.pokemonTypeInfoTbl[5],
  [PokemonType.ICE] = VrouletteSys.pokemonTypeInfoTbl[6],
  [PokemonType.FIGHTING] = VrouletteSys.pokemonTypeInfoTbl[7],
  [PokemonType.POISON] = VrouletteSys.pokemonTypeInfoTbl[8],
  [PokemonType.GROUND] = VrouletteSys.pokemonTypeInfoTbl[9],
  [PokemonType.FLYING] = VrouletteSys.pokemonTypeInfoTbl[10],
  [PokemonType.PSYCHIC] = VrouletteSys.pokemonTypeInfoTbl[11],
  [PokemonType.BUG] = VrouletteSys.pokemonTypeInfoTbl[12],
  [PokemonType.ROCK] = VrouletteSys.pokemonTypeInfoTbl[13],
  [PokemonType.GHOST] = VrouletteSys.pokemonTypeInfoTbl[14],
  [PokemonType.DRAGON] = VrouletteSys.pokemonTypeInfoTbl[15],
  [PokemonType.DARK] = VrouletteSys.pokemonTypeInfoTbl[16],
  [PokemonType.STEEL] = VrouletteSys.pokemonTypeInfoTbl[17]
}
function VrouletteSys:CheckCanNotRoulette()
  return FLAG.ParaShopVRoulettePlay
end
function VrouletteSys:SetRouletteType(Type)
  self.selectType = Type
end
function VrouletteSys:GetRouletteType()
  return self.selectType
end
function VrouletteSys:GetTodayRouletteType()
  return GROUND:GetVWaveForecastType(GROUND:GetVWaveForecastCurrentDay())
end
function VrouletteSys:GetRouletteTypeName()
  local text = self.pokemonTypeInfoLutTbl[self.selectType].Name
  return MENU:ReplaceTagText(text)
end
function VrouletteSys:GetTodayTypeName()
  local text = self.pokemonTypeInfoLutTbl[self:GetTodayRouletteType()].Name
  return MENU:ReplaceTagText(text)
end
function VrouletteSys:ChangeToSelectType()
  SYSTEM:SetVWaveType(self.selectType, 0)
end
function VrouletteSys:ChangeVRouletteMap()
  MAP:DynamicUnloadGroundMap()
  TASK:Sleep(TimeSec(0))
  TASK:Sleep(TimeSec(0))
  TASK:Sleep(TimeSec(0))
  MAP:DynamicLoadGroundMap(SymMap("EV_800_V_ROULETTE"))
end
function VrouletteSys:ClearVRouletteMap()
  MAP:DynamicUnloadGroundMap()
  TASK:Sleep(TimeSec(0))
  TASK:Sleep(TimeSec(0))
  TASK:Sleep(TimeSec(0))
  MAP:DynamicLoadGroundMap(SymMap("PARA_CENTER_4"))
end
function VrouletteSys:SaveCharaPosition()
  self.savePosTbl = {}
  self.saveVisibleTbl = {}
  self.saveCam = {
    eye = CAMERA:GetEye(),
    tgt = CAMERA:GetTgt()
  }
  for idx = 0, CHARA:GetSymbolNum() - 1 do
    self.saveVisibleTbl[CHARA:GetSymbol(idx)] = CH(CHARA:GetSymbol(idx)):GetVisible()
  end
  for idx = 0, CHARA:GetSymbolNum() - 1 do
    CH(CHARA:GetSymbol(idx)):SetVisible(false)
  end
  CH("BIKUTYINI"):SetVisible(true)
  local symTbl = {
    "BIKUTYINI",
    "PARTY0",
    "PARTY1",
    "PARTY2",
    "PARTY3"
  }
  for i, sym in ipairs(symTbl) do
    if CHARA:IsExist(sym) then
      self.savePosTbl[sym] = {}
      self.savePosTbl[sym].pos = CH(sym):GetPosition()
      self.savePosTbl[sym].dir = CH(sym):GetDir()
    end
  end
  MULTI_PLAY:SetMultiplayerVisible(false)
end
function VrouletteSys:ResumeCharaPosition()
  local symTbl = {
    "BIKUTYINI",
    "PARTY0",
    "PARTY1",
    "PARTY2",
    "PARTY3"
  }
  for i, sym in ipairs(symTbl) do
    if CHARA:IsExist(sym) then
      CH(sym):SetPosition(self.savePosTbl[sym].pos)
      CH(sym):SetDir(RotateTarget(self.savePosTbl[sym].dir))
    end
  end
  for idx = 0, CHARA:GetSymbolNum() - 1 do
    if self.saveVisibleTbl[CHARA:GetSymbol(idx)] then
      CH(CHARA:GetSymbol(idx)):SetVisible(self.saveVisibleTbl[CHARA:GetSymbol(idx)])
    end
  end
  CAMERA:SetEye(self.saveCam.eye)
  CAMERA:SetTgt(self.saveCam.tgt)
  CAMERA:SetDefaultGroundFovy()
  self.saveCam = nil
  self.savePosTbl = nil
  self.saveVisibleTbl = nil
  MULTI_PLAY:SetMultiplayerVisible(true)
end
function VrouletteSys:CutUseStart(symCut)
  CUT:Load(symCut)
  CUT:ClearHomeButtonBan()
  CUT:ForceUpdateFrame(0)
  MAP:SetVisible(true)
end
function VrouletteSys:CutUseFinish()
  CUT:Destroy()
end
function VrouletteSys:CutPlayAndWait(symMsgId)
  CUT:Play()
  CUT:SeekFrame(symMsgId, false)
  CUT:Wait(symMsgId, true)
  CUT:Pause()
end
function VrouletteSys:CutPlay(symMsgId)
  CUT:Play(symMsgId)
end
function VrouletteSys:IsCutPlaying()
  if CUT:IsEnd() then
    return false
  end
  return true
end
function VrouletteSys:CutWait()
  CUT:Wait()
end
function VrouletteSys:CutSetIgnoreSymbol(symbolTbl)
  for i, symbol in ipairs(symbolTbl) do
    CUT:AddIgnoreTargetName(symbol)
  end
end
function VrouletteSys:CutClearIgnoreSymbol()
  CUT:ClearIgnoreTargetSymbol()
end
function VrouletteSys:StartRouletteSystem()
  VrouletteSys:SaveCharaPosition()
  VrouletteSys:ChangeVRouletteMap()
  VrouletteSys:CutUseStart(SymCut("CUT_V_ROULETTE"))
  VrouletteCircleSys:Start()
  CH("BIKUTYINI"):SetHeight(Height(0.13))
end
function VrouletteSys:FinishRouletteSystem()
  VrouletteCircleSys:Finish()
  VrouletteSys:CutUseFinish()
  VrouletteSys:ClearVRouletteMap()
  TASK:Sleep(TimeSec(0))
  VrouletteSys:ResumeCharaPosition()
  CH("BIKUTYINI"):SetScale(Scale(1))
  CH("BIKUTYINI"):SetHeight(Height(0))
  CH("BIKUTYINI"):ResetFacialMotion()
  CH("BIKUTYINI"):ForceMaterialUpdate()
end
VrouletteCircleSys = {}
function VrouletteCircleSys:Start()
  self.gmCircle = GM("V_ROULETTE_CIRCLE_01")
  self.gmMark02Tbl = {
    GM("V_ROULETTE_MARK02_01"),
    GM("V_ROULETTE_MARK02_02"),
    GM("V_ROULETTE_MARK02_03"),
    GM("V_ROULETTE_MARK02_04")
  }
  self.gmCircle:SetVisible(true)
  for i, gm in ipairs(self.gmMark02Tbl) do
    gm:SetVisible(false)
  end
  TASK:Sleep(TimeSec(0))
  self.markOffsVTbl = {}
  self.markRotTbl = {}
  local centerPos = self.gmCircle:GetPosition()
  for i, gm in ipairs(self.gmMark02Tbl) do
    local gmPos = gm:GetPosition()
    local offsV = gmPos - centerPos
    self.markOffsVTbl[i] = offsV
    self.markRotTbl[i] = gm:GetRoll()
  end
end
function VrouletteCircleSys:Finish()
  self.gmCircle = nil
  self.gmMark02Tbl = nil
end
function VrouletteCircleSys:SetMarkBet(idx)
  if idx == 1 then
    return
  end
  self.gmMark02Tbl[idx - 1]:SetVisible(true)
end
function VrouletteCircleSys:ClearMark(idx)
  if idx == 1 then
    return
  end
  self.gmMark02Tbl[idx - 1]:SetVisible(false)
end
function VrouletteCircleSys:IsMarkBet(idx)
  if idx == 1 then
    return true
  end
  return self.gmMark02Tbl[idx - 1]:IsVisible()
end
function VrouletteCircleSys:GetMarkPos(idx)
  if idx == 1 then
    return Vector(0, 0, 0)
  end
  return self.gmMark02Tbl[idx - 1]:GetPosition()
end
function VrouletteCircleSys:GetRotate()
  return self.gmCircle:GetRoll()
end
function VrouletteCircleSys:GetRotateAbs360()
  if self:GetRotate() > 0 then
    return math.fmod(self:GetRotate(), 360)
  else
    return math.fmod(self:GetRotate(), 360) + 360
  end
end
function VrouletteCircleSys:SetRotate(deg)
  self.gmCircle:SetRoll(RotateTarget(deg))
  local rotRad = deg / 180 * math.pi
  local centerPos = self.gmCircle:GetPosition()
  for i, gm in ipairs(self.gmMark02Tbl) do
    local offsV = Vector(self.markOffsVTbl[i])
    local rx = offsV.x * math.cos(rotRad) - offsV.y * math.sin(rotRad)
    local ry = offsV.x * math.sin(rotRad) + offsV.y * math.cos(rotRad)
    offsV.x = rx
    offsV.y = ry
    gm:SetPosition(offsV + centerPos)
    gm:SetRoll(RotateTarget(self.markRotTbl[i] + deg))
  end
end
function VrouletteCircleSys:UseMarkControl()
  VrouletteSys:CutSetIgnoreSymbol({
    "V_ROULETTE_MARK01_01",
    "V_ROULETTE_MARK01_02",
    "V_ROULETTE_MARK01_03",
    "V_ROULETTE_MARK01_04",
    "V_ROULETTE_MARK02_01",
    "V_ROULETTE_MARK02_02",
    "V_ROULETTE_MARK02_03",
    "V_ROULETTE_MARK02_04"
  })
end
function VrouletteCircleSys:UseCircleControl()
  VrouletteSys:CutSetIgnoreSymbol({
    "V_ROULETTE_CIRCLE_01"
  })
end
function VrouletteCircleSys:ClearControl(deg)
  VrouletteSys:CutClearIgnoreSymbol()
end
TaskTalkSys = {}
function TaskTalkSys:Talk(posX, posY, FaceType, message)
  TASK:Regist(Group("talkTask"), function()
    WINDOW:DrawFace(posX, posY, SymAct("BIKUTYINI"), FaceType)
    WINDOW:Talk(SymAct("BIKUTYINI"), message)
  end)
end
function TaskTalkSys:IsTalk()
  return TASK:IsEndTasks(Group("talkTask")) == false
end
function TaskTalkSys:ForceCloseMessage()
  TASK:WaitTask(Group("talkTask"))
  WINDOW:ForceCloseMessage()
end
function TaskTalkSys:TalkJump()
  TASK:Regist(Group("bikuJumpTask"), function()
    function TaskL.Start()
    end
    function TaskL.Loop()
      CH("BIKUTYINI"):SetNextMotion(SymMot("DWALK"), LOOP.ON, TimeSec(0.2))
      CH("BIKUTYINI"):SetMotionRaito(Raito(1))
      for t = 0, 4 do
        local rate = t / 4 * 0.5 + 0
        local height = math.sin(rate * math.pi) * 0.2
        CH("BIKUTYINI"):SetHeight(Height(height + 0.13))
        TASK:Sleep(TimeSec(0))
      end
      TASK:Sleep(TimeSec(0.3))
      for t = 0, 5 do
        local rate = t / 5 * 0.5 + 0.5
        local height = math.sin(rate * math.pi) * 0.2
        CH("BIKUTYINI"):SetHeight(Height(height + 0.13))
        TASK:Sleep(TimeSec(0))
      end
      TASK:Sleep(TimeSec(0.2), TASK_EXIT.QUICK)
    end
    function TaskL.Finish()
      CH("BIKUTYINI"):SetHeight(Height(0.13))
      CH("BIKUTYINI"):SetNextMotion(SymMot("DWALK"), LOOP.ON, TimeSec(0.5))
      CH("BIKUTYINI"):SetMotionRaito(Raito(1.5))
    end
  end)
end
function TaskTalkSys:TalkJumpWait()
  TASK:WaitTask(Group("bikuJumpTask"))
end
function OpenVrouletteShopMenu()
  SYSTEM:FreeMoveScriptEventStartAll()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetOwner("BIKUTYINI")
  function FlowSys.Proc.CheckMultiPlayCriant()
    if MULTI_PLAY:IsLogined() then
      if MULTI_PLAY:IsMaster() then
        FlowSys:Next("MenuTopFirst")
        return
      else
        ShopSys:Talk(V_ROULETTE__WELCOME_GUEST, FACE_TYPE.NORMAL)
        WINDOW:CloseMessage()
        FlowSys:Next("SHOPEND")
        return
      end
    end
    FlowSys:Next("MenuTopFirst")
  end
  function FlowSys.Proc.MenuTopFirst()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(V_ROULETTE__WELCOME, FACE_TYPE.NORMAL, {cursorReset = true}, {next = "ExitShop"}, {
      text = V_ROULETTE__WELCOME_ROULETTE,
      next = "TopRoulette"
    }, {
      text = V_ROULETTE__WELCOME_FORECAST,
      next = "TopForecast"
    }, {text = V_ROULETTE__WELCOME_HELP, next = "Help"}, {
      text = "[M:DEBUG]\227\131\149\227\131\169\227\130\176\227\130\175\227\131\170\227\130\162",
      next = "MenuTopFirst",
      actTbl = {
        decideAction = function(self)
          FLAG.ParaShopVRoulettePlay = CONST.FLAG_FALSE
        end
      },
      enableFunc = function()
        return SYSTEM:IsDebugMasterSwitch()
      end
    }, {
      text = "[M:DEBUG]\227\129\138\227\129\139\227\129\173\227\129\132\227\129\163\227\129\177\227\129\132",
      next = "MenuTopFirst",
      actTbl = {
        decideAction = function(self)
          GROUND:SetPlayerMoney(9999)
        end
      },
      enableFunc = function()
        return SYSTEM:IsDebugMasterSwitch()
      end
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.MenuTopLoop()
    ShopSys:SetSelectGoodsTbl(nil)
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:TalkAskFlowNoClose(V_ROULETTE__SERIES, nil, {cursorReset = true}, {next = "ExitShop"}, {
      text = V_ROULETTE__SERIES_ROULETTE,
      next = "TopRoulette"
    }, {
      text = V_ROULETTE__SERIES_FORECAST,
      next = "TopForecast"
    }, {text = V_ROULETTE__SERIES_HELP, next = "Help"}, {
      text = "[M:DEBUG]\227\131\149\227\131\169\227\130\176\227\130\175\227\131\170\227\130\162",
      next = "MenuTopFirst",
      actTbl = {
        decideAction = function(self)
          FLAG.ParaShopVRoulettePlay = CONST.FLAG_FALSE
        end
      },
      enableFunc = function()
        return SYSTEM:IsDebugMasterSwitch()
      end
    }, {
      text = "[M:DEBUG]\227\129\138\227\129\139\227\129\173\227\129\132\227\129\163\227\129\177\227\129\132",
      next = "MenuTopFirst",
      actTbl = {
        decideAction = function(self)
          GROUND:SetPlayerMoney(9999)
        end
      },
      enableFunc = function()
        return SYSTEM:IsDebugMasterSwitch()
      end
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.TopRoulette()
    if VrouletteSys:CheckCanNotRoulette() == CONST.FLAG_TRUE then
      ShopSys:Talk(V_ROULETTE__ALREADY_PLAY, nil)
      FlowSys:Next("MenuTopLoop")
      return
    end
    FlowSys:Next("RouletteFlowStart")
  end
  function FlowSys.Proc.RouletteFlowStart()
    ShopSys:SetShopTag("\228\187\138\230\151\165\227\129\174\227\130\191\227\130\164\227\131\151", VrouletteSys:GetTodayTypeName())
    ShopSys:Talk(V_ROULETTE__ROULETTE_INTO, nil)
    WINDOW:CloseMessage()
    SOUND:FadeOutBgm(TimeSec(0.5))
    EFFECT:SpotWipeOut(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), false)
    EFFECT:SpotWipeWait()
    EFFECT:SpotWipeIn(TimeSec(0), false)
    SCREEN_A:FadeOutAll(TimeSec(0), false)
    SCREEN_B:FadeOutAll(TimeSec(0), false)
    VrouletteSys:StartRouletteSystem()
    SCREEN_A:FadeIn(TimeSec(0), false)
    SCREEN_A:FadeInAll(TimeSec(0), false)
    EFFECT:SpotWipeIn(TimeSec(0.5), false)
    FlowSys:Next("RouletteAddSelect")
  end
  function FlowSys.Proc.RouletteFlowFinish()
    WINDOW:CloseMessage()
    SOUND:FadeOutBgm(TimeSec(0.5))
    EFFECT:SpotWipeOut(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), false)
    EFFECT:SpotWipeWait()
    EFFECT:SpotWipeIn(TimeSec(0), false)
    SCREEN_A:FadeOutAll(TimeSec(0), false)
    SCREEN_B:FadeOutAll(TimeSec(0), false)
    VrouletteSys:FinishRouletteSystem()
    subMapBgmPlay()
    subMapCameraSet()
    CAMERA:MoveToPlayer(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
    SCREEN_A:FadeIn(TimeSec(0), false)
    SCREEN_B:FadeIn(TimeSec(0), false)
    SCREEN_A:FadeInAll(TimeSec(0), false)
    EFFECT:SpotWipeIn(TimeSec(0.5), false)
    SCREEN_B:FadeInAll(TimeSec(0.5), true)
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.RouletteAddSelect()
    WINDOW:CloseMessage()
    DispRouletteBuyUI({
      startTalkAct = function()
        SCREEN_B:FadeIn(TimeSec(0), false)
        SCREEN_B:FadeInAll(TimeSec(0.5), true)
        WINDOW:Talk(SymAct("BIKUTYINI"), V_ROULETTE__ROULETTE_BET_READY)
        WINDOW:CloseMessage()
      end,
      decideAsk = function()
        TaskTalkSys:TalkJump()
        ShopSys:TalkAskFlowNoClose(V_ROULETTE__ROULETTE_SELECT, false, {cursorReset = true}, {next = ""}, {
          text = V_ROULETTE__ROULETTE_SELECT_YES,
          next = "RouletteAction"
        }, {text = V_ROULETTE__ROULETTE_SELECT_NO, next = ""})
        WINDOW:CloseMessage()
        TaskTalkSys:TalkJumpWait()
        if ShopSys:NeedReturnFlow() then
          SCREEN_B:FadeOut(TimeSec(0), false)
          SCREEN_B:FadeOutAll(TimeSec(0.5), true)
        end
        return ShopSys:NeedReturnFlow()
      end,
      noMoneyAsk = function()
        TaskTalkSys:TalkJump()
        ShopSys:TalkAskFlowNoClose(V_ROULETTE__ROULETTE_SELECT, false, {cursorReset = true}, {next = ""}, {
          text = V_ROULETTE__ROULETTE_SELECT_YES,
          next = "RouletteAction"
        }, {
          text = V_ROULETTE__ROULETTE_SELECT_NO,
          next = "",
          default = true
        })
        WINDOW:CloseMessage()
        TaskTalkSys:TalkJumpWait()
        if ShopSys:NeedReturnFlow() then
          SOUND:FadeOutBgm(TimeSec(0.5))
        end
        return ShopSys:NeedReturnFlow()
      end,
      cancelAsk = function()
        ShopSys:Talk(V_ROULETTE__ROULETTE_CANCEL, nil)
        FlowSys:Next("RouletteFlowFinish")
        return ShopSys:NeedReturnFlow()
      end
    })
  end
  function FlowSys.Proc.RouletteAction()
    FLAG.ParaShopVRoulettePlay = CONST.FLAG_TRUE
    DispRouletteRouletteExecute({
      successAct = function()
        VrouletteSys:CutPlay(SymCutMsgId("StartTalk2"))
        VrouletteSys:CutWait()
        CH("BIKUTYINI"):SetNextMotion(SymMot("DWALK"), LOOP.ON, TimeSec(0.4))
        ShopSys:Talk(V_ROULETTE__ROULETTE_HIT, nil)
        FlowSys:Next("SelectChangeType")
      end,
      failedAct = function()
        VrouletteSys:CutPlay(SymCutMsgId("StartTalk2"))
        VrouletteSys:CutWait()
        CH("BIKUTYINI"):SetNextMotion(SymMot("DWALK"), LOOP.ON, TimeSec(0.4))
        ShopSys:SetShopTag("\228\187\138\230\151\165\227\129\174\227\130\191\227\130\164\227\131\151", VrouletteSys:GetTodayTypeName())
        ShopSys:Talk(V_ROULETTE__ROULETTE_MISS, nil)
        FlowSys:Next("RouletteFlowFinish")
      end
    })
  end
  function FlowSys.Proc.SelectChangeType()
    WINDOW:CloseMessage()
    EFFECT:SpotWipeOut(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    EFFECT:SpotWipeWait()
    for idx = 2, 5 do
      VrouletteCircleSys:ClearMark(idx)
    end
    CH("BIKUTYINI"):ResetFacialMotion()
    SOUND:PlayBgm(SymSnd("BGM_SYS_MINIGAME_01"), Volume(256))
    EFFECT:SpotWipeIn(TimeSec(0), false)
    SCREEN_A:FadeOutAll(TimeSec(0), false)
    SCREEN_B:FadeOutAll(TimeSec(0), false)
    DispSelectTypeInRoulette(function(selectType)
      VrouletteSys:SetRouletteType(selectType)
      if VrouletteSys:GetTodayRouletteType() == VrouletteSys:GetRouletteType() then
        FlowSys:Next("ChangeTypeSelectedSame")
        return
      end
      FlowSys:Next("ChangeTypeSelected")
    end, true)
    SCREEN_A:FadeIn(TimeSec(0), false)
    SCREEN_B:FadeIn(TimeSec(0), false)
    SCREEN_A:FadeInAll(TimeSec(0), false)
    EFFECT:SpotWipeIn(TimeSec(0.5), false)
    SCREEN_B:FadeInAll(TimeSec(0.5), true)
  end
  function FlowSys.Proc.SelectChangeTypeSecond()
    WINDOW:CloseMessage()
    EFFECT:SpotWipeOut(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    EFFECT:SpotWipeWait()
    EFFECT:SpotWipeIn(TimeSec(0), false)
    SCREEN_A:FadeOutAll(TimeSec(0), false)
    SCREEN_B:FadeOutAll(TimeSec(0), false)
    DispSelectTypeInRoulette(function(selectType)
      VrouletteSys:SetRouletteType(selectType)
      if VrouletteSys:GetTodayRouletteType() == VrouletteSys:GetRouletteType() then
        FlowSys:Next("ChangeTypeSelectedSame")
        return
      end
      FlowSys:Next("ChangeTypeSelected")
    end, false)
    SCREEN_A:FadeIn(TimeSec(0), false)
    SCREEN_B:FadeIn(TimeSec(0), false)
    SCREEN_A:FadeInAll(TimeSec(0), false)
    EFFECT:SpotWipeIn(TimeSec(0.5), false)
    SCREEN_B:FadeInAll(TimeSec(0.5), true)
  end
  function FlowSys.Proc.ChangeTypeSelectedSame()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\191\227\130\164\227\131\151", VrouletteSys:GetRouletteTypeName())
    ShopSys:TalkAskFlowNoClose(V_ROULETTE__ROULETTE_TYPE_SELECT_SAME, FACE_TYPE.NORMAL, {cursorReset = true}, {
      next = "SelectTypeSameNoChange"
    }, {
      text = V_ROULETTE__ROULETTE_TYPE_SELECT_SAME_YES,
      next = "ChangeTypeSame"
    }, {
      text = V_ROULETTE__ROULETTE_TYPE_SELECT_SAME_NO,
      next = "SelectTypeSameNoChange",
      default = true
    })
    WINDOW:CloseMessage()
  end
  function FlowSys.Proc.ChangeTypeSame()
    ShopSys:SetShopTag("\228\187\138\230\151\165\227\129\174\227\130\191\227\130\164\227\131\151", VrouletteSys:GetTodayTypeName())
    ShopSys:Talk(V_ROULETTE__ROULETTE_TYPE_SAME_CHANGE, nil)
    FlowSys:Next("RouletteFlowFinish")
  end
  function FlowSys.Proc.SelectTypeSameNoChange()
    ShopSys:Talk(V_ROULETTE__ROULETTE_TYPE_SAME_NO_CHANGE, nil)
    FlowSys:Next("SelectChangeTypeSecond")
  end
  function FlowSys.Proc.ChangeTypeSelected()
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\191\227\130\164\227\131\151", VrouletteSys:GetRouletteTypeName())
    ShopSys:TalkAskFlowNoClose(V_ROULETTE__ROULETTE_TYPE_SELECT, FACE_TYPE.NORMAL, {cursorReset = true}, {
      next = "SelectChangeTypeSecond"
    }, {text = V_ROULETTE__ROULETTE_TYPE_SELECT_YES, next = "ChangeType"}, {
      text = V_ROULETTE__ROULETTE_TYPE_SELECT_NO,
      next = "SelectChangeTypeSecond"
    })
    WINDOW:CloseMessage()
  end
  function FlowSys.Proc.ChangeType()
    EFFECT:Create("markSet", SymEff("SN_BOMBDOME"))
    EFFECT:SetScale("markSet", Scale(0.4))
    EFFECT:SetPosition("markSet", Vector(0, 0, 0))
    EFFECT:Play("markSet")
    TASK:Sleep(TimeSec(0.5))
    EFFECT:Create("vwave", SymEff("BG_V_WAVE_LP"))
    EFFECT:SetScale("vwave", Scale(0.4))
    EFFECT:SetPosition("vwave", Vector(0, 0, 0))
    EFFECT:Play("vwave")
    TASK:Sleep(TimeSec(2.5))
    SOUND:PlayMe(SymSnd("ME_MINIGAME_SOSO"), Volume(256))
    ShopSys:SetShopTag("\233\129\184\230\138\158\227\129\151\227\129\159\227\130\191\227\130\164\227\131\151", VrouletteSys:GetRouletteTypeName())
    ShopSys:Talk(V_ROULETTE__ROULETTE_TYPE_CHANGE_END, nil)
    EFFECT:ChangeColor("vwave", Color(1, 1, 1, 0), TimeSec(50, TIME_TYPE.FRAME))
    EFFECT:Remove("vwave")
    TASK:Sleep(TimeSec(1))
    VrouletteSys:ChangeToSelectType()
    FlowSys:Next("RouletteFlowFinish")
  end
  function FlowSys.Proc.TopForecast()
    ShopSys:Talk(V_ROULETTE__VWAVE_FORECAST, nil)
    WINDOW:CloseMessage()
    OpenVWaveReportFlow()
    SCREEN_B:LoadWallpaper("WALLPAPER_SUB_V_ROULETTE01")
    SCREEN_B:FadeInAll(TimeSec(0.5), false)
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.Help()
    ShopSys:Talk(V_ROULETTE__HELP, nil)
    WINDOW:KeyWait()
    FlowSys:Next("MenuTopLoop")
  end
  function FlowSys.Proc.ExitShop()
    ShopSys:Talk(V_ROULETTE__EXIT, nil)
    FlowSys:Next("SHOPEND")
  end
  function FlowSys.Proc.SHOPEND()
    FlowSys:Return()
  end
  local lastVisible = LOWER_SCREEN:IsVisible()
  LOWER_SCREEN:SetVisible(false)
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_V_ROULETTE01")
  FlowSys:Call("CheckMultiPlayCriant")
  WINDOW:CloseMessage()
  LOWER_SCREEN:SetVisible(lastVisible)
  FlowSys:Finish()
  ShopSys:Finish()
  LOWER_SCREEN:ChangeLastWallpaper()
end
function OpenPokemonTypeExplain()
  local typeIdxTbl = {
    [1] = PokemonType.NORMAL,
    [2] = PokemonType.GRASS,
    [3] = PokemonType.FIRE,
    [4] = PokemonType.WATER,
    [5] = PokemonType.ELECTRIC,
    [6] = PokemonType.ICE,
    [7] = PokemonType.FIGHTING,
    [8] = PokemonType.POISON,
    [9] = PokemonType.GROUND,
    [10] = PokemonType.FLYING,
    [11] = PokemonType.PSYCHIC,
    [12] = PokemonType.BUG,
    [13] = PokemonType.ROCK,
    [14] = PokemonType.GHOST,
    [15] = PokemonType.DRAGON,
    [16] = PokemonType.DARK,
    [17] = PokemonType.STEEL
  }
  local pokemonTypeMatchInfoTbl = {
    {
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      2,
      1,
      3,
      3,
      2
    },
    {
      3,
      2,
      2,
      4,
      3,
      3,
      3,
      2,
      4,
      2,
      3,
      2,
      4,
      3,
      2,
      3,
      2
    },
    {
      3,
      4,
      2,
      2,
      3,
      4,
      3,
      3,
      3,
      3,
      3,
      4,
      2,
      3,
      2,
      3,
      4
    },
    {
      3,
      2,
      4,
      2,
      3,
      3,
      3,
      3,
      4,
      3,
      3,
      3,
      4,
      3,
      2,
      3,
      3
    },
    {
      3,
      2,
      3,
      4,
      2,
      3,
      3,
      3,
      1,
      4,
      3,
      3,
      3,
      3,
      2,
      3,
      3
    },
    {
      3,
      4,
      2,
      2,
      3,
      2,
      3,
      3,
      4,
      4,
      3,
      3,
      3,
      3,
      4,
      3,
      2
    },
    {
      4,
      3,
      3,
      3,
      3,
      4,
      3,
      2,
      3,
      2,
      2,
      2,
      4,
      1,
      3,
      4,
      4
    },
    {
      3,
      4,
      3,
      3,
      3,
      3,
      3,
      2,
      2,
      3,
      3,
      3,
      2,
      2,
      3,
      3,
      1
    },
    {
      3,
      2,
      4,
      3,
      4,
      3,
      3,
      4,
      3,
      1,
      3,
      2,
      4,
      3,
      3,
      3,
      4
    },
    {
      3,
      4,
      3,
      3,
      2,
      3,
      4,
      3,
      3,
      3,
      3,
      4,
      2,
      3,
      3,
      3,
      2
    },
    {
      3,
      3,
      3,
      3,
      3,
      3,
      4,
      4,
      3,
      3,
      2,
      3,
      3,
      3,
      3,
      1,
      2
    },
    {
      3,
      4,
      2,
      3,
      3,
      3,
      2,
      2,
      3,
      2,
      4,
      3,
      3,
      2,
      3,
      4,
      2
    },
    {
      3,
      3,
      4,
      3,
      3,
      4,
      2,
      3,
      2,
      4,
      3,
      4,
      3,
      3,
      3,
      3,
      2
    },
    {
      1,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      4,
      3,
      3,
      4,
      3,
      2,
      2
    },
    {
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      4,
      3,
      2
    },
    {
      3,
      3,
      3,
      3,
      3,
      3,
      2,
      3,
      3,
      3,
      4,
      3,
      3,
      4,
      3,
      2,
      2
    },
    {
      3,
      3,
      2,
      2,
      2,
      4,
      3,
      3,
      3,
      3,
      3,
      3,
      4,
      3,
      3,
      3,
      2
    }
  }
  SPRITE:CreatePatternSet("upperExpSet", {
    name = "bg",
    img = "WALLPAPER_MAIN_V_ROULETTE01",
    u = 0,
    v = 0,
    w = 512,
    h = 240,
    cx = 256,
    cy = 120,
    allocateFromMap = true
  })
  SPRITE:CreateSprite("upperExpSet"):SetPattern({
    setName = "upperExpSet",
    ptnName = "bg",
    ofsX = 0,
    ofsY = 0,
    ofsPrio = 0
  })
  SPRT("upperExpSet"):SetOption({
    pos = Vector2(200, 120),
    visible = true,
    prio = 600
  })
  local expBoardMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
  expBoardMenu:SetLayoutRect(CommonSys:ArgsLayoutRect(0, 0, 400, 200))
  expBoardMenu:SetTextOffset(0, 0)
  expBoardMenu:SetOption({font = "FONT_12", showBgFrame = false})
  function expBoardMenu:openedAction()
  end
  function expBoardMenu:closedAction()
    SPRITE:DestroySprite("upperExpSet")
    SPRITE:DestroyPatternSet("upperExpSet")
  end
  function expBoardMenu:SetPokemonType(pokemonType)
    local info = VrouletteSys.pokemonTypeInfoTbl[pokemonType]
    local text = string.format("[CN]%s[HS:4]%s%s[R]", info.Icon, info.Name, MENU:ReplaceTagText(V_ROULETTE__TYPE_CHANGE_MINE))
    text = text .. MENU:ReplaceTagText(V_ROULETTE__TYPE_CHANGE_GOOD)
    local cnt = 0
    local wid = 4
    for typeIdx, matchNo in ipairs(pokemonTypeMatchInfoTbl[typeIdxTbl[pokemonType]]) do
      if matchNo == 4 then
        local yOffs = 32
        local info = VrouletteSys.pokemonTypeInfoTbl[typeIdxTbl[typeIdx]]
        text = text .. string.format("[HO:%d][VO:%d]%s[HS:4]%s", 44 + 82 * (cnt % wid), yOffs + 20 + 16 * math.floor(cnt / wid), info.Icon, info.Name)
        cnt = cnt + 1
      end
    end
    local cnt = 0
    text = text .. MENU:ReplaceTagText(V_ROULETTE__TYPE_CHANGE_NORMAL)
    for typeIdx, matchNo in ipairs(pokemonTypeMatchInfoTbl[typeIdxTbl[pokemonType]]) do
      if matchNo == 2 then
        local yOffs = 96
        local info = VrouletteSys.pokemonTypeInfoTbl[typeIdxTbl[typeIdx]]
        text = text .. string.format("[HO:%d][VO:%d]%s[HS:4]%s", 44 + 82 * (cnt % wid), yOffs + 20 + 16 * math.floor(cnt / wid), info.Icon, info.Name)
        cnt = cnt + 1
      end
    end
    local cnt = 0
    text = text .. MENU:ReplaceTagText(V_ROULETTE__TYPE_CHANGE_BAD)
    for typeIdx, matchNo in ipairs(pokemonTypeMatchInfoTbl[typeIdxTbl[pokemonType]]) do
      if matchNo == 1 then
        local yOffs = 170
        local info = VrouletteSys.pokemonTypeInfoTbl[typeIdxTbl[typeIdx]]
        text = text .. string.format("[HO:%d][VO:%d]%s[HS:4]%s", 44 + 82 * (cnt % wid), yOffs + 20 + 16 * math.floor(cnt / wid), info.Icon, info.Name)
        cnt = cnt + 1
      end
    end
    self:SetText(text)
  end
  expBoardMenu:Open()
  return expBoardMenu
end
function DispSelectTypeInRoulette(SelectAct, withIntroTalk)
  local pokemonTypeInfoTbl = {
    {
      Type = PokemonType.NORMAL,
      Name = "[type:1]",
      Icon = "[M:TNORMAL]"
    },
    {
      Type = PokemonType.GRASS,
      Name = "[type:2]",
      Icon = "[M:TGRASS]"
    },
    {
      Type = PokemonType.FIRE,
      Name = "[type:3]",
      Icon = "[M:TFIRE]"
    },
    {
      Type = PokemonType.WATER,
      Name = "[type:4]",
      Icon = "[M:TWATER]"
    },
    {
      Type = PokemonType.ELECTRIC,
      Name = "[type:5]",
      Icon = "[M:TELECTRIC]"
    },
    {
      Type = PokemonType.ICE,
      Name = "[type:6]",
      Icon = "[M:TICE]"
    },
    {
      Type = PokemonType.FIGHTING,
      Name = "[type:7]",
      Icon = "[M:TFIGHTING]"
    },
    {
      Type = PokemonType.POISON,
      Name = "[type:8]",
      Icon = "[M:TPOISON]"
    },
    {
      Type = PokemonType.GROUND,
      Name = "[type:9]",
      Icon = "[M:TGROUND]"
    },
    {
      Type = PokemonType.FLYING,
      Name = "[type:10]",
      Icon = "[M:TFLYING]"
    },
    {
      Type = PokemonType.PSYCHIC,
      Name = "[type:11]",
      Icon = "[M:TPSYCHIC]"
    },
    {
      Type = PokemonType.BUG,
      Name = "[type:12]",
      Icon = "[M:TBUG]"
    },
    {
      Type = PokemonType.ROCK,
      Name = "[type:13]",
      Icon = "[M:TROCK]"
    },
    {
      Type = PokemonType.GHOST,
      Name = "[type:14]",
      Icon = "[M:TGHOST]"
    },
    {
      Type = PokemonType.DRAGON,
      Name = "[type:15]",
      Icon = "[M:TDRAGON]"
    },
    {
      Type = PokemonType.DARK,
      Name = "[type:16]",
      Icon = "[M:TDARK]"
    },
    {
      Type = PokemonType.STEEL,
      Name = "[type:17]",
      Icon = "[M:TSTEEL]"
    }
  }
  local function enumFunc()
    return coroutine.wrap(function()
      for i, info in ipairs(pokemonTypeInfoTbl) do
        coroutine.yield(info)
      end
    end)
  end
  local pokemonTypeExpMenu = OpenPokemonTypeExplain()
  local typeSelectMenu = MENU:CreatePageMenu()
  for info in enumFunc() do
    local text = info.Icon .. "[HS:16]" .. info.Name
    typeSelectMenu:AddItem(text, info, nil)
  end
  typeSelectMenu:SetLayoutRectAndLines(CommonSys:ArgsLayoutRectAndLines(4, 32, 160, 8))
  typeSelectMenu:ShowPageNum(true)
  typeSelectMenu:SetCancelSound(false)
  function typeSelectMenu:itemPreOpenModifyAction()
    local info = self.curItem.obj
    local hasType = false
    for idx = 0, GROUND:GetPartyMemberCount() - 1 do
      local mid = GROUND:GetPartyMemberId(idx)
      local pokemonIndex = GROUND:GetPartyPokemonIndexFromId(mid)
      for tpIdx = 0, 1 do
        local pokemonType = GROUND:GetPokemonTypeFromIndex(pokemonIndex, tpIdx)
        if info.Type == pokemonType then
          hasType = true
        end
      end
    end
    if hasType then
      self.curItem.text = self.curItem.text .. "[M:VWV]"
    end
  end
  function typeSelectMenu:openedAction()
    CommonSys:OpenBasicMenu(V_ROULETTE__CAPTION_TYPE_SELECT, V_ROULETTE__MANUAL_TYPE_SELECT, nil)
    local info = self.curItem.obj
    pokemonTypeExpMenu:SetPokemonType(info.Type)
  end
  function typeSelectMenu:currentItemChange()
    local info = self.curItem.obj
    pokemonTypeExpMenu:SetPokemonType(info.Type)
  end
  function typeSelectMenu:decideAction()
    EFFECT:SpotWipeOut(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    EFFECT:SpotWipeWait()
    EFFECT:SpotWipeIn(TimeSec(0), false)
    SCREEN_A:FadeOutAll(TimeSec(0), false)
    SCREEN_B:FadeOutAll(TimeSec(0), false)
    local info = self.curItem.obj
    SelectAct(info.Type)
    self:Close()
  end
  function typeSelectMenu:cancelAction()
  end
  function typeSelectMenu:closedAction()
    CommonSys:CloseBasicMenu()
    pokemonTypeExpMenu:Close()
  end
  if withIntroTalk then
    pokemonTypeExpMenu:SetTextAlpha(0)
  end
  typeSelectMenu:Open()
  SCREEN_A:FadeIn(TimeSec(0), false)
  SCREEN_B:FadeIn(TimeSec(0), false)
  SCREEN_A:FadeInAll(TimeSec(0), false)
  EFFECT:SpotWipeIn(TimeSec(0.5), false)
  SCREEN_B:FadeInAll(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  if withIntroTalk then
    CommonSys:BeginUpperDarkFilter(true)
    ShopSys:Talk(V_ROULETTE__ROULETTE_TYPE_INTO2, nil)
    WINDOW:CloseMessage()
    CommonSys:EndUpperDarkFilter(false)
    for t = 0, 15 do
      local rate = t / 15
      pokemonTypeExpMenu:SetTextAlpha(rate * 255)
      TASK:Sleep(TimeSec(0))
    end
    pokemonTypeExpMenu:SetTextAlpha(255)
  end
  MENU:SetFocus(typeSelectMenu)
  MENU:WaitClose(typeSelectMenu)
end
function DispRouletteBuyUI(optTbl)
  SPRITE:DestroySpriteGroup("vrGrp")
  SPRITE:DestroyPatternSet("vrSet")
  for idx = 1, 5 do
    SAJI:DestroySajiPlayer(string.format("CUR_0%d_WAIT", idx))
    SAJI:DestroySajiPlayer(string.format("CUR_0%d_DECIDE", idx))
  end
  local goBtnSys = {}
  function goBtnSys:Init(typeIdx)
    self.sajiWait = nil
    self.sajiDecide = nil
    local sajiResTbl = {
      {
        "BUTTON_GO",
        "BUTTON_GO_DEC"
      },
      {
        "BUTTON_OK",
        "BUTTON_OK_DEC"
      },
      {
        "BUTTON_START",
        "BUTTON_START_DEC"
      }
    }
    if typeIdx == 3 then
      local eLanguageType = SYSTEM:GetLanguageType()
      if eLanguageType == LANGUAGE_TYPE.FR then
        sajiResTbl[typeIdx][1] = "BUTTON_START_FR"
        sajiResTbl[typeIdx][2] = "BUTTON_START_DEC_FR"
      elseif eLanguageType == LANGUAGE_TYPE.GE then
        sajiResTbl[typeIdx][1] = "BUTTON_START_GE"
        sajiResTbl[typeIdx][2] = "BUTTON_START_DEC_GE"
      elseif eLanguageType == LANGUAGE_TYPE.IT then
        sajiResTbl[typeIdx][1] = "BUTTON_START_IT"
        sajiResTbl[typeIdx][2] = "BUTTON_START_DEC_IT"
      elseif eLanguageType == LANGUAGE_TYPE.SP then
        sajiResTbl[typeIdx][1] = "BUTTON_START_SP"
        sajiResTbl[typeIdx][2] = "BUTTON_START_DEC_SP"
      else
        sajiResTbl[typeIdx][1] = "BUTTON_START"
        sajiResTbl[typeIdx][2] = "BUTTON_START_DEC"
      end
    end
    SAJI:CreateSajiPlayer("GO_BTN_WAIT", sajiResTbl[typeIdx][1])
    SAJI:CreateSajiPlayer("GO_BTN_DECIDE", sajiResTbl[typeIdx][2])
    self.sajiWait = SJ("GO_BTN_WAIT")
    self.sajiDecide = SJ("GO_BTN_DECIDE")
    self.sajiWait:Play(LOOP.ON)
    self.sajiDecide:Play(LOOP.ON)
    self.sajiWait:SetVisible(false)
    self.sajiDecide:SetVisible(false)
    self.sajiWait:SetDrawPriority(550)
    self.sajiDecide:SetDrawPriority(550)
    self.sajiWait:SetScreenType(ScreenType.B)
    self.sajiDecide:SetScreenType(ScreenType.B)
    self.sajiWait:SetPosition(Vector2(272, 168))
    self.sajiDecide:SetPosition(Vector2(272, 168))
  end
  function goBtnSys:Finish()
    SAJI:DestroySajiPlayer("GO_BTN_WAIT")
    SAJI:DestroySajiPlayer("GO_BTN_DECIDE")
    self.sajiWait = nil
    self.sajiDecide = nil
  end
  function goBtnSys:Focus(flag)
    self.sajiDecide:SetVisible(false)
    if flag then
      self.sajiWait:Play(LOOP.ON)
      self.sajiWait:SetVisible(true)
      self.sajiWait:Pause(false)
    else
      self.sajiWait:Play(LOOP.ON)
      self.sajiWait:SetVisible(true)
      self.sajiWait:Pause(true)
    end
  end
  function goBtnSys:Decide()
    self.sajiWait:SetVisible(false)
    self.sajiDecide:Play(LOOP.OFF)
    self.sajiDecide:SetVisible(true)
  end
  local cursorSys = {}
  function cursorSys:Init()
    self.sajiWaitTbl = {}
    self.sajiDecideTbl = {}
    for idx = 1, 5 do
      local nameW = string.format("CUR_0%d_WAIT", idx)
      local nameD = string.format("CUR_0%d_DECIDE", idx)
      local resW = string.format("V_ROULETTE_CURSOR0%d_01DEFAULT", idx)
      local resD = string.format("V_ROULETTE_CURSOR0%d_02DECISION", idx)
      SAJI:CreateSajiPlayer(nameW, resW)
      SAJI:CreateSajiPlayer(nameD, resD)
      SJ(nameW):Play(LOOP.ON)
      SJ(nameD):Play(LOOP.ON)
      SJ(nameW):SetVisible(false)
      SJ(nameD):SetVisible(false)
      SJ(nameW):SetDrawPriority(550)
      SJ(nameD):SetDrawPriority(550)
      SJ(nameW):SetScreenType(ScreenType.B)
      SJ(nameD):SetScreenType(ScreenType.B)
      SJ(nameW):SetPosition(Vector2(160, 120))
      SJ(nameD):SetPosition(Vector2(160, 120))
      table.insert(self.sajiWaitTbl, SJ(nameW))
      table.insert(self.sajiDecideTbl, SJ(nameD))
    end
    self.nowCursorIdx = 1
    self.keyInputTbl = {
      [-1] = {},
      [0] = {},
      [1] = {}
    }
    self.keyInputTbl[0][1] = 1
    self.keyInputTbl[1][1] = 2
    self.keyInputTbl[1][0] = 3
    self.keyInputTbl[1][-1] = 4
    self.keyInputTbl[0][-1] = 5
    self.keyInputTbl[-1][-1] = 6
    self.keyInputTbl[-1][0] = 7
    self.keyInputTbl[-1][1] = 8
    self.cursorLinks = {
      {
        1,
        2,
        2,
        3,
        3,
        4,
        5,
        5
      },
      {
        1,
        2,
        99,
        3,
        3,
        4,
        5,
        5
      },
      {
        1,
        2,
        2,
        99,
        4,
        4,
        4,
        5
      },
      {
        1,
        2,
        3,
        3,
        3,
        4,
        5,
        5
      },
      {
        1,
        2,
        2,
        3,
        4,
        4,
        5,
        5
      }
    }
    self.cursorLinks[99] = {
      99,
      99,
      99,
      99,
      99,
      3,
      2,
      2
    }
    self.works = {}
    for i = 1, 5 do
      self.works[i] = {}
      self.works[i].animFlag = false
    end
    goBtnSys:Focus(false)
  end
  function cursorSys:Finish()
    for idx = 1, 5 do
      SAJI:DestroySajiPlayer(string.format("CUR_0%d_WAIT", idx))
      SAJI:DestroySajiPlayer(string.format("CUR_0%d_DECIDE", idx))
    end
  end
  function cursorSys:Move(x, y)
    local keyIdx = self.keyInputTbl[x][y]
    local nextCursor = self.cursorLinks[self.nowCursorIdx][keyIdx]
    if nextCursor ~= self.nowCursorIdx then
      cursorSys:SetCursor(nextCursor)
      SOUND:PlaySe(SymSnd("SE_SYS_CURSOR"))
    end
  end
  function cursorSys:SetCursor(idx)
    if self.nowCursorIdx == 99 then
      goBtnSys:Focus(false)
    else
      local nowSajiW = self.sajiWaitTbl[self.nowCursorIdx]
      nowSajiW:SetVisible(false)
    end
    if idx == 99 then
      goBtnSys:Focus(true)
    else
      local nextSajiW = self.sajiWaitTbl[idx]
      nextSajiW:Play(LOOP.ON)
      nextSajiW:SetVisible(true)
    end
    self.nowCursorIdx = idx
  end
  function cursorSys:GetCursor()
    return self.nowCursorIdx
  end
  function cursorSys:PushDecideAnim()
    if self.nowCursorIdx == 99 then
      goBtnSys:Decide()
    else
      local nowSajiW = self.sajiWaitTbl[self.nowCursorIdx]
      local nowSajiD = self.sajiDecideTbl[self.nowCursorIdx]
      nowSajiW:SetVisible(false)
      nowSajiD:Play(LOOP.OFF)
      nowSajiD:SetVisible(true)
      self.works[self.nowCursorIdx].animFlag = true
    end
  end
  function cursorSys:SetVisible(flag)
    if self.nowCursorIdx == 99 then
      if flag then
        goBtnSys:Focus(true)
      end
    else
      local nowSajiW = self.sajiWaitTbl[self.nowCursorIdx]
      local nowSajiD = self.sajiDecideTbl[self.nowCursorIdx]
      if flag then
        nowSajiW:SetVisible(true)
        nowSajiD:SetVisible(false)
        self.works[self.nowCursorIdx].animFlag = false
      else
        nowSajiW:SetVisible(false)
        nowSajiD:SetVisible(false)
        self.works[self.nowCursorIdx].animFlag = false
      end
    end
  end
  function cursorSys:Tick()
    for i = 1, 5 do
      if self.works[i].animFlag then
        local sajiW = self.sajiWaitTbl[i]
        local sajiD = self.sajiDecideTbl[i]
        if sajiD:IsPause() and sajiD:IsVisible() then
          sajiD:SetVisible(false)
          cursorSys:SetCursor(self.nowCursorIdx)
        end
      end
    end
  end
  local markMoneySumTbl = {
    0,
    GROUND:GetVRoulettePrice(0),
    GROUND:GetVRoulettePrice(1),
    GROUND:GetVRoulettePrice(2),
    GROUND:GetVRoulettePrice(3)
  }
  local boarcSys = {}
  function boarcSys:Init()
    self.martPtnNoTbl = {}
    self.hasPlayerMarkCnt = 0
    SPRITE:CreatePatternSet("vrBoardSet", {
      name = "MARK_BET",
      img = "VR_MARK_WIN",
      u = 0,
      v = 0,
      w = 64,
      h = 64,
      cx = 32,
      cy = 32,
      allocateFromMap = true
    })
    self.markSprtTbl = {}
    local prio = 600
    for i = 1, 5 do
      local r = ((i - 1) * 360 / 5 - 90) / 180 * math.pi
      local sprt = SPRITE:CreateSprite("vrBoardSet", string.format("sprt%d", i))
      sprt:SetPosition(Vector2(160 + math.cos(r) * 43, 114 + math.sin(r) * 43))
      sprt:SetOption({
        screen = ScreenType.B,
        prio = prio
      })
      sprt:SetRotate(Degree((i - 1) * 360 / 5))
      table.insert(self.markSprtTbl, sprt)
      self:SetMark(i, 1)
    end
    self:SetMarkBet(1)
  end
  function boarcSys:Finish()
    SPRITE:DestroySpriteGroup("vrBoardSet")
    SPRITE:DestroyPatternSet("vrBoardSet")
  end
  function boarcSys:SetMark(idx, ptnNo)
    self.martPtnNoTbl[idx] = ptnNo
    local tbl = {
      "",
      "MARK_BET",
      "MARK_BET"
    }
    if tbl[ptnNo] ~= "" then
      self.markSprtTbl[idx]:SetPattern({
        setName = "vrBoardSet",
        ptnName = tbl[ptnNo],
        ofsX = 0,
        ofsY = 0
      })
      self.markSprtTbl[idx]:SetVisible(true)
    else
      self.markSprtTbl[idx]:SetVisible(false)
    end
    if ptnNo == 1 then
      VrouletteCircleSys:ClearMark(idx)
    elseif ptnNo == 2 then
      VrouletteCircleSys:SetMarkBet(idx)
    end
  end
  function boarcSys:IsMarkSetOk(idx)
    if idx == 1 then
      return false
    end
    return true
  end
  function boarcSys:GetNowMarkNum()
    local nowMarkCnt = 0
    for idx = 1, 5 do
      if boarcSys:IsMarkBet(idx) then
        nowMarkCnt = nowMarkCnt + 1
      end
    end
    return nowMarkCnt
  end
  function boarcSys:RotateMark(idx, deg)
    self.markSprtTbl[idx]:SetRotate(Degree((idx - 1) * 360 / 5 + deg))
    self:SetMarkBet(1)
  end
  function boarcSys:IsBuyNextMarkOk()
    if self:GetNowMarkNum() >= 5 then
      return false
    end
    local nextPrice = boarcSys:GetNextPrice()
    return nextPrice <= GROUND:GetPlayerMoney()
  end
  function boarcSys:GetNextPrice()
    local nextMarkCnt = self:GetNowMarkNum() + 1
    if nextMarkCnt > 5 or nextMarkCnt + 1 < self.hasPlayerMarkCnt + 1 then
      return 0
    else
      return markMoneySumTbl[nextMarkCnt]
    end
  end
  function boarcSys:GetNowPrice()
    local nowMarkCnt = self:GetNowMarkNum()
    if nowMarkCnt > 5 or nowMarkCnt < self.hasPlayerMarkCnt + 1 then
      return 0
    else
      return markMoneySumTbl[nowMarkCnt]
    end
  end
  function boarcSys:SetMarkMiss(idx)
    self:SetMark(idx, 1)
  end
  function boarcSys:SetMarkBet(idx)
    self:SetMark(idx, 2)
  end
  function boarcSys:IsMarkMiss(idx)
    return self.martPtnNoTbl[idx] == 1
  end
  function boarcSys:IsMarkBet(idx)
    return self.martPtnNoTbl[idx] == 2
  end
  local infoDispSys = {}
  function infoDispSys:Init()
    CommonSys:OpenBasicMenu(V_ROULETTE__CAPTION_PLACE_SELECT, V_ROULETTE__MANUAL_PLACE_SELECT, nil)
    CommonSys:GetBasicMenu_Title():SetScrollStop(true)
    self.markPriceBoard = MENU:CreateBoardMenuWindow(ScreenType.A)
    self.hasMoneyBoard = MENU:CreateBoardMenuWindow(ScreenType.A)
    self.markPriceBoard:SetTextOffset(0, 0)
    self.hasMoneyBoard:SetTextOffset(0, 0)
    self.markPriceBoard:SetLayoutRect(Rectangle(16, 16, 144, 80))
    self.hasMoneyBoard:SetLayoutRect(Rectangle(176, 16, 64, 16))
    self.markPriceBoard:SetOption({
      frameMode = FrameMode.MENU
    })
    function self.markPriceBoard:openedAction()
      self:SetAnimeOffsPosY(-self:GetBottom() - 8)
    end
    function self.hasMoneyBoard:openedAction()
      self:SetAnimeOffsPosX(400 - self:GetLeft() + 8)
    end
    self.markPriceBoard:Open()
    self.hasMoneyBoard:Open()
    self:UpdateInfo()
  end
  function infoDispSys:Finish()
    CommonSys:CloseBasicMenu()
    self.markPriceBoard:Close()
    self.hasMoneyBoard:Close()
  end
  function infoDispSys:StartScrollTitle()
    CommonSys:GetBasicMenu_Title():SetScrollStop(false)
  end
  function infoDispSys:UpdateInfo()
    local nowMarkNum = boarcSys:GetNowMarkNum()
    MENU:SetTag_MyMoneyMuji(0, markMoneySumTbl[2])
    MENU:SetTag_MyMoneyMuji(1, markMoneySumTbl[3])
    MENU:SetTag_MyMoneyMuji(2, markMoneySumTbl[4])
    MENU:SetTag_MyMoneyMuji(3, markMoneySumTbl[5])
    local text = "[VO:0]"
    local stConst = ""
    if nowMarkNum == 1 then
      text = text .. "[CS:H]"
      self.hasMoneyBoard:SetAnimeOffsPosY(16)
    end
    stConst = MENU:ReplaceTagText(V_ROULETTE__COST1)
    text = text .. stConst .. "[R]"
    if nowMarkNum == 1 then
      text = text .. "[CR]"
    end
    if nowMarkNum == 2 then
      text = text .. "[CS:H]"
      self.hasMoneyBoard:SetAnimeOffsPosY(32)
    end
    stConst = MENU:ReplaceTagText(V_ROULETTE__COST2)
    text = text .. stConst .. "[R]"
    if nowMarkNum == 2 then
      text = text .. "[CR]"
    end
    if nowMarkNum == 3 then
      text = text .. "[CS:H]"
      self.hasMoneyBoard:SetAnimeOffsPosY(48)
    end
    stConst = MENU:ReplaceTagText(V_ROULETTE__COST3)
    text = text .. stConst .. "[R]"
    if nowMarkNum == 3 then
      text = text .. "[CR]"
    end
    if nowMarkNum == 4 then
      text = text .. "[CS:H]"
      self.hasMoneyBoard:SetAnimeOffsPosY(64)
    end
    stConst = MENU:ReplaceTagText(V_ROULETTE__COST4)
    text = text .. stConst .. "[R]"
    if nowMarkNum == 4 then
      text = text .. "[CR]"
    end
    if nowMarkNum == 5 then
      text = text .. "[CS:H]"
      self.hasMoneyBoard:SetAnimeOffsPosY(64)
    end
    stConst = MENU:ReplaceTagText(V_ROULETTE__COST5)
    text = text .. stConst .. "[R]"
    if nowMarkNum == 5 then
      text = text .. "[CR]"
    end
    self.markPriceBoard:SetText(MENU:ReplaceTagText(text))
    if boarcSys:IsBuyNextMarkOk() == false then
      MENU:SetTag_MyMoneyMuji(0, GROUND:GetPlayerMoney() - boarcSys:GetNowPrice())
      self.hasMoneyBoard:SetText(MENU:ReplaceTagText("[CS:Q][IS][st_money:0][IE]"))
    elseif 0 < boarcSys:GetNowPrice() then
      MENU:SetTag_MyMoneyMuji(0, GROUND:GetPlayerMoney() - boarcSys:GetNowPrice())
      self.hasMoneyBoard:SetText(MENU:ReplaceTagText("[CS:H][IS][st_money:0][IE]"))
    else
      MENU:SetTag_MyMoneyMuji(0, GROUND:GetPlayerMoney())
      self.hasMoneyBoard:SetText(MENU:ReplaceTagText("[IS][st_money:0][IE]"))
    end
  end
  function infoDispSys:GetMarkPriceMenuH()
    return self.markPriceBoard:GetBottom()
  end
  function infoDispSys:SetMarkPriceMenuOffsY(y)
    self.markPriceBoard:SetAnimeOffsPosY(y)
  end
  function infoDispSys:GetHasMoneyMenuW()
    return 400 - self.hasMoneyBoard:GetBottom() + 8
  end
  function infoDispSys:SetHasMoneyMenuOffsX(x)
    self.hasMoneyBoard:SetAnimeOffsPosX(x)
  end
  local actSys = {}
  function actSys:Init()
    self.work = {}
  end
  function actSys:Finish()
  end
  function actSys:SceneStart()
    VrouletteSys:CutPlay(SymCutMsgId("SceneStart"))
    SOUND:PlaySe(SymSnd("SE_EVT_V_FANFARE"), Volume(128))
    SOUND:PlaySe(SymSnd("SE_EVT_V_ECHO"), Volume(90))
    TaskTalkSys:Talk(20, 88, FACE_TYPE.SPECIAL01, V_ROULETTE__ROULETTE_BET_READY_CUT_TALK1)
    local sisa = 0.8
    local sisaTgt = 1.2
    for t = 0, 20 do
      local rate = t / 20
      TASK:Sleep(TimeSec(0))
    end
    CAMERA:SetAzimuthDifferenceVolume(Volume(sisaTgt))
    VrouletteSys:CutWait()
    TaskTalkSys:ForceCloseMessage()
  end
  function actSys:PullDownMenu()
    if self.work.bikuActStat == nil then
      self.work.bikuActStat = "markSet"
      self.work.bikuActCo = coroutine.wrap(function()
        local openMenuCo = coroutine.wrap(function()
          local nowY = -infoDispSys:GetMarkPriceMenuH() - 8
          local accY = 35
          while nowY < 50 do
            infoDispSys:SetMarkPriceMenuOffsY(nowY)
            nowY = nowY + accY
            if accY > 1 then
              accY = accY - 4
            else
              accY = 1
            end
            coroutine.yield(true)
          end
          accY = -10
          while nowY > 0 do
            infoDispSys:SetMarkPriceMenuOffsY(nowY)
            nowY = nowY + accY
            accY = accY - 7
            coroutine.yield(true)
          end
          infoDispSys:SetMarkPriceMenuOffsY(0)
          return false
        end)
        local bgmStartCo = coroutine.wrap(function()
          while SOUND:IsPlaySe(SymSnd("SE_EVT_V_FANFARE")) do
            coroutine.yield(true)
          end
          SOUND:PlayBgm(SymSnd("BGM_SYS_MINIGAME_01"), Volume(256))
          return false
        end)
        local cnt = 0
        VrouletteSys:CutPlay(SymCutMsgId("PullDownMenu"))
        while VrouletteSys:IsCutPlaying() do
          if cnt > 12 and openMenuCo and openMenuCo() == false then
            openMenuCo = nil
          end
          if bgmStartCo and bgmStartCo() == false then
            bgmStartCo = nil
          end
          cnt = cnt + 1
          coroutine.yield(true)
        end
        VrouletteSys:CutClearIgnoreSymbol()
        CH("BIKUTYINI"):ResetNeckRot(TimeSec(0.1))
        while openMenuCo do
          if openMenuCo() == false then
            openMenuCo = Nnil
          end
          if bgmStartCo and bgmStartCo() == false then
            bgmStartCo = nil
          end
          coroutine.yield(true)
        end
        VrouletteSys:CutPlay(SymCutMsgId("StartTalk"))
        while VrouletteSys:IsCutPlaying() do
          if bgmStartCo and bgmStartCo() == false then
            bgmStartCo = nil
          end
          coroutine.yield(true)
        end
        ShopSys:Talk(V_ROULETTE__ROULETTE_BET_READY_CUT_TALK2)
        for t = 0, 60 do
          while bgmStartCo do
            if bgmStartCo() == false then
              bgmStartCo = nil
            end
            coroutine.yield(true)
          end
        end
        WINDOW:ForceCloseMessage()
        CH("BIKUTYINI"):SetNextMotion(SymMot("DWALK"), LOOP.ON, TimeSec(0.5))
        CH("BIKUTYINI"):SetMotionRaito(Raito(1.5))
        TASK:Sleep(TimeSec(30, TIME_TYPE.FRAME))
        CH("BIKUTYINI"):ResetFacialMotion()
        TaskTalkSys:TalkJump()
        optTbl.startTalkAct()
        TaskTalkSys:TalkJumpWait()
        do
          local nowX = infoDispSys:GetHasMoneyMenuW()
          local accX = -94
          while nowX > 0 do
            nowX = nowX + accX
            accX = accX + 8
            if accX < -1 then
              accX = accX + 5
            else
              accX = -1
            end
            infoDispSys:SetHasMoneyMenuOffsX(nowX)
            coroutine.yield(true)
          end
          infoDispSys:SetHasMoneyMenuOffsX(0)
        end
        TASK:Sleep(TimeSec(10, TIME_TYPE.FRAME))
        cursorSys:SetCursor(1)
        return false
      end)
    end
  end
  function actSys:SetOneRot(nowCur)
    if self.work.actStat == nil then
      self.work.actStat = "oneRot"
      self.work.rotDeg = 0
      self.work.rotSpd = 0
      self.work.rotNowCur = nowCur
    end
  end
  function actSys:BikutyiniMarkSet(cursorNum, nowCur)
    if self.work.bikuActStat == nil then
      self.work.bikuActStat = "markSet"
      self.work.bikuActCo = coroutine.wrap(function()
        local function setMarkEff()
          SOUND:PlaySe(SymSnd("SE_ACT_MONEY"))
          actSys:SetOneRot(nowCur)
          EFFECT:Create("markSet", SymEff("NM_STARBOMB_YELLOW"))
          EFFECT:SetScale("markSet", Scale(0.4))
          EFFECT:SetPosition("markSet", VrouletteCircleSys:GetMarkPos(nowCur))
          EFFECT:Play("markSet")
        end
        setMarkEff()
        local markRotCo = coroutine.wrap(function()
          for r = 0, 10 do
            boarcSys:RotateMark(nowCur, r / 10 * 360)
            coroutine.yield(true)
          end
          return false
        end)
        if cursorNum >= 3 then
          CH("BIKUTYINI"):SetMotion(SymMot("EV004_PEACE01"), LOOP.OFF)
          CH("BIKUTYINI"):SetMotionRaito(Raito(2))
          while CH("BIKUTYINI"):IsNextMotionExist(MOTION_PARTS.BODY) do
            if markRotCo and markRotCo() == false then
              markRotCo = nil
            end
            coroutine.yield(true)
          end
        elseif cursorNum >= 2 then
          CH("BIKUTYINI"):SetMotion(SymMot("EV004_PEACE00"), LOOP.OFF)
          CH("BIKUTYINI"):SetMotionRaito(Raito(2))
          while CH("BIKUTYINI"):IsNextMotionExist(MOTION_PARTS.BODY) do
            if markRotCo and markRotCo() == false then
              markRotCo = nil
            end
            coroutine.yield(true)
          end
        elseif cursorNum >= 1 then
          VrouletteSys:CutSetIgnoreSymbol({
            "V_ROULETTE_CIRCLE_01",
            "V_ROULETTE_MARK01_01",
            "V_ROULETTE_MARK01_02",
            "V_ROULETTE_MARK01_03",
            "V_ROULETTE_MARK01_04",
            "V_ROULETTE_MARK02_01",
            "V_ROULETTE_MARK02_02",
            "V_ROULETTE_MARK02_03",
            "V_ROULETTE_MARK02_04"
          })
          VrouletteSys:CutPlay(SymCutMsgId("RollB"))
          while VrouletteSys:IsCutPlaying() do
            coroutine.yield(true)
            if markRotCo and markRotCo() == false then
              markRotCo = nil
            end
          end
          VrouletteSys:CutClearIgnoreSymbol()
        end
        CH("BIKUTYINI"):SetNextMotion(SymMot("DWALK"), LOOP.ON, TimeSec(0.3))
        CH("BIKUTYINI"):SetMotionRaito(Raito(1.5))
        while CH("BIKUTYINI"):IsNextMotionExist(MOTION_PARTS.BODY) do
          coroutine.yield(true)
          if markRotCo and markRotCo() == false then
            markRotCo = nil
          end
        end
        while markRotCo do
          if markRotCo() == false then
            markRotCo = nil
          end
        end
        return false
      end)
    end
  end
  function actSys:IsNowBikuAct()
    return self.work.bikuActStat ~= nil
  end
  function actSys:Tick()
    if self.work.actStat == "oneRot" then
      if self.work.rotSpd > 1 and boarcSys:IsMarkBet(self.work.rotNowCur) == false then
        boarcSys:SetMarkBet(self.work.rotNowCur)
        infoDispSys:UpdateInfo()
      end
      self.work.rotDeg = self.work.rotDeg + self.work.rotSpd
      self.work.rotSpd = self.work.rotSpd + 10
      if self.work.rotSpd < 1 then
        self.work.rotSpd = 1
      end
      VrouletteCircleSys:SetRotate(self.work.rotDeg)
      if self.work.rotDeg > 360 then
        self.work.actStat = nil
        self.work.rotDeg = nil
        VrouletteCircleSys:SetRotate(0)
      end
    end
    if self.work.bikuActStat == "markSet" and self.work.bikuActCo() == false then
      self.work.bikuActStat = nil
      self.work.bikuActCo = nil
    end
  end
  boarcSys:Init()
  goBtnSys:Init(3)
  cursorSys:Init()
  infoDispSys:Init()
  actSys:Init()
  actSys:SceneStart()
  actSys:PullDownMenu()
  while actSys:IsNowBikuAct() do
    actSys:Tick()
    TASK:Sleep(TimeSec(0))
  end
  infoDispSys:StartScrollTitle()
  TASK:Sleep(TimeSec(0))
  local offset = 0
  local isPay = false
  local touchGoBtnRange = {
    x0 = 256,
    y0 = 152,
    x1 = 288,
    y1 = 184
  }
  while true do
    local edgePoint = PAD:TouchPointEdge()
    local touchMarkDecide = false
    local btnGo = false
    if 0 <= edgePoint.x then
      if touchGoBtnRange.x0 < edgePoint.x and touchGoBtnRange.x1 > edgePoint.x and touchGoBtnRange.y0 < edgePoint.y and touchGoBtnRange.y1 > edgePoint.y then
        cursorSys:SetCursor(99)
        btnGo = true
      else
        local cx = 160
        local cy = 120
        local offX = edgePoint.x - cx
        local offY = edgePoint.y - cy
        local degR = (math.atan2(offX, -offY) / math.pi * 180 + 360) % 360
        local selCur = 0
        if offX * offX + offY * offY < 10000 then
          if degR < 36 or degR >= 324 then
            selCur = 1
          elseif degR < 108 then
            selCur = 2
          elseif degR < 180 then
            selCur = 3
          elseif degR < 252 then
            selCur = 4
          elseif degR < 324 then
            selCur = 5
          end
          if selCur > 0 then
            if cursorSys:GetCursor() == selCur then
              touchMarkDecide = true
            else
              cursorSys:SetCursor(selCur)
              SOUND:PlaySe(SymSnd("SE_SYS_CURSOR"))
            end
          end
        end
      end
    end
    if PAD:Edge("A") and cursorSys:GetCursor() == 99 then
      btnGo = true
    end
    if PAD:Edge("(UP|DOWN|LEFT|RIGHT)") then
      local x = 0
      local y = 0
      if PAD:Data("UP") then
        y = 1
      elseif PAD:Data("DOWN") then
        y = -1
      end
      if PAD:Data("LEFT") then
        x = -1
      elseif PAD:Data("RIGHT") then
        x = 1
      end
      cursorSys:Move(x, y)
    elseif PAD:Edge("(START)") or btnGo then
      if actSys:IsNowBikuAct() == false then
        cursorSys:SetCursor(99)
        cursorSys:PushDecideAnim()
        SOUND:PlaySe(SymSnd("SE_SYS_TITLE"))
        TASK:Sleep(TimeSec(0.4))
        cursorSys:SetVisible(false)
        SOUND:FadeOutBgm(TimeSec(0.5))
        if optTbl.decideAsk() then
          isPay = true
          break
        else
          SOUND:StopBgm()
          SOUND:PlayBgm(SymSnd("BGM_SYS_MINIGAME_01"), Volume(256))
          cursorSys:SetVisible(true)
        end
      end
    elseif PAD:Edge("A") or touchMarkDecide then
      local nowCur = cursorSys:GetCursor()
      if boarcSys:IsMarkSetOk(nowCur) == false then
        TaskTalkSys:TalkJump()
        WINDOW:Talk(SymAct("BIKUTYINI"), V_ROULETTE__ROULETTE_SELECT_TOP)
        TASK:Sleep(TimeSec(1))
        TaskTalkSys:TalkJumpWait()
        WINDOW:ForceCloseMessage()
      elseif boarcSys:IsMarkMiss(nowCur) and boarcSys:IsBuyNextMarkOk() == false then
        SOUND:PlaySe(SymSnd("SE_SYS_NO_SELECT"))
        cursorSys:SetVisible(false)
        CH("BIKUTYINI"):SetMotion(SymMot("DAMAGE"), LOOP.OFF)
        TASK:Sleep(TimeSec(0.3))
        TaskTalkSys:TalkJump()
        WINDOW:Talk(SymAct("BIKUTYINI"), V_ROULETTE__ROULETTE_NO_MONEY)
        WINDOW:CloseMessage()
        TaskTalkSys:TalkJumpWait()
        CH("BIKUTYINI"):SetNextMotion(SymMot("DWALK"), LOOP.ON, TimeSec(0.4))
        CH("BIKUTYINI"):WaitNextMotionExist(MOTION_PARTS.BODY)
        cursorSys:SetVisible(true)
      else
        cursorSys:PushDecideAnim()
        if boarcSys:IsMarkMiss(nowCur) then
          if actSys:IsNowBikuAct() == false then
            actSys:BikutyiniMarkSet(boarcSys:GetNowMarkNum(), nowCur)
          end
        elseif boarcSys:IsMarkBet(nowCur) and actSys:IsNowBikuAct() == false then
          SOUND:PlaySe(SymSnd("SE_GAME_HOCKEY_ERASE"))
          boarcSys:SetMarkMiss(nowCur)
        end
        infoDispSys:UpdateInfo()
      end
      infoDispSys:UpdateInfo()
    elseif PAD:Edge("B") then
      SOUND:PlaySe(SymSnd("SE_SYS_CANCEL"))
      TASK:Sleep(TimeSec(0.2))
      if optTbl.cancelAsk() then
        break
      end
    end
    cursorSys:Tick()
    actSys:Tick()
    TASK:Sleep(TimeSec(0))
  end
  if isPay then
    GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() - boarcSys:GetNowPrice())
  end
  cursorSys:Finish()
  goBtnSys:Finish()
  boarcSys:Finish()
  infoDispSys:Finish()
  actSys:Finish()
end
function DispRouletteRouletteExecute(optTbl)
  SPRITE:DestroySpriteGroup("vrGrp")
  SPRITE:DestroyPatternSet("vrSet")
  SAJI:DestroySajiPlayer("TELOP")
  local rouletteSys = {}
  function rouletteSys:Init()
    self.speedDeg = 0
    self.nowDeg = 0
    self.seTick = 0
    self.isLinkCut = true
    self.isSe = true
  end
  function rouletteSys:Finish()
  end
  function rouletteSys:SetLinkCutScene()
    self.isLinkCut = true
    VrouletteCircleSys:ClearControl()
    VrouletteCircleSys:UseMarkControl()
  end
  function rouletteSys:ClearLinkCutScene()
    self.isLinkCut = false
    VrouletteCircleSys:ClearControl()
    VrouletteCircleSys:UseCircleControl()
    VrouletteCircleSys:UseMarkControl()
  end
  function rouletteSys:SetRotSpeed(speedDeg)
    self.speedDeg = speedDeg
  end
  function rouletteSys:GetRotSpeed()
    return self.speedDeg
  end
  function rouletteSys:GetRot()
    return VrouletteCircleSys:GetRotateAbs360()
  end
  function rouletteSys:IsHitNow()
    local markIdx = math.floor((self:GetRot() + 36) / 72) % 5
    return VrouletteCircleSys:IsMarkBet(markIdx + 1)
  end
  function rouletteSys:Tick()
    if self.isLinkCut then
      local prevDeg = self.nowDeg
      self.nowDeg = VrouletteCircleSys:GetRotate()
      self.speedDeg = self.nowDeg - prevDeg
      if self.speedDeg > 360 then
        self.speedDeg = self.speedDeg % 360
      elseif self.speedDeg < -360 then
        self.speedDeg = -(-self.speedDeg % 360)
      end
    else
      self.nowDeg = self.nowDeg + self.speedDeg
    end
    if self.isSe then
      local newTick = math.floor((self.nowDeg + 12) / 72)
      if self.seTick ~= newTick then
        SOUND:PlaySe(SymSnd("SE_SHOP_ROULETTE_ROLL"), Volume(128))
        self.seTick = newTick
      end
    end
    VrouletteCircleSys:SetRotate(self.nowDeg)
  end
  local actSys = {}
  function actSys:Init()
    self.work = {}
    CH("BIKUTYINI"):SetNextMotion(SymMot("DWALK"), LOOP.ON, TimeSec(0.4))
  end
  function actSys:Finish()
    SAJI:DestroySajiPlayer("TELOP")
  end
  function actSys:IsRunBikuAct()
    return self.work.bikuActCo ~= nil
  end
  function actSys:RouletteStart()
    self.work.bikuActCo = coroutine.wrap(function()
      SOUND:PlaySe(SymSnd("SE_WAZA_MIRAIYOCHI_1"))
      local speedRateTbl = {
        0.8,
        1,
        1.7
      }
      local tblIdx = SYSTEM:GetRandomValue(1, #speedRateTbl + 1)
      local rotSpeed = -26
      rotSpeed = rotSpeed * speedRateTbl[tblIdx]
      rouletteSys:ClearLinkCutScene()
      VrouletteSys:CutPlay(SymCutMsgId("RotStart"))
      local cnt = 0
      while VrouletteSys:IsCutPlaying() do
        if cnt == 26 then
          SOUND:PlayBgm(SymSnd("BGM_SYS_MINIGAME_03"), Volume(256))
          actSys:TelopPlay("V_ROULETTE_START")
          rouletteSys:SetRotSpeed(rotSpeed)
        end
        VrouletteCircleSys:SetRotate(VrouletteCircleSys:GetRotate())
        coroutine.yield(true)
        cnt = cnt + 1
      end
      VrouletteSys:CutPlay(SymCutMsgId("RotStartAfter"))
      VrouletteCircleSys:UseCircleControl()
      while VrouletteSys:IsCutPlaying() do
        coroutine.yield(true)
      end
      VrouletteSys:CutPlay(SymCutMsgId("ZoomIn"))
      VrouletteCircleSys:UseCircleControl()
      local sisa = 1
      local sisaTgt = 0.38
      while VrouletteSys:IsCutPlaying() do
        if sisa > sisaTgt then
          sisa = sisa - 0.12
        else
          sisa = sisaTgt
        end
        CAMERA:SetAzimuthDifferenceVolume(Volume(sisa))
        coroutine.yield(true)
      end
      CAMERA:SetAzimuthDifferenceVolume(Volume(sisaTgt))
      TASK:Regist(Group("talkTask"), function()
        function TaskL.Start()
          WINDOW:DrawFace(20, 88, SymAct("BIKUTYINI"), FACE_TYPE.SPECIAL01)
          WINDOW:Talk(SymAct("BIKUTYINI"), V_ROULETTE__ROULETTE_START_TALK1)
          TASK:Sleep(TimeSec(1), TASK_EXIT.QUICK)
          WINDOW:ForceCloseMessage()
          local randomWait = SYSTEM:GetRandomValue(5, 25)
          TASK:Sleep(TimeSec(randomWait / 15), TASK_EXIT.QUICK)
          WINDOW:DrawFace(20, 88, SymAct("BIKUTYINI"), FACE_TYPE.SPECIAL01)
          WINDOW:Talk(SymAct("BIKUTYINI"), V_ROULETTE__ROULETTE_START_TALK2)
          TASK:Sleep(TimeSec(1), TASK_EXIT.QUICK)
          WINDOW:ForceCloseMessage()
          WINDOW:DrawFace(20, 88, SymAct("BIKUTYINI"), FACE_TYPE.SPECIAL01)
          WINDOW:Talk(SymAct("BIKUTYINI"), V_ROULETTE__ROULETTE_START_TALK3)
          TASK:Sleep(TimeSec(0.8), TASK_EXIT.QUICK)
          WINDOW:ForceCloseMessage()
        end
        function TaskL.Finish()
          WINDOW:ForceCloseMessage()
        end
      end)
      while TASK:IsEndTasks(Group("talkTask")) == false do
        coroutine.yield(true)
      end
      for t = 1, 10 do
        coroutine.yield(true)
      end
      WINDOW:ForceCloseMessage()
      return false
    end)
  end
  function actSys:RouletteStop()
    self.work.bikuActCo = coroutine.wrap(function()
      WINDOW:ForceCloseMessage()
      SOUND:PlaySe(SymSnd("SE_WAZA_GANSEKIHOU"))
      SOUND:FadeOutBgm(TimeSec(1))
      actSys:TelopPlay("V_ROULETTE_STOP")
      EFFECT:Create("markSet", SymEff("NM_STARBOMB_YELLOW"))
      EFFECT:SetScale("markSet", Scale(0.7))
      EFFECT:SetPosition("markSet", Vector(0, 0.65, 0.1))
      EFFECT:Play("markSet")
      local talkCounter = 30
      local talkMode = 0
      local loopSeStartCounter = 15
      local decideWait = 15
      local speed = -rouletteSys:GetRotSpeed()
      speed = speed * 0.9
      local speedMode = 0
      while true do
        if loopSeStartCounter > 0 then
          loopSeStartCounter = loopSeStartCounter - 1
          if loopSeStartCounter == 0 then
            SOUND:PlaySe(SymSnd("SE_EVT_YAYAKOWA_LP"), Volume(172))
          end
        end
        local rot = rouletteSys:GetRot() + 32
        local oneR = math.fmod(rot, 72) / 72
        local oldSpeed = speed
        local ajustF
        local cenerRate = -(oneR - 0.5) * 2
        if speedMode == 0 then
          if oneR < 0.502 then
            speed = speed * 1.035
            ajustF = cenerRate * 0.04
            speed = speed + ajustF
          else
            speed = speed * 0.87
            ajustF = cenerRate * 0.04
            speed = speed + ajustF
          end
          if math.abs(speed) < 8 then
            speedMode = 1
            EFFECT:Play("eff0")
          end
        elseif speedMode == 1 then
          speed = speed * 0.991
          if math.abs(speed) < 5.8 then
            speedMode = 2
          end
        elseif speedMode == 2 then
          local nextRate = oneR
          if nextRate < 0.4 then
            nextRate = 1.001
            if speed > 2 then
              speed = 2
            end
          elseif nextRate < 0.55 then
            nextRate = 0.981
          else
            nextRate = 1
            if speed > 2 then
              speed = 2
            end
          end
          speed = speed * nextRate
          if math.abs(speed) < 1.3 then
            break
          end
        end
        rouletteSys:SetRotSpeed(-speed)
        if talkCounter <= 0 then
          if math.abs(speed) > 6.5 then
            TaskTalkSys:ForceCloseMessage()
            TaskTalkSys:Talk(20, 88, FACE_TYPE.SPECIAL01, V_ROULETTE__ROULETTE_STOP_TALK1)
            talkCounter = 120
          else
          end
        else
          talkCounter = talkCounter - 1
        end
        coroutine.yield(true)
      end
      rouletteSys:SetRotSpeed(0)
      TaskTalkSys:ForceCloseMessage()
      SOUND:StopSe(SymSnd("SE_EVT_YAYAKOWA_LP"))
      SOUND:StopBgm()
      if rouletteSys:IsHitNow() then
        actSys:TelopPlay("V_ROULETTE_BINGO")
        SOUND:PlayMe(SymSnd("ME_EVT_TA_DAH"))
        while SJ("TELOP"):IsPause() == false do
          coroutine.yield(true)
        end
      else
        SOUND:PlayMe(SymSnd("ME_MINIGAME_BAD"))
        actSys:TelopPlay("V_ROULETTE_BLANK")
        while SJ("TELOP"):IsPause() == false do
          coroutine.yield(true)
        end
      end
      return false
    end)
  end
  function actSys:RouletteEnd()
    self.work.bikuActCo = coroutine.wrap(function()
      VrouletteSys:CutPlay(SymCutMsgId("ZoomOut"))
      VrouletteCircleSys:UseCircleControl()
      while VrouletteSys:IsCutPlaying() do
        coroutine.yield(true)
      end
      return false
    end)
  end
  function actSys:BikutyniRouletteWaiting(ptn)
    self.work.bikuActCo = coroutine.wrap(function()
      if ptn == 0 then
        TaskTalkSys:Talk(20, 88, FACE_TYPE.SPECIAL01, V_ROULETTE__ROULETTE_NOW_TALK1)
        CH("BIKUTYINI"):SetVisible(true)
        for i = 1, 1 do
          VrouletteSys:CutPlay(SymCutMsgId("LoopBikutyni01"))
          while VrouletteSys:IsCutPlaying() do
            coroutine.yield(true)
          end
        end
        for i = 1, 1 do
          VrouletteSys:CutPlay(SymCutMsgId("LoopBikutyni02"))
          while VrouletteSys:IsCutPlaying() do
            coroutine.yield(true)
          end
        end
        CH("BIKUTYINI"):SetVisible(false)
        TaskTalkSys:ForceCloseMessage()
        for t = 0, 30 do
          coroutine.yield(true)
        end
      elseif ptn == 2 then
        TaskTalkSys:Talk(20, 88, FACE_TYPE.SPECIAL01, V_ROULETTE__ROULETTE_NOW_TALK2)
        CH("BIKUTYINI"):SetVisible(true)
        for i = 1, 1 do
          VrouletteSys:CutPlay(SymCutMsgId("LoopBikutyni01"))
          while VrouletteSys:IsCutPlaying() do
            coroutine.yield(true)
          end
        end
        for i = 1, 1 do
          VrouletteSys:CutPlay(SymCutMsgId("LoopBikutyni02"))
          while VrouletteSys:IsCutPlaying() do
            coroutine.yield(true)
          end
        end
        CH("BIKUTYINI"):SetVisible(false)
        TaskTalkSys:ForceCloseMessage()
        for t = 0, 30 do
          coroutine.yield(true)
        end
      elseif ptn == 3 then
        TaskTalkSys:Talk(20, 88, FACE_TYPE.SPECIAL01, V_ROULETTE__ROULETTE_NOW_TALK2)
        CH("BIKUTYINI"):SetVisible(true)
        for i = 1, 1 do
          VrouletteSys:CutPlay(SymCutMsgId("LoopBikutyni01"))
          while VrouletteSys:IsCutPlaying() do
            coroutine.yield(true)
          end
        end
        for i = 1, 1 do
          VrouletteSys:CutPlay(SymCutMsgId("LoopBikutyni02"))
          while VrouletteSys:IsCutPlaying() do
            coroutine.yield(true)
          end
        end
        CH("BIKUTYINI"):SetVisible(false)
        TaskTalkSys:ForceCloseMessage()
        for t = 0, 30 do
          coroutine.yield(true)
        end
      elseif ptn == 4 then
        TaskTalkSys:Talk(20, 88, FACE_TYPE.SPECIAL01, V_ROULETTE__ROULETTE_NOW_TALK2)
        CH("BIKUTYINI"):SetVisible(true)
        for i = 1, 1 do
          VrouletteSys:CutPlay(SymCutMsgId("LoopBikutyni01"))
          while VrouletteSys:IsCutPlaying() do
            coroutine.yield(true)
          end
        end
        for i = 1, 1 do
          VrouletteSys:CutPlay(SymCutMsgId("LoopBikutyni02"))
          while VrouletteSys:IsCutPlaying() do
            coroutine.yield(true)
          end
        end
        CH("BIKUTYINI"):SetVisible(false)
        TaskTalkSys:ForceCloseMessage()
        for t = 0, 30 do
          coroutine.yield(true)
        end
      end
      return false
    end)
  end
  function actSys:TelopPlay(name)
    local eLanguageType = SYSTEM:GetLanguageType()
    if eLanguageType == LANGUAGE_TYPE.FR then
      name = name .. "_FR"
    elseif eLanguageType == LANGUAGE_TYPE.GE then
      name = name .. "_GE"
    elseif eLanguageType == LANGUAGE_TYPE.IT then
      name = name .. "_IT"
    elseif eLanguageType == LANGUAGE_TYPE.SP then
      name = name .. "_SP"
    end
    SAJI:CreateSajiPlayer("TELOP", name)
    SJ("TELOP"):Play(LOOP.OFF)
    SJ("TELOP"):SetVisible(true)
    SJ("TELOP"):SetDrawPriority(1)
    SJ("TELOP"):SetPosition(Vector2(200, 120))
  end
  function actSys:Tick()
    if self.work.bikuActCo and self.work.bikuActCo() == false then
      self.work.bikuActCo = nil
    end
  end
  local sceneSys = {}
  function sceneSys:Init()
    self.scenCo = coroutine.wrap(sceneSys.StartScene)
    self.nextScenCo = nil
    self.work = {}
  end
  function sceneSys:Finish()
  end
  function sceneSys:IsEnd()
    return self.scenCo == nil
  end
  function sceneSys:Tick()
    if self.scenCo and self.scenCo(self) == false then
      self.scenCo = self.nextScenCo
      self.nextScenCo = nil
    end
  end
  function sceneSys:StartScene()
    self.isPushedStop = false
    actSys:RouletteStart()
    while actSys:IsRunBikuAct() do
      coroutine.yield(true)
    end
    self.nextScenCo = coroutine.wrap(sceneSys.LoopRoulette)
    return false
  end
  function sceneSys:LoopRoulette()
    local keyStartWaitCnt = 5
    while true do
      if keyStartWaitCnt > 0 then
        keyStartWaitCnt = keyStartWaitCnt - 1
      end
      if PAD:Edge("A") and keyStartWaitCnt == 0 or self.isPushedStop then
        self.nextScenCo = coroutine.wrap(sceneSys.StopRoulette)
        CUT:Pause()
        CH("BIKUTYINI"):SetVisible(false)
        return false
      end
      if actSys:IsRunBikuAct() == false then
        actSys:BikutyniRouletteWaiting(SYSTEM:GetRandomValue(0, 4))
      end
      coroutine.yield(true)
    end
  end
  function sceneSys:StopRoulette()
    actSys:RouletteStop()
    while actSys:IsRunBikuAct() do
      coroutine.yield(true)
    end
    actSys:RouletteEnd()
    while actSys:IsRunBikuAct() do
      coroutine.yield(true)
    end
    CH("BIKUTYINI"):SetVisible(true)
    return false
  end
  rouletteSys:Init()
  actSys:Init()
  sceneSys:Init()
  TASK:Sleep(TimeSec(0))
  local offset = 0
  local endWait = false
  while true do
    if sceneSys:IsEnd() then
      break
    end
    sceneSys:Tick()
    rouletteSys:Tick()
    actSys:Tick()
    TASK:Sleep(TimeSec(0))
  end
  local isHit = rouletteSys:IsHitNow()
  sceneSys:Finish()
  rouletteSys:Finish()
  actSys:Finish()
  if isHit then
    optTbl.successAct()
  else
    optTbl.failedAct()
  end
end

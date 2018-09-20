ShopSys = {}
function ShopSys:Start(optTbl)
  self.ownerAct = ""
  self.talk_select_obj = nil
  self.shopping_selectGoodsTbl = nil
  self.shopping_helpGenFunc = nil
  self.shopping_selectNumber = nil
  self.shopping_itemShopKind = nil
  self.shopping_lastCursorIdx = nil
  self.shopping_paraShopIns = nil
  self.shopping_ratioBuy = 1
  self.shopping_ratioSell = 1
  self.shopping_raitoSellType = ITEM_SHOP_TYPE.NONE
  self.cursorSaveTbl = {}
  if optTbl == nil or not optTbl.withOutLowerScreen then
    self.last_lower_visible = LOWER_SCREEN:IsVisible()
    LOWER_SCREEN:SetVisible(false)
  else
    self.last_lower_visible = nil
  end
end
function ShopSys:Finish()
  WINDOW:CloseMessage()
  WINDOW:SetMessageScreenMode(ScreenType.A)
  if self.last_lower_visible ~= nil then
    LOWER_SCREEN:SetVisible(self.last_lower_visible)
  end
  self.ownerAct = nil
  self.talk_select_obj = nil
  self.shopping_selectGoodsTbl = nil
  self.shopping_helpGenFunc = nil
  self.shopping_selectNumber = nil
  self.shopping_itemShopKind = nil
  self.shopping_lastCursorIdx = nil
  self.shopping_paraShopIns = nil
  self.shopping_ratioBuy = nil
  self.shopping_ratioSell = nil
  self.shopping_raitoSellType = nil
  self.cursorSaveTbl = nil
  self.last_lower_visible = nil
end
function ShopSys:Suspend()
  local resumeData = {}
  resumeData.ownerAct = self.ownerAct
  resumeData.talk_select_obj = self.talk_select_obj
  resumeData.shopping_selectGoodsTbl = self.shopping_selectGoodsTbl
  resumeData.shopping_helpGenFunc = self.shopping_helpGenFunc
  resumeData.shopping_selectNumber = self.shopping_selectNumber
  resumeData.shopping_itemShopKind = self.shopping_itemShopKind
  resumeData.shopping_lastCursorIdx = self.shopping_lastCursorIdx
  resumeData.shopping_paraShopIns = self.shopping_paraShopIns
  resumeData.shopping_ratioBuy = self.shopping_ratioBuy
  resumeData.shopping_ratioSell = self.shopping_ratioSell
  resumeData.shopping_raitoSellType = self.shopping_raitoSellType
  resumeData.cursorSaveTbl = self.cursorSaveTbl
  resumeData.last_lower_visible = self.last_lower_visible
  return resumeData
end
function ShopSys:Resume(resumeData)
  self.ownerAct = resumeData.ownerAct
  self.talk_select_obj = resumeData.talk_select_obj
  self.shopping_selectGoodsTbl = resumeData.shopping_selectGoodsTbl
  self.shopping_helpGenFunc = resumeData.shopping_helpGenFunc
  self.shopping_selectNumber = resumeData.shopping_selectNumber
  self.shopping_itemShopKind = resumeData.shopping_itemShopKind
  self.shopping_lastCursorIdx = resumeData.shopping_lastCursorIdx
  self.shopping_paraShopIns = resumeData.shopping_paraShopIns
  self.shopping_ratioBuy = resumeData.shopping_ratioBuy
  self.shopping_ratioSell = resumeData.shopping_ratioSell
  self.shopping_raitoSellType = resumeData.shopping_raitoSellType
  self.cursorSaveTbl = resumeData.cursorSaveTbl
  self.last_lower_visible = resumeData.last_lower_visible
end
function ShopSys:SetOwner(act)
  ShopSys.ownerAct = act
end
function ShopSys:SetMessageScreenMode(screenType)
  WINDOW:SetMessageScreenMode(screenType)
end
function ShopSys:DebugTalk(text, face)
  if face == nil then
    face = FACE_TYPE.NORMAL
  end
  WINDOW:DrawFace(20, 88, SymAct(self.ownerAct), face)
  WINDOW:Talk(SymWord(GROUND_MESSAGE__SPESICAL_SPEKER_5), text)
end
function ShopSys:Talk(text, face)
  if face == nil then
    face = FACE_TYPE.NORMAL
  end
  if GROUND:ShopFlowSystem_IsOwner() == true then
    ShopSys:SetOwner(GROUND:ShopFlowSystem_GetOwner())
  end
  WINDOW:DrawFace(20, 88, SymAct(self.ownerAct), face)
  WINDOW:Talk(SymAct(self.ownerAct), text)
end
function ShopSys:SysMsg(text)
  WINDOW:SysMsg(text)
end
function ShopSys:DummyJudeAsk(msg, isDefaultNO)
  local result = false
  local askMenu = MENU:CreateAskMenu()
  askMenu:Setup(true, true, false)
  askMenu:AddItem("\227\129\175\227\129\132", nil, {
    decideAction = function(self)
      result = true
      self:CloseAndClearFocus()
    end
  })
  askMenu:AddItem("\227\129\132\227\129\132\227\129\136", nil, {
    decideAction = function(self)
      result = false
      self:CloseAndClearFocus()
    end
  })
  if isDefaultNO then
    askMenu:SetDefaultCursorDispIndex(1)
  end
  WINDOW:SysMsg(msg)
  WINDOW:SelectSetLuaMenu(askMenu)
  WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  return result
end
function ShopSys:TalkAskFlow(text, face, miscOptTbl, cancelFlow, ...)
  self:MsgAskFlowImpl(text, {
    face = face,
    isClose = true,
    isTalk = true,
    misc = miscOptTbl
  }, cancelFlow, ...)
end
function ShopSys:TalkAskFlowNoClose(text, face, miscOptTbl, cancelFlow, ...)
  self:MsgAskFlowImpl(text, {
    face = face,
    isClose = false,
    isTalk = true,
    misc = miscOptTbl
  }, cancelFlow, ...)
end
function ShopSys:SysMsgAskFlow(text, miscOptTbl, cancelFlow, ...)
  self:MsgAskFlowImpl(text, {
    face = nil,
    isClose = true,
    isTalk = false,
    misc = miscOptTbl
  }, cancelFlow, ...)
end
function ShopSys:SysMsgAskFlowNoClose(text, miscOptTbl, cancelFlow, ...)
  self:MsgAskFlowImpl(text, {
    face = nil,
    isClose = false,
    isTalk = false,
    misc = miscOptTbl
  }, cancelFlow, ...)
end
function ShopSys:MsgAskFlowImpl(text, optTbl, cancelFlow, ...)
  local mode, lastSelObj
  for i, v in pairs({
    ...
  }) do
    if v.cancelUse == true then
      cancelFlow = v
    end
  end
  if cancelFlow ~= nil then
    if optTbl.isClose then
      mode = MENU_SELECT_MODE.ENABLE_CANCEL_HIDDEN
    else
      mode = MENU_SELECT_MODE.ENABLE_CANCEL_HIDDEN_NO_CLOSE
    end
  elseif optTbl.isClose then
    mode = MENU_SELECT_MODE.DISABLE_CANCEL
  else
    mode = MENU_SELECT_MODE.DISABLE_CANCEL_NO_CLOSE
  end
  local continueCursorIdx
  local exitLoop = false
  while true do
    do
      local askMenu = MENU:CreateAskMenu()
      local callFlow
      local function decideActionCallAct(selfObj, tbl)
        if tbl.actTbl and tbl.actTbl.decideAction then
          tbl.actTbl.decideAction(selfObj)
        end
        lastSelObj = selfObj.curItem.obj
      end
      local function flowAct(tbl, dispIdx)
        if tbl.next then
          if tbl.next ~= "" then
            FlowSys:Next(tbl.next)
          else
            exitLoop = true
          end
        elseif tbl.returnNext then
          if tbl.returnNext ~= "" then
            FlowSys:ReturnNext(tbl.returnNext)
          else
            FlowSys:Return()
          end
        elseif tbl.call then
          callFlow = tbl.call
        else
          assert(self, "\227\131\149\227\131\173\227\131\188\227\129\140\227\129\170\227\129\132\227\129\167\227\129\153")
        end
        continueCursorIdx = dispIdx
        if optTbl.misc and optTbl.misc.cursorSaveName then
          self.cursorSaveTbl[optTbl.misc.cursorSaveName] = continueCursorIdx
        end
      end
      askMenu:Setup(true, optTbl.isTalk, false)
      local dispIdx = 0
      local defualtDispIdx = 0
      for i, v in pairs({
        ...
      }) do
        do
          local addOk = true
          if v.disableFunc ~= nil then
            addOk = v.disableFunc() == false
          elseif v.enableFunc ~= nil then
            addOk = v.enableFunc()
          end
          if addOk then
            askMenu:AddItem(v.text, v.obj, {
              decideAction = function(self)
                decideActionCallAct(self, v)
                flowAct(v, self.curItem.dispIndex)
                self:CloseAndClearFocus()
              end
            })
            if v.default == true then
              defualtDispIdx = dispIdx
            end
            dispIdx = dispIdx + 1
          end
        end
      end
      if optTbl.misc and optTbl.misc.cursorSaveName and self.cursorSaveTbl[optTbl.misc.cursorSaveName] then
        continueCursorIdx = self.cursorSaveTbl[optTbl.misc.cursorSaveName]
      end
      if continueCursorIdx then
        askMenu:SetDefaultCursorDispIndex(continueCursorIdx)
      else
        askMenu:SetDefaultCursorDispIndex(defualtDispIdx)
      end
      if cancelFlow ~= nil then
        function askMenu:cancelAction()
          flowAct(cancelFlow)
          self:CloseAndClearFocus()
        end
      end
      if optTbl.isTalk then
        if optTbl.face == nil then
          optTbl.face = FACE_TYPE.NORMAL
        end
        if optTbl.face ~= false then
          WINDOW:DrawFace(20, 88, SymAct(self.ownerAct), optTbl.face)
        end
        WINDOW:Talk(SymAct(self.ownerAct), text)
        WINDOW:SelectSetLuaMenu(askMenu)
        WINDOW:SelectEndTalk(mode)
      else
        WINDOW:SysMsg(text)
        WINDOW:SelectSetLuaMenu(askMenu)
        WINDOW:SelectEnd(mode)
      end
      if callFlow then
        FlowSys:Call(callFlow)
        if optTbl.misc and optTbl.misc.cursorReset then
          continueCursorIdx = nil
        end
      end
      if self:NeedReturnFlow() or exitLoop then
        self.talk_select_obj = lastSelObj
        break
      end
    end
  end
end
function ShopSys:NeedReturnFlow()
  return FlowSys:CheckNext() or FlowSys:CheckReturn()
end
function ShopSys:GetLastAskSelectObj()
  return self.talk_select_obj
end
ShopSys.tagNumberTbl_ = {
  ["\229\144\136\232\168\136\232\179\188\229\133\165\233\161\141"] = {number = 0, typ = "string"},
  ["\229\144\136\232\168\136\229\163\178\229\141\180\233\161\141"] = {number = 1, typ = "string"},
  ["\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141"] = {number = 2, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\233\129\147\229\133\183"] = {number = 3, typ = "string"},
  ["\229\191\133\232\166\129\233\129\147\229\133\183"] = {number = 4, typ = "string"},
  ["\229\160\177\233\133\172\233\135\145\233\161\141"] = {number = 5, typ = "string"},
  ["\229\160\177\233\133\172\233\129\147\229\133\183"] = {number = 6, typ = "string"},
  ["\229\128\139\230\149\176"] = {number = 7, typ = "string"},
  ["\229\160\177\233\133\172\227\131\157\227\130\164\227\131\179\227\131\136"] = {number = 8, typ = "string"},
  ["\227\130\130\227\130\137\227\129\163\227\129\159\233\129\147\229\133\183"] = {number = 5, typ = "string"},
  ["\227\130\130\227\130\137\227\129\163\227\129\159\233\135\145\233\161\141"] = {number = 6, typ = "string"},
  ["\227\129\130\227\129\190\227\129\163\227\129\159\229\128\139\230\149\176"] = {number = 7, typ = "string"},
  ["\227\129\175\227\129\132\227\129\163\227\129\159\229\128\139\230\149\176"] = {number = 8, typ = "string"},
  ["\233\129\184\230\138\158\233\135\145\229\161\138\230\149\176"] = {number = 5, typ = "string"},
  ["\229\144\136\232\168\136\233\135\145\229\161\138\230\149\176"] = {number = 6, typ = "string"},
  ["\233\145\145\229\174\154\227\129\151\227\129\159\227\129\132\229\174\157\231\174\177"] = {number = 5, typ = "string"},
  ["\233\145\145\229\174\154\227\130\162\227\130\164\227\131\134\227\131\160\229\144\141"] = {number = 5, typ = "string"},
  ["\227\131\129\227\131\188\227\131\160\227\130\185\227\130\173\227\131\171\229\144\141"] = {number = 5, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\229\177\158\230\128\167"] = {number = 5, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\232\137\178"] = {number = 6, typ = "string"},
  ["\230\128\157\227\129\132\229\135\186\227\129\153\230\138\128"] = {number = 5, typ = "string"},
  ["\229\191\152\227\130\140\227\130\139\230\138\128"] = {number = 6, typ = "string"},
  ["\229\164\137\230\155\180\227\129\153\227\130\139\227\129\168\227\129\143\227\129\155\227\129\132"] = {number = 6, typ = "string"},
  ["\229\174\159\232\161\140\228\184\173\228\190\157\233\160\188"] = {number = 5, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\228\190\157\233\160\188"] = {number = 6, typ = "string"},
  ["\227\131\155\227\130\185\227\131\136\227\129\174\227\131\157\227\130\177\227\131\162\227\131\179"] = {number = 7, typ = "string"},
  ["\227\129\152\227\129\182\227\130\147\227\129\174\227\131\157\227\130\177\227\131\162\227\131\179"] = {number = 7, typ = "string"},
  ["\229\136\182\233\153\144\229\128\139\230\149\176"] = {number = 8, typ = "string"},
  ["\229\136\182\233\153\144\227\130\191\227\130\164\227\131\151"] = {number = 9, typ = "string"},
  ["\227\131\172\227\131\153\227\131\171\230\140\135\229\174\154"] = {number = 10, typ = "string"},
  ["\229\136\182\233\153\144\229\140\185\230\149\176"] = {number = 11, typ = "string"},
  ["\233\129\184\230\138\158\233\135\145\233\161\141"] = {number = 5, typ = "money"},
  ["\229\136\176\231\157\128\233\154\142\230\149\176"] = {number = 6, typ = "string"},
  ["\227\129\138\229\174\157"] = {number = 7, typ = "string"},
  ["\228\188\145\230\134\169\227\129\174\230\150\153\233\135\145"] = {number = 8, typ = "string"},
  ["\227\131\128\227\130\164\227\131\144\227\131\188\229\144\141"] = {number = 9, typ = "string"},
  ["\233\129\184\230\138\158\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141"] = {number = 10, typ = "string"},
  ["\233\129\184\230\138\158\227\131\145\227\131\169\227\131\128\227\130\164\227\130\185\229\144\141"] = {number = 5, typ = "string"},
  ["\230\174\139\227\130\138\229\128\139\230\149\176"] = {number = 6, typ = "string"},
  ["\233\129\184\230\138\158\229\128\139\230\149\176"] = {number = 7, typ = "string"},
  ["\229\177\138\227\129\132\227\129\166\227\129\132\227\130\139\230\149\176"] = {number = 8, typ = "string"},
  ["\233\129\147\229\133\183\229\144\141"] = {number = 9, typ = "string"},
  ["\231\141\178\229\190\151\227\131\157\227\130\164\227\131\179\227\131\136"] = {number = 10, typ = "string"},
  ["\228\184\138\227\129\140\227\129\163\227\129\159\227\131\169\227\131\179\227\130\175"] = {number = 11, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\230\150\189\232\168\173"] = {number = 5, typ = "string"},
  ["\229\187\186\232\168\173\227\129\149\227\130\140\227\129\166\227\129\132\227\130\139\230\150\189\232\168\173"] = {number = 6, typ = "string"},
  ["\230\164\141\227\129\136\227\129\159\227\130\130\227\129\174"] = {number = 5, typ = "string"},
  ["\230\164\141\227\129\136\227\130\137\227\130\140\227\130\139\227\130\191\227\131\141"] = {number = 6, typ = "string"},
  ["\231\149\145\227\129\174\230\150\189\232\168\173\229\144\141"] = {number = 7, typ = "string"},
  ["\233\129\184\230\138\158\229\191\133\232\166\129\230\149\176"] = {number = 5, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\229\149\134\229\147\129"] = {number = 6, typ = "string"},
  ["\231\143\190\229\156\168\227\129\174\232\168\173\229\174\154\231\138\182\230\133\139"] = {number = 5, typ = "string"},
  ["\233\129\147\229\160\180\229\144\141"] = {number = 5, typ = "string"},
  ["\233\129\147\229\160\180\227\129\174\227\130\191\227\130\164\227\131\151"] = {number = 6, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\227\130\143\227\129\150"] = {number = 7, typ = "string"},
  ["\228\191\174\232\161\140\233\129\147\229\133\183"] = {number = 8, typ = "string"},
  ["\227\129\178\227\129\145\227\129\164\227\131\145\227\131\169\227\131\161\227\131\188\227\130\191"] = {number = 9, typ = "string"},
  ["\227\129\178\227\129\145\227\129\164\233\129\147\229\133\183\239\188\145"] = {number = 10, typ = "string"},
  ["\227\129\178\227\129\145\227\129\164\233\129\147\229\133\183\239\188\146"] = {number = 11, typ = "string"},
  ["\227\129\178\227\129\145\227\129\164\233\129\147\229\133\183\239\188\147"] = {number = 12, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152\229\188\149\227\129\141\229\136\184"] = {number = 5, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\232\137\178"] = {number = 6, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\229\143\163\230\149\176"] = {number = 7, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152\233\135\145\233\161\141"] = {number = 8, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\227\129\169\227\129\134\227\129\144"] = {number = 9, typ = "string"},
  ["\232\179\158\233\135\145\233\161\141"] = {number = 10, typ = "string"},
  ["\229\189\147\227\129\159\227\129\163\227\129\159\230\153\175\229\147\129"] = {number = 11, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\227\129\143\227\129\152"] = {number = 12, typ = "string"},
  ["\229\133\165\227\130\137\227\129\170\227\129\132\229\128\139\230\149\176"] = {number = 13, typ = "string"},
  ["\229\176\130\233\150\128\229\186\151\229\144\141"] = {number = 5, typ = "string"},
  ["\229\176\130\233\150\128\227\129\169\227\129\134\227\129\144"] = {number = 6, typ = "string"},
  ["\230\155\178\227\130\162\227\130\164\227\131\134\227\131\160\229\144\141"] = {number = 5, typ = "string"},
  ["\229\164\137\230\155\180\230\155\178\229\144\141"] = {number = 6, typ = "string"},
  ["\229\133\165\229\138\155\227\129\151\227\129\159\230\149\176\229\128\164"] = {number = 5, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\227\130\187\227\131\131\227\131\136"] = {number = 6, typ = "string"},
  ["\228\187\138\230\151\165\227\129\174\227\130\191\227\130\164\227\131\151"] = {number = 5, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\227\130\191\227\130\164\227\131\151"] = {number = 6, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\229\156\176\229\155\179"] = {number = 5, typ = "string"},
  ["\229\187\186\227\129\163\227\129\166\227\129\132\227\130\139\229\187\186\231\137\169"] = {number = 5, typ = "string"},
  ["\231\141\178\229\190\151\227\129\151\227\129\159\229\174\157"] = {number = 6, typ = "string"},
  ["\233\129\184\230\138\158\227\129\151\227\129\159\230\183\177\227\129\149"] = {number = 7, typ = "string"},
  ["\230\142\162\229\129\181\227\129\139\227\130\137\232\178\183\227\129\134\228\190\157\233\160\188"] = {number = 5, typ = "string"},
  ["\228\190\157\233\160\188\230\142\162\227\129\153\233\135\145\233\161\141"] = {number = 6, typ = "string"},
  ["\228\189\156\230\136\144\227\129\153\227\130\139\227\130\174\227\131\149\227\131\136"] = {number = 5, typ = "string"},
  ["\232\167\163\230\148\190\227\129\149\227\130\140\227\129\159\229\177\158\230\128\167"] = {number = 7, typ = "string"},
  ["\228\187\178\233\150\147\230\156\128\229\164\167\230\149\176"] = {number = 7, typ = "string"},
  ["\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\229\144\141"] = {number = 6, typ = "string"}
}
function ShopSys:GetShopTagIndex(key)
  if ShopSys.tagNumberTbl_[key] == nil then
    error("ShopSys:SetShopTag " .. key .. " \227\129\168\227\129\132\227\129\134\227\130\173\227\131\188\227\129\175\229\156\168\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159")
    return 0
  end
  return ShopSys.tagNumberTbl_[key].number
end
function ShopSys:SetShopTag(key, tag_value)
  if ShopSys.tagNumberTbl_[key] == nil then
    error("ShopSys:SetShopTag " .. key .. " \227\129\168\227\129\132\227\129\134\227\130\173\227\131\188\227\129\175\229\156\168\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159")
    return
  end
  if ShopSys.tagNumberTbl_[key].typ == "string" then
    MENU:SetTag_String(ShopSys.tagNumberTbl_[key].number, tag_value)
  elseif ShopSys.tagNumberTbl_[key].typ == "item" then
  elseif ShopSys.tagNumberTbl_[key].typ == "money" then
    MENU:SetTag_Money(ShopSys.tagNumberTbl_[key].number, tag_value)
  end
end
function ShopSys:SetShopKind(itemShopKind)
  self.shopping_itemShopKind = itemShopKind
end
function ShopSys:assertShopKind()
  if self.shopping_itemShopKind == nil then
    assert(nil, "ShopSys:\229\149\134\229\147\129\227\129\174\231\168\174\233\161\158\227\129\140\232\168\173\229\174\154\227\129\149\227\130\140\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
  end
end
function ShopSys:SetParaideShopInstance(shopIns)
  self.shopping_paraShopIns = shopIns
  ShopSys:SetOwner(self.shopping_paraShopIns:GetOwnerSymbol())
  if ShopSys:GetParaideShopType() == "ParadiseShop_SpecialMarchant" then
    self.shopping_ratioBuy = shopIns:GetPriceRaito()
    self.shopping_ratioSell = shopIns:GetSellRaito()
    local shopLabel = shopIns:GetShopLabel()
    if shopLabel == "shop_special_merchant_plant" then
      self.shopping_raitoSellType = ITEM_SHOP_TYPE.SEED
    elseif shopLabel == "shop_special_merchant_throw" then
      self.shopping_raitoSellType = ITEM_SHOP_TYPE.MISSILE
    elseif shopLabel == "shop_special_merchant_orb" then
      self.shopping_raitoSellType = ITEM_SHOP_TYPE.ORB
    end
  end
  ShopSys:SetShopKind(nil)
end
function ShopSys:assertParaideShopInstance()
  if self.shopping_paraShopIns == nil then
    assert(nil, "ShopSys:\229\149\134\229\147\129\227\129\174\231\168\174\233\161\158\227\129\140\232\168\173\229\174\154\227\129\149\227\130\140\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
  end
end
function ShopSys:GetParaideShopType()
  if self.shopping_paraShopIns then
    return class_info(self.shopping_paraShopIns).name
  end
  return nil
end
function ShopSys:SetSelectGoodsTbl(goodsTbl)
  ShopSys.shopping_selectGoodsTbl = goodsTbl
end
function ShopSys:assertSelectGoods()
  if self.shopping_selectGoodsTbl == nil or #self.shopping_selectGoodsTbl == 0 then
    assert(nil, "ShopSys:\229\149\134\229\147\129\227\129\140\233\129\184\227\129\176\227\130\140\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
  end
end
function ShopSys:GetSelectGoodsTbl()
  return ShopSys.shopping_selectGoodsTbl
end
function ShopSys:SelectAllBagGoods()
  self.shopping_selectGoodsTbl = {}
  for goods in GROUND:EnumerateBagItems() do
    if goods:IsNowEquipped() == false then
      table.insert(self.shopping_selectGoodsTbl, goods)
    end
  end
end
function ShopSys:assertSelectNumber()
  if self.shopping_selectNumber == nil then
    assert(nil, "ShopSys:\230\149\176\229\128\164\227\129\140\233\129\184\227\129\176\227\130\140\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
  end
end
function ShopSys:SelectNumber(num)
  ShopSys.shopping_selectNumber = num
end
function ShopSys:GetSelectNumberText()
  ShopSys:assertSelectNumber()
  return "" .. ShopSys.shopping_selectNumber
end
function ShopSys:GetSelectNumber()
  ShopSys:assertSelectNumber()
  return ShopSys.shopping_selectNumber
end
function ShopSys:assertSelectPokemonWarehouseId()
  if self.shopping_selectPokemonWarehouseId == nil then
    assert(nil, "ShopSys:\227\131\157\227\130\177\227\131\162\227\131\179\229\128\137\229\186\171\239\188\169\239\188\164\227\129\140\233\129\184\227\129\176\227\130\140\227\129\166\227\129\132\227\129\190\227\129\155\227\130\147")
  end
end
function ShopSys:SelectPokemonWarehouseId(warehouseId)
  ShopSys.shopping_selectPokemonWarehouseId = warehouseId
end
function ShopSys:GetSelectPokemonWarehouseNameText()
  ShopSys:assertSelectPokemonWarehouseId()
  return GROUND:GetPokemonWarehouseNameFromId(ShopSys.shopping_selectPokemonWarehouseId)
end
function ShopSys:CheckBankDepositMax()
  return GROUND:GetBankMoney() >= GROUND:GetBankMoneyLimit()
end
function ShopSys:CheckBankDepositZero()
  return GROUND:GetBankMoney() <= 0
end
function ShopSys:DepositBankMoney()
  ShopSys:assertSelectNumber()
  GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() - ShopSys.shopping_selectNumber)
  GROUND:SetBankMoney(GROUND:GetBankMoney() + ShopSys.shopping_selectNumber)
end
function ShopSys:DrawBankMoney()
  ShopSys:assertSelectNumber()
  GROUND:SetPlayerMoney(GROUND:GetPlayerMoney() + ShopSys.shopping_selectNumber)
  GROUND:SetBankMoney(GROUND:GetBankMoney() - ShopSys.shopping_selectNumber)
end
function ShopSys:CheckLineup()
  if ShopSys:GetParaideShopType() == "ParadiseShop_SpecialMarchant" then
    if self.shopping_paraShopIns:GetShopItemCount() == 0 then
      return false
    end
  else
    ShopSys:assertShopKind()
    if GROUND:GetShopItemCount(self.shopping_itemShopKind) == 0 then
      return false
    end
  end
  return true
end
function ShopSys:GetSelectItemId()
  ShopSys:assertSelectGoods()
  return self.shopping_selectGoodsTbl[1]:GetIndex()
end
function ShopSys:GetSelectItemName()
  ShopSys:assertSelectGoods()
  return self.shopping_selectGoodsTbl[1]:GetItemText_forShopTalk()
end
function ShopSys:IsSelectGiftContainsPokemon(targetPokemonIndex)
  ShopSys:assertSelectGoods()
  local giftItem = self.shopping_selectGoodsTbl[1]
  return GROUND:IsGiftContainsPokemon(giftItem:GetIndex(), targetPokemonIndex)
end
function ShopSys:CheckMultiSelect()
  if self.shopping_selectGoodsTbl and #self.shopping_selectGoodsTbl >= 2 then
    return true
  end
  return false
end
function ShopSys:EnumerateShopItems()
  if ShopSys:GetParaideShopType() == "ParadiseShop_SpecialMarchant" then
    return self.shopping_paraShopIns:EnumerateShopItems()
  else
    ShopSys:assertShopKind()
    return GROUND:EnumerateShopItems(self.shopping_itemShopKind)
  end
end
function ShopSys:GetShopGoodsText(goods)
  return goods:GetItemText_forShopGoodsBag(ShopSys.shopping_ratioBuy)
end
function ShopSys:GetSellItemBagText(item)
  return item:GetItemText_forSellItemBag(self.shopping_ratioSell, self.shopping_raitoSellType)
end
function ShopSys:MakeGiftItem()
  ShopSys:assertSelectGoods()
  GROUND:MakeGiftItem(self.shopping_selectGoodsTbl)
end
function ShopSys:GetBuyPriceText()
  ShopSys:assertSelectGoods()
  local sumPrice = GROUND:CalcBuyItemPrice(self.shopping_selectGoodsTbl, self.shopping_ratioBuy)
  MENU:SetTag_Money(30, sumPrice)
  return MENU:ReplaceTagText("[st_money:30]")
end
function ShopSys:GetBuyGoldPriceText()
  ShopSys:assertSelectGoods()
  local sumPrice = GROUND:CalcTradeIngotPrice(self.shopping_selectGoodsTbl)
  MENU:SetTag_Value(0, sumPrice)
  return MENU:ReplaceTagText("[value_b:0]")
end
function ShopSys:GetSellPriceText()
  ShopSys:assertSelectGoods()
  local sumPrice = GROUND:CalcSellItemPrice(self.shopping_selectGoodsTbl, self.shopping_ratioSell, self.shopping_raitoSellType)
  MENU:SetTag_Money(30, sumPrice)
  return MENU:ReplaceTagText("[st_money:30]")
end
function ShopSys:CheckBuyablePrice()
  ShopSys:assertSelectGoods()
  local sumPrice = GROUND:CalcBuyItemPrice(self.shopping_selectGoodsTbl, ShopSys.shopping_ratioBuy)
  local playerMoney = GROUND:GetPlayerMoney()
  return sumPrice <= playerMoney
end
function ShopSys:CheckSellMoneyPlayerOver()
  ShopSys:assertSelectGoods()
  local sumPrice = GROUND:CalcSellItemPrice(self.shopping_selectGoodsTbl, ShopSys.shopping_ratioSell, ShopSys.shopping_raitoSellType)
  local playerMoney = GROUND:GetPlayerMoney()
  local playerMoneyMax = GROUND:GetPlayerMoneyLimit()
  return playerMoneyMax < sumPrice + playerMoney
end
function ShopSys:CheckSellMoneyPlayerAndBankOver()
  ShopSys:assertSelectGoods()
  local sumPrice = GROUND:CalcSellItemPrice(self.shopping_selectGoodsTbl, ShopSys.shopping_ratioSell, ShopSys.shopping_raitoSellType)
  local playerMoneySpace = GROUND:GetPlayerMoneyLimit() - GROUND:GetPlayerMoney()
  local bankMoneySpace = GROUND:GetBankMoneyLimit() - GROUND:GetBankMoney()
  return sumPrice > playerMoneySpace + bankMoneySpace
end
function ShopSys:CheckGoldTradePrice()
  ShopSys:assertSelectGoods()
  local sumPrice = GROUND:CalcTradeIngotPrice(self.shopping_selectGoodsTbl)
  local playerMoney = FUNC_COMMON:GetGoldIngot()
  return sumPrice <= playerMoney
end
function ShopSys:CheckNotForSell()
  ShopSys:assertSelectGoods()
  return false
end
function ShopSys:Buy()
  ShopSys:assertSelectGoods()
  GROUND:BuyShopItem(self.shopping_selectGoodsTbl, ShopSys.shopping_ratioBuy)
end
function ShopSys:Sell()
  ShopSys:assertSelectGoods()
  GROUND:SellBagItems(self.shopping_selectGoodsTbl, ShopSys.shopping_ratioSell, ShopSys.shopping_raitoSellType)
end
function ShopSys:Dump()
  ShopSys:assertSelectGoods()
  GROUND:DumpBagItems(self.shopping_selectGoodsTbl, self.shopping_ratioSell)
end
function ShopSys:TrateIngot()
  ShopSys:assertSelectGoods()
  GROUND:TradeIngot(self.shopping_selectGoodsTbl)
end
function ShopSys:MakeGiftItem()
  ShopSys:assertSelectGoods()
  GROUND:MakeGiftItem(self.shopping_selectGoodsTbl)
end
function ShopSys:GetBuyPrice(goods)
  local price = GROUND:CalcBuyItemPrice({goods}, self.shopping_ratioBuy)
  return price
end
function ShopSys:GetSellPrice(goods)
  local price = GROUND:CalcSellItemPrice({goods}, self.shopping_ratioSell, self.shopping_raitoSellType)
  return price
end
function ShopSys:GetBuyGoldPrice(goods)
  local price = GROUND:CalcTradeIngotPrice({goods})
  return price
end
function ShopSys:GetSellGoldPrice(goods)
  local price = GROUND:CalcTradeIngotPrice({goods}, self.shopping_ratioSell, self.shopping_raitoSellType)
  return price
end
function ShopSys:CheckBagOver()
  ShopSys:assertSelectGoods()
  local selectCount = #self.shopping_selectGoodsTbl
  local bagCount = GROUND:GetBagItemCount()
  local maxBagCount = GROUND:GetBagItemMaxCount()
  return maxBagCount < selectCount + bagCount
end
function ShopSys:CheckBagFull()
  local bagCount = GROUND:GetBagItemCount()
  local maxBagCount = GROUND:GetBagItemMaxCount()
  return bagCount >= maxBagCount
end
function ShopSys:CheckBagEmpty()
  local bagCount = GROUND:GetBagItemCount()
  return bagCount == 0
end
function ShopSys:CheckBagSellItemEmpty(optTbl)
  assert(optTbl.isAllSell ~= nil, "\229\188\149\230\149\176\227\129\140\227\129\138\227\129\139\227\129\151\227\129\132\227\129\167\227\129\153")
  if optTbl.isAllSell then
    local isEmpty = true
    for goods in GROUND:EnumerateBagItems() do
      if goods:IsNowEquipped() == false then
        isEmpty = false
        break
      end
    end
    return isEmpty
  else
    local bagCount = GROUND:GetBagItemCount()
    return bagCount == 0
  end
end
function ShopSys:CheckBagNoneDepositItem()
  local isFind = false
  for itemIns in GROUND:EnumerateBagItems() do
    if itemIns:GetKind() ~= ITEM_KIND.KIND_CHEST then
      isFind = true
      break
    end
  end
  return isFind == false
end
function ShopSys:CheckBagNoneChest()
  local isFind = false
  for itemIns in GROUND:EnumerateBagItems() do
    if itemIns:GetKind() == ITEM_KIND.KIND_CHEST then
      isFind = true
      break
    end
  end
  return isFind == false
end
function ShopSys:CheckPlayerMoneyMax()
  local playerMoneySpace = GROUND:GetPlayerMoneyLimit() - GROUND:GetPlayerMoney()
  return playerMoneySpace <= 0
end
function ShopSys:CheckPlayerMoneyZero()
  return GROUND:GetPlayerMoney() <= 0
end
function ShopSys:CheckWarehouseEmptyItem()
  for v in GROUND:EnumerateItemWarehouseItemIndex() do
    if ITEM:GetItemKind(v) ~= ITEM_KIND.KIND_KENZAI then
      return false
    end
  end
  return true
end
function ShopSys:CheckWarehouseEmptyKenzai()
  for v in GROUND:EnumerateItemWarehouseItemIndex() do
    if ITEM:GetItemKind(v) == ITEM_KIND.KIND_KENZAI then
      return false
    end
  end
  return true
end
function ShopSys:CheckWarehouseNoChest()
  return GROUND:GetChestWarehouseItemCount() == 0
end
function ShopSys:CheckWarehouseChestMax()
  return GROUND:GetChestWarehouseItemCount() >= GROUND:GetChestWarehouseItemMaxCount()
end
function ShopSys:DepositItemToWarehouseWithCheckOver()
  ShopSys:assertSelectGoods()
  local allOk = GROUND:DepositItemWarehouse(self.shopping_selectGoodsTbl)
  return allOk == false
end
function ShopSys:DepositChestToWarehouseWithCheckOver()
  ShopSys:assertSelectGoods()
  local allOk = GROUND:DepositChestWarehouse(self.shopping_selectGoodsTbl)
  return allOk == false
end
function ShopSys:DrawItemFromWarehouseWithCheckOver()
  ShopSys:assertSelectGoods()
  local allOk = false
  for i, v in ipairs(self.shopping_selectGoodsTbl) do
    allOk = GROUND:DrawOutItemWarehouseToBag(v.warehouseItemIndex, v.warehouseItemCount)
    if allOk == false then
      break
    end
  end
  return allOk == false
end
function ShopSys:DrawChestFromWarehouseWithCheckOver()
  ShopSys:assertSelectGoods()
  local allOk = GROUND:DrawOutChestWarehouseToBag(self.shopping_selectGoodsTbl)
  return allOk == false
end
function ShopSys:GetSelectWarehouseItemCount()
  ShopSys:assertSelectGoods()
  return GROUND:GetItemWarehouseItemNowCount(self.shopping_selectGoodsTbl[1].warehouseItemIndex)
end
function ShopSys:GetSelectWarehouseItemMaxCount()
  ShopSys:assertSelectGoods()
  return GROUND:GetItemWarehouseItemMaxCount(self.shopping_selectGoodsTbl[1].warehouseItemIndex)
end
function ShopSys:GetSelectWarehouseItemNameText()
  ShopSys:assertSelectGoods()
  MENU:SetTag_ItemIndexNoCount(0, self.shopping_selectGoodsTbl[1].warehouseItemIndex)
  return MENU:ReplaceTagText("[item_b:0]")
end
function ShopSys:GetSelectWarehouseItemOneLineExp()
  ShopSys:assertSelectGoods()
  return ITEM:GetItemOneLineExplainTextIdFromItemIndex(self.shopping_selectGoodsTbl[1].warehouseItemIndex)
end
function ShopSys:GetSelectWarehouseSetNameText()
  return
end
function ShopSys:GetSelectWarehouseItemCountText()
  ShopSys:assertSelectGoods()
  MENU:SetTag_Value(0, self.shopping_selectGoodsTbl[1].warehouseItemCount)
  return MENU:ReplaceTagText("[value_b:0]")
end
function ShopSys:GetSelectWarehouseItem()
  ShopSys:assertSelectGoods()
  return self.shopping_selectGoodsTbl[1]
end
function ShopSys:ChangeSelectPokemonLeader()
  local memberId = GROUND:GetPartyMemberIdFromPokemonWarehouseId(ShopSys.shopping_selectPokemonWarehouseId)
  GROUND:SetPartyPlayerFromId(memberId)
end
function ShopSys:ChangeSelectPokemonStandby()
  local memberId = GROUND:GetPartyMemberIdFromPokemonWarehouseId(ShopSys.shopping_selectPokemonWarehouseId)
  GROUND:RemovePartyFromId(memberId)
end
function ShopSys:ChangeSelectPokemonStandbyForVoyage()
  local memberId = GROUND:GetPartyMemberIdFromPokemonWarehouseId(ShopSys.shopping_selectPokemonWarehouseId)
  GROUND:RemovePartyFromId(memberId)
  GROUND:SetPokemonWarehouseSallyModeToVoyage(ShopSys.shopping_selectPokemonWarehouseId)
end
function ShopSys:ChangeSelectPokemonAddParty()
  GROUND:AddPartyFromWarehouse(ShopSys.shopping_selectPokemonWarehouseId)
end
function ShopSys:ClearPokemonParty()
  GROUND:AllRemoveParty()
end
function ShopSys:ChangeSelectPokemonPart()
  GROUND:RemovePokemonWarehouseFromId(ShopSys.shopping_selectPokemonWarehouseId)
end
function ShopSys:SaveCursorIndex(saveName, cursorIndex)
  self.cursorSaveTbl[saveName] = cursorIndex
end
function ShopSys:ResumeCursorIndex(saveName, defaultIndex)
  local curIdx = self.cursorSaveTbl[saveName]
  if curIdx then
    return curIdx
  end
  return defaultIndex
end
function ShopSys:DispBasicItemBagMenu(optTbl)
  CommonSys:OpenBasicMenu("", "", "")
  local bagCountWindow, moneyWindow, moneyAndSumWindow, ingotBoardMenu, ingotAndSumWindow, warehouseCountWindow, recycleCountWindow, dispFlag_moneyAndSumWindow
  if optTbl.isDispBagCountWindow then
    bagCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    bagCountWindow:SetFontType(FontType.TYPE_12)
    bagCountWindow:SetTextOffset(0, 0)
    bagCountWindow:SetLayoutRect(Rectangle(240, 168, 64, 16))
    bagCountWindow:Open()
  end
  if optTbl.isDispBagCountAndMoneyWindow then
    bagCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    bagCountWindow:SetFontType(FontType.TYPE_12)
    bagCountWindow:SetTextOffset(0, 0)
    bagCountWindow:SetLayoutRect(Rectangle(240, 136, 64, 16))
    moneyWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    moneyWindow:SetFontType(FontType.TYPE_12)
    moneyWindow:SetTextOffset(0, 0)
    moneyWindow:SetLayoutRect(Rectangle(240, 168, 64, 16))
    moneyAndSumWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    moneyAndSumWindow:SetFontType(FontType.TYPE_12)
    moneyAndSumWindow:SetTextOffset(0, 0)
    moneyAndSumWindow:SetLayoutRect(Rectangle(240, 152, 64, 32))
    bagCountWindow:Open()
    moneyWindow:Open()
    moneyAndSumWindow:Open()
    moneyAndSumWindow:SetVisible(false)
    dispFlag_moneyAndSumWindow = false
  end
  if optTbl.isDispIngotWindow then
    bagCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    bagCountWindow:SetFontType(FontType.TYPE_12)
    bagCountWindow:SetTextOffset(0, 0)
    bagCountWindow:SetLayoutRect(Rectangle(240, 136, 64, 16))
    ingotBoardMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
    ingotBoardMenu:SetFontType(FontType.TYPE_12)
    ingotBoardMenu:SetTextOffset(0, 0)
    ingotBoardMenu:SetLayoutRect(Rectangle(240, 168, 64, 16))
    ingotAndSumWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    ingotAndSumWindow:SetFontType(FontType.TYPE_12)
    ingotAndSumWindow:SetTextOffset(0, 0)
    ingotAndSumWindow:SetLayoutRect(Rectangle(240, 152, 64, 32))
    bagCountWindow:Open()
    ingotBoardMenu:Open()
    ingotAndSumWindow:Open()
    ingotAndSumWindow:SetVisible(false)
  end
  if optTbl.isDispWarehouseCountWindow then
    warehouseCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    warehouseCountWindow:SetFontType(FontType.TYPE_12)
    warehouseCountWindow:SetTextOffset(0, 0)
    warehouseCountWindow:SetLayoutRect(CommonSys:ArgsLayoutRect(232, 128, 312, 160))
    warehouseCountWindow:Open()
  end
  if optTbl.isDispRecycleCountWindow then
    recycleCountWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    recycleCountWindow:SetFontType(FontType.TYPE_12)
    recycleCountWindow:SetTextOffset(0, 0)
    recycleCountWindow:SetLayoutRect(Rectangle(240, 168, 64, 16))
    recycleCountWindow:Open()
  end
  local itemBagMenu = MENU:CreateItemBagMenu()
  local function updateSubWindowInfomationFunc()
    if bagCountWindow then
      local diffCount = optTbl.calcDiffBagCountFunc and optTbl.calcDiffBagCountFunc(itemBagMenu) or 0
      local nowCount = GROUND:GetBagItemCount()
      local maxCount = GROUND:GetBagItemMaxCount()
      if maxCount <= nowCount + diffCount then
        MENU:SetTag_Value(0, maxCount)
        MENU:SetTag_Value(1, maxCount)
        bagCountWindow:SetText(-534034656)
      elseif diffCount ~= 0 then
        MENU:SetTag_Value(0, nowCount + diffCount)
        MENU:SetTag_Value(1, maxCount)
        bagCountWindow:SetText(2066476600)
      else
        MENU:SetTag_Value(0, nowCount + diffCount)
        MENU:SetTag_Value(1, maxCount)
        bagCountWindow:SetText(-1807035551)
      end
    end
    if moneyWindow then
      local diffCount = optTbl.calcDiffMoneyFunc and optTbl.calcDiffMoneyFunc(itemBagMenu) or 0
      local nowCount = GROUND:GetPlayerMoney()
      local maxCount = GROUND:GetPlayerMoneyLimit()
      if diffCount ~= 0 then
        if bagCountWindow then
          bagCountWindow:SetLayoutPositionY(120)
        end
        moneyWindow:SetVisible(false)
        moneyAndSumWindow:SetVisible(true)
        dispFlag_moneyAndSumWindow = true
        MENU:SetTag_Value(0, nowCount)
        MENU:SetTag_Value(1, diffCount)
        if diffCount > 0 then
          moneyAndSumWindow:SetText(80222065)
        else
          moneyAndSumWindow:SetText(-1284342680)
        end
      else
        if bagCountWindow then
          bagCountWindow:SetLayoutPositionY(136)
        end
        moneyWindow:SetVisible(true)
        moneyAndSumWindow:SetVisible(false)
        dispFlag_moneyAndSumWindow = false
        MENU:SetTag_Value(0, nowCount)
        moneyWindow:SetText(-724016476)
      end
    end
    if ingotBoardMenu then
      local diffCount = optTbl.calcDiffIngotCountFunc and optTbl.calcDiffIngotCountFunc(itemBagMenu) or 0
      local nowCount = FUNC_COMMON:GetGoldIngot()
      local maxCount = FUNC_COMMON:GetGoldIngotMax()
      if diffCount ~= 0 then
        if bagCountWindow then
          bagCountWindow:SetLayoutPositionY(120)
        end
        ingotBoardMenu:SetVisible(false)
        ingotAndSumWindow:SetVisible(true)
        MENU:SetTag_Value(0, nowCount)
        MENU:SetTag_Value(1, diffCount)
        if diffCount > 0 then
          ingotAndSumWindow:SetText(-1086927850)
        else
          ingotAndSumWindow:SetText(-1999687254)
        end
      else
        if bagCountWindow then
          bagCountWindow:SetLayoutPositionY(136)
        end
        ingotBoardMenu:SetVisible(true)
        ingotAndSumWindow:SetVisible(false)
        MENU:SetTag_Value(0, nowCount + diffCount)
        ingotBoardMenu:SetText(-326824543)
      end
    end
    if warehouseCountWindow then
      local item = itemBagMenu.curItem.obj
      local index = item:GetIndex()
      local isChest = item:GetKind() == ITEM_KIND.KIND_CHEST
      local diffCount = optTbl.calcDiffWarehouseCountFunc and optTbl.calcDiffWarehouseCountFunc(itemBagMenu) or 0
      local nowCount = isChest and GROUND:GetChestWarehouseItemCount() or GROUND:GetItemWarehouseItemNowCount(index)
      local maxCount = isChest and GROUND:GetChestWarehouseItemMaxCount() or GROUND:GetItemWarehouseItemMaxCount(index)
      if maxCount <= nowCount + diffCount then
        MENU:SetTag_Value(0, maxCount)
        MENU:SetTag_Value(1, maxCount)
        warehouseCountWindow:SetText(1249105473)
      elseif diffCount ~= 0 then
        MENU:SetTag_Value(0, nowCount + diffCount)
        MENU:SetTag_Value(1, maxCount)
        warehouseCountWindow:SetText(-780959911)
      else
        MENU:SetTag_Value(0, nowCount)
        MENU:SetTag_Value(1, maxCount)
        warehouseCountWindow:SetText(-1244440918)
      end
    end
    if recycleCountWindow then
      local diffCount = optTbl.calcDiffBagCountFunc and optTbl.calcDiffBagCountFunc(itemBagMenu) or 0
      local nowCount = 0
      local maxCount = optTbl.numRecycleMax
      if maxCount <= nowCount + diffCount then
        MENU:SetTag_Value(0, maxCount)
        MENU:SetTag_Value(1, maxCount)
        recycleCountWindow:SetText(1593809454)
      else
        MENU:SetTag_Value(0, nowCount + diffCount)
        MENU:SetTag_Value(1, maxCount)
        recycleCountWindow:SetText(-1707366963)
      end
    end
  end
  itemBagMenu.SetVisible_org = itemBagMenu.SetVisible
  function itemBagMenu:SetVisible(flag)
    if bagCountWindow then
      bagCountWindow:SetVisible(flag)
    end
    if moneyWindow then
      moneyWindow:SetVisible(flag)
    end
    if moneyAndSumWindow then
      moneyAndSumWindow:SetVisible(flag)
    end
    if ingotBoardMenu then
      ingotBoardMenu:SetVisible(flag)
    end
    if ingotAndSumWindow then
      ingotAndSumWindow:SetVisible(flag)
    end
    if warehouseCountWindow then
      warehouseCountWindow:SetVisible(flag)
    end
    if recycleCountWindow then
      recycleCountWindow:SetVisible(flag)
    end
    if dispFlag_moneyAndSumWindow ~= nil and flag then
      moneyWindow:SetVisible(not dispFlag_moneyAndSumWindow)
      moneyAndSumWindow:SetVisible(dispFlag_moneyAndSumWindow)
    end
    self:SetVisible_org(flag)
  end
  itemBagMenu:SetTitle(optTbl.titleText)
  if optTbl.isMultiSelect then
    itemBagMenu:SetMultiSelectable(true)
  end
  if optTbl.enumItemFunc == nil then
    function optTbl.enumItemFunc()
      return GROUND:EnumerateBagItems()
    end
  end
  itemBagMenu:SetItemEnumFunc(optTbl.enumItemFunc, optTbl.itemFilterFunc)
  if optTbl.isDispPageNum then
    itemBagMenu:SetOption({onePageLayout = false})
  else
    local tbl = {}
    for item in optTbl.enumItemFunc() do
      table.insert(tbl, item)
    end
    if #tbl > 9 then
      itemBagMenu:SetOption({onePageLayout = false})
    else
      itemBagMenu:SetOption({onePageLayout = true})
    end
  end
  itemBagMenu:SetGenerateItemTextFunc(optTbl.itemTextFunc)
  if optTbl.itemLineHelpFunc == nil then
    function optTbl.itemLineHelpFunc(item)
      return item:GetItemOneLineExplainText()
    end
  end
  itemBagMenu:SetGenerateItemLineHelpTextFunc(optTbl.itemLineHelpFunc)
  if optTbl.itemHelpFunc == nil then
    function optTbl.itemHelpFunc(item)
      return item:GetItemExplainTextId()
    end
  end
  self.shopping_helpGenFunc = optTbl.itemHelpFunc
  if optTbl.itemEqualFunc == nil then
    function optTbl.itemEqualFunc(obj1, obj2)
      return obj1:IsEqualInstance(obj2)
    end
  end
  itemBagMenu:SetCheckSelectWarnColorItemFunc(optTbl.checkSelectWarnColorItemFunc)
  if optTbl.extentMultiSelectPre then
    itemBagMenu:SetCheckMultiSelectOkItemFunc(function(bagMenu, item)
      local work = {}
      local isOk = false
      optTbl.extentMultiSelectPre(bagMenu, work)
      isOk = optTbl.extentMultiSelectCheck(bagMenu, work, item, false)
      optTbl.extentMultiSelectAddAfter(bagMenu, work, item)
      optTbl.extentMultiSelectPost(bagMenu, work)
      return isOk
    end)
  else
    itemBagMenu:SetCheckMultiSelectOkItemFunc(optTbl.checkMultiSelectOkItemFunc)
  end
  local shopSysSelf = self
  local baseOpenedAction = itemBagMenu.openedAction
  function itemBagMenu:openedAction()
    if shopSysSelf.shopping_selectGoodsTbl and #shopSysSelf.shopping_selectGoodsTbl > 1 then
      local function checkAddFunc(work, obj)
        for i, item in ipairs(shopSysSelf.shopping_selectGoodsTbl) do
          if optTbl.itemEqualFunc(item, obj) then
            return true
          end
        end
        return false
      end
      itemBagMenu:AllMultiSelectFromLua({}, function()
      end, checkAddFunc, function()
      end, function()
      end)
    end
    if shopSysSelf.shopping_lastCursorIdx then
      self:SetCursorItemIndex(shopSysSelf.shopping_lastCursorIdx)
      shopSysSelf.shopping_lastCursorIdx = nil
    end
    if optTbl.updateItemInfoFunc then
      optTbl.updateItemInfoFunc(self, self.curItem.obj)
    end
    if baseOpenedAction then
      baseOpenedAction(self)
    end
    updateSubWindowInfomationFunc()
  end
  local baseClosedAction = itemBagMenu.closedAction
  function itemBagMenu:closedAction()
    shopSysSelf.shopping_lastCursorIdx = self:GetCursorItemIndex()
    if baseClosedAction then
      baseClosedAction(self)
    end
    if bagCountWindow then
      bagCountWindow:Close()
    end
    if moneyWindow then
      moneyWindow:Close()
    end
    if moneyAndSumWindow then
      moneyAndSumWindow:Close()
    end
    if ingotBoardMenu then
      ingotBoardMenu:Close()
    end
    if ingotAndSumWindow then
      ingotAndSumWindow:Close()
    end
    if warehouseCountWindow then
      warehouseCountWindow:Close()
    end
    if recycleCountWindow then
      recycleCountWindow:Close()
    end
    if optTbl.closedAct then
      optTbl.closedAct()
    end
  end
  function itemBagMenu:cancelAction()
    if optTbl.cancelAct then
      optTbl.cancelAct()
      self:CloseAndClearFocus()
    end
  end
  if optTbl.isAllSelectEnable then
    function itemBagMenu:changeAllSelectAction()
      local isAddSelect = false
      local isNoSelectSe = false
      local function preLoopFunc(work)
        optTbl.extentMultiSelectPre(itemBagMenu, work)
      end
      local function checkAddFunc(work, item)
        local bOk = optTbl.extentMultiSelectCheck(itemBagMenu, work, item, true)
        if bOk == false then
          isNoSelectSe = true
        end
        return bOk
      end
      local function addAfterFunc(work, item)
        isAddSelect = true
        optTbl.extentMultiSelectAddAfter(itemBagMenu, work, item)
      end
      local function postLoopFunc(work)
        optTbl.extentMultiSelectPost(itemBagMenu, work, item)
      end
      local work = {}
      itemBagMenu:AllMultiSelectFromLua(work, preLoopFunc, checkAddFunc, addAfterFunc, postLoopFunc)
      if itemBagMenu:IsMultiSelect() then
        if isAddSelect == false then
          SOUND:PlaySe(SymSnd("SE_SYS_MARK"))
          self:ResetSelecting()
        elseif isNoSelectSe then
          SOUND:PlaySe(SymSnd("SE_SYS_NO_SELECT"))
        else
          SOUND:PlaySe(SymSnd("SE_SYS_MARK"))
        end
      else
        SOUND:PlaySe(SymSnd("SE_SYS_NO_SELECT"))
      end
    end
  end
  local actionsTbl = {}
  for i, commandItem in ipairs(optTbl.commandItems) do
    do
      local actItem = {
        text = commandItem.text,
        disableFilters = {},
        grayoutFilters = {},
        optionTbl = {
          action = function(bagMenu)
            local selectedObjs = {}
            for obj in bagMenu:EnumerateSelectedItems() do
              table.insert(selectedObjs, obj)
            end
            ShopSys:SetSelectGoodsTbl(selectedObjs)
            return commandItem.action(bagMenu)
          end
        }
      }
      if commandItem.isSingleOnly then
        table.insert(actItem.disableFilters, DisActFlt_multiSelect)
      end
      if commandItem.isCloseShopMenu then
        actItem.optionTbl.bagCloseFlg = true
      end
      if commandItem.disableFilter then
        table.insert(actItem.disableFilters, function(menu, item)
          return commandItem.disableFilter(itemBagMenu, item)
        end)
      end
      if commandItem.grayoutFilter then
        table.insert(actItem.grayoutFilters, function(menu, item)
          return commandItem.grayoutFilter(itemBagMenu, item)
        end)
      end
      table.insert(actionsTbl, actItem)
    end
  end
  itemBagMenu:SetActions(actionsTbl)
  local baseCurrentItemChange = itemBagMenu.currentItemChange
  function itemBagMenu:currentItemChange()
    if baseCurrentItemChange then
      baseCurrentItemChange(self)
    end
    if optTbl.updateItemInfoFunc then
      optTbl.updateItemInfoFunc(self, self.curItem.obj)
    end
    updateSubWindowInfomationFunc()
  end
  function itemBagMenu:updateItemListAction()
    updateSubWindowInfomationFunc()
  end
  function itemBagMenu:multiSelectedAction()
    updateSubWindowInfomationFunc()
  end
  itemBagMenu:SetPadHelp(optTbl.padHelpMainText, optTbl.padHelpSubText)
  if optTbl.modifyBagMenuFunc then
    optTbl.modifyBagMenuFunc(itemBagMenu)
  end
  if optTbl.isSortButtonEnable then
    itemBagMenu:SetOption({sortButtonEnable = true})
  end
  function itemBagMenu:SetEffect(effType, optTbl)
    if effType == "shake_warehouseCount" or effType == "shake_bagCount" or effType == "shake_recycleCount" or effType == "shake_money" or effType == "shake_ingot" then
      local shakeWindowTbl
      if effType == "shake_warehouseCount" then
        shakeWindowTbl = {warehouseCountWindow}
      elseif effType == "shake_bagCount" then
        shakeWindowTbl = {bagCountWindow}
      elseif effType == "shake_recycleCount" then
        shakeWindowTbl = {recycleCountWindow}
      elseif effType == "shake_money" then
        shakeWindowTbl = {moneyWindow, moneyAndSumWindow}
      elseif effType == "shake_ingot" then
        shakeWindowTbl = {ingotBoardMenu, ingotAndSumWindow}
      end
      for i, shakeWindow in ipairs(shakeWindowTbl) do
        if shakeWindow:IsExistAnimeTask("shake") == false then
          local shakeAnime = function(self)
            local shakeTbl = {
              2,
              -2,
              2,
              -2
            }
            for time = 1, #shakeTbl do
              self:SetAnimeOffsPosY(shakeTbl[time])
              coroutine.yield()
            end
            self:SetAnimeOffsPosY(0)
          end
          shakeWindow:AddAnimeTask("shake", shakeAnime)
        end
      end
    end
  end
  itemBagMenu:Open()
  if optTbl.openTutorialFunc then
    optTbl.openTutorialFunc()
  end
  MENU:SetFocus(itemBagMenu)
  MENU:WaitClose(itemBagMenu)
  CommonSys:CloseBasicMenu()
end
function ShopSys:DispBasicShopGoodsMenu(optTbl)
  if optTbl.isDispBagCountAndMoneyWindow == nil then
    optTbl.isDispBagCountAndMoneyWindow = true
  end
  optTbl.enumItemFunc = optTbl.enumGoodsFunc
  optTbl.itemTextFunc = optTbl.goodsTextFunc
  optTbl.itemLineHelpFunc = optTbl.goodsLineHelpFunc
  ShopSys:DispBasicItemBagMenu(optTbl)
end
function ShopSys:DispInputMenu(optTbl)
  local numMenu = MENU:CreateNumericMenuWindow(ScreenType.B)
  local width = 108
  numMenu:SetLayoutRect(Rectangle(106, 88, width, 68))
  numMenu:SetTextOffset(30, 34)
  numMenu:SetPlace(optTbl.digitNum)
  numMenu:SetDigit(optTbl.digitNum)
  if optTbl.type then
    numMenu:SetType(optTbl.type)
  else
    numMenu:SetType(NUM_MENU_TYPE.TYPE_DIGIT_ON)
  end
  if optTbl.titleText then
    numMenu:SetTagTextOffset(0, 0)
    local text = MENU:ReplaceTagText(optTbl.titleText)
    local textW = MENU:GetTextWidth(optTbl.titleText)
    if optTbl.isTitleUnderLine then
      numMenu:SetTagLineVisible(true)
      numMenu:SetTagLine(0, 17, 108)
    else
      numMenu:SetTagLineVisible(false)
    end
    numMenu:SetTagText(text)
  end
  if optTbl.startNum then
    numMenu:SetStartNum(optTbl.startNum)
  end
  if optTbl.minNum then
    numMenu:SetMinNum(optTbl.minNum)
  end
  if optTbl.maxNum then
    numMenu:SetMaxNum(optTbl.maxNum)
  end
  local fontW = 16
  local windowW = width
  if optTbl.titleText then
    numMenu:SetTextOffset((windowW - optTbl.digitNum * fontW) / 2, 34)
  else
    numMenu:SetTextOffset((windowW - optTbl.digitNum * fontW) / 2, 25)
  end
  function numMenu:decideAction()
    local num = self:GetSettingData()
    ShopSys:SelectNumber(num)
    if optTbl.decideAction then
      optTbl.decideAction(num)
    end
    self:Close()
  end
  function numMenu:cancelAction()
    if optTbl.cancelAction then
      optTbl.cancelAction()
    end
    self:Close()
  end
  function numMenu:changeAction()
    local num = self:GetSettingData()
    if optTbl.changeAction then
      optTbl.changeAction(num)
    end
  end
  numMenu:Open()
  MENU:SetFocus(numMenu)
  MENU:WaitClose(numMenu)
end
function ShopSys:DispMoneyWindowOpen()
  local nowCount = GROUND:GetPlayerMoney()
  ShopSys.BillMoneyWindow = MENU:CreateBoardMenuWindow(ScreenType.A)
  ShopSys.BillMoneyWindow:SetFontType(FontType.TYPE_12)
  ShopSys.BillMoneyWindow:SetTextOffset(0, 0)
  ShopSys.BillMoneyWindow:SetLayoutRect(Rectangle(16, 16, 64, 16))
  ShopSys.BillMoneyWindow:Open()
  MENU:SetTag_Value(0, nowCount)
  ShopSys.BillMoneyWindow:SetText(-724016476)
end
function ShopSys:DispMoneyWindowUpdate()
  local nowCount = GROUND:GetPlayerMoney()
  MENU:SetTag_Value(0, nowCount)
  ShopSys.BillMoneyWindow:SetText(-724016476)
end
function ShopSys:DispMoneyWindowClose()
  if ShopSys.BillMoneyWindow then
    ShopSys.BillMoneyWindow:Close()
    ShopSys.BillMoneyWindow = nil
  end
end
function ShopSys:DispShopItemExpMenu(optTbl)
  ShopSys:assertSelectGoods()
  if optTbl == nil then
    optTbl = {}
  end
  if optTbl.helpGenFunc == nil then
    optTbl.helpGenFunc = self.shopping_helpGenFunc
  end
  if optTbl.helpGenFunc == nil then
    assert(nil, "ShopSys:DispShopItemExpMenu \227\131\152\227\131\171\227\131\151\231\148\159\230\136\144\233\150\162\230\149\176\227\129\140\230\156\170\231\153\187\233\140\178\227\129\167\227\129\153")
  end
  local textId = optTbl.helpGenFunc(self.shopping_selectGoodsTbl[1])
  local expreinMenu = CommonSys:OpenBasicExplainMenu(textId, optTbl)
  MENU:SetFocus(expreinMenu)
  MENU:WaitClose(expreinMenu)
end
function ShopSys:DispPokemonStatusMenu(optTbl)
  ShopSys:assertSelectPokemonWarehouseId()
  CallFlow_PokemonWarehouseStatusMenu(self.shopping_selectPokemonWarehouseId)
end
function ShopSys:OpenUpperMaterialMenu(optTbl)
  local infoTitle = MENU:CreateBoardMenuWindow(ScreenType.A)
  infoTitle:SetOption({showBgFrame = false})
  infoTitle:SetFontType(FontType.TYPE_TALK_16)
  infoTitle:SetTextOffset(0, 0)
  infoTitle:SetLayoutRect(Rectangle(0, 0, 400, 240))
  local infoListTitle = MENU:CreateBoardMenuWindow(ScreenType.A)
  infoListTitle:SetOption({showBgFrame = false})
  infoListTitle:SetFontType(FontType.TYPE_12)
  infoListTitle:SetTextOffset(0, 0)
  infoListTitle:SetLayoutRect(Rectangle(0, 0, 400, 240))
  local infoList = MENU:CreateBoardMenuWindow(ScreenType.A)
  infoList:SetOption({showBgFrame = false})
  infoList:SetFontType(FontType.TYPE_12)
  infoList:SetTextOffset(0, 0)
  infoList:SetLayoutRect(Rectangle(0, 0, 400, 240))
  local infoMoney = MENU:CreateBoardMenuWindow(ScreenType.A)
  infoMoney:SetOption({showBgFrame = false})
  infoMoney:SetFontType(FontType.TYPE_12)
  infoMoney:SetTextOffset(0, 0)
  infoMoney:SetLayoutRect(Rectangle(0, 0, 400, 240))
  local infoText = MENU:CreateBoardMenuWindow(ScreenType.A)
  infoText:SetOption({showBgFrame = false})
  infoText:SetFontType(FontType.TYPE_16)
  infoText:SetTextOffset(0, 0)
  infoText:SetLayoutRect(Rectangle(48, 68, 296, 96))
  local arrowInfoMenu = MENU:CreateArrowBoardMenuWindow(ScreenType.A)
  arrowInfoMenu:SetOption({showBgFrame = false})
  arrowInfoMenu:SetLayoutRect(Rectangle(0, 0, 400, 240))
  arrowInfoMenu:SetTextOffset(0, 0)
  arrowInfoMenu:SetFontType(FontType.TYPE_16)
  arrowInfoMenu:SetText("[VO:200][HO:24][M:B08][HO:360][M:B07]")
  arrowInfoMenu:Open()
  arrowInfoMenu:ShowLeftArrow(true)
  arrowInfoMenu:ShowRightArrow(true)
  arrowInfoMenu:SetLeftArrowPos(8, 200)
  arrowInfoMenu:SetRightArrowPos(376, 200)
  if optTbl.explainTextTbl == nil then
    arrowInfoMenu:SetVisible(false)
  end
  local lastPageIdx = 0
  local function updateUpperInfo(selectionType, pageIdx)
    if type(optTbl.titleTextTbl[selectionType]) == "number" then
      infoTitle:SetText("[VO:24][HO:32][CS:8]" .. MENU:GetTextPoolText(optTbl.titleTextTbl[selectionType]))
    else
      infoTitle:SetText("[VO:24][HO:32][CS:8]" .. optTbl.titleTextTbl[selectionType])
    end
    local headText = MENU:GetTextPoolText(SHOP_COMMON__MATERIA_MENU_HEADER)
    local listOkTextTbl = {
      SHOP_COMMON__MATERIA_MENU_LIST_OK_00,
      SHOP_COMMON__MATERIA_MENU_LIST_OK_01,
      SHOP_COMMON__MATERIA_MENU_LIST_OK_02,
      SHOP_COMMON__MATERIA_MENU_LIST_OK_03,
      SHOP_COMMON__MATERIA_MENU_LIST_OK_04,
      SHOP_COMMON__MATERIA_MENU_LIST_OK_05
    }
    local listBelowTextTbl = {
      SHOP_COMMON__MATERIA_MENU_LIST_BELOW_00,
      SHOP_COMMON__MATERIA_MENU_LIST_BELOW_01,
      SHOP_COMMON__MATERIA_MENU_LIST_BELOW_02,
      SHOP_COMMON__MATERIA_MENU_LIST_BELOW_03,
      SHOP_COMMON__MATERIA_MENU_LIST_BELOW_04,
      SHOP_COMMON__MATERIA_MENU_LIST_BELOW_05
    }
    local listNonTextTbl = {
      "",
      "",
      "",
      "",
      "",
      ""
    }
    local listText = ""
    local nowCount = 0
    for info in optTbl.enumMaterialFunc(selectionType) do
      MENU:SetTag_ItemIndexNoCount(0, info.itemIndex)
      MENU:SetTag_Value(0, info.neecCount)
      MENU:SetTag_Value(1, info.hasCount)
      if info.neecCount <= info.hasCount then
        listText = listText .. MENU:ReplaceTagText(listOkTextTbl[nowCount + 1])
      else
        listText = listText .. MENU:ReplaceTagText(listBelowTextTbl[nowCount + 1])
      end
      nowCount = nowCount + 1
    end
    for idx = nowCount + 1, #listNonTextTbl do
      listText = listText .. MENU:ReplaceTagText(listNonTextTbl[idx])
    end
    infoListTitle:SetText(headText)
    infoList:SetText(listText)
    local needMoney = optTbl.getPriceFunc and optTbl.getPriceFunc(selectionType) or 0
    if needMoney >= 0 then
      local myMoney = GROUND:GetPlayerMoney()
      if needMoney <= myMoney then
        MENU:SetTag_MyMoney(0, needMoney)
        MENU:SetTag_MyMoney(1, myMoney)
        if optTbl.isGiftPrice then
          infoMoney:SetText(SHOP_COMMON__MATERIA_MENU_MONEY_OK_FOR_GIFT)
        else
          infoMoney:SetText(SHOP_COMMON__MATERIA_MENU_MONEY_OK_FOR_BUILD)
        end
      else
        MENU:SetTag_MyMoney(0, needMoney)
        MENU:SetTag_MyMoneyMuji(1, myMoney)
        if optTbl.isGiftPrice then
          infoMoney:SetText(SHOP_COMMON__MATERIA_MENU_MONEY_BELOW_FOR_GIFT)
        else
          infoMoney:SetText(SHOP_COMMON__MATERIA_MENU_MONEY_BELOW_FOR_BUILD)
        end
      end
    else
      infoMoney:SetText("")
    end
    if optTbl.explainTextTbl then
      if optTbl.explainTextTbl[selectionType] then
        infoText:SetText("[CS:8]" .. MENU:GetTextPoolText(optTbl.explainTextTbl[selectionType]))
      else
        infoText:SetText("-")
      end
    end
    if optTbl.spritePtnSetName or optTbl.spriteAutoLoadTbl then
      local spritPtnSetName = optTbl.spritePtnSetName
      local spritPtnName = optTbl.spritePtnTbl[selectionType]
      if pageIdx == 0 then
        SPRT("upperBg"):SetPattern({
          setName = "upperBgSet",
          ptnName = "bg1",
          ofsX = 0,
          ofsY = 0,
          ofsPrio = 0
        })
      else
        SPRT("upperBg"):SetPattern({
          setName = "upperBgSet",
          ptnName = "bg2",
          ofsX = 0,
          ofsY = 0,
          ofsPrio = 0
        })
      end
      if optTbl.spriteAutoLoadTbl then
        local ptnOne = optTbl.spriteAutoLoadTbl[optTbl.spritePtnTbl[selectionType]]
        ptnOne.name = "autoLoadPtn"
        SPRITE:CreatePatternSet("autoLoadNoticeSet", ptnOne)
        spritPtnSetName = "autoLoadNoticeSet"
        spritPtnName = "autoLoadPtn"
      end
      if optTbl.spriteBgPtn then
        SPRT("upperNotice"):SetPattern({
          setName = spritPtnSetName,
          ptnName = spritPtnName,
          ofsX = 0,
          ofsY = 0,
          ofsPrio = 0,
          ofsParallax = -0.2,
          blendType = ALPHA_BLEND.LINEAR
        }, {
          setName = optTbl.spritePtnSetName,
          ptnName = optTbl.spriteBgPtn,
          ofsX = 0,
          ofsY = 0,
          ofsPrio = 1,
          ofsParallax = 0.5
        })
      else
        SPRT("upperNotice"):SetPattern({
          setName = spritPtnSetName,
          ptnName = spritPtnName,
          ofsX = 0,
          ofsY = 0,
          ofsPrio = 0,
          ofsParallax = 0.5
        })
      end
    end
    if pageIdx == 0 then
      infoTitle:SetVisible(true)
      infoListTitle:SetVisible(true)
      infoList:SetVisible(true)
      infoMoney:SetVisible(true)
      infoText:SetVisible(false)
    elseif pageIdx == 1 then
      infoTitle:SetVisible(true)
      infoListTitle:SetVisible(false)
      infoList:SetVisible(false)
      infoMoney:SetVisible(false)
      infoText:SetVisible(true)
    end
    if infoTitle:IsExistAnimeTask("slide") == false then
      local slideAnime = function(self)
        local shakeTbl = {
          -40,
          -35,
          -30,
          -25,
          -20,
          -15,
          -10,
          -5,
          -4,
          -3,
          -2,
          -1
        }
        for time = 1, #shakeTbl do
          self:SetAnimeOffsPosX(shakeTbl[time])
          coroutine.yield()
        end
        self:SetAnimeOffsPosX(0)
      end
      infoTitle:AddAnimeTask("slide", slideAnime)
    end
    local alphaAnime = function(self)
      local alphaTbl = {
        1,
        15,
        30,
        45,
        60,
        75,
        90
      }
      for time = 1, #alphaTbl do
        self:SetTextAlpha(math.sin(alphaTbl[time] / 180 * math.pi) * 255)
        coroutine.yield()
      end
      self:SetTextAlpha(255)
    end
    if infoList:IsExistAnimeTask("alpha") == false then
      infoList:AddAnimeTask("alpha", alphaAnime)
    end
    if infoText:IsExistAnimeTask("alpha") == false then
      infoText:AddAnimeTask("alpha", alphaAnime)
    end
    lastPageIdx = pageIdx
  end
  SPRITE:CreatePatternSet("upperBgSet", {
    name = "bg1",
    img = "WALLPAPER_MAIN_NOTICE01",
    u = 0,
    v = 0,
    w = 512,
    h = 240,
    cx = 256,
    cy = 120,
    allocateFromMap = true
  }, {
    name = "bg2",
    img = "WALLPAPER_MAIN_NOTICE02",
    u = 0,
    v = 0,
    w = 512,
    h = 240,
    cx = 256,
    cy = 120,
    allocateFromMap = true
  })
  SPRITE:CreateSprite("upperBg")
  SPRT("upperBg"):SetPattern({
    setName = "upperBgSet",
    ptnName = "bg1",
    ofsX = 0,
    ofsY = 0,
    ofsPrio = 0
  })
  SPRT("upperBg"):SetOption({
    pos = Vector2(200, 120),
    visible = false,
    prio = 600
  })
  if optTbl.spritePtnSetName or optTbl.spriteAutoLoadTbl then
    SPRITE:CreateSprite("upperNotice")
    SPRT("upperNotice"):SetOption({
      visible = false,
      prio = 550,
      blendType = ALPHA_BLEND.MUL
    })
    SPRT("upperNotice"):SetPosition(Vector2(128, 112))
  end
  infoTitle:Open()
  infoListTitle:Open()
  infoList:Open()
  infoMoney:Open()
  infoText:Open()
  SPRT("upperBg"):SetVisible(true)
  if optTbl.spritePtnSetName or optTbl.spriteAutoLoadTbl then
    SPRT("upperNotice"):SetVisible(true)
  end
  local upperMaterialMenu = {}
  upperMaterialMenu.switchIdx = 0
  upperMaterialMenu.lastSelectionType = nil
  function upperMaterialMenu:UpdateInfo(selectionType)
    self.lastSelectionType = selectionType
    updateUpperInfo(selectionType, self.switchIdx)
  end
  function upperMaterialMenu:SwitchInfo(mov)
    if optTbl.explainTextTbl == nil then
      return
    end
    self.switchIdx = self.switchIdx == 0 and 1 or 0
    updateUpperInfo(self.lastSelectionType, self.switchIdx)
    if mov < 0 then
      SOUND:PlaySe(SymSnd("SE_SYS_MARK"))
      arrowInfoMenu:PushLeftArrow()
    end
    if mov > 0 then
      SOUND:PlaySe(SymSnd("SE_SYS_MARK"))
      arrowInfoMenu:PushRightArrow()
    end
  end
  function upperMaterialMenu:Close()
    infoTitle:Close()
    infoListTitle:Close()
    infoList:Close()
    infoMoney:Close()
    infoText:Close()
    arrowInfoMenu:Close()
    SPRITE:DestroySprite("upperBg")
    SPRITE:DestroySprite("upperNotice")
    SPRITE:DestroyPatternSet("upperBgSet")
    SPRITE:DestroyPatternSet("autoLoadNoticeSet")
  end
  return upperMaterialMenu
end
function ShopSys:DispMeroettaMaterialMenu(padHelpText, selectedAction, cancelAction)
  local nowShopId = "shop_jukebox"
  local nextShopLevel = 0
  MENU:LoadMenuTextPool("message/shop.bin", false)
  local openState = GROUND:GetOpenLimitState_LandShopLabel(nowShopId)
  if openState == PARADISE_OPEN_LIMIT_STATE.CLOSE then
    GROUND:SetOpenLimitState_LandShopLabel(nowShopId, PARADISE_OPEN_LIMIT_STATE.OPEN_NEW)
  end
  FlowSys:Start()
  ShopSys:Start()
  local spriteAutoLoadTbl = {
    notice_PARA_SHOP_MUSIC = {
      img = "NOTICE_INST10",
      u = 0,
      v = 0,
      w = 256,
      h = 192,
      cx = 128,
      cy = 96,
      allocateFromMap = true
    }
  }
  local titleTextTbl = {}
  local spritePtnTbl = {}
  local explainTextTbl = {}
  titleTextTbl[nowShopId] = GROUND:GetLandShopNameTextId(nowShopId)
  spritePtnTbl[nowShopId] = "notice_" .. GROUND:GetLandShopGraphicLabel(nowShopId, nextShopLevel)
  explainTextTbl[nowShopId] = GROUND:GetLandShopExplainTextId(nowShopId, nextShopLevel)
  local upperMaterialMenu = ShopSys:OpenUpperMaterialMenu({
    enumMaterialFunc = function(landShopId)
      return coroutine.wrap(function()
        for idx = 1, GROUND:GetDevelopLandShopMaterialCount(landShopId, nextShopLevel) do
          coroutine.yield({
            itemIndex = GROUND:GetDevelopLandShopMaterialItemIndex(landShopId, nextShopLevel, idx - 1),
            neecCount = GROUND:GetDevelopLandShopMaterialNeedCount(landShopId, nextShopLevel, idx - 1),
            hasCount = GROUND:GetDevelopLandShopMaterialHasCount(landShopId, nextShopLevel, idx - 1)
          })
        end
      end)
    end,
    getPriceFunc = function(landShopId)
      return GROUND:GetDevelopLandShopPrice(landShopId, nextShopLevel)
    end,
    spritePtnSetName = nil,
    titleTextTbl = titleTextTbl,
    spritePtnTbl = spritePtnTbl,
    explainTextTbl = explainTextTbl,
    spriteAutoLoadTbl = spriteAutoLoadTbl
  })
  local dummyBoardMenu = MENU:CreateBoardMenuWindow(ScreenType.B)
  dummyBoardMenu:SetLayoutRect(Rectangle(-10, -10, 1, 1))
  local padHelpInfoMenu
  function dummyBoardMenu:openedAction()
    self:SetVisible(false)
    upperMaterialMenu:UpdateInfo(nowShopId)
    padHelpInfoMenu = CommonSys:OpenPadHelpInfoMenuWindow(padHelpText)
  end
  function dummyBoardMenu:decideAction()
    self:Close()
  end
  function dummyBoardMenu:inputLSelectAction()
    upperMaterialMenu:SwitchInfo(-1)
  end
  function dummyBoardMenu:inputRSelectAction()
    upperMaterialMenu:SwitchInfo(1)
  end
  function dummyBoardMenu:cancelAction()
  end
  function dummyBoardMenu:closedAction()
    upperMaterialMenu:Close()
    padHelpInfoMenu:Close()
  end
  CommonSys:OpenAndCloseWait(dummyBoardMenu)
  FlowSys:Finish()
  ShopSys:Finish()
end
function ShopSys:SelectWazaId(wazaId)
  ShopSys.shopping_selectWazaId = wazaId
end
function ShopSys:GetForgetWAZAName()
  return GROUND:NameShopWazaNameID(ShopSys.shopping_selectWazaId)
end
function ShopSys:SelectForgetWazaId(wazaId)
  ShopSys.shopping_selectForgetWazaId = wazaId
end
function ShopSys:SelectExplainWazaId(wazaId)
  if wazaID == nil then
    wazaID = 1
  end
  ShopSys.shopping_selectExplainWazaId = wazaId
end
function ShopSys:GetForgetWAZAName()
  return GROUND:NameShopWazaNameID(ShopSys.shopping_selectForgetWazaId)
end
function ShopSys:GetRememberWAZAName()
  return GROUND:NameShopWazaNameID(ShopSys.shopping_selectWazaId)
end

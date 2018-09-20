gTopMenuParameter = {}
function _CreateInfomation()
  gTopMenuParameter.aPlacedTbl_2 = {
    [0] = {
      pos = {x = 62, y = 56},
      link = {
        l = 1,
        r = 1,
        u = 0,
        d = 0
      }
    },
    [1] = {
      pos = {x = 168, y = 56},
      link = {
        l = 0,
        r = 0,
        u = 1,
        d = 1
      }
    }
  }
  gTopMenuParameter.aPlacedTbl_3 = {
    [0] = {
      pos = {x = 9, y = 56},
      link = {
        l = 2,
        r = 1,
        u = 0,
        d = 0
      }
    },
    [1] = {
      pos = {x = 115, y = 56},
      link = {
        l = 0,
        r = 2,
        u = 1,
        d = 1
      }
    },
    [2] = {
      pos = {x = 221, y = 56},
      link = {
        l = 1,
        r = 0,
        u = 2,
        d = 2
      }
    }
  }
  gTopMenuParameter.aPlacedTbl_2x2 = {
    [0] = {
      pos = {x = 62, y = 8},
      link = {
        l = 1,
        r = 1,
        u = 2,
        d = 2
      }
    },
    [1] = {
      pos = {x = 168, y = 8},
      link = {
        l = 0,
        r = 0,
        u = 3,
        d = 3
      }
    },
    [2] = {
      pos = {x = 62, y = 104},
      link = {
        l = 3,
        r = 3,
        u = 0,
        d = 0
      }
    },
    [3] = {
      pos = {x = 168, y = 104},
      link = {
        l = 2,
        r = 2,
        u = 1,
        d = 1
      }
    }
  }
  gTopMenuParameter.aPlacedTbl_3x2 = {
    [0] = {
      pos = {x = 9, y = 8},
      link = {
        l = 2,
        r = 1,
        u = 3,
        d = 3
      }
    },
    [1] = {
      pos = {x = 115, y = 8},
      link = {
        l = 0,
        r = 2,
        u = 4,
        d = 4
      }
    },
    [2] = {
      pos = {x = 221, y = 8},
      link = {
        l = 1,
        r = 0,
        u = 5,
        d = 5
      }
    },
    [3] = {
      pos = {x = 9, y = 104},
      link = {
        l = 5,
        r = 4,
        u = 0,
        d = 0
      }
    },
    [4] = {
      pos = {x = 115, y = 104},
      link = {
        l = 3,
        r = 5,
        u = 1,
        d = 1
      }
    },
    [5] = {
      pos = {x = 221, y = 104},
      link = {
        l = 4,
        r = 3,
        u = 2,
        d = 2
      }
    }
  }
  gTopMenuParameter.bEnd = false
  gTopMenuParameter.bCursorAddContents = SYSTEM:IsAddContentsMode() or SYSTEM:IsPrevAddContentsMode()
  gTopMenuParameter.bCursorAr = SYSTEM:IsPrevArMode()
  gTopMenuParameter.bIsCheckBusy = false
  gTopMenuParameter.bIsTaskPause = false
  gTopMenuParameter.bWakeup = false
  gTopMenuParameter.eRevivalBoxResult = CheckRescueType.OTHER
  gTopMenuParameter.bSurechigaiNoneMessage = false
  gTopMenuParameter.bDLCCheck = false
  gTopMenuParameter.bIsDecideProcess = false
  gTopMenuParameter.iconX = 0
  gTopMenuParameter.iconY = 0
  gTopMenuParameter.iconCount = 0
  gTopMenuParameter.iconLinkL = 0
  gTopMenuParameter.iconLinkR = 0
  gTopMenuParameter.iconLinkU = 0
  gTopMenuParameter.iconLinkD = 0
  gTopMenuParameter.iconLinkD = 0
  gTopMenuParameter.tempTopCursorId = 0
  gTopMenuParameter.tempEtcCursorId = 0
  gTopMenuParameter.nSurechigaiCheckCount = 0
  gTopMenuParameter.aParam = {}
  function gTopMenuParameter:StepFunc(_buttonMenu, _text, _tx, _ty, _pattern, _obj, _obj2)
    if self.iconCount == 6 then
      return
    end
    local param = {
      text = _text,
      tx = _tx,
      ty = _ty,
      pattern = _pattern,
      obj = _obj,
      obj2 = _obj2
    }
    self.aParam[self.iconCount] = param
    if self.tempTopCursorId == self.iconCount then
      CommonSys:UpdateBasicMenu_LineHelp(_obj.explanationText)
    end
    self.iconCount = self.iconCount + 1
  end
  function gTopMenuParameter:BeginStepFunc()
    self.aParam = {}
    self.iconCount = 0
  end
  function gTopMenuParameter:EndStepFunc(_buttonMenu)
    if self.iconCount <= 1 then
      local p = self.aParam[0]
      _buttonMenu:AddFixedPatternItem(p.text, p.tx, p.ty, p.pattern, 115, 56, p.obj, nil)
      _buttonMenu:SetItemLink4(0, 0, 0, 0, 0)
    elseif self.iconCount <= 2 then
      for i = 0, self.iconCount - 1 do
        local p = self.aParam[i]
        local a = self.aPlacedTbl_2[i]
        _buttonMenu:AddFixedPatternItem(p.text, p.tx, p.ty, p.pattern, a.pos.x, a.pos.y, p.obj, nil)
        _buttonMenu:SetItemLink4(i, a.link.l, a.link.r, a.link.u, a.link.d)
      end
    elseif self.iconCount <= 3 then
      for i = 0, self.iconCount - 1 do
        local p = self.aParam[i]
        local a = self.aPlacedTbl_3[i]
        _buttonMenu:AddFixedPatternItem(p.text, p.tx, p.ty, p.pattern, a.pos.x, a.pos.y, p.obj, nil)
        _buttonMenu:SetItemLink4(i, a.link.l, a.link.r, a.link.u, a.link.d)
      end
    elseif self.iconCount <= 4 then
      for i = 0, self.iconCount - 1 do
        local p = self.aParam[i]
        local a = self.aPlacedTbl_2x2[i]
        _buttonMenu:AddFixedPatternItem(p.text, p.tx, p.ty, p.pattern, a.pos.x, a.pos.y, p.obj, nil)
        _buttonMenu:SetItemLink4(i, a.link.l, a.link.r, a.link.u, a.link.d)
      end
    else
      for i = 0, self.iconCount - 1 do
        local p = self.aParam[i]
        local a = self.aPlacedTbl_3x2[i]
        _buttonMenu:AddFixedPatternItem(p.text, p.tx, p.ty, p.pattern, a.pos.x, a.pos.y, p.obj, nil)
        _buttonMenu:SetItemLink4(i, a.link.l, a.link.r, a.link.u, a.link.d)
      end
    end
    self.aParam = {}
    self.iconCount = 0
  end
  gTopMenuParameter.mode = "top"
end
function _OpenTitleInfoMenuWindowA(text)
  local info = MENU:CreateInfomationMenuWindow(ScreenType.A)
  local centerY = 16
  local sizeH = 40
  info:SetPositionY(centerY - sizeH / 2)
  info:SetSizeH(sizeH)
  info:SetTextOffset(16, (sizeH - 16) / 2)
  info:SetFontType(FontType.TYPE_12)
  if text ~= nil then
    info:SetText(text)
  end
  info:Open()
  return info
end
function _DeleteInfomation()
end
function _ResetParameter()
  _DeleteInfomation()
  gTopMenuParameter = {}
end
function TopMenu_Main()
  MENU:LoadMenuTextPool("message/top.bin")
  _CreateInfomation()
  local funcSurechigai = function()
    gTopMenuParameter.nSurechigaiCheckCount = 300
    while true do
      if gTopMenuParameter.bIsTaskPause == false then
        gTopMenuParameter.bIsCheckBusy = true
        if SYSTEM:GetSaveStatus() == SAVE_STATUS.RESCUE and gTopMenuParameter.nSurechigaiCheckCount == 0 then
          gTopMenuParameter.eRevivalBoxResult = POST:CheckRescue_TopMenu()
        end
        gTopMenuParameter.bIsCheckBusy = false
      end
      if gTopMenuParameter.bEnd == true then
        return
      end
      gTopMenuParameter.nSurechigaiCheckCount = gTopMenuParameter.nSurechigaiCheckCount - 1
      if gTopMenuParameter.nSurechigaiCheckCount < 0 then
        gTopMenuParameter.nSurechigaiCheckCount = 300
      end
      TASK:Sleep(TimeSec(0))
    end
  end
  gTopMenuParameter.bIsTaskPause = true
  TASK:Regist(funcSurechigai)
  local topInfo = _OpenTitleInfoMenuWindowA(-1534792852)
  SCREEN_A:FadeIn(TimeSec(0), false)
  SCREEN_B:FadeIn(TimeSec(0), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), false)
  SCREEN_B:FadeInAll(TimeSec(0.5), true)
  if TOP:ExecuteItsunomaniMessage() then
    _Save(false, true, true)
  end
  TOP:ExecuteDLCDownloadMessage()
  TOP:OpenUpperMenu()
  TOP:OpenUpperHomeButtonMenu()
  CommonSys:OpenBasicMenu(-1534792852, 1636586379, -100566680)
  CommonSys:SetVisibleBasicMenu_Title(false)
  local stMainResult = ""
  gTopMenuParameter.bIsTaskPause = false
  while stMainResult == "" do
    if gTopMenuParameter.mode == "top" then
      stMainResult = TopMenu_Top()
    elseif gTopMenuParameter.mode == "password" then
      _PasswordMain()
    elseif gTopMenuParameter.mode == "etc" then
      _EtcMain()
    elseif gTopMenuParameter.mode == "rescue" then
      if _GiveupRescue() then
        stMainResult = "revival_giveup"
      else
        gTopMenuParameter.mode = "top"
      end
    elseif gTopMenuParameter.mode == "debug_force_rescue" then
      SYSTEM:SetSaveStatus(SAVE_STATUS.RESCUE)
      gTopMenuParameter.mode = "top"
    elseif gTopMenuParameter.mode == "debug_force_revival" then
      SYSTEM:SetSaveStatus(SAVE_STATUS.REVIVAL)
      gTopMenuParameter.mode = "top"
    end
  end
  gTopMenuParameter.bEnd = true
  TASK:WaitTask()
  topInfo:Close()
  topInfo = nil
  TOP:SetUpperMenuVisible(false)
  TOP:SetUpperHomeButtonMenuVisible(false)
  CommonSys:CloseBasicMenu()
  _ResetParameter()
  if stMainResult == "revival" then
    _Revival()
  end
  return stMainResult
end
function _CheckRevival()
  if SYSTEM:GetSaveStatus() == SAVE_STATUS.RESCUE and gTopMenuParameter.eRevivalBoxResult ~= CheckRescueType.OTHER and (gTopMenuParameter.eRevivalBoxResult == CheckRescueType.OK_IN_FUKKATSU_SEED or gTopMenuParameter.eRevivalBoxResult == CheckRescueType.OK_COLLECTED_PEOPLE) then
    return true
  end
  return false
end
function _CheckBlokingRevival()
  if SYSTEM:GetSaveStatus() == SAVE_STATUS.RESCUE then
    WINDOW:SetMessageScreenMode(ScreenType.B)
    CommonSys:SetVisibleBasicMenu(false)
    CommonSys:BeginSurechigaiWaitMessageB(1756409899)
    gTopMenuParameter.nSurechigaiCheckCount = 0
    for i = 1, 90 do
      if gTopMenuParameter.bIsCheckBusy == false then
        _UpdateRevival()
      end
      TASK:Sleep(TimeSec(0))
    end
    CommonSys:EndSurechigaiWaitMessage(true)
    WINDOW:SetMessageScreenMode(ScreenType.A)
    CommonSys:SetVisibleBasicMenu(true)
    CommonSys:SetVisibleBasicMenu_Title(false)
  end
end
function _UpdateRevival()
  if _CheckRevival() then
    SYSTEM:SetSaveStatus(SAVE_STATUS.REVIVAL)
  end
end
function _RevivalMessage()
  if gTopMenuParameter.eRevivalBoxResult ~= CheckRescueType.OTHER then
    local bSave = false
    CommonSys:SetVisibleBasicMenu(false)
    if gTopMenuParameter.eRevivalBoxResult == CheckRescueType.OK_IN_FUKKATSU_SEED then
      MENU:SetTag_String(0, POST:GetTeamNameInFukkatsuSeed())
      MENU:SetTag_String(1, POST:GetHeroNameInFukkatsuSeed())
      WINDOW:NoticeWindowB(-860345465)
      bSave = true
    elseif gTopMenuParameter.eRevivalBoxResult == CheckRescueType.OK_COLLECTED_PEOPLE then
      WINDOW:NoticeWindowB(-1653223932)
      bSave = true
    elseif gTopMenuParameter.eRevivalBoxResult == CheckRescueType.NG_BOX_NONE then
      if gTopMenuParameter.bSurechigaiNoneMessage == false then
        WINDOW:NoticeWindowB(-1131454753)
        gTopMenuParameter.bSurechigaiNoneMessage = true
      end
    elseif gTopMenuParameter.eRevivalBoxResult == CheckRescueType.NG_PARENTAL_CONTROL then
      WINDOW:NoticeWindowB(1975621620)
    end
    if bSave then
      CommonSys:BeginSurechigaiWaitMessageB(1756409899)
      POST:ReflectRecvMessageWithDelete()
      POST:SetSendMessage(false)
      CommonSys:EndSurechigaiWaitMessage(true)
      _Save(false, true, false)
    end
    CommonSys:SetVisibleBasicMenu(true)
    CommonSys:SetVisibleBasicMenu_Title(false)
  end
  gTopMenuParameter.eRevivalBoxResult = CheckRescueType.OTHER
end
function _BeginRescueTaskPause()
  gTopMenuParameter.bIsTaskPause = true
  while true do
    if gTopMenuParameter.bIsCheckBusy == false then
      break
    end
    TASK:Sleep(TimeSec(0))
  end
end
function _EndRescueTaskPause()
  gTopMenuParameter.bIsTaskPause = false
end
function TopMenu_Top()
  local bLoop = true
  local stMainResult = "cancel"
  SYSTEM:SetAddContentsMode(false)
  _CheckBlokingRevival()
  while bLoop do
    if gTopMenuParameter.bWakeup then
      _CheckBlokingRevival()
      gTopMenuParameter.bWakeup = false
    end
    stMainResult = "cancel"
    _RevivalMessage()
    bLoop = false
    local buttonMenu = MENU:CreateButtonMenu()
    NestMenu_SetupDefaultAction(buttonMenu, nil)
    local eStatus = SYSTEM:GetSaveStatus()
    gTopMenuParameter:BeginStepFunc()
    if eStatus == SAVE_STATUS.START then
      gTopMenuParameter:StepFunc(buttonMenu, 825862039, 0, 44, ButtonFixedPattern.TOP_CONTINUE, {
        result = "new_game",
        explanationText = -1512579784,
        nextFunc = nil
      }, nil)
    elseif eStatus == SAVE_STATUS.GROUND then
      gTopMenuParameter:StepFunc(buttonMenu, -2114972542, 0, 44, ButtonFixedPattern.TOP_CONTINUE, {
        result = "continue_game",
        explanationText = -100566680,
        nextFunc = nil
      }, nil)
    elseif eStatus == SAVE_STATUS.DUNGEON then
      gTopMenuParameter:StepFunc(buttonMenu, 106262187, 0, 44, ButtonFixedPattern.TOP_CONTINUE, {
        result = "continue_dungeon",
        explanationText = 2061630641,
        nextFunc = nil
      }, nil)
    elseif eStatus == SAVE_STATUS.DUNGEON_ERROR then
      gTopMenuParameter:StepFunc(buttonMenu, -2114972542, 0, 44, ButtonFixedPattern.TOP_CONTINUE, {
        result = "continue_dungeon",
        explanationText = -100566680,
        nextFunc = nil
      }, nil)
    elseif eStatus == SAVE_STATUS.RESCUE then
      gTopMenuParameter:StepFunc(buttonMenu, 226081860, 0, 44, ButtonFixedPattern.TOP_CONTINUE, {
        result = "revival_giveup",
        explanationText = -1695825610,
        nextFunc = "rescue"
      }, nil)
    elseif eStatus == SAVE_STATUS.REVIVAL then
      gTopMenuParameter:StepFunc(buttonMenu, 1577298231, 0, 44, ButtonFixedPattern.TOP_CONTINUE, {
        result = "revival",
        explanationText = 636667101,
        nextFunc = nil
      }, nil)
    elseif eStatus == SAVE_STATUS.REVIVAL_AFTER then
      gTopMenuParameter:StepFunc(buttonMenu, -2114972542, 0, 44, ButtonFixedPattern.TOP_CONTINUE, {
        result = "continue_dungeon",
        explanationText = -100566680,
        nextFunc = nil
      }, nil)
    end
    if SYSTEM:IsTrialDemo() then
      if FUNC_COMMON:IsAROpen() then
        if gTopMenuParameter.bCursorAr then
          gTopMenuParameter.tempTopCursorId = gTopMenuParameter.iconCount
          gTopMenuParameter.bCursorAr = false
        end
        gTopMenuParameter:StepFunc(buttonMenu, -1752510630, 0, 44, ButtonFixedPattern.TOP_AR, {
          result = "simple_dungeon",
          explanationText = 312232669,
          nextFunc = nil
        }, nil)
      end
      if _IsEtc() and SYSTEM:IsDebugMasterSwitch() then
        gTopMenuParameter:StepFunc(buttonMenu, 1025687342, 0, 44, ButtonFixedPattern.TOP_DEL, {
          result = "delete",
          explanationText = -537376755,
          nextFunc = "delete"
        }, nil)
      end
    else
      if FUNC_COMMON:IsAROpen() then
        if gTopMenuParameter.bCursorAr then
          gTopMenuParameter.tempTopCursorId = gTopMenuParameter.iconCount
          gTopMenuParameter.bCursorAr = false
        end
        gTopMenuParameter:StepFunc(buttonMenu, -1752510630, 0, 44, ButtonFixedPattern.TOP_AR, {
          result = "simple_dungeon",
          explanationText = 312232669,
          nextFunc = nil
        }, nil)
      end
      if SYSTEM:IsDebugRescueMode() then
        if SYSTEM:IsDebugMasterSwitch() then
          if eStatus == SAVE_STATUS.DUNGEON then
            gTopMenuParameter:StepFunc(buttonMenu, 544791280, 0, 44, ButtonFixedPattern.TOP_DEBUG, {
              result = "debug_force_rescue",
              explanationText = -1441235559,
              nextFunc = "debug_force_rescue"
            }, nil)
          elseif eStatus == SAVE_STATUS.RESCUE then
            gTopMenuParameter:StepFunc(buttonMenu, 296802956, 0, 44, ButtonFixedPattern.TOP_DEBUG, {
              result = "debug_force_revival",
              explanationText = -1441235559,
              nextFunc = "debug_force_revival"
            }, nil)
          end
        end
      elseif FUNC_COMMON:IsPasswordQuestOpen() then
        gTopMenuParameter:StepFunc(buttonMenu, 34581498, 0, 44, ButtonFixedPattern.TOP_DIVER, {
          result = "password",
          explanationText = 219581948,
          nextFunc = "password"
        }, nil)
      end
      if FUNC_COMMON:IsAROpen() then
        if gTopMenuParameter.bCursorAddContents then
          gTopMenuParameter.tempTopCursorId = gTopMenuParameter.iconCount
          gTopMenuParameter.bCursorAddContents = false
        end
        gTopMenuParameter:StepFunc(buttonMenu, 1520863156, 0, 44, ButtonFixedPattern.TOP_DLC, {
          result = "dlc",
          explanationText = 1552472152,
          nextFunc = "dlc"
        }, nil)
      end
      if _IsEtc() then
        if FUNC_COMMON:IsTeamOpen() then
          gTopMenuParameter:StepFunc(buttonMenu, -1446287771, 0, 44, ButtonFixedPattern.TOP_TEAM, {
            result = "rename",
            explanationText = -1142966430,
            nextFunc = "rename"
          }, nil)
        end
        gTopMenuParameter:StepFunc(buttonMenu, 1025687342, 0, 44, ButtonFixedPattern.TOP_DEL, {
          result = "delete",
          explanationText = -537376755,
          nextFunc = "delete"
        }, nil)
      end
    end
    gTopMenuParameter:EndStepFunc(buttonMenu)
    if SYSTEM:IsDebugMasterSwitch() then
      buttonMenu:SetOption({
        inputMode = "LINK",
        selectMode = "SCALE",
        iconCursor = "TOP"
      })
    else
      buttonMenu:SetOption({
        inputMode = "LINK",
        selectMode = "SCALE",
        iconCursor = "TOP",
        cancel = "OFF"
      })
    end
    function buttonMenu:decideAction()
      gTopMenuParameter.bIsDecideProcess = true
      if (self.curItem.obj.result == "continue_dungeon" or self.curItem.obj.result == "revival_giveup" or self.curItem.obj.result == "revival") and SYSTEM:IsDungeonLoadDLC() then
        gTopMenuParameter.bDLCCheck = true
      end
      if self.curItem.obj.nextFunc ~= nil then
        gTopMenuParameter.mode = self.curItem.obj.nextFunc
        gTopMenuParameter.tempTopCursorId = self:GetCursorItemIndex()
        stMainResult = ""
      else
        stMainResult = self.curItem.obj.result
      end
      if gTopMenuParameter.bDLCCheck == false and stMainResult ~= "" then
        gTopMenuParameter.bEnd = true
        _EndFadeout()
      end
      self:Close()
      gTopMenuParameter.bIsDecideProcess = false
    end
    function buttonMenu:currentItemChange()
      CommonSys:UpdateBasicMenu_LineHelp(self.curItem.obj.explanationText)
    end
    function buttonMenu:drawFunc()
      if gTopMenuParameter.bIsDecideProcess == false then
        if SYSTEM:IsWakeup() then
          self:Close()
          bLoop = true
          gTopMenuParameter.bWakeup = true
        elseif SYSTEM:GetSaveStatus() == SAVE_STATUS.RESCUE and _CheckRevival() then
          _UpdateRevival()
          self:Close()
          bLoop = true
        end
      end
    end
    function buttonMenu:cancelAction()
      if SYSTEM:IsDebugMasterSwitch() then
        self:Close()
      end
    end
    if gTopMenuParameter.tempTopCursorId ~= 0 then
      buttonMenu:SetCursorItemIndex(gTopMenuParameter.tempTopCursorId)
      gTopMenuParameter.tempTopCursorId = 0
    end
    NestMenu_OpenAndCloseWait(buttonMenu)
    if gTopMenuParameter.bDLCCheck then
      local bDlcCheckAsk = true
      if gTopMenuParameter.mode == "rescue" then
        bDlcCheckAsk = false
      end
      if _CheckDLC(bDlcCheckAsk) then
        stMainResult = ""
        gTopMenuParameter.mode = "top"
        bLoop = true
      elseif stMainResult ~= "" then
        gTopMenuParameter.bEnd = true
        _EndFadeout()
      end
      gTopMenuParameter.bDLCCheck = false
    end
    if gTopMenuParameter.mode == "rename" then
      _TeamRename()
      gTopMenuParameter.mode = "top"
      bLoop = true
    elseif gTopMenuParameter.mode == "dlc" then
      CommonSys:SetVisibleBasicMenu(false)
      local ret = 1
      if TOP:IsEnableDlcContents() then
        WINDOW:SetMessageScreenMode(ScreenType.B)
        WINDOW:SysMsg(-853823193)
        WINDOW:SelectStart()
        WINDOW:SelectChain(-220450611, 0)
        WINDOW:SelectChain(1766958818, 1)
        ret = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL_HIDDEN)
        WINDOW:SetMessageScreenMode(ScreenType.A)
      else
        WINDOW:SetMessageScreenMode(ScreenType.B)
        WINDOW:SysMsg(-787490883)
        WINDOW:CloseMessage()
        WINDOW:SetMessageScreenMode(ScreenType.A)
      end
      if ret == 0 then
        _EndFadeout()
        bLoop = false
        stMainResult = "dlc"
      else
        bLoop = true
        gTopMenuParameter.mode = "top"
        CommonSys:SetVisibleBasicMenu(true)
        CommonSys:SetVisibleBasicMenu_Title(false)
      end
    elseif gTopMenuParameter.mode == "delete" then
      gTopMenuParameter.bIsTaskPause = true
      while true do
        if gTopMenuParameter.bIsCheckBusy == false then
          break
        end
        TASK:Sleep(TimeSec(0))
      end
      if _DeleteSave() then
        TOP:UpdateUpperMenu()
        CommonSys:SetVisibleBasicMenu(false)
        if TOP:ExecuteItsunomaniMessage() then
          _Save(false, true, true)
        end
        CommonSys:SetVisibleBasicMenu(true)
        gTopMenuParameter.tempTopCursorId = 0
      else
        stMainResult = ""
        bLoop = true
      end
      gTopMenuParameter.mode = "top"
      gTopMenuParameter.bIsTaskPause = false
    end
    if bLoop then
      _UpdateRevival()
    end
  end
  return stMainResult
end
function _Revival()
  SCREEN_A:FadeOut(TimeSec(0), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), true)
  local n = TOP:GetNokoriRevival()
  if n <= 0 then
    WINDOW:SysMsg(1937520470)
  else
    MENU:SetTag_Value(0, n)
    WINDOW:SysMsg(-725434474)
  end
  WINDOW:CloseMessage()
  SYSTEM:SetSaveStatus(SAVE_STATUS.REVIVAL_AFTER)
  _Save(false, false, false)
  SCREEN_A:FadeOutAll(TimeSec(0.5), true)
  SCREEN_A:FadeIn(TimeSec(0), false)
end
function _EndFadeout()
  TOP:EndBgm()
  SCREEN_A:FadeOutAll(TimeSec(0.5), false)
  SCREEN_B:FadeOutAll(TimeSec(0.5), true)
end
function _CheckDLC(bAskMessage)
  local bResultCancel = false
  if SYSTEM:CheckDlcDungeonForLoad() ~= DLC_ERROR.NONE then
    if bAskMessage then
      CommonSys:SetVisibleBasicMenu(false)
      WINDOW:SetMessageScreenMode(ScreenType.B)
      WINDOW:SysMsg(1648221829)
      WINDOW:SelectStart()
      WINDOW:SelectChain(1153958492, 1)
      WINDOW:SelectChain(1905925156, 2)
      WINDOW:DefaultCursor(2)
      local nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
      if nResult ~= 1 then
        CommonSys:SetVisibleBasicMenu(true)
        CommonSys:SetVisibleBasicMenu_Title(false)
        bResultCancel = true
      else
        SYSTEM:SetDLCErrorDungeonLoad(true)
      end
      WINDOW:SetMessageScreenMode(ScreenType.A)
    else
      SYSTEM:SetDLCErrorDungeonLoad(true)
    end
  end
  return bResultCancel
end
function _IsEtc()
  if SYSTEM:GetSaveStatus() ~= SAVE_STATUS.START then
    return true
  end
  return false
end
function _EtcMain()
  local bLoop = true
  gTopMenuParameter.tempEtcCursorId = 0
  CommonSys:UpdateBasicMenu_LineHelp(-1142966430)
  while bLoop do
    do
      local bDelete = false
      local stMainResult = "cancel"
      local buttonMenu = MENU:CreateButtonMenu()
      NestMenu_SetupDefaultAction(buttonMenu, nil)
      CommonSys:SetVisibleBasicMenu_Title(true)
      CommonSys:UpdateBasicMenu_Title(-1831647181)
      gTopMenuParameter:BeginStepFunc()
      if FUNC_COMMON:IsTeamOpen() then
        gTopMenuParameter:StepFunc(buttonMenu, -1446287771, 0, 44, ButtonFixedPattern.TOP_TEAM, {
          result = "rename",
          explanationText = -1142966430,
          nextFunc = nil
        }, nil)
      end
      gTopMenuParameter:StepFunc(buttonMenu, 1025687342, 0, 44, ButtonFixedPattern.TOP_DEL, {
        result = "delete",
        explanationText = -537376755,
        nextFunc = nil
      }, nil)
      gTopMenuParameter:StepFunc(buttonMenu, 1847809313, 0, 44, ButtonFixedPattern.TOP_RETURN, {
        result = "cancel",
        explanationText = 2084013094,
        nextFunc = nil
      }, nil)
      gTopMenuParameter:EndStepFunc(buttonMenu)
      buttonMenu:SetOption({
        inputMode = "LINK",
        selectMode = "SCALE",
        iconCursor = "TOP"
      })
      function buttonMenu:decideAction()
        stMainResult = self.curItem.obj.result
        SYSTEM:DebugPrint(stMainResult)
        gTopMenuParameter.tempEtcCursorId = self:GetCursorItemIndex()
        self:Close()
      end
      function buttonMenu:currentItemChange()
        CommonSys:UpdateBasicMenu_LineHelp(self.curItem.obj.explanationText)
      end
      bLoop = false
      stMainResult = "cancel"
      if gTopMenuParameter.tempEtcCursorId ~= 0 then
        buttonMenu:SetCursorItemIndex(gTopMenuParameter.tempEtcCursorId)
        gTopMenuParameter.tempEtcCursorId = 0
      end
      NestMenu_OpenAndCloseWait(buttonMenu)
      if stMainResult == "rename" then
        _TeamRename()
        bLoop = true
      elseif stMainResult == "delete" then
        if _DeleteSave() then
          gTopMenuParameter.tempTopCursorId = 0
          TOP:UpdateUpperMenu()
        else
          bLoop = true
        end
      end
    end
  end
  gTopMenuParameter.mode = "top"
end
function _PasswordMain()
  CommonSys:SetVisibleBasicMenu(false)
  if OpenGameMenuPasswordMenu() then
    _BeginRescueTaskPause()
    CommonSys:ChangeMenuWait()
    _Save(false, true, false)
    _EndRescueTaskPause()
  end
  CommonSys:SetVisibleBasicMenu(true)
  CommonSys:SetVisibleBasicMenu_Title(false)
  gTopMenuParameter.mode = "top"
end
function _GiveupRescue()
  CommonSys:SetVisibleBasicMenu(false)
  TOP:SetUpperMenuSaveDeleteFaceType(false)
  WINDOW:SetMessageScreenMode(ScreenType.B)
  WINDOW:SysMsg(277977653)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-810096725, 1)
  WINDOW:SelectChain(-1762923685, -1)
  WINDOW:DefaultCursor(-1)
  local nResult = WINDOW:SelectEndWithWakeupCancel(MENU_SELECT_MODE.ENABLE_CANCEL)
  if nResult == 1 then
    SYSTEM:SetSaveStatus(SAVE_STATUS.DUNGEON)
    CommonSys:BeginSurechigaiWaitMessageB(1756409899)
    POST:ReflectRecvMessageWithDelete()
    POST:SetSendMessage(false)
    CommonSys:EndSurechigaiWaitMessage(true)
  end
  CommonSys:SetVisibleBasicMenu(true)
  CommonSys:SetVisibleBasicMenu_Title(false)
  WINDOW:SetMessageScreenMode(ScreenType.A)
  if nResult == 1 then
    _EndFadeout()
    return true
  end
  TOP:SetUpperMenuNormalFaceType()
  return false
end
function _TeamRename()
  local bLoop = true
  while bLoop do
    bLoop = false
    CommonSys:SetVisibleBasicMenu(false)
    do
      local defaultName = FUNC_COMMON:GetTeamName()
      local tempName = FUNC_COMMON:GetTeamName()
      local nameInputMenu = MENU:CreateNameInputMenu(ScreenType.B)
      nameInputMenu:SetTitleText(458814869)
      nameInputMenu:SetText(defaultName)
      nameInputMenu:SetBCancel(true)
      function nameInputMenu:decideAction()
        defaultName = nameInputMenu:GetText()
        self:Close()
      end
      function nameInputMenu:cancelAction()
        defaultName = nameInputMenu:GetText()
        self:Close()
      end
      function nameInputMenu:currentItemChange()
      end
      function nameInputMenu:openedAction()
      end
      function nameInputMenu:closedAction()
      end
      function nameInputMenu:ngAction()
        WINDOW:SetMessageScreenMode(ScreenType.B)
        WINDOW:SysMsg(998639762)
        WINDOW:CloseMessage()
        WINDOW:SetMessageScreenMode(ScreenType.A)
      end
      nameInputMenu:Open()
      MENU:SetFocus(nameInputMenu)
      MENU:WaitClose(nameInputMenu)
      if defaultName ~= tempName then
        FUNC_COMMON:SetTeamName(defaultName)
        WINDOW:SetMessageScreenMode(ScreenType.B)
        WINDOW:SysMsg(1461720650)
        WINDOW:SelectStart()
        WINDOW:SelectChain(-835346280, 1)
        WINDOW:SelectChain(-929907866, -1)
        local nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
        if nResult == 1 then
          _BeginRescueTaskPause()
          FUNC_COMMON:SetTeamName(defaultName)
          _Save(true, true, false)
          _EndRescueTaskPause()
        else
          FUNC_COMMON:SetTeamName(tempName)
          bLoop = true
        end
        WINDOW:SetMessageScreenMode(ScreenType.A)
      end
    end
  end
  CommonSys:SetVisibleBasicMenu(true)
  CommonSys:SetVisibleBasicMenu_Title(false)
end
function _Save(bCtrlMenu, bScreenB, bHeaderOnly)
  if bCtrlMenu then
    CommonSys:SetVisibleBasicMenu(false)
  end
  if bScreenB then
    WINDOW:SetMessageScreenMode(ScreenType.B)
  end
  local nResult = 1
  if nResult ~= 0 then
    local bResult = false
    if bHeaderOnly then
      bResult = SYSTEM:SaveHeader()
    else
      WINDOW:SysMsg(-124596352)
      bResult = SYSTEM:TopSaveGame()
    end
    WINDOW:ForceCloseMessage()
    if bResult then
      if nResult == 2 then
        WINDOW:SysMsg(-1209879105)
      elseif bHeaderOnly then
      else
        WINDOW:SysMsg(-1617239266)
      end
    else
      WINDOW:SysMsg(1697017689)
    end
    WINDOW:CloseMessage()
  end
  WINDOW:SetMessageScreenMode(ScreenType.A)
  if bCtrlMenu then
    CommonSys:SetVisibleBasicMenu(true)
    CommonSys:SetVisibleBasicMenu_Title(false)
  end
  return false
end
function _DeleteSave()
  local bResult = false
  CommonSys:SetVisibleBasicMenu(false)
  WINDOW:SetMessageScreenMode(ScreenType.B)
  TOP:SetUpperMenuSaveDeleteFaceType(false)
  WINDOW:SysMsg(-838777233)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-689088893, 1)
  WINDOW:SelectChain(-913732176, 2)
  WINDOW:DefaultCursor(2)
  local nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
  if nResult == 1 then
    TOP:SetUpperMenuSaveDeleteFaceType(true)
    WINDOW:SysMsg(-780985534)
    WINDOW:SelectStart()
    WINDOW:SelectChain(1041215274, 1)
    WINDOW:SelectChain(-614080990, 2)
    WINDOW:DefaultCursor(2)
    local nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    if nResult == -1 then
      nResult = 2
    end
    if nResult == 1 then
      TOP:SetUpperMenuVisible(false)
      WINDOW:SysMsg(-1086613801)
      SYSTEM:DeleteSaveFile()
      WINDOW:ForceCloseMessage()
      WINDOW:SysMsg(771252245)
      WINDOW:CloseMessage()
      bResult = true
    end
  end
  TOP:SetUpperMenuNormalFaceType()
  WINDOW:SetMessageScreenMode(ScreenType.A)
  CommonSys:SetVisibleBasicMenu(true)
  CommonSys:SetVisibleBasicMenu_Title(false)
  return bResult
end
function TopMenu_DeleteSave()
  local bResult = false
  WINDOW:SetMessageScreenMode(ScreenType.B)
  TOP:SetUpperMenuSaveDeleteFaceType(false)
  WINDOW:SysMsg(-838777233)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-689088893, 1)
  WINDOW:SelectChain(-913732176, 2)
  WINDOW:DefaultCursor(2)
  local nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
  if nResult == -1 then
    nResult = 2
  end
  if nResult == 1 then
    TOP:SetUpperMenuSaveDeleteFaceType(true)
    WINDOW:SysMsg(-780985534)
    WINDOW:SelectStart()
    WINDOW:SelectChain(1041215274, 1)
    WINDOW:SelectChain(-614080990, 2)
    WINDOW:DefaultCursor(2)
    nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    if nResult == -1 then
      nResult = 2
    end
    if nResult == 1 then
      WINDOW:SysMsg(-1086613801)
      SYSTEM:DeleteSaveFile()
      WINDOW:ForceCloseMessage()
      WINDOW:SysMsg(771252245)
      WINDOW:CloseMessage()
      bResult = true
    end
  end
  TOP:SetUpperMenuNormalFaceType()
  WINDOW:SetMessageScreenMode(ScreenType.A)
  return nResult
end

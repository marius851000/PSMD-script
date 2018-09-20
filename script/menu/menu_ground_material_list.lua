function OpenGroundMaterialList()
  local resumeData = FlowSys:Suspend()
  local retFlag = false
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  function FlowSys.Proc.OpenTop()
    SCREEN_B:FadeOutAll(TimeSec(0), true)
    SCREEN_B:LoadWallpaper("WALLPAPER_SUB_UTILITY01")
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
    SCREEN_B:FadeIn(TimeSec(0), false)
    SCREEN_B:FadeInAll(TimeSec(0.3), false)
    DispGroundMaterialList()
    FlowSys:Next("CloseTop")
  end
  function FlowSys.Proc.CloseTop()
    SCREEN_B:FadeOutAll(TimeSec(0), true)
    TASK:Sleep(TimeSec(4, TIME_TYPE.FRAME))
    LOWER_SCREEN:ChangeLastWallpaper()
    SCREEN_B:FadeIn(TimeSec(0), false)
    SCREEN_B:FadeInAll(TimeSec(0.3), false)
    FlowSys:Return()
  end
  local lastVisible = LOWER_SCREEN:IsVisible()
  LOWER_SCREEN:SetVisible(false)
  FlowSys:Call("OpenTop")
  WINDOW:CloseMessage()
  LOWER_SCREEN:SetVisible(lastVisible)
  FlowSys:Finish()
  ShopSys:Finish()
  FlowSys:Resume(resumeData)
  return retFlag
end
function DispGroundMaterialList()
  local fadeEnter = function()
    CommonSys:EndLowerMenuNavi(true)
    SCREEN_A:FadeInAll(TimeSec(0.3), false)
    SCREEN_B:FadeInAll(TimeSec(0.3), false)
  end
  local fadeReturn = function()
    SCREEN_A:FadeOutAll(TimeSec(0), false)
    SCREEN_B:FadeOutAll(TimeSec(0), true)
    TASK:Sleep(TimeSec(0))
    SCREEN_B:LoadWallpaper("WALLPAPER_SUB_UTILITY01")
    CommonSys:BeginLowerMenuNavi(nil, nil, true)
    SCREEN_A:FadeInAll(TimeSec(0.3), false)
    SCREEN_B:FadeInAll(TimeSec(0.3), false)
  end
  local listMenu = MENU:CreatePageMenuBigStack()
  listMenu:SetLayoutRectAndLines(16, 40, 232, 0)
  local function landMenuDispFunc()
    ShopSys:SaveCursorIndex("LandTypeMenu", 0)
    DispSelectLandTypeMenu(1771276860, -1760152129, nil, function()
      fadeReturn()
    end)
  end
  local function buildMenuDispFunc()
    DispBuildSelectMenu(-1365039211, -1345778520, nil, function()
      fadeReturn()
    end, false, true)
  end
  local function colorMenuDispFunc(colorType)
    local bgGrLblTbl = {
      [PARADISE_COLOR_CHANGE_TYPE.HOME_ROOF] = "HOME",
      [PARADISE_COLOR_CHANGE_TYPE.HOME_WINDOW] = "HOME",
      [PARADISE_COLOR_CHANGE_TYPE.SHOP] = "PARA_SHOP_TENT_1",
      [PARADISE_COLOR_CHANGE_TYPE.FARM] = "PARA_SHOP_FARM_2"
    }
    DispSelectColorMenu(colorType, -218436926, -208616961, bgGrLblTbl[colorType], nil, function()
      fadeReturn()
    end)
  end
  local isShopColorDisable = GROUND:GetOpenLimitState_Menu(PARADISE_MENU_OPEN_TYPE.SHOP_COLOR_CHANGE) == PARADISE_OPEN_LIMIT_STATE.CLOSE
  local isHomeColorDisable = GROUND:GetOpenLimitState_Menu(PARADISE_MENU_OPEN_TYPE.HOME_COLOR_CHANGE) == PARADISE_OPEN_LIMIT_STATE.CLOSE
  listMenu:ShowPageNum(false)
  listMenu:AddItem(-1725574921, {
    disableFlg = false,
    openFunc = function()
      landMenuDispFunc()
    end
  }, nil)
  listMenu:AddItem(1335867150, {
    disableFlg = false,
    openFunc = function()
      buildMenuDispFunc()
    end
  }, nil)
  listMenu:AddItem(331774553, {
    disableFlg = isShopColorDisable,
    openFunc = function()
      colorMenuDispFunc(PARADISE_COLOR_CHANGE_TYPE.SHOP)
    end
  }, nil)
  listMenu:AddItem(1858305371, {
    disableFlg = isShopColorDisable,
    openFunc = function()
      colorMenuDispFunc(PARADISE_COLOR_CHANGE_TYPE.FARM)
    end
  }, nil)
  listMenu:AddItem(932144099, {
    disableFlg = isHomeColorDisable,
    openFunc = function()
      colorMenuDispFunc(PARADISE_COLOR_CHANGE_TYPE.HOME_ROOF)
    end
  }, nil)
  listMenu:AddItem(-1981071358, {
    disableFlg = isHomeColorDisable,
    openFunc = function()
      colorMenuDispFunc(PARADISE_COLOR_CHANGE_TYPE.HOME_WINDOW)
    end
  }, nil)
  function listMenu:itemPreOpenModifyAction()
    if self.curItem.obj.disableFlg then
      self.curItem.disable = true
    end
  end
  function listMenu:openedAction()
    self:SetCursorItemIndex(ShopSys:ResumeCursorIndex("MaterialListTop", 0))
    CommonSys:OpenBasicMenu(356897911, 947093553, 683927605)
  end
  function listMenu:decideAction()
    local openFunc = self.curItem.obj.openFunc
    self:SetVisible(false)
    fadeEnter()
    openFunc()
    self:SetVisible(true)
    MENU:SetFocus(self)
  end
  function listMenu:cancelAction()
    self:Close()
  end
  function listMenu:closedAction()
    ShopSys:SaveCursorIndex("MaterialListTop", self:GetCursorItemIndex())
    SCREEN_B:FadeOutAll(TimeSec(0), true)
    CommonSys:CloseBasicMenu()
  end
  listMenu:Open()
  MENU:SetFocus(listMenu)
  MENU:WaitClose(listMenu)
end

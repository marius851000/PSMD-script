function OpenVWaveReportFlow()
  dispVWaveReportMenu()
end
function dispVWaveReportMenu(optTbl)
  local dayMax = 11
  SPRITE:DestroySpriteGroup("vwaveGrp")
  SPRITE:DestroyPatternSet("vwaveSet")
  SAJI:DestroySajiPlayer("CursorN")
  SAJI:DestroySajiPlayer("CursorD")
  local titleBoardMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
  titleBoardMenu:SetLayoutRect(CommonSys:ArgsLayoutRect(32, 8, 368, 64))
  titleBoardMenu:SetTextOffset(0, 0)
  titleBoardMenu:Open()
  titleBoardMenu:SetOption({
    font = "FONT_16",
    frameMode = FrameMode.MENU
  })
  local expBoardMenu = MENU:CreateBoardMenuWindow(ScreenType.A)
  expBoardMenu:SetLayoutRect(CommonSys:ArgsLayoutRect(56, 72, 344, 232))
  expBoardMenu:SetTextOffset(0, 0)
  expBoardMenu:Open()
  expBoardMenu:SetOption({
    font = "FONT_16",
    frameMode = FrameMode.MENU
  })
  local menuBoardWin = MENU:CreateBoardMenuWindow(ScreenType.B)
  menuBoardWin:SetLayoutRect(Rectangle(0, 0, 320, 240))
  menuBoardWin:SetTextOffset(0, 0)
  menuBoardWin:Open()
  menuBoardWin:SetOption({font = "FONT_16", showBgFrame = false})
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_V_WAVE01")
  SPRITE:CreatePatternSet("vwaveSet", {
    name = "coverUp",
    img = "V_WAVE_COVER",
    u = 0,
    v = 0,
    w = 320,
    h = 32,
    cx = 160,
    cy = 0,
    allocateFromMap = true
  }, {
    name = "coverDown",
    img = "V_WAVE_COVER",
    u = 0,
    v = 32,
    w = 320,
    h = 48,
    cx = 160,
    cy = 0,
    allocateFromMap = true
  }, {
    name = "typeBg",
    img = "V_WAVE_COVER",
    u = 0,
    v = 81,
    w = 320,
    h = 46,
    cx = 160,
    cy = 23,
    allocateFromMap = true
  }, {
    name = "todayBg",
    img = "V_WAVE_COVER",
    u = 320,
    v = 0,
    w = 144,
    h = 48,
    cx = 72,
    cy = 24,
    allocateFromMap = true
  }, {
    name = "afterBg",
    img = "V_WAVE_COVER",
    u = 320,
    v = 48,
    w = 144,
    h = 32,
    cx = 72,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "scrBar",
    img = "V_WAVE_SC_BAR",
    u = 0,
    v = 0,
    w = 32,
    h = 160,
    cx = 16,
    cy = 0,
    allocateFromMap = true
  }, {
    name = "scrBtn",
    img = "V_WAVE_SC_BAR",
    u = 0,
    v = 160,
    w = 32,
    h = 40,
    cx = 16,
    cy = 20,
    allocateFromMap = true
  }, {
    name = "TYPE_NORMAL",
    img = "MARK_V_WAVE",
    u = 0,
    v = 0,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_FIRE",
    img = "MARK_V_WAVE",
    u = 32,
    v = 0,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_WATER",
    img = "MARK_V_WAVE",
    u = 64,
    v = 0,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_ELECTRIC",
    img = "MARK_V_WAVE",
    u = 96,
    v = 0,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_GRASS",
    img = "MARK_V_WAVE",
    u = 0,
    v = 32,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_ICE",
    img = "MARK_V_WAVE",
    u = 32,
    v = 32,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_FIGHTING",
    img = "MARK_V_WAVE",
    u = 64,
    v = 32,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_POISON",
    img = "MARK_V_WAVE",
    u = 96,
    v = 32,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_GROUND",
    img = "MARK_V_WAVE",
    u = 0,
    v = 64,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_FLYING",
    img = "MARK_V_WAVE",
    u = 32,
    v = 64,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_PSYCHIC",
    img = "MARK_V_WAVE",
    u = 64,
    v = 64,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_BUG",
    img = "MARK_V_WAVE",
    u = 96,
    v = 64,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_ROCK",
    img = "MARK_V_WAVE",
    u = 0,
    v = 96,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_GHOST",
    img = "MARK_V_WAVE",
    u = 32,
    v = 96,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_DRAGON",
    img = "MARK_V_WAVE",
    u = 64,
    v = 96,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_DARK",
    img = "MARK_V_WAVE",
    u = 96,
    v = 96,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  }, {
    name = "TYPE_STEEL",
    img = "MARK_V_WAVE",
    u = 128,
    v = 0,
    w = 32,
    h = 32,
    cx = 16,
    cy = 16,
    allocateFromMap = true
  })
  local typeMarkPtnTbl = {
    "TYPE_NORMAL",
    "TYPE_GRASS",
    "TYPE_FIRE",
    "TYPE_WATER",
    "TYPE_ELECTRIC",
    "TYPE_ICE",
    "TYPE_FIGHTING",
    "TYPE_POISON",
    "TYPE_GROUND",
    "TYPE_FLYING",
    "TYPE_PSYCHIC",
    "TYPE_BUG",
    "TYPE_ROCK",
    "TYPE_GHOST",
    "TYPE_DRAGON",
    "TYPE_DARK",
    "TYPE_STEEL",
    "TYPE_NORMAL"
  }
  local typeNameTbl = {
    "[type:1]",
    "[type:2]",
    "[type:3]",
    "[type:4]",
    "[type:5]",
    "[type:6]",
    "[type:7]",
    "[type:8]",
    "[type:9]",
    "[type:10]",
    "[type:11]",
    "[type:12]",
    "[type:13]",
    "[type:14]",
    "[type:15]",
    "[type:16]",
    "[type:17]",
    "[type:18]"
  }
  local typeIconTbl = {
    "[M:TNORMAL]",
    "[M:TGRASS]",
    "[M:TFIRE]",
    "[M:TWATER]",
    "[M:TELECTRIC]",
    "[M:TICE]",
    "[M:TFIGHTING]",
    "[M:TPOISON]",
    "[M:TGROUND]",
    "[M:TFLYING]",
    "[M:TPSYCHIC]",
    "[M:TBUG]",
    "[M:TROCK]",
    "[M:TGHOST]",
    "[M:TDRAGON]",
    "[M:TDARK]",
    "[M:TSTEEL]",
    ""
  }
  local typeTitleBaseText = MENU:GetTextPoolText(V_ROULETTE__TYPE_TITLE_BASE_TEXT)
  local typeExpBaseText = MENU:GetTextPoolText(V_ROULETTE__TYPE_EXP_BASE_TEXT1) .. MENU:GetTextPoolText(V_ROULETTE__TYPE_EXP_BASE_TEXT2)
  local Cursor = {}
  function Cursor:Init()
    SAJI:CreateSajiPlayer("CursorN", "V_WAVE_CURSOR_01DEFAULT")
    SAJI:CreateSajiPlayer("CursorD", "V_WAVE_CURSOR_02DECISION")
    SJ("CursorN"):Play(LOOP.ON)
    SJ("CursorD"):Play(LOOP.ON)
    SJ("CursorN"):SetVisible(false)
    SJ("CursorD"):SetVisible(false)
    SJ("CursorN"):SetDrawPriority(400)
    SJ("CursorD"):SetDrawPriority(400)
    SJ("CursorN"):SetParallax(-1)
    SJ("CursorD"):SetParallax(-1)
    SJ("CursorN"):SetScreenType(ScreenType.B)
    SJ("CursorD"):SetScreenType(ScreenType.B)
  end
  function Cursor:SetPos(x, y)
    SJ("CursorN"):SetPosition(Vector2(x, y))
    SJ("CursorD"):SetPosition(Vector2(x, y))
  end
  function Cursor:WaitAnim()
    SJ("CursorD"):SetVisible(false)
    SJ("CursorN"):SetVisible(true)
    SJ("CursorN"):Play(LOOP.ON)
  end
  function Cursor:DecideAnim()
    SJ("CursorN"):SetVisible(false)
    SJ("CursorD"):SetVisible(true)
    SJ("CursorD"):Play(LOOP.OFF)
  end
  function Cursor:Tick()
  end
  Cursor:Init()
  Cursor:SetPos(168, 76)
  Cursor:WaitAnim()
  local TextPutSys = {drawText = ""}
  function TextPutSys:ClearText()
    self.drawText = ""
  end
  function TextPutSys:PutText(x, y, text)
    self.drawText = self.drawText .. string.format("[HO:%d][VO:%d]%s", x, y, text)
  end
  function TextPutSys:Tick()
    menuBoardWin:SetText(self.drawText)
  end
  local MakePutText = function(x, y, text)
    return string.format("[HO:%d][VO:%d]%s", x, y, text)
  end
  local function MakePutHorizontalTypeIconsText(x, y, type, count)
    local icon = typeIconTbl[type]
    local iconText = ""
    for i = 1, count do
      iconText = iconText .. icon
    end
    return MENU:ReplaceTagText(MakePutText(x, y, iconText))
  end
  local function MakePutVerticalTypeIconsText(x, y, type, count)
    local icon = typeIconTbl[type]
    local iconText = ""
    for i = 1, count do
      iconText = iconText .. MakePutText(x, y + (i - 1) * 16, icon)
    end
    return MENU:ReplaceTagText(iconText)
  end
  local framePrio = 600
  local frameSprt = SPRITE:CreateSprite("vwaveGrp", "bgFrame")
  frameSprt:SetPattern({
    setName = "vwaveSet",
    ptnName = "coverUp",
    ofsX = 0,
    ofsY = -120,
    ofsPrio = framePrio + 0,
    ofsParallax = 0
  }, {
    setName = "vwaveSet",
    ptnName = "coverDown",
    ofsX = 0,
    ofsY = 72,
    ofsPrio = framePrio + 0,
    ofsParallax = 0
  })
  frameSprt:SetPosition(Vector2(160, 120))
  frameSprt:SetOption({
    screen = ScreenType.B
  })
  local scrollBar = {}
  scrollBar.sprtBg = SPRITE:CreateSprite("vwaveGrp", "sprScrBg")
  scrollBar.sprtBtn = SPRITE:CreateSprite("vwaveGrp", "sprScrBtn")
  scrollBar.sprtBg:SetOption({
    screen = ScreenType.B
  })
  scrollBar.sprtBtn:SetOption({
    screen = ScreenType.B
  })
  scrollBar.sprtBg:SetPattern({
    setName = "vwaveSet",
    ptnName = "scrBar",
    ofsX = 304,
    ofsY = 32,
    ofsPrio = framePrio + 1,
    ofsParallax = 0
  })
  scrollBar.sprtBtn:SetPattern({
    setName = "vwaveSet",
    ptnName = "scrBtn",
    ofsX = 304,
    ofsY = 30,
    ofsPrio = framePrio + 0,
    ofsParallax = 0
  })
  function scrollBar:SetOffset(offsetY)
    local barMovH = 122
    local barY = -offsetY / (44 * (dayMax - 1)) * barMovH
    self.sprtBtn:SetPosition(Vector2(0, barY + 20))
  end
  function scrollBar:CalcOffsetFromTouch(touchY)
    local barMovH = 122
    local barY = touchY - 56
    local offsetY = -barY / barMovH * (44 * (dayMax - 1))
    if offsetY > 0 then
      offsetY = 0
    end
    if offsetY < -(44 * (dayMax - 1)) then
      offsetY = -(44 * (dayMax - 1))
    end
    return offsetY
  end
  function scrollBar:CalcDayFromTouch(touchY)
    local barMovH = 122
    local day = math.floor(scrollBar:CalcOffsetFromTouch(touchY) / (-44 * (dayMax - 1)) * dayMax) + 1
    if day < 1 then
      day = 1
    end
    if day > dayMax then
      day = dayMax
    end
    return day
  end
  local currentDay = GROUND:GetVWaveForecastCurrentDay() + 1
  if currentDay <= 0 then
    currentDay = 1
  end
  local dayBgTextTbl = {
    [-29] = V_ROULETTE__DAY_30_BEFORE,
    [-28] = V_ROULETTE__DAY_29_BEFORE,
    [-27] = V_ROULETTE__DAY_28_BEFORE,
    [-26] = V_ROULETTE__DAY_27_BEFORE,
    [-25] = V_ROULETTE__DAY_26_BEFORE,
    [-24] = V_ROULETTE__DAY_25_BEFORE,
    [-23] = V_ROULETTE__DAY_24_BEFORE,
    [-22] = V_ROULETTE__DAY_23_BEFORE,
    [-21] = V_ROULETTE__DAY_22_BEFORE,
    [-20] = V_ROULETTE__DAY_21_BEFORE,
    [-19] = V_ROULETTE__DAY_20_BEFORE,
    [-18] = V_ROULETTE__DAY_19_BEFORE,
    [-17] = V_ROULETTE__DAY_18_BEFORE,
    [-16] = V_ROULETTE__DAY_17_BEFORE,
    [-15] = V_ROULETTE__DAY_16_BEFORE,
    [-14] = V_ROULETTE__DAY_15_BEFORE,
    [-13] = V_ROULETTE__DAY_14_BEFORE,
    [-12] = V_ROULETTE__DAY_13_BEFORE,
    [-11] = V_ROULETTE__DAY_12_BEFORE,
    [-10] = V_ROULETTE__DAY_11_BEFORE,
    [-9] = V_ROULETTE__DAY_10_BEFORE,
    [-8] = V_ROULETTE__DAY_9_BEFORE,
    [-7] = V_ROULETTE__DAY_8_BEFORE,
    [-6] = V_ROULETTE__DAY_7_BEFORE,
    [-5] = V_ROULETTE__DAY_6_BEFORE,
    [-4] = V_ROULETTE__DAY_5_BEFORE,
    [-3] = V_ROULETTE__DAY_4_BEFORE,
    [-2] = V_ROULETTE__DAY_3_BEFORE,
    [-1] = V_ROULETTE__DAY_2_BEFORE,
    [0] = V_ROULETTE__DAY_1_BEFORE,
    [1] = V_ROULETTE__DAY_TODAY,
    [2] = V_ROULETTE__DAY_1_AFTER,
    [3] = V_ROULETTE__DAY_2_AFTER,
    [4] = V_ROULETTE__DAY_3_AFTER,
    [5] = V_ROULETTE__DAY_4_AFTER,
    [6] = V_ROULETTE__DAY_5_AFTER,
    [7] = V_ROULETTE__DAY_6_AFTER,
    [8] = V_ROULETTE__DAY_7_AFTER,
    [9] = V_ROULETTE__DAY_8_AFTER,
    [10] = V_ROULETTE__DAY_9_AFTER,
    [11] = V_ROULETTE__DAY_10_AFTER,
    [12] = V_ROULETTE__DAY_11_AFTER,
    [13] = V_ROULETTE__DAY_12_AFTER,
    [14] = V_ROULETTE__DAY_13_AFTER,
    [15] = V_ROULETTE__DAY_14_AFTER,
    [16] = V_ROULETTE__DAY_15_AFTER,
    [17] = V_ROULETTE__DAY_16_AFTER,
    [18] = V_ROULETTE__DAY_17_AFTER,
    [19] = V_ROULETTE__DAY_18_AFTER,
    [20] = V_ROULETTE__DAY_19_AFTER,
    [21] = V_ROULETTE__DAY_20_AFTER,
    [22] = V_ROULETTE__DAY_21_AFTER,
    [23] = V_ROULETTE__DAY_22_AFTER,
    [24] = V_ROULETTE__DAY_23_AFTER,
    [25] = V_ROULETTE__DAY_24_AFTER,
    [26] = V_ROULETTE__DAY_25_AFTER,
    [27] = V_ROULETTE__DAY_26_AFTER,
    [28] = V_ROULETTE__DAY_27_AFTER,
    [29] = V_ROULETTE__DAY_28_AFTER,
    [30] = V_ROULETTE__DAY_29_AFTER
  }
  local dayFirstText = V_ROULETTE__DAY_FIRST
  local dayBgTextDispTbl = {
    [-29] = true,
    [-24] = true,
    [-19] = true,
    [-14] = true,
    [-9] = true,
    [-4] = true,
    [1] = true,
    [4] = true,
    [6] = true,
    [15] = true,
    [20] = true,
    [25] = true,
    [30] = true
  }
  dayBgTextDispTbl[2 - currentDay] = true
  dayBgTextDispTbl[dayMax + 1 - currentDay] = true
  local dayWorkTbl = {}
  for day = 1, dayMax do
    do
      local dayWork = {}
      dayWork.dayNo = day
      dayWork.dayOffs = day - currentDay + 1
      dayWork.dayType = GROUND:GetVWaveForecastType(day - 1)
      dayWork.typeName = typeNameTbl[dayWork.dayType]
      local dayType = typeMarkPtnTbl[dayWork.dayType]
      local prio = 650
      local ofsPara = 0
      dayWork.sprt = SPRITE:CreateSprite("vwaveGrp", "sprDay" .. day)
      dayWork.sprt:SetPattern({
        setName = "vwaveSet",
        ptnName = dayType,
        ofsX = 8,
        ofsY = 0,
        ofsPrio = prio + 1,
        ofsParallax = ofsPara + 0.1
      }, {
        setName = "vwaveSet",
        ptnName = "typeBg",
        ofsX = 0,
        ofsY = 0,
        ofsPrio = prio + 2,
        ofsParallax = ofsPara + 0.1
      })
      dayWork.sprt:SetOption({
        screen = ScreenType.B
      })
      if dayBgTextDispTbl[dayWork.dayOffs] then
        dayWork.sprtDay = SPRITE:CreateSprite("vwaveGrp", "sprDayInf" .. day)
        dayWork.sprtDay:SetPattern({
          setName = "vwaveSet",
          ptnName = dayWork.dayOffs == 1 and "todayBg" or "afterBg",
          ofsX = -84,
          ofsY = -4,
          ofsPrio = prio + 0,
          ofsParallax = ofsPara
        })
        dayWork.sprtDay:SetOption({
          screen = ScreenType.B
        })
      end
      function dayWork:SetOffset(addOffsetY)
        local startY = 76
        local posY = startY + (self.dayNo - 1) * 44 + addOffsetY
        self.lastOffsY = posY
      end
      function dayWork:CursorMove(cursorNow, offs, noEndFlag)
        local cursorNext = cursorNow + offs
        if noEndFlag then
          if self.animEnable ~= true then
            self.animSpeed = 15 * -offs
            self.animSpeedRate = 0.75
            self.animTargetY = cursorNext * -44
            self.animNowY = cursorNow * -44
            self.animEnable = true
          else
            self.animSpeed = 15 * -offs
            self.animSpeedRate = 0.75
            self.animTargetY = cursorNext * -44
            self.animNowY = cursorNow * -44
          end
          self.animEndEdge = false
        else
          self.animSpeed = 15 * -offs
          self.animSpeedRate = 0.8
          self.animTargetY = cursorNext * -44
          self.animNowY = cursorNow * -44
          self.animEndY = cursorNow * -44
          self.animEndEdge = true
          self.animEndSpeed = 15 * -offs
          self.animEnable = true
        end
        local dayIdx = dayWork.dayNo - 1
        local pivotDayIdx = offs > 0 and cursorNow - 1 or cursorNow + 2
        if pivotDayIdx == dayIdx then
          self.animDelayTick = 0
        elseif offs < 0 and dayIdx > pivotDayIdx or offs > 0 and dayIdx < pivotDayIdx then
          local dist = math.abs(dayIdx - pivotDayIdx)
          if dist < 3 then
            self.animDelayTick = dist
          else
            self.animDelayTick = 3
          end
        else
          local dist = math.abs(dayIdx - pivotDayIdx)
          if dist < 3 then
            self.animDelayTick = dist
          else
            self.animDelayTick = 3
          end
        end
      end
      local slowTestTicks = 1
      local slowTestCnt = 0
      function dayWork:Tick()
        local incOk = true
        if slowTestCnt % slowTestTicks ~= 0 then
          incOk = false
        end
        slowTestCnt = slowTestCnt + 1
        local lastAnimEnable = self.animEnable
        if self.animEnable then
          if incOk and self.animEnable and 0 < self.animDelayTick then
            incOk = false
            self.animDelayTick = self.animDelayTick - 1
          end
          local lastY = self.animNowY
          if incOk then
            self.animNowY = self.animNowY + self.animSpeed
            if math.abs(self.animSpeed) > 4 then
              self.animSpeed = self.animSpeed * self.animSpeedRate
            end
          end
          if lastY <= self.animTargetY and self.animTargetY <= self.animNowY or lastY >= self.animTargetY and self.animTargetY >= self.animNowY then
            if self.animEndEdge then
              self.animNowY = self.animTargetY
              self.animTargetY = self.animEndY
              self.animSpeed = -self.animSpeed
              self.animEndEdge = false
            else
              self.animEnable = false
              self.animNowY = self.animTargetY
            end
          end
          self:SetOffset(self.animNowY)
        end
        if not self.animEnable and lastAnimEnable and self.UpdateUpper then
          self:UpdateUpper()
        end
        local nowPosY = self.lastOffsY
        if nowPosY > 16 and nowPosY < 208 then
          TextPutSys:PutText(200, nowPosY - 10, self.typeName)
          if dayBgTextDispTbl[dayWork.dayOffs] then
            local textW = MENU:GetTextWidth(dayBgTextTbl[dayWork.dayOffs])
            TextPutSys:PutText(64 - textW / 2, nowPosY - 12, MENU:GetTextPoolText(dayBgTextTbl[dayWork.dayOffs]))
          end
        end
        if nowPosY > 8 and nowPosY < 232 then
          self.sprt:SetVisible(true)
          if self.sprt then
            self.sprt:SetVisible(true)
          end
          if self.sprtDay then
            self.sprtDay:SetVisible(true)
          end
          local posXY = Vector2(160, nowPosY)
          if self.sprt then
            self.sprt:SetPosition(posXY)
          end
          if self.sprtDay then
            self.sprtDay:SetPosition(posXY)
          end
        else
          if self.sprt then
            self.sprt:SetVisible(false)
          end
          if self.sprtDay then
            self.sprtDay:SetVisible(false)
          end
        end
      end
      dayWorkTbl[day] = dayWork
    end
  end
  function dayWorkTbl:Apply(applyFunc)
    for day = 1, dayMax do
      applyFunc(self[day])
    end
  end
  local alphaBlend = function(a, b, alpha)
    return a * alpha + b * (1 - alpha)
  end
  local upExpWork = {}
  function upExpWork:Set(type, dayOffs)
    local day = currentDay + dayOffs - 1
    local titleIcons = MakePutHorizontalTypeIconsText(4, 2, type, 4) .. MakePutHorizontalTypeIconsText(252, 2, type, 4)
    local expIcons = MakePutVerticalTypeIconsText(0, 0, type, 9) .. MakePutVerticalTypeIconsText(256, 0, type, 9) .. MakePutHorizontalTypeIconsText(0, 0, type, 4) .. MakePutHorizontalTypeIconsText(208, 0, type, 3) .. MakePutHorizontalTypeIconsText(16, 128, type, 15)
    MENU:SetTag_String(0, MENU:ReplaceTagText(dayBgTextTbl[dayOffs]))
    MENU:SetTag_String(1, MENU:ReplaceTagText(typeNameTbl[type]))
    titleBoardMenu:SetText(MENU:ReplaceTagText(typeTitleBaseText .. titleIcons))
    MENU:SetTag_String(0, GROUND:GetVWaveForecastBaseBenefitTextId(day - 1, 0))
    MENU:SetTag_String(1, GROUND:GetVWaveForecastBaseBenefitTextId(day - 1, 1))
    MENU:SetTag_String(2, GROUND:GetVWaveForecastBaseBenefitTextId(day - 1, 2))
    MENU:SetTag_String(3, GROUND:GetVWaveForecastChoiceBenefitTextId(day - 1, 0))
    MENU:SetTag_String(4, GROUND:GetVWaveForecastChoiceBenefitTextId(day - 1, 1))
    expBoardMenu:SetText(MENU:ReplaceTagText(typeExpBaseText .. expIcons))
  end
  function upExpWork:Tick()
  end
  dayWorkTbl:Apply(function(work)
    work:SetOffset((currentDay - 1) * -44)
  end)
  scrollBar:SetOffset((currentDay - 1) * -44)
  upExpWork:Set(dayWorkTbl[currentDay].dayType, dayWorkTbl[currentDay].dayOffs)
  local manageWork = {
    cursorNow = currentDay - 1,
    cursorNext = nil,
    cursorRatio = 0,
    cursorEdge = false
  }
  function manageWork:CursorMove(offs, bRepeat, noSe)
    local cursorNext = self.cursorNow + offs
    if self.cursorNext then
      self.cursorNow = self.cursorNext
      cursorNext = self.cursorNext + offs
    end
    if cursorNext < dayMax and cursorNext >= 0 then
      if self.cursorNext then
        self.cursorNext = cursorNext
      else
        self.cursorNext = cursorNext
        self.animRaito = 0
        self.animDelta = 0.2
      end
      dayWorkTbl:Apply(function(work)
        work:CursorMove(self.cursorNow, offs, true)
      end)
      self.cursorEdge = false
      if not noSe then
        SOUND:PlaySe(SymSnd("SE_SYS_CURSOR"))
      end
    else
      if bRepeat == false then
        self.cursorEdge = false
      end
      self.cursorNow = math.max(math.min(cursorNext, dayMax - 1), 0)
      self.cursorNext = nil
      self.animRaito = 0
      self.animDelta = 0.2
      if not self.cursorEdge then
        dayWorkTbl:Apply(function(work)
          work:CursorMove(self.cursorNow, offs, false)
        end)
        if not noSe then
          SOUND:PlaySe(SymSnd("SE_SYS_CURSOR"))
        end
      end
      self.cursorEdge = true
    end
  end
  function manageWork:CursorMoveToStart()
    if self.cursorNow >= 0 then
      manageWork:CursorMove(currentDay - (self.cursorNow + 1), false, true)
    end
  end
  function manageWork:CursorMoveToDay(toDay)
    if self.cursorNow >= 0 then
      manageWork:CursorMove(toDay - (self.cursorNow + 1), false)
    end
  end
  function manageWork:Tick()
    local offset = 0
    if self.cursorNext then
      self.animRaito = self.animRaito + self.animDelta
      if self.animRaito > 1 then
        self.cursorNow = self.cursorNext
        self.cursorNext = nil
        offset = self.cursorNow * -44
      else
        offset = alphaBlend(self.cursorNext * -44, self.cursorNow * -44, self.animRaito)
      end
    else
      offset = self.cursorNow * -44
    end
    scrollBar:SetOffset(offset)
  end
  local function updateUpperCb(dayWork)
    if dayWork.dayNo == manageWork.cursorNow + 1 then
      local nowDay = manageWork.cursorNow + 1
      upExpWork:Set(dayWorkTbl[nowDay].dayType, dayWorkTbl[nowDay].dayOffs)
    end
  end
  dayWorkTbl:Apply(function(work)
    work.UpdateUpper = updateUpperCb
  end)
  CommonSys:OpenBasicMenu(V_ROULETTE__CAPTION_REPORT, V_ROULETTE__MANUAL_REPORT)
  CommonSys:BeginUpperDarkFilter(false)
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
  MAP:SetVisible(false)
  TASK:Sleep(TimeSec(0))
  local offset = 0
  local lastTouchDay = 0
  while true do
    TextPutSys:ClearText()
    local touchPt = PAD:TouchPointData()
    if PAD:Repeat("(UP|DOWN)") then
      if PAD:Repeat("UP") then
        if PAD:Edge("UP") then
          manageWork:CursorMove(-1, false)
        else
          manageWork:CursorMove(-2, true)
        end
      elseif PAD:Edge("DOWN") then
        manageWork:CursorMove(1, false)
      else
        manageWork:CursorMove(2, true)
      end
    elseif PAD:Edge("(START)") then
      manageWork:CursorMoveToStart()
      SOUND:PlaySe(SymSnd("SE_SYS_DECIDE"))
    elseif PAD:Edge("B") then
      SOUND:PlaySe(SymSnd("SE_SYS_CANCEL"))
      break
    elseif 240 <= touchPt.x then
      if 240 > touchPt.y then
        local toDay = scrollBar:CalcDayFromTouch(touchPt.y)
        if lastTouchDay ~= toDay then
          manageWork:CursorMoveToDay(toDay)
        end
        lastTouchDay = toDay
      else
        lastTouchDay = 0
      end
    end
    manageWork:Tick()
    dayWorkTbl:Apply(function(work)
      work:Tick()
    end)
    TextPutSys:Tick()
    upExpWork:Tick()
    TASK:Sleep(TimeSec(0))
  end
  SCREEN_B:FadeOutAll(TimeSec(0.3), true)
  CommonSys:CloseBasicMenu()
  CommonSys:EndUpperDarkFilter(false)
  collectgarbage("collect")
  MAP:SetVisible(true)
  SPRITE:DestroySprite("upperExpSet")
  SPRITE:DestroyPatternSet("upperExpSet")
  menuBoardWin:Close()
  expBoardMenu:Close()
  titleBoardMenu:Close()
  SPRITE:DestroySpriteGroup("vwaveGrp")
  SPRITE:DestroyPatternSet("vwaveSet")
  SAJI:DestroySajiPlayer("CursorN")
  SAJI:DestroySajiPlayer("CursorD")
end

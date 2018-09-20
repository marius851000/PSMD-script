function OpenGroundEnterDungeonMenu(bNoFadeIn)
  local bPrevMapVisible = MAP:IsVisible()
  SPRITE:DestroySpriteGroup("wordMap")
  SPRITE:DestroySpriteGroup("dgSelectSet")
  SPRITE:DestroyPatternSet("dgEnter")
  SAJI:DestroySajiPlayer("CursorN")
  SAJI:DestroySajiPlayer("CursorD")
  local drawPrioTbl = {
    SEL_SPR = 600,
    WINDOW = 512,
    CURSOR = 400
  }
  local Cursor = {}
  function Cursor:Init()
    SAJI:CreateSajiPlayer("CursorN", "D_SELECT_CURSOR")
    SAJI:CreateSajiPlayer("CursorD", "D_SELECT_CURSOR_C")
    SJ("CursorN"):Play(LOOP.ON)
    SJ("CursorD"):Play(LOOP.ON)
    SJ("CursorN"):SetVisible(false)
    SJ("CursorD"):SetVisible(false)
    SJ("CursorN"):SetDrawPriority(drawPrioTbl.CURSOR)
    SJ("CursorD"):SetDrawPriority(drawPrioTbl.CURSOR)
    SJ("CursorN"):SetParallax(-1)
    SJ("CursorD"):SetParallax(-1)
    SJ("CursorN"):SetScreenType(ScreenType.B)
    SJ("CursorD"):SetScreenType(ScreenType.B)
  end
  function Cursor:Finish()
    SAJI:DestroySajiPlayer("CursorN")
    SAJI:DestroySajiPlayer("CursorD")
  end
  function Cursor:SetVisible(bVisible)
    if bVisible then
      self:PlayWaitAnim()
    else
      SJ("CursorN"):SetVisible(false)
      SJ("CursorD"):SetVisible(false)
    end
  end
  function Cursor:SetPos(idx1, idx2, raito, offsY0, offsY1)
    local y = 50 + 36 * (idx1 - 1) + offsY1
    if raito then
      local y1 = 50 + 36 * (idx1 - 1) + offsY0
      local y2 = 50 + 36 * (idx2 - 1) + offsY1
      y = y2 * raito + y1 * (1 - raito)
    end
    SJ("CursorN"):SetPosition(Vector2(160, y))
    SJ("CursorD"):SetPosition(Vector2(160, y))
  end
  function Cursor:PlayWaitAnim()
    SJ("CursorD"):SetVisible(false)
    SJ("CursorN"):SetVisible(true)
    SJ("CursorN"):Play(LOOP.ON)
  end
  function Cursor:PlayDecideAnim()
    SOUND:PlaySe(SymSnd("SE_SYS_DECIDE_2"), Volume(256))
    SJ("CursorN"):SetVisible(false)
    SJ("CursorD"):SetVisible(true)
    SJ("CursorD"):Play(LOOP.OFF)
  end
  function Cursor:WaitDecideAnim()
    while SJ("CursorD"):IsPause() == false do
      TASK:Sleep(TimeSec(0))
    end
    SJ("CursorD"):SetVisible(false)
  end
  function Cursor:Tick()
  end
  local LRMark = {}
  function LRMark:Init()
    SAJI:CreateSajiPlayer("LMark", "CURSOR_L_LEFT")
    SAJI:CreateSajiPlayer("LMarkD", "CURSOR_L_LEFT_DEC")
    SAJI:CreateSajiPlayer("RMark", "CURSOR_L_RIGHT")
    SAJI:CreateSajiPlayer("RMarkD", "CURSOR_L_RIGHT_DEC")
    self.posLX = 28
    self.posRX = 292
    SJ("LMark"):SetPosition(Vector2(self.posLX, 120))
    SJ("LMarkD"):SetPosition(Vector2(self.posLX, 120))
    SJ("RMark"):SetPosition(Vector2(self.posRX, 120))
    SJ("RMarkD"):SetPosition(Vector2(self.posRX, 120))
    SJ("LMark"):SetVisible(false)
    SJ("LMarkD"):SetVisible(false)
    SJ("RMark"):SetVisible(false)
    SJ("RMarkD"):SetVisible(false)
    SJ("LMark"):SetScreenType(ScreenType.B)
    SJ("LMarkD"):SetScreenType(ScreenType.B)
    SJ("RMark"):SetScreenType(ScreenType.B)
    SJ("RMarkD"):SetScreenType(ScreenType.B)
    SJ("LMark"):SetDrawPriority(drawPrioTbl.CURSOR)
    SJ("LMarkD"):SetDrawPriority(drawPrioTbl.CURSOR)
    SJ("RMark"):SetDrawPriority(drawPrioTbl.CURSOR)
    SJ("RMarkD"):SetDrawPriority(drawPrioTbl.CURSOR)
    self.state = nil
    self.work = {}
  end
  function LRMark:Finish()
    SAJI:DestroySajiPlayer("LMark")
    SAJI:DestroySajiPlayer("LMarkD")
    SAJI:DestroySajiPlayer("RMark")
    SAJI:DestroySajiPlayer("RMarkD")
  end
  function LRMark:SetVisibleL(bVisible)
    if bVisible then
      self:PlayLAnim()
    else
      SJ("LMark"):SetVisible(false)
      SJ("LMarkD"):SetVisible(false)
    end
  end
  function LRMark:SetVisibleR(bVisible)
    if bVisible then
      self:PlayRAnim()
    else
      SJ("RMark"):SetVisible(false)
      SJ("RMarkD"):SetVisible(false)
    end
  end
  function LRMark:PlayLAnim()
    SJ("LMarkD"):SetVisible(false)
    SJ("LMark"):SetVisible(true)
    SJ("LMark"):Play(LOOP.ON)
  end
  function LRMark:PlayRAnim()
    SJ("RMarkD"):SetVisible(false)
    SJ("RMark"):SetVisible(true)
    SJ("RMark"):Play(LOOP.ON)
  end
  function LRMark:PlayLDecideAnim()
    SJ("LMark"):SetVisible(false)
    SJ("LMarkD"):SetVisible(true)
    SJ("LMarkD"):Play(LOOP.OFF)
    SJ("LMarkD"):SetScale(Scale(1.5))
  end
  function LRMark:PlayRDecideAnim()
    SJ("RMark"):SetVisible(false)
    SJ("RMarkD"):SetVisible(true)
    SJ("RMarkD"):Play(LOOP.OFF)
    SJ("RMarkD"):SetScale(Scale(1.5))
  end
  function LRMark:Move(movDir)
    self.state = "Decide"
    self.work.movDir = movDir > 0 and 1 or -1
    if self.work.movDir > 0 then
      self.work.markD = SJ("RMarkD")
      self.work.mark = SJ("RMark")
      self.work.markUn = SJ("LMark")
      self.work.posX = self.posRX
      self.work.posXUn = self.posLX
      self.work.decAnimFunc = self.PlayRDecideAnim
    else
      self.work.markD = SJ("LMarkD")
      self.work.mark = SJ("LMark")
      self.work.markUn = SJ("RMark")
      self.work.posX = self.posLX
      self.work.posXUn = self.posRX
      self.work.decAnimFunc = self.PlayLDecideAnim
    end
  end
  function LRMark:Reset()
    self:SetVisibleL(false)
    self:SetVisibleR(false)
    if self.work then
      if self.work.markD then
        self.work.markD:SetPosition(Vector2(self.work.posX, 120))
      end
      if self.work.mark then
        self.work.mark:SetScale(Scale(1))
      end
      if self.work.markUn then
        self.work.markUn:SetScale(Scale(1))
      end
      if self.work.markUn then
        self.work.markUn:SetPosition(Vector2(self.work.posXUn, 120))
      end
    end
    self.state = nil
  end
  function LRMark:Tick()
    local work = self.work
    if self.state == "Decide" then
      work.decAnimFunc(self)
      self.state = "Move"
      work.cnt = 1
    elseif self.state == "Move" then
      if work.markD:IsVisible() and work.markD:IsPause() then
        work.markD:SetVisible(false)
        work.markUn:SetVisible(false)
        self.state = "Wait"
        work.delay = 1
        work.cnt = 1
      else
        work.markD:SetPosition(Vector2(work.posX + work.cnt * 8 * work.movDir, 120))
        work.markUn:SetPosition(Vector2(work.posXUn - work.cnt * 12 * work.movDir + work.movDir * -10, 120))
        work.markUn:SetScale(Scale(0.8))
        work.cnt = work.cnt + 1
      end
    elseif self.state == "Wait" then
      if work.delay > 0 then
        work.delay = work.delay - 1
        work.cnt = work.cnt + 1
        if work.delay == 0 then
          self.state = "Retern"
          work.cnt = 1
        end
      end
    elseif self.state == "Retern" then
      local time = 3
      self:SetVisibleL(true)
      self:SetVisibleR(true)
      local t = (time - work.cnt) / time
      t = t * t
      work.mark:SetPosition(Vector2(work.posX + t * 64 * work.movDir, 120))
      work.markUn:SetPosition(Vector2(work.posXUn - t * 64 * work.movDir, 120))
      work.mark:SetScale(Scale(0.5))
      work.markUn:SetScale(Scale(0.5))
      if time <= work.cnt then
        self:SetVisibleL(true)
        self:SetVisibleR(true)
        work.markD:SetPosition(Vector2(work.posX, 120))
        work.mark:SetScale(Scale(1))
        work.markUn:SetScale(Scale(1))
        work.markUn:SetPosition(Vector2(work.posXUn, 120))
        self.state = nil
      end
      work.cnt = work.cnt + 1
    end
  end
  local TextPutSys = {drawText = ""}
  function TextPutSys:Init()
    self.menuBoardWin = MENU:CreateBoardMenuWindow(ScreenType.B)
    self.menuBoardWin:SetLayoutRect(Rectangle(0, 0, 320, 240))
    self.menuBoardWin:SetTextOffset(-160, -160)
    self.menuBoardWin:Open()
    self.menuBoardWin:SetOption({font = "FONT_16", showBgFrame = false})
  end
  function TextPutSys:Finish()
    self.menuBoardWin:Close()
    self.menuBoardWin = nil
  end
  function TextPutSys:SetVisible(bVisible)
    self.menuBoardWin:SetVisible(bVisible)
  end
  function TextPutSys:ClearText()
    self.drawText = ""
  end
  function TextPutSys:PutText(x, y, text)
    self.drawText = self.drawText .. string.format("[HO:%d][VO:%d]%s", x + 160, y + 160, text)
  end
  function TextPutSys:Tick()
    self.menuBoardWin:SetText(self.drawText)
  end
  local WorldMapSys = {}
  function WorldMapSys:Init()
    self.mapSprt = SPRITE:CreateSprite("wordMap", "map")
    GROUND:CreateWorldMapNavigation()
    self.mapSprt:SetPosition(Vector2(200, 120))
    self.mapSprt:SetOption({
      screen = ScreenType.A
    })
    self.mapSprt:SetVisible(false)
  end
  function WorldMapSys:Finish()
    GROUND:DestroyWorldMapNavigation()
  end
  function WorldMapSys:Tick(id)
    GROUND:SetWorldMapNavigationCursorPosition(id)
  end
  function WorldMapSys:SetVisible(bVisible)
    self.mapSprt:SetVisible(bVisible)
  end
  local SelPosY = 50
  local SelectSet = {}
  function SelectSet:Init()
    self.selSetSprtTbl = {
      {},
      {}
    }
    for slot = 1, 2 do
      for ii = 1, 5 do
        local sprt = SPRITE:CreateSprite("dgSelectSet", string.format("selSetSprt%d_%d", slot, ii))
        sprt:SetPosition(Vector2(160, SelPosY + 36 * (ii - 1)))
        sprt:SetOption({
          screen = ScreenType.B
        })
        table.insert(self.selSetSprtTbl[slot], sprt)
      end
      self.selSetSprtTbl[slot].sajiTbl = {}
      self.selSetSprtTbl[slot].sajiSymbolTbl = {}
      for ii = 1, 5 do
        local sajiSymbol = "NEW_" .. slot .. "" .. ii .. ""
        local eLanguageType = SYSTEM:GetLanguageType()
        if eLanguageType == LANGUAGE_TYPE.FR then
          SAJI:CreateSajiPlayer(sajiSymbol, "NEW_M_FR")
        elseif eLanguageType == LANGUAGE_TYPE.GE then
          SAJI:CreateSajiPlayer(sajiSymbol, "NEW_M_GE")
        elseif eLanguageType == LANGUAGE_TYPE.IT then
          SAJI:CreateSajiPlayer(sajiSymbol, "NEW_M_IT")
        elseif eLanguageType == LANGUAGE_TYPE.SP then
          SAJI:CreateSajiPlayer(sajiSymbol, "NEW_M_SP")
        else
          SAJI:CreateSajiPlayer(sajiSymbol, "NEW_M")
        end
        SJ(sajiSymbol):SetScreenType(ScreenType.B)
        table.insert(self.selSetSprtTbl[slot].sajiTbl, SJ(sajiSymbol))
        table.insert(self.selSetSprtTbl[slot].sajiSymbolTbl, sajiSymbol)
      end
    end
    self.selSetIdx = 1
    self.tgtRowIdx = 1
    self.nowRowIdx = 1
    self.tgtPageIdx = 1
    self.nowPageIdx = 1
    self.animRowRaito = 0
    self.animRowDelta = 0
    self.dgIndexTbl = {}
    for dgIndex in GROUND:EnumerateOpenDungeon() do
      table.insert(self.dgIndexTbl, dgIndex)
    end
    local dgIdxCompF = function(a, b)
      local keyA = GROUND:GetDungeonSortKey(a)
      local keyB = GROUND:GetDungeonSortKey(b)
      if keyA < keyB then
        return true
      elseif keyA > keyB then
        return false
      else
        return a < b
      end
    end
    table.sort(self.dgIndexTbl, dgIdxCompF)
    self.dgNameTbl = {}
    self.dgNameWidthTbl = {}
    self.dgFushigiNameTbl = {}
    for i, dgIndex in ipairs(self.dgIndexTbl) do
      MENU:SetTag_DungeonIndex(0, dgIndex, DungeonNameType.FULL_KANJI)
      local dgName = MENU:ReplaceTagText("[FT:1][st_dungeon:0][FR]")
      table.insert(self.dgNameTbl, dgName)
      table.insert(self.dgNameWidthTbl, MENU:GetTextWidth(dgName))
      MENU:SetTag_Fhushigido(0, dgIndex)
      local dgFushigiName = MENU:ReplaceTagText("[string:0]")
      table.insert(self.dgFushigiNameTbl, dgFushigiName)
    end
    self:UpdateSprt(1, 1)
    self:UpdateText(1, 1)
  end
  function SelectSet:Finish()
    SPRITE:DestroySpriteGroup("dgSelectSet")
    for i, setTbl in ipairs(self.selSetSprtTbl) do
      for i, sajiSymbol in ipairs(setTbl.sajiSymbolTbl) do
        SAJI:DestroySajiPlayer(sajiSymbol)
      end
    end
  end
  function SelectSet:SetVisible(bVisible)
    if bVisible then
      self:UpdateSprt(self.tgtPageIdx, 1)
      self:UpdateText(self.tgtPageIdx, 1)
      if #self.dgIndexTbl > 5 then
        LRMark:SetVisibleL(true)
        LRMark:SetVisibleR(true)
      end
    else
      for i, setTbl in ipairs(self.selSetSprtTbl) do
        for i, sprt in ipairs(setTbl) do
          sprt:SetVisible(false)
        end
      end
      for i, setTbl in ipairs(self.selSetSprtTbl) do
        for i, saji in ipairs(setTbl.sajiTbl) do
          saji:SetVisible(false)
        end
      end
      if #self.dgIndexTbl > 5 then
        LRMark:SetVisibleL(false)
        LRMark:SetVisibleR(false)
      end
    end
  end
  function SelectSet:SetCursor(cursorIdx)
    self.tgtRowIdx = (cursorIdx - 1) % 5 + 1
    self.nowRowIdx = (cursorIdx - 1) % 5 + 1
    self.tgtPageIdx = math.floor((cursorIdx - 1) / 5) + 1
    self.nowPageIdx = math.floor((cursorIdx - 1) / 5) + 1
    self.animRowRaito = 0
    self.animRowDelta = 0
    self.animPageRaito = 0
    self.animPageDelta = 0
  end
  function SelectSet:SetDefaultStoryCursor()
    self:SetCursor(1)
    for i, dgIndex in ipairs(self.dgIndexTbl) do
      SYSTEM:DebugPrint(string.format("check cursor=%d %d\n", i, dgIndex))
      if GROUND:IsStoryDungeon(dgIndex) then
        SYSTEM:DebugPrint(string.format("cursor=%d %d\n", i, dgIndex))
        self:SetCursor(i)
        break
      end
    end
  end
  function SelectSet:CursorUpDown(mov, bSePlay)
    local pageStartIdx = (self.tgtPageIdx - 1) * 5 + 1
    local bottomRowIdx = 5
    if bottomRowIdx > #self.dgIndexTbl - pageStartIdx + 1 then
      bottomRowIdx = #self.dgIndexTbl - pageStartIdx + 1
    end
    self.tgtRowIdx = self.tgtRowIdx + mov
    if 1 > self.tgtRowIdx then
      self.tgtRowIdx = bottomRowIdx
    elseif bottomRowIdx < self.tgtRowIdx then
      self.tgtRowIdx = 1
    end
    if self.animRowDelta == 0 then
      self.animRowRaito = 0
      self.animRowDelta = 0.4
    else
      self.animRowRaito = 0
      self.animRowDelta = 0.7
    end
    if bSePlay then
      SOUND:PlaySe(SymSnd("SE_SYS_SLIDE"), Volume(256))
    end
  end
  function SelectSet:CursorPage(mov)
    local endPageIdx = math.floor((#self.dgIndexTbl + 4) / 5)
    if endPageIdx == 1 then
      return
    end
    if self.animPageDelta ~= 0 then
      self.nowPageIdx = self.tgtPageIdx
    end
    self.tgtPageIdx = self.tgtPageIdx + mov
    if 1 > self.tgtPageIdx then
      self.tgtPageIdx = endPageIdx
    elseif endPageIdx < self.tgtPageIdx then
      self.tgtPageIdx = 1
    end
    local rowNumNow = math.min(#self.dgIndexTbl - (self.nowPageIdx - 1) * 5, 5)
    local rowNumTgt = math.min(#self.dgIndexTbl - (self.tgtPageIdx - 1) * 5, 5)
    if rowNumNow ~= 5 then
      local next5RowTbl = {}
      next5RowTbl[1] = {3}
      next5RowTbl[2] = {2, 3}
      next5RowTbl[3] = {
        2,
        3,
        4
      }
      next5RowTbl[4] = {
        1,
        2,
        3,
        4
      }
      SelectSet:CursorUpDown(next5RowTbl[rowNumNow][self.tgtRowIdx] - self.tgtRowIdx, false)
    elseif rowNumTgt ~= 5 then
      local from5RowTbl = {}
      from5RowTbl[1] = {
        1,
        1,
        1,
        1,
        1
      }
      from5RowTbl[2] = {
        1,
        1,
        2,
        2,
        2
      }
      from5RowTbl[3] = {
        1,
        1,
        2,
        3,
        3
      }
      from5RowTbl[4] = {
        1,
        2,
        3,
        4,
        4
      }
      SelectSet:CursorUpDown(from5RowTbl[rowNumTgt][self.tgtRowIdx] - self.tgtRowIdx, false)
    end
    self:UpdateSprt(self.tgtPageIdx, 1)
    self:UpdateSprt(self.nowPageIdx, 2)
    if self.animPageDelta == 0 then
      self.animPageRaito = 0
      self.animPageDelta = 0.17
    else
      self.animPageRaito = 0
      self.animPageDelta = 0.3
    end
    self.animPageDir = mov < 0 and 1 or -1
    LRMark:Move(self.animPageDir)
    SOUND:PlaySe(SymSnd("SE_SYS_SLIDE"), Volume(256))
  end
  function SelectSet:SelectOk()
    local cursorIdx = self.tgtRowIdx + (self.tgtPageIdx - 1) * 5
    Cursor:PlayDecideAnim()
    Cursor:WaitDecideAnim()
    return self.dgIndexTbl[cursorIdx]
  end
  function SelectSet:GetSelectDgIndex()
    local cursorIdx = self.tgtRowIdx + (self.tgtPageIdx - 1) * 5
    return self.dgIndexTbl[cursorIdx]
  end
  function SelectSet:UpdateSprt(startPageIdx, tgtSlot)
    local startIdx = (startPageIdx - 1) * 5 + 1
    local num = #self.dgIndexTbl - startIdx + 1
    if num > 5 then
      num = 5
    end
    local centerOffsY = (180 - 36 * num) / 2
    for idx = startIdx, startIdx + 4 do
      local sprt = self.selSetSprtTbl[tgtSlot][idx - startIdx + 1]
      sprt:SetPosition(Vector2(160, SelPosY + 36 * (idx - startIdx) + centerOffsY))
      if idx <= #self.dgIndexTbl then
        if self.dgIndexTbl[idx] > 100 then
          sprt:SetPattern({
            setName = "dgEnter",
            ptnName = "dlcSel",
            ofsPrio = drawPrioTbl.SEL_SPR
          })
        elseif GROUND:IsStoryDungeon(self.dgIndexTbl[idx]) then
          sprt:SetPattern({
            setName = "dgEnter",
            ptnName = "storySel",
            ofsPrio = drawPrioTbl.SEL_SPR
          })
        else
          sprt:SetPattern({
            setName = "dgEnter",
            ptnName = "normalSel",
            ofsPrio = drawPrioTbl.SEL_SPR
          })
        end
        sprt:SetVisible(true)
      else
        sprt:SetVisible(false)
      end
      local saji = self.selSetSprtTbl[tgtSlot].sajiTbl[idx - startIdx + 1]
      local dlcOffs = 0
      if idx <= #self.dgIndexTbl and self.dgIndexTbl[idx] > 100 then
        dlcOffs = -24
      end
      saji:SetPosition(Vector2(60 + dlcOffs, SelPosY + 36 * (idx - startIdx) + centerOffsY))
      if idx <= #self.dgIndexTbl then
        if SYSTEM:IsDungeonEnterLog(self.dgIndexTbl[idx]) == true then
          saji:SetVisible(false)
        else
          saji:SetVisible(true)
          saji:Play(LOOP.ON)
        end
      else
        saji:SetVisible(false)
      end
    end
  end
  function SelectSet:UpdateText(startPageIdx, tgtSlot, offsX)
    if offsX == nil then
      offsX = 0
    end
    local startIdx = (startPageIdx - 1) * 5 + 1
    local num = #self.dgIndexTbl - startIdx + 1
    if num > 5 then
      num = 5
    end
    local centerOffsY = (180 - 36 * num) / 2
    for idx = startIdx, startIdx + 4 do
      if idx <= #self.dgIndexTbl then
        local dgName = self.dgNameTbl[idx]
        local dgFushigiName = self.dgFushigiNameTbl[idx]
        local x = (320 - self.dgNameWidthTbl[idx]) / 2 + offsX
        local y = SelPosY - 16 + 8 + 36 * (idx - startIdx) + centerOffsY
        TextPutSys:PutText(x, y, dgName)
        TextPutSys:PutText(offsX + 236 + 12, y, dgFushigiName)
        if self.dgIndexTbl[idx] > 100 then
          TextPutSys:PutText(offsX + 64, y, "[M:DLCD]")
        end
      end
    end
  end
  function SelectSet:MoveSprt(tgtSlot, offsX, pageIdx)
    for idx = 1, 5 do
      local sprt = self.selSetSprtTbl[tgtSlot][idx]
      local pos = sprt:GetPosition()
      pos.x = 160 + offsX
      sprt:SetPosition(pos)
      local saji = self.selSetSprtTbl[tgtSlot].sajiTbl[idx]
      local dlcOffs = 0
      local dgTblIdx = (pageIdx - 1) * 5 + 1 + (idx - 1)
      if dgTblIdx <= #self.dgIndexTbl and self.dgIndexTbl[dgTblIdx] > 100 then
        dlcOffs = -24
      end
      saji:SetPosition(Vector2(pos.x + -100 + dlcOffs, pos.y))
    end
  end
  function SelectSet:SetVisibleSprt(tgtSlot, bVisible)
    for idx = 1, 5 do
      local sprt = self.selSetSprtTbl[tgtSlot][idx]
      sprt:SetVisible(bVisible)
      local saji = self.selSetSprtTbl[tgtSlot].sajiTbl[idx]
      saji:SetVisible(bVisible)
    end
  end
  function SelectSet:IsNowAnim()
    if self.animRowRaito ~= 0 then
      return true
    end
    if self.animPageRaito ~= 0 then
      return true
    end
    return false
  end
  function SelectSet:SetAlpha(alpha)
    for slot = 1, 2 do
      for ii = 1, 5 do
        local sprt = self.selSetSprtTbl[slot][ii]
        sprt:SetOption({alpha = alpha})
      end
    end
  end
  function SelectSet:Tick()
    if self.animRowDelta ~= 0 then
      self.animRowRaito = self.animRowRaito + self.animRowDelta
      if self.animRowRaito >= 1 then
        self.animRowDelta = 0
        self.animRowRaito = 1
      end
    end
    if self.animRowRaito == 1 then
      self.nowRowIdx = self.tgtRowIdx
      self.animRowRaito = 0
    end
    local edge = false
    if self.animPageDelta ~= 0 then
      self.animPageRaito = self.animPageRaito + self.animPageDelta
      Cursor:SetVisible(false)
      if 1 <= self.animPageRaito then
        Cursor:SetVisible(true)
        self.animPageDelta = 0
        self.animPageRaito = 1
        edge = true
      end
    end
    if self.animPageRaito == 1 then
      self.nowPageIdx = self.tgtPageIdx
      self.animPageRaito = 0
    end
    if self.animPageDelta ~= 0 then
      local offsX1 = self.animPageDir * -(1 - self.animPageRaito) * 272
      local offsX2 = self.animPageDir * self.animPageRaito * 272
      self:MoveSprt(1, offsX1, self.tgtPageIdx)
      self:MoveSprt(2, offsX2, self.nowPageIdx)
      TextPutSys:ClearText()
      self:UpdateText(self.tgtPageIdx, 1, offsX1)
      self:UpdateText(self.nowPageIdx, 2, offsX2)
    end
    if edge then
      TextPutSys:ClearText()
      self:MoveSprt(1, 0, self.tgtPageIdx)
      self:SetVisibleSprt(2, false)
      self:UpdateText(self.tgtPageIdx, 1)
    end
    local rowNum0 = #self.dgIndexTbl - (self.nowPageIdx - 1) * 5
    local rowNum1 = #self.dgIndexTbl - (self.tgtPageIdx - 1) * 5
    if rowNum0 > 5 then
      rowNum0 = 5
    end
    if rowNum1 > 5 then
      rowNum1 = 5
    end
    local offsY0 = (180 - 36 * rowNum0) / 2
    local offsY1 = (180 - 36 * rowNum1) / 2
    Cursor:SetPos(self.nowRowIdx, self.tgtRowIdx, self.animRowRaito, offsY0, offsY1)
  end
  selectMenu = {}
  function selectMenu:Start()
    SPRITE:CreatePatternSet("dgEnter", {
      name = "normalSel",
      img = "D_SELECT_FRAME",
      u = 0,
      v = 0,
      w = 224,
      h = 32,
      cx = 112,
      cy = 16,
      allocateFromMap = true
    }, {
      name = "storySel",
      img = "D_SELECT_FRAME",
      u = 0,
      v = 32,
      w = 224,
      h = 32,
      cx = 112,
      cy = 16,
      allocateFromMap = true
    }, {
      name = "dlcSel",
      img = "D_SELECT_FRAME",
      u = 0,
      v = 64,
      w = 224,
      h = 32,
      cx = 112,
      cy = 16,
      allocateFromMap = true
    })
    TextPutSys:Init()
    WorldMapSys:Init()
    Cursor:Init()
    LRMark:Init()
    SelectSet:Init()
    TextPutSys:SetVisible(false)
    Cursor:SetVisible(false)
    SelectSet:SetVisible(false)
    SelectSet:SetDefaultStoryCursor()
    TextPutSys:ClearText()
  end
  function selectMenu:Finish()
    SelectSet:Finish()
    LRMark:Finish()
    Cursor:Finish()
    WorldMapSys:Finish()
    TextPutSys:Finish()
    SPRITE:DestroySpriteGroup("dgEnter")
    SPRITE:DestroyPatternSet("dgEnter")
  end
  function selectMenu:Wait()
    TASK:Sleep(TimeSec(2, TIME_TYPE.FRAME))
    LRMark:Reset()
    TextPutSys:ClearText()
    TextPutSys:SetVisible(true)
    SelectSet:SetVisible(true)
    Cursor:SetVisible(true)
    local isStartKeyRelease = not PAD:Data("(RIGHT|LEFT|UP|DOWN)")
    local retSelectDg
    while true do
      if isStartKeyRelease and PAD:Repeat("UP") then
        SelectSet:CursorUpDown(-1, true)
      elseif isStartKeyRelease and PAD:Repeat("(DOWN)") then
        SelectSet:CursorUpDown(1, true)
      elseif isStartKeyRelease and PAD:Repeat("(RIGHT)") then
        SelectSet:CursorPage(1)
      elseif isStartKeyRelease and PAD:Repeat("(LEFT)") then
        SelectSet:CursorPage(-1)
      elseif PAD:Edge("A") and SelectSet:IsNowAnim() == false then
        retSelectDg = SelectSet:SelectOk()
        break
      elseif PAD:Edge("B") then
        retSelectDg = nil
        break
      end
      if not isStartKeyRelease and not PAD:Data("(RIGHT|LEFT|UP|DOWN)") then
        isStartKeyRelease = true
      end
      LRMark:Tick()
      SelectSet:Tick()
      WorldMapSys:Tick(SelectSet:GetSelectDgIndex())
      TextPutSys:Tick()
      TASK:Sleep(TimeSec(0))
    end
    TextPutSys:SetVisible(false)
    SelectSet:SetVisible(false)
    Cursor:SetVisible(false)
    return retSelectDg
  end
  SCREEN_A:FadeOutAll(TimeSec(0.5), false)
  SCREEN_B:FadeOutAll(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0))
  FlowSys:Start()
  ShopSys:Start()
  selectMenu:Start()
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_CROSS_ROAD")
  SCREEN_B:SetVisibleWallpaper(true)
  WorldMapSys:SetVisible(true)
  MAP:SetVisible(false)
  SCREEN_A:FadeInAll(TimeSec(0.5), false)
  SCREEN_B:FadeInAll(TimeSec(0.5), false)
  local selectedDg
  function FlowSys.Proc.dungeonMenuOpen()
    WINDOW:SetStartKeyOffWait(true)
    WINDOW:SystemLetter(1715209154)
    WINDOW:CloseMessage()
    CommonSys:OpenBasicMenu(-1428917858, 763546919, nil)
    local selectDg = selectMenu:Wait()
    CommonSys:CloseBasicMenu()
    if selectDg then
      FlowSys.Stat.selectDungeonIndex = selectDg
      FlowSys:Next("dungeonEnterAsk")
    else
      SOUND:PlaySe(SymSnd("SE_SYS_CANCEL"), Volume(256))
      FlowSys.Stat.selectDungeonIndex = nil
      FlowSys:Next("dungeonFadeOut", "dungeonMenuEnd")
    end
  end
  local memberSelectFlag
  function FlowSys.Proc.dungeonEnterAsk()
    selectedDg = nil
    memberSelectFlag = false
    WINDOW:SetMessageScreenMode(ScreenType.B)
    MENU:SetTag_DungeonIndex(0, FlowSys.Stat.selectDungeonIndex)
    if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true then
      ShopSys:SetShopTag("\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\229\144\141", FUNC_COMMON:GetDungeonShortKanjiName(FlowSys.Stat.selectDungeonIndex))
      ShopSys:SysMsgAskFlowNoClose(CROSSRODE_GO_DUNGEON__DUNGEON_GO, {cursorReset = true}, {
        next = "dungeonMenuOpen"
      }, {
        text = CROSSRODE_GO_DUNGEON__DUNGEON_GO_YES,
        next = "dungeonEnter"
      }, {
        text = CROSSRODE_GO_DUNGEON__DUNGEON_GO_NO,
        next = "dungeonMenuOpen"
      }, {
        text = CROSSRODE_GO_DUNGEON__DUNGEON_GO_MEMBER,
        next = "dungeonEnter",
        actTbl = {
          decideAction = function(self)
            memberSelectFlag = true
          end
        }
      })
    else
      ShopSys:SetShopTag("\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\229\144\141", FUNC_COMMON:GetDungeonShortKanjiName(FlowSys.Stat.selectDungeonIndex))
      ShopSys:SysMsgAskFlowNoClose(CROSSRODE_GO_DUNGEON__DUNGEON_GO, {cursorReset = true}, {
        next = "dungeonMenuOpen"
      }, {
        text = CROSSRODE_GO_DUNGEON__DUNGEON_GO_YES,
        next = "dungeonEnter"
      }, {
        text = CROSSRODE_GO_DUNGEON__DUNGEON_GO_NO,
        next = "dungeonMenuOpen"
      })
    end
    WINDOW:SetMessageScreenMode(ScreenType.A)
  end
  function FlowSys.Proc.dungeonNoDungeon()
    WINDOW:SysMsg(964415226)
    WINDOW:CloseMessage()
    FlowSys:Next("dungeonMenuEnd")
  end
  function FlowSys.Proc.dungeonEnter()
    selectedDg = FlowSys.Stat.selectDungeonIndex
    if LUA_SYSTEM:CheckPreEnterDlcDungeon(Dg(selectedDg)) == false then
      selectedDg = nil
      FlowSys.Stat.selectDungeonIndex = nil
      FlowSys:Next("dungeonFadeOut", "dungeonMenuEnd")
      return
    end
    if memberSelectFlag == true then
      SAVEPARTY()
    end
    FlowSys:Next("dungeonFadeOut", "limitCheck")
  end
  function FlowSys.Proc.dungeonFadeOut(next)
    if selectedDg ~= nil then
      EFFECT:SpotWipeOut(TimeSec(0.5), false)
      SCREEN_B:FadeOutAll(TimeSec(0.5), false)
      EFFECT:SpotWipeWait()
      EFFECT:SpotWipeIn(TimeSec(0), false)
      SCREEN_A:FadeOutAll(TimeSec(0), false)
      SCREEN_B:FadeOutAll(TimeSec(0), false)
    else
      SCREEN_A:FadeOutAll(TimeSec(0.5), false)
      SCREEN_B:FadeOutAll(TimeSec(0.5), true)
      TASK:Sleep(TimeSec(0))
    end
    FlowSys:Next(next)
  end
  local isCondition, isItemMoney, isMember, isLevelReset, numLimitNum
  local function limit()
    isCondition = false
    isItemMoney = false
    isMember = false
    isLevelReset = false
    numLimitNum = 4
    CheckDungeonLimit(selectedDg, function()
      isCondition = true
    end, function()
      isCondition = false
    end, function()
      isCondition = false
    end, function()
      isCondition = false
    end)
    if isCondition == false then
      CheckDungeonLimit(selectedDg, function()
      end, function()
        isItemMoney = true
      end, nil, nil)
      CheckDungeonLimit(selectedDg, function()
      end, nil, function(limitNum)
        isMember = true
        numLimitNum = limitNum
      end, nil)
      CheckDungeonLimit(selectedDg, function()
      end, nil, nil, function()
        isLevelReset = true
      end)
    end
  end
  function FlowSys.Proc.limitCheck()
    limit()
    if isItemMoney == true and isMember == true and numLimitNum ~= 1 then
      if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true then
        FlowSys:Next("pokemonSelectIn", "limitCheckErrItem")
        return
      else
        FlowSys:Next("pokemonSelectIn", "limitCheckErrAll")
        return
      end
    end
    if isItemMoney == true then
      FlowSys:Next("pokemonSelectIn", "limitCheckErrItem")
      return
    end
    if GROUND:GetDungeonPartyLimitCount(selectedDg) == 1 then
      SAVEPARTY()
      if isMember == true and numLimitNum == 1 then
        MENU:LoadMenuTextPool("message/shop.bin", true)
        FlowSys:Next("pokemonSelectIn", "pokemonSelectLeaderInit")
        return
      elseif isLevelReset == true then
        FlowSys:Next("limitCheckWarningOneLv")
      else
        FlowSys:Next("dungeonMenuEnd")
        return
      end
    end
    if memberSelectFlag == true then
      MENU:LoadMenuTextPool("message/shop.bin", true)
      memberSelectFlag = false
      FlowSys:Next("pokemonSelectIn", "pokemonSelectAllClear")
      return
    end
    FlowSys:Next("limitCheckBack")
  end
  function FlowSys.Proc.limitCheckBack()
    limit()
    if isMember == true then
      if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true then
        FlowSys:Next("pokemonSelectIn", "limitCheckErrMemberCount2")
      else
        FlowSys:Next("pokemonSelectIn", "limitCheckErrMemberCount")
      end
      return
    end
    if isLevelReset == true then
      FlowSys:Next("pokemonSelectIn", "limitCheckWarningOneLv")
      return
    end
    FlowSys:Next("dungeonMenuEnd")
  end
  function FlowSys.Proc.limitCheck2()
    CheckDungeonLimit(selectedDg, function()
      FlowSys:Next("pokemonSelectOut2", "dungeonMenuEnd")
    end, nil, function(limitNum)
      numLimitNum = limitNum
      FlowSys:Next("limitCheckErrMemberCount2")
    end, nil)
  end
  function FlowSys.Proc.limitCheckErrAll()
    MENU:SetTag_Value(0, numLimitNum)
    ShopSys:SetShopTag("\229\136\182\233\153\144\229\140\185\230\149\176", MENU:ReplaceTagText("[value_b:0]"))
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_GO_STOPPER_ALL)
    WINDOW:CloseMessage()
    selectedDg = nil
    FlowSys:Next("pokemonSelectOut", "dungeonMenuEnd")
  end
  function FlowSys.Proc.limitCheckErrItem()
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_GO_STOPPER_ITEM)
    WINDOW:CloseMessage()
    selectedDg = nil
    FlowSys:Next("pokemonSelectOut", "dungeonMenuEnd")
  end
  function FlowSys.Proc.limitCheckErrMemberCount()
    MENU:SetTag_Value(0, numLimitNum)
    ShopSys:SetShopTag("\229\136\182\233\153\144\229\140\185\230\149\176", MENU:ReplaceTagText("[value_b:0]"))
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_GO_STOPPER_MEMBER_COUNT)
    WINDOW:CloseMessage()
    selectedDg = nil
    FlowSys:Next("pokemonSelectOut", "dungeonMenuEnd")
  end
  function FlowSys.Proc.limitCheckErrMemberCount2()
    MENU:SetTag_Value(0, numLimitNum)
    ShopSys:SetShopTag("\229\136\182\233\153\144\229\140\185\230\149\176", MENU:ReplaceTagText("[value_b:0]"))
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_GO_STOPPER_MEMBER_COUNT_ALL_CLEAR)
    WINDOW:CloseMessage()
    FlowSys:Next("pokemonSelectAllClear")
  end
  function FlowSys.Proc.limitCheckWarningOneLv()
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_GO_ASSERT)
    WINDOW:CloseMessage()
    FlowSys:Next("pokemonSelectOut", "dungeonMenuEnd")
  end
  local isMemberWindow
  local menuMemberWindow = {}
  local numMemberWindow = 0
  local function deleteMemberWindow()
    if isMemberWindow then
      isMemberWindow = nil
      for i = 1, numMemberWindow do
        menuMemberWindow[i]:Close()
      end
    end
  end
  local function createMemberWindow()
    local test_tbl = {
      Point(17, 40),
      Point(169, 40),
      Point(17, 128),
      Point(169, 128)
    }
    if isMemberWindow then
      deleteMemberWindow()
    end
    isMemberWindow = true
    numMemberWindow = GROUND:GetPartyMemberCount()
    for i = 1, numMemberWindow do
      menuMemberWindow[i] = MENU:CreatePartyMemberWindow()
      menuMemberWindow[i]:SetLayoutPosition(test_tbl[i].x, test_tbl[i].y)
      menuMemberWindow[i]:SetMemberId(i - 1)
      menuMemberWindow[i]:SetOption({Type = "PARTY"})
      menuMemberWindow[i]:Open()
    end
  end
  function FlowSys.Proc.pokemonSelectIn(next)
    WINDOW:CloseMessage()
    selectMenu:Finish()
    SCREEN_A:FadeOut(TimeSec(0), true)
    SCREEN_A:FadeInAll(TimeSec(0.5), false)
    SCREEN_B:FadeInAll(TimeSec(0.5), true)
    TASK:Sleep(TimeSec(0))
    FlowSys:Next(next)
  end
  function FlowSys.Proc.pokemonSelectOut(next)
    SCREEN_A:FadeOutAll(TimeSec(0.5), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    SCREEN_A:FadeIn(TimeSec(0), false)
    TASK:Sleep(TimeSec(0))
    selectMenu:Start()
    FlowSys:Next(next)
  end
  function FlowSys.Proc.pokemonSelectOut2(next)
    SCREEN_A:FadeOut(TimeSec(0), false)
    SCREEN_B:FadeOutAll(TimeSec(0.5), true)
    TASK:Sleep(TimeSec(0))
    selectMenu:Start()
    FlowSys:Next(next)
  end
  function FlowSys.Proc.pokemonSelectCancel(next)
    LOADPARTY()
    SCREEN_A:FadeIn(TimeSec(0.5), false)
    SCREEN_A:FadeInAll(TimeSec(0.5), false)
    selectedDg = nil
    selectMenu:Start()
    FlowSys:Next("dungeonMenuOpen")
  end
  function FlowSys.Proc.pokemonSelectLeaderInit()
    FlowSys:Next("pokemonSelectLeader")
  end
  function FlowSys.Proc.pokemonSelectLeader()
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_LONLY_ASSERT)
    WINDOW:CloseMessage()
    SCREEN_A:FadeIn(TimeSec(0.5), false)
    SCREEN_A:FadeInAll(TimeSec(0.5), false)
    local lFuncDecideAct = function()
      SCREEN_A:FadeOutAll(TimeSec(0.5), true)
      SCREEN_A:FadeOut(TimeSec(0), false)
      FlowSys:Next("pokemonSelectLeaderCheck")
    end
    local lFuncCancelAct = function()
      LOADPARTY()
      SCREEN_A:FadeOutAll(TimeSec(0.5), true)
      SCREEN_A:FadeOut(TimeSec(0), false)
      FlowSys:Next("pokemonSelectCancel")
    end
    local group
    if FUNC_COMMON:CheckScenarioLevelOpenFlag("all_scenario_clear") == true then
      group = "ALL"
    else
      group = "SOUKO"
    end
    DispLeaderPokemonSelectMenu({
      titleText = CROSSRODE_GO_DUNGEON__CAPTION_LEADER,
      flagNewChange = "NEW",
      flagSort = true,
      typeParty = "STORY_PARTY",
      typeDrawGroup = group,
      cancelParty = false,
      decideAct = lFuncDecideAct,
      cancelAct = lFuncCancelAct
    })
  end
  function FlowSys.Proc.pokemonSelectLeaderCheck()
    SCREEN_A:FadeInAll(TimeSec(0), true)
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText())
    ShopSys:SetShopTag("\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\229\144\141", FUNC_COMMON:GetDungeonShortKanjiName(selectedDg))
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_LONLY_CHOICE)
    WINDOW:SelectStart()
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_LONLY_CHOICE_GO, 0)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_LONLY_CHOICE_MEMBER_CHG, 1)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_LONLY_CHOICE_CANCEL, 2)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    local cancelFlag = true
    FlowSys:Next("pokemonSelectCancel")
    if ret == 0 then
      cancelFlag = false
      if isLevelReset == true then
        FlowSys:Next("limitCheckWarningOneLv")
      else
        FlowSys:Next("pokemonSelectOut", "dungeonMenuEnd")
      end
    end
    if ret == 1 then
      FlowSys:Next("pokemonSelectLeader")
      cancelFlag = false
    end
    if ret == 2 then
      FlowSys:Next("pokemonSelectCancel")
    end
    if cancelFlag == true then
      LOADPARTY()
    end
  end
  function FlowSys.Proc.pokemonSelectAllClear()
    SCREEN_A:FadeInAll(TimeSec(0), true)
    createMemberWindow()
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_MEMBER_CHOICE)
    WINDOW:SelectStart()
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_MEMBER_CHOICE_LEADER, 0)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_MEMBER_CHOICE_MEMBER, 1)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_MEMBER_CHOICE_GO, 2)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_LONLY_CHOICE_CANCEL, 4)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    local cancelFlag = true
    GROUND:SetPartyBuf(1)
    GROUND:SetPartyBuf(2)
    FlowSys:Next("pokemonSelectCancel")
    if ret == 0 then
      cancelFlag = false
      FlowSys:Next("pokemonSelectAllClearMember")
    end
    if ret == 1 then
      cancelFlag = false
      FlowSys:Next("pokemonSelectAllClearLeader")
    end
    if ret == 2 then
      cancelFlag = false
      FlowSys:Next("pokemonSelectOut2", "limitCheckBack")
    end
    if ret == 4 then
      FlowSys:Next("pokemonSelectCancel")
    end
    if cancelFlag == true then
      LOADPARTY()
    end
    deleteMemberWindow()
  end
  function FlowSys.Proc.pokemonSelectAllClearMemberOld()
    GROUND:GetPartyBackupOld()
    createMemberWindow()
    SCREEN_A:FadeInAll(TimeSec(0), true)
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_OLD_MEMBER)
    WINDOW:SelectStart()
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_OLD_MEMBER_GO, 0)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_OLD_MEMBER_CELECT, 1)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_OLD_MEMBER_CANCEL, 2)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    local cancelFlag = true
    FlowSys:Next("pokemonSelectCancel")
    if ret == 0 then
      cancelFlag = false
      FlowSys:Next("pokemonSelectOut2", "limitCheckBack")
    end
    if ret == 1 then
      cancelFlag = false
      FlowSys:Next("pokemonSelectAllClearMember")
    end
    if ret == 2 then
      FlowSys:Next("pokemonSelectCancel")
    end
    deleteMemberWindow()
    if cancelFlag == true then
    end
  end
  function FlowSys.Proc.pokemonSelectAllClearMember()
    WINDOW:CloseMessage()
    SCREEN_A:FadeIn(TimeSec(0.5), false)
    SCREEN_A:FadeInAll(TimeSec(0.5), false)
    local lFuncDecideAct = function()
      GROUND:SortPartyMember(true)
      SCREEN_A:FadeOutAll(TimeSec(0.5), true)
      SCREEN_A:FadeOut(TimeSec(0), false)
      FlowSys:Next("pokemonSelectAllClearMemberCheck")
    end
    local lFuncCancelAct = function()
      SCREEN_A:FadeOutAll(TimeSec(0.5), true)
      SCREEN_A:FadeOut(TimeSec(0), false)
      FlowSys:Next("pokemonSelectAllClear")
    end
    DispMemberPokemonSelectMenu({
      titleText = CROSSRODE_GO_DUNGEON__CAPTION_PARTY,
      flagNewChange = "CHANGE",
      flagSort = true,
      typeParty = "STORY_PARTY",
      typeDrawGroup = "ALL",
      cancelParty = false,
      maxParty = 4,
      decideAct = lFuncDecideAct,
      cancelAct = lFuncDecideAct
    })
  end
  function FlowSys.Proc.pokemonSelectAllClearMemberCheck()
    SCREEN_A:FadeInAll(TimeSec(0), true)
    createMemberWindow()
    ShopSys:SetShopTag("\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\229\144\141", FUNC_COMMON:GetDungeonShortKanjiName(selectedDg))
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_MEMBER_OK)
    WINDOW:SelectStart()
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_MEMBER_OK_GO, 0)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_MEMBER_OK_MEMBER, 1)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_MEMBER_OK_LEADER, 2)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_MEMBER_OK_CANCEL, 3)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    FlowSys:Next("pokemonSelectAllClear")
    if ret == 0 then
      FlowSys:Next("limitCheck2")
    end
    if ret == 1 then
      FlowSys:Next("pokemonSelectAllClearMember")
    end
    if ret == 2 then
      FlowSys:Next("pokemonSelectAllClearLeader")
    end
    if ret == 3 then
      FlowSys:Next("pokemonSelectAllClear")
    end
    deleteMemberWindow()
  end
  function FlowSys.Proc.pokemonSelectAllClearLeader()
    WINDOW:CloseMessage()
    SCREEN_A:FadeIn(TimeSec(0.5), false)
    SCREEN_A:FadeInAll(TimeSec(0.5), false)
    local lFuncDecideAct = function()
      GROUND:SortPartyMember(true)
      SCREEN_A:FadeOutAll(TimeSec(0.5), true)
      SCREEN_A:FadeOut(TimeSec(0), false)
      FlowSys:Next("pokemonSelectAllClearLeaderCheck")
    end
    local lFuncCancelAct = function()
      SCREEN_A:FadeOutAll(TimeSec(0.5), true)
      SCREEN_A:FadeOut(TimeSec(0), false)
      FlowSys:Next("pokemonSelectAllClear")
    end
    DispLeaderPokemonSelectMenu({
      titleText = CROSSRODE_GO_DUNGEON__CAPTION_CHG_LEADER,
      flagNewChange = "CHANGE",
      flagSort = true,
      typeParty = "STORY_PARTY",
      typeDrawGroup = "ALL",
      cancelParty = false,
      decideAct = lFuncDecideAct,
      cancelAct = lFuncCancelAct
    })
  end
  function FlowSys.Proc.pokemonSelectAllClearLeaderCheck()
    SCREEN_A:FadeInAll(TimeSec(0), true)
    ShopSys:SetShopTag("\227\131\157\227\130\177\227\131\162\227\131\179\229\144\141", ShopSys:GetSelectPokemonWarehouseNameText())
    ShopSys:SetShopTag("\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\229\144\141", FUNC_COMMON:GetDungeonShortKanjiName(selectedDg))
    WINDOW:SysMsg(CROSSRODE_GO_DUNGEON__DG_CHAR_OK)
    WINDOW:SelectStart()
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_CHAR_OK_GO, 0)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_CHAR_OK_LEADER, 1)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_CHAR_OK_MEMBER, 2)
    WINDOW:SelectChain(CROSSRODE_GO_DUNGEON__DG_CHAR_OK_CANCEL, 3)
    local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    FlowSys:Next("pokemonSelectAllClearLeader")
    if ret == 0 then
      FlowSys:Next("limitCheck2")
    end
    if ret == 1 then
      FlowSys:Next("pokemonSelectAllClearLeader")
    end
    if ret == 2 then
      FlowSys:Next("pokemonSelectAllClearMember")
    end
    if ret == 3 then
      FlowSys:Next("pokemonSelectAllClearLeader")
    end
  end
  function FlowSys.Proc.dungeonMenuEnd()
    GROUND:SetPartyBackupOld()
    if selectedDg ~= nil and LUA_SYSTEM:CheckPreEnterDlcDungeon(Dg(selectedDg)) == false then
      if isSAVEPARTY() then
        LOADPARTY()
      end
      selectedDg = nil
      FlowSys.Stat.selectDungeonIndex = nil
    end
    FlowSys:Return()
  end
  local lastVisible = LOWER_SCREEN:IsVisible()
  LOWER_SCREEN:SetVisible(false)
  FlowSys:Call("dungeonMenuOpen")
  LOWER_SCREEN:SetVisible(lastVisible)
  deleteMemberWindow()
  selectMenu:Finish()
  FlowSys:Finish()
  ShopSys:Finish()
  LOWER_SCREEN:ChangeLastWallpaper()
  MAP:SetVisible(bPrevMapVisible)
  if selectedDg == nil or not bNoFadeIn then
    CHARA:ReloadPartyCharactorInstance()
    SCREEN_A:FadeIn(TimeSec(0.5), false)
    SCREEN_A:FadeInAll(TimeSec(0.5), false)
    SCREEN_B:FadeInAll(TimeSec(0.5), false)
  end
  return selectedDg
end

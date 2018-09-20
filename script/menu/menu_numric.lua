function OpenNumericMenu()
  SPRITE:CreatePatternSet("upperBgSet", {
    name = "bg",
    img = "WALLPAPER_MAIN_NOTICE01",
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
    ptnName = "bg",
    ofsX = 0,
    ofsY = 0,
    ofsPrio = 0
  })
  SPRT("upperBg"):SetOption({
    pos = Vector2(200, 120),
    visible = false,
    prio = 600
  })
  SPRITE:CreateSprite("upperNotice")
  SPRT("upperNotice"):SetOption({
    visible = false,
    prio = 550,
    blendType = ALPHA_BLEND.MUL
  })
  SPRT("upperNotice"):SetPosition(Vector2(128, 112))
  local menu = MENU:CreateNumericMenuWindow(ScreenType.B)
  menu:SetLayoutRect(Rectangle(96, 80, 132, 84))
  menu:SetPlace(5)
  menu:SetDigit(5)
  menu:SetStartNum(0)
  menu:SetType(NUM_MENU_TYPE.TYPE_DIGIT_ON)
  menu:SetTextOffset(24, 40)
  function menu:decideAction()
    local val = self:GetSettingData()
    self:Close()
  end
  function menu:cancelAction()
    self:Close()
  end
  menu:Open()
  menu:SetCaption("\227\129\132\227\129\143\227\130\137\227\129\130\227\129\154\227\129\145\227\130\139\239\188\159")
  SPRT("upperBg"):SetVisible(true)
  SPRT("upperNotice"):SetVisible(true)
  MENU:SetFocus(menu)
  MENU:WaitClose(menu)
  SPRITE:DestroySprite("upperBg")
  SPRITE:DestroySprite("upperNotice")
  SPRITE:DestroyPatternSet("upperBgSet")
  SPRITE:DestroyPatternSet("autoLoadNoticeSet")
end
function OpenScratchMenu()
  local caption = MENU:CreateInfomationMenuWindow(ScreenType.B)
  caption:SetText("[M:KARI]\227\130\185\227\130\175\227\131\169\227\131\131\227\131\129\227\129\143\227\129\152")
  caption:SetLayoutPositionY(8)
  caption:SetLayoutSizeH(24)
  caption:SetTextOffset(8, 3)
  caption:Open()
  local help = MENU:CreateInfomationMenuWindow(ScreenType.B)
  help:SetLayoutPositionY(220)
  help:SetLayoutSizeH(22)
  help:SetOption({font = "FONT_12"})
  help:SetTextOffset(16, 3)
  help:SetText(-1305610211)
  help:Open()
  local menu = MENU:CreateScratchMenu()
  menu:SetLayoutRect(Rectangle(8, 8, 304, 204))
  menu:SetScratchType(0)
  function menu:finishAction()
    result = menu:GetResult()
    self:Close()
  end
  menu:Open()
  menu:StartupScratch()
  MENU:SetFocus(menu)
  MENU:WaitClose(menu)
end
function OpenExplainMenu()
  local menu = MENU:CreateExplainMenuWindow(ScreenType.B)
  menu:SetLayoutRect(Rectangle(16, 40, 288, 160))
  function menu:cancelAction()
    self:Close()
  end
  menu:Open(872929419)
  MENU:SetFocus(menu)
  MENU:WaitClose(menu)
end
function OpenLotteryPremiumsMenu()
  local menuA = MENU:CreateLotteryPremiumsMenu(ScreenType.A)
  menuA:SetLayoutRect(Rectangle(24, 48, 272, 144))
  menuA:SetLotteryType(0)
  menuA:SetTextOffset(8, 0)
  menuA:SetOption({font = "FONT_16"})
  menuA:SetText("[CN]\227\131\158\227\131\188\227\130\175\227\130\146\227\129\157\227\130\141\227\129\136\227\129\166\227\130\178\227\131\131\227\131\136\239\188\129[R][VS:40][HO:70]\195\151\239\188\147[HS:32]\227\130\162\227\130\164\227\131\134\227\131\160\229\144\141[R][VS:40][HO:80]\195\151\239\188\146[HS:32]\227\130\162\227\130\164\227\131\134\227\131\160\229\144\141")
  function menuA:drawFunc()
    menuA:DrawHorizontalLine(0, 30, 272)
    menuA:DrawHorizontalLine(0, 90, 272)
  end
  menuA:Open()
  local menuB = MENU:CreateLotteryPremiumsMenu(ScreenType.B)
  menuB:SetLayoutRect(Rectangle(24, 48, 272, 144))
  menuB:SetLotteryType(0)
  menuB:SetTextOffset(8, 0)
  menuB:SetOption({font = "FONT_16"})
  menuB:SetText("[CN]\227\131\158\227\131\188\227\130\175\227\130\146\227\129\157\227\130\141\227\129\136\227\129\166\227\130\178\227\131\131\227\131\136\239\188\129[R][VS:40][HO:70]\195\151\239\188\147[HS:32]\227\130\162\227\130\164\227\131\134\227\131\160\229\144\141[R][VS:40][HO:80]\195\151\239\188\146[HS:32]\227\130\162\227\130\164\227\131\134\227\131\160\229\144\141")
  function menuB:drawFunc()
    menuB:DrawHorizontalLine(0, 30, 272)
    menuB:DrawHorizontalLine(0, 90, 272)
  end
  menuB:Open()
  MENU:SetFocus(menuB)
  MENU:WaitClose(menuB)
end
function OpenOverflowTest()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:LoadMenuTextPool("message/common.bin", false)
  OverFlow:AddOverflowCheckPoint(10)
  OverFlow:AddOverflowCheckPoint(20)
  OverFlow:AddOverflowCheckPoint(30)
  OverFlow:AddOverflowCheckItem(298, 100, true)
  OverFlow:AddOverflowCheckItem(298, 200, true)
  OverFlow:AddOverflowCheckItem(299, 100, true)
  OverFlow:AddOverflowCheckItem(299, 50, true)
  OverFlow:AddOverflowCheckItem(648, 100, true)
  OverFlow:AddOverflowCheckItem(649, 100, true)
  OverFlow:AddOverflowCheckItem(650, 100, true)
  OverFlow:AddOverflowCheckItem(651, 100, true)
  OverFlow:AddOverflowCheckItem(64, 1, true)
  OverFlow:AddOverflowCheckItem(65, 1, true)
  OverFlow:AddOverflowCheckItem(66, 1, true)
  OverFlow:AddOverflowCheckChest(302, 64, 1, true)
  OverFlow:AddOverflowCheckChest(303, 65, 1, true)
  OverFlow:AddOverflowCheckChest(304, 66, 1, true)
  OpenOrderOverflowMenu(true)
end
function OpenWazaTrainingMenu()
end

function OpenTestShinkawaMenu()
  FlowSys:Start()
  ShopSys:Start()
  function FlowSys.Proc.start()
    local title = FRIEND_GATE__CAPTION_MODE_SELECT
    local firstInfo = FRIEND_GATE__MANUAL_MODE_SELECT
    CommonSys:OpenBasicMenu(title, firstInfo, FRIEND_GATE__LINE_MODE_SELECT_HOST)
    local menu = MENU:CreatePageMenu()
    menu:SetLayoutRectAndLines(16, 40, 288, 5, 20, 1)
    function menu:drawFunc()
      menu:DrawHorizontalLine(0, 18, 280)
    end
    menu:AddItem(MENU:ReplaceTagText("[HO:8][HO:51]\227\129\170\227\129\190\227\129\136[HO:123][CS:B]\227\131\129\227\131\188\227\131\160[CR][HO:200]\227\129\149\227\130\147\227\129\139\227\129\151\227\130\131[VS:20]"), nil, nil)
    menu:AddItem(MENU:ReplaceTagText("[HO:8][M:Q04][HO:40]\227\131\148\227\130\179\227\131\129\227\131\165\227\130\166[HO:104][M:VBRS][CS:B]\227\131\157\227\130\177\227\131\162\227\131\179\227\130\185[CR][M:VBRE][HO:216][IS]1[M:VSL]4[IE]"), nil, nil)
    menu:AddItem(MENU:ReplaceTagText("[HO:8][M:Q04][HO:40]\227\131\132\227\130\191\227\131\188\227\130\184\227\130\167[HO:104][M:VBRS][CS:B]\227\130\168\227\131\162\227\131\179\227\130\172\227\130\186[CR][M:VBRE][HO:216][IS][CS:B]1[CR][M:VSL]4[IE]"), nil, nil)
    menu:AddItem(MENU:ReplaceTagText("[HO:8][M:Q04][HO:40]\227\131\159\227\130\184\227\131\165\227\131\158\227\131\173[HO:104][M:VBRS][CS:B]\227\131\173\227\130\177\227\131\131\227\131\136\229\155\163[CR][M:VBRE][HO:216][IS][CS:B]1[CR][M:VSL]4[IE]"), nil, nil)
    function menu:decideAction()
      self:Close()
    end
    function menu:cancelAction()
      self:Close()
    end
    TASK:Sleep(TimeSec(0))
    BasicMenu_OpenAndCloseWait(menu)
    FlowSys:Return()
  end
  FlowSys:Call("start")
  WINDOW:CloseMessage()
  FlowSys:Finish()
  ShopSys:Finish()
  CommonSys:CloseBasicMenu()
end

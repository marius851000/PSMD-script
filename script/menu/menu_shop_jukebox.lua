function OpenJukeboxShopMenu(shopIns)
  local selectSoundId = 0
  local oldMusic
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_MUSIC")
  function PlayMusic(label)
    SYSTEM:DebugPrint("-*-*-*  PLAY MUSIC *-*-*- ")
    if label ~= "" then
      SOUND:FadeOutBgm(TimeSec(0.5))
      SOUND:WaitBgm()
      TASK:Sleep(TimeSec(0))
      SOUND:PlayBgm(SymSnd(label), Volume(256))
      GROUND:SetJukeboxChangeBGM(label)
      GROUND:SetUseJukebox(true)
      TASK:Sleep(TimeSec(0))
      subMapBgmParadise()
      SYSTEM:DebugPrint("SET BGM = " .. label)
      SYSTEM:DebugPrint("GET BGM = " .. GROUND:GetJukeboxChangeBGM())
    end
  end
  function ChangeDefaultMusic()
    SOUND:FadeOutBgm(TimeSec(0.5))
    SOUND:WaitBgm()
    FLAG.MapBgm = CONST.FLAG_TRUE
    subMapBgmParadiseCheck()
  end
  function OpenSoundList()
    local cancelFlag = false
    local menu = MENU:CreatePageMenu(ScreenType.B)
    menu:SetLayoutRectAndLines(16, 40, 208, 8, 16)
    menu:ShowPageNum(true)
    soundNumWindow = MENU:CreateBoardMenuWindow(ScreenType.B)
    soundNumWindow:SetFontType(FontType.TYPE_12)
    soundNumWindow:SetTextOffset(0, 0)
    soundNumWindow:SetLayoutRect(Rectangle(240, 168, 64, 16))
    MENU:SetTag_String(1, "" .. shopIns:GetSoundCount())
    soundNumWindow:SetText(SHOP_PRG_MSG__JUKEBOX_MUSIC_COUNT)
    soundNumWindow:Open()
    local count = shopIns:GetSoundCount()
    local strSoundName
    for i = 0, count - 1 do
      strSoundName = shopIns:GetText_JukeboxSoundName(i)
      if shopIns:IsDlcMusic(i) == true then
        strSoundName = "[CS:I]" .. shopIns:GetText_JukeboxSoundName(i) .. "[CR]"
      end
      if GROUND:IsUseJukebox() and GROUND:GetJukeboxChangeBGM() == shopIns:GetPlayMusicLabel(i) then
        strSoundName = "[CS:Y]" .. shopIns:GetText_JukeboxSoundName(i) .. "[CR]"
      end
      menu:AddItem(strSoundName, i, nil)
    end
    function menu:openedAction()
      if selectSoundId then
        self:SetCursorItemIndex(selectSoundId)
      end
    end
    function menu:decideAction()
      selectSoundId = menu:GetCursorItemIndex()
      if shopIns:IsPossiblePlayMusic(selectSoundId) then
        self:Close()
      end
    end
    function menu:cancelAction()
      cancelFlag = true
      self:Close()
    end
    menu:Open()
    CommonSys:BeginLowerMenuNavi(nil, nil, false)
    CommonSys:OpenBasicMenu(SHOP_JUKEBOX__CAPTION_MUSIC, SHOP_JUKEBOX__MANUAL_MUSIC, nil)
    MENU:SetFocus(menu)
    MENU:WaitClose(menu)
    soundNumWindow:Close()
    CommonSys:CloseBasicMenu()
    CommonSys:EndLowerMenuNavi(true)
    return cancelFlag
  end
  function ResetMusic()
    local count = shopIns:GetResetMusicCount()
    for i = 0, count - 1 do
      PlayMusic(shopIns:GetResetMusicLabel(i))
    end
  end
  function GROUND__2:IsGetFriendSoundItem()
    return ShopSys:DummyJudeAsk("\227\129\147\227\129\174\227\130\184\227\131\165\227\131\188\227\130\175\227\131\156\227\131\131\227\130\175\227\130\185\227\129\139\227\130\137\230\155\178\227\130\162\227\130\164\227\131\134\227\131\160\227\130\146\227\130\130\227\130\137\227\129\163\227\129\159\239\188\159", true)
  end
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  ShopSys:SetParaideShopInstance(shopIns)
  WINDOW:SetMessageScreenMode(ScreenType.A)
  function FlowSys.Proc.JukeboxTop()
    subMapBgmParadise()
    shopIns:GetList()
    FlowSys:Next("JukeboxMenuTop")
  end
  function FlowSys.Proc.JukeboxTopLoop()
    WINDOW:CloseMessage()
    subMapBgmParadise()
    shopIns:GetList()
    if GROUND__2:IsFriendParadise() then
      FlowSys:Next("FriendJukeboxMenuTopLoop")
    else
      FlowSys:Next("JukeboxMenuTopLoop")
    end
  end
  function FlowSys.Proc.JukeboxMenuTop()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:SysMsgAskFlowNoClose(SHOP_JUKEBOX__WELCOME, {cursorReset = true}, {
      next = "JukeboxExit"
    }, {
      text = SHOP_JUKEBOX__WELCOME_MUSIC,
      next = "JukeboxChange"
    }, {
      text = SHOP_JUKEBOX__WELCOME_DEFAULT,
      next = "JukeboxDefault"
    }, {
      text = SHOP_JUKEBOX__WELCOME_HELP,
      next = "JukeboxHelp"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.JukeboxMenuTopLoop()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:SysMsgAskFlowNoClose(SHOP_JUKEBOX__SERIES, {cursorReset = true}, {
      next = "JukeboxExit"
    }, {
      text = SHOP_JUKEBOX__WELCOME_MUSIC,
      next = "JukeboxChange"
    }, {
      text = SHOP_JUKEBOX__WELCOME_DEFAULT,
      next = "JukeboxDefault"
    }, {
      text = SHOP_JUKEBOX__WELCOME_HELP,
      next = "JukeboxHelp"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.FriendJukeboxMenuTop()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:SysMsgAskFlowNoClose(SHOP_JUKEBOX__WELCOME, {cursorReset = true}, {
      next = "JukeboxExit"
    }, {
      text = SHOP_JUKEBOX__WELCOME_MUSIC,
      next = "JukeboxChange"
    }, {
      text = SHOP_JUKEBOX__WELCOME_DEFAULT,
      next = "JukeboxDefault"
    }, {
      text = SHOP_JUKEBOX__WELCOME_HELP,
      next = "JukeboxHelp"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.FriendJukeboxMenuTopLoop()
    CommonSys:OpenBasicMenu(nil, -1733859855, nil)
    ShopSys:SysMsgAskFlowNoClose(SHOP_JUKEBOX__SERIES, {cursorReset = true}, {
      next = "JukeboxExit"
    }, {
      text = SHOP_JUKEBOX__SERIES_MUSIC,
      next = "JukeboxChange"
    }, {
      text = SHOP_JUKEBOX__WELCOME_DEFAULT,
      next = "JukeboxDefault"
    }, {
      text = SHOP_JUKEBOX__SERIES_HELP,
      next = "JukeboxHelp"
    })
    CommonSys:CloseBasicMenu()
  end
  function FlowSys.Proc.JukeboxInsert()
    ShopSys:SysMsg(SHOP_JUKEBOX__BUY_INTO)
    FlowSys:Next("JukeboxDecide")
  end
  function FlowSys.Proc.JukeboxDefault()
    local nowBgmLabel = shopIns:GetResetMusicLabel(0)
    if GROUND:IsUseJukebox() == false then
      ShopSys:SysMsg(SHOP_JUKEBOX__DEFAULT_ERROR)
      FlowSys:Next("JukeboxTopLoop")
    else
      ShopSys:SetShopTag("\229\164\137\230\155\180\230\155\178\229\144\141", shopIns:GetText_JukeboxSoundName(GROUND:GetJukeboxChangeBGM()))
      ShopSys:SysMsgAskFlowNoClose(SHOP_JUKEBOX__DEFAULT_SELECT, {cursorReset = true}, {
        next = "JukeboxDefaultCansel"
      }, {
        text = SHOP_JUKEBOX__DEFAULT_SELECT_YES,
        next = "JukeboxChangeDefault"
      }, {
        text = SHOP_JUKEBOX__DEFAULT_SELECT_NO,
        next = "JukeboxDefaultCansel"
      })
    end
  end
  function FlowSys.Proc.JukeboxDefaultCansel()
    ShopSys:SysMsg(SHOP_JUKEBOX__DEFAULT_CANCEL)
    FlowSys:Next("JukeboxTopLoop")
  end
  function FlowSys.Proc.JukeboxChangeDefault()
    ChangeDefaultMusic()
    GROUND:SetUseJukebox(false)
    ShopSys:SysMsg(SHOP_JUKEBOX__DEFAULT_CHANGE)
    FlowSys:Next("JukeboxTopLoop")
  end
  function FlowSys.Proc.JukeboxChange()
    ShopSys:SysMsg(SHOP_JUKEBOX__BUY_INTO)
    WINDOW:CloseMessage()
    FlowSys:Next("JukeboxSelect")
  end
  function FlowSys.Proc.JukeboxSelect()
    local cancel = OpenSoundList()
    if cancel then
      FlowSys:Next("JukeboxTopLoop")
    else
      FlowSys:Next("JukeboxAction")
    end
  end
  function FlowSys.Proc.JukeboxAction()
    ShopSys:SetShopTag("\230\155\178\227\130\162\227\130\164\227\131\134\227\131\160\229\144\141", shopIns:GetText_JukeboxSoundName(shopIns:GetPlayMusicLabel(selectSoundId)))
    ShopSys:SysMsg(SHOP_JUKEBOX__BUY_THANKS)
    WINDOW:CloseMessage()
    shopIns:JukeboxPlayMusic(selectSoundId, true)
    PlayMusic(shopIns:GetPlayMusicLabel(selectSoundId))
    FLAG.MapBgm = CONST.FLAG_FALSE
    FlowSys:Next("JukeboxSelect")
  end
  function FlowSys.Proc.JukeboxHelp()
    ShopSys:SysMsg(SHOP_JUKEBOX__HELP)
    FlowSys:Next("JukeboxTopLoop")
  end
  function FlowSys.Proc.JukeboxExit()
    ShopSys:SysMsg(SHOP_JUKEBOX__EXIT)
    FlowSys:Return()
  end
  FlowSys:Call("JukeboxTop")
  WINDOW:CloseMessage()
  LOWER_SCREEN:ChangeLastWallpaper()
  FlowSys:Finish()
  ShopSys:Finish()
end

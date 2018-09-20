dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
dofile("script/include/inc_charchoice.lua")
function PerippaaAkinatorStart(param)
  SOUND:PlayBgm(SymSnd("BGM_EVE_SHINPI"), Volume(256))
  SCREEN_A:LoadWallpaper("WALLPAPER_MAIN_PERIPPA_01")
  SCREEN_B:LoadWallpaper("WALLPAPER_SUB_PERIPPA_01")
  SCREEN_A:FadeIn(TimeSec(0), false)
  SCREEN_B:FadeIn(TimeSec(0), false)
  SCREEN_A:FadeInAll(TimeSec(0.5), false)
  SCREEN_B:FadeInAll(TimeSec(0.5), true)
  if param.isDebug == true then
    local askMenu = MENU:CreateAskMenu()
    askMenu:Setup(true, true, false)
    askMenu:AddItem(-850944045, nil, {
      decideAction = function(self)
        param.isSkip = true
        self:CloseAndClearFocus()
      end
    })
    askMenu:AddItem(1956610463, nil, {
      decideAction = function(self)
        param.isSkip = false
        self:CloseAndClearFocus()
      end
    })
    WINDOW:SysMsg(1904658837)
    WINDOW:SelectSetLuaMenu(askMenu)
    WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    if param.isSkip == true then
      return
    end
  else
    param.isSkip = false
  end
  ShopSys:SysMsg(1524170533)
  WINDOW:CloseMessage()
  if param.isFirst == true then
    ShopSys:SysMsg(-113861480)
    WINDOW:CloseMessage()
  end
end
function PerippaaAkinatorSelectPokemon(param)
  if param.isHit == true then
    CAMERA:SetSisaAzimuthDifferenceVolume(Volume(0.5))
    CAMERA:SetSisaRateVolume(Volume(0.5))
    CAMERA:SetEye(Vector(-0.0408, 2.0971, 11.4379))
    CAMERA:SetTgt(Vector(0, -0.012, 5))
    SCREEN_A:FadeOut(TimeSec(0.3), true)
    MAP:SetVisible(true)
    WINDOW:SysMsg(879294820)
    WINDOW:CloseMessage()
    SCREEN_A:FadeIn(TimeSec(0.3), true)
    EFFECT:Create("effectSmoke00", SymEff("EV_LG_SMOKE_WHITE"))
    EFFECT:SetPosition("effectSmoke00", Vector(0, 0, 5.5))
    EFFECT:Play("effectSmoke00")
    SOUND:PlaySe(SymSnd("SE_EVT_MITSUMERU"))
    TASK:Sleep(TimeSec(0.3))
    CH("FREE_FRIEND_00"):SetPosition(0, 0, 5)
    CH("FREE_FRIEND_00"):ChangeColor(Color(1, 1, 1, 0), TimeSec(0, TIME_TYPE.FRAME))
    CH("FREE_FRIEND_00"):SetVisible(true)
    CH("FREE_FRIEND_00"):WalkTo(PosOffs(0, 1), Speed(1.5))
    CH("FREE_FRIEND_00"):ChangeColor(Color(1, 1, 1, 1), TimeSec(10, TIME_TYPE.FRAME))
    CH("FREE_FRIEND_00"):WaitMove()
    MENU:SetTag_MonsterIndex(0, param.selectPokemon_1)
    WINDOW:SysMsg(762562597)
    WINDOW:CloseMessage()
    WINDOW:SysMsg(106863590)
    WINDOW:CloseMessage()
    EFFECT:Create("effectSmoke01", SymEff("EV_LG_SMOKE_WHITE"))
    EFFECT:SetPosition("effectSmoke01", Vector(-1, 0, 4.5))
    EFFECT:Play("effectSmoke01")
    EFFECT:Create("effectSmoke02", SymEff("EV_LG_SMOKE_WHITE"))
    EFFECT:SetPosition("effectSmoke02", Vector(1, 0, 4.5))
    EFFECT:Play("effectSmoke02")
    SOUND:PlaySe(SymSnd("SE_EVT_MITSUMERU"))
    TASK:Sleep(TimeSec(0.3))
    CH("FREE_FRIEND_01"):SetPosition(-1, 0, 4)
    CH("FREE_FRIEND_02"):SetPosition(1, 0, 4)
    CH("FREE_FRIEND_01"):ChangeColor(Color(1, 1, 1, 0), TimeSec(0, TIME_TYPE.FRAME))
    CH("FREE_FRIEND_02"):ChangeColor(Color(1, 1, 1, 0), TimeSec(0, TIME_TYPE.FRAME))
    CH("FREE_FRIEND_01"):SetVisible(true)
    CH("FREE_FRIEND_02"):SetVisible(true)
    CH("FREE_FRIEND_01"):WalkTo(PosOffs(0, 1), Speed(1.5))
    CH("FREE_FRIEND_02"):WalkTo(PosOffs(0, 1), Speed(1.5))
    CH("FREE_FRIEND_01"):ChangeColor(Color(1, 1, 1, 1), TimeSec(10, TIME_TYPE.FRAME))
    CH("FREE_FRIEND_02"):ChangeColor(Color(1, 1, 1, 1), TimeSec(10, TIME_TYPE.FRAME))
    CH("FREE_FRIEND_01"):WaitMove()
    MENU:SetTag_MonsterIndex(1, param.selectPokemon_2)
    MENU:SetTag_MonsterIndex(2, param.selectPokemon_3)
    WINDOW:SysMsg(524659367)
    WINDOW:CloseMessage()
    local askMenu = MENU:CreateAskMenu()
    askMenu:Setup(true, true, false)
    askMenu:AddItem(-1885164195, nil, {
      decideAction = function(self)
        self:CloseAndClearFocus()
      end
    })
    askMenu:AddItem(-1228370453, nil, {
      decideAction = function(self)
        param.isRetry = true
        self:CloseAndClearFocus()
      end
    })
    WINDOW:SysMsg(1416653308)
    WINDOW:SelectSetLuaMenu(askMenu)
    WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    if param.isRetry == true then
      SCREEN_A:FadeOutAll(TimeSec(0.3), true)
      CH("FREE_FRIEND_00"):SetVisible(false)
      CH("FREE_FRIEND_01"):SetVisible(false)
      CH("FREE_FRIEND_02"):SetVisible(false)
      MAP:SetVisible(false)
      SCREEN_A:FadeInAll(TimeSec(0.3), true)
    end
  else
    local askMenu = MENU:CreateAskMenu()
    askMenu:Setup(true, true, false)
    askMenu:AddItem(-749005660, nil, {
      decideAction = function(self)
        param.isRetry = true
        self:CloseAndClearFocus()
      end
    })
    askMenu:AddItem(-1164937329, nil, {
      decideAction = function(self)
        param.isBack = true
        self:CloseAndClearFocus()
      end
    })
    WINDOW:SysMsg(251819275)
    WINDOW:SelectSetLuaMenu(askMenu)
    WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    if param.isBack == true then
      WINDOW:SysMsg(843371127)
      WINDOW:CloseMessage()
    end
  end
end
function PerippaaAkinatorEnd(param)
  if param.isSkip == true then
  elseif param.isBackMenu == true then
  elseif param.isFirst == true then
    CH("FREE_FRIEND_00"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
    CH("FREE_FRIEND_01"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
    CH("FREE_FRIEND_02"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
    WINDOW:SysMsg(-1474867487)
    WINDOW:CloseMessage()
    WINDOW:SysMsg(-1332599240)
    WINDOW:CloseMessage()
  else
    WINDOW:SysMsg(-1332599240)
    WINDOW:CloseMessage()
  end
  SCREEN_A:FadeOutAll(TimeSec(0.5), false)
  SCREEN_B:FadeOutAll(TimeSec(0.5), true)
  SCREEN_A:FadeOut(TimeSec(0), false)
  SCREEN_B:FadeOut(TimeSec(0), false)
end

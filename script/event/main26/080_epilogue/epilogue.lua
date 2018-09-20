dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main26_epilogue01_init()
end
function main26_epilogue01_start()
  TASK:Sleep_CanBreak(TimeSec(1.5))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(3))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SOUND:PlayBgm(SymSnd("BGM_EVE_EPILOGUE"), Volume(256))
  WINDOW:SetWaitMode(TimeSec(3), TimeSec(1))
  WINDOW:Narration(TimeSec(1), TimeSec(1), -9739290)
  WINDOW:CloseMessage()
  WINDOW:SetWaitMode(TimeSec(2.7), TimeSec(1))
  WINDOW:Narration(TimeSec(1), TimeSec(1), -428846425)
  WINDOW:CloseMessage()
  WINDOW:SetWaitMode(TimeSec(2.3), TimeSec(1))
  WINDOW:Narration(TimeSec(1), TimeSec(1), -849542812)
  WINDOW:CloseMessage()
  WINDOW:SetWaitMode(TimeSec(-1), TimeSec(-1))
  TASK:Sleep_CanBreak(TimeSec(0.2))
  MAP:SetVisible(false)
  local eLanguageType = SYSTEM:GetLanguageType()
  if eLanguageType == LANGUAGE_TYPE.JP then
    MAP:SetBG(SymImg("IMEV9913"))
  elseif eLanguageType == LANGUAGE_TYPE.EN then
    MAP:SetBG(SymImg("IMEV9913_EN"))
  elseif eLanguageType == LANGUAGE_TYPE.FR then
    MAP:SetBG(SymImg("IMEV9913_FR"))
  elseif eLanguageType == LANGUAGE_TYPE.GE then
    MAP:SetBG(SymImg("IMEV9913_GE"))
  elseif eLanguageType == LANGUAGE_TYPE.IT then
    MAP:SetBG(SymImg("IMEV9913_IT"))
  elseif eLanguageType == LANGUAGE_TYPE.SP then
    MAP:SetBG(SymImg("IMEV9913_SP"))
  end
  MAP:SetVisibleBG(true)
  SCREEN_A:FadeIn(TimeSec(1.5), true)
  TASK:Sleep_CanBreak(TimeSec(8))
  SCREEN_A:FadeOut(TimeSec(2), true)
  MAP:SetVisible(true)
  MAP:SetVisibleBG(false)
  TASK:Sleep_CanBreak(TimeSec(2))
end
function main26_epilogue01_end()
end
function groundEnd()
end

function groundInit()
end
function groundStart()
  SYSTEM:SetParadiseCenterLevel(PARADISE_CENTER_LV.LV_4)
  SYSTEM:SetParadiseHomeLevel(PARADISE_HOME_LV.LV_3)
  FLAG.MapFlags = CONST.MAP_PARA_CENTER
  SYSTEM:NextMapEntry(CONST.MAP_PARA_HOME_OUT)
end
function groundEnd()
end
function EventTriggerPush(symbol)
  if symbol == "@iwa" then
    WINDOW:SystemLetter(1536083648)
    CH("HERO"):WalkTo(SymbolPos("@walkTo01"), Speed(5))
    CH("HERO"):WaitMove()
    CH("HERO"):WalkTo(SymbolPos("@walkTo02"), Speed(5))
    CH("HERO"):WaitMove()
    CH("HERO"):WalkTo(SymbolPos("@walkTo03"), Speed(5))
    CH("HERO"):WaitMove()
  end
  if symbol == "@hana" then
    WINDOW:SystemLetter(1117124481)
  end
end

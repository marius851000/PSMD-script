function MenuMansion_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  MENU:SetTag_MonsterString(0, GROUND:GetPokemonWarehouseNameFromId(0))
end
function MenuMansion_ReStart()
  MenuMansion_Start()
  SCREEN_A:FadeInAll(TimeSec(1), false)
  SCREEN_B:FadeInAll(TimeSec(1), false)
end
function MenuMansion_End()
  SCREEN_A:FadeOutAll(TimeSec(0.5), false)
  SCREEN_B:FadeOutAll(TimeSec(0.5), true)
end

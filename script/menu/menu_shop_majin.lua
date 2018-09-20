function MenuMajinShop_Start()
  MENU:LoadMenuTextPool("message/shop.bin", false)
end
function MenuMajinShop_SetTag()
  MENU:SetTag_Value(7, GROUND:GetNextChousadanRankPoint())
end
function MenuMajinShop_MajinOff()
  GM("MAJINNOTUBO"):SetVisible(false)
  EFFECT:Create("effectSmoke01", SymEff("NM_SMOKE_GROUND_WHITE"))
  EFFECT:SetPosition("effectSmoke01", GM("MAJINNOTUBO"):GetPosition())
  EFFECT:Play("effectSmoke01")
  SOUND:PlaySe(SymSnd("SE_ACT_SUMMON"))
  TASK:Sleep(TimeSec(1))
end
function MenuMajinShop_End()
end

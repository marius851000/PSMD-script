dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
dofile("script/include/inc_charchoice.lua")
function debugseikakucharselect01_init()
end
function debugseikakucharselect01_start()
  WINDOW:SysMsg(1109188598)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1527246519, 0)
  WINDOW:SelectChain(1881849204, 20)
  WINDOW:SelectChain(1764854837, 1)
  WINDOW:SelectChain(644881138, 2)
  WINDOW:SelectChain(1063988147, 3)
  WINDOW:SelectChain(340162672, 4)
  WINDOW:SelectChain(224217393, 5)
  WINDOW:SelectChain(-1966778882, 6)
  WINDOW:SelectChain(-1814141761, 7)
  WINDOW:SelectChain(1923713035, 8)
  WINDOW:SelectChain(1806874954, 9)
  WINDOW:SelectChain(1084222089, 10)
  WINDOW:SelectChain(1501879240, 11)
  WINDOW:SelectChain(382029071, 12)
  WINDOW:SelectChain(266239054, 13)
  WINDOW:SelectChain(619917197, 14)
  WINDOW:SelectChain(1038622412, 15)
  WINDOW:SelectChain(-1167064573, 16)
  WINDOW:SelectChain(-1553255614, 100)
  WINDOW:SelectChain(1612457957, 25)
  WINDOW:DefaultCursor(0)
  local charselect1 = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  WINDOW:SysMsg(2030507684)
  WINDOW:SelectStart()
  if charselect1 ~= 100 then
    WINDOW:SelectChain(1378501991, 0)
  end
  if charselect ~= 25 then
    WINDOW:SelectChain(1261532198, 25)
  end
  if charselect1 ~= 0 then
    WINDOW:SelectChain(74506977, 100)
  end
  if charselect1 ~= 20 then
    WINDOW:SelectChain(493605792, 20)
  end
  if charselect1 ~= 1 then
    WINDOW:SelectChain(910590051, 1)
  end
  if charselect1 ~= 2 then
    WINDOW:SelectChain(794669346, 2)
  end
  if charselect1 ~= 3 then
    WINDOW:SelectChain(-1463439891, 3)
  end
  if charselect1 ~= 4 then
    WINDOW:SelectChain(-1310810964, 4)
  end
  if charselect1 ~= 5 then
    WINDOW:SelectChain(-660586368, 5)
  end
  if charselect1 ~= 6 then
    WINDOW:SelectChain(-1044680255, 6)
  end
  if charselect1 ~= 7 then
    WINDOW:SelectChain(-359259646, 7)
  end
  if charselect1 ~= 8 then
    WINDOW:SelectChain(-208858301, 8)
  end
  if charselect1 ~= 9 then
    WINDOW:SelectChain(-1127447164, 9)
  end
  if charselect1 ~= 10 then
    WINDOW:SelectChain(-1512590139, 10)
  end
  if charselect1 ~= 11 then
    WINDOW:SelectChain(-1896159482, 11)
  end
  if charselect1 ~= 12 then
    WINDOW:SelectChain(-1746807225, 12)
  end
  if charselect1 ~= 13 then
    WINDOW:SelectChain(276417160, 13)
  end
  if charselect1 ~= 14 then
    WINDOW:SelectChain(157481929, 14)
  end
  if charselect1 ~= 15 then
    WINDOW:SelectChain(1165457465, 15)
  end
  if charselect1 ~= 16 then
    WINDOW:SelectChain(1550600568, 16)
  end
  WINDOW:DefaultCursor(0)
  local charselect2 = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if charselect1 == 100 then
    WINDOW:SysMsg(2000755387)
    charPOKABU()
    POKEID_HERO = 595
  elseif charselect1 == 25 then
    WINDOW:SysMsg(1851403258)
    charHIKOZARU()
    POKEID_HERO = 482
  elseif charselect1 == 0 then
    WINDOW:SysMsg(555466045)
    charPIKACHUU()
    POKEID_HERO = 30
  elseif charselect1 == 20 then
    WINDOW:SysMsg(939560060)
    charKEROMATSU()
    POKEID_HERO = 772
  elseif charselect1 == 1 then
    WINDOW:SysMsg(321773503)
    charNAETORU()
    POKEID_HERO = 479
  elseif charselect1 == 2 then
    WINDOW:SysMsg(171372286)
    charRIORU()
    POKEID_HERO = 537
  elseif charselect1 == 3 then
    WINDOW:SysMsg(-1917914575)
    charKIMORI()
    POKEID_HERO = 322
  elseif charselect1 == 4 then
    WINDOW:SysMsg(-1800027280)
    charWANINOKO()
    POKEID_HERO = 203
  elseif charselect1 == 5 then
    WINDOW:SysMsg(-37019812)
    charPOTCHAMA()
    POKEID_HERO = 485
  elseif charselect1 == 6 then
    WINDOW:SysMsg(-456118755)
    charCHIKORIITA()
    POKEID_HERO = 197
  elseif charselect1 == 7 then
    WINDOW:SysMsg(-805470754)
    charHINOARASHI()
    POKEID_HERO = 200
  elseif charselect1 == 8 then
    WINDOW:SysMsg(-689550177)
    charMIJUMARU()
    POKEID_HERO = 598
  elseif charselect1 == 9 then
    WINDOW:SysMsg(-1717052840)
    charFOKKO()
    POKEID_HERO = 769
  elseif charselect1 == 10 then
    WINDOW:SysMsg(-2135102695)
    charFUSHIGIDANE()
    POKEID_HERO = 1
  elseif charselect1 == 11 then
    WINDOW:SysMsg(-1416513318)
    charHITOKAGE()
    POKEID_HERO = 5
  elseif charselect1 == 12 then
    WINDOW:SysMsg(-1299543653)
    charACHAMO()
    POKEID_HERO = 325
  elseif charselect1 == 13 then
    WINDOW:SysMsg(890410324)
    charZENIGAME()
    POKEID_HERO = 10
  elseif charselect1 == 14 then
    WINDOW:SysMsg(738829333)
    charTSUTAAJA()
    POKEID_HERO = 592
  elseif charselect1 == 15 then
    WINDOW:SysMsg(-276909902)
    charHARIMARON()
    POKEID_HERO = 766
  elseif charselect1 == 16 then
    WINDOW:SysMsg(-161119757)
    charMIZUGOROU()
    POKEID_HERO = 329
  end
  if charselect2 == 0 then
    WINDOW:SysMsg(-582430160)
    charPOKABU()
    POKEID_PARTNER = 595
  elseif charselect2 == 25 then
    WINDOW:SysMsg(-1001135247)
    charHIKOZARU()
    POKEID_PARTNER = 482
  elseif charselect2 == 100 then
    WINDOW:SysMsg(-1961724490)
    charPIKACHUU()
    POKEID_PARTNER = 30
  elseif charselect2 == 20 then
    WINDOW:SysMsg(-1844886281)
    charKEROMATSU()
    POKEID_PARTNER = 772
  elseif charselect2 == 1 then
    WINDOW:SysMsg(-1188817100)
    charNAETORU()
    POKEID_PARTNER = 479
  elseif charselect2 == 2 then
    WINDOW:SysMsg(-1606474123)
    charRIORU()
    POKEID_PARTNER = 537
  elseif charselect2 == 3 then
    WINDOW:SysMsg(665270970)
    charKIMORI()
    POKEID_PARTNER = 322
  elseif charselect2 == 4 then
    WINDOW:SysMsg(1052511227)
    charWANINOKO()
    POKEID_PARTNER = 203
  elseif charselect2 == 5 then
    WINDOW:SysMsg(1472387031)
    charPOTCHAMA()
    POKEID_PARTNER = 485
  elseif charselect2 == 6 then
    WINDOW:SysMsg(1322903190)
    charCHIKORIITA()
    POKEID_PARTNER = 197
  elseif charselect2 == 7 then
    WINDOW:SysMsg(1710536021)
    charHINOARASHI()
    POKEID_PARTNER = 200
  elseif charselect2 == 8 then
    WINDOW:SysMsg(2096071700)
    charMIJUMARU()
    POKEID_PARTNER = 598
  elseif charselect2 == 9 then
    WINDOW:SysMsg(867046099)
    charFOKKO()
    POKEID_PARTNER = 769
  elseif charselect2 == 10 then
    WINDOW:SysMsg(716514194)
    charFUSHIGIDANE()
    POKEID_PARTNER = 1
  elseif charselect2 == 11 then
    WINDOW:SysMsg(26767441)
    charHITOKAGE()
    POKEID_PARTNER = 5
  elseif charselect2 == 12 then
    WINDOW:SysMsg(411255056)
    charACHAMO()
    POKEID_PARTNER = 325
  elseif charselect2 == 13 then
    WINDOW:SysMsg(-1625596449)
    charZENIGAME()
    POKEID_PARTNER = 10
  elseif charselect2 == 14 then
    WINDOW:SysMsg(-2046792546)
    charTSUTAAJA()
    POKEID_PARTNER = 592
  elseif charselect2 == 15 then
    WINDOW:SysMsg(262260609)
    charHARIMARON()
    POKEID_PARTNER = 766
  elseif charselect2 == 16 then
    WINDOW:SysMsg(381351616)
    charMIZUGOROU()
    POKEID_PARTNER = 329
  end
  WINDOW:SysMsg(1033348355)
  GROUND:SetHero(POKEID_HERO, 0)
  SYSTEM:HeroNameInput()
  WINDOW:SysMsg(613192770)
  GROUND:SetPartner(POKEID_PARTNER, 0)
  SYSTEM:PartnerNameInput()
  WINDOW:CloseMessage()
  WINDOW:SysMsg(1808597637)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1926640580, 0)
  WINDOW:SelectChain(1509646343, 1)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 0 then
    return "ok"
  else
    return "repeat"
  end
end
function debugseikakucharselect02_end()
end
function debugseikakucharselect02_init()
end
function debugseikakucharselect02_start()
  WINDOW:SysMsg(1088442694)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-948417143, 0)
  WINDOW:SelectChain(-563905336, 2)
  WINDOW:SelectChain(-1222795036, 1)
  WINDOW:SelectChain(-1375301211, 20)
  WINDOW:SelectChain(-2060729754, 3)
  WINDOW:SelectChain(-1674513625, 4)
  WINDOW:SelectChain(-747543072, 5)
  WINDOW:SelectChain(-899001183, 6)
  WINDOW:SelectChain(-515438750, 7)
  WINDOW:SelectChain(-128174557, 100)
  WINDOW:SelectChain(2143562476, 8)
  WINDOW:SelectChain(1725897645, 9)
  WINDOW:SelectChain(-1643608964, 10)
  WINDOW:SelectChain(-2028751555, 11)
  WINDOW:SelectChain(-1405163778, 12)
  WINDOW:SelectChain(-1255811137, 25)
  WINDOW:SelectChain(-94092936, 13)
  WINDOW:SelectChain(-478187463, 14)
  WINDOW:SelectChain(-934140934, 15)
  WINDOW:SelectChain(-783740229, 16)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 100 then
    typePOKABU()
    charPOKABU()
  elseif id == 25 then
    typeHIKOZARU()
    charHIKOZARU()
  elseif id == 1 then
    typePIKACHUU()
    charPIKACHUU()
    POKEID_HERO = 30
  elseif id == 20 then
    typeKEROMATSU()
    charKEROMATSU()
    POKEID_HERO = 772
  elseif id == 0 then
    typeNAETORU()
    charNAETORU()
    POKEID_HERO = 479
  elseif id == 2 then
    typeRIORU()
    charRIORU()
    POKEID_HERO = 537
  elseif id == 3 then
    typeKIMORI()
    charKIMORI()
    POKEID_HERO = 322
  elseif id == 4 then
    typeWANINOKO()
    charWANINOKO()
    POKEID_HERO = 203
  elseif id == 5 then
    typePOTCHAMA()
    charPOTCHAMA()
    POKEID_HERO = 485
  elseif id == 6 then
    typeCHIKORIITA()
    charCHIKORIITA()
    POKEID_HERO = 197
  elseif id == 7 then
    typeHINOARASHI()
    charHINOARASHI()
    POKEID_HERO = 200
  elseif id == 8 then
    typeMIJUMARU()
    charMIJUMARU()
    POKEID_HERO = 598
  elseif id == 9 then
    typeFOKKO()
    charFOKKO()
    POKEID_HERO = 769
  elseif id == 10 then
    typeFUSHIGIDANE()
    charFUSHIGIDANE()
    POKEID_HERO = 1
  elseif id == 11 then
    typeHITOKAGE()
    charHITOKAGE()
    POKEID_HERO = 5
  elseif id == 12 then
    typeACHAMO()
    charACHAMO()
    POKEID_HERO = 325
  elseif id == 25 then
    typeHIKOZARU()
    charHIKOZARU()
    POKEID_HERO = 325
  elseif id == 13 then
    typeZENIGAME()
    charZENIGAME()
    POKEID_HERO = 10
  elseif id == 14 then
    typeTSUTAAJA()
    charTSUTAAJA()
    POKEID_HERO = 592
  elseif id == 15 then
    typeHARIMARON()
    charHARIMARON()
    POKEID_HERO = 766
  elseif id == 16 then
    typeMIZUGOROU()
    charMIZUGOROU()
    POKEID_HERO = 329
  end
  WINDOW:SysMsg(1456541300)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1338654517, 0)
  WINDOW:SelectChain(649388825, 1)
  WINDOW:DefaultCursor(0)
  local id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 1 then
    return "ok"
  else
    return "repeat"
  end
end
function debugseikakucharselect02_end()
end

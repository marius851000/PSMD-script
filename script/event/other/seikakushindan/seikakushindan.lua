dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
dofile("script/include/inc_charchoice.lua")
local sunny = 0
local calm = 0
local flexible = 0
local serious = 0
local cooperate = 0
local chartype = ""
local basecharname = ""
local charname = ""
local persontype = ""
local pertnername = ""
local pertnergender = ""
function groundInit()
end
function groundStart()
end
function seikakushindansetsumei01_init()
end
function seikakushindansetsumei01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_A:FadeOut(TimeSec(0), true)
  SYSTEM:ExecutePersonalityAnalysis3dsCameraMode()
  SCREEN_A:WhiteOut(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(4))
  SOUND:PlayBgm(SymSnd("BGM_EVE_SHINPI"), Volume(256))
  SCREEN_A:WhiteInAll(TimeSec(0.5), true)
  WINDOW:NarrationB(TimeSec(1), TimeSec(0.5), -1696874002)
  WINDOW:CloseMessage()
  WINDOW:NarrationB(TimeSec(1), TimeSec(0.5), -2084507473)
  WINDOW:CloseMessage()
  WINDOW:NarrationB(TimeSec(1), TimeSec(0.5), -1460821140)
  WINDOW:CloseMessage()
end
function seikakushindansetsumei01_end()
end
function seikakushindankekka01_init()
end
function seikakushindankekka01_start()
  CH("PIKACHUU_H"):SetVisible(false)
  CH("POKABU_H"):SetVisible(false)
  CH("MIJUMARU_H"):SetVisible(false)
  CH("TSUTAAJA_H"):SetVisible(false)
  CH("FUSHIGIDANE_H"):SetVisible(false)
  CH("HITOKAGE_H"):SetVisible(false)
  CH("ZENIGAME_H"):SetVisible(false)
  CH("CHIKORIITA_H"):SetVisible(false)
  CH("HINOARASHI_H"):SetVisible(false)
  CH("WANINOKO_H"):SetVisible(false)
  CH("KIMORI_H"):SetVisible(false)
  CH("ACHAMO_H"):SetVisible(false)
  CH("MIZUGOROU_H"):SetVisible(false)
  CH("NAETORU_H"):SetVisible(false)
  CH("HIKOZARU_H"):SetVisible(false)
  CH("POTCHAMA_H"):SetVisible(false)
  CH("RIORU_H"):SetVisible(false)
  CH("HARIMARON_H"):SetVisible(false)
  CH("FOKKO_H"):SetVisible(false)
  CH("KEROMATSU_H"):SetVisible(false)
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  SCREEN_A:FadeInAll(TimeSec(0), true)
  EFFECT:Create("EV_SINDAN_00_LP", SymEff("EV_SINDAN_00_LP"))
  EFFECT:SetPosition("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_0_C"))
  EFFECT:Play("EV_SINDAN_00_LP")
  CAMERA:SetFovy(Degree(80))
  SCREEN_A:WhiteIn(TimeSec(2), false)
  CUT:Load(SymCut("sk01_n011in"))
  CUT:Play()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_1_C"), Speed(6.66))
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:Wait()
  CUT:Destroy()
  local type01 = SYSTEM:GetRandomValue(0, 2)
  local type02 = SYSTEM:GetRandomValue(0, 2)
  local type03 = SYSTEM:GetRandomValue(0, 2)
  local type04 = SYSTEM:GetRandomValue(0, 2)
  local type05 = SYSTEM:GetRandomValue(0, 2)
  EFFECT:Create("EV_FLASH_EFFECT", SymEff("EV_SINDAN_01A"))
  CUT:Load(SymCut("sk02_n012wait"))
  CUT:PlayLoop()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  sunny = seikakushindan01(type01)
  PlaySe_Select()
  EFFECT:Create("EV_SINDAN_00_LPA", SymEff("EV_SINDAN_01A"))
  EFFECT:SetPosition("EV_SINDAN_00_LPA", EFFECT:GetPosition("EV_SINDAN_00_LP"))
  EFFECT:Play("EV_SINDAN_00_LPA")
  EFFECT:Wait("EV_SINDAN_00_LPA")
  EFFECT:Remove("EV_SINDAN_00_LPA")
  CUT:CancelLoop()
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk03_n021dec"))
  CUT:Play()
  PlaySe_BoostA()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT02"), Speed(20))
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk04_n022wait"))
  CUT:PlayLoop()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  calm = seikakushindan02(type02)
  PlaySe_Select()
  EFFECT:Create("EV_SINDAN_00_LPA", SymEff("EV_SINDAN_01A"))
  EFFECT:SetPosition("EV_SINDAN_00_LPA", EFFECT:GetPosition("EV_SINDAN_00_LP"))
  EFFECT:Play("EV_SINDAN_00_LPA")
  EFFECT:Wait("EV_SINDAN_00_LPA")
  EFFECT:Remove("EV_SINDAN_00_LPA")
  CUT:CancelLoop()
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk05_n031dec"))
  CUT:Play()
  PlaySe_BoostB()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_1_L"), Speed(20))
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk06_n032wait"))
  CUT:PlayLoop()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  flexible = seikakushindan03(type03)
  PlaySe_Select()
  EFFECT:Create("EV_SINDAN_00_LPA", SymEff("EV_SINDAN_01A"))
  EFFECT:SetPosition("EV_SINDAN_00_LPA", EFFECT:GetPosition("EV_SINDAN_00_LP"))
  EFFECT:Play("EV_SINDAN_00_LPA")
  EFFECT:Wait("EV_SINDAN_00_LPA")
  EFFECT:Remove("EV_SINDAN_00_LPA")
  CUT:CancelLoop()
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk07_n041dec"))
  CUT:Play()
  PlaySe_BoostA()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_2_L"), Speed(20))
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk08_n042wait"))
  CUT:PlayLoop()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  serious = seikakushindan04(type04)
  PlaySe_Select()
  EFFECT:Create("EV_SINDAN_00_LPA", SymEff("EV_SINDAN_01A"))
  EFFECT:SetPosition("EV_SINDAN_00_LPA", EFFECT:GetPosition("EV_SINDAN_00_LP"))
  EFFECT:Play("EV_SINDAN_00_LPA")
  EFFECT:Wait("EV_SINDAN_00_LPA")
  EFFECT:Remove("EV_SINDAN_00_LPA")
  CUT:CancelLoop()
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk09_n051dec"))
  CUT:Play()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  PlaySe_BoostB()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_3_L"), Speed(20))
  CUT:Wait()
  CUT:Destroy()
  EFFECT:WaitMove("EV_SINDAN_00_LP")
  CUT:Load(SymCut("sk10_n052wait"))
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:PlayLoop()
  cooperate = seikakushindan05(type05)
  PlaySe_Select()
  EFFECT:Create("EV_SINDAN_00_LPA", SymEff("EV_SINDAN_01A"))
  EFFECT:SetPosition("EV_SINDAN_00_LPA", EFFECT:GetPosition("EV_SINDAN_00_LP"))
  EFFECT:Play("EV_SINDAN_00_LPA")
  EFFECT:Wait("EV_SINDAN_00_LPA")
  EFFECT:Remove("EV_SINDAN_00_LPA")
  CUT:CancelLoop()
  CUT:Wait()
  CUT:Destroy()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:Load(SymCut("sk11_n061dec"))
  CUT:Play()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  PlaySe_BoostA()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_4_L"), Speed(20))
  CUT:Wait()
  CUT:Destroy()
  local basecharname, persontype = seikakuhantei(sunny, calm, flexible, serious, cooperate)
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:Load(SymCut("sk12_n062wait"))
  CUT:PlayLoop()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  charname, chartype = seikakushindan06(persontype)
  PlaySe_Select()
  EFFECT:Create("EV_SINDAN_00_LPA", SymEff("EV_SINDAN_01A"))
  EFFECT:SetPosition("EV_SINDAN_00_LPA", EFFECT:GetPosition("EV_SINDAN_00_LP"))
  EFFECT:Play("EV_SINDAN_00_LPA")
  EFFECT:Wait("EV_SINDAN_00_LPA")
  EFFECT:Remove("EV_SINDAN_00_LPA")
  CUT:CancelLoop()
  CUT:Wait()
  CUT:Destroy()
  GROUND:SetHero(charname, 0)
  CUT:Load(SymCut("sk13_n071dec"))
  CUT:Play()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  PlaySe_BoostB()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_1_R"), Speed(20))
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk14_n072wait"))
  CUT:PlayLoop()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  pertnername = seikakushindan07(chartype, charname)
  PlaySe_Select()
  EFFECT:Create("EV_SINDAN_00_LPA", SymEff("EV_SINDAN_01A"))
  EFFECT:SetPosition("EV_SINDAN_00_LPA", EFFECT:GetPosition("EV_SINDAN_00_LP"))
  EFFECT:Play("EV_SINDAN_00_LPA")
  EFFECT:Wait("EV_SINDAN_00_LPA")
  EFFECT:Remove("EV_SINDAN_00_LPA")
  CUT:CancelLoop()
  CUT:Wait()
  CUT:Destroy()
  GROUND:SetPartner(pertnername, 0)
  EFFECT:Create("EV_SINDAN_00_LPA", SymEff("EV_SINDAN_01A"))
  EFFECT:SetPosition("EV_SINDAN_00_LPA", SymPos("MOVE_EFFECT01_0_C"))
  EFFECT:Play("EV_SINDAN_00_LPA")
  EFFECT:Wait("EV_SINDAN_00_LPA")
  CUT:Load(SymCut("sk15_n081dec"))
  CUT:Play()
  PlaySe_BoostA()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_2_R"), Speed(20))
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk16_n082wait"))
  CUT:PlayLoop()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  pertnergender = seikakushindan08()
  PlaySe_Select()
  EFFECT:Create("EV_SINDAN_00_LPA", SymEff("EV_SINDAN_01A"))
  EFFECT:SetPosition("EV_SINDAN_00_LPA", EFFECT:GetPosition("EV_SINDAN_00_LP"))
  EFFECT:Play("EV_SINDAN_00_LPA")
  EFFECT:Wait("EV_SINDAN_00_LPA")
  EFFECT:Remove("EV_SINDAN_00_LPA")
  CUT:CancelLoop()
  CUT:Wait()
  CUT:Destroy()
  if pertnergender == "BOY" then
    SYSTEM:SetPartnerSex(SEX.MALE)
  else
    SYSTEM:SetPartnerSex(SEX.FEMALE)
  end
  CUT:Load(SymCut("sk17_n091dec"))
  CUT:Play()
  PlaySe_BoostB()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_3_R"), Speed(5))
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk18_n092wait"))
  CUT:PlayLoop()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  local POKEID_HERO, POKEID_PARTNER
  if basecharname == "RIORU" then
    typeRIORU()
  elseif basecharname == "KEROMATSU" then
    typeKEROMATSU()
  elseif basecharname == "HIKOZARU" then
    typeHIKOZARU()
  elseif basecharname == "FUSHIGIDANE" then
    typeFUSHIGIDANE()
  elseif basecharname == "NAETORU" then
    typeNAETORU()
  elseif basecharname == "KIMORI" then
    typeKIMORI()
  elseif basecharname == "WANINOKO" then
    typeWANINOKO()
  elseif basecharname == "POTCHAMA" then
    typePOTCHAMA()
  elseif basecharname == "PIKACHUU" then
    typePIKACHUU()
  elseif basecharname == "HITOKAGE" then
    typeHITOKAGE()
  elseif basecharname == "CHIKORIITA" then
    typeCHIKORIITA()
  elseif basecharname == "ACHAMO" then
    typeACHAMO()
  elseif basecharname == "MIJUMARU" then
    typeMIJUMARU()
  elseif basecharname == "FOKKO" then
    typeFOKKO()
  elseif basecharname == "TSUTAAJA" then
    typeTSUTAAJA()
  elseif basecharname == "HARIMARON" then
    typeHARIMARON()
  elseif basecharname == "HINOARASHI" then
    typeHINOARASHI()
  elseif basecharname == "ZENIGAME" then
    typeZENIGAME()
  elseif basecharname == "POKABU" then
    typePOKABU()
  elseif basecharname == "MIZUGOROU" then
    typeMIZUGOROU()
  end
  CUT:CancelLoop()
  CUT:Wait()
  CUT:Destroy()
  CUT:Load(SymCut("sk19_n101in"))
  CUT:Play()
  EFFECT:MoveTo("EV_SINDAN_00_LP", SymPos("MOVE_EFFECT01_4_R"), Speed(1.66))
  PlaySe_WhiteOut()
  CAMERA:SetFollowEffect("EV_SINDAN_00_LP", 0)
  CUT:Wait()
  CUT:Destroy()
  SCREEN_A:WhiteOut(TimeSec(1.5), true)
  EFFECT:Remove("EV_SINDAN_00_LP")
end
function seikakushindankekka01_end()
end
function seikakushindankekka02_init()
end
function seikakushindankekka02_start()
  local charname = SymAct("HERO"):GetIndex()
  local pertnername = SymAct("PARTNER"):GetIndex()
  MAP:SetVisible(true)
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
end
function seikakushindankekka02_end()
end
function seikakushindankekka02_5_init()
end
function seikakushindankekka02_5_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  EFFECT:Create("effectsmoke01", SymEff("EV_SMOKE_LP"))
  EFFECT:SetPosition("effectsmoke01", SymPos("P00_E_HERO"))
  EFFECT:Create("effectsmoke02", SymEff("EV_SMOKE_LP"))
  EFFECT:SetPosition("effectsmoke02", SymPos("P00_E_PARTNER"))
  EFFECT:SetScale("effectsmoke01", Scale(0.5))
  EFFECT:SetScale("effectsmoke02", Scale(0.5))
  EFFECT:Play("effectsmoke01")
  EFFECT:Play("effectsmoke02")
  result = 0
  reselect = false
  while 1 > result do
    CH("HERO"):SetVisible(false)
    CH("PARTNER"):SetVisible(false)
    SYSTEM:SelectPlayerAndPartnerCharcter(reselect)
    CAMERA:SetEye(SymCam("CAMERA_03"))
    CAMERA:SetTgt(SymCam("CAMERA_03"))
    CHARA:ReloadHeroPartner()
    CH("HERO"):SetVisible(true)
    CH("PARTNER"):SetVisible(true)
    SCREEN_A:FadeIn(TimeSec(1), true)
    WINDOW:SysMsg(-1309240787)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-21560086, 1)
    WINDOW:SelectChain(-408144469, 0)
    WINDOW:DefaultCursor(1)
    result = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    if 1 ~= result then
      reselect = true
      SCREEN_A:WhiteOut(TimeSec(1.5), true)
      SCREEN_B:WhiteOut(TimeSec(1.5), true)
      WINDOW:CloseMessage()
    end
  end
  WINDOW:SysMsg(-863934872)
  WINDOW:SysMsg(-711305431)
  WINDOW:SysMsg(1375882214)
  WINDOW:CloseMessage()
  SOUND:FadeOutBgm(TimeSec(2.5))
  CAMERA:MoveEye(SymCam("CAMERA_04"), Speed(2, ACCEL_TYPE.NONE, DECEL_TYPE.NONE))
  CH("HERO"):DirTo(SymPos("P01_HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  CH("HERO"):WalkTo(SymPos("P01_HERO"), Speed(1))
  EFFECT:MoveTo("effectsmoke01", SymPos("P01_HERO"), Speed(1))
  CH("PARTNER"):DirTo(SymPos("P01_PARTNER"), Speed(350), ROT_TYPE.NEAR)
  CH("PARTNER"):WaitRotate()
  CH("PARTNER"):WalkTo(SymPos("P01_PARTNER"), Speed(1))
  EFFECT:MoveTo("effectsmoke02", SymPos("P01_PARTNER"), Speed(1))
  PlaySe_SeikakuEnd()
  SCREEN_A:WhiteOut(TimeSec(1.5), true)
  TASK:Sleep(TimeSec(1))
  EFFECT:Remove("effectsmoke01")
  EFFECT:Remove("effectsmoke02")
  SCREEN_A:SetColorFilter(Color(1, 1, 1, 1))
  MAP:SetVisible(false)
  CH("HERO"):SetVisible(false)
  CH("PARTNER"):SetVisible(false)
  TASK:Sleep(TimeSec(1))
  SCREEN_A:SetColorFilter(Color(0, 0, 0, 0))
  SCREEN_A:WhiteIn(TimeSec(0.5), true)
  CAMERA:SetFovy(Degree(80))
  TASK:Sleep(TimeSec(2))
end
function seikakushindankekka02_5_end()
end
function setcamera01()
  CAMERA:MoveEye(Vector(4, -2, -7), Speed(10, ACCEL_TYPE.HIGH, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  CAMERA:MoveEye(Vector(0, 0, -5), Speed(5, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
end
function setcamera02()
  CAMERA:MoveEye(Vector(-10, -2, 0), Speed(10, ACCEL_TYPE.HIGH, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  CAMERA:MoveEye(Vector(5, 4, 0), Speed(10, ACCEL_TYPE.LOW, DECEL_TYPE.HIGH))
  CAMERA:WaitMove()
  CAMERA:MoveEye(SymCam("CAMERA_01"), Speed(10, ACCEL_TYPE.LOW, DECEL_TYPE.LOW))
  CAMERA:WaitMove()
end
function seikakushindan01(rand)
  if rand == 0 then
    WINDOW:SysMsg(1259960999)
    WINDOW:SysMsg(180221430)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(329696439, 1)
    WINDOW:SelectChain(948672372, 0)
    WINDOW:DefaultCursor(1)
  else
    WINDOW:SysMsg(563127861)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(1859203314, 1)
    WINDOW:SelectChain(2009727411, 0)
    WINDOW:DefaultCursor(1)
  end
  local id01 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
  halfFadeOut()
  return id01
end
function seikakushindan02(rand)
  if rand == 0 then
    WINDOW:SysMsg(1558663792)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(1174168369, 1)
    WINDOW:SelectChain(-1033601026, 0)
    WINDOW:DefaultCursor(1)
  else
    WINDOW:SysMsg(-612413761)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(403200536, 1)
    WINDOW:SelectChain(18049881, 0)
    WINDOW:DefaultCursor(1)
  end
  local id02 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
  halfFadeOut()
  return id02
end
function seikakushindan03(rand)
  if rand == 0 then
    WINDOW:SysMsg(708720794)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(858065371, 1)
    WINDOW:SelectChain(2086969116, 0)
    WINDOW:DefaultCursor(1)
  else
    WINDOW:SysMsg(1702866525)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(1314061726, 1)
    WINDOW:SelectChain(1464454367, 0)
    WINDOW:DefaultCursor(1)
  end
  local id03 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
  halfFadeOut()
  return id03
end
function seikakushindan04(rand)
  if rand == 0 then
    WINDOW:SysMsg(-791556080)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(-909450927, 1)
    WINDOW:SelectChain(-1598800515, 0)
    WINDOW:DefaultCursor(1)
  else
    WINDOW:SysMsg(-1179710404)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(-1836949505, 1)
    WINDOW:SelectChain(-1952878914, 0)
    WINDOW:DefaultCursor(1)
  end
  local id04 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
  halfFadeOut()
  return id04
end
function seikakushindan05(rand)
  if rand == 0 then
    WINDOW:SysMsg(-992413575)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(-574371528, 1)
    WINDOW:SelectChain(-152134917, 0)
    WINDOW:DefaultCursor(1)
  else
    WINDOW:SysMsg(-269112390)
    WINDOW:SysMsg(1752020853)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(1903593012, 1)
    WINDOW:SelectChain(1029899716, 0)
    WINDOW:DefaultCursor(1)
  end
  local id05 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
  halfFadeOut()
  return id05
end
function seikakuhantei(sunny, calm, flexible, serious, cooperate)
  if sunny == 0 and calm == 0 and (flexible == 0 or flexible == 1) and serious == 1 and cooperate == 0 then
    basecharname = "KIMORI"
    persontype = "OTOKO"
  elseif sunny == 0 and calm == 0 and flexible == 1 and serious == 0 and cooperate == 0 then
    basecharname = "KEROMATSU"
    persontype = "OTOKO"
  elseif sunny == 1 and calm == 1 and flexible == 0 and serious == 0 and cooperate == 0 then
    basecharname = "HIKOZARU"
    persontype = "OTOKO"
  elseif sunny == 1 and calm == 0 and flexible == 1 and serious == 0 and (cooperate == 0 or cooperate == 1) then
    basecharname = "POTCHAMA"
    persontype = "OTOKO"
  elseif sunny == 0 and calm == 0 and flexible == 0 and serious == 0 and (cooperate == 0 or cooperate == 1) then
    basecharname = "NAETORU"
    persontype = "UGOKANAI"
  elseif sunny == 0 and calm == 0 and flexible == 1 and (serious == 0 or serious == 1) and cooperate == 1 then
    basecharname = "FUSHIGIDANE"
    persontype = "UGOKANAI"
  elseif sunny == 0 and calm == 1 and flexible == 0 and (serious == 0 or serious == 1) and cooperate == 0 then
    basecharname = "WANINOKO"
    persontype = "UGOKANAI"
  elseif sunny == 0 and calm == 1 and flexible == 0 and (serious == 0 or serious == 1) and cooperate == 1 then
    basecharname = "CHIKORIITA"
    persontype = "UGOKANAI"
  elseif sunny == 0 and calm == 0 and flexible == 0 and serious == 1 and cooperate == 1 then
    basecharname = "PIKACHUU"
    persontype = "YOIKO"
  elseif sunny == 1 and calm == 0 and flexible == 1 and serious == 1 and cooperate == 0 then
    basecharname = "HITOKAGE"
    persontype = "YOIKO"
  elseif sunny == 0 and calm == 1 and flexible == 1 and (serious == 0 or serious == 1) and cooperate == 0 then
    basecharname = "RIORU"
    persontype = "YOIKO"
  elseif sunny == 1 and calm == 0 and flexible == 1 and serious == 1 and cooperate == 1 then
    basecharname = "ACHAMO"
    persontype = "YOIKO"
  elseif sunny == 1 and calm == 0 and flexible == 0 and serious == 0 and (cooperate == 0 or cooperate == 1) then
    basecharname = "MIJUMARU"
    persontype = "OCHITSUKI"
  elseif sunny == 1 and calm == 0 and flexible == 0 and serious == 1 and (cooperate == 0 or cooperate == 1) then
    basecharname = "FOKKO"
    persontype = "OCHITSUKI"
  elseif sunny == 1 and calm == 1 and flexible == 1 and serious == 0 and cooperate == 0 then
    basecharname = "TSUTAAJA"
    persontype = "OCHITSUKI"
  elseif sunny == 1 and calm == 1 and (flexible == 0 or flexible == 1) and serious == 1 and cooperate == 0 then
    basecharname = "HARIMARON"
    persontype = "OCHITSUKI"
  elseif sunny == 0 and calm == 1 and flexible == 1 and serious == 0 and cooperate == 1 then
    basecharname = "HINOARASHI"
    persontype = "YUTTARI"
  elseif sunny == 1 and calm == 1 and flexible == 0 and (serious == 0 or serious == 1) and cooperate == 1 then
    basecharname = "ZENIGAME"
    persontype = "YUTTARI"
  elseif sunny == 0 and calm == 1 and flexible == 1 and serious == 1 and cooperate == 1 then
    basecharname = "POKABU"
    persontype = "YUTTARI"
  elseif sunny == 1 and calm == 1 and flexible == 1 and (serious == 0 or serious == 1) and cooperate == 1 then
    basecharname = "MIZUGOROU"
    persontype = "YUTTARI"
  else
    WINDOW:SysMsg(611857541)
  end
  return basecharname, persontype
end
function seikakushindan06(persontype)
  if persontype == "OTOKO" then
    WINDOW:SysMsg(257255238)
    WINDOW:SysMsg(374232583)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(1494204608, 1)
    WINDOW:SelectChain(1075114369, 0)
    WINDOW:SelectChain(1798939202, 2)
    WINDOW:SelectChain(1914868483, 3)
    WINDOW:DefaultCursor(1)
    local select01 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
    halfFadeOut()
    if select01 == 1 then
      charname = 485
      chartype = "MIZU"
    elseif select01 == 2 then
      charname = 482
      chartype = "HONOO"
    elseif select01 == 3 then
      charname = 322
      chartype = "KUSA"
    else
      charname = 772
      chartype = "MIZU"
    end
  elseif persontype == "UGOKANAI" then
    WINDOW:SysMsg(-172322868)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(-324944243, 1)
    WINDOW:SelectChain(-2048957791, 0)
    WINDOW:SelectChain(-1664855072, 2)
    WINDOW:SelectChain(-1209466845, 3)
    WINDOW:DefaultCursor(1)
    local select02 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
    halfFadeOut()
    if select02 == 1 then
      charname = 197
      chartype = "KUSA"
    elseif select02 == 2 then
      charname = 479
      chartype = "KUSA"
    elseif select02 == 3 then
      charname = 203
      chartype = "MIZU"
    else
      charname = 1
      chartype = "KUSA"
    end
  elseif persontype == "YOIKO" then
    WINDOW:SysMsg(-1359859358)
    WINDOW:SysMsg(-508319835)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(-123169052, 1)
    WINDOW:SelectChain(-746207961, 0)
    WINDOW:SelectChain(-895552410, 2)
    WINDOW:SelectChain(1292298409, 3)
    WINDOW:DefaultCursor(1)
    local select03 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
    halfFadeOut()
    if select03 == 1 then
      charname = 30
      chartype = "DENKI"
    elseif select03 == 2 then
      charname = 325
      chartype = "HONOO"
    elseif select03 == 3 then
      charname = 537
      chartype = "KAKUTOU"
    else
      charname = 5
      chartype = "HONOO"
    end
  elseif persontype == "OCHITSUKI" then
    WINDOW:SysMsg(1411242472)
    WINDOW:SysMsg(-1754608305)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(-1905132530, 1)
    WINDOW:SelectChain(-1520652339, 0)
    WINDOW:SelectChain(-1136157044, 2)
    WINDOW:SelectChain(-217708469, 3)
    WINDOW:DefaultCursor(1)
    local select04 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
    halfFadeOut()
    if select04 == 1 then
      charname = 598
      chartype = "MIZU"
    elseif select04 == 2 then
      charname = 592
      chartype = "KUSA"
    elseif select04 == 3 then
      charname = 766
      chartype = "KUSA"
    else
      charname = 769
      chartype = "HONOO"
    end
  elseif persontype == "YUTTARI" then
    WINDOW:SysMsg(-367183606)
    WINDOW:SysMsg(-1053791543)
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(-668247160, 1)
    WINDOW:SelectChain(1605584711, 0)
    WINDOW:SelectChain(1185445382, 2)
    WINDOW:SelectChain(802597418, 3)
    WINDOW:DefaultCursor(1)
    local select05 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
    halfFadeOut()
    if select05 == 1 then
      charname = 200
      chartype = "HONOO"
    elseif select05 == 2 then
      charname = 595
      chartype = "HONOO"
    elseif select05 == 3 then
      charname = 329
      chartype = "MIZU"
    else
      charname = 10
      chartype = "MIZU"
    end
  end
  return charname, chartype
end
function seikakushindan07(chartype, charname)
  WINDOW:SysMsg(919444331)
  if chartype == "KAKUTOU" then
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(501270696, 1)
    WINDOW:SelectChain(83622377, 0)
    WINDOW:SelectChain(1270509358, 2)
    WINDOW:SelectChain(1386307183, 3)
    WINDOW:DefaultCursor(1)
    local pselect01 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
    halfFadeOut()
    if pselect01 == 0 then
      pertnername = 769
    elseif pselect01 == 1 then
      pertnername = 772
    elseif pselect01 == 2 then
      pertnername = 766
    else
      pertnername = 30
    end
  elseif chartype == "DENKI" then
    halfFadeIn()
    WINDOW:SelectStart()
    WINDOW:SelectChain(2039221676, 1)
    WINDOW:SelectChain(1620524269, 0)
    WINDOW:SelectChain(-418439134, 2)
    WINDOW:SelectChain(-32239261, 3)
    WINDOW:DefaultCursor(1)
    local pselect02 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
    halfFadeOut()
    if pselect02 == 0 then
      pertnername = 769
    elseif pselect02 == 1 then
      pertnername = 772
    elseif pselect02 == 2 then
      pertnername = 766
    else
      pertnername = 537
    end
  elseif chartype == "MIZU" then
    local rand01 = SYSTEM:GetRandomValue(0, 2)
    if rand01 == 0 then
      halfFadeIn()
      WINDOW:SelectStart()
      WINDOW:SelectChain(2008398460, 1)
      WINDOW:SelectChain(1856932669, 0)
      WINDOW:SelectChain(1166268670, 2)
      WINDOW:SelectChain(1553525183, 3)
      WINDOW:DefaultCursor(1)
      local pselect03 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
      halfFadeOut()
      if pselect03 == 0 then
        pertnername = 537
      elseif pselect03 == 1 then
        pertnername = 482
      elseif pselect03 == 2 then
        pertnername = 325
      else
        pertnername = 769
      end
    else
      halfFadeIn()
      WINDOW:SelectStart()
      WINDOW:SelectChain(333021048, 1)
      WINDOW:SelectChain(180506169, 0)
      WINDOW:SelectChain(569318906, 2)
      WINDOW:SelectChain(955526331, 3)
      WINDOW:DefaultCursor(1)
      local pselect04 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
      halfFadeOut()
      if pselect04 == 0 then
        pertnername = 200
      elseif pselect04 == 1 then
        pertnername = 5
      elseif pselect04 == 2 then
        pertnername = 595
      else
        pertnername = 30
      end
    end
  elseif chartype == "HONOO" then
    local rand01 = SYSTEM:GetRandomValue(0, 2)
    if rand01 == 0 then
      halfFadeIn()
      WINDOW:SelectStart()
      WINDOW:SelectChain(-1083428748, 1)
      WINDOW:SelectChain(-1502150347, 0)
      WINDOW:SelectChain(-821437159, 2)
      WINDOW:SelectChain(-703402920, 3)
      WINDOW:DefaultCursor(1)
      local pselect05 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
      halfFadeOut()
      local rand01 = SYSTEM:GetRandomValue(0, 2)
      if pselect05 == 0 then
        pertnername = 479
      elseif pselect05 == 1 then
        pertnername = 537
      elseif pselect05 == 2 then
        pertnername = 197
      else
        pertnername = 766
      end
    else
      halfFadeIn()
      WINDOW:SelectStart()
      WINDOW:SelectChain(-46153829, 1)
      WINDOW:SelectChain(-467366182, 0)
      WINDOW:SelectChain(-1419438051, 2)
      WINDOW:SelectChain(-1300354724, 3)
      WINDOW:DefaultCursor(1)
      local pselect06 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
      halfFadeOut()
      if pselect06 == 0 then
        pertnername = 322
      elseif pselect06 == 1 then
        pertnername = 592
      elseif pselect06 == 2 then
        pertnername = 1
      else
        pertnername = 30
      end
    end
  elseif chartype == "KUSA" then
    local rand01 = SYSTEM:GetRandomValue(0, 2)
    if rand01 == 0 then
      halfFadeIn()
      WINDOW:SelectStart()
      WINDOW:SelectChain(-1722582369, 1)
      WINDOW:SelectChain(-2142745634, 0)
      WINDOW:SelectChain(131094289, 2)
      WINDOW:SelectChain(516646480, 3)
      WINDOW:DefaultCursor(1)
      local pselect07 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
      halfFadeOut()
      if pselect07 == 0 then
        pertnername = 30
      elseif pselect07 == 1 then
        pertnername = 772
      elseif pselect07 == 2 then
        pertnername = 485
      else
        pertnername = 598
      end
    else
      halfFadeIn()
      WINDOW:SelectStart()
      WINDOW:SelectChain(296644121, 1)
      WINDOW:SelectChain(146104152, 0)
      WINDOW:SelectChain(597167259, 2)
      WINDOW:SelectChain(981679578, 3)
      WINDOW:DefaultCursor(1)
      local pselect08 = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
      halfFadeOut()
      if pselect08 == 0 then
        pertnername = 329
      elseif pselect08 == 1 then
        pertnername = 10
      elseif pselect08 == 2 then
        pertnername = 537
      else
        pertnername = 203
      end
    end
  end
  return pertnername
end
function seikakushindan08()
  WINDOW:SysMsg(1975692061)
  halfFadeIn()
  WINDOW:SelectStart()
  WINDOW:SelectChain(1826200156, 0)
  WINDOW:SelectChain(1207224735, 1)
  WINDOW:DefaultCursor(0)
  local selectgender = WINDOW:SelectEndNotPlayDecideSe(MENU_SELECT_MODE.DISABLE_CANCEL)
  halfFadeOut()
  if selectgender == 0 then
    pertnergender = "BOY"
  else
    pertnergender = "GIRL"
  end
  return pertnergender
end
function halfFadeIn()
  SCREEN_A:FadeChange(Level(0), Level(0.75), TimeSec(0.3), true)
end
function halfFadeOut()
  SCREEN_A:FadeChange(Level(0.75), Level(0), TimeSec(0.3), false)
end
function PlaySe_Select()
  SOUND:StopSe(SymSnd("SE_EVT_LIGHT"))
  SOUND:PlaySe(SymSnd("SE_EVT_LIGHT"), Volume(256))
end
function PlaySe_BoostA()
  SOUND:PlaySe(SymSnd("SE_EVT_LIGHT_BOOST"), Volume(190))
end
function PlaySe_BoostB()
  SOUND:PlaySe(SymSnd("SE_EVT_LIGHT_BOOST_TAKE02"), Volume(190))
end
function PlaySe_WhiteOut()
  SOUND:PlaySe(SymSnd("SE_EVT_SHINDAN_END"), Volume(256))
end
function PlaySe_SeikakuEnd()
  SOUND:PlaySe(SymSnd("SE_EVT_V_WAVE"), Volume(256))
end

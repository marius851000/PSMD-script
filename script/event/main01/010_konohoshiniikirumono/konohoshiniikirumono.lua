dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main01_konohoshiniikirumono01_init()
end
function main01_konohoshiniikirumono01_start()
  TASK:Sleep(TimeSec(1))
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  SCREEN_B:FadeOut(TimeSec(0), false)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SCREEN_A:FadeOut(TimeSec(0), false)
  SOUND:PlayEnv(SymSnd("BGM_EVE_UNIVERSE_01"), Volume(256))
  SCREEN_A:FadeInAll(TimeSec(0), true)
  WINDOW:SetWaitMode(TimeSec(2.5), TimeSec(1.5))
  WINDOW:Narration(TimeSec(1), TimeSec(1), 1768749114)
  WINDOW:Narration(TimeSec(1), TimeSec(1), 1886898555)
  WINDOW:CloseMessage()
  WINDOW:SetWaitMode(TimeSec(-1), TimeSec(-1))
  TASK:Sleep(TimeSec(0.5))
end
function main01_konohoshiniikirumono01_end()
end
function main01_konohoshiniikirumono02_init()
end
function main01_konohoshiniikirumono02_start()
  SOUND:PlayEnv(SymSnd("BGM_EVE_UNIVERSE_01"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(7))
  CAMERA:SetSisaRateVolume(Volume(1))
  CUT:Load(SymCut("m01_010_02"))
  CUT:Play()
  CUT:Wait()
  CUT:Destroy()
end
function main01_konohoshiniikirumono02_cut_talk_01()
  WINDOW:SetWaitMode(TimeSec(3.3), TimeSec(1.5))
  WINDOW:SysMsg(1532664504)
  WINDOW:SysMsg(1111600121)
  WINDOW:SysMsg(218119486)
  WINDOW:CloseMessage()
  WINDOW:SetWaitMode(TimeSec(-1), TimeSec(-1))
end
function main01_konohoshiniikirumono02_cut_script_01()
  SOUND:FadeOutEnv(TimeSec(2.5))
end
function main01_konohoshiniikirumono02_end()
end
function main01_konohoshiniikirumono03_init()
end
function main01_konohoshiniikirumono03_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(7))
  CAMERA:SetSisaRateVolume(Volume(0.4))
  CH("REKKUUZA"):SetShadow(false)
  CH("DEOKISHISU_N"):SetShadow(false)
  SOUND:PlayBgm(SymSnd("BGM_EVE_UNIVERSE_02"), Volume(256))
  CUT:Load(SymCut("m01_010_03"))
  CUT:Play()
  CUT:Wait()
  CUT:Destroy()
end
function main01_konohoshiniikirumono03_cut_talk_01()
  local symbolName = "EV_PRESENTS"
  local eLanguageType = SYSTEM:GetLanguageType()
  if eLanguageType == LANGUAGE_TYPE.JP then
    symbolName = "EV_PRESENTS"
  elseif eLanguageType == LANGUAGE_TYPE.EN then
    symbolName = "EV_PRESENTS"
  elseif eLanguageType == LANGUAGE_TYPE.FR then
    symbolName = "EV_PRESENTS_FR"
  elseif eLanguageType == LANGUAGE_TYPE.GE then
    symbolName = "EV_PRESENTS_GE"
  elseif eLanguageType == LANGUAGE_TYPE.IT then
    symbolName = "EV_PRESENTS_IT"
  elseif eLanguageType == LANGUAGE_TYPE.SP then
    symbolName = "EV_PRESENTS_SP"
  end
  SPRITE:CreatePatternSet("pattern_ev_presents", {
    name = "image_ev_presents",
    img = symbolName,
    u = 0,
    v = 0,
    w = 256,
    h = 128,
    cx = 128,
    cy = 64
  })
  SPRITE:CreateSprite("presents")
  SPRT("presents"):SetPattern({
    setName = "pattern_ev_presents",
    ptnName = "image_ev_presents",
    ofsX = 0,
    ofsY = 0,
    ofsPrio = 0
  })
  SPRT("presents"):SetPosition(Vector2(200, 120))
  SPRT("presents"):ChangeAlpha(0, TimeSec(0))
  SPRT("presents"):ChangeAlpha(1, TimeSec(1))
  TASK:Sleep(TimeSec(5))
  SPRT("presents"):ChangeAlpha(0, TimeSec(1))
  TASK:Sleep(TimeSec(1))
  SPRITE:DestroySprite("presents")
  SPRITE:DestroyPatternSet("pattern_ev_presents")
end
function main01_konohoshiniikirumono03_cut_script_01()
  SOUND:PlaySe(SymSnd("SE_EVT_INSEKI"))
end
function main01_konohoshiniikirumono03_end()
end
function main01_konohoshiniikirumono04_init()
end
function main01_konohoshiniikirumono04_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_UNIVERSE_02"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(1))
  CH("REKKUUZA"):SetShadow(false)
  CH("DEOKISHISU_N"):SetShadow(false)
  CUT:Load(SymCut("m01_010_04"))
  CUT:Play()
  CUT:Wait()
  CUT:Destroy()
end
function main01_konohoshiniikirumono04_cut_script_01()
  SOUND:PlaySe(SymSnd("SE_EVT_DEOKISHISU_FLY"))
end
function main01_konohoshiniikirumono04_cut_talk_01()
  WINDOW:SetWaitMode(TimeSec(1), TimeSec(1))
  WINDOW:Talk(SymAct("DEOKISHISU_N"), 337316991)
  WINDOW:Talk(SymAct("DEOKISHISU_N"), 1060528060)
  WINDOW:CloseMessage()
  SOUND:PlaySe(SymSnd("SE_EVT_REKKUUZA_NEARMISS"))
  WINDOW:SetWaitMode(TimeSec(-1), TimeSec(-1))
end
function main01_konohoshiniikirumono04_cut_talk_02()
  SOUND:PlaySe(SymSnd("SE_EVT_REKKUUZA_ROAR"))
  WINDOW:SysMsg(640511741)
  EFFECT:StartMotionBlur(0, 0, 0)
  EFFECT:ChangeMotionBlurLevel(0.04, TimeSec(5, TIME_TYPE.FRAME))
  EFFECT:ChangeMotionBlurAlpha(0.9, TimeSec(5, TIME_TYPE.FRAME))
  TASK:Sleep(TimeSec(0.5))
  WINDOW:ForceCloseMessage()
end
function main01_konohoshiniikirumono04_cut_03()
  EFFECT:ChangeMotionBlurLevel(0, TimeSec(5, TIME_TYPE.FRAME))
  TASK:Sleep(TimeSec(5, TIME_TYPE.FRAME))
  EFFECT:EndMotionBlur()
end
function main01_konohoshiniikirumono04_end()
end
function main01_konohoshiniikirumono05_init()
end
function main01_konohoshiniikirumono05_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(1))
  SOUND:PlayBgm(SymSnd("BGM_EVE_UNIVERSE_02"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CAMERA:SetFovy(SymCam("CAMERA_01"))
  local taskRekkuuza00 = function()
    CH("REKKUUZA"):SetMotion(SymMot("EV001_FLY01"), LOOP.ON, TimeSec(0))
    CH("REKKUUZA"):MoveHeightTo(Height(300), Speed(5))
    CH("REKKUUZA"):MoveTo(SymPos("P00_REKKUUZA"), Speed(20))
    TASK:Sleep(TimeSec(12))
    CH("REKKUUZA"):ChangeColor(Color(0, 0, 0, 0), TimeSec(30, TIME_TYPE.FRAME))
  end
  TASK:Regist(taskRekkuuza00)
  CH("REKKUUZA"):SetShadow(false)
  SCREEN_A:FadeIn(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("DEOKISHISU_N"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DEOKISHISU_N"), -1581944270)
  WINDOW:Talk(SymAct("DEOKISHISU_N"), -1196539021)
  WINDOW:Talk(SymAct("DEOKISHISU_N"), -1326674350)
  WINDOW:Talk(SymAct("DEOKISHISU_N"), -1443381485)
  WINDOW:Talk(SymAct("DEOKISHISU_N"), -2099581744)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.3), true)
end
function main01_konohoshiniikirumono05_end()
end
function main01_konohoshiniikirumono06_init()
end
function main01_konohoshiniikirumono06_start()
  SOUND:PlayBgm(SymSnd("BGM_EVE_UNIVERSE_02"), Volume(256))
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(1))
  CH("DEOKISHISU_N"):SetShadow(false)
  CUT:Load(SymCut("m01_010_06"))
  CUT:Play()
  CUT:Wait()
  CUT:Destroy()
end
function main01_konohoshiniikirumono06_cut_talk_01()
  WINDOW:SetWaitMode(TimeSec(2), TimeSec(1))
  WINDOW:Talk(SymAct("DEOKISHISU_N"), -1681793647)
  WINDOW:CloseMessage()
  WINDOW:SetWaitMode(TimeSec(-1), TimeSec(-1))
end
function main01_konohoshiniikirumono06_cut_script_01()
  SOUND:FadeOutBgm(TimeSec(3))
end
function main01_konohoshiniikirumono06_end()
end
function main01_konohoshiniikirumono07_init()
end
function main01_konohoshiniikirumono07_start()
  CAMERA:ResetSisaRateVolume()
  CAMERA:ResetSisaAzimuthDifferenceVolume()
  MAP:SetVisible(false)
  MAP:SetBG(SymImg("WALLPAPER_MAIN_CAPTURE_BG01"))
  MAP:SetVisibleBG(true)
  WINDOW:BeginChapter()
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_A:FadeIn(TimeSec(0), true)
  SCREEN_A:FadeInAll(TimeSec(1), false)
  WINDOW:SetWaitMode(TimeSec(2), TimeSec(1))
  WINDOW:Chapter(TimeSec(1.5), TimeSec(1.5), -729789610)
  TASK:Sleep(TimeSec(3))
  SCREEN_A:FadeOutAll(TimeSec(1), true)
  SCREEN_A:FadeOut(TimeSec(0), true)
  WINDOW:EndChapter()
  WINDOW:ForceCloseMessage()
  WINDOW:SetWaitMode(TimeSec(-1), TimeSec(-1))
  SCREEN_A:FadeInAll(TimeSec(0), true)
  MAP:SetVisible(true)
  MAP:SetVisibleBG(false)
end
function main01_konohoshiniikirumono07_end()
end
function main01_konohoshiniikirumono08_init()
end
function main01_konohoshiniikirumono08_start()
  SCREEN_A:FadeInAll(TimeSec(0), true)
  SOUND:FadeInEnv(SymSnd("SE_EVT_WATERFALL_LP"), TimeSec(1), Volume(128))
  TASK:Sleep(TimeSec(0.5))
  WINDOW:Talk(SymAct(""), -845448681)
  WINDOW:Talk(SymAct(""), -424269356)
  WINDOW:Talk(SymAct(""), -5433195)
  WINDOW:Talk(SymAct(""), 2016740442)
  WINDOW:Talk(SymAct(""), 1630418203)
  WINDOW:Talk(SymAct(""), -1571216964)
  WINDOW:Talk(SymAct(""), -1153298179)
  TASK:Sleep(TimeSec(0.5))
  SOUND:FadeOutEnv(TimeSec(2.5))
  SCREEN_A:FadeOutAll(TimeSec(2), true)
  WINDOW:ForceCloseMessage()
  SCREEN_A:FadeInAll(TimeSec(0), true)
  TASK:Sleep(TimeSec(2))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:SetFovy(SymCam("CAMERA_00"))
  CAMERA:MoveFollow(SymCam("CAMERA_01"), Speed(1, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SOUND:FadeInEnv(SymSnd("SE_EVT_WATERFALL_LP"), TimeSec(0.5), Volume(32))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(4))
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main01_konohoshiniikirumono08_end()
end
function main01_konohoshiniikirumono09_init()
end
function main01_konohoshiniikirumono09_start()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:SetFovy(SymCam("CAMERA_00"))
  SOUND:VolumeEnv(Volume(256), TimeSec(0.5))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(1.5))
  WINDOW:Monologue(-1871756482)
  WINDOW:Monologue(-1988857217)
  WINDOW:Monologue(-969546568)
  WINDOW:Monologue(-550578695)
  WINDOW:Monologue(-201095622)
  subEveCloseMsg()
  WINDOW:Monologue(-317147269)
  WINDOW:Monologue(1786817460)
  WINDOW:Monologue(1939577589)
  WINDOW:Monologue(451233497)
  WINDOW:Monologue(67008408)
  subEveCloseMsg()
  WINDOW:Monologue(684926043)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
end
function main01_konohoshiniikirumono09_end()
end
function main01_konohoshiniikirumono10_init()
end
function main01_konohoshiniikirumono10_start()
  SYSTEM:SetProhibitStereoGram(true)
  SOUND:FadeInEnv(SymSnd("SE_EVT_WATERFALL_LP"), TimeSec(0), Volume(256))
  SCREEN_A:FadeOut(TimeSec(0), false)
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  local taskSeDrink = function()
    SOUND:PlaySe(SymSnd("SE_EVT_DRINK"))
    TASK:Sleep(TimeSec(1))
    SOUND:PlaySe(SymSnd("SE_EVT_DRINK"))
    TASK:Sleep(TimeSec(1))
    SOUND:PlaySe(SymSnd("SE_EVT_DRINK"))
  end
  TASK:Regist(taskSeDrink)
  WINDOW:Monologue(835196186)
  TASK:WaitTask()
  subEveCloseMsg()
  WINDOW:Monologue(2122941405)
  WINDOW:Monologue(1737667228)
  WINDOW:Monologue(1287643487)
  subEveCloseMsg()
  WINDOW:Monologue(1436864542)
  WINDOW:KeyWait()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  WINDOW:Monologue(-767767343)
  WINDOW:CloseMessage()
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
  local pokemonIndexHero = SymAct("HERO"):GetIndex()
  if pokemonIndexHero == 30 then
    CH("PIKACHUU_H"):SetVisible(true)
  elseif pokemonIndexHero == 595 then
    CH("POKABU_H"):SetVisible(true)
  elseif pokemonIndexHero == 598 then
    CH("MIJUMARU_H"):SetVisible(true)
  elseif pokemonIndexHero == 592 then
    CH("TSUTAAJA_H"):SetVisible(true)
  elseif pokemonIndexHero == 1 then
    CH("FUSHIGIDANE_H"):SetVisible(true)
  elseif pokemonIndexHero == 5 then
    CH("HITOKAGE_H"):SetVisible(true)
  elseif pokemonIndexHero == 10 then
    CH("ZENIGAME_H"):SetVisible(true)
  elseif pokemonIndexHero == 197 then
    CH("CHIKORIITA_H"):SetVisible(true)
  elseif pokemonIndexHero == 200 then
    CH("HINOARASHI_H"):SetVisible(true)
  elseif pokemonIndexHero == 203 then
    CH("WANINOKO_H"):SetVisible(true)
  elseif pokemonIndexHero == 322 then
    CH("KIMORI_H"):SetVisible(true)
  elseif pokemonIndexHero == 325 then
    CH("ACHAMO_H"):SetVisible(true)
  elseif pokemonIndexHero == 329 then
    CH("MIZUGOROU_H"):SetVisible(true)
  elseif pokemonIndexHero == 479 then
    CH("NAETORU_H"):SetVisible(true)
  elseif pokemonIndexHero == 482 then
    CH("HIKOZARU_H"):SetVisible(true)
  elseif pokemonIndexHero == 485 then
    CH("POTCHAMA_H"):SetVisible(true)
  elseif pokemonIndexHero == 537 then
    CH("RIORU_H"):SetVisible(true)
  elseif pokemonIndexHero == 766 then
    CH("HARIMARON_H"):SetVisible(true)
  elseif pokemonIndexHero == 769 then
    CH("FOKKO_H"):SetVisible(true)
  elseif pokemonIndexHero == 772 then
    CH("KEROMATSU_H"):SetVisible(true)
  end
  CAMERA:SetSisaRateVolume(Volume(0.1))
  MAP:SetBG(SymImg("IMEV0100"))
  MAP:SetVisibleBG(true)
  MAP:SetVisible(false)
  SAJI:CreateSajiPlayer("aqua", "EV01_010_10_AQUA")
  SAJI:CreateSajiPlayer("wave", "EV01_010_10_WAVE")
  SJ("aqua"):SetPosition(Vector2(200, 120))
  SJ("wave"):SetPosition(Vector2(200, 120))
  SJ("aqua"):SetDrawPriority(600)
  SJ("wave"):SetDrawPriority(700)
  SJ("aqua"):SetParallax(0.5)
  SJ("wave"):SetParallax(0.5)
  SJ("aqua"):Play(LOOP.ON)
  SJ("wave"):Play(LOOP.ON)
  SYSTEM:BeginWaterMode()
  SYSTEM:ChangeWaterPokemonBokashi(1, TimeSec(0))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:ChangeWaterPokemonBokashi(0, TimeSec(1))
  TASK:Sleep(TimeSec(2))
  if pokemonIndexHero == 30 then
    CH("PIKACHUU_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 595 then
    CH("POKABU_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 598 then
    CH("MIJUMARU_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 592 then
    CH("TSUTAAJA_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 1 then
    CH("FUSHIGIDANE_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 5 then
    CH("HITOKAGE_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 10 then
    CH("ZENIGAME_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 197 then
    CH("CHIKORIITA_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 200 then
    CH("HINOARASHI_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 203 then
    CH("WANINOKO_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 322 then
    CH("KIMORI_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 325 then
    CH("ACHAMO_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 329 then
    CH("MIZUGOROU_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 479 then
    CH("NAETORU_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 482 then
    CH("HIKOZARU_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 485 then
    CH("POTCHAMA_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 537 then
    CH("RIORU_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 766 then
    CH("HARIMARON_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 769 then
    CH("FOKKO_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  elseif pokemonIndexHero == 772 then
    CH("KEROMATSU_H"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  end
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_01"), Volume(256))
  EFFECT:Create("effectMpExclamation", SymEff("MP_EXCLAMATION"))
  EFFECT:SetPosition("effectMpExclamation", SymPos("P_EFF_01"))
  EFFECT:Play("effectMpExclamation")
  SOUND:WaitSe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_01"))
  WINDOW:Monologue(-886571632)
  WINDOW:Monologue(-2026733984)
  WINDOW:CloseMessage()
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  SYSTEM:EndWaterMode()
  SAJI:DestroySajiPlayer("wave")
  SAJI:DestroySajiPlayer("aqua")
  if pokemonIndexHero == 30 then
    CH("PIKACHUU_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 595 then
    CH("POKABU_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 598 then
    CH("MIJUMARU_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 592 then
    CH("TSUTAAJA_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 1 then
    CH("FUSHIGIDANE_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 5 then
    CH("HITOKAGE_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 10 then
    CH("ZENIGAME_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 197 then
    CH("CHIKORIITA_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 200 then
    CH("HINOARASHI_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 203 then
    CH("WANINOKO_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 322 then
    CH("KIMORI_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 325 then
    CH("ACHAMO_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 329 then
    CH("MIZUGOROU_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 479 then
    CH("NAETORU_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 482 then
    CH("HIKOZARU_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 485 then
    CH("POTCHAMA_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 537 then
    CH("RIORU_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 766 then
    CH("HARIMARON_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 769 then
    CH("FOKKO_H"):ResetFacialMotion()
  elseif pokemonIndexHero == 772 then
    CH("KEROMATSU_H"):ResetFacialMotion()
  end
  SYSTEM:SetProhibitStereoGram(false)
end
function main01_konohoshiniikirumono10_end()
end
function main01_konohoshiniikirumono11_init()
end
function main01_konohoshiniikirumono11_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(1))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("HERO"):SetMotion(SymMot("EV001_LOOK01"), LOOP.ON, TimeSec(0))
  SOUND:PlayEnv(SymSnd("SE_EVT_WATERFALL_LP"), Volume(256))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("HERO"):SetManpu("MP_EXCLAMATION")
  WINDOW:Monologue(-1641459935)
  CH("HERO"):WaitManpu()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CAMERA:MoveFollow2(SymCam("CAMERA_01_5"), Speed(25, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
  CAMERA:SetShake(Vector2(0.02, 0.02), TimeSec(1, TIME_TYPE.FRAME))
  WINDOW:Monologue(-1258021662)
  CAMERA:SetShake(Vector2(0, 0), TimeSec(0))
  CAMERA:WaitMove()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  local taskLookAroundHero01 = function()
    CH("HERO"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
    CH("HERO"):SetManpu("MP_SHOCK_L")
    CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"))
    CH("HERO"):SetManpu("MP_FLY_SWEAT")
    CH("HERO"):WalkTo(SymPos("P00_HERO"), Speed(1), LINK_DIR.OFF)
    CH("HERO"):WaitMove()
    CH("HERO"):DirTo(RotateOffs(-90), Speed(600))
    CH("HERO"):WaitRotate()
    CH("HERO"):DirTo(RotateOffs(180), Speed(600))
    CH("HERO"):WaitRotate()
    CH("HERO"):DirTo(RotateOffs(-70), Speed(600))
    CH("HERO"):WaitRotate()
    CH("HERO"):DirTo(RotateOffs(70), Speed(600))
    CH("HERO"):WaitRotate()
    CH("HERO"):SetManpu("MP_FLY_SWEAT")
  end
  TASK:Regist(taskLookAroundHero01)
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(-1407242845)
  TASK:WaitTask()
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  subEveCloseMsg()
  WINDOW:Talk(SymAct(""), -480330908)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  CH("HERO"):SetManpu("MP_NOTICE_L")
  CH("HERO"):ResetFacialMotion()
  WINDOW:CloseMessage()
  CH("HERO"):DirTo(CH("OOBEMU2"), Speed(350), ROT_TYPE.NEAR)
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Regist(subEveMoveDir, {
    CH("OOBEMU"),
    SymPos("P00_OOBEMU"),
    Speed(3),
    CH("HERO")
  })
  TASK:Regist(subEveMoveDir, {
    CH("OOBEMU2"),
    SymPos("P00_OOBEMU2"),
    Speed(3),
    CH("HERO")
  })
  TASK:Regist(subEveMoveDir, {
    CH("OOBEMU3"),
    SymPos("P00_OOBEMU3"),
    Speed(3),
    CH("HERO")
  })
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  CH("HERO"):DirTo(RotateOffs(20), Speed(100))
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(RotateOffs(-20), Speed(100))
  CH("HERO"):WaitRotate()
  CH("HERO"):WaitRotate()
  TASK:WaitTask()
  WINDOW:Talk(SymAct(""), -96105947)
  WINDOW:CloseMessage()
  CH("HERO"):SetVisible(false)
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  CAMERA:SetFovy(SymCam("CAMERA_04"))
  CH("OOBEMU"):DirTo(CH("OOBEMU3"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU3"):DirTo(CH("OOBEMU"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU3"):WaitRotate()
  CH("OOBEMU"):SetMotion(SymMot("EV100_TALK"), LOOP.ON)
  CH("OOBEMU2"):SetMotion(SymMot("EV100_TALK"), LOOP.ON)
  CH("OOBEMU3"):SetMotion(SymMot("EV100_TALK"), LOOP.ON)
  SOUND:PlaySe(SymSnd("SE_EVT_OOBEMU_SPEAK"))
  WINDOW:SysMsg(-781657626)
  SOUND:WaitSe(SymSnd("SE_EVT_OOBEMU_SPEAK"))
  WINDOW:CloseMessage()
  CH("HERO"):SetVisible(true)
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CAMERA:SetFovy(SymCam("CAMERA_05"))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  WINDOW:DrawFace(324, 20, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(-931927897)
  WINDOW:CloseMessage()
  SOUND:FadeOutEnv(TimeSec(1))
  CAMERA:SetEye(SymCam("CAMERA_06"))
  CAMERA:SetTgt(SymCam("CAMERA_06"))
  CH("HERO"):DirTo(CH("OOBEMU3"), Speed(200))
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("OOBEMU"), Speed(200))
  CH("HERO"):WaitRotate()
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  CH("OOBEMU"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  CH("OOBEMU2"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  CH("OOBEMU3"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  CH("OOBEMU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU3"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU"):WaitRotate()
  SOUND:PlayBgm(SymSnd("BGM_EVE_TENSION_01"), Volume(256))
  CAMERA:MoveFollow(SymCam("CAMERA_07"), Speed(3, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("OOBEMU3"):SetMotion(SymMot("DOUBLE"), LOOP.OFF)
  CH("OOBEMU3"):MoveTo(SymPos("P02_OOBEMU3"), Speed(2.5), LINK_DIR.ON)
  CH("HERO"):DirTo(CH("OOBEMU3"), Speed(500), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.3))
  SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
  SCREEN_A:WhiteChange(Level(0), Level(1), TimeSec(0.02), false)
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  CH("HERO"):SetMotion(SymMot("EV000_SURPRISE"), LOOP.OFF)
  CH("HERO"):MoveTo(SymPos("P02_HERO"), Speed(2.5), LINK_DIR.OFF)
  CH("OOBEMU"):DirTo(SymPos("P02_HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU2"):DirTo(SymPos("P02_HERO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  SCREEN_A:WhiteChange(Level(1), Level(0), TimeSec(0.02), false)
  CH("OOBEMU3"):WaitMove()
  CH("OOBEMU3"):SetMotion(SymMot("BATTLE"), LOOP.ON)
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(1340863592)
  CH("HERO"):WaitMove()
  CH("HERO"):DirTo(CH("OOBEMU3"), Speed(350), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  CH("HERO"):SetMotion(SymMot("EV000_CSWAIT"), LOOP.ON)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow(SymCam("CAMERA_08"), Speed(3, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("OOBEMU"):SetMotion(SymMot("DOUBLE"), LOOP.OFF)
  CH("OOBEMU"):MoveTo(SymPos("P01_OOBEMU"), Speed(2.5), LINK_DIR.ON)
  CH("HERO"):DirTo(CH("OOBEMU"), Speed(500), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.3))
  SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
  SCREEN_A:WhiteChange(Level(0), Level(1), TimeSec(0.02), false)
  CH("HERO"):SetMotion(SymMot("EV000_SURPRISE"), LOOP.OFF)
  CH("HERO"):MoveTo(SymPos("P03_HERO"), Speed(2.5), LINK_DIR.OFF)
  CH("OOBEMU2"):DirTo(SymPos("P03_HERO"), Speed(350), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.1))
  SCREEN_A:WhiteChange(Level(1), Level(0), TimeSec(0.02), false)
  CH("OOBEMU"):WaitMove()
  CH("OOBEMU"):SetMotion(SymMot("BATTLE"), LOOP.ON)
  CH("HERO"):WaitMove()
  CH("HERO"):SetMotion(SymMot("EV000_CSWAIT"), LOOP.ON)
  CH("HERO"):SetMotionRaito(Raito(2))
  CH("OOBEMU3"):SetMotion(SymMot("BATTLE"), LOOP.ON)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  WINDOW:DrawFace(324, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(1458619689)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_09"))
  CAMERA:SetTgt(SymCam("CAMERA_09"))
  TASK:Regist(subEveMoveDir, {
    CH("OOBEMU"),
    SymPos("P02_OOBEMU"),
    Speed(1.5),
    CH("HERO")
  })
  TASK:Regist(subEveMoveDir, {
    CH("OOBEMU3"),
    SymPos("P03_OOBEMU3"),
    Speed(1.5),
    CH("HERO")
  })
  TASK:Regist(Group("oobemu2"), subEveMoveDir, {
    CH("OOBEMU2"),
    SymPos("P02_OOBEMU2"),
    Speed(1.5),
    CH("HERO")
  })
  TASK:Sleep(TimeSec(0.3))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  CH("HERO"):DirTo(RotateOffs(-50), Speed(600))
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(RotateOffs(90), Speed(600))
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(RotateOffs(-50), Speed(600))
  CH("HERO"):WaitRotate()
  TASK:Sleep(TimeSec(0.2))
  CH("OOBEMU"):DirTo(RotateOffs(-40), Speed(200))
  CH("HERO"):WalkTo(SymPos("P04_HERO"), Speed(0.5), LINK_DIR.OFF)
  CH("HERO"):WaitMove()
  CAMERA:SetEye(SymCam("CAMERA_10"))
  CAMERA:SetTgt(SymCam("CAMERA_10"))
  SOUND:PlaySe(SymSnd("SE_EVT_FOOT_STEP_01_LP"))
  CH("HERO"):RunTo(SplinePath(SymPos("P05_HERO"), SymPos("P06_HERO")), Speed(4))
  TASK:Sleep(TimeSec(0.3))
  CH("OOBEMU"):RunTo(SymPos("P03_OOBEMU"), Speed(2))
  TASK:Sleep(TimeSec(0.1))
  CH("OOBEMU3"):RunTo(SymPos("P04_OOBEMU3"), Speed(2))
  CH("OOBEMU2"):RunTo(SymPos("P03_OOBEMU2"), Speed(2))
  TASK:Sleep(TimeSec(1.2))
  SOUND:FadeOutSe(SymSnd("SE_EVT_FOOT_STEP_01_LP"), TimeSec(1.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.PAIN)
  WINDOW:Monologue(1066277125)
  WINDOW:Monologue(647309380)
  WINDOW:KeyWait()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(230194055)
  WINDOW:CloseMessage()
end
function main01_konohoshiniikirumono11_end()
end
function main01_konohoshiniikirumono13_init()
end
function main01_konohoshiniikirumono13_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(2))
  CAMERA:SetSisaRateVolume(Volume(1))
  SOUND:PlayBgm(SymSnd("BGM_EVE_TENSION_01"), Volume(256))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CH("KONOHANA"):WalkTo(SymPos("P00_KONOHANA"), Speed(1.2))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  CH("KONOHANA"):WaitMove()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_02"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_NOTICE_L")
  TASK:Sleep(TimeSec(0.3))
  CAMERA:SetEye(SymCam("CAMERA_01"))
  CAMERA:SetTgt(SymCam("CAMERA_01"))
  CH("HERO"):RunTo(SymPos("P00_HERO"), Speed(4))
  CH("HERO"):WaitMove()
  CH("HERO"):SetMotion(SymMot("EV013_TIRED"), LOOP.ON)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH("HERO"):SetManpu("MP_FLY_SWEAT")
  TASK:Sleep(TimeSec(0.3))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_QUESTION_01"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_QUESTION")
  CH("KONOHANA"):WaitManpu()
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct(""), 346245830)
  WINDOW:Talk(SymAct(""), 1541594113)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_02"))
  CAMERA:SetTgt(SymCam("CAMERA_02"))
  CAMERA:MoveFollow2(SymCam("CAMERA_02_5"), Speed(7, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_02"), Volume(256))
  CH("HERO"):SetManpu("MP_SHOCK_R")
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  TASK:Regist(subEveJumpSurprise, {
    CH("HERO")
  })
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(1123675456)
  CAMERA:WaitMove()
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  TASK:Sleep(TimeSec(0.2))
  CH("KONOHANA"):SetManpu("MP_FLY_SWEAT_LP")
  CH("KONOHANA"):SetMotion(SymMot("SPEAK"), LOOP.ON)
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct(""), 1775550083)
  WINDOW:Talk(SymAct(""), 1892650946)
  WINDOW:CloseMessage()
  CH("KONOHANA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("KONOHANA"):ResetManpu()
  CAMERA:SetEye(SymCam("CAMERA_02_5"))
  CAMERA:SetTgt(SymCam("CAMERA_02_5"))
  TASK:Sleep(TimeSec(0.2))
  WINDOW:DrawFace(20, 88, SymAct("HERO"), FACE_TYPE.SURPRISE)
  WINDOW:Monologue(-145255667)
  WINDOW:Monologue(-296967604)
  WINDOW:CloseMessage()
  CH("HERO"):ResetFacialMotion()
  CAMERA:SetEye(SymCam("CAMERA_04"))
  CAMERA:SetTgt(SymCam("CAMERA_04"))
  TASK:Regist(subEveMoveDir, {
    CH("OOBEMU"),
    SymPos("P00_OOBEMU"),
    Speed(3),
    CH("HERO")
  })
  TASK:Regist(subEveMoveDir, {
    CH("OOBEMU2"),
    SymPos("P00_OOBEMU2"),
    Speed(3),
    CH("HERO")
  })
  TASK:Regist(subEveMoveDir, {
    CH("OOBEMU3"),
    SymPos("P00_OOBEMU3"),
    Speed(3),
    CH("HERO")
  })
  TASK:Sleep(TimeSec(0.3))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH("KONOHANA"):SetManpu("MP_EXCLAMATION")
  TASK:Sleep(TimeSec(0.2))
  CH("HERO"):DirTo(CH("OOBEMU2"), Speed(500), ROT_TYPE.NEAR)
  CH("HERO"):WaitRotate()
  CH("HERO"):SetManpu("MP_SHOCK_L")
  CH("HERO"):SetMotion(SymMot("EV000_CSWAIT"), LOOP.ON)
  TASK:WaitTask()
  CH("KONOHANA"):SetManpu("MP_FLY_SWEAT_LP")
  CH("KONOHANA"):SetMotion(SymMot("SPEAK"), LOOP.ON)
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KONOHANA"), 758888171)
  WINDOW:CloseMessage()
  CH("KONOHANA"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("KONOHANA"):ResetManpu()
  CAMERA:SetEye(SymCam("CAMERA_05"))
  CAMERA:SetTgt(SymCam("CAMERA_05"))
  CH("OOBEMU"):DirTo(CH("OOBEMU3"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU3"):DirTo(CH("OOBEMU"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU3"):WaitRotate()
  CH("OOBEMU"):SetMotion(SymMot("EV100_TALK"), LOOP.ON)
  CH("OOBEMU2"):SetMotion(SymMot("EV100_TALK"), LOOP.ON)
  CH("OOBEMU3"):SetMotion(SymMot("EV100_TALK"), LOOP.ON)
  SOUND:PlaySe(SymSnd("SE_EVT_OOBEMU_SPEAK"))
  WINDOW:SysMsg(874547114)
  SOUND:WaitSe(SymSnd("SE_EVT_OOBEMU_SPEAK"))
  WINDOW:CloseMessage()
  CH("OOBEMU"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  CH("OOBEMU2"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  CH("OOBEMU3"):SetMotion(SymMot("WAIT00"), LOOP.ON)
  CH("OOBEMU"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU3"):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH("OOBEMU"):WaitRotate()
  CAMERA:SetEye(SymCam("CAMERA_03"))
  CAMERA:SetTgt(SymCam("CAMERA_03"))
  CH("OOBEMU"):SetMotion(SymMot("DOUBLE"), LOOP.OFF)
  CH("OOBEMU"):MoveTo(SymPos("P01_OOBEMU"), Speed(2.5), LINK_DIR.ON)
  CH("HERO"):DirTo(CH("OOBEMU"), Speed(500), ROT_TYPE.NEAR)
  TASK:Sleep(TimeSec(0.3))
  SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
  SCREEN_A:WhiteChange(Level(0), Level(1), TimeSec(0.02), false)
  CH("HERO"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  CH("HERO"):SetMotion(SymMot("EV000_SURPRISE"), LOOP.OFF)
  CH("HERO"):MoveTo(SymPos("P02_HERO"), Speed(2.5), LINK_DIR.OFF)
  TASK:Regist(subEveJumpSurprise, {
    CH("KONOHANA")
  })
  TASK:Sleep(TimeSec(0.1))
  SCREEN_A:WhiteChange(Level(1), Level(0), TimeSec(0.02), false)
  CH("OOBEMU"):WaitMove()
  CH("OOBEMU"):SetMotion(SymMot("BATTLE"), LOOP.ON)
  CH("HERO"):WaitMove()
  CH("HERO"):SetMotion(SymMot("EV000_CSWAIT"), LOOP.ON)
  CH("KONOHANA"):SetManpu("MP_FLY_SWEAT_LP")
  CH("KONOHANA"):SetMotion(SymMot("SPEAK"), LOOP.ON)
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KONOHANA"), 521000041)
  WINDOW:CloseMessage()
  CAMERA:MoveFollow(SymCam("CAMERA_06"), Speed(3, ACCEL_TYPE.NONE, DECEL_TYPE.HIGH))
  CH("OOBEMU2"):SetMotion(SymMot("DOUBLE"), LOOP.OFF)
  CH("OOBEMU2"):MoveTo(SymPos("P01_OOBEMU2"), Speed(3.5), LINK_DIR.ON)
  TASK:Sleep(TimeSec(0.3))
  CH("HERO"):DirTo(RotateOffs(-15), Speed(500))
  SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
  SCREEN_A:WhiteChange(Level(0), Level(1), TimeSec(0.02), false)
  CH("KONOHANA"):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  CH("KONOHANA"):SetMotion(SymMot("DAMAGE"), LOOP.OFF)
  CH("KONOHANA"):MoveTo(SymPos("P01_KONOHANA"), Speed(2.5), LINK_DIR.OFF)
  TASK:Sleep(TimeSec(0.1))
  SCREEN_A:WhiteChange(Level(1), Level(0), TimeSec(0.02), false)
  CH("HERO"):SetMotion(SymMot("EV000_SURPRISE"), LOOP.OFF)
  CH("HERO"):MoveTo(SymPos("P03_HERO"), Speed(2.5), LINK_DIR.OFF)
  CH("OOBEMU2"):WaitMove()
  CH("OOBEMU2"):SetMotion(SymMot("BATTLE"), LOOP.ON)
  CH("HERO"):WaitMove()
  CH("HERO"):SetMotion(SymMot("EV000_CSWAIT"), LOOP.ON)
  CH("KONOHANA"):WaitMove()
  CH("KONOHANA"):SetMotion(SymMot("SPEAK"), LOOP.ON)
  CH("OOBEMU3"):WalkTo(SymPos("P01_OOBEMU3"), Speed(1.5))
  WINDOW:DrawFace(324, 88, SymAct("KONOHANA"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("KONOHANA"), 102163752)
  WINDOW:Talk(SymAct("KONOHANA"), 1230468079)
  WINDOW:CloseMessage()
  CAMERA:SetEye(SymCam("CAMERA_07"))
  CAMERA:SetTgt(SymCam("CAMERA_07"))
  SOUND:PlaySe(SymSnd("SE_EVT_FOOT_STEP_01_LP"))
  CH("KONOHANA"):RunTo(SymPos("P02_KONOHANA"), Speed(4))
  TASK:Sleep(TimeSec(0.1))
  CH("HERO"):RunTo(SymPos("P04_HERO"), Speed(4))
  TASK:Sleep(TimeSec(0.8))
  SOUND:FadeOutSe(SymSnd("SE_EVT_FOOT_STEP_01_LP"), TimeSec(0.5))
  SCREEN_A:FadeOut(TimeSec(0.3), true)
end
function main01_konohoshiniikirumono13_end()
end
function groundEnd()
end

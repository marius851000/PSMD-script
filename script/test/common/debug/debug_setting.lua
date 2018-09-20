dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
  CAMERA:MoveToPlayer(TimeSec(0), ACCEL_TYPE.NONE, DECEL_TYPE.HIGH)
  SCREEN_B:FadeInAll(TimeSec(0), false)
  SCREEN_B:FadeIn(TimeSec(0.3), false)
  SCREEN_A:FadeInAll(TimeSec(0), true)
  SCREEN_A:FadeIn(TimeSec(0.3), true)
end
function groundStart()
  FLAG.ScenarioFlag = CONST.SLV_M01_FIRST
  FLAG.SceneFlag = CONST.FL_SC_FIRST
  FLAG.EventIrai = CONST.FLAG_FALSE
  FLAG.M09010SuwannaTalk = CONST.FLAG_FALSE
  FLAG.EventShinkaInfo = CONST.FLAG_FALSE
  FLAG.EventDayCounter = CONST.CNT_0
  FLAG.EventPlayerYarareCheck = CONST.FLAG_FALSE
  FLAG.FreePlay = CONST.FLAG_FALSE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_NONE
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.MapTo = CONST.MAP_TOWN_MID
  FLAG.MapFrom = CONST.MAP_TOWN_MID
  FLAG.MapBgm = CONST.FLAG_TRUE
  FLAG.MapMoveNoFade = CONST.FLAG_FALSE
  FLAG.TownRightFlag = CONST.FLAG_FALSE
  FLAG.TownLeftFlag = CONST.FLAG_FALSE
  FLAG.TownMidFlag = CONST.FLAG_FALSE
  FLAG.TownTopFlag = CONST.FLAG_FALSE
  FLAG.TownYado1fFlag = CONST.FLAG_FALSE
  FLAG.TownYado2fFlag = CONST.FLAG_FALSE
  FLAG.DungeonHitMode = CONST.FLAG_NONE
  FLAG.DunBgmThrough = CONST.FLAG_FALSE
  FLAG.Boss1stClear = CONST.FLAG_FALSE
  FLAG.Boss1stMeet = CONST.FLAG_FALSE
  FLAG.DunClearRest = CONST.FLAG_FALSE
  FLAG.DunRestRet = CONST.FLAG_FALSE
  FLAG.AdvRestPoint1st = CONST.FLAG_FALSE
  FLAG.BigBossFlag = CONST.BOSS_FLAGS_NONE
  FLAG.ParadiseModeOpen = CONST.FLAG_FALSE
  FLAG.ParaMode = CONST.PARA_MODE_SCENARIO
  FLAG.ParaModeChange = CONST.FLAG_FALSE
  FLAG.Para1stIn = CONST.FLAG_TRUE
  FLAG.ParaExpCount = CONST.CNT_1
  FLAG.ParaArea1st = CONST.FLAG_FALSE
  FLAG.ParaMultiStartIn = CONST.FLAG_FALSE
  FLAG.ParaCenterBoardEvent = CONST.FLAG_CHECK_NONE
  FLAG.ParaMultiGateIntro = CONST.CNT_1
  FLAG.ParaPostIntro = CONST.CNT_1
  FLAG.ParaMultiKanban = CONST.CNT_1
  FLAG.ParaMusicArea = CONST.FLAG_TRUE
  FLAG.MultiSpecialFlag = CONST.EVENT_MULTI_NONE
  FLAG.ParaShopPeddler1st = CONST.FLAG_TRUE
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_NONE
  FLAG.EncountArea = CONST.ENCOUNT_AREA_00
  FLAG.EncSankanTryFlag = CONST.FLAG_FALSE
  FLAG.EncSankan_backTryFlag = CONST.FLAG_FALSE
  FLAG.EncSankanEvent_marutaFlag = CONST.FLAG_FALSE
  FLAG.EncSankanTreeFlag = CONST.FLAG_FALSE
  FLAG.EncSankanEvent_hashiFlag = CONST.FLAG_FALSE
  FLAG.EncSankanEvent_mituketaFlag = CONST.FLAG_FALSE
  FLAG.EncSankanEvent_mousukoshiFlag = CONST.FLAG_FALSE
  FLAG.EncKagerouTryFlag = CONST.FLAG_FALSE
  FLAG.EncKagerouMaruta1Flag = CONST.FLAG_FALSE
  FLAG.EncKagerouMaruta2Flag = CONST.FLAG_FALSE
  FLAG.EncKagerouMaruta3Flag = CONST.FLAG_FALSE
  FLAG.EncKagerouMaruta4Flag = CONST.FLAG_FALSE
  FLAG.EncKagerouMaruta5Flag = CONST.FLAG_FALSE
  FLAG.EncKagerouMaruta6Flag = CONST.FLAG_FALSE
  FLAG.EncKagerouThroughFlag = CONST.FLAG_FALSE
  FLAG.EncTontonTryFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_FALSE
  FLAG.EncTontonEventArea = CONST.FLAG_FALSE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_FALSE
  FLAG.EncTontonEnter = CONST.ENT_NONE
  FLAG.EncShikisaiTryFlag = CONST.FLAG_FALSE
  FLAG.EncShikisaiReturnFlag = CONST.FLAG_FALSE
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_NONE
  FLAG.EncShikisaiReproduction = CONST.ENCOUNT_00
  FLAG.EncShikisaiReturnEventFlag = CONST.FLAG_FALSE
  FLAG.EncGuressha_inTryFlag = CONST.FLAG_FALSE
  FLAG.EncDangai_rightTryFlag = CONST.FLAG_FALSE
  FLAG.EncDangai_centerTryFlag = CONST.FLAG_FALSE
  FLAG.EncDangai_leftTryFlag = CONST.FLAG_FALSE
  FLAG.EncFuuketsuTryFlag = CONST.FLAG_FALSE
  FLAG.BikutyiniCounter = CONST.CNT_1
  FLAG.BirijionCounter = CONST.CNT_1
  FLAG.BurakkiiCounter = CONST.CNT_1
  FLAG.ChirachiinoCounter = CONST.CNT_1
  FLAG.ChirachiinoParaCounter = CONST.CNT_1
  FLAG.ChonchiiCounter = CONST.CNT_1
  FLAG.DangoroCounter = CONST.CNT_1
  FLAG.DesukaanCounter = CONST.CNT_1
  FLAG.DesukaanParaCounter = CONST.CNT_1
  FLAG.Dokkoraa_1Counter = CONST.CNT_1
  FLAG.Dokkoraa_2Counter = CONST.CNT_1
  FLAG.DotekkotsuCounter = CONST.CNT_1
  FLAG.EefiCounter = CONST.CNT_1
  FLAG.EmongaCounter = CONST.CNT_1
  FLAG.HaaderiaCounter = CONST.CNT_1
  FLAG.HahakomoriCounter = CONST.CNT_1
  FLAG.HimanattsuCounter = CONST.CNT_1
  FLAG.HiyappuCounter = CONST.CNT_1
  FLAG.IshizumaiCounter = CONST.CNT_1
  FLAG.IwaparesuCounter = CONST.CNT_1
  FLAG.KakureonCounter = CONST.CNT_1
  FLAG.KerudyioCounter = CONST.CNT_1
  FLAG.KoaruhiiCounter = CONST.CNT_1
  FLAG.KojofuuCounter = CONST.CNT_1
  FLAG.Komatana1Counter = CONST.CNT_1
  FLAG.Komatana2Counter = CONST.CNT_1
  FLAG.KumashunCounter = CONST.CNT_1
  FLAG.KurumayuCounter = CONST.CNT_1
  FLAG.KyuremuCounter = CONST.CNT_1
  FLAG.MariruriCounter = CONST.CNT_1
  FLAG.MegurokoCounter = CONST.CNT_1
  FLAG.MeroettaCounter = CONST.CNT_1
  FLAG.MinezumiCounter = CONST.CNT_1
  FLAG.MoguryuuCounter = CONST.CNT_1
  FLAG.NokotchiCounter = CONST.CNT_1
  FLAG.NuooCounter = CONST.CNT_1
  FLAG.PerippaaCounter = CONST.CNT_1
  FLAG.RamuparudoCounter = CONST.CNT_1
  FLAG.RamuparudoParaCounter = CONST.CNT_1
  FLAG.SazandoraCounter = CONST.CNT_1
  FLAG.SutaamiiCounter = CONST.CNT_1
  FLAG.SuwannaCounter = CONST.CNT_1
  FLAG.WashibonCounter = CONST.CNT_1
  FLAG.YabukuronCounter = CONST.CNT_1
  FLAG.YanappuCounter = CONST.CNT_1
  FLAG.YooteriiCounter = CONST.CNT_1
  FLAG.ZurugguCounter = CONST.CNT_1
  FLAG.DebugMeroKenzai = CONST.FLAG_FALSE
  FLAG.DebugMeroBGM = CONST.FLAG_TRUE
end
function EventTriggerPush(symbol)
  if symbol == "NUOO" then
    subFreePlayReachCommon()
    WINDOW:SystemLetter(1319684152)
    WINDOW:SelectStart()
    WINDOW:SelectChain(1471412601, 0)
    WINDOW:SelectChain(2090773178, 1)
    WINDOW:SelectChain(1703255035, 2)
    WINDOW:SelectChain(717491516, 3)
    WINDOW:SelectChain(870268029, 4)
    WINDOW:SelectChain(418541502, 5)
    WINDOW:SelectChain(32071423, 6)
    WINDOW:SelectChain(-2039397840, 999)
    id = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    if id == 0 then
      WINDOW:SelectStart()
      WINDOW:SelectChain(-1620413583, 0)
      WINDOW:SelectChain(-1543242824, 9)
      WINDOW:SelectChain(-1122448647, 10)
      WINDOW:SelectChain(-1774872262, 100)
      WINDOW:SelectChain(-1892767621, 110)
      WINDOW:SelectChain(-1066451268, 200)
      WINDOW:SelectChain(-646705155, 210)
      WINDOW:SelectChain(-229024706, 1)
      WINDOW:SelectChain(-347968129, 1101)
      WINDOW:SelectChain(1826255280, 111)
      WINDOW:SelectChain(1975599345, 211)
      id = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
      WINDOW:CloseMessage()
    elseif id == 1 then
      WINDOW:SelectStart()
      WINDOW:SelectChain(-1229564842, 0)
      WINDOW:SelectChain(-1347590889, 10000)
      WINDOW:SelectChain(-2071972140, 10010)
      WINDOW:SelectChain(-1650784363, 10110)
      WINDOW:SelectChain(-757427886, 10210)
      WINDOW:SelectChain(-876503021, 10001)
      WINDOW:SelectChain(-521342000, 10111)
      WINDOW:SelectChain(-101203311, 10211)
      id = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
      WINDOW:CloseMessage()
    elseif id == 2 then
      WINDOW:SelectStart()
      WINDOW:SelectChain(2121260638, 0)
      WINDOW:SelectChain(1735716639, 20000)
      WINDOW:SelectChain(235549491, 20010)
      WINDOW:SelectChain(386990706, 20020)
      WINDOW:SelectChain(1010586033, 20100)
      WINDOW:SelectChain(623337712, 20110)
      WINDOW:SelectChain(1785132599, 20130)
      WINDOW:SelectChain(1937622902, 20140)
      WINDOW:SelectChain(1481675957, 20200)
      WINDOW:SelectChain(1095476724, 20210)
      WINDOW:SelectChain(-959203013, 20230)
      WINDOW:SelectChain(-540505990, 20240)
      WINDOW:SelectChain(-1814230134, 20001)
      WINDOW:SelectChain(-1966720309, 20021)
      WINDOW:SelectChain(-1578407672, 20121)
      WINDOW:SelectChain(-1192208311, 20141)
      WINDOW:SelectChain(-139342194, 20221)
      WINDOW:SelectChain(-290783281, 20241)
      id = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
      WINDOW:CloseMessage()
    elseif id == 3 then
      WINDOW:SelectStart()
      WINDOW:SelectChain(-980964340, 0)
      WINDOW:SelectChain(-593715891, 30000)
      WINDOW:SelectChain(1527021954, 30010)
      WINDOW:SelectChain(1109373123, 30020)
      WINDOW:SelectChain(727805167, 30025)
      WINDOW:SelectChain(846880174, 30100)
      WINDOW:SelectChain(425135725, 30110)
      WINDOW:SelectChain(4996908, 30120)
      WINDOW:SelectChain(1326295531, 30200)
      WINDOW:SelectChain(1444321450, 30210)
      WINDOW:SelectChain(2101070697, 30220)
      WINDOW:SelectChain(1679882792, 30011)
      WINDOW:SelectChain(-474421529, 30021)
      WINDOW:SelectChain(-89925722, 30022)
      WINDOW:SelectChain(970244865, 30101)
      WINDOW:SelectChain(550498880, 30111)
      WINDOW:SelectChain(199401859, 30121)
      WINDOW:SelectChain(318345410, 30201)
      WINDOW:SelectChain(1572341253, 30211)
      WINDOW:SelectChain(1151547204, 30221)
      id = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
      WINDOW:CloseMessage()
    elseif id == 4 then
      WINDOW:SelectStart()
      WINDOW:SelectChain(1871602823, 0)
      WINDOW:SelectChain(1989498310, 40000)
      WINDOW:SelectChain(-250787575, 40100)
      WINDOW:SelectChain(-401180600, 40200)
      id = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
      WINDOW:CloseMessage()
    elseif id == 5 then
      WINDOW:SelectStart()
      WINDOW:SelectChain(-2123848604, 0)
      WINDOW:SelectChain(-1737255643, 50000)
      WINDOW:SelectChain(-1285634330, 50010)
      WINDOW:SelectChain(-1438255193, 50100)
      WINDOW:SelectChain(-452697760, 50110)
      WINDOW:SelectChain(-65056735, 50200)
      WINDOW:SelectChain(-684588062, 50210)
      WINDOW:SelectChain(-836160861, 50011)
      WINDOW:SelectChain(1236348524, 50101)
      WINDOW:SelectChain(1353326381, 50201)
      id = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
      WINDOW:CloseMessage()
    elseif id == 6 then
      WINDOW:SelectStart()
      WINDOW:SelectChain(-653544398, 0)
      WINDOW:SelectChain(-1072659085, 60000)
      WINDOW:SelectChain(-348268880, 60010)
      WINDOW:SelectChain(-232331279, 60100)
      WINDOW:SelectChain(-1117294282, 60200)
      WINDOW:SelectChain(-1535360905, 60300)
      WINDOW:SelectChain(-1890511948, 60011)
      WINDOW:SelectChain(-1773526283, 60101)
      WINDOW:SelectChain(298991162, 60201)
      WINDOW:SelectChain(147394427, 60301)
      id = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
      WINDOW:CloseMessage()
    elseif id == 999 then
      WINDOW:CloseMessage()
    end
    if id == 9 then
      D00_01()
    elseif id == 10 then
      D00_02()
    elseif id == 100 then
      D00_03()
    elseif id == 110 then
      D00_04()
    elseif id == 200 then
      D00_05()
    elseif id == 210 then
      D00_06()
    elseif id == 1 then
      D00_07()
    elseif id == 1101 then
      D00_07_2()
    elseif id == 111 then
      D00_08()
    elseif id == 211 then
      D00_09()
    elseif id == 10000 then
      D03_01()
    elseif id == 10010 then
      D03_02()
    elseif id == 10110 then
      D03_03()
    elseif id == 10210 then
      D03_04()
    elseif id == 10001 then
      D03_05()
    elseif id == 10111 then
      D03_06()
    elseif id == 10211 then
      D03_07()
    elseif id == 20000 then
      D04_01()
    elseif id == 20010 then
      D04_02()
    elseif id == 20020 then
      D04_03()
    elseif id == 20100 then
      D04_04()
    elseif id == 20110 then
      D04_05()
    elseif id == 20120 then
      D04_06()
    elseif id == 20130 then
      D04_07()
    elseif id == 20140 then
      D04_08()
    elseif id == 20200 then
      D04_09()
    elseif id == 20210 then
      D04_10()
    elseif id == 20220 then
      D04_11()
    elseif id == 20230 then
      D04_12()
    elseif id == 20240 then
      D04_13()
    elseif id == 20001 then
      D04_14()
    elseif id == 20021 then
      D04_15()
    elseif id == 20121 then
      D04_16()
    elseif id == 20141 then
      D04_17()
    elseif id == 20221 then
      D04_18()
    elseif id == 20241 then
      D04_19()
    elseif id == 30000 then
      D06_01()
    elseif id == 30010 then
      D06_02()
    elseif id == 30020 then
      D06_03()
    elseif id == 30025 then
      D06_03_2()
    elseif id == 30100 then
      D06_04()
    elseif id == 30110 then
      D06_05()
    elseif id == 30120 then
      D06_06()
    elseif id == 30200 then
      D06_07()
    elseif id == 30210 then
      D06_08()
    elseif id == 30220 then
      D06_09()
    elseif id == 30011 then
      D06_10()
    elseif id == 30021 then
      D06_11()
    elseif id == 30022 then
      D06_11_2()
    elseif id == 30101 then
      D06_12()
    elseif id == 30111 then
      D06_13()
    elseif id == 30121 then
      D06_14()
    elseif id == 30201 then
      D06_15()
    elseif id == 30211 then
      D06_16()
    elseif id == 30221 then
      D06_17()
    elseif id == 40000 then
      D011_01()
    elseif id == 40010 then
      D011_02()
    elseif id == 40100 then
      D011_03()
    elseif id == 40200 then
      D011_04()
    elseif id == 50000 then
      D015_01()
    elseif id == 50010 then
      D015_02()
    elseif id == 50100 then
      D015_03()
    elseif id == 50110 then
      D015_03_2()
    elseif id == 50200 then
      D015_04()
    elseif id == 50210 then
      D015_04_2()
    elseif id == 50011 then
      D015_05()
    elseif id == 50101 then
      D015_06()
    elseif id == 50201 then
      D015_07()
    elseif id == 60000 then
      D017_01()
    elseif id == 60010 then
      D017_02()
    elseif id == 60100 then
      D017_03()
    elseif id == 60200 then
      D017_04()
    elseif id == 60300 then
      D017_05()
    elseif id == 60011 then
      D017_06()
    elseif id == 60101 then
      D017_07()
    elseif id == 60201 then
      D017_08()
    elseif id == 60301 then
      D017_09()
    elseif id == 999 then
      WINDOW:CloseMessage()
    end
  end
end
function Cleargoplayer()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.MapFlags = CONST.MAP_TOWN_RIGHT
  SYSTEM:NextMapEntry(CONST.MAP_CROSSROAD)
end
function D00_01()
  FLAG.EncSankanTryFlag = CONST.FLAG_FALSE
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.ScenarioFlag = CONST.M01_POKEMONNOSEKAIHE_END
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  SYSTEM:EnterDungeon(Dg(1))
end
function D00_02()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.ScenarioFlag = CONST.M01_SANKANKAIDOURETRY_END
  SYSTEM:EnterDungeon(Dg(1))
end
function D00_03()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.ScenarioFlag = CONST.M01_POKEMONNOSEKAIHE_END
  FLAG.EncSankanEvent_mituketaFlag = CONST.FLAG_FALSE
  SYSTEM:EnterDungeon(Dg(1), DG_WAYPOINT.POINT08)
end
function D00_04()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.ScenarioFlag = CONST.M01_SANKANKAIDOURETRY_END
  FLAG.EncSankanEvent_mituketaFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(1), DG_WAYPOINT.POINT08)
end
function D00_05()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.ScenarioFlag = CONST.M01_POKEMONNOSEKAIHE_END
  FLAG.EncSankanEvent_mousukoshiFlag = CONST.FLAG_FALSE
  SYSTEM:EnterDungeon(Dg(1), DG_WAYPOINT.POINT07)
end
function D00_06()
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.ScenarioFlag = CONST.M01_SANKANKAIDOURETRY_END
  FLAG.EncSankanEvent_mousukoshiFlag = CONST.FLAG_TRUE
  FLAG.EncSankanEvent_mituketaFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(1), DG_WAYPOINT.POINT07)
end
function D00_07()
  FLAG.EncSankan_backTryFlag = CONST.FLAG_FALSE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncSankanEvent_mituketaFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(25))
end
function D00_07_2()
  FLAG.EncSankan_backTryFlag = CONST.FLAG_TRUE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncSankanEvent_mituketaFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(25))
end
function D00_08()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncSankanEvent_mituketaFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(25), DG_WAYPOINT.POINT08)
end
function D00_09()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncSankanEvent_mituketaFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(25), DG_WAYPOINT.POINT07)
end
function D03_01()
  FLAG.EncKagerouTryFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  subEveToProgFadeSet()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M02_KAGEROUTOUGE1ST_END
  SCREEN_B:FadeIn(TimeSec(0.3), true)
  SYSTEM:EnterDungeon(Dg(3))
end
function D03_02()
  SOUND:FadeOutBgm(TimeSec(0.5))
  subEveToProgFadeSet()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M02_KAGEROUTOUGEYARARETA_END
  FLAG.Boss1stClear = CONST.FLAG_TRUE
  SYSTEM:SetDungeonWaypointStat(Dg(3), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SCREEN_B:FadeIn(TimeSec(0.3), true)
  SYSTEM:EnterDungeon(Dg(3))
end
function D03_03()
  SOUND:FadeOutBgm(TimeSec(0.5))
  subEveToProgFadeSet()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M02_KAGEROUTOUGEYARARETA_END
  SCREEN_B:FadeIn(TimeSec(0.3), true)
  SYSTEM:EnterDungeon(Dg(3), DG_WAYPOINT.POINT08)
end
function D03_04()
  SOUND:FadeOutBgm(TimeSec(0.5))
  subEveToProgFadeSet()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M02_KAGEROUTOUGEYARARETA_END
  FLAG.Boss1stClear = CONST.FLAG_TRUE
  SYSTEM:SetDungeonWaypointStat(Dg(3), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SCREEN_B:FadeIn(TimeSec(0.3), true)
  SYSTEM:EnterDungeon(Dg(3), DG_WAYPOINT.POINT07)
end
function D03_05()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.Boss1stClear = CONST.FLAG_TRUE
  SYSTEM:SetDungeonWaypointStat(Dg(3), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(3))
end
function D03_06()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.Boss1stClear = CONST.FLAG_TRUE
  SYSTEM:SetDungeonWaypointStat(Dg(3), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(3), DG_WAYPOINT.POINT08)
end
function D03_07()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.Boss1stClear = CONST.FLAG_TRUE
  SYSTEM:SetDungeonWaypointStat(Dg(3), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(3), DG_WAYPOINT.POINT07)
end
function D04_01()
  FLAG.EncTontonTryFlag = CONST.FLAG_FALSE
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_NUONOOKURIMONO_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_FALSE
  FLAG.EncTontonRightFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_FALSE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(4))
end
function D04_02()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_TONTONYAMAYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4))
end
function D04_03()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_TONTONYAMAYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonEnter = CONST.ENT_RIGHT_DOWN
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4))
end
function D04_04()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_NUONOOKURIMONO_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_FALSE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT03)
end
function D04_05()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_NUONOOKURIMONO_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT03)
end
function D04_06()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_TONTONYAMAYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT03)
end
function D04_07()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_NUONOOKURIMONO_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_FALSE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT03)
end
function D04_08()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_TONTONYAMAYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT03)
end
function D04_09()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_NUONOOKURIMONO_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_FALSE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT07)
end
function D04_10()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_NUONOOKURIMONO_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_FALSE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT07)
end
function D04_11()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_TONTONYAMAYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT07)
end
function D04_12()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_NUONOOKURIMONO_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT07)
end
function D04_13()
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M03_TONTONYAMAYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT07)
end
function D04_14()
  FLAG.EncTontonRightFlag = CONST.FLAG_FASLE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FASLE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4))
end
function D04_15()
  FLAG.EncTontonEnter = CONST.ENT_RIGHT_DOWN
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4))
end
function D04_16()
  FLAG.EncTontonRightFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_FALSE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT03)
end
function D04_17()
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT03)
end
function D04_18()
  FLAG.EncTontonRightFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftFlag = CONST.FLAG_FALSE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_FALSE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_FALSE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_FALSE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT07)
end
function D04_19()
  FLAG.EncTontonRightFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftFlag = CONST.FLAG_TRUE
  FLAG.EncTontonRightLookFlag = CONST.FLAG_TRUE
  FLAG.EncTontonLeftLookFlag = CONST.FLAG_TRUE
  FLAG.EncDown_hashigoFlag = CONST.FLAG_TRUE
  FLAG.EncTontonEventRun = CONST.FLAG_TRUE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:SetDungeonWaypointStat(Dg(4), DG_WAYPOINT.POINT01, DG_WAYPOINT_STAT.AFTER)
  SYSTEM:EnterDungeon(Dg(4), DG_WAYPOINT.POINT07)
end
function D06_01()
  FLAG.EncShikisaiTryFlag = CONST.FLAG_FALSE
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M07_HAHAKOMORIKARANOTANOMI_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  FLAG.EncShikisaiTryFlag = CONST.FLAG_FALSE
  SYSTEM:EnterDungeon(Dg(6))
end
function D06_02()
  FLAG.SceneFlag = CONST.FL_SC_01_END
  FLAG.SCENARIOFLAG = CONST.M07_SHIKISAINOMORIYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  FLAG.EncShikisaiTryFlag = CONST.FLAG_FALSE
  SYSTEM:EnterDungeon(Dg(6))
end
function D06_03()
  FLAG.EncShikisaiReturnEventFlag = CONST.FLAG_FALSE
  FLAG.SceneFlag = CONST.FL_SC_01_END
  FLAG.SCENARIOFLAG = CONST.M07_SHIKISAINOMORIYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  FLAG.EncShikisaiReturnFlag = CONST.FLAG_TRUE
  FLAG.EncShikisaiTryFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT00)
end
function D06_03_2()
  FLAG.EncShikisaiReturnEventFlag = CONST.FLAG_TRUE
  FLAG.SceneFlag = CONST.FL_SC_01_END
  FLAG.SCENARIOFLAG = CONST.M07_SHIKISAINOMORIYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  FLAG.EncShikisaiReturnFlag = CONST.FLAG_TRUE
  FLAG.EncShikisaiTryFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT00)
end
function D06_04()
  FLAG.SceneFlag = CONST.FL_SC_01_END
  FLAG.SCENARIOFLAG = CONST.M07_SHIKISAINOMORIYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_RED
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_01
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT08)
end
function D06_05()
  FLAG.SceneFlag = CONST.FL_SC_01_END
  FLAG.SCENARIOFLAG = CONST.M07_SHIKISAINOMORIYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_BLUE
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_01
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT08)
end
function D06_06()
  FLAG.SceneFlag = CONST.FL_SC_01_END
  FLAG.SCENARIOFLAG = CONST.M07_SHIKISAINOMORIYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_YELLOW
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_01
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT08)
end
function D06_07()
  FLAG.SceneFlag = CONST.FL_SC_01_END
  FLAG.SCENARIOFLAG = CONST.M07_SHIKISAINOMORIYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_RED
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_02
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT07)
end
function D06_08()
  FLAG.SceneFlag = CONST.FL_SC_01_END
  FLAG.SCENARIOFLAG = CONST.M07_SHIKISAINOMORIYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_BLUE
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_02
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT07)
end
function D06_09()
  FLAG.SceneFlag = CONST.FL_SC_01_END
  FLAG.SCENARIOFLAG = CONST.M07_SHIKISAINOMORIYARARETA_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_YELLOW
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_02
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_A:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT07)
end
function D06_10()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncShikisaiTryFlag = CONST.FLAG_FALSE
  SYSTEM:EnterDungeon(Dg(6))
end
function D06_11()
  FLAG.EncShikisaiReturnEventFlag = CONST.FLAG_FALSE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncShikisaiReturnFlag = CONST.FLAG_TRUE
  FLAG.EncShikisaiTryFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT00)
end
function D06_11_2()
  FLAG.EncShikisaiReturnEventFlag = CONST.FLAG_TRUE
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncShikisaiReturnFlag = CONST.FLAG_TRUE
  FLAG.EncShikisaiTryFlag = CONST.FLAG_TRUE
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT00)
end
function D06_12()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_RED
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_01
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT08)
end
function D06_13()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_BLUE
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_01
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT08)
end
function D06_14()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_YELLOW
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_01
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT08)
end
function D06_15()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_RED
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_02
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT07)
end
function D06_16()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_BLUE
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_02
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT07)
end
function D06_17()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  FLAG.EncShikisaiFlower = CONST.ENCOUNT_YELLOW
  FLAG.EncountIndex = CONST.ENCOUNT_INDEX_SHIKISAINOMORI
  FLAG.EncountArea = CONST.ENCOUNT_AREA_02
  SYSTEM:EnterDungeon(Dg(6), DG_WAYPOINT.POINT07)
end
function D011_01()
  FLAG.EncGuressha_inTryFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M11_PALACETOTSUNYUU_END
  SYSTEM:EnterDungeon(Dg(11))
end
function D011_02()
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M11_PALACETOTSUNYUU_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  SYSTEM:EnterDungeon(Dg(11))
end
function D011_03()
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M11_PALACETOTSUNYUU_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  SYSTEM:EnterDungeon(Dg(11), DG_WAYPOINT.POINT08)
end
function D011_04()
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M11_PALACETOTSUNYUU_END
  FLAG.MapFlags = CONST.MAP_EVENT
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  SYSTEM:EnterDungeon(Dg(11), DG_WAYPOINT.POINT07)
end
function D015_01()
  FLAG.EncDangai_rightTryFlag = CONST.FLAG_FALSE
  FLAG.EncDangai_centerTryFlag = CONST.FLAG_FALSE
  FLAG.EncDangai_leftTryFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_SHIROIWANOKOUYATOTSUNYUU_END
  SYSTEM:EnterDungeon(Dg(15))
end
function D015_02()
  FLAG.EncDangai_rightTryFlag = CONST.FLAG_TRUE
  FLAG.EncDangai_centerTryFlag = CONST.FLAG_FALSE
  FLAG.EncDangai_leftTryFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_SHIROIWANOKOUYATOTSUNYUU_END
  SYSTEM:EnterDungeon(Dg(15))
end
function D015_03()
  FLAG.EncDangai_rightTryFlag = CONST.FLAG_TRUE
  FLAG.EncDangai_centerTryFlag = CONST.FLAG_FALSE
  FLAG.EncDangai_leftTryFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_SHIROIWANOKOUYATOTSUNYUU_END
  SYSTEM:EnterDungeon(Dg(15), DG_WAYPOINT.POINT08)
end
function D015_03_2()
  FLAG.EncDangai_rightTryFlag = CONST.FLAG_TRUE
  FLAG.EncDangai_centerTryFlag = CONST.FLAG_TRUE
  FLAG.EncDangai_leftTryFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_SHIROIWANOKOUYATOTSUNYUU_END
  SYSTEM:EnterDungeon(Dg(15), DG_WAYPOINT.POINT08)
end
function D015_04()
  FLAG.EncDangai_rightTryFlag = CONST.FLAG_TRUE
  FLAG.EncDangai_centerTryFlag = CONST.FLAG_TRUE
  FLAG.EncDangai_leftTryFlag = CONST.FLAG_FALSE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_SHIROIWANOKOUYATOTSUNYUU_END
  SYSTEM:EnterDungeon(Dg(15), DG_WAYPOINT.POINT07)
end
function D015_04_2()
  FLAG.EncDangai_rightTryFlag = CONST.FLAG_TRUE
  FLAG.EncDangai_centerTryFlag = CONST.FLAG_TRUE
  FLAG.EncDangai_leftTryFlag = CONST.FLAG_TRUE
  SOUND:FadeOutBgm(TimeSec(0.5))
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_SHIROIWANOKOUYATOTSUNYUU_END
  SYSTEM:EnterDungeon(Dg(15), DG_WAYPOINT.POINT07)
end
function D015_05()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:EnterDungeon(Dg(15))
end
function D015_06()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:EnterDungeon(Dg(15), DG_WAYPOINT.POINT08)
end
function D015_07()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:EnterDungeon(Dg(15), DG_WAYPOINT.POINT07)
end
function D017_01()
  FLAG.EncFuuketsuTryFlag = CONST.FLAG_FALSE
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_AOMIDORINUMATOTSUNYUU_END
  SYSTEM:EnterDungeon(Dg(17))
end
function D017_02()
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_AOMIDORINUMAYARARETA_END
  SYSTEM:EnterDungeon(Dg(17))
end
function D017_03()
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_AOMIDORINUMAYARARETA_END
  SYSTEM:EnterDungeon(Dg(17), DG_WAYPOINT.POINT08)
end
function D017_04()
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_AOMIDORINUMAYARARETA_END
  SYSTEM:EnterDungeon(Dg(17), DG_WAYPOINT.POINT07)
end
function D017_05()
  SCREEN_B:FadeOut(TimeSec(0.5), false)
  SCREEN_A:FadeOut(TimeSec(0.5), true)
  SCREEN_A:FadeOutAll(TimeSec(0), true)
  SCREEN_B:FadeOutAll(TimeSec(0), false)
  SOUND:FadeOutBgm(TimeSec(0.5))
  TASK:Sleep(TimeSec(0.5))
  FLAG.SceneFlag = CONST.FL_SC_01_FIRST
  FLAG.SCENARIOFLAG = CONST.M14_AOMIDORINUMAYARARETA_END
  SYSTEM:EnterDungeon(Dg(17), DG_WAYPOINT.POINT06)
end
function D017_06()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:EnterDungeon(Dg(17))
end
function D017_07()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:EnterDungeon(Dg(17), DG_WAYPOINT.POINT08)
end
function D017_08()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:EnterDungeon(Dg(17), DG_WAYPOINT.POINT07)
end
function D017_09()
  FLAG.ScenarioFlag = CONST.S1_SONOGO_END
  FLAG.FreePlay = CONST.FLAG_TRUE
  FLAG.TrigNextEvent = CONST.FLAG_FALSE
  FLAG.StoryPlayerMode = CONST.ST_MODE_PARTNER
  FLAG.MapFrom = CONST.MAP_TOWN_RIGHT
  SYSTEM:EnterDungeon(Dg(17), DG_WAYPOINT.POINT06)
end
function groundEnd()
end

dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
end
function groundStart()
  WINDOW:SysAllMsg(789752605)
  WINDOW:SysAllMsg(906599004)
  WINDOW:CloseMessage()
end
function EventTriggerIn(symbol)
  if symbol == "@MOV_MAP_CROSS_L" then
    WINDOW:SysMsg(488950175)
    WINDOW:CloseMessage()
  elseif symbol == "@MOV_MAP_CROSS_R" then
    WINDOW:SysMsg(71301342)
    WINDOW:CloseMessage()
  elseif symbol == "@DUN_MAP_CROSS_00" then
    WINDOW:SysMsg(1266576921)
    WINDOW:CloseMessage()
  elseif symbol == "@DUN_MAP_CROSS_01" then
    WINDOW:SysMsg(1382375256)
    WINDOW:CloseMessage()
  end
end
function EventTriggerOut(symbol)
  if symbol == "@MOV_MAP_CROSS_L" then
    WINDOW:SysMsg(2034764955)
    WINDOW:CloseMessage()
  end
end
function EventTriggerPush(symbol)
  if symbol == "@BILL_MAP_CROSS_L" then
    WINDOW:SysAllMsg(1616068058)
    WINDOW:CloseMessage()
    WINDOW:SysAllMsg(-406118123)
    WINDOW:SelectStart()
    WINDOW:SelectChain(-19918764, 1)
    WINDOW:SelectChain(-1739884025, 2)
    WINDOW:SelectChain(-2125444282, 0)
    id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
    if id == 1 then
      WINDOW:CloseMessage()
      billboardTest1()
    elseif id == 2 then
      WINDOW:CloseMessage()
      billboardTest2()
    elseif id == 0 then
      WINDOW:CloseMessage()
      TestExit()
    end
  elseif symbol == "@BILL_MAP_CROSS_R" then
    WINDOW:SysAllMsg(-1434642299)
    WINDOW:CloseMessage()
  end
end
function billboardTest1()
  WINDOW:SysAllMsg(-1285150268)
  WINDOW:SysAllMsg(-64504061)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(-449016254)
  WINDOW:SysAllMsg(-837689983)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(-687149888)
  WINDOW:SysAllMsg(1351806991)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(1233764686)
  WINDOW:SysAllMsg(-1963010583)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(-1813650264)
end
function billboardTest2()
  WINDOW:SysAllMsg(-1194805397)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(-1579973078)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-292417299, 0)
  WINDOW:SelectChain(-142007892, 1)
  WINDOW:SelectChain(-593202577, 2)
  WINDOW:SelectChain(-977321170, 3)
  WINDOW:SelectChain(1109876705, 4)
  WINDOW:SelectChain(1530687136, 5)
  WINDOW:SelectChain(843231884, 6)
  WINDOW:SelectChain(727286733, 7)
  id = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if id == 0 then
    WINDOW:CloseMessage()
    TestExit()
  elseif id == 1 then
    WINDOW:CloseMessage()
    billboardTest2_1()
  elseif id == 2 then
    WINDOW:CloseMessage()
    billboardTest2_2()
  elseif id == 3 then
    WINDOW:CloseMessage()
    billboardTest2_3()
  elseif id == 4 then
    WINDOW:CloseMessage()
    billboardTest2_4()
  elseif id == 5 then
    WINDOW:CloseMessage()
    billboardTest2_5()
  elseif id == 6 then
    WINDOW:CloseMessage()
    billboardTest2_6()
  elseif id == 7 then
    WINDOW:CloseMessage()
    billboardTest2_7()
  end
end
function billboardTest2_1()
  WINDOW:SysAllMsg(7655438)
  WINDOW:SysAllMsg(426762575)
  WINDOW:SysAllMsg(1445885832)
  WINDOW:SysAllMsg(1328891593)
  WINDOW:SysAllMsg(1679299850)
  WINDOW:SysAllMsg(2097357899)
  WINDOW:SysAllMsg(-90490748)
  WINDOW:SysAllMsg(-478148155)
  WINDOW:SysAllMsg(-1349154251)
  WINDOW:SysAllMsg(-1232159884)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(-1650202441)
end
function billboardTest2_2()
  WINDOW:SysAllMsg(-2068260362)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(-872853711)
  WINDOW:SysAllMsg(-756908432)
  WINDOW:SysAllMsg(-103862861)
  WINDOW:SysMsg(-522969870)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(1733034045)
end
function billboardTest2_3()
  WINDOW:SysAllMsg(2119643516)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(388623696)
  WINDOW:SysAllMsg(238214161)
  WINDOW:SysAllMsg(622825426)
  WINDOW:SysMsg(1006943891)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(1933912148)
end
function billboardTest2_4()
  WINDOW:SysAllMsg(1784551701)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(1098074838)
  WINDOW:SysMsg(1483242391)
  WINDOW:CloseMessage()
  WINDOW:SysMsg(-537893032)
end
function billboardTest2_5()
  WINDOW:SysAllMsg(-957655527)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(94126782)
  WINDOW:SysAllMsg(478639103)
  WINDOW:SysAllMsg(933896252)
  WINDOW:SysAllMsg(783356285)
  WINDOW:CloseMessage()
end
function billboardTest2_6()
  WINDOW:SysAllMsg(1643153338)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(2028713723)
  WINDOW:CloseMessage()
end
function billboardTest2_7()
  WINDOW:SysAllMsg(1405543736)
  WINDOW:CloseMessage()
  WINDOW:SysAllMsg(1256051833)
  WINDOW:SysAllMsg(-851064650)
  WINDOW:CloseMessage()
end
function TestExit()
end
function groundEnd()
end

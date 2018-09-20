function testFucnA()
  WINDOW:SwitchTalk({PARTNER_0 = -2052821265, PARTNER_1 = -1665179730})
  WINDOW:CloseMessage()
end
function groundInit()
end
function groundStart()
  if LocalFlag.TestS == "abc" then
    WINDOW:SystemLetter(-1215165331)
    WINDOW:CloseMessage()
  end
  if LocalFlag.TestN == 2 then
    WINDOW:SystemLetter(-1366737620)
    WINDOW:CloseMessage()
  end
  if LocalFlag.TestB == true then
    WINDOW:SystemLetter(-506942485)
    WINDOW:CloseMessage()
  end
  if FLAG.SceneNo == CONST.SCN_0 then
    WINDOW:SwitchTalk({PARTNER_0 = -120350038, PARTNER_1 = -738277015})
    WINDOW:CloseMessage()
    FLAG.SceneNo = CONST.SCN_1
    SYSTEM:NextEntry()
  elseif FLAG.SceneNo == CONST.SCN_1 then
    WINDOW:SwitchTalk({PARTNER_0 = -890898392, PARTNER_1 = 1300096231})
    WINDOW:CloseMessage()
    FLAG.ScenarioFlag = CONST.SF_TEST_S00
    SYSTEM:NextEntry()
  else
    WINDOW:SwitchTalk({PARTNER_0 = 1416025510, PARTNER_1 = 1439655345})
    WINDOW:CloseMessage()
  end
end
function groundEnd()
end
function EventTriggerPush(symbol)
  if symbol == "@iwa" then
    WINDOW:SystemLetter(1288983792)
    CH("HERO"):WalkTo(SymbolPos("@walkTo01"), Speed(5))
    CH("HERO"):WaitMove()
    CH("HERO"):WalkTo(SymbolPos("@walkTo02"), Speed(5))
    CH("HERO"):WaitMove()
    CH("HERO"):WalkTo(SymbolPos("@walkTo03"), Speed(5))
    CH("HERO"):WaitMove()
  end
  if symbol == "@hana" then
    WINDOW:SystemLetter(1744373555)
  end
end

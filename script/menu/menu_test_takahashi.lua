function OpenTestTakahashiMenu()
  MENU:LoadMenuTextPool("message/shop.bin", false)
  FlowSys:Start()
  ShopSys:Start()
  testName = "\227\131\134\227\130\185\227\131\136"
  function FlowSys.Proc.testTakahashiMenuOpen()
    OverFlow:AddAcceptConfirmFlow(144, true)
    FlowSys:Return()
  end
  function FlowSys.Proc.stepDecide()
    ShopSys:Talk("\227\129\145\227\129\163\227\129\166\227\129\132=" .. testName, 0)
    FlowSys:Return()
  end
  function FlowSys.Proc.stepCancel()
    ShopSys:Talk("\227\129\141\227\130\131\227\130\147\227\129\155\227\130\139=" .. testName, 0)
    FlowSys:Return()
  end
  function FlowSys.Proc.step1()
    ShopSys:TalkAskFlowNoClose(SHOP_CARPENTER__WELCOME, FACE_TYPE.NORMAL, {cursorSaveName = "test_top"}, {next = "Exit"}, {
      text = "\228\188\154\232\169\177\227\131\134\227\130\185\227\131\136",
      next = "step2"
    }, {
      text = SHOP_CARPENTER__WELCOME_HOME,
      next = "testTakahashiMenuOpen"
    }, {
      text = SHOP_CARPENTER__WELCOME_HELP,
      next = "testTakahashiMenuOpen"
    })
  end
  function FlowSys.Proc.step2()
    ShopSys:Talk(1900928499, 0)
    ShopSys:Talk(-258331384, 1)
    ShopSys:Talk(1142136978, 2)
    ShopSys:Talk(-1575883240, 3)
    ShopSys:Talk(-2085236558, 4)
    ShopSys:Talk(SHOP_MERCHANT__WELCOME_EXIT, 5)
    FlowSys:Next("Exit")
  end
  function FlowSys.Proc.step3()
  end
  function FlowSys.Proc.Exit()
    FlowSys:Return()
  end
  FlowSys:Call("testTakahashiMenuOpen")
  ShopSys:SysMsg("\227\129\138\227\129\151\227\129\190\227\129\132")
  WINDOW:CloseMessage()
end
function OpenTest(decideAct, cancelAct)
  WINDOW:CloseMessage()
  menu = MENU:CreateNameInputMenu(ScreenType.B)
  menu:SetText(testName)
  function menu:decideAction()
    testName = menu:GetText()
    self:Close()
    decideAct()
  end
  function menu:cancelAction()
    testName = menu:GetText()
    cancelAct()
    self:Close()
  end
  function menu:currentItemChange()
  end
  function menu:openedAction()
  end
  function menu:closedAction()
  end
  function menu:ngAction()
    WINDOW:SetMessageScreenMode(ScreenType.B)
    WINDOW:SysMsg(998639762)
    WINDOW:CloseMessage()
  end
  menu:SetPasswordMode()
  menu:Open()
  MENU:SetFocus(menu)
  MENU:WaitClose(menu)
  menu:Close()
end

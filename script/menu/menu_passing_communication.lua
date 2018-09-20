function OpenPassingCommunicationMenu()
  local OpenDummyBranchMenu = function(text, textYes, textNo)
    local branch = false
    ShopSys:SysMsgAskFlowNoClose("[CN][M:DEBUG]\227\129\182\227\130\147\227\129\141\239\188\136\227\131\128\227\131\159\227\131\188\239\188\137[R]" .. text, nil, nil, {
      text = textYes,
      next = "",
      actTbl = {
        decideAction = function(self)
          branch = true
        end
      }
    }, {
      text = textNo,
      next = "",
      actTbl = {
        decideAction = function(self)
          branch = false
        end
      }
    })
    return branch
  end
  FlowSys:Start()
  function FlowSys.Proc.rescueCheck()
    if DUNGEON_MENU:IsNotRescueDungeon() == true then
      FlowSys:Next("toGiveUp")
      return
    end
    if DUNGEON_MENU:IsCanRescue() == false then
      FlowSys:Next("rescueCountZero")
      return
    end
    if DUNGEON_MENU:IsRescueDorobou() then
      FlowSys:Next("toGiveUp")
      return
    end
    FlowSys:Next("rescueStart")
  end
  function FlowSys.Proc.rescueCountZero()
    ShopSys:SysMsg(1450906994)
    FlowSys:Next("toGiveUp")
  end
  function FlowSys.Proc.rescueStart()
    SYSTEM:ExecuteTutorialHint(SymHint("RESCUE_FIRST_GUIDE"))
    FlowSys:Next("rescueConfirm")
  end
  function FlowSys.Proc.rescueConfirm()
    ShopSys:SysMsgAskFlowNoClose(495927596, nil, nil, {
      text = -993378994,
      next = "OpenPassingCommunicationMenu"
    }, {
      text = -200718913,
      next = "giveUpConfirm"
    })
  end
  function FlowSys.Proc.giveUpConfirm()
    ShopSys:SysMsgAskFlowNoClose(1948476620, nil, nil, {text = 543410877, next = "toGiveUp"}, {
      text = -1411930021,
      next = "rescueConfirm",
      default = true
    })
  end
  function FlowSys.Proc.excuteSaveAndMessageBox()
    WINDOW:SysMsg(-124596352)
    local bResult = SYSTEM:SaveRescueDungeon()
    WINDOW:ForceCloseMessage()
    if bResult then
      WINDOW:SysMsg(-1617239266)
    else
      WINDOW:SysMsg(1697017689)
    end
    WINDOW:CloseMessage()
    FlowSys:Next("saveFinish")
  end
  function FlowSys.Proc.saveFinish()
    SYSTEM:ExecuteTutorialHint(SymHint("RESCUE_TOP_MENU_GUIDE"))
    SYSTEM:ExecuteTutorialHint(SymHint("PASSING_BACKGROUND"))
    ShopSys:SysMsg(PASSING_COMMUNICATION__WIRELESS_OFF_ANNOUNCE)
    ShopSys:SysMsg(-1632172551)
    FlowSys:Next("toTopMenu")
  end
  function FlowSys.Proc.toGiveUp()
    FlowSys:Next("exit")
  end
  function FlowSys.Proc.toTopMenu()
    SetDungeonMenuSelectItem(DungeonMenuSelectItems.SELECT_MENU_DO_RESCUE)
    FlowSys:Next("exit")
  end
  function FlowSys.Proc.exit()
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  FlowSys:Call("rescueCheck")
  FlowSys:Finish()
end
function OpenPassingCommunicationMenu_Win()
  FlowSys:Start()
  function FlowSys.Proc.rescueCheck()
    if DUNGEON_MENU:IsNotRescueDungeon() == true then
      FlowSys:Next("toGiveUp")
      return
    end
    if DUNGEON_MENU:IsCanRescue() == false then
      FlowSys:Next("rescueCountZero")
      return
    end
    if DUNGEON_MENU:IsRescueDorobou() then
      FlowSys:Next("toGiveUp")
      return
    end
    FlowSys:Next("rescueStart")
  end
  function FlowSys.Proc.rescueCountZero()
    ShopSys:SysMsg(1450906994)
    FlowSys:Next("toGiveUp")
  end
  function FlowSys.Proc.rescueStart()
    SYSTEM:ExecuteTutorialHint(SymHint("RESCUE_FIRST_GUIDE"))
    FlowSys:Next("rescueConfirm")
  end
  function FlowSys.Proc.rescueConfirm()
    ShopSys:SysMsgAskFlowNoClose(495927596, nil, nil, {text = -993378994, next = "excuteSave"}, {
      text = -200718913,
      next = "giveUpConfirm"
    })
  end
  function FlowSys.Proc.giveUpConfirm()
    ShopSys:SysMsgAskFlowNoClose(1948476620, nil, nil, {text = 543410877, next = "toGiveUp"}, {
      text = -1411930021,
      next = "rescueConfirm",
      default = true
    })
  end
  function FlowSys.Proc.excuteSave()
    WINDOW:SysMsg(-124596352)
    local bResult = SYSTEM:SaveRescueDungeon()
    WINDOW:ForceCloseMessage()
    if bResult then
      WINDOW:SysMsg(-1617239266)
    else
      WINDOW:SysMsg(1697017689)
    end
    WINDOW:CloseMessage()
    FlowSys:Next("saveFinish")
  end
  function FlowSys.Proc.saveFinish()
    SYSTEM:ExecuteTutorialHint(SymHint("RESCUE_TOP_MENU_GUIDE"))
    FlowSys:Next("toTopMenu")
  end
  function FlowSys.Proc.toGiveUp()
    FlowSys:Next("exit")
  end
  function FlowSys.Proc.toTopMenu()
    SetDungeonMenuSelectItem(DungeonMenuSelectItems.SELECT_MENU_DO_RESCUE)
    FlowSys:Next("exit")
  end
  function FlowSys.Proc.exit()
    WINDOW:CloseMessage()
    FlowSys:Return()
  end
  FlowSys:Call("rescueCheck")
  FlowSys:Finish()
end

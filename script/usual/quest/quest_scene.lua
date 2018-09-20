function QuestScene_None()
  return "none"
end
function QuestScene_Dummy()
  return "none"
end
function QuestScene_Start()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.THINK)
  QuestProduction_GetOwnerObject():SetManpu("MP_FLY_SWEAT")
  QuestProduction_GetOwnerObject():WaitManpu()
  QuestProduction_GetOwnerObject():SetNeckRot(RotateTarget(0), RotateTarget(-30), RotateTarget(0), TimeSec(0.15))
  QuestProduction_GetOwnerObject():WaitNeckRot()
  TASK:Sleep(TimeSec(0.2))
  return "none"
end
function QuestScene_DgStart()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.THINK)
  QuestProduction_GetOwnerObject():SetManpu("MP_EXCLAMATION")
  QuestProduction_GetOwnerObject():WaitManpu()
  subEveDoubleJump(QuestProduction_GetOwnerObject())
  QuestProduction_GetOwnerObject():SetManpu("MP_FLY_SWEAT")
  QuestProduction_GetOwnerObject():WaitManpu()
  QuestProduction_GetOwnerObject():SetNeckRot(RotateTarget(0), RotateTarget(-30), RotateTarget(0), TimeSec(0.15))
  QuestProduction_GetOwnerObject():WaitNeckRot()
  TASK:Sleep(TimeSec(0.2))
  return "none"
end
function QuestScene_DgChallengerStart()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.THINK)
  QuestProduction_GetOwnerObject():SetManpu("MP_EXCLAMATION")
  QuestProduction_GetOwnerObject():WaitManpu()
  subEveDoubleJump(QuestProduction_GetOwnerObject())
  subEveDoubleJump(QuestProduction_GetOwnerObject())
  TASK:Sleep(TimeSec(0.2))
  return "none"
end
function QuestScene_StartRefuse()
  subEveNo(CH("PLAYER"))
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():ResetNeckRot(TimeSec(0.2))
  QuestProduction_GetOwnerObject():WaitNeckRot()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.SAD)
  QuestProduction_GetOwnerObject():SetManpu("MP_UPSET_LP")
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():ResetManpu()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
  return "none"
end
function QuestScene_StartAccept()
  CH("PLAYER"):SetMotion(SymMot("SPEAK"), LOOP.OFF)
  CH("PLAYER"):WaitPlayMotion()
  CH("PLAYER"):WaitPlayMotion()
  CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  QuestProduction_GetOwnerObject():SetManpu("MP_EXCLAMATION")
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.SURPRISE)
  QuestProduction_GetOwnerObject():WaitManpu()
  QuestProduction_GetOwnerObject():ResetNeckRot(TimeSec(0.2))
  QuestProduction_GetOwnerObject():WaitNeckRot()
  subEveDoubleJump(QuestProduction_GetOwnerObject())
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
  subEveNod(CH("PLAYER"))
  return "none"
end
function _ExecutionAsk(pattern)
  local owner = QUEST:GetOwnerSymbol()
  local textId = QUEST:GetNowSystemMessageIdForExecution()
  if pattern == 1 then
    QuestProduction_GetOwnerObject():SetManpu("MP_NOTICE_L")
    QuestProduction_GetOwnerObject():WaitManpu()
  else
    QuestProduction_GetOwnerObject():SetManpu("MP_FLY_SWEAT")
    QuestProduction_GetOwnerObject():WaitManpu()
  end
  WINDOW:SysMsg(textId)
  WINDOW:SelectStart()
  WINDOW:SelectChain(486399770, 0)
  WINDOW:SelectChain(-1999232034, 1)
  local ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if ret == 0 then
    subEveNod(CH("PLAYER"))
    subEveNod(QuestProduction_GetOwnerObject())
    return "true"
  end
  return "false"
end
function _ExecutionAsk_Cancel()
  local owner = QUEST:GetOwnerSymbol()
  local textId
  subEveNo(CH("PLAYER"))
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.SURPRISE)
  QuestProduction_GetOwnerObject():SetManpu("MP_SHOCK_L")
  subEveJump(QuestProduction_GetOwnerObject())
  TASK:Sleep(TimeSec(0.1))
  QuestProduction_GetOwnerObject():WaitManpu()
  TASK:Sleep(TimeSec(0.2))
  WINDOW:SysMsg(1829268629)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1501457457, 0)
  WINDOW:SelectChain(-723383707, 1)
  ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if ret == 1 then
    subEveNod(CH("PLAYER"))
    QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.RELIEF)
    TASK:Sleep(TimeSec(1))
    QuestProduction_GetOwnerObject():ResetManpu()
    QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
    subEveNod(QuestProduction_GetOwnerObject())
    return "true"
  end
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.SAD)
  QuestProduction_GetOwnerObject():SetManpu("MP_UPSET_LP")
  TASK:Sleep(TimeSec(1))
  QuestProduction_GetOwnerObject():ResetManpu()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
  return "false"
end
function QuestScene_Execution()
  return QuestScene_ExecutionCore()
end
function QuestScene_ExecutionCore()
  TASK:Sleep(TimeSec(0.2))
  local ret = _ExecutionAsk(0)
  if ret == "true" then
    return "true"
  end
  return _ExecutionAsk_Cancel()
end
function QuestScene_Disappointed()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.SAD)
  QuestProduction_GetOwnerObject():SetManpu("MP_UPSET_LP")
  TASK:Sleep(TimeSec(1))
  WINDOW:SysMsg(-1331964570)
  WINDOW:CloseMessage()
  QuestProduction_GetOwnerObject():ResetManpu()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
  return "none"
end
function QuestScene_Target()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetTargetObject():SetManpu("MP_QUESTION")
  QuestProduction_GetTargetObject():WaitManpu()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetTargetObject():SetManpu("MP_LAUGH_LP")
  TASK:Sleep(TimeSec(1))
  QuestProduction_GetTargetObject():ResetManpu()
  return "none"
end
function QuestScene_Reward()
  TASK:Sleep(TimeSec(0.3))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.SURPRISE)
  QuestProduction_GetOwnerObject():SetManpu("MP_EXCLAMATION")
  QuestProduction_GetOwnerObject():WaitManpu()
  TASK:Sleep(TimeSec(0.3))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:SysMsg(QUEST:GetNowSystemMessageIdForQuestFinish())
  WINDOW:CloseMessage()
  QuestProduction_GetOwnerObject():SetManpu("MP_LAUGH_LP")
  QuestProduction_Success()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  SYSTEM:ExecuteTutorialHint(SymHint("QUEST_TUTORIAL05"), true)
  subEveDoubleJump(QuestProduction_GetOwnerObject())
  WINDOW:SysMsg(QUEST:GetNowSystemMessageIdForReward())
  WINDOW:CloseMessage()
  QuestProduction_GetOwnerObject():SetMotion(SymMot("PUSH"), LOOP.OFF)
  QuestProduction_GetOwnerObject():SetMotionRaito(Raito(2))
  TASK:Sleep(TimeSec(0.3))
  CH("PLAYER"):SetMotion(SymMot("SPEAK"), LOOP.OFF)
  QuestProduction_GetOwnerObject():WaitPlayMotion()
  QuestProduction_GetOwnerObject():SetMotion(SymMot("WAIT02"), LOOP.ON)
  QuestProduction_GetOwnerObject():SetMotionRaito(Raito(1))
  TASK:Sleep(TimeSec(0.2))
  CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
  return "none"
end
function QuestScene_FriendRewardPlease()
  WINDOW:SysMsg(113627668)
  WINDOW:CloseMessage()
  return "none"
end
function QuestScene_FriendRewardPleaseOk()
  return "none"
end
function QuestScene_FriendRewardItem()
  QuestProduction_GetOwnerObject():SetMotion(SymMot("PUSH"), LOOP.OFF)
  QuestProduction_GetOwnerObject():SetMotionRaito(Raito(2))
  TASK:Sleep(TimeSec(0.3))
  CH("PLAYER"):SetMotion(SymMot("SPEAK"), LOOP.OFF)
  QuestProduction_GetOwnerObject():WaitPlayMotion()
  QuestProduction_GetOwnerObject():SetMotion(SymMot("WAIT02"), LOOP.ON)
  QuestProduction_GetOwnerObject():SetMotionRaito(Raito(1))
  TASK:Sleep(TimeSec(0.2))
  CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  return "none"
end
function QuestScene_FriendRewardPlace()
  return "none"
end
function QuestScene_FriendRewardDungeon()
  return "none"
end
function QuestScene_FriendRewardJoin()
  CH("PLAYER"):SetFacialMotion(FACIAL_MOTION.HAPPY)
  subEveNod(CH("PLAYER"))
  TASK:Sleep(TimeSec(0.2))
  CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PLAYER"):SetFacialMotion(FACIAL_MOTION.NORMAL)
  return "none"
end
function QuestScene_FriendRewardIntroduction()
  return "none"
end
function QuestScene_JoinTeam()
  QuestProduction_GetOwnerObject():SetManpu("MP_SPREE_LP")
  CH("PLAYER"):SetMotion(SymMot("LETSGO"), LOOP.OFF)
  CH("PLAYER"):SetManpu("MP_SPREE_LP")
  subEveDoubleJump(QuestProduction_GetOwnerObject())
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.HAPPY)
  TASK:Sleep(TimeSec(0.3))
  QuestProduction_GetOwnerObject():ResetManpu()
  CH("PLAYER"):ResetManpu()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
  CH("PLAYER"):SetFacialMotion(FACIAL_MOTION.NORMAL)
  CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  TASK:Sleep(TimeSec(0.1))
  return "none"
end
function QuestScene_FinishAfter()
  TASK:Sleep(TimeSec(0.3))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.HAPPY)
  QuestProduction_GetOwnerObject():SetManpu("MP_LAUGH_LP")
  WINDOW:SysMsg(-1969159669)
  WINDOW:CloseMessage()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
  return "none"
end
function QuestScene_GroundGodJob()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.SURPRISE)
  QuestProduction_GetOwnerObject():SetManpu("MP_EXCLAMATION")
  QuestProduction_GetOwnerObject():WaitManpu()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.HAPPY)
  QuestProduction_GetOwnerObject():SetManpu("MP_LAUGH_LP")
  QuestProduction_Success()
  QuestProduction_GetOwnerObject():ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  subEveDoubleJump(QuestProduction_GetOwnerObject())
  return "none"
end
function QuestScene_GroundGodJobForTargetBegin()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetTargetObject():SetManpu("MP_QUESTION")
  QuestProduction_GetTargetObject():WaitManpu()
  TASK:Sleep(TimeSec(0.2))
  QUEST:SetMessageTagSettingFromNowScene()
  WINDOW:SysMsg(-1910539120)
  WINDOW:CloseMessage()
  QuestProduction_GetTargetObject():SetFacialMotion(FACIAL_MOTION.SURPRISE)
  QuestProduction_GetTargetObject():SetManpu("MP_EXCLAMATION")
  QuestProduction_GetTargetObject():WaitManpu()
  TASK:Sleep(TimeSec(0.3))
  return "none"
end
function QuestScene_GroundGodJobForTargetEnd()
  QuestProduction_GetTargetObject():SetFacialMotion(FACIAL_MOTION.HAPPY)
  QuestProduction_GetTargetObject():SetManpu("MP_LAUGH_LP")
  QuestProduction_SuccessBegin()
  QuestProduction_GetTargetObject():ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  subEveDoubleJump(QuestProduction_GetTargetObject())
  QUEST:SetMessageTagSettingFromNowScene()
  WINDOW:SysMsg(760831434)
  WINDOW:CloseMessage()
  QuestProduction_SuccessEnd()
  TASK:Sleep(TimeSec(0.3))
  return "none"
end
function QuestScene_GroundGodJob_GreetFriend()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.SURPRISE)
  QuestProduction_GetOwnerObject():SetManpu("MP_EXCLAMATION")
  QuestProduction_GetOwnerObject():WaitManpu()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.HAPPY)
  QuestProduction_GetOwnerObject():SetManpu("MP_LAUGH_LP")
  QuestProduction_GetOwnerObject():ResetManpu()
  TASK:Sleep(TimeSec(0.2))
  subEveDoubleJump(QuestProduction_GetOwnerObject())
  TASK:Sleep(TimeSec(0.2))
  SCREEN_A:FadeOut(TimeSec(1), false)
  QuestProduction_GetOwnerObject():SetManpu("MP_LAUGH_LP")
  TASK:Sleep(TimeSec(0.2))
  subEveDoubleJump(QuestProduction_GetOwnerObject())
  TASK:Sleep(TimeSec(0.8))
  QUEST:SetMessageTagSettingFromNowScene()
  WINDOW:SysMsg(1358096289)
  WINDOW:CloseMessage()
  SCREEN_A:FadeIn(TimeSec(0.5), true)
  QuestProduction_SuccessForGreet()
  return "none"
end

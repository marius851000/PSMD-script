function QuestScene_JudgeBoughtStart()
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.THINK)
  QuestProduction_GetOwnerObject():SetManpu("MP_FLY_SWEAT")
  QuestProduction_GetOwnerObject():WaitManpu()
  QuestProduction_TalkOwner("\227\129\147\227\129\190\227\129\163\227\129\159\227\129\147\227\129\190\227\129\163\227\129\159", FACE_TYPE.NORMAL)
  QuestProduction_TalkOwner("\227\129\187\227\130\147\227\129\168\227\129\134\227\129\171\227\129\147\227\129\190\227\129\163\227\129\159", FACE_TYPE.NORMAL)
  QuestProduction_GetOwnerObject():SetNeckRot(RotateTarget(0), RotateTarget(-30), RotateTarget(0), TimeSec(0.15))
  QuestProduction_GetOwnerObject():WaitNeckRot()
  TASK:Sleep(TimeSec(0.2))
  return "none"
end
function QuestScene_JudgeShoppingExecution()
  TASK:Sleep(TimeSec(0.2))
  local ret = QuestProduction_ExecutionTalkOwner("\227\129\190\227\129\160\227\128\128\227\129\139\227\129\163\227\129\166\227\129\170\227\129\132\227\129\174\239\188\159", "\227\129\136\227\131\188\227\128\128\227\129\147\227\129\168\227\130\143\227\130\139\227\129\174\239\188\159", 0)
  if ret == "true" then
    return "true"
  end
  if QUEST:IsQuestShoppingRefund() == false then
    WINDOW:SysMsg(-1948680091)
    WINDOW:CloseMessage()
    return "true"
  end
  return QuestProduction_CancelTalkOwnerPartNo("\227\129\187\227\130\147\227\129\168\227\129\134\227\129\171\227\129\147\227\129\168\227\130\143\227\130\139\227\129\174\239\188\159", "\227\129\151\227\130\135\227\129\188\227\131\188\227\130\147", "\227\129\134\227\130\147\227\128\128\227\129\175\227\130\132\227\129\143\227\129\139\227\129\163\227\129\166\227\129\141\227\129\166\227\129\173")
end

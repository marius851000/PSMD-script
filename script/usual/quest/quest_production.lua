function QuestProduction_GetOwnerObject()
  return CH(QUEST:GetOwnerSymbol())
end
function QuestProduction_GetTargetObject()
  return CH(QUEST:GetTargetSymbol())
end
function QuestProduction_Talk(actorSymbol, text, faseType)
  WINDOW:DrawFace(20, 88, SymAct(actorSymbol), faseType)
  WINDOW:Talk(SymAct(actorSymbol), text)
  WINDOW:CloseMessage()
end
function QuestProduction_TalkOwner(sceneTalk, faceType)
  local owner = QUEST:GetOwnerSymbol()
  QuestProduction_Talk(owner, sceneTalk, faceType)
end
function QuestProduction_ExecutionTalkOwner(sceneText0, sceneText0_yes, pattern)
  local owner = QUEST:GetOwnerSymbol()
  if pattern == 1 then
    QuestProduction_GetOwnerObject():SetManpu("MP_NOTICE_L")
    QuestProduction_GetOwnerObject():WaitManpu()
  else
    QuestProduction_GetOwnerObject():SetManpu("MP_FLY_SWEAT")
    QuestProduction_GetOwnerObject():WaitManpu()
  end
  WINDOW:DrawFace(20, 88, SymAct(owner), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct(owner), sceneText0)
  WINDOW:SelectStart()
  WINDOW:SelectChain(486399770, 0)
  WINDOW:SelectChain(-1999232034, 1)
  local ret = WINDOW:SelectEndTalk(MENU_SELECT_MODE.DISABLE_CANCEL)
  if ret == 0 then
    subEveNod(CH("PLAYER"))
    QuestProduction_TalkOwner(sceneText0_yes, FACE_TYPE.NORMAL)
    subEveNod(QuestProduction_GetOwnerObject())
    return "true"
  end
  return "false"
end
function QuestProduction_CancelTalkOwnerPartNo(sceneText0_no, sceneText_refuse_yes, sceneText_refuse_no)
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
  WINDOW:DrawFace(20, 88, SymAct(owner), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct(owner), sceneText0_no)
  QUEST:SetMessageTagSettingFromNowScene()
  WINDOW:SysMsg(1829268629)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1501457457, 0)
  WINDOW:SelectChain(-723383707, 1)
  ret = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  if ret == 1 then
    subEveNod(CH("PLAYER"))
    QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.RELIEF)
    QuestProduction_TalkOwner(sceneText_refuse_no, FACE_TYPE.NORMAL)
    QuestProduction_GetOwnerObject():ResetManpu()
    QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
    subEveNod(QuestProduction_GetOwnerObject())
    return "true"
  end
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.SAD)
  QuestProduction_GetOwnerObject():SetManpu("MP_UPSET_LP")
  TASK:Sleep(TimeSec(0.2))
  QuestProduction_TalkOwner(sceneText_refuse_yes, FACE_TYPE.NORMAL)
  QuestProduction_GetOwnerObject():ResetManpu()
  QuestProduction_GetOwnerObject():SetFacialMotion(FACIAL_MOTION.NORMAL)
  return "false"
end
function QuestProduction_TalkTarget(text, faceType)
  local target = QUEST:GetTargetSymbol()
  QuestProduction_Talk(target, text, faceType)
end
function QuestProduction_Success(noFirstMessage)
  CH("PLAYER"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  TASK:Sleep(TimeSec(0.2))
  CH("PLAYER"):SetManpu("MP_SPREE_LP")
  QUEST:SetMessageTagSettingFromNowScene()
  if not noFirstMessage then
    WINDOW:SysMsg(1859977917)
  end
  local eLanguageType = SYSTEM:GetLanguageType()
  if eLanguageType == LANGUAGE_TYPE.FR then
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS_FR")
  elseif eLanguageType == LANGUAGE_TYPE.GE then
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS_GE")
  elseif eLanguageType == LANGUAGE_TYPE.IT then
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS_IT")
  elseif eLanguageType == LANGUAGE_TYPE.SP then
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS_SP")
  else
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS")
  end
  SJ("sccess"):SetPosition(Vector2(200, 120))
  SJ("sccess"):Play(LOOP.OFF)
  SJ("sccess"):SetVisible(true)
  TASK:Sleep(TimeSec(1))
  SOUND:PlaySe(SymSnd("SE_EVT_PARTY"))
  SAJI:CreateSajiPlayer("confetti", "SCRATCH_CONFETTI")
  SJ("confetti"):SetPosition(Vector2(200, 120))
  SJ("confetti"):SetDrawPriority(500)
  SJ("confetti"):SetParallax(-1)
  SJ("confetti"):Play(LOOP.ON)
  SJ("confetti"):SetVisible(true)
  while SJ("sccess"):IsPause() == false do
    TASK:Sleep(TimeSec(0))
  end
  TASK:Sleep(TimeSec(0.3))
  WINDOW:CloseMessage()
  SAJI:DestroySajiPlayer("sccess")
  SAJI:DestroySajiPlayer("confetti")
  CH("PLAYER"):WaitPlayMotion()
  CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PLAYER"):ResetManpu()
end
function QuestProduction_SuccessBegin()
  CH("PLAYER"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  TASK:Sleep(TimeSec(0.2))
  CH("PLAYER"):SetManpu("MP_SPREE_LP")
  local eLanguageType = SYSTEM:GetLanguageType()
  if eLanguageType == LANGUAGE_TYPE.FR then
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS_FR")
  elseif eLanguageType == LANGUAGE_TYPE.GE then
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS_GE")
  elseif eLanguageType == LANGUAGE_TYPE.IT then
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS_IT")
  elseif eLanguageType == LANGUAGE_TYPE.SP then
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS_SP")
  else
    SAJI:CreateSajiPlayer("sccess", "REQUEST_SCCESS")
  end
  SJ("sccess"):SetPosition(Vector2(200, 120))
  SJ("sccess"):Play(LOOP.OFF)
  SJ("sccess"):SetVisible(true)
  TASK:Sleep(TimeSec(1))
  SOUND:PlaySe(SymSnd("SE_EVT_PARTY"))
  SOUND:PlayMe(SymSnd("ME_MINIGAME_PERFECT"), Volume(256))
  SAJI:CreateSajiPlayer("confetti", "SCRATCH_CONFETTI")
  SJ("confetti"):SetPosition(Vector2(200, 120))
  SJ("confetti"):SetDrawPriority(500)
  SJ("confetti"):SetParallax(-1)
  SJ("confetti"):Play(LOOP.ON)
  SJ("confetti"):SetVisible(true)
  while SJ("sccess"):IsPause() == false do
    TASK:Sleep(TimeSec(0))
  end
  TASK:Sleep(TimeSec(0.3))
  return "none"
end
function QuestProduction_SuccessEnd()
  SAJI:DestroySajiPlayer("sccess")
  SAJI:DestroySajiPlayer("confetti")
  CH("PLAYER"):WaitPlayMotion()
  CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PLAYER"):ResetManpu()
  return "none"
end
function QuestProduction_SuccessForGreet()
  CH("PLAYER"):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  if QUEST:GetOwnerSymbol() == "BANEBUU" then
    CH(QUEST:GetOwnerSymbol()):SetMotion(SymMot("VICTORY"), LOOP.ON)
  else
    CH(QUEST:GetOwnerSymbol()):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  end
  TASK:Sleep(TimeSec(0.2))
  CH("PLAYER"):SetManpu("MP_SPREE_LP")
  CH(QUEST:GetOwnerSymbol()):SetManpu("MP_SPREE_LP")
  QUEST:SetMessageTagSettingFromNowScene()
  TASK:Sleep(TimeSec(1))
  SOUND:PlaySe(SymSnd("SE_EVT_PARTY"))
  SOUND:PlayMe(SymSnd("ME_MINIGAME_PERFECT"), Volume(256))
  SAJI:CreateSajiPlayer("confetti", "SCRATCH_CONFETTI")
  SJ("confetti"):SetPosition(Vector2(200, 120))
  SJ("confetti"):SetDrawPriority(500)
  SJ("confetti"):SetParallax(-1)
  SJ("confetti"):Play(LOOP.ON)
  SJ("confetti"):SetVisible(true)
  TASK:Sleep(TimeSec(3.5))
  TASK:Sleep(TimeSec(0.3))
  WINDOW:CloseMessage()
  SAJI:DestroySajiPlayer("confetti")
  CH("PLAYER"):WaitPlayMotion()
  CH("PLAYER"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("PLAYER"):ResetManpu()
  CH(QUEST:GetOwnerSymbol()):WaitPlayMotion()
  CH(QUEST:GetOwnerSymbol()):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH(QUEST:GetOwnerSymbol()):ResetManpu()
end

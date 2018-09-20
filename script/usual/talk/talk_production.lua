function TalkProduction_GetTalkerObject()
  return CH(SYSTEM:GetTalkSceneTalkerSymbol())
end
function TalkProduction_TalkActorTextId(actorSymbol, textId)
  WINDOW:DrawFace(20, 88, SymAct(actorSymbol), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct(actorSymbol), textId)
  WINDOW:CloseMessage()
end
function TalkProduction_TalkActor(actorSymbol, string)
  WINDOW:DrawFace(20, 88, SymAct(actorSymbol), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct(actorSymbol), string)
  WINDOW:CloseMessage()
end
function TalkProduction_SysMsg(string)
  WINDOW:SysMsg(string)
  WINDOW:CloseMessage()
end

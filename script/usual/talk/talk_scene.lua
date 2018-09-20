function TalkScene_None()
  return "none"
end
function TalkScene_Dummy()
  return "none"
end
function TalkScene_GreetNormal()
  local talker = SYSTEM:GetTalkSceneTalkerSymbol()
  TASK:Regist(subEveDoubleJump, {
    CH(talker)
  })
  TASK:Sleep(TimeSec(0.5))
  CH(talker):SetManpu("MP_SPREE_LP")
  TASK:Sleep(TimeSec(1))
  CH(talker):ResetManpu()
  return "none"
end
function TalkScene_GreetFriendly()
  local talker = SYSTEM:GetTalkSceneTalkerSymbol()
  CH(talker):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  CH(talker):WaitPlayMotion()
  CH(talker):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH(talker):SetManpu("MP_SPREE_LP")
  TASK:Regist(subEveDoubleJump, {
    CH(talker)
  })
  TASK:Sleep(TimeSec(1))
  CH(talker):ResetManpu()
  return "none"
end

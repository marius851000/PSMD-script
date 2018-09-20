function Talk_DailyConversation(symbol)
  local degree0 = CH(symbol):GetDir()
  subUsuComFuncTalkInBasePara2_01(symbol)
  CH(symbol):PlayTalkScene()
  CH(symbol):DirTo(RotateTarget(degree0), Speed(350), ROT_TYPE.NEAR)
  CH(symbol):WaitRotate()
end

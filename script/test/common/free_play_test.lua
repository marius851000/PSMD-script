dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  SCREEN_A:FadeIn(TimeSec(0.5), true)
end
function groundStart()
  free_play_test_msg_01()
end
function free_play_test_msg_01()
  SCREEN_A:FadeIn(TimeSec(0), true)
  WINDOW:SysMsg(552522444)
  WINDOW:SysMsg(972415885)
  WINDOW:CloseMessage()
end
function EventTriggerIn(symbol)
  if symbol == "@POINT_TEST_01" then
    WINDOW:SysMsg(316190798)
    WINDOW:CloseMessage()
  end
end
function EventTriggerOut(symbol)
  if symbol == "@MOV_TEST_01" then
    WINDOW:SysMsg(197361935)
    WINDOW:CloseMessage()
  end
end
function EventTriggerLoop(symbol)
  if symbol == "@MOV_TEST_02" then
    WINDOW:SysMsg(1149376456)
    WINDOW:CloseMessage()
  end
end
function EventTriggerPush(symbol)
  if symbol == "@MOV_TEST_03" then
    WINDOW:SysMsg(1570317961)
    WINDOW:CloseMessage()
  end
end
function groundEnd()
end

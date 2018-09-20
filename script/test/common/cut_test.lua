function cut_test_start()
  while true do
    CUT:Load(SymCut("CUT_TEST_01"))
    CUT:Play()
    CUT:Wait()
    CUT:Destroy()
  end
end
function CutFunction_test02()
  CAMERA:SetShake(Vector2(0.1, 0.1), TimeSec(1, TIME_TYPE.FRAME))
  TASK:Sleep(TimeSec(60, TIME_TYPE.FRAME))
  CAMERA:SetShake(Vector2(0, 0), TimeSec(0, 0))
end
function CutFunction_test01()
  WINDOW:SystemLetter(1474203478)
  WINDOW:CloseMessage()
end
function ground_main()
end
function groundInit()
  CAMERA:SetEye(SymCam("Camera01"))
  CAMERA:SetTgt(SymCam("Camera01"))
end
function groundStart()
  SCREEN_A:FadeIn(TimeSec(0), false)
  SCREEN_A:FadeInAll(TimeSec(0), false)
  while true do
    do
      local nResult = ""
      local selectMenu = MENU:CreateCutSceneSelectMenu()
      NestMenu_SetupDefaultAction(selectMenu, nil)
      function selectMenu:decideAction()
        nResult = self.curItem.text
        self:Close()
      end
      NestMenu_OpenAndCloseWait(selectMenu)
      if nResult ~= "" then
        CUT:Load(SymCut(nResult))
        CUT:Play()
        CUT:Wait()
        CUT:Destroy()
        SCREEN_A:FadeInAll(FADE_TIME_NONE, FALSE)
        SCREEN_B:FadeInAll(FADE_TIME_NONE, FALSE)
        SCREEN_B:FadeIn(FADE_TIME_NONE, FALSE)
        SCREEN_A:FadeIn(FADE_TIME_NONE, FALSE)
      else
        break
      end
    end
  end
end
function groundEnd()
  CUT:Destroy()
end

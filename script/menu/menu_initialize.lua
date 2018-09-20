function MenuInitialize_InitializeSave()
  local bResult = false
  WINDOW:SysMsg(1972592310)
  WINDOW:SelectStart()
  WINDOW:SelectChain(1965058296, 1)
  WINDOW:SelectChain(1174628084, 2)
  WINDOW:DefaultCursor(2)
  local nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
  if nResult == 1 then
    WINDOW:SysMsg(-1830467888)
    WINDOW:SelectStart()
    WINDOW:SelectChain(866496881, 1)
    WINDOW:SelectChain(2024333401, 2)
    WINDOW:DefaultCursor(2)
    local nResult = WINDOW:SelectEnd(MENU_SELECT_MODE.ENABLE_CANCEL)
    if nResult == -1 then
      nResult = 2
    end
    if nResult == 1 then
      WINDOW:SysMsg(-1312974193)
      SYSTEM:DeleteSaveFile()
      WINDOW:ForceCloseMessage()
      WINDOW:SysMsg(-743003761)
      WINDOW:CloseMessage()
      bResult = true
    end
  end
  if bResult then
    return 1
  end
  return 0
end

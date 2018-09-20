function kojima_story_test_start()
  WINDOW:SysMsg(-374066442)
  WINDOW:SelectStart()
  WINDOW:SelectChain(-256965705, 0)
  WINDOW:SelectChain(-612216716, 1)
  WINDOW:SelectChain(-1030135499, 2)
  WINDOW:DefaultCursor(0)
  local result = WINDOW:SelectEnd(MENU_SELECT_MODE.DISABLE_CANCEL)
  WINDOW:CloseMessage()
  if result == 0 then
    return "select1"
  elseif result == 1 then
    return "select2"
  elseif result == 2 then
    return "select3"
  end
end

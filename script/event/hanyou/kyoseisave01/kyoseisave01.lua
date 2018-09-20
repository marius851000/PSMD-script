dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function hanyou_kyoseisave01_init()
end
function hanyou_kyoseisave01_start()
  TASK:Sleep(TimeSec(0.2))
  if Ground_Save(ground) then
    return
  end
end
function hanyou_kyoseisave01_end()
end
function groundEnd()
end

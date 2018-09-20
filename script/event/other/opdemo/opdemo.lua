dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function opdemo01_init()
end
function opdemo01_start()
  CUT:Load(SymCut("opdemo"))
  CUT:Play()
  CUT:Wait()
  CUT:Destroy()
end
function opdemo01_end()
end
function groundEnd()
end

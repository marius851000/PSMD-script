dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function GARUURA(chSymb0, bFirst)
  if bFirst then
    WINDOW:DrawFace(20, 88, SymAct("GARUURA"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("GARUURA"), -104038726)
    WINDOW:KeyWait()
    CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
    WINDOW:DrawFace(20, 88, SymAct("GARUURA"), FACE_TYPE.HAPPY)
    WINDOW:Talk(SymAct("GARUURA"), -522760197)
    WINDOW:CloseMessage()
    CH(chSymb0):ResetFacialMotion()
  else
    WINDOW:DrawFace(20, 88, SymAct("GARUURA"), FACE_TYPE.HAPPY)
    CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
    WINDOW:Talk(SymAct("GARUURA"), -872801224)
    WINDOW:Talk(SymAct("GARUURA"), -756994695)
    WINDOW:CloseMessage()
    CH(chSymb0):ResetFacialMotion()
  end
end
function RUCHABURU(chSymb0, bFirst)
  if bFirst then
    TASK:Regist(subEveJump, {
      CH(chSymb0)
    })
    SOUND:PlaySe(SymSnd("SE_EVT_JUMP_01"), Volume(256))
    WINDOW:DrawFace(20, 88, SymAct("RUCHABURU"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("RUCHABURU"), -1650410562)
    WINDOW:KeyWait()
    WINDOW:Talk(SymAct("RUCHABURU"), -2068083969)
    WINDOW:Talk(SymAct("RUCHABURU"), -1349068484)
    CH(chSymb0):SetMotion(SymMot("ATTACK_ROUND"), LOOP.OFF)
    SOUND:PlaySe(SymSnd("SE_SHOP_RUCHABURU_JUMP"), Volume(256))
    CH(chSymb0):WaitPlayMotion()
    CH(chSymb0):SetMotion(SymMot("WAIT02"), LOOP.ON)
    WINDOW:DrawFace(20, 88, SymAct("RUCHABURU"), FACE_TYPE.SAD)
    WINDOW:Talk(SymAct("RUCHABURU"), -1232213891)
    WINDOW:DrawFace(20, 88, SymAct("RUCHABURU"), FACE_TYPE.PAIN)
    CH(chSymb0):SetManpu("MP_SWEAT_L")
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SWEAT"), Volume(256))
    WINDOW:Talk(SymAct("RUCHABURU"), 823522482)
    CH(chSymb0):WaitManpu()
    WINDOW:DrawFace(20, 88, SymAct("RUCHABURU"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("RUCHABURU"), 672056819)
    WINDOW:Talk(SymAct("RUCHABURU"), -1883987796)
    CH(chSymb0):SetMotion(SymMot("VICTORY"), LOOP.OFF)
    SOUND:PlaySe(SymSnd("SE_SHOP_RUCHABURU_JUMP"), Volume(256))
    CH(chSymb0):WaitPlayMotion()
    CH(chSymb0):SetMotion(SymMot("WAIT02"), LOOP.ON)
    WINDOW:CloseMessage()
  else
    WINDOW:DrawFace(20, 88, SymAct("RUCHABURU"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("RUCHABURU"), -1766878739)
    CH(chSymb0):SetMotion(SymMot("VICTORY"), LOOP.OFF)
    SOUND:PlaySe(SymSnd("SE_SHOP_RUCHABURU_JUMP"), Volume(256))
    CH(chSymb0):WaitPlayMotion()
    CH(chSymb0):SetMotion(SymMot("WAIT02"), LOOP.ON)
    WINDOW:CloseMessage()
  end
end
function KAKUREON(chSymb0, bFirst)
  if bFirst then
    CH(chSymb0):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
    CH(chSymb0):WaitRotate()
    CH(chSymb0):SetManpu("MP_SPREE_LP")
    CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
    WINDOW:DrawFace(20, 88, SymAct("KAKUREON"), FACE_TYPE.HAPPY)
    WINDOW:Talk(SymAct("KAKUREON"), -1115504082)
    WINDOW:KeyWait()
    CH(chSymb0):ResetManpu()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_SHOCK_01"), Volume(256))
    TASK:Regist(subEveJumpSurprise, {
      CH(chSymb0)
    })
    CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
    WINDOW:DrawFace(20, 88, SymAct("KAKUREON"), FACE_TYPE.SURPRISE)
    WINDOW:Talk(SymAct("KAKUREON"), -1533414545)
    WINDOW:KeyWait()
    SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
    CH(chSymb0):SetManpu("MP_FLY_SWEAT")
    WINDOW:Talk(SymAct("KAKUREON"), -338139736)
    WINDOW:KeyWait()
    CH(chSymb0):ResetFacialMotion()
    WINDOW:DrawFace(20, 88, SymAct("KAKUREON"), FACE_TYPE.NORMAL)
    WINDOW:Talk(SymAct("KAKUREON"), -222079767)
    WINDOW:KeyWait()
  end
end
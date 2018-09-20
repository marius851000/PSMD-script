dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function MIRUTANKU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("MIRUTANKU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("MIRUTANKU"), 1107054474)
  WINDOW:Talk(SymAct("MIRUTANKU"), 1491566283)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function YAMIKARASU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("YAMIKARASU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("YAMIKARASU"), 1942629640)
  WINDOW:DrawFace(20, 88, SymAct("YAMIKARASU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("YAMIKARASU"), 1792089161)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function BURUU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("BURUU"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("BURUU"), 630229646)
  WINDOW:Talk(SymAct("BURUU"), 1015790543)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function DOREDYIA(chSymb0)
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  WINDOW:DrawFace(20, 88, SymAct("DOREDYIA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("DOREDYIA"), 396814348)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function KOJOFUU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KOJOFUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KOJOFUU"), 247322957)
  WINDOW:CloseMessage()
end
function MASSUGUMA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("MASSUGUMA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MASSUGUMA"), -1994013310)
  WINDOW:CloseMessage()
  CH(chSymb0):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  CH(chSymb0):WaitPlayMotion()
  SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
  CH(chSymb0):SetMotion(SymMot("ATTACK"), LOOP.OFF)
  CH("HERO"):SetMotion(SymMot("DAMAGE"), LOOP.OFF)
  subEveJump(CH("HERO"))
  subEveFlash()
  CH(chSymb0):WaitPlayMotion()
  CH(chSymb0):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH(chSymb0):ResetFacialMotion()
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
end
function KOROBOOSHI(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KOROBOOSHI"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("KOROBOOSHI"), -1874922301)
  WINDOW:Talk(SymAct("KOROBOOSHI"), 19672661)
  WINDOW:CloseMessage()
end
function NAZONOKUSA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NAZONOKUSA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NAZONOKUSA"), 406265620)
  WINDOW:CloseMessage()
  CH(chSymb0):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  CH(chSymb0):WaitPlayMotion()
  SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
  CH(chSymb0):SetMotion(SymMot("ATTACK_ROUND"), LOOP.OFF)
  CH("HERO"):SetMotion(SymMot("DAMAGE"), LOOP.OFF)
  subEveJump(CH("HERO"))
  subEveFlash()
  CH(chSymb0):WaitPlayMotion()
  CH(chSymb0):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH(chSymb0):ResetFacialMotion()
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
end
function DOODOO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DOODOO"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("DOODOO"), 857361623)
  WINDOW:KeyWait()
  CH(chSymb0):SetMotion(SymMot("VICTORY"), LOOP.OFF)
  CH(chSymb0):WaitPlayMotion()
  SOUND:PlaySe(SymSnd("SE_EVT_FLUSH"), Volume(256))
  CH(chSymb0):SetMotion(SymMot("ATTACK"), LOOP.OFF)
  CH("HERO"):SetMotion(SymMot("DAMAGE"), LOOP.OFF)
  subEveJump(CH("HERO"))
  subEveFlash()
  CH(chSymb0):WaitPlayMotion()
  CH(chSymb0):SetMotion(SymMot("WAIT02"), LOOP.ON)
  CH("HERO"):WaitPlayMotion()
  CH("HERO"):SetMotion(SymMot("WAIT02"), LOOP.ON)
  WINDOW:DrawFace(20, 88, SymAct("DOODOO"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:Talk(SymAct("DOODOO"), 704740758)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function KAKUREON(chSymb0)
end
function RUCHABURU(chSymb0)
end
function WARUBIARU(chSymb0)
  local degree0 = CH(chSymb0):GetDir()
  CH(chSymb0):DirTo(CH("HERO"), Speed(350), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  WINDOW:DrawFace(20, 88, SymAct("WARUBIARU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("WARUBIARU"), 1698753361)
  WINDOW:KeyWait()
  WINDOW:DrawFace(20, 88, SymAct("WARUBIARU"), FACE_TYPE.PAIN)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  WINDOW:Talk(SymAct("WARUBIARU"), 2086394384)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  CH(chSymb0):WaitManpu()
  TASK:Sleep(TimeSec(0.5))
  subEveCloseMsg()
  subEveNo(CH(chSymb0))
  CH(chSymb0):DirTo(RotateTarget(degree0), Speed(350), ROT_TYPE.NEAR)
  CH(chSymb0):WaitRotate()
  TASK:Sleep(TimeSec(0.5))
  WINDOW:DrawFace(20, 88, SymAct("WARUBIARU"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("WARUBIARU"), 1467386323)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function WARUBIRU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("WARUBIRU"), 1315813522)
  WINDOW:KeyWait()
  WINDOW:DrawFace(20, 88, SymAct("WARUBIRU"), FACE_TYPE.TEARS)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.TEARS)
  WINDOW:Talk(SymAct("WARUBIRU"), -906648483)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function MUKKURU(chSymb0)
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("MUKKURU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("MUKKURU"), -789670628)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function MUKUBAADO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("MUKUBAADO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MUKUBAADO"), 328827323)
  WINDOW:Talk(SymAct("MUKUBAADO"), 176337146)
  WINDOW:Talk(SymAct("MUKUBAADO"), 565175097)
  WINDOW:CloseMessage()
end
function SUBAME(chSymb0)
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("SUBAME"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("SUBAME"), 951374456)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function YAYAKOMA(chSymb0)
  CH(chSymb0):SetManpu("MP_SPREE_LP")
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:DrawFace(20, 88, SymAct("YAYAKOMA"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("YAYAKOMA"), 2012562623)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function DENRYUU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DENRYUU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DENRYUU"), 1861121534)
  WINDOW:CloseMessage()
end
function DEDENNE(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("DEDENNE"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("DEDENNE"), 1170417213)
  WINDOW:CloseMessage()
end
function KUCHIITO(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("KUCHIITO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("KUCHIITO"), 1557665660)
  WINDOW:Talk(SymAct("KUCHIITO"), -616559693)
  WINDOW:KeyWait()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.DECIDE)
  WINDOW:DrawFace(20, 88, SymAct("KUCHIITO"), FACE_TYPE.DECIDE)
  WINDOW:Talk(SymAct("KUCHIITO"), -1034208526)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function JIRAACHI(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("JIRAACHI"), -1423579426)
  WINDOW:Talk(SymAct("JIRAACHI"), -1304504417)
  WINDOW:DrawFace(20, 88, SymAct("JIRAACHI"), FACE_TYPE.THINK)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SAD)
  WINDOW:Talk(SymAct("JIRAACHI"), -1726774180)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function PEROPPAFU(chSymb0)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SAD)
  WINDOW:DrawFace(20, 88, SymAct("PEROPPAFU"), FACE_TYPE.SAD)
  WINDOW:Talk(SymAct("PEROPPAFU"), -2146912995)
  WINDOW:Talk(SymAct("PEROPPAFU"), -817290278)
  WINDOW:KeyWait()
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:DrawFace(20, 88, SymAct("PEROPPAFU"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("PEROPPAFU"), -699264357)
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  CH(chSymb0):WaitManpu()
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function HASUBURERO(chSymb0)
  CH(chSymb0):SetManpu("MP_EXCLAMATION")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_LOW_01"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("HASUBURERO"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HASUBURERO"), -41991848)
  WINDOW:CloseMessage()
end
function HIPOPOTASU(chSymb0)
  subEveDoubleJump(CH(chSymb0))
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  WINDOW:DrawFace(20, 88, SymAct("HIPOPOTASU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("HIPOPOTASU"), -463179751)
  WINDOW:CloseMessage()
end
function YANCHAMU(chSymb0, chSymb1)
  CH(chSymb0):SetManpu("MP_EXCLAMATION")
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_NOTICE_HIGH_02"), Volume(256))
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SURPRISE)
  WINDOW:DrawFace(20, 88, SymAct("YANCHAMU"), FACE_TYPE.SURPRISE)
  WINDOW:Talk(SymAct("YANCHAMU"), 1677487318)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:DrawFace(20, 88, SymAct("YANCHAMU"), FACE_TYPE.CATCHBREATH)
  WINDOW:Talk(SymAct("YANCHAMU"), 2061983127)
  WINDOW:KeyWait()
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  TASK:Sleep(TimeSec(0.6))
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.PAIN)
  WINDOW:DrawFace(20, 88, SymAct("YANCHAMU"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("YANCHAMU"), 921886311)
  WINDOW:CloseMessage()
  CH(chSymb0):WaitManpu()
end
function CHOBOMAKI(chSymb0, chSymb1)
  WINDOW:DrawFace(20, 88, SymAct("CHOBOMAKI"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("CHOBOMAKI"), 803860262)
  WINDOW:KeyWait()
  subEveDoubleJump(CH(chSymb1))
  SOUND:PlaySe(SymSnd("SE_EVT_JUMP_02"), Volume(256))
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.SHOUT)
  WINDOW:DrawFace(20, 88, SymAct("CHOBOMAKI"), FACE_TYPE.SHOUT)
  WINDOW:Talk(SymAct("CHOBOMAKI"), 80002277)
  WINDOW:CloseMessage()
end
function MIRUHOGGU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.HAPPY)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 501190052)
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1386093411)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1267018274)
  WINDOW:CloseMessage()
  TASK:Sleep(TimeSec(0.5))
  SOUND:PlaySe(SymSnd("SE_EVT_SIGN_HURRY"), Volume(256))
  CH(chSymb0):SetManpu("MP_FLY_SWEAT")
  CH(chSymb0):WaitManpu()
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.PAIN)
  WINDOW:Talk(SymAct("MIRUHOGGU"), 1621653985)
  WINDOW:DrawFace(20, 88, SymAct("MIRUHOGGU"), FACE_TYPE.SPECIAL02)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:Talk(SymAct("MIRUHOGGU"), 2041792672)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
end
function RATTA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("RATTA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:Talk(SymAct("RATTA"), -30714769)
  WINDOW:Talk(SymAct("RATTA"), -416258770)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function HIMANATTSU(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HIMANATTSU"), FACE_TYPE.GLADNESS)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.GLADNESS)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:Talk(SymAct("HIMANATTSU"), -1907443454)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetManpu()
  CH(chSymb0):ResetFacialMotion()
end
function TABUNNE(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:Talk(SymAct("TABUNNE"), -1756002237)
  WINDOW:KeyWait()
  CH(chSymb0):ResetManpu()
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.NORMAL)
  CH(chSymb0):ResetFacialMotion()
  WINDOW:Talk(SymAct("TABUNNE"), -1132930176)
  WINDOW:DrawFace(20, 88, SymAct("TABUNNE"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("TABUNNE"), -1520178495)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function SUBOMII(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("SUBOMII"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  CH(chSymb0):SetManpu("MP_LAUGH_LP")
  WINDOW:Talk(SymAct("SUBOMII"), -366838778)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
  CH(chSymb0):ResetManpu()
end
function ROZERIA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("ROZERIA"), FACE_TYPE.HAPPY)
  CH(chSymb0):SetFacialMotion(FACIAL_MOTION.HAPPY)
  WINDOW:Talk(SymAct("ROZERIA"), -214348473)
  WINDOW:CloseMessage()
  CH(chSymb0):ResetFacialMotion()
end
function NYASUPAA(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("NYASUPAA"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("NYASUPAA"), -669770108)
  WINDOW:Talk(SymAct("NYASUPAA"), -1055969339)
  WINDOW:CloseMessage()
end
function HIYAKKII(chSymb0)
  WINDOW:DrawFace(20, 88, SymAct("HIYAKKII"), FACE_TYPE.NORMAL)
  WINDOW:Talk(SymAct("HIYAKKII"), 1184314122)
  WINDOW:Talk(SymAct("HIYAKKII"), 1603011147)
  WINDOW:CloseMessage()
end

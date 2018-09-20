dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
function groundInit()
end
function groundStart()
end
function main26_staffroll01_init()
end
function main26_staffroll01_start()
  CAMERA:SetSisaAzimuthDifferenceVolume(Volume(1))
  CAMERA:SetSisaRateVolume(Volume(0.5))
  CAMERA:SetEye(SymCam("CAMERA_00"))
  CAMERA:SetTgt(SymCam("CAMERA_00"))
  CAMERA:SetFovy(SymCam("CAMERA_00"))
  CH("HERO"):SetMotion(SymMot("EV018_CRY01"), LOOP.ON, TimeSec(0))
  SOUND:PlayBgm(SymSnd("BGM_EVE_STAFFCREDIT"), Volume(256))
  _BeginStaffRoll()
  SCREEN_A:FadeIn(TimeSec(1), true)
  local bResult = false
  bResult = TASK:Sleep_CanBreak(TimeSec(19))
  if not bResult then
    _PlayStaffRoll()
  end
  SOUND:FadeOutBgm(TimeSec(5))
  SCREEN_A:FadeOut(TimeSec(2), true)
  SOUND:WaitBgm()
  _EndStaffRoll()
  CAMERA:SetDefaultGroundFovy()
end
function main26_staffroll01_end()
end
function groundEnd()
end
function _BeginStaffRoll()
  SYSTEM:StartStaffRoll()
end
function _PlayStaffRoll()
  local _tbl = {
    {
      textId = "[CS:Y]PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Koichi Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DIRECTORS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Seiichiro Nagahata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hironori Ishigami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SCENARIO[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Shin-ichiro Tomie",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EVENT DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Emiko Tanaka",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GAME EDITOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Misaki Okibe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GAME PLANNERS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kunimi Kawamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihiro Kaneko",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Jun Tomizawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Susumu Kotegawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasuhiro Shinkawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]LEAD PROGRAMMER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Takuya Kanai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PROGRAMMERS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Yasuhiro Takahashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kohei Mukaida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Sakaguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasushi Takashina",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yusuke Kojima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takahiro Takahashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Minoru Nakajima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Etsuo Oishi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiroshi Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ART DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Motoi Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]CHARACTER MODELING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Migaku Matsui",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihito Ishihara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tatsuya Yogo",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Azumi Hara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Satoko Nakao",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Aya Watanabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hisayoshi Ozawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takeshi Matsuda",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "CHA DONGWOON",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akari Kobayashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kotaro Sato",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eriko Nishio",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]CHARACTER ANIMATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Wataru Nagano",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Koji Miyoshi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GRAPHIC EFFECTS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Hiroko Takano",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Fuyuhiko Koizumi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]BACKGROUND[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Keisuke Sakurai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Go Ono",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shintaro Tajima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tomoyuki Hata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryuichi Tobe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hideaki Hakozaki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Masako Miura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Narumi Shinomiya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ruri Yamaguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]CUT SCENES[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Hisashi Nagai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Makoto Goto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]2D ART[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kaoru Hasegawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shigeru Kawahara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiromi Yoshida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiroki Kikuchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Osamu Shibuya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hideaki Shibayama",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SOUND  DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Ryoma Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]MUSIC COMPOSITION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Keisuke Ito",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasuhiro Kawagoe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Noriko Murakami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SOUND EFFECTS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Ichiro Ebisu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sohh Satou",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEVELOPMENT MANAGER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kensuke Oguri",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEVELOPMENT COOPERATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "noisycroak Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "KUON Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Swing Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Teco Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "PLANETA Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEBUG[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Yohei Sato",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tatsuya Sakai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuma Ochi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "DIGITAL Hearts Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Teppei Nasu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yoshihiro Tamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Nami Utsugi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuji Maegawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Pole To Win Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihito Saba",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akiyoshi Hisaki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihiko Morishita",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ayuta Kariya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yohei Ogino",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takehito Watanabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Masayuki Hama",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Wataru Goto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Taku Iguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mario Club Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Tanikawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Motoki Nakajima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shigeo Takada",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akiko Ohashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]TECHNICAL SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Takehiro Oyama",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuta Ogawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Iwanaga Shotaro",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ARTWORK[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Sachiko Nakamichi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shiori Adachi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]MANUAL EDITING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "QBIST Inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Natsumi Kinoshita",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akemi Kimura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasuo Inoue",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Aki Sakurai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Megumi Shichida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SPECIAL THANKS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kenjiro Ito",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mikiko Ohashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Susumu Fukunaga",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Toshio Miyahara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eisuke Kasejima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Taku Kawamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Nobuhiro Sawabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yukari Fukushima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryohei Itakura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Rui Kawaguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryosuke Hanawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Retsuji Nomoto ",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Norimasa Nakazato",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eriko Suzuki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kanako Murata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hideki Sakamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mio Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yoshiaki Ishida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tsuyoshi Miyazaki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Satoshi Koshimizu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kaede Takahashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hayato Minami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yohei Suzuki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tomohide Okaizumi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEVELOPMENT SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Naomi Kaneda",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takuya Hashimoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Osamu Fujita",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sayuri Yamamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PRODUCT MANAGEMENT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kaori Ando",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Sakamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Okada",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PACKAGE ILLUSTRATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Ken Sugimori",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]VERY SPECIAL THANKS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "GAME FREAK inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Creatures Inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]Pok\227\129\130mon ORIGINAL DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Satoshi Tajiri",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PRODUCERS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Takato Utsunomiya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kunimi Kawamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hitoshi Yamagami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EXECUTIVE PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Mitsutoshi Sakurai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EXECUTIVE PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Satoru Iwata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EXECUTIVE PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Tsunekazu Ishihara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Nintendo, The Pok\227\129\130mon Company,",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "and Spike Chunsoft are ",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = " the author of\227\128\128this software",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = " for the purpose of copyright.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "All rights reserved.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\129\1322015 Pok\227\129\130mon.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\129\1321995-2015 Nintendo.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\129\1321995-2015 Creatures Inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\129\1321995-2015 GAME FREAK inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\129\1321993-2015 Spike Chunsoft.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    }
  }
  local _tbl_us = {
    {
      textId = "[CS:Y]PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Koichi Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DIRECTORS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Seiichiro Nagahata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hironori Ishigami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SCENARIO[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Shin-ichiro Tomie",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EVENT DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Emiko Tanaka",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GAME EDITOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Misaki Okibe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GAME PLANNERS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kunimi Kawamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihiro Kaneko",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Jun Tomizawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Susumu Kotegawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasuhiro Shinkawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]LEAD PROGRAMMER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Takuya Kanai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PROGRAMMERS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Yasuhiro Takahashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kohei Mukaida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Sakaguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasushi Takashina",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yusuke Kojima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takahiro Takahashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Minoru Nakajima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Etsuo Oishi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiroshi Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ART DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Motoi Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]CHARACTER MODELING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Migaku Matsui",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihito Ishihara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tatsuya Yogo",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Azumi Hara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Satoko Nakao",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Aya Watanabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hisayoshi Ozawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takeshi Matsuda",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "CHA DONGWOON",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akari Kobayashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kotaro Sato",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eriko Nishio",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]CHARACTER ANIMATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Wataru Nagano",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Koji Miyoshi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GRAPHIC EFFECTS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Hiroko Takano",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Fuyuhiko Koizumi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]BACKGROUND[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Keisuke Sakurai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Go Ono",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shintaro Tajima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tomoyuki Hata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryuichi Tobe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hideaki Hakozaki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Masako Miura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Narumi Shinomiya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ruri Yamaguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]CUT SCENES[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Hisashi Nagai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Makoto Goto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]2D ART[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kaoru Hasegawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shigeru Kawahara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiromi Yoshida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiroki Kikuchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Osamu Shibuya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hideaki Shibayama",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SOUND  DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Ryoma Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]MUSIC COMPOSITION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Keisuke Ito",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasuhiro Kawagoe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Noriko Murakami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SOUND EFFECTS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Ichiro Ebisu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sohh Satou",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEVELOPMENT MANAGER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kensuke Oguri",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEVELOPMENT COOPERATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "noisycroak Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "KUON Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Swing Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Teco Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "PLANETA Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEBUG[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Yohei Sato",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tatsuya Sakai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuma Ochi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "DIGITAL Hearts Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Teppei Nasu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yoshihiro Tamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Nami Utsugi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuji Maegawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Pole To Win Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihito Saba",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akiyoshi Hisaki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihiko Morishita",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ayuta Kariya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yohei Ogino",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takehito Watanabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Masayuki Hama",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Wataru Goto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Taku Iguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mario Club Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Tanikawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Motoki Nakajima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shigeo Takada",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akiko Ohashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]TECHNICAL SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Takehiro Oyama",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuta Ogawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Iwanaga Shotaro",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ARTWORK[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Sachiko Nakamichi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shiori Adachi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]MANUAL EDITING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "QBIST Inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Natsumi Kinoshita",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akemi Kimura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasuo Inoue",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Aki Sakurai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Megumi Shichida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ENGLISH LOCALIZATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Yasuhiro Usui",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mikiko Ryu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Bryan Olsson",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shinobu Taylor",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mayu Todo",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ENGLISH TRANSLATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Hisato Yamamori",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sayuri Munday",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Jillian Nonaka",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ben Regal",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ENGLISH EDITING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kellyn Ballard",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Blaise Selby",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Rachel Payne",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eric Haddock",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ENGLISH GRAPHIC DESIGN[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kevin Lalli",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiromi Kimura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ENGLISH LOCALIZATION SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Jeff Hines",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Robert Colling",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]NOA LOCALIZATION SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Seth McMahill",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryo Uchida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Joel Simon",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Terrance Chan",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Dan Owsen",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Matthew Niemi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]NOA PRODUCT TESTING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Masayasu Nakata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Seth Hanser",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eric Bush",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sean Egan",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Q Dequina",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Marko Wallenius",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Patrick Taylor",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Paul Gardner",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yvette Lessard",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Madison Levitan",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tomoko Mikami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Miyuki Matsunaga",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Adam Rutledge",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Product Testing Technicians",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SPECIAL THANKS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kenjiro Ito",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mikiko Ohashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Susumu Fukunaga",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Toshio Miyahara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eisuke Kasejima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Taku Kawamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Nobuhiro Sawabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yukari Fukushima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryohei Itakura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Rui Kawaguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryosuke Hanawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Retsuji Nomoto ",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Norimasa Nakazato",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eriko Suzuki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kanako Murata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kenji Okubo",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Gaku Susai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hideki Sakamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mio Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yoshiaki Ishida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tsuyoshi Miyazaki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Satoshi Koshimizu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kaede Takahashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hayato Minami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yohei Suzuki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tomohide Okaizumi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEVELOPMENT SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Naomi Kaneda",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takuya Hashimoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Osamu Fujita",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sayuri Yamamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PRODUCT MANAGEMENT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kaori Ando",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Sakamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Okada",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PACKAGE ILLUSTRATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Ken Sugimori",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]VERY SPECIAL THANKS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "GAME FREAK inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Creatures Inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]Pok\195\169mon ORIGINAL DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Satoshi Tajiri",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PRODUCERS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Takato Utsunomiya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kunimi Kawamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hitoshi Yamagami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EXECUTIVE PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Mitsutoshi Sakurai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EXECUTIVE PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Satoru Iwata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EXECUTIVE PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Tsunekazu Ishihara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Nintendo, The Pok\195\169mon Company,",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "and Spike Chunsoft are ",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = " the author of\227\128\128this software",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = " for the purpose of copyright.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "All rights reserved.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\194\1692015 Pok\195\169mon.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\194\1691995-2015 Nintendo.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\194\1691995-2015 Creatures Inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\194\1691995-2015 GAME FREAK inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\194\1691993-2015 Spike Chunsoft.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    }
  }
  local _tbl_eu = {
    {
      textId = "[CS:Y]PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Koichi Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DIRECTORS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Seiichiro Nagahata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hironori Ishigami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SCENARIO[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Shin-ichiro Tomie",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EVENT DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Emiko Tanaka",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GAME EDITOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Misaki Okibe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GAME PLANNERS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kunimi Kawamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihiro Kaneko",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Jun Tomizawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Susumu Kotegawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasuhiro Shinkawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]LEAD PROGRAMMER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Takuya Kanai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PROGRAMMERS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Yasuhiro Takahashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kohei Mukaida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Sakaguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasushi Takashina",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yusuke Kojima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takahiro Takahashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Minoru Nakajima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Etsuo Oishi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiroshi Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ART DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Motoi Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]CHARACTER MODELING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Migaku Matsui",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihito Ishihara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tatsuya Yogo",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Azumi Hara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Satoko Nakao",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Aya Watanabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hisayoshi Ozawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takeshi Matsuda",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "CHA DONGWOON",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akari Kobayashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kotaro Sato",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eriko Nishio",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]CHARACTER ANIMATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Wataru Nagano",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Koji Miyoshi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GRAPHIC EFFECTS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Hiroko Takano",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Fuyuhiko Koizumi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]BACKGROUND[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Keisuke Sakurai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Go Ono",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shintaro Tajima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tomoyuki Hata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryuichi Tobe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hideaki Hakozaki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Masako Miura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Narumi Shinomiya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ruri Yamaguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]CUT SCENES[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Hisashi Nagai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Makoto Goto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]2D ART[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kaoru Hasegawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shigeru Kawahara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiromi Yoshida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiroki Kikuchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Osamu Shibuya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hideaki Shibayama",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SOUND  DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Ryoma Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]MUSIC COMPOSITION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Keisuke Ito",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasuhiro Kawagoe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Noriko Murakami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SOUND EFFECTS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Ichiro Ebisu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sohh Satou",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEVELOPMENT MANAGER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kensuke Oguri",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEVELOPMENT COOPERATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "noisycroak Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "KUON Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Swing Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Teco Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "PLANETA Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEBUG[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Yohei Sato",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tatsuya Sakai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuma Ochi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "DIGITAL Hearts Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Teppei Nasu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yoshihiro Tamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Nami Utsugi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuji Maegawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Pole To Win Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihito Saba",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akiyoshi Hisaki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akihiko Morishita",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ayuta Kariya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yohei Ogino",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takehito Watanabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Masayuki Hama",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Wataru Goto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Taku Iguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mario Club Co., Ltd.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Tanikawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Motoki Nakajima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shigeo Takada",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akiko Ohashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]TECHNICAL SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Takehiro Oyama",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuta Ogawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Iwanaga Shotaro",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ARTWORK[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Sachiko Nakamichi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shiori Adachi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]MANUAL EDITING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "QBIST Inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Natsumi Kinoshita",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Akemi Kimura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yasuo Inoue",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Aki Sakurai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Megumi Shichida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EUROPEAN LOCALISATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Noriko Netley",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kaori Manabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Makiko Cottrell",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Maya Yoshida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Owen Preece",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Elena Nardo",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Cyril Schultz",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Bertrand Lecocq",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Bryan Olsson",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Shinobu Taylor",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ENGLISH TRANSLATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Hisato Yamamori",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sayuri Munday",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Jillian Nonaka",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ben Regal",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ENGLISH EDITING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kellyn Ballard",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Blaise Selby",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Rachel Payne",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eric Haddock",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]FRENCH TRANSLATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Guillaume Didier",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Aymeric Forgit",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Lylia Khrissate",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sarah Provost (JAC Recruitment)",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Laurent Nguyen (JAC Recruitment)",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]FRENCH EDITING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Franck Cou\195\169e",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Pierre Gauthier",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GERMAN TRANSLATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kathleen Kalms",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Daniel Heucher",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Michael Ecke",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Matthias Wissnet (JAC Recruitment)",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Josef Shanel (JAC Recruitment)",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]GERMAN EDITING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Sina Moelleken",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Claudia Thon",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ITALIAN TRANSLATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Manuela Suriano",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Guido Scarabello",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Marco Sartori",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Giovanni Ballarin (JAC Recruitment)",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Annarita Spera (JAC Recruitment)",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]ITALIAN EDITING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Silvia De Bellis",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Fabio Giusti",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SPANISH TRANSLATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Alejandro Mart\195\173nez Monge",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Alberto Gracia Castellano",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Enrique Joga Elvira",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Servando Doval D\195\173az (JAC Recruitment)",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Pablo Gismero Calvo (JAC Recruitment)",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SPANISH EDITING[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Virginia Parad\195\169s Gurrea",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mariona Pera i de Miguel",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EUROPEAN GRAPHIC DESIGN[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kevin Lalli",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hiromi Kimura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EUROPEAN LOCALISATION SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Marvin Andrews",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Jeff Hines",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Robert Colling",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]NOE LOCALISATION SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kazunari Suzuki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Canela Rodal",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]NOE QUALITY ASSURANCE [CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Jes\195\186s Guti\195\169rrez Cuadra",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Patrick Thorenz",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Marco Gruden",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Pole To Win Europe Ltd. (London)",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]SPECIAL THANKS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kenjiro Ito",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mikiko Ohashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Susumu Fukunaga",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Toshio Miyahara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eisuke Kasejima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Taku Kawamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Nobuhiro Sawabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yukari Fukushima",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryohei Itakura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Rui Kawaguchi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryosuke Hanawa",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Retsuji Nomoto ",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Norimasa Nakazato",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Eriko Suzuki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kanako Murata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kenji Okubo",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Gaku Susai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Ryoko Sawabe",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Dario De Leo",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Lubov Blaesing",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hideki Sakamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Mio Nakamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yoshiaki Ishida",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tsuyoshi Miyazaki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Satoshi Koshimizu",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kaede Takahashi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hayato Minami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yohei Suzuki",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Tomohide Okaizumi",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]DEVELOPMENT SUPPORT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Naomi Kaneda",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Takuya Hashimoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Osamu Fujita",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Sayuri Yamamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PRODUCT MANAGEMENT[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Kaori Ando",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Sakamoto",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Yuki Okada",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PACKAGE ILLUSTRATION[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Ken Sugimori",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]VERY SPECIAL THANKS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "GAME FREAK inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Creatures Inc.",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]Pok\195\169mon ORIGINAL DIRECTOR[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Satoshi Tajiri",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]PRODUCERS[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Takato Utsunomiya",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Kunimi Kawamura",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "Hitoshi Yamagami",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EXECUTIVE PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Mitsutoshi Sakurai",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EXECUTIVE PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Satoru Iwata",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "[CS:Y]EXECUTIVE PRODUCER[CN]",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "Tsunekazu Ishihara",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 1
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "\194\1692016 Pok\195\169mon. \194\1691995-2016 Nintendo",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "/Creatures Inc. /GAME FREAK inc.",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "\194\1691993-2016 Spike Chunsoft.",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 0
    },
    {
      textId = "\227\128\128",
      posX = -1,
      posY = 280,
      font = 0
    }
  }
  MENU:LoadMenuTextPool("message/staff.bin")
  local getResult = false
  SYSTEM:SetStaffRollString("[CS:Y]STAFF CREDITS[CR]", -1, 120, Speed(30), TimeSec(90, TIME_TYPE.FRAME), 1)
  getResult = TASK:Sleep_CanBreak(TimeSec(90, TIME_TYPE.FRAME))
  if not getResult then
    if SYSTEM:IsEuropean() then
      for k, ver in pairs(_tbl_eu) do
        SYSTEM:SetStaffRollString(ver.textId, ver.posX, ver.posY, Speed(30), TimeSec(0, TIME_TYPE.FRAME), ver.font)
        TASK:Sleep(TimeSec(45, TIME_TYPE.FRAME))
      end
    elseif SYSTEM:IsUS() then
      for k, ver in pairs(_tbl_us) do
        SYSTEM:SetStaffRollString(ver.textId, ver.posX, ver.posY, Speed(30), TimeSec(0, TIME_TYPE.FRAME), ver.font)
        TASK:Sleep(TimeSec(45, TIME_TYPE.FRAME))
      end
    else
      for k, ver in pairs(_tbl) do
        if getResult then
          break
        else
          SYSTEM:SetStaffRollString(ver.textId, ver.posX, ver.posY, Speed(30), TimeSec(0, TIME_TYPE.FRAME), ver.font)
        end
        if TASK:Sleep_CanBreak(TimeSec(45, TIME_TYPE.FRAME)) then
          break
        end
      end
    end
    if not getResult then
      SYSTEM:WaitStaffRoll()
    end
  end
end
function _EndStaffRoll()
  SYSTEM:EndStaffRoll()
end

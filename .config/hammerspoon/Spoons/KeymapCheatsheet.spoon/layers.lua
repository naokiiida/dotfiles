-- layers.lua: Shifted Miryoku キーマップのレイヤーデータ
-- Each key: {l=label, h=hold_label, t=type}
-- Types: letter, num, mod, thumb, nav, media, special, blocked, trans, app, wm

return {
  colors = {
    letter  = "#4fc3f7",
    num     = "#4fc3f7",
    mod     = "#ff9800",
    thumb   = "#66bb6a",
    nav     = "#ce93d8",
    media   = "#fff176",
    trans   = "#616161",
    blocked = "#ef5350",
    special = "#90a4ae",
    app     = "#f48fb1",
    wm      = "#80cbc4",
  },
  layers = {
    {name="base", label="Base", keys={
      frow = {
        {l="1",t="num"},{l="2",t="num"},{l="3",t="num"},{l="4",t="num"},{l="5",t="num"},
        {l="6",t="num"},{l="7",t="num"},{l="8",t="num"},{l="9",t="num"},{l="0",t="num"},
        {l="-",t="num"},{l="=",t="num"},
      },
      numrow = {
        {l="q",t="letter"},{l="w",t="letter"},{l="e",t="letter"},{l="r",t="letter"},{l="t",t="letter"},
        {l="y",t="letter"},{l="u",t="letter"},{l="i",t="letter"},{l="o",t="letter"},{l="p",t="letter"},
        {l="[",t="letter"},{l="]",t="letter"},
      },
      qrow = {
        {l="a",h="Met",t="mod"},{l="s",h="Alt",t="mod"},{l="d",h="Ctl",t="mod"},{l="f",h="Sft",t="mod"},
        {l="g",t="letter"},{l="h",t="letter"},
        {l="j",h="Sft",t="mod"},{l="k",h="Ctl",t="mod"},{l="l",h="Alt",t="mod"},
        {l=";",h="Met",t="mod"},{l="'",t="letter"},{l="F13",t="special"},
      },
      homerow = {
        {l="z",h="Btn",t="mod"},{l="x",h="RAlt",t="mod"},{l="c",t="letter"},{l="v",t="letter"},
        {l="b",t="letter"},{l="n",t="letter"},{l="m",t="letter"},{l=",",t="letter"},
        {l=".",h="RAlt",t="mod"},{l="/",h="Btn",t="mod"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="Apps",t="special"},{l="Esc",h="Media",t="thumb"},{l="Spc",h="Nav",t="thumb"},
        {l="Tab",h="Mouse",t="thumb"},{l="Btn",t="special"},{l="WM",t="special"},
        {l="Ent",h="Sym",t="thumb"},{l="Bsp",h="Num",t="thumb"},{l="Del",h="Fun",t="thumb"},
        {l="Base",t="special"},
      },
    }},
    {name="nav", label="Nav (Spc)", keys={
      frow = {{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"}},
      numrow = {
        {l="",t="blocked"},{l="Tap",t="special"},{l="Extra",t="special"},{l="Base",t="special"},{l="",t="blocked"},
        {l="Redo",t="nav"},{l="Paste",t="nav"},{l="Copy",t="nav"},{l="Cut",t="nav"},{l="Undo",t="nav"},
        {l="",t="trans"},{l="",t="trans"},
      },
      qrow = {
        {l="Met",t="nav"},{l="Alt",t="nav"},{l="Ctl",t="nav"},{l="Sft",t="nav"},{l="",t="blocked"},
        {l="←",t="nav"},{l="↓",t="nav"},{l="↑",t="nav"},{l="→",t="nav"},{l="",t="blocked"},
        {l="",t="trans"},{l="F13",t="special"},
      },
      homerow = {
        {l="",t="blocked"},{l="RAlt",t="nav"},{l="Num",t="special"},{l="Nav",t="special"},{l="",t="blocked"},
        {l="W←",t="nav"},{l="W↓",t="nav"},{l="W↑",t="nav"},{l="W→",t="nav"},{l="",t="blocked"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="",t="trans"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="trans"},
        {l="",t="trans"},{l="Ent",t="nav"},{l="Bsp",t="nav"},{l="Del",t="nav"},
        {l="Lock",t="special"},
      },
    }},
    {name="mouse", label="Mouse (Tab)", keys={
      frow = {{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"}},
      numrow = {
        {l="",t="blocked"},{l="Tap",t="special"},{l="Extra",t="special"},{l="Base",t="special"},{l="",t="blocked"},
        {l="Redo",t="nav"},{l="Paste",t="nav"},{l="Copy",t="nav"},{l="Cut",t="nav"},{l="Undo",t="nav"},
        {l="",t="trans"},{l="",t="trans"},
      },
      qrow = {
        {l="Met",t="nav"},{l="Alt",t="nav"},{l="Ctl",t="nav"},{l="Sft",t="nav"},{l="",t="blocked"},
        {l="M←",t="nav"},{l="M↓",t="nav"},{l="M↑",t="nav"},{l="M→",t="nav"},{l="",t="blocked"},
        {l="",t="trans"},{l="F13",t="special"},
      },
      homerow = {
        {l="",t="blocked"},{l="RAlt",t="nav"},{l="Sym",t="special"},{l="Mouse",t="special"},{l="",t="blocked"},
        {l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="",t="trans"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="trans"},
        {l="",t="trans"},{l="MBtn",t="nav"},{l="RBtn",t="nav"},{l="MidBtn",t="nav"},
        {l="Lock",t="special"},
      },
    }},
    {name="media", label="Media (Esc)", keys={
      frow = {{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"}},
      numrow = {
        {l="",t="blocked"},{l="Tap",t="special"},{l="Extra",t="special"},{l="Base",t="special"},{l="",t="blocked"},
        {l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},
        {l="",t="trans"},{l="",t="trans"},
      },
      qrow = {
        {l="Met",t="media"},{l="Alt",t="media"},{l="Ctl",t="media"},{l="Sft",t="media"},{l="",t="blocked"},
        {l="Prev",t="media"},{l="Vol-",t="media"},{l="Vol+",t="media"},{l="Next",t="media"},{l="",t="blocked"},
        {l="",t="trans"},{l="F13",t="special"},
      },
      homerow = {
        {l="",t="blocked"},{l="RAlt",t="media"},{l="Fun",t="special"},{l="Media",t="special"},{l="",t="blocked"},
        {l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="",t="trans"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="trans"},
        {l="",t="trans"},{l="Mute",t="media"},{l="Play",t="media"},{l="",t="blocked"},
        {l="Lock",t="special"},
      },
    }},
    {name="num", label="Num (Bsp)", keys={
      frow = {{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"}},
      numrow = {
        {l="[",t="num"},{l="7",t="num"},{l="8",t="num"},{l="9",t="num"},{l="]",t="num"},
        {l="",t="blocked"},{l="Base",t="special"},{l="Extra",t="special"},{l="Tap",t="special"},{l="",t="blocked"},
        {l="",t="trans"},{l="",t="trans"},
      },
      qrow = {
        {l=";",t="num"},{l="4",t="num"},{l="5",t="num"},{l="6",t="num"},{l="=",t="num"},
        {l="",t="blocked"},{l="Sft",t="nav"},{l="Ctl",t="nav"},{l="Alt",t="nav"},{l="Met",t="nav"},
        {l="",t="trans"},{l="F13",t="special"},
      },
      homerow = {
        {l="`",t="num"},{l="1",t="num"},{l="2",t="num"},{l="3",t="num"},{l="\\",t="num"},
        {l="",t="blocked"},{l="Num",t="special"},{l="Nav",t="special"},{l="RAlt",t="nav"},{l="",t="blocked"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="",t="trans"},{l=".",t="num"},{l="0",t="num"},{l="-",t="num"},{l="",t="trans"},
        {l="",t="trans"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},
        {l="Lock",t="special"},
      },
    }},
    {name="sym", label="Sym (Ent)", keys={
      frow = {{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"}},
      numrow = {
        {l="`",t="num"},{l="~",t="num"},{l="[",t="num"},{l="{",t="num"},{l="#",t="num"},
        {l="=>",t="num"},{l="!==",t="num"},{l="??",t="num"},{l="?.",t="num"},{l="",t="blocked"},
        {l="",t="trans"},{l="",t="trans"},
      },
      qrow = {
        {l=":",t="num"},{l="!",t="num"},{l="=",t="num"},{l="(",t="num"},{l="-",t="num"},
        {l="->",t="num"},{l="===",t="num"},{l="&&",t="num"},{l="||",t="num"},{l="",t="blocked"},
        {l="",t="trans"},{l="F13",t="special"},
      },
      homerow = {
        {l="@",t="num"},{l="|",t="num"},{l="&",t="num"},{l="*",t="num"},{l="+",t="num"},
        {l="//",t="num"},{l="${",t="num"},{l="<=",t="num"},{l=">=",t="num"},{l="",t="blocked"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="",t="trans"},{l=")",t="num"},{l="}",t="num"},{l="]",t="num"},{l="",t="trans"},
        {l="",t="trans"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},
        {l="Lock",t="special"},
      },
    }},
    {name="fun", label="Fun (Del)", keys={
      frow = {{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"}},
      numrow = {
        {l="F12",t="num"},{l="F7",t="num"},{l="F8",t="num"},{l="F9",t="num"},{l="SysRq",t="num"},
        {l="",t="blocked"},{l="Base",t="special"},{l="Extra",t="special"},{l="Tap",t="special"},{l="",t="blocked"},
        {l="",t="trans"},{l="",t="trans"},
      },
      qrow = {
        {l="F11",t="num"},{l="F4",t="num"},{l="F5",t="num"},{l="F6",t="num"},{l="ScrLk",t="num"},
        {l="",t="blocked"},{l="Sft",t="nav"},{l="Ctl",t="nav"},{l="Alt",t="nav"},{l="Met",t="nav"},
        {l="",t="trans"},{l="F13",t="special"},
      },
      homerow = {
        {l="F10",t="num"},{l="F1",t="num"},{l="F2",t="num"},{l="F3",t="num"},{l="Pause",t="num"},
        {l="",t="blocked"},{l="Fun",t="special"},{l="Media",t="special"},{l="RAlt",t="nav"},{l="",t="blocked"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="",t="trans"},{l="Menu",t="num"},{l="Spc",t="num"},{l="Tab",t="num"},{l="",t="trans"},
        {l="",t="trans"},{l="",t="blocked"},{l="",t="blocked"},{l="",t="blocked"},
        {l="Lock",t="special"},
      },
    }},
    {name="button", label="Button", keys={
      frow = {{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"}},
      numrow = {
        {l="Undo",t="nav"},{l="Cut",t="nav"},{l="Copy",t="nav"},{l="Paste",t="nav"},{l="Redo",t="nav"},
        {l="Redo",t="nav"},{l="Paste",t="nav"},{l="Copy",t="nav"},{l="Cut",t="nav"},{l="Undo",t="nav"},
        {l="",t="trans"},{l="",t="trans"},
      },
      qrow = {
        {l="Met",t="nav"},{l="Alt",t="nav"},{l="Ctl",t="nav"},{l="Sft",t="nav"},{l="",t="blocked"},
        {l="",t="blocked"},{l="Sft",t="nav"},{l="Ctl",t="nav"},{l="Alt",t="nav"},{l="Met",t="nav"},
        {l="",t="trans"},{l="F13",t="special"},
      },
      homerow = {
        {l="Undo",t="nav"},{l="Cut",t="nav"},{l="Copy",t="nav"},{l="Paste",t="nav"},{l="Redo",t="nav"},
        {l="Redo",t="nav"},{l="Paste",t="nav"},{l="Copy",t="nav"},{l="Cut",t="nav"},{l="Undo",t="nav"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="",t="trans"},{l="MidBtn",t="nav"},{l="RBtn",t="nav"},{l="MBtn",t="nav"},{l="",t="trans"},
        {l="",t="trans"},{l="MBtn",t="nav"},{l="RBtn",t="nav"},{l="MidBtn",t="nav"},
        {l="Base",t="special"},
      },
    }},
    {name="apps", label="Apps", keys={
      frow = {{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"}},
      numrow = {
        {l="AI Chat",t="app"},{l="AI Cmd",t="app"},{l="AI Sel",t="app"},{l="Rain",t="app"},{l="Timing",t="app"},
        {l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},
        {l="",t="trans"},{l="",t="trans"},
      },
      qrow = {
        {l="Raycast",t="app"},{l="Safari",t="app"},{l="Obsidian",t="app"},{l="Ghostty",t="app"},{l="GDrive",t="app"},
        {l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},
        {l="",t="trans"},{l="F13",t="special"},
      },
      homerow = {
        {l="Zed",t="app"},{l="Bitwrdn",t="app"},{l="Snippet",t="app"},{l="BrwTab",t="app"},{l="BrwPrf",t="app"},
        {l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},
        {l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},
        {l="Base",t="special"},
      },
    }},
    {name="wm", label="WM", keys={
      frow = {{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"}},
      numrow = {
        {l="",t="trans"},{l="SwitchW",t="wm"},{l="",t="trans"},{l="Reason",t="wm"},{l="",t="trans"},
        {l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},
        {l="",t="trans"},{l="",t="trans"},
      },
      qrow = {
        {l="",t="trans"},{l="",t="trans"},{l="30/70",t="wm"},{l="Full",t="wm"},{l="",t="trans"},
        {l="Left",t="wm"},{l="Bottom",t="wm"},{l="Top",t="wm"},{l="Right",t="wm"},{l="",t="trans"},
        {l="",t="trans"},{l="F13",t="special"},
      },
      homerow = {
        {l="",t="trans"},{l="",t="trans"},{l="Center",t="wm"},{l="",t="trans"},{l="",t="trans"},
        {l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},
        {l="F16",t="special"},
      },
      bottom = {
        {l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},
        {l="",t="trans"},{l="",t="trans"},{l="",t="trans"},{l="",t="trans"},
        {l="Lock",t="special"},
      },
    }},
  },
}

const {
  RUNTIME,
  aceVimMap,
  addSearchAlias,
  cmap,
  imap,
  imapkey,
  getBrowserName,
  getClickableElements,
  getFormData,
  map,
  unmap,
  unmapAllExcept,
  iunmap,
  vunmap,
  mapkey,
  readText,
  removeSearchAlias,
  tabOpenLink,
  vmap,
  vmapkey,
  Clipboard,
  Hints,
  Visual,
  Front,
} = api;

settings.hintAlign = "left";
Hints.setCharacters("asdfgwertzxcvb");
Hints.style("font-family: Consolas; font-size: 14px; line-height: 1;");

settings.nextLinkRegex = /((>>|next)|>|›|»|→|次へ|次のページ+)/i;
settings.prevLinkRegex = /((<<|prev(ious)?)|<|‹|«|←|前へ|前のページ+)/i;

// ---------------------------------------------------------
const shuntNormalKeys = (keys) => keys.forEach((key) => map(`!!${key}`, key));
const unmapNormalKeys = (keys) => keys.forEach((key) => unmap(key));
const unshuntNormalKeys = (keys) => keys.forEach((key) => unmap(`!!${key}`));
// ---------------------------------------------------------
const defaultNormalKeys = [
  "<Alt-s>",
  "<Alt-i>",
  "p",
  ";ql",
  "cf",
  ";m",
  ";fs",
  "O",
  "af",
  "C",
  "<Ctrl-h>",
  "<Ctrl-j>",
  "I",
  "<Ctrl-i>",
  "q",
  "<Ctrl-Alt-i>",
  "cS",
  "cs",
  "j",
  "k",
  ";w",
  "w",
  "yt",
  "yT",
  "g0",
  "g$",
  "gx0",
  "gxt",
  "gxT",
  "gx$",
  "gxx",
  "gxp",
  "E",
  "R",
  "T",
  ";gt",
  ";gw",
  "<Alt-p>",
  "<Alt-m>",
  "on",
  "gT",
  "gt",
  "gp",
  ";u",
  ";U",
  "B",
  "F",
  "<Ctrl-6>",
  "S",
  "D",
  "ZZ",
  "ZR",
  "sg",
  "sd",
  "sb",
  "se",
  "sw",
  "ss",
  "sh",
  "sy",
  "yG",
  "yS",
  "yi",
  "ys",
  "yj",
  "yQ",
  "yp",
  "cq",
  "cc",
  ";pp",
  ";pj",
  "oi",
  "od",
  "ob",
  "oe",
  "H",
  "t",
  "m",
  "'",
  "<Ctrl-'>",
  ";pm",
  ";e",
  ";v",
  "gc",
  "gk",
  "gn",
  ";i",
  ";j",
  "cp",
  ";pa",
  ";pb",
  ";pd",
  ";ps",
  ";pc",
  ";cp",
  ";ap",
  "gr",
  ";s",
  ";ph",
  ";t",
  ";dh",
  ";db",
  ";yh",
  "ZQ",
];
shuntNormalKeys(defaultNormalKeys);
unmapNormalKeys(defaultNormalKeys);

map("@@", "!!<Alt-s>");
map("i", "!!<Alt-i>");
map("@1pt", "!!p");
map(";F", "!!cf");
map("cf", "!!;fs");
map(";u", "!!O");
map("F", "!!af");
map(";mov", "!!<Ctrl-h>");
map(";mou", "!!<Ctrl-j>");
map(";f", "!!q");
map("cc", "!!cS");
map("c;", "!!cs");
map("j", "!!j");
map("s", "!!j");
map("k", "!!k");
map("w", "!!k");
map("cw;", "!!w");
map("ty", "!!yt");
map("tY", "!!yT");
map("t0", "!!g0");
map("t$", "!!g$");
map("tx0", "!!gx0");
map("txl", "!!gxt");
map("txr", "!!gxT");
map("tx$", "!!gx$");
map("txx", "!!gxx");
map("txp", "!!gxp");
map("E", "!!E");
map("J", "!!E");
map("R", "!!R");
map("K", "!!R");
map("tgt", "!!;gt");
map("tgw", "!!;gw");
map("tp", "!!<Alt-p>");
map("tm", "!!<Alt-m>");
map("tn", "!!on");
map("tgp", "!!gp");
map("t;", "!!<Ctrl-6>");
map("S", "!!S");
map("H", "!!S");
map("D", "!!D");
map("L", "!!D");
map("y@e", "!!yj");
map(";q", "!!cq");
map("@re", "!!;pj");
map("gp", "!!oi");
map("oH", "!!H");
map("a", "!!t");
map("@mk", "!!m");
map("m", "!!'");
map("M", "!!<Ctrl-'>");
map("@md", "!!;pm");
map("@e", "!!;e");
map("gj", "!!;j");
map("@R", "!!gr");
map("@pdf", "!!;s");
map("@ph", "!!;ph");
map("@t", "!!;t");
map("@yh", "!!;yh");

unshuntNormalKeys(defaultNormalKeys);
// ---------------------------------------------------------

mapkey("ymd", "Copy current page's link for markdown", function () {
  const url = new URL(window.location.href);
  var title = window.document.title.replace(/(<|>)/g, "\\$1");
  Clipboard.write(`[${title}](${url.href})`);
});

mapkey("ysc", "Copy current page's link for Scrapbox", function () {
  const url = new URL(window.location.href);
  var title = window.document.title.replace(/(<|>)/g, "\\$1");
  Clipboard.write(`[${url.href} ${title}]`);
});

// Weblio ※Surfingkeys不具合のため英和のみ
// https://github.com/brookhong/Surfingkeys/wiki/Register-inline-query
api.Front.registerInlineQuery({
  url: function (q) {
    return `https://ejje.weblio.jp/content/${q}`;
  },
  parseResult: function (res) {
    var parser = new DOMParser();
    var doc = parser.parseFromString(res.text, "text/html");
    var result = doc.querySelector("#summary .content-explanation");
    if (result) {
      return result.innerHTML;
    }
  },
});

// YouTube - J/L: 10 secs skip
unmapAllExcept([
  "w",
  "s",
  "e",
  "d",
  "f",
  "r",
  "gg",
  "gi",
  "J",
  "K",
  "L",
  "H",
  "x",
  "ysc",
], /youtube.com/);
unmapAllExcept([], /miro.com/);

// set theme
settings.theme = `
.sk_theme {
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji";
    font-feature-settings: "palt";;
    font-size: 0.875rem;
    background: rgb(30 41 59 / 90%);
    backdrop-filter: blur(5px);
    box-shadow: 0px 2px 10px rgb(0 0 0 / 80%);
    border-radius: 0.5rem;
    color: #abb2bf;
}
.sk_theme input {
    font-family: monospace;
    letter-spacing: -0.03em;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
#sk_omnibar {
    width: 50%;
    left: 25%;
    opacity: 1 !important;
}
#sk_omnibar #sk_omnibarSearchArea {
    margin: 1.5rem;
    padding: 0.5rem;
    background-color: hsl(217deg 19% 32% / 90%);
    border-radius: 0.5rem;
    border: 0;
}
#sk_omnibar #sk_omnibarSearchResult {
    margin: 0 1.5rem;
}
#sk_omnibar #sk_omnibarSearchResult ul li {
    padding: 0.5rem 1rem;
    border-radius: 0.5rem;
    margin-bottom: 0.5rem;
    background-color: hsl(215deg 25% 17% / 30%);
}
#sk_omnibar #sk_omnibarSearchResult .omnibar_highlight {
    font-weight: bold;
    color: inherit;
    background-color: rgba(255, 255, 0, 0.2);
}
#sk_omnibar #sk_omnibarSearchResult ul li.focused {
    background-image: linear-gradient(to right, hsl(239deg 84% 67% / 50%), hsl(199deg 89% 48% / 60%));
    color: #fff;
}
#sk_omnibar #sk_omnibarSearchResult li .url {
    color: rgb(56, 189, 248);
    font-weight: normal;
    font-family: monospace;
    letter-spacing: -0.03em;
    font-size: 0.75rem;
    margin-left: 1.45rem;
}
#sk_status, #sk_find {
    font-size: 1.25rem;
}
#sk_usage > div {
    width: 25%;
    margin-bottom: 2em;
}
#sk_usage span.annotation {
    padding-left: 16px;
}
#sk_bubble .sk_bubble_content {
    overflow: auto;
}
#sk_keystroke {
    background: rgb(30 41 59 / 90%);
    border-radius: 0.5rem 0 0;
    padding: 0.5rem 1rem;
    font-size: 1.25rem;
}
#sk_keystroke > div {
    display: flex;
    align-items: center;
    margin: 0.25em 0;
}
#sk_keystroke kbd {
    font-size: 1.5rem;
    line-height: 1;
}
#sk_keystroke kbd > .candidates {
    color: rgb(219 39 119);
}
#sk_keystroke .kbd-span {
    min-width: 2.5rem;
}
#sk_keystroke .annotation {
    padding-left: 0.5em;
    color: rgb(125 211 252);
}
#sk_keystroke:not(.expandRichHints) {
    font-size: 2rem;
    font-family: monospace;
}
#sk_status {
    padding: 4px 12px;
}
#sk_status > span {
    line-height: 1;
    display: inline-block;
    border: 0 !important;
}
`;

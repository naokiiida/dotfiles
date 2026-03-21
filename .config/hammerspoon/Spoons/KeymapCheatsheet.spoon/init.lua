--- === KeymapCheatsheet ===
--- Shifted Miryoku キーマップのチートシートオーバーレイ
--- Cmd+Shift+/ でトグル表示

local obj = {}
obj.__index = obj
obj.name = "KeymapCheatsheet"
obj.version = "2.0"
obj.author = "naokiiida"

-- State
obj.webview = nil
obj.hotkey = nil
obj.visible = false

local spoonDir = hs.spoons.scriptPath()
local data = dofile(spoonDir .. "/layers.lua")

-- Build JSON data for HTML template
local rowNames = {"frow", "numrow", "qrow", "homerow", "bottom"}

local tabs = {}
local layersDict = {}
for _, layer in ipairs(data.layers) do
  table.insert(tabs, {name = layer.name, label = layer.label})
  local rows = {}
  for _, rn in ipairs(rowNames) do
    rows[rn] = layer.keys[rn] or {}
  end
  layersDict[layer.name] = rows
end

local tabsJSON = hs.json.encode(tabs)
local layersJSON = hs.json.encode(layersDict)
local colorsJSON = hs.json.encode(data.colors)

local function loadHTML()
  local f = io.open(spoonDir .. "/index.html", "r")
  local html = f:read("*a")
  f:close()
  return string.format(html, tabsJSON, layersJSON, colorsJSON)
end

function obj:start()
  self.hotkey = hs.hotkey.bind({"cmd", "shift"}, "/", function()
    self:toggle()
  end)
  return self
end

function obj:stop()
  if self.hotkey then self.hotkey:delete() end
  if self.webview then self.webview:delete() end
  self.webview = nil
  self.visible = false
  return self
end

function obj:toggle()
  if self.visible and self.webview then
    self.webview:delete()
    self.webview = nil
    self.visible = false
  else
    self:show()
  end
end

function obj:show()
  local screen = hs.screen.mainScreen():frame()
  local w = 780
  local h = 480
  local x = screen.x + (screen.w - w) / 2
  local y = screen.y + (screen.h - h) / 2

  self.webview = hs.webview.new({x=x, y=y, w=w, h=h})
  self.webview:windowStyle({"borderless", "nonactivating", "closable"})
  self.webview:level(hs.drawing.windowLevels.floating)
  self.webview:alpha(0.95)
  self.webview:html(loadHTML())
  self.webview:allowTextEntry(false)
  self.webview:show()
  self.visible = true
end

return obj

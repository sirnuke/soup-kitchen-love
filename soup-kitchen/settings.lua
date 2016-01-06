-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

local tag = "Settings"

Settings = Class("Settings")

local function generate_defaults(root)
  root.Magic = {
    QuickExit = {
      Enabled = true,
      Key = "escape"
    },
  }
  root.Graphics = {
    Directory = "images/",
    Clear = { 255, 255, 255, 0 },
  }
  root.Scenes = {
  }
  root.Map = {
  }
end

function Settings:init()
  generate_defaults(self)
end

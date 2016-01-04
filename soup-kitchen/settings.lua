-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

local tag = "Settings"

Settings = Class("Settings")

local function generate_defaults(root)
  root.Magic = {
    QuickExit = {
      Enabled = true,
      Key = "escape"
    }
  }
end

function Settings:init()
  generate_defaults(self)
end

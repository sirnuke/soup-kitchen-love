-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

local tag = "Settings"

local SettingsImpl = Class("settings")

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
    Interface = {
      Images = {
        HoverTile = "hover-tile.png",
        PressedTile = "pressed-tile.png",
        SelectedTile = "selected-tile.png",
      },
    },
    Tile = {
      Dimensions = {
        Width = 32,
        Height = 32,
      },
      Blocked = {
        "Blocked",
      },
    },
    Dimensions = {
      Width = 25,
      Height = 20,
    },
  }
end

function SettingsImpl:init()
  Log.info(tag, "Generating settings...")
  generate_defaults(self)
end

function SettingsImpl:dump()
  Log.info(tag, "%s", Inspect(self))
end

Settings = SettingsImpl()

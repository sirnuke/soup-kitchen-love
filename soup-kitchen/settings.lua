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
    InGame = {
      Images = {
        Background = "background.png"
      },
      Layout = {
        Map = {
          X = 0,
          Y = 40,
          W = 800,
          H = 640,
        },
        SideBar = {
          X = 800,
          Y = 0,
          W = 480,
          H = 720,
        },
      },
    },
    Loading = {
      Images = {
        Background = "background.png"
      },
    },
    MainMenu = {
      Images = {
        Background = "background.png"
      },
    },
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
    },
    Tiles = {
      Blocked = {
        Blocked = true,
      },
      Floor = {
        Blocked = false,
      },
    },
    Dimensions = {
      Width = 25,
      Height = 20,
    },
  }
end

function SettingsImpl:init()
  generate_defaults(self)
end

function SettingsImpl:dump()
  Log.info(tag, "%s", Inspect(self))
end

Settings = SettingsImpl()

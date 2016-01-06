-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Map = Class("Map")

function Map:init(core)
  self.Core = core
  self.Core.Settings.Map = {
    Tile = {
      Dimensions = {
        Width = 32,
        Height = 32,
      },
    },
    Dimensions = {
      Width = 30,
      Height = 30,
    },
  }
end

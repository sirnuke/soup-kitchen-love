-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

local tag = "Map"

require "world.coordinate"
require "world.tile"

Map = Class("Map")

function Map:init()
  Settings.Map = {
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

  self.Data = {}
  for y = 0, Settings.Map.Dimensions.Height - 1 do
    self.Data[y] = {}
    for x = 0, Settings.Map.Dimensions.Width - 1 do
      self.Data[y][x] = Tile(Coordinate(x, y))
    end
  end
end

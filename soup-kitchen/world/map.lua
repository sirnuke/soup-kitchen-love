-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

local tag = "Map"

require "world.position"
require "world.tile"

Map = Class("Map")

function Map:init(settings)
  assert(Class.isInstance(settings, Settings))
  self.Settings = settings
  self.Settings.Map = {
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
  for y = 0, self.Settings.Map.Dimensions.Height - 1 do
    self.Data[y] = {}
    for x = 0, self.Settings.Map.Dimensions.Width - 1 do
      self.Data[y][x] = Tile(Position(self.Settings, x, y))
    end
  end
end

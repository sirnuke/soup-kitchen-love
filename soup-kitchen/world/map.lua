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
  for y = 1, Settings.Map.Dimensions.Height do
    self.Data[y] = {}
    for x = 1, Settings.Map.Dimensions.Width do
      self.Data[y][x] = Tile(Coordinate(x - 1, y - 1))
    end
  end

  self.Pawns = {}
end

function Map:eachTile(func)
  for y = 1, Settings.Map.Dimensions.Height do
    for x = 1, Settings.Map.Dimensions.Width do
      func(self.Data[y][x])
    end
  end
end

function Map:eachPawn(func)
  for key, pawn in ipairs(self.Pawns) do
    func(pawn)
  end
end

function Map:draw()
  self:eachTile(function(tile) tile:draw() end)
  self:eachPawn(function(pawn) pawn:draw() end)
end

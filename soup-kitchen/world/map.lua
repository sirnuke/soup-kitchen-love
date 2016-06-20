-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

local tag = "Map"

require "world.coordinate"
require "world.tile"

require "objects.blocked"

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
      Width = 20,
      Height = 20,
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

function Map:generateDebugMap()
  local coord

  for y = 0, Settings.Map.Dimensions.Height - 1 do
    coord = Coordinate(5, y)
    self:getTile(coord):setObject(Blocked(coord, "Blocked"))
  end
  coord = Coordinate(0, 0)
  self:getTile(coord):setObject(Blocked(coord, "Blocked"))
  coord = Coordinate(0, Settings.Map.Dimensions.Height - 1)
  self:getTile(coord):setObject(Blocked(coord, "Blocked"))
  coord = Coordinate(Settings.Map.Dimensions.Width - 1, Settings.Map.Dimensions.Height - 1)
  self:getTile(coord):setObject(Blocked(coord, "Blocked"))
  coord = Coordinate(Settings.Map.Dimensions.Width - 1, 0)
  self:getTile(coord):setObject(Blocked(coord, "Blocked"))
end

function Map:getTile(coordinate)
  assert(Class.isInstance(coordinate, Coordinate))
  assert(coordinate.X >= 0 and coordinate.Y >= 0)
  assert(coordinate.X < Settings.Map.Dimensions.Width)
  assert(coordinate.Y < Settings.Map.Dimensions.Height)
  return self.Data[coordinate.Y + 1][coordinate.X + 1]
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

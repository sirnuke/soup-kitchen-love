-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

local tag = "Map"

require "world.coordinate"
require "world.tile"

Map = Class("Map")

function Map:init()

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
    self:insertDebugBlocked(Coordinate(5, y))
  end
  self:insertDebugBlocked(Coordinate(0, 0))
  self:insertDebugBlocked(Coordinate(0, Settings.Map.Dimensions.Height - 1))
  self:insertDebugBlocked(Coordinate(Settings.Map.Dimensions.Width - 1, Settings.Map.Dimensions.Height - 1))
  self:insertDebugBlocked(Coordinate(Settings.Map.Dimensions.Width - 1, 0))
end

function Map:insertDebugBlocked(coord)
  self:getTile(coord):update(true, "Blocked")
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

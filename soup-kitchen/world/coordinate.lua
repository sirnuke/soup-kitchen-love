-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "world.position"

Coordinate = Class("Position")

function Coordinate:init(x, y)
  assert(Utilities:isInteger(x) and Utilities:isInteger(y))
  assert(x >= 0 and x < Settings.Map.Dimensions.Width,
    string.format("x:%i is out of range [0..%i)", x, Settings.Map.Dimensions.Width))
  assert(y >= 0 and y < Settings.Map.Dimensions.Height,
    string.format("y:%i is out of range [0..%i)", y, Settings.Map.Dimensions.Height))
  self.X = x
  self.Y = y
end

function Coordinate:duplicate()
  return Coordinate(self.X, self.Y)
end

function Coordinate:toPosition()
  local tileWidth = Settings.Map.Tile.Dimensions.Width
  local tileHeight = Settings.Map.Tile.Dimensions.Height
  return Position(self.X * tileWidth + tileWidth / 2, self.Y * tileHeight + tileHeight / 2)
end

function Coordinate:toScreen()
  return self.X * Settings.Map.Tile.Dimensions.Width, self.Y * Settings.Map.Tile.Dimensions.Height
end

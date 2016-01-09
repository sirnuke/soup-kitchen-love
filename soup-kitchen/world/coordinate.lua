-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "world.position"

Coordinate = Class("Position")

function Coordinate:init(settings, x, y)
  assert(Class.isInstance(settings, Settings))
  assert(Utilities:isInteger(x) and Utilities:isInteger(y))
  assert(x >= 0 and x < settings.Map.Dimensions.Width,
    string.format("x:%i is out of range [0..%i)", x, settings.Map.Dimensions.Width))
  assert(y >= 0 and y < settings.Map.Dimensions.Height,
    string.format("y:%i is out of range [0..%i)", y, settings.Map.Dimensions.Height))
  self.Settings = settings
  self.X = x
  self.Y = y
end

function Coordinate:duplicate()
  return Coordinate(self.Settings, self.X, self.Y)
end

function Coordinate:toPosition()
  local tileWidth = self.Settings.Map.Tile.Dimensions.Width
  local tileHeight = self.Settings.Map.Tile.Dimensions.Height
  return Position(self.Settings, self.X * tileWidth + tileWidth / 2,
                  self.Y * tileHeight + tileHeight / 2)
end

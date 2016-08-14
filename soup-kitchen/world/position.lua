-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Position = Class("Position")

function Position:init(x, y)
  local maxWidth = Settings.Map.Dimensions.Width * Settings.Map.Tile.Dimensions.Width
  local maxHeight = Settings.Map.Dimensions.Height * Settings.Map.Tile.Dimensions.Height
  assert(Utilities:isInteger(x) and Utilities:isInteger(y), "Valid arguments")
  assert(x >= 0 and x < maxWidth, string.format("x:%i is out of range [0..%i)", x, maxWidth))
  assert(y >= 0 and y < maxHeight, string.format("y:%i is out of range [0..%i)", y, maxHeight))
  self.X = x
  self.Y = y
end

function Position:duplicate()
  return Position(self.X, self.Y)
end

function Position:toCoordinate()
  return Coordinate.FromPosition(self.X, self.Y)
end

function Position:toScreen()
  return self.X, self.Y
end

function Position:__tostring()
  return string.format("P(%i,%i)", self.X, self.Y)
end


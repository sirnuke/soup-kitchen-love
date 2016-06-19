-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Position = Class("Position")

function Position:init(x, y)
  local maxWidth = Settings.Map.Dimensions.Width * Settings.Map.Tile.Dimensions.Width
  local maxHeight = Settings.Map.Dimensions.Height * Settings.Map.Tile.Dimensions.Height
  assert(type(x) == "number" and x >= 0 and x < maxWidth,
    string.format("x:%i is out of range [0..%i)", x, maxWidth))
  assert(type(y) == "number" and y >= 0 and y < maxHeight,
    string.format("y:%i is out of range [0..%i)", y, maxHeight))
  self.X = x
  self.Y = y
end

function Position:duplicate()
  return Position(self.X, self.Y)
end

-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Position = Class("Position")

function Position:init(settings, x, y)
  assert(Class.isInstance(settings, Settings))
  local maxWidth = settings.Map.Dimensions.Width * settings.Map.Tile.Dimensions.Width
  local maxHeight = settings.Map.Dimensions.Height * settings.Map.Tile.Dimensions.Height
  assert(type(x) == "number" and x >= 0 and x < maxWidth,
    string.format("x:%i is out of range [0..%i)", x, maxWidth))
  assert(type(y) == "number" and y >= 0 and y < maxHeight,
    string.format("y:%i is out of range [0..%i)", y, maxHeight))
  self.Settings = settings
  self.X = x
  self.Y = y
end

function Position:duplicate()
  return Position(self.Settings, self.X, self.Y)
end

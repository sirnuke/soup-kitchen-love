-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Position = Class("Position")

function Position:init(core, x, y)
  assert(Class.isInstance(core, Core))
  local maxWidth = core.Settings.Map.Dimensions.Width * core.Settings.Map.Tile.Dimensions.Width
  local maxHeight = core.Settings.Map.Dimensions.Heigth * core.Settings.Map.Tile.Dimensions.Height
  assert(type(x) == "number" and x >= 0 and x < maxWidth,
    string.format("x:%i is out of range [0..%i)", x, maxWidth))
  assert(type(y) == "number" and y >= 0 and y < maxHeight,
    string.format("y:%i is out of range [0..%i)", y, maxHeight))
  self.Core = core
  self.X = x
  self.Y = y
end

function Position:duplicate()
  return Position(self.X, self.Y)
end

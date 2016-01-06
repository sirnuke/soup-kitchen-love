-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Coordinate = Class("Position")

function Coordinate:init(core, x, y)
  assert(Class.isInstance(core, Core))
  assert(type(x) == "number" and x >= 0 and x < core.Settings.Map.Dimensions.Width,
    string.format("x:%i is out of range [0..%i)", x, core.Settings.Map.Dimensions.Width))
  assert(type(y) == "number" and y >= 0 and y < core.Settings.Map.Dimensions.Height,
    string.format("y:%i is out of range [0..%i)", y, core.Settings.Map.Dimensions.Height))
  self.Core = core
  self.X = x
  self.Y = y
end

function Coordinate:duplicate()
  return Coordinate(self.X, self.Y)
end


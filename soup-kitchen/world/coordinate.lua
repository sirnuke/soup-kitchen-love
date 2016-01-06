-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Coordinate = Class("Position")

function Coordinate:init(x, y)
  assert(type(x) == "number" and x >= 0)
  assert(type(y) == "number" and y >= 0)
  self.X = x
  self.Y = y
end

function Coordinate:duplicate()
  return Coordinate(self.X, self.Y)
end


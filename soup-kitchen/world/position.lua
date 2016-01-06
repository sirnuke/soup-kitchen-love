-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Position = Class("Position")

function Position:init(x, y)
  assert(type(x) == "number" and x >= 0)
  assert(type(y) == "number" and y >= 0)
  self.X = x
  self.Y = y
end

function Position:duplicate()
  return Position(self.X, self.Y)
end

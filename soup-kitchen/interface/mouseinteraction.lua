-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

MouseInteraction = Class("MouseInteraction")

function MouseInteraction:init(x, y, w, h)
  assert(type(x) == "number", type(y) == "number", type(w) == "number", type(h) == "number",
    "Valid arguments")
  self.X1 = x
  self.Y1 = y
  self.X2 = x + w
  self.Y2 = y + h
end

function MouseInteraction:inBounds(x, y)
  if x >= self.X1 and y >= self.Y1 and x < self.X2 and y < self.Y2 then
    return true, x - self.X1, y - self.Y1
  else
    return false, nil, nil
  end
end

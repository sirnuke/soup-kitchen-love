-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

BoundingBox = Class("BoundingBox")

function BoundingBox:init(x, y, w, h)
  self:set(x, y, w, h)
end

function BoundingBox:set(x, y, w, h)
  assert(Utilities:isInteger(x) and Utilities:isInteger(y) and Utilities:isInteger(w)
    and Utilities:isInteger(h), "Valid arguments")
  assert(x >= 0 and y >= 0 and w >= 1 and h >= 1, "Valid dimensions")
  self.X1 = x
  self.Y1 = y
  self.X2 = x + w
  self.Y2 = y + h
end

function BoundingBox:inside(x, y)
  if x >= self.X1 and y >= self.Y1 and x < self.X2 and y < self.Y2 then
    return true
  else
    return false
  end
end


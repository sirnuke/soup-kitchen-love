-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Tile = Class("Tile")

function Tile:init(coordinate, object)
  assert(Class.isInstance(coordinate, Coordinate))
  self.Coordinate = coordinate:duplicate()
  self.Object = nil
  self.Blocked = false
end

function Tile:setObject(object)
  assert(Class.isInstance(object, Object))
  self.Object = object
  self.Blocked = object:isBlocked()
end

function Tile:isBlocked()
  return self.Blocked
end

function Tile:draw()
  if self.Object ~= nil then self.Object:draw() end
end

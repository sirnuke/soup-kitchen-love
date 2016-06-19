-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Tile = Class("Tile")

function Tile:init(coordinate)
  assert(Class.isInstance(coordinate, Coordinate))
  self.Coordinate = coordinate:duplicate()
  self.Object = nil
  self.Blocked = false
end

function Tile:setObject(object, blocked)
  assert(Class.isInstance(object, Object))
  assert(type(blocked) == "boolean")
  self.Object = object
  self.Blocked = blocked
end

function Tile:isBlocked()
  return self.Blocked
end

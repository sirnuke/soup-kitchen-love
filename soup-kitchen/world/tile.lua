-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Tile = Class("Tile")

function Tile:init(position)
  assert(Class.isInstance(position, Position))
  self.Position = position:duplicate()
  self.Occupant = nil
end

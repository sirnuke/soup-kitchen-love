-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Tile = Class("Tile")

function Tile:init(coordinate)
  assert(Class.isInstance(coordinate, Coordinate))
  self.Coordinate = coordinate:duplicate()
  self.Object = nil
  self.Pawn = nil
end

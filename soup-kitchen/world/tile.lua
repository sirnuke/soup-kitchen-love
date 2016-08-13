-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Tile = Class("Tile")

local images = nil


function Tile:init(id, coordinate)
  assert(Class.isInstance(coordinate, Coordinate))
  self.Coordinate = coordinate:duplicate()
  self:update(id)
end

function Tile:update(id)
  assert(Settings.Map.Tiles[id] ~= nil, "Must have valid tile id")
  self.Blocked = Settings.Map.Tiles[id].Blocked
  self.Interactable = Settings.Map.Tiles[id].Interactable
  self.Id = id
end


-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Pawn = Class("Pawn")

function Pawn:init(id, position)
  assert(Class.isInstance(position, Position))
  self.Position = position:duplicate()
  self:update(id)
end

function Pawn:update(id)
  assert(Settings.Map.Pawns[id] ~= nil, "Must have valid pawn id")
  self.Controllable = Settings.Map.Pawns[id].Controllable
  self.Id = id
end


-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Blocked = Object:extend("Blocked")

local data = nil

function Blocked:init(coordinate)
  Blocked.super:init(coordinate)
  if data == nil then
    data = {}
    Settings.Map.Tile.Blocked = {
      "Wall",
    }
    data["Wall"] = Core:loadImage("tiles", "wall")
  end
end

function Blocked:draw()
end

-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Tile = Class("Tile")

local images = nil

local function loadStaticData()
  if images ~= nil then return end
  images = {}
  Settings.Map.Tile.Blocked = {
    "Blocked",
  }
  for key,value in ipairs(Settings.Map.Tile.Blocked) do
    images[value] = Core:loadImage("Tiles", value..".png")
  end
end


function Tile:init(coordinate)
  assert(Class.isInstance(coordinate, Coordinate))

  loadStaticData()

  self.Coordinate = coordinate:duplicate()
  self.X, self.Y = coordinate:toScreen()
  self.Image = nil
  self.Blocked = false
end

function Tile:update(blocked, type)
  self.Blocked = blocked
  self.Image = images[type]
end

function Tile:isBlocked()
  return self.Blocked
end

function Tile:draw()
  if self.Image ~= nil then love.graphics.draw(self.Image, self.X, self.Y) end
end

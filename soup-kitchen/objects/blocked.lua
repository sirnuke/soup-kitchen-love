-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "objects.object"

Blocked = Object:extend("Blocked")

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

function Blocked:init(coordinate, type)
  Blocked.super:init(coordinate)
  self.X, self.Y = coordinate:toTopLeft()
  self.Type = type

  loadStaticData()

  local valid = false
  for key,value in ipairs(Settings.Map.Tile.Blocked) do
    if value == type then valid = true end
  end
  assert(valid)
end

function Blocked:draw()
  love.graphics.draw(images[self.Type], self.X, self.Y)
end

function Blocked:isBlocked()
  return true
end

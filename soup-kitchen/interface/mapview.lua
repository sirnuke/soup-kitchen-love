-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

MapView = Class("MapView")

local tag = "MapView"

function MapView:init(map, x, y, w, h)
  assert(Class.isInstance(map, Map), "Valid class arguments")
  self.Map = map
  self.X = x
  self.Y = y
  self.Mouse = MouseInteraction(self, x, y, w, h)
  self.HoverTile = nil
  self.PressedTile = nil
  self.SelectedTile = nil

  self.HoverImage = Core:loadImage("Interface", Settings.Map.Interface.Images.HoverTile)
  self.PressedImage = Core:loadImage("Interface", Settings.Map.Interface.Images.PressedTile)
  self.SelectedImage = Core:loadImage("Interface", Settings.Map.Interface.Images.SelectedTile)
  self.TileImages = {}
  for key,value in pairs(Settings.Map.Tiles) do
    self.TileImages[key] = Core:loadImage("Tiles", key..".png")
  end
end

function MapView:draw()
  -- Setup screen coordinates
  love.graphics.push()
  love.graphics.translate(self.X, self.Y)

  -- Draw map
  self.Map:eachTile(function(tile) self:drawTile(tile) end)
  self.Map:eachPawn(function(pawn) pawn:draw() end)
  -- Draw UI

  if self.HoverTile ~= nil then
    love.graphics.draw(self.HoverImage, self.HoverTile:toScreen())
  end

  if self.PressedTile ~= nil then
    love.graphics.draw(self.PressedImage, self.PressedTile:toScreen())
  end

  if self.SelectedTile ~= nil then
    love.graphics.draw(self.SelectedImage, self.SelectedTile:toScreen())
  end

  -- Revert screen coordinates
  love.graphics.pop()
end

function MapView:drawTile(tile)
  love.graphics.draw(self.TileImages[tile.Id], tile.Coordinate:toScreen())
end

function MapView:update(dt)
  -- Tick UI
end

function MapView:mousePress(x, y)
  local coordinate = Coordinate.FromPosition(x, y)
  if self.Map:getTile(coordinate).Interactable then
    self.PressedTile = coordinate
  else
    self.PressedTile = nil
  end
  self.SelectedTile = nil
end

function MapView:mouseHover(x, y)
  local coordinate = Coordinate.FromPosition(x, y)
  if self.PressedTile ~= coordinate then self.PressedTile = nil end
  if self.Map:getTile(coordinate).Interactable then
    self.HoverTile = coordinate
  else
    self.HoverTile = nil
  end
end

function MapView:mouseClear()
  self.HoverTile = nil
  self.PressedTile = nil
end

function MapView:mouseTrigger(x, y)
  local coordinate = Coordinate.FromPosition(x, y)
  if coordinate == self.PressedTile then
    Log.info(tag, "Trigger %s", coordinate)
    self.SelectedTile = self.PressedTile
  else
    Log.info(tag, "Ignoring trigger")
  end
  self.PressedTile = nil
end


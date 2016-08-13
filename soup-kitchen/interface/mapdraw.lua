-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

MapDraw = Class("MapDraw")

local tag = "MapDraw"

function MapDraw:init(map, x, y, w, h)
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
end

function MapDraw:draw()
  -- Setup screen coordinates
  love.graphics.push()
  love.graphics.translate(self.X, self.Y)

  -- Draw map
  self.Map:eachTile(function(tile) tile:draw() end)
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

function MapDraw:update(dt)
  -- Tick UI
end

function MapDraw:mousePress(x, y)
  local coordinate = Coordinate.FromPosition(x, y)
  self.PressedTile = coordinate
end

function MapDraw:mouseHover(x, y)
  local coordinate = Coordinate.FromPosition(x, y)
  self.HoverTile = coordinate
  if self.PressedTile ~= nil and self.HoverTile ~= self.PressedTile then
    self.PressedTile = nil
  end
end

function MapDraw:mouseClear()
  self.HoverTile = nil
  self.PressedTile = nil
end

function MapDraw:mouseTrigger(x, y)
  local coordinate = Coordinate.FromPosition(x, y)
  if coordinate == self.PressedTile then
    Log.info(tag, "Trigger %s", coordinate)
    self.SelectedTile = self.PressedTile
  else
    Log.info(tag, "Ignoring trigger")
  end
  self.PressedTile = nil
end


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
  self.SelectedTile = nil
end

function MapDraw:draw()
  -- Setup screen coordinates
  love.graphics.push()
  love.graphics.translate(self.X, self.Y)

  -- Draw map
  self.Map:eachTile(function(tile) tile:draw() end)
  self.Map:eachPawn(function(pawn) pawn:draw() end)
  -- Draw UI

  -- Revert screen coordinates
  love.graphics.pop()
end

function MapDraw:update(dt)
  -- Tick UI
end

function MapDraw:mousePress(x, y)
  local coordinate = Coordinate.FromPosition(x, y)
  self.SelectedTile = coordinate
end

function MapDraw:mouseHover(x, y)
  local coordinate = Coordinate.FromPosition(x, y)
  self.HoverTile = coordinate
  if self.SelectedTile ~= nil and self.HoverTile ~= self.SelectedTile then
    self.SelectedTile = nil
  end
end

function MapDraw:mouseClear()
  self.HoverTile = nil
  self.SelectedTile = nil
end

function MapDraw:mouseTrigger(x, y)
  local coordinate = Coordinate.FromPosition(x, y)
  if coordinate == self.SelectedTile then
    Log.info(tag, "Trigger %s", coordinate)
  else
    Log.info(tag, "Ignoring trigger")
  end
end


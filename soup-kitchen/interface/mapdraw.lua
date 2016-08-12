-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

MapDraw = Class("MapDraw")

local tag = "MapDraw"

function MapDraw:init(map, x, y, w, h)
  assert(Class.isInstance(map, Map), type(x) == "number", type(y) == "number",
    type(w) == "number", type(h) == "number", "Valid Arguments")
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
  -- Visually update UI
end

function MapDraw:mousePress(x, y)
  Log.info(tag, "Initial click on map @ (%i,%i)", x, y)
  -- set object to clicked, if interactable
end

function MapDraw:mouseHover(x, y)
  -- if clicked and doesn't match, set to pure hover
end

function MapDraw:mouseClear()
  -- Update UI state to nada, clear clicked
end

function MapDraw:mouseTrigger(x, y)
  Log.info(tag, "Clicked inside map @ (%i,%i)", x, y)
  -- if matches initial click, trigger
  -- else set to hover at (x, y)
end


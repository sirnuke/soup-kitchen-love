-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "interface.boundingbox"

MouseInteraction = Class("MouseInteraction")

function MouseInteraction:init(callback, x, y, w, h)
  assert(type(callback) == "table", "Basic validity of arguments")
  assert(callback.mousePress ~= nil, "callback contains mousePress")
  assert(callback.mouseHover ~= nil, "callback contains mouseHover")
  assert(callback.mouseClear ~= nil, "callback contains mouseClear")
  assert(callback.mouseTrigger ~= nil, "callback contains mouseTrigger")
  self.Callback = callback
  self.Clicked = false
  self.BoundingBox = BoundingBox(x, y, w, h)
end

function MouseInteraction:setBounds(x, y, w, h)
  self.BoundingBox:set(x, y, w, h)
end

function MouseInteraction:inBounds(x, y)
  return self.BoundingBox:inside(x, y)
end

function MouseInteraction:translate(x, y)
  return x - self.BoundingBox.X1, y - self.BoundingBox.Y1
end

function MouseInteraction:press(x, y)
  if self:inBounds(x, y) then
    self.Clicked = true
    self.Callback:mousePress(self:translate(x, y))
  end
end

function MouseInteraction:hover(x, y)
  if self:inBounds(x, y) then
    self.Callback:mouseHover(self:translate(x, y))
  else
    self.Clicked = false
    self.Callback:mouseClear()
  end
end

function MouseInteraction:release(x, y)
  if self:inBounds(x, y) and self.Clicked then
    self.Callback:mouseTrigger(self:translate(x, y))
  end
  self.Clicked = false
end


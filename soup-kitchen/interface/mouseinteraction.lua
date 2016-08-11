-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

MouseInteraction = Class("MouseInteraction")

function MouseInteraction:init(listener, x, y, w, h)
  assert(type(listener) ~= "nil", type(x) == "number", type(y) == "number", type(w) == "number",
    type(h) == "number", "Valid arguments")
  self.listener = listener
  self.clicked = false
  self.X1 = x
  self.Y1 = y
  self.X2 = x + w
  self.Y2 = y + h
end

function MouseInteraction:press(x, y)
  if self:inBounds(x, y) then
    self.clicked = true
    self.listener:mousePress(x - self.X1, y - self.Y1)
  end
end

function MouseInteraction:hover(x, y)
  if self:inBounds(x, y) then
    self.listener:mouseHover(x - self.X1, y - self.Y1)
  else
    self.clicked = false
    self.listener:mouseClear()
  end
end

function MouseInteraction:release(x, y)
  if self:inBounds(x, y) and self.clicked then
    self.listener:mouseTrigger(x - self.X1, y - self.Y1)
  end
  self.clicked = false
end

function MouseInteraction:inBounds(x, y)
  if x >= self.X1 and y >= self.Y1 and x < self.X2 and y < self.Y2 then
    return true, x - self.X1, y - self.Y1
  else
    return false, nil, nil
  end
end

-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

MouseInteraction = Class("MouseInteraction")

function MouseInteraction:init(listener, x, y, w, h)
  assert(type(listener) ~= "nil", "Valid arguments")
  self.listener = listener
  self.clicked = false
  self:setBounds(x, y, w, h)
end

function MouseInteraction:setBounds(x, y, w, h)
  assert(type(x) == "number", type(y) == "number", type(w) == "number", type(h) == "number",
    "Valid arguments")
  self.X1 = x
  self.Y1 = y
  self.X2 = x + w
  self.Y2 = y + h
end

function MouseInteraction:inBounds(x, y)
  if x >= self.X1 and y >= self.Y1 and x < self.X2 and y < self.Y2 then
    return true
  else
    return false
  end
end

function MouseInteraction:translate(x, y)
  return x - self.X1, y - self.Y1
end

function MouseInteraction:press(x, y)
  if self:inBounds(x, y) then
    self.clicked = true
    self.listener:mousePress(self:translate(x, y))
  end
end

function MouseInteraction:hover(x, y)
  if self:inBounds(x, y) then
    self.listener:mouseHover(self:translate(x, y))
  else
    self.clicked = false
    self.listener:mouseClear()
  end
end

function MouseInteraction:release(x, y)
  if self:inBounds(x, y) and self.clicked then
    self.listener:mouseTrigger(self:translate(x, y))
  end
  self.clicked = false
end


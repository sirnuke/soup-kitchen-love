-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

MouseInteraction = Class("MouseInteraction")

function MouseInteraction:init(callback, x, y, w, h)
  assert(type(callback) == "table", "Basic validity of arguments")
  assert(callback.mousePress ~= nil, "callback contains mousePress")
  assert(callback.mouseHover ~= nil, "callback contains mouseHover")
  assert(callback.mouseClear ~= nil, "callback contains mouseClear")
  assert(callback.mouseTrigger ~= nil, "callback contains mouseTrigger")
  self.callback = callback
  self.clicked = false
  self:setBounds(x, y, w, h)
end

function MouseInteraction:setBounds(x, y, w, h)
  assert(Utilities:isInteger(x) and Utilities:isInteger(y) and Utilities:isInteger(w)
    and Utilities:isInteger(h), "Valid arguments")
  assert(x >= 0 and y >= 0 and w >= 1 and h >= 1, "Valid dimensions")
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
    self.callback:mousePress(self:translate(x, y))
  end
end

function MouseInteraction:hover(x, y)
  if self:inBounds(x, y) then
    self.callback:mouseHover(self:translate(x, y))
  else
    self.clicked = false
    self.callback:mouseClear()
  end
end

function MouseInteraction:release(x, y)
  if self:inBounds(x, y) and self.clicked then
    self.callback:mouseTrigger(self:translate(x, y))
  end
  self.clicked = false
end


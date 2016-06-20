-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Object = Class("Object")

function Object:init(position)
  self.OverrideWarn = {
    Draw = false,
  }
end

function Object:draw(coordinate)
  if not self.OverrideWarn.Draw then
    Log.warn(tag, "Object %s doesn't override :draw()!", self.name)
    self.OverrideWarn.Draw = true
  end
end

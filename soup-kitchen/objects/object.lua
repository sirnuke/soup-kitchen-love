-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Object = Class("Object")

function Object:init(coordinate)
  self.OverrideWarn = {
    Draw = false,
  }
  self.Coordinate = coordinate:duplicate()
end

function Object:draw()
  if not self.OverrideWarn.Draw then
    Log.warn(tag, "Object %s doesn't override :draw()!", self.name)
    self.OverrideWarn.Draw = true
  end
end

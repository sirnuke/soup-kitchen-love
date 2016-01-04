-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

local tag = "Scene"

Scene = Class("Scene")

function Scene:init(core)
  self.core = core
  self.enter_warn = false
  self.draw_warn = false
  self.update_warn = false
  self.exit_warn = false
end

function Scene:enter()
  if not self.enter_warn then
    Log.warn(tag, "Scene %s doesn't override :enter()!", self.name)
    self.enter_warn = true
  end
end

function Scene:exit()
  if not self.exit_warn then
    Log.warn(tag, "Scene %s doesn't override :exit()!", self.name)
    self.exit_warn = true
  end
end

function Scene:draw()
  if not self.draw_warn then
    Log.warn(tag, "Scene %s doesn't override :draw()!", self.name)
    self.draw_warn = true
  end
end

function Scene:update()
  if not self.update_warn then
    Log.warn(tag, "Scene %s doesn't override :update()!", self.name)
    self.update_warn = true
  end
end

function Scene:keyPressed(key) end
function Scene:keyReleased(key) end
function Scene:mousePressed(x, y, button) end
function Scene:mouseReleased(x, y, button) end

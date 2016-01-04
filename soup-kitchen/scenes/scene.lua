-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

local tag = "Scene"

Scene = Class("Scene")

function Scene:init(core)
  self.Core = core
  self.OverrideWarn = {
    Enter = false,
    Draw = false,
    Update = false,
    Exit = false,
  }
end

function Scene:loadImage(key)
  assert(self.Core.Settings.Scenes[self.name].Images[key])
  return self.Core:loadImage(self.name, self.Core.Settings.Scenes[self.name].Images[key])
end

function Scene:enter()
  if not self.OverrideWarn.Enter then
    Log.warn(tag, "Scene %s doesn't override :enter()!", self.name)
    self.OverrideWarn.Enter = true
  end
end

function Scene:exit()
  if not self.OverrideWarn.Exit then
    Log.warn(tag, "Scene %s doesn't override :exit()!", self.name)
    self.OverrideWarn.Exit = true
  end
end

function Scene:draw()
  if not self.OverrideWarn.Draw then
    Log.warn(tag, "Scene %s doesn't override :draw()!", self.name)
    self.OverrideWarn.Draw = true
  end
end

function Scene:update(dt)
  if not self.OverrideWarn.Update then
    Log.warn(tag, "Scene %s doesn't override :update()!", self.name)
    self.OverrideWarn.Update = true
  end
end

function Scene:keyPressed(key) end
function Scene:keyReleased(key) end
function Scene:mousePressed(x, y, button) end
function Scene:mouseReleased(x, y, button) end

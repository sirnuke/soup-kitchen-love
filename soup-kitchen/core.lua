-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "settings"

require "scenes.mainmenu"

local tag = "Core"

Core = Class("Core")

function Core:init()
  Log.info(tag, "Initializing")
  self.Settings = Settings()
  self.Scenes = {
    MainMenu = MainMenu(self)
  }
  self.ActiveScene = self.Scenes.MainMenu
  self.ActiveScene:enter()
  self.NewScene = nil
end

function Core:draw()
  self.ActiveScene:draw()
end

function Core:update()

  if self.NewScene then
    self.ActiveScene:exit()
    self.ActiveScene = self.NewScene
    self.NewScene = nil
    self.ActiveScene:enter()
  end

  self.ActiveScene:update()
end

function Core:changeScene(scene)
  assert(self.Scenes[scene])
  Log.info(tag, "Switching from %s to %s", self.ActiveScene.name, scene)
  self.NewScene = self.Scenes[scene]
end

function Core:keyPressed(key)
  if self.Settings.Magic.QuickExit.Enabled and key == self.Settings.Magic.QuickExit.Key then
    os.exit(true)
  end
  self.ActiveScene:keyPressed(key)
end

function Core:keyReleased(key)
  self.ActiveScene:keyReleased(key)
end

function Core:mousePressed(x, y, button)
  self.ActiveScene:mousePressed(x, y, button)
end

function Core:mouseReleased(x, y, button)
  self.ActiveScene:mouseReleased(x, y, button)
end


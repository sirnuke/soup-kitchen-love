-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "settings"

require "scenes.loading"
require "scenes.mainmenu"
require "scenes.ingame"

local tag = "Core"

Core = Class("Core")

function Core:init()
  Log.info(tag, "Initializing")
  self.Settings = Settings()
  self.Scenes = {
    Loading = Loading(self),
    MainMenu = MainMenu(self),
    InGame = InGame(self),
  }
  self.Scenes.Loading:setReturnScene("MainMenu")
  self.ActiveScene = self.Scenes.Loading
  self.ActiveScene:enter()
  self.ActiveScene:draw()
  self.NewScene = nil
end

function Core:draw()
  love.graphics.clear(self.Settings.Graphics.Clear)
  self.ActiveScene:draw()
end

function Core:update(dt)

  if self.NewScene then
    self.ActiveScene:exit()
    self.ActiveScene = self.NewScene
    self.NewScene = nil
    self.ActiveScene:enter()
  end

  self.ActiveScene:update(dt)
end

function Core:displayLoadingScene(returnScene)
  self.Scenes.Loading:setReturnScene(returnScene)
  self:changeScene("Loading")
end

function Core:changeScene(scene)
  assert(self.Scenes[scene])
  Log.info(tag, "Switching from %s to %s", self.ActiveScene.name, scene)
  self.NewScene = self.Scenes[scene]
end

function Core:loadImage(scope, name)
  local image = love.graphics.newImage(self.Settings.Graphics.Directory..scope.."/"..name)
  assert(image)
  return image
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


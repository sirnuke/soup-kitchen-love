-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "settings"

require "image"

require "scenes.loading"
require "scenes.mainmenu"
require "scenes.ingame"

local tag = "Core"

local CoreImpl = Class("Core")
Core = nil

function StartGame()
  Log.info(tag, "Starting...")
  Core = CoreImpl()
  Core:load()
end

function CoreImpl:load()
  self.Scenes = {
    Loading = Loading(),
    MainMenu = MainMenu(),
    InGame = InGame(),
  }
  self.Scenes.Loading:setReturnScene("MainMenu")
  self.ActiveScene = self.Scenes.Loading
  self.ActiveScene:enter()
  self.ActiveScene:draw()
end

function CoreImpl:draw()
  love.graphics.clear(Settings.Graphics.Clear)
  self.ActiveScene:draw()
end

function CoreImpl:update(dt)

  if self.NewScene then
    self.ActiveScene:exit()
    self.ActiveScene = self.NewScene
    self.NewScene = nil
    self.ActiveScene:enter()
  end

  self.ActiveScene:update(dt)
end

function CoreImpl:displayLoadingScene(returnScene)
  self.Scenes.Loading:setReturnScene(returnScene)
  self:changeScene("Loading")
end

function CoreImpl:changeScene(scene)
  assert(self.Scenes[scene])
  Log.info(tag, "Switching from %s to %s", self.ActiveScene.name, scene)
  self.NewScene = self.Scenes[scene]
end

function CoreImpl:loadImage(scope, name, x, y)
  local data = love.graphics.newImage(Settings.Graphics.Directory..scope.."/"..name)
  assert(data)
  local image = Image(data, x, y)
  return image
end

function CoreImpl:keyPressed(key)
  if Settings.Magic.QuickExit.Enabled and key == Settings.Magic.QuickExit.Key then
    os.exit(true)
  end
  self.ActiveScene:keyPressed(key)
end

function CoreImpl:keyReleased(key)
  self.ActiveScene:keyReleased(key)
end

function CoreImpl:mousePressed(x, y, button)
  self.ActiveScene:mousePressed(x, y, button)
end

function CoreImpl:mouseReleased(x, y, button)
  self.ActiveScene:mouseReleased(x, y, button)
end

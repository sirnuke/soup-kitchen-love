-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

local tag = "Loading"

Loading = Scene:extend("Loading")

function Loading:init(core)
  Loading.super:init(core)
  self.Core.Settings.Scenes.Loading = {
    Images = {
      Background = "background.png"
    },
  }
end

function Loading:enter()
  self.Background = self:loadImage("Background")
end

function Loading:update(dt)
  self.Core:changeScene("MainMenu")
end

function Loading:draw()
  love.graphics.draw(self.Background)
end

function Loading:exit()
  self.Background = nil
end

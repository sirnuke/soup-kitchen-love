-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

local tag = "InGame"

InGame = Scene:extend("InGame")

function InGame:init(core)
  InGame.super:init(core)
  self.Core.Settings.Scenes.InGame = {
    Images = {
      Background = "background.png"
    },
  }
  self.Background = self:loadImage("Background")
end

function InGame:enter()
end

function InGame:update(dt)
end

function InGame:draw()
  love.graphics.draw(self.Background)
end

function InGame:exit()
end

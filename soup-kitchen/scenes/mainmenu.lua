-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

local tag = "MainMenu"

MainMenu = Scene:extend("MainMenu")

function MainMenu:init()
  MainMenu.super:init()
  Settings.Scenes.MainMenu = {
    Images = {
      Background = "background.png"
    },
  }
  self.Background = self:loadImage("Background")
end

function MainMenu:draw()
  love.graphics.draw(self.Background)
end

function MainMenu:keyPressed(key)
  Core:changeScene("InGame")
end

function MainMenu:mousePressed(x, y, button)
  Core:changeScene("InGame")
end

-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

require "world.map"

local tag = "InGame"

InGame = Scene:extend("InGame")

function InGame:init()
  InGame.super:init()
  Settings.Scenes.InGame = {
    Images = {
      Background = "background.png"
    },
  }
  self.Background = self:loadImage("Background")
  self.Map = nil
end

function InGame:enter()
  self.Map = Map()
end

function InGame:update(dt)
end

function InGame:draw()
  self.Background:draw()
end

function InGame:exit()
  self.Map = nil
end

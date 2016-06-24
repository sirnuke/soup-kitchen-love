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
    Layout = {
      Map = {
        X = 0,
        Y = 40,
      },
      SideBar = {
        X = 800,
        Y = 0,
      },
    },
  }
  self.Background = self:loadImage("Background")
  self.Map = nil
end

function InGame:enter()
  self.Map = Map()
  self.Map:generateDebugMap()
end

function InGame:update(dt)
  -- TODO: Update mouse interface
end

function InGame:draw()
  love.graphics.draw(self.Background)
  -- Draw Map
  love.graphics.push()
  love.graphics.translate(Settings.Scenes.InGame.Layout.Map.X, Settings.Scenes.InGame.Layout.Map.Y)
  self.Map:draw()
  love.graphics.pop()
  -- Draw sidebar
end

function InGame:exit()
  self.Map = nil
end

function InGame:mousePressed(x, y, button)
  if x < Settings.Scenes.InGame.Layout.SideBar.X then
    Log.info(tag, "Map press!")
  else
    Log.info(tag, "Sidebar press!")
  end
end

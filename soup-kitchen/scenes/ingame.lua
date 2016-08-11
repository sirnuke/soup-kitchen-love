-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

require "interface.mapdraw"

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
        W = 800,
        H = 640,
      },
      SideBar = {
        X = 800,
        Y = 0,
        W = 480,
        H = 720,
      },
    },
  }
  -- self.SideBarBounds = MouseInteraction(Settings.Scenes.InGame.Layout.SideBar.X,
                                        -- Settings.Scenes.InGame.Layout.SideBar.Y,
                                        -- Settings.Scenes.InGame.Layout.SideBar.W,
                                        -- Settings.Scenes.InGame.Layout.SideBar.H)
  self.Background = self:loadImage("Background")
  self.Map = nil
  self.MapDraw = nil
end

function InGame:enter()
  self.Map = Map()
  self.Map:generateDebugMap()
  self.MapDraw = MapDraw(self.Map,
                         Settings.Scenes.InGame.Layout.Map.X, Settings.Scenes.InGame.Layout.Map.Y,
                         Settings.Scenes.InGame.Layout.Map.W, Settings.Scenes.InGame.Layout.Map.H)
end

function InGame:update(dt)
  self.MapDraw:update()
end

function InGame:draw()
  love.graphics.draw(self.Background)
  -- Draw Map
  self.MapDraw:draw()
  -- Draw sidebar
end

function InGame:exit()
  self.Map = nil
  self.MapDraw = nil
end

function InGame:mousePressed(x, y, button)
  self.MapDraw.Mouse:press(x, y)
end

function InGame:mouseReleased(x, y, button)
  self.MapDraw.Mouse:release(x, y)
end

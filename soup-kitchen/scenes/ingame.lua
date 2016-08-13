-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

require "interface.mapdraw"

require "world.map"

local tag = "InGame"

InGame = Scene:extend("InGame")

function InGame:init()
  InGame.super:init()
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
  local x, y = love.mouse.getPosition()
  self.MapDraw.Mouse:hover(x, y)
  self.MapDraw:update(dt)
  -- self.Map:update(dt)
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

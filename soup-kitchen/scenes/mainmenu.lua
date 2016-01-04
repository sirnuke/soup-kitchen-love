-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

local tag = "MainMenu"

MainMenu = Scene:extend("MainMenu")

function MainMenu:keyPressed(key)
  self.Core:changeScene("InGame")
end

function MainMenu:mousePressed(x, y, button)
  self.Core:changeScene("InGame")
end

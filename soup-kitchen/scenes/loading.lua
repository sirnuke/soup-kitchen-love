-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

local tag = "Loading"

Loading = Scene:extend("Loading")

function Loading:enter()
  -- TODO: Load loading image
end

function Loading:update()
  self.Core:changeScene("MainMenu")
end

function Loading:draw()
  -- TODO: Draw loading image
end

function Loading:exit()
  -- TODO: Destroy loading image?
end

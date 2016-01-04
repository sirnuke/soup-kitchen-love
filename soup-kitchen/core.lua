-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "settings"

local tag = "Core"

Core = Class("Core")

function Core:init()
  Log.info(tag, "Initializing")
  self.Settings = Settings()
end

function Core:draw()
end

function Core:update()
end

function Core:keypressed(key)
  if self.Settings.Magic.QuickExit.Enabled and key == self.Settings.Magic.QuickExit.Key then
    os.exit(true)
  end
end

function Core:keyreleased(key)
end

function Core:mousepressed(x, y, button)
end

function Core:mousereleased(x, y, button)
end


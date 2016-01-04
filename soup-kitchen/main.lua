-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Inspect = require "library.inspect"
Class = require "library.30log"

require "library.strict"

Log = require "log"

local tag, core = "Main", nil

require "core"

function love.load()
  Log.info(tag, "Loading...")
  core = Core()
end

function love.update() core:update() end
function love.draw() core:draw() end

function love.keypressed(key) core:keypressed(key) end
function love.keyreleased(key) core:keyreleased(key) end
function love.mousepressed(x, y, button) core:mousepressed(x, y, button) end
function love.mousereleased(x, y, button) core:mousereleased(x, y, button) end

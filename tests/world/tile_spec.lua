-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Tile", function()
  require "soup-kitchen.settings"
  require "soup-kitchen.world.coordinate"
  require "soup-kitchen.world.map"
  require "soup-kitchen.world.position"
  require "soup-kitchen.world.tile"

  local x, y
  local coord
  local tile
  local map

  before_each(function ()
    map = Map()
  end)

  it("requires a Coordinate parameter", function()
    x, y = Settings.Map.Dimensions.Width - 2, Settings.Map.Dimensions.Height - 2
    coord = Position(x, y)
    assert.has_error(function() Coordinate() end)
    assert.has_error(function() Coordinate(coord) end)
  end)
end)

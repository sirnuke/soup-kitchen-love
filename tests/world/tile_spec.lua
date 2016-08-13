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

  it("requires a valid parameters", function()
    x, y = Settings.Map.Dimensions.Width - 2, Settings.Map.Dimensions.Height - 2
    coord = Coordinate(x, y)
    assert.has_error(function() Tile(nil, coord) end)
    assert.has_error(function() Tile("invalid", coord) end)
    assert.has_error(function() Tile("Floor") end)
    Tile("Floor", coord)
  end)
end)

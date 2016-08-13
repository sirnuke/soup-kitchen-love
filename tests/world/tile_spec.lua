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
    x, y = Settings.Map.Dimensions.Width - 2, Settings.Map.Dimensions.Height - 2
    coord = Coordinate(x, y)
  end)

  it("requires valid parameters", function()
    assert.has_error(function() Tile(nil, coord) end)
    assert.has_error(function() Tile("invalid", coord) end)
    assert.has_error(function() Tile(Settings.Map.Tile.Default) end)
    Tile(Settings.Map.Tile.Default, coord)
  end)

  it("updates the tile id", function()
    tile = Tile(Settings.Map.Tile.Default, coord)
    assert.has_error(function() tile:update("invalid") end)
    assert.equals(tile.Id, Settings.Map.Tile.Default)
    tile:update("Blocked")
    assert.not_equals(tile.Id, Settings.Map.Tile.Default)
  end)
end)

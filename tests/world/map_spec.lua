-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Map", function()
  require "soup-kitchen.settings"
  require "soup-kitchen.world.map"
  local map

  before_each(function ()
    require "soup-kitchen.library.strict"
    map = Map()
  end)

  it("performs basic initialization", function()
    assert.are.not_equal(Settings.Map, {})
    assert.are.not_equal(Settings.Map.Tile, {})
    assert.are.not_equal(Settings.Map.Tile.Dimensions, {})
    assert.are.not_equal(Settings.Map.Dimensions, {})
  end)
end)


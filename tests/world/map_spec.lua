-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Map", function()
  require "soup-kitchen.settings"
  require "soup-kitchen.world.map"
  local settings, map

  before_each(function ()
    require "soup-kitchen.library.strict"
    settings = Settings()
    map = Map(settings)
  end)

  it("performs basic initialization", function()
    assert.are.not_equal(settings.Map, {})
    assert.are.not_equal(settings.Map.Tile, {})
    assert.are.not_equal(settings.Map.Tile.Dimensions, {})
    assert.are.not_equal(settings.Map.Dimensions, {})
  end)
end)


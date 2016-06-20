-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Map", function()
  require "soup-kitchen.settings"
  require "soup-kitchen.world.map"
  local map, data
  local x, y

  before_each(function ()
    map = Map()
  end)

  it("performs basic initialization", function()
    assert.are.not_equal(Settings.Map, {})
    assert.are.not_equal(Settings.Map.Tile, {})
    assert.are.not_equal(Settings.Map.Tile.Dimensions, {})
    assert.are.not_equal(Settings.Map.Dimensions, {})
  end)

  it("creates right number of tiles and iterates", function()
    data = {}
    map:eachTile(function(tile)
      assert.is_true(Class.isInstance(tile, Tile))
      x = tile.Coordinate.X + 1
      y = tile.Coordinate.Y + 1
      if data[y] == nil then data[y] = {} end
      assert.is_nil(data[y][x])
      data[y][x] = true
    end)
    assert.are.equal(#data, Settings.Map.Dimensions.Height)
    for y = 1, Settings.Map.Dimensions.Height do
      assert.are.equal(#data[y], Settings.Map.Dimensions.Width)
      for x = 1, Settings.Map.Dimensions.Width do
        assert.is_true(data[y][x])
      end
    end
  end)
end)


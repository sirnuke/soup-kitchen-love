-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("position", function()
  require "soup-kitchen.settings"
  require "soup-kitchen.world.map"
  require "soup-kitchen.world.position"

  local settings, map 
  local maxWidth, maxHeight, tileWidth, tileHeight
  local a, b
  local x, y
  before_each(function()
    settings = Settings()
    map = Map(settings)
    tileWidth = settings.Map.Tile.Dimensions.Width
    tileHeight = settings.Map.Tile.Dimensions.Height
    maxWidth = settings.Map.Dimensions.Width * tileWidth
    maxHeight = settings.Map.Dimensions.Height * tileHeight
  end)

  it("performs basic initialization", function()
    x, y = maxWidth - 10, maxHeight - 10
    a = Position(settings, x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)
  end)

  it("accepts inbounds edge values", function()
    x, y = 0, 0
    a = Position(settings, x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)

    x, y = maxWidth - 1, maxHeight - 1
    a = Position(settings, x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)
  end)

  it("rejects out of bounds edge values", function()
    x, y = maxWidth, maxHeight
    assert.has_error(function() Coordinate(settings, -1,  0) end)
    assert.has_error(function() Coordinate(settings,  0, -1) end)
    assert.has_error(function() Coordinate(settings,  0,  y) end)
    assert.has_error(function() Coordinate(settings,  x,  0) end)
  end)

end)


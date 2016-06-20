-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("position", function()
  require "soup-kitchen.settings"
  require "soup-kitchen.world.map"
  require "soup-kitchen.world.position"

  local map
  local maxWidth, maxHeight, tileWidth, tileHeight
  local a, b
  local x, y
  before_each(function()
    map = Map()
    tileWidth = Settings.Map.Tile.Dimensions.Width
    tileHeight = Settings.Map.Tile.Dimensions.Height
    maxWidth = Settings.Map.Dimensions.Width * tileWidth
    maxHeight = Settings.Map.Dimensions.Height * tileHeight
  end)

  it("performs basic initialization", function()
    x, y = maxWidth - 10, maxHeight - 10
    a = Position(x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)
  end)

  it("accepts inbounds edge values", function()
    x, y = 0, 0
    a = Position(x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)

    x, y = maxWidth - 1, maxHeight - 1
    a = Position(x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)
  end)

  it("rejects out of bounds edge values", function()
    x, y = maxWidth, maxHeight
    assert.has_error(function() Coordinate(-1,  0) end)
    assert.has_error(function() Coordinate( 0, -1) end)
    assert.has_error(function() Coordinate( 0,  y) end)
    assert.has_error(function() Coordinate( x,  0) end)
  end)

  it("converts to a valid coordinate", function()
    x, y = 5 * tileWidth + 5, 5 * tileHeight + 5
    a = Position(x, y)
    b = a:toCoordinate()
    assert.are.equal(5, b.X)
    assert.are.equal(5, b.Y)
  end)

  it("converts to relative screen point", function()
    x, y = 5 * tileWidth + 5, 5 * tileHeight + 5
    a = Position(x, y)
    x, y = a:toScreen()
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)
  end)

  it("duplicates", function()
    x, y = maxWidth - 10, maxHeight - 10
    a = Position(x, y)
    b = a:duplicate()
    assert.are_not.equal(a, b)
    assert.are.same(a, b)
    b.X, b.Y = b.X + 1, b.Y + 1
    assert.are_not.equal(a.X, b.X)
    assert.are_not.equal(a.Y, b.Y)
  end)
end)


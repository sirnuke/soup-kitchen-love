-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("coordinate", function()
  require "soup-kitchen.settings"
  require "soup-kitchen.world.map"
  require "soup-kitchen.world.coordinate"

  local map
  local a, b
  local x, y
  before_each(function()
    map = Map()
  end)

  it("performs basic initialization", function()
    x, y = Settings.Map.Dimensions.Width - 2, Settings.Map.Dimensions.Height - 2
    a = Coordinate(x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)
  end)

  it("accepts inbounds edge values", function()
    x, y = 0, 0
    a = Coordinate(x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)

    x, y = Settings.Map.Dimensions.Width - 1, Settings.Map.Dimensions.Height - 1
    a = Coordinate(x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)
  end)

  it("rejects out of bounds edge values", function()
    x, y = Settings.Map.Dimensions.Width, Settings.Map.Dimensions.Height
    assert.has_error(function() Coordinate(-1,  0) end)
    assert.has_error(function() Coordinate( 0, -1) end)
    assert.has_error(function() Coordinate( 0,  y) end)
    assert.has_error(function() Coordinate( x,  0) end)
  end)

  it("rejects decimal values", function()
    x, y = Settings.Map.Dimensions.Width - 1.5, Settings.Map.Dimensions.Height - 1.5
    assert.has_error(function() Coordinate(x, 0) end)
    assert.has_error(function() Coordinate(0, y) end)
  end)

  it("converts to relative screen coordinates", function()
    x, y = Settings.Map.Dimensions.Width - 1, Settings.Map.Dimensions.Height - 1
    a = Coordinate(x, y)
    x, y = a:toScreen()
    assert.are.equal(x, (Settings.Map.Dimensions.Width - 1) * Settings.Map.Tile.Dimensions.Width)
    assert.are.equal(y, (Settings.Map.Dimensions.Height - 1) * Settings.Map.Tile.Dimensions.Height)
  end)

  it("converts to relative position", function()
    x, y = Settings.Map.Dimensions.Width - 1, Settings.Map.Dimensions.Height - 1
    a = Coordinate(x, y)
    b = a:toPosition()
    x = (Settings.Map.Dimensions.Width - 1) * Settings.Map.Tile.Dimensions.Width
      + Settings.Map.Tile.Dimensions.Width / 2
    y = (Settings.Map.Dimensions.Height - 1) * Settings.Map.Tile.Dimensions.Height
      + Settings.Map.Tile.Dimensions.Height / 2
    assert.are.equal(x, b.X)
    assert.are.equal(y, b.Y)
  end)

  it("duplicates", function()
    x, y = Settings.Map.Dimensions.Width - 2, Settings.Map.Dimensions.Height - 2
    a = Coordinate(x, y)
    b = a:duplicate()
    assert.are.same(a, b)
    b.X, b.Y = b.X + 1, b.Y + 1
    assert.are_not.equal(a.X, b.X)
    assert.are_not.equal(a.Y, b.Y)
  end)
end)

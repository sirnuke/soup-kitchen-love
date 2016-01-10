-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("coordinate", function()
  require "soup-kitchen.settings"
  require "soup-kitchen.world.map"
  require "soup-kitchen.world.coordinate"

  local settings, map 
  local a, b
  local x, y
  before_each(function()
    settings = Settings()
    map = Map(settings)
  end)

  it("performs basic initialization", function()
    x, y = settings.Map.Dimensions.Width - 2, settings.Map.Dimensions.Height - 2
    a = Coordinate(settings, x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)
  end)

  it("accepts inbounds edge values", function()
    x, y = 0, 0
    a = Coordinate(settings, x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)

    x, y = settings.Map.Dimensions.Width - 1, settings.Map.Dimensions.Height - 1
    a = Coordinate(settings, x, y)
    assert.are.equal(x, a.X)
    assert.are.equal(y, a.Y)
  end)

  it("rejects out of bounds edge values", function()
    x, y = settings.Map.Dimensions.Width, settings.Map.Dimensions.Height
    assert.has_error(function() Coordinate(settings, -1,  0) end)
    assert.has_error(function() Coordinate(settings,  0, -1) end)
    assert.has_error(function() Coordinate(settings,  0,  y) end)
    assert.has_error(function() Coordinate(settings,  x,  0) end)
  end)

  it("rejects decimal values", function()
    x, y = settings.Map.Dimensions.Width - 1.5, settings.Map.Dimensions.Height - 1.5
    assert.has_error(function() Coordinate(settings, x, 0) end)
    assert.has_error(function() Coordinate(settings, 0, y) end)
  end)

  it("duplicates", function()
    x, y = settings.Map.Dimensions.Width - 2, settings.Map.Dimensions.Height - 2
    a = Coordinate(settings, x, y)
    b = a:duplicate()
    assert.are_not.equal(a, b)
    assert.are.same(a, b)
    b.X, b.Y = b.X + 1, b.Y + 1
    assert.are_not.equal(a.X, b.X)
    assert.are_not.equal(a.Y, b.Y)
  end)
end)

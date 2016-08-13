-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("mouse-interaction", function()
  require "soup-kitchen.settings"
  require "soup-kitchen.interface.mouseinteraction"

  local callback
  local mouseinteraction
  local x, y

  before_each(function()
    callback = {}
    callback.mousePress = function(x, y) end
    callback.mouseHover = function(x, y) end
    callback.mouseClear = function() end
    callback.mouseTrigger = function(x, y) end
    mouseinteraction = MouseInteraction(callback, 1, 10, 9, 90)
  end)

  it("performs basic initialization", function()
    mouseinteraction = MouseInteraction(callback, 0, 0, 1, 1)
  end)

  it("checks for a valid callback object", function()
    assert.has_error(function() MouseInteraction(nil, 0, 0, 1, 1) end)
    assert.has_error(function() MouseInteraction({}, 0, 0, 1, 1) end)
    assert.has_error(function() MouseInteraction({mouseHover = function() end, mouseClear = function() end, mouseTrigger = function() end}, 0, 0, 1, 1) end)
    assert.has_error(function() MouseInteraction({mousePress = function() end, mouseClear = function() end, mouseTrigger = function() end}, 0, 0, 1, 1) end)
    assert.has_error(function() MouseInteraction({mousePress = function() end, mouseHover = function() end, mouseTrigger = function() end}, 0, 0, 1, 1) end)
    assert.has_error(function() MouseInteraction({mousePress = function() end, mouseHover = function() end, mouseClear = function() end}, 0, 0, 1, 1) end)
  end)

  it("rejects invalid dimensions", function()
    assert.has_error(function() MouseInteraction(callback, -1,  0,  1,  1) end)
    assert.has_error(function() MouseInteraction(callback,  0, -1,  1,  1) end)
    assert.has_error(function() MouseInteraction(callback,  0,  0,  0,  1) end)
    assert.has_error(function() MouseInteraction(callback,  0,  0,  1,  0) end)
  end)

  it("determines inbounds", function()
    assert.is_false(mouseinteraction:inBounds(0, 0))
    assert.is_false(mouseinteraction:inBounds(1, 9))
    assert.is_false(mouseinteraction:inBounds(0, 10))
    assert.is_false(mouseinteraction:inBounds(10, 100))
    assert.is_false(mouseinteraction:inBounds(9, 100))
    assert.is_false(mouseinteraction:inBounds(-1, -1))
    assert.is_true(mouseinteraction:inBounds(9, 99))
    assert.is_true(mouseinteraction:inBounds(1, 10))
    assert.is_true(mouseinteraction:inBounds(5, 50))
  end)

  it("translates coordinates", function()
    x, y = mouseinteraction:translate(5, 6)
    assert.equals(x, 4)
    assert.equals(y, -4)
    x, y = mouseinteraction:translate(1, 10)
    assert.equals(x, 0)
    assert.equals(y, 0)
    x, y = mouseinteraction:translate(10, 100)
    assert.equals(x, 9)
    assert.equals(y, 90)
    x, y = mouseinteraction:translate(11, 110)
    assert.equals(x, 10)
    assert.equals(y, 100)
  end)

  it("checks bounds when updating", function()
    assert.has_error(function() mouseinteraction:setBounds( -1,  0,  1,  1) end)
    assert.has_error(function() mouseinteraction:setBounds(  0, -1,  1,  1) end)
    assert.has_error(function() mouseinteraction:setBounds(  0,  0,  0,  1) end)
    assert.has_error(function() mouseinteraction:setBounds(  0,  0,  1,  0) end)
    mouseinteraction:setBounds(0, 0, 1, 1)
  end)

  it("determines inbounds after updating", function()
    assert.is_true(mouseinteraction:inBounds(9, 99))
    assert.is_true(mouseinteraction:inBounds(1, 10))
    assert.is_false(mouseinteraction:inBounds(0, 0))
    mouseinteraction:setBounds(0, 0, 1, 1)
    assert.is_true(mouseinteraction:inBounds(0, 0))
    assert.is_false(mouseinteraction:inBounds(1, 1))
  end)

  -- TODO: Callback spying
end)

-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Settings", function()
  require "soup-kitchen.settings"

  it("performs basic initialization", function()
    assert.is_table(Settings.Magic)
    assert.is_table(Settings.Graphics)
    assert.is_table(Settings.Scenes)
    assert.is_table(Settings.Map)
  end)
end)

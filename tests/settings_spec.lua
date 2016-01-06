-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Settings", function()
  require "soup-kitchen.settings"
  local settings

  before_each(function ()
    require "soup-kitchen.library.strict"
    settings = Settings()
  end)

  it("performs basic initialization", function()
    assert.is_table(settings.Magic)
    assert.is_table(settings.Graphics)
    assert.is_table(settings.Scenes)
    assert.is_table(settings.Map)
  end)
end)

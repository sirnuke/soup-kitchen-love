-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

require "tests.setup"

before_each(function ()
  require "soup-kitchen.library.strict"
end)

describe("Settings", function()
  require "soup-kitchen.settings"

  it("performs basic initialization", function()
    local settings = Settings()
  end)
end)

-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Map = Class("Map")

function Map:init(core)
  assert(Class.isInstance(core, Core))
  self.Core = core
  self.Core.Settings.Map = {
    Tile = {
      Dimensions = {
        Width = 32,
        Height = 32,
      },
    },
    Dimensions = {
      Width = 30,
      Height = 30,
    },
  }
end

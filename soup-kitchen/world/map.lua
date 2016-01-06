-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Map = Class("Map")

function Map:init(settings)
  assert(Class.isInstance(settings, Settings))
  self.Settings = settings
  self.Settings.Map = {
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

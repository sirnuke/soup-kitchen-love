-- Soup Kitchen
-- Bryan DeGrendel (c) 2016

Image = Class("Image")

function Image:init(image, x, y)
  assert(image:typeOf("Image"))
  self.image = image
  self.x = x
  self.y = y
end

function Image:draw()
  love.graphics.draw(self.image, self.x, self.y)
end


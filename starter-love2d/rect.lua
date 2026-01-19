Rect = {}
Rect.__index = Rect

-- Simple object definition for making a rectangle
function Rect.new(x, y, width, height)
  local obj = {
    x = x,
    y = y,
    width = width,
    height = height,
  }
  setmetatable(obj, Rect)
  return obj
end

--A simple function for drawing a rectangle using Love2D's graphics system
function Rect:draw(mode, borderRadius)
  mode = mode or "fill"
  borderRadius = borderRadius or 0
  love.graphics.rectangle(mode, self.x, self.y, self.width, self.height, borderRadius, borderRadius)
end

--A simple function to check if a rectangle contains a point
function Rect:contains(x, y)
  return x > self.x and y > self.y and x < self.x + self.width and y < self.y + self.height
end

--A simple function to check if a rectangle intersects another rectangle (for collision detection)
function Rect:intersects(r)
  return self:contains(r.x, r.y) or
    self:contains(r.x + r.width, r.y) or
    self:contains(r.x, r.y + r.height) or
    self:contains(r.x + r.width, r.y + r.height)
end
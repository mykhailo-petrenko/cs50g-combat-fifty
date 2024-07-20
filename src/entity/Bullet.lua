Bullet = Class{__includes=Entity}

function Bullet:init(properties)
  Entity.init(self, properties)
  self.type = 'bullet'

  self.direection = properties.direction

  self.speed = 128
  self.width = 8
  self.height = 8

  self.isSensor = true

  self._r = math.sqrt(self.width*self.width/2)
end


function Bullet:update(dt)
  Entity.update(self, dt)
end


function Bullet:draw() 
  love.graphics.setColor(1, 0, 0, 0.5)
  love.graphics.circle(
    'fill', 
    self.x + (self.width / 2), 
    self.y + (self.height / 2), 
    self._r
  )

  love.graphics.setColor(1, 1, 1, 1)
end

function Bullet:filter(other)
  return 'cross'
end

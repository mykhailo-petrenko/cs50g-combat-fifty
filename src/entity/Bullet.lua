Bullet = Class{__includes=Entity}

function Bullet:init(properties)
  Entity.init(self, properties)
  self.type = 'bullet'

  self.direction = properties.direction
  self.shooter = properties.shooter
  print_r(properties.direction);
  self.speed = 128
  self.width = 11
  self.height = 5
  self.texture = 'bullet'

  self._dw = self.width / 2;
  self._dh = self.height / 2;

  self.isSensor = true
  self.isHittable = false
end


function Bullet:update(dt)
  Entity.update(self, dt)
end


function Bullet:draw()
  love.graphics.setColor(1, 1, 1, 1)
  
  local dx = self._dw
  local dy = self._dh
  local r = 0

  if self.direction[2] ~= 0 then
    r = math.pi / 2;
  end

  local x = self.x + dx;
  local y = self.y + dy;

  love.graphics.draw( globalTextures[self.texture], x, y, r)
end

function Bullet:filter(other)
  return 'cross'
end

function Bullet:onBump(opposite)
  if not opposite.isHittable then
    return
  end

  print('Bullet onBump', self.type, self.id, opposite.type, opposite.id)

  -- print_r(collisions);
  self:changeState('destroy')
end
Player = Class{__includes=Entity}


function Player:init(properties)
  Entity.init(self, properties)

  self.color = properties.color or {0, 1, 0}

  self.speed = 48
  self.isSensor = true

  self.weapon = Weapon({
    x = self.x,
    y = self.y
  })
end

function Player:update(dt)
  if self.weapon then
    self.weapon.x = self.x
    self.weapon.y = self.y
    self.weapon:update(dt)
  end
end


function Player:draw() 
  love.graphics.setColor(self.color[1], self.color[2], self.color[3])
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)

  love.graphics.setColor(1, 1, 1, 1)
end

function Player:filter(other)
  -- print(self.id);
  -- print(other);

  return 'slide'
end


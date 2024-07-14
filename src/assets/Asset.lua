Asset = Class{}

Weapon = Class{__includes=Asset}

function Weapon:init(properties)
  self.x = properties.x
  self.y = properties.y
end

function Weapon:shoot(direction)
  local bullet = Bullet({
    x = self.x,
    y = self.y,
    direction = direction,
  })
print(self.x)
print(self.y)
  return bullet
end

function Weapon:update(dt) 
end

function Weapon:draw() 
end

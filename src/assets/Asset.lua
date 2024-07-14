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

  return bullet
end

function Weapon:update(dt) 
end

function Weapon:draw() 
end

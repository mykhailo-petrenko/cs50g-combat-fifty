
Entity = Class{}

function Entity:init(properties) 
  self.x = properties.x
  self.y = properties.y
  self.w = properties.w
  self.h = properties.h
  self.speed = properties.speed
  self.color = properties.color

end

function Entity:update(dt) 

end


function Entity:draw() 
  if self.color=='red' then
    love.graphics.setColor(1, 0, 0)
  elseif self.color=='blue' then
    love.graphics.setColor(0, 0, 1)
  end

  love.graphics.rectangle('line', self.x, self.y, self.w, self.h)

  love.graphics.setColor(1, 1, 1, 1)
end

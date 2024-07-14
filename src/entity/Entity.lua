
Entity = Class{}

function Entity:init(properties) 
  self.id = properties.id or 'undefined'
  self.x = properties.x
  self.y = properties.y
  self.width = properties.width or 0
  self.height = properties.height or 0
  self.speed = properties.speed or 0

  self.isSensor = properties.isSensor or false
end

function Entity:update(dt) 

end


function Entity:draw() 
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)

  love.graphics.setColor(1, 1, 1, 1)
end

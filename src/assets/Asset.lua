Asset = Class{}

function Asset:init(properties)
  self.type = 'asset'
  self.x = properties.x
  self.y = properties.y
end

function Asset:update(dt) 
end

function Asset:draw() 
end

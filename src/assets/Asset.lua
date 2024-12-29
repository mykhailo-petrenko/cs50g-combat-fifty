Asset = Class{}

function Asset:init(properties)
  self.type = 'asset'
  self.x = properties.x
  self.y = properties.y

  self.owner = nil
end

function Asset:update(dt) 
end

function Asset:draw() 
end

function Asset:ownedBy(owner)
  self.owner = owner
end

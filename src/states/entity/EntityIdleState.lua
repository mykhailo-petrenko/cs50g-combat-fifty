EntityIdleState = Class{__includes = BaseState}

function EntityIdleState:init(entity)
    self.entity = entity

    self.entity:changeAnimation('idle-' .. self.entity.direction)

    -- used for AI waiting
    self.waitDuration = 0
    self.waitTimer = 0
end


PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:update(dt)
  if love.keyboard.isDown('left') 
    or love.keyboard.isDown('right')
    or love.keyboard.isDown('up') 
    or love.keyboard.isDown('down') 
  then
   self.entity:changeState('walk')
  end
end

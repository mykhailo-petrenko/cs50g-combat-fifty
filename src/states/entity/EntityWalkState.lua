EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity)
  self.entity = entity

  self.entity:changeAnimation('walk-' .. self.entity.direction)

  self.prevDirection = self.entity.direction

  -- used for AI waiting
  self.waitDuration = 0
  self.waitTimer = 0
end

function EntityWalkState:update(dt) 
  if self.prevDirection ~= self.entity.direction then
    self.entity:changeState('walk')
  end
end

PlayerWalkeState = Class{__includes = EntityWalkState}
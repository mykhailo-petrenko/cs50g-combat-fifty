EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity)
  self.entity = entity

  self.entity:changeAnimation('walk-' .. self.entity.direction)

  -- used for AI waiting
  self.waitDuration = 0
  self.waitTimer = 0
end

PlayerWalkeState = Class{__includes = EntityWalkState}
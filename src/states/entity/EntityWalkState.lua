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

  local diff = love.timer.getTime() - self.entity.movedLastTime

  if diff > 0.1 then
    self.entity:changeState('idle')
  end
end

PlayerWalkeState = Class{__includes = EntityWalkState}
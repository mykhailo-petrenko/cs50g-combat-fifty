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
  local diff = love.timer.getTime() - self.entity.movedLastTime
  if diff < 0.1 then
    self.entity:changeState('walk')
  end
end

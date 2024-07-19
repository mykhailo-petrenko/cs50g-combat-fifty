EntityIdleState = Class{__includes = BaseState}

function EntityIdleState:init(entity, scene)
    self.entity = entity
    self.scene = scene

    self.entity:changeAnimation('idle-' .. self.entity.direction)

    -- used for AI waiting
    self.waitDuration = 0
    self.waitTimer = 0
end

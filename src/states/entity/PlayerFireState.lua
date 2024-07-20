PlayerFireState = Class{__includes=BaseState}

function PlayerFireState:init(entity, scene)
  self.entity = entity
  self.scene = scene

  self.entity:changeAnimation('idle-' .. self.entity.direction)
end



-- function PlayerFireState:init() end
function PlayerFireState:enter()
end
-- function PlayerFireState:exit() end
function PlayerFireState:update(dt)

  local player = self.entity
  local fire = FireCommand(player)
  self.scene:enqueueCommand(fire)

  self.entity:changeState('reload')
end
-- function PlayerFireState:draw() end
-- function PlayerFireState:processAI() end
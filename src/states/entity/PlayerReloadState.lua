PlayerReloadState = Class{__includes=BaseState}

function PlayerReloadState:init(entity, scene)
  self.entity = entity
  self.scene = scene

  self.entity:changeAnimation('idle-' .. self.entity.direction)
end

-- function PlayerReloadState:init() end
function PlayerReloadState:enter()
  Timer.after(0.3, function()
    self.entity:changeState('idle')
  end);
end
-- function PlayerReloadState:exit() end
-- function PlayerReloadState:update(dt) end
-- function PlayerReloadState:draw() end
-- function PlayerReloadState:processAI() end
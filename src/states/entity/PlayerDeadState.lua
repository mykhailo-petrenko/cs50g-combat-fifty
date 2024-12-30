PlayerDeadState = Class{__includes=BaseState}

function PlayerDeadState:init(entity, scene)
  self.entity = entity
  self.scene = scene

  self.entity:changeAnimation('death')
end

-- function PlayerReloadState:init() end
function PlayerDeadState:enter(params)
  local player = self.entity
  
  player.alive = false

  if params and params.killedBy then
    self.scene.stats:incrementFrag(params.killedBy)
  end

  Timer.after(0.5, function()
    self.entity:changeState('respawn')
  end);
end
-- function PlayerReloadState:exit() end
-- function PlayerReloadState:update(dt) end
-- function PlayerReloadState:draw() end
-- function PlayerReloadState:processAI() end
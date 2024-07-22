PlayerRespawnState = Class{__includes=BaseState}

function PlayerRespawnState:init(entity, scene)
  self.entity = entity
  self.scene = scene

  self.entity:changeAnimation('idle-' .. self.entity.direction)
end

-- function PlayerRespawnState:init() end
function PlayerRespawnState:enter()
  Timer.after(0.3, function()
    self.entity:changeState('idle')
  end);
end

function PlayerRespawnState:exit()
  local player = self.entity

  local x = math.random(TILE_SIZE, WINDOW_WIDTH)
  local y = math.random(TILE_SIZE, WINDOW_HEIGHT)

  player.alive = true

  -- Comman: Move/Fly Player
  local world = self.scene.world
  player.x, player.y = world:move(player, x, y)
end
-- function PlayerRespawnState:exit() end
-- function PlayerRespawnState:update(dt) end
-- function PlayerRespawnState:draw() end
-- function PlayerRespawnState:processAI() end
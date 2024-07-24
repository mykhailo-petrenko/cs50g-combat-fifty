PlayerRespawnState = Class{__includes=BaseState}

function PlayerRespawnState:init(entity, scene)
  self.entity = entity
  self.scene = scene

  self.respawn_delay = 1

  self.entity:changeAnimation('fade-out')
  self.newX = 0
  self.newY = 0
end

function PlayerRespawnState:randomTeleport()
  local player = self.entity
  local world = self.scene.world

  repeat
    local x = math.random(TILE_SIZE, WINDOW_WIDTH)
    local y = math.random(TILE_SIZE, WINDOW_HEIGHT)
    local collisions, num

    self.newX, self.newY, collisions, num = world:check(player, x, y)
    print(collisions)
  until num > 0

  local x = math.random(TILE_SIZE, WINDOW_WIDTH)
  local y = math.random(TILE_SIZE, WINDOW_HEIGHT)

  player.x, player.y = world:move(player, self.newX, self.newY)
end

-- function PlayerRespawnState:init() end
function PlayerRespawnState:enter()
  Timer.after(self.respawn_delay - 0.2, function()
    self:randomTeleport()
    self.entity:changeAnimation('fade-in')
  end);

  Timer.after(self.respawn_delay, function()
    self.entity.alive = true
    self.entity:changeState('idle')
  end);
end

-- function PlayerRespawnState:exit() end
-- function PlayerRespawnState:exit() end
-- function PlayerRespawnState:update(dt) end
-- function PlayerRespawnState:draw() end
-- function PlayerRespawnState:processAI() end
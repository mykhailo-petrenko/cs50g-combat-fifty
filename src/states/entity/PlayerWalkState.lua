PlayerWalkState = Class{__includes=EntityWalkState}

function PlayerWalkState:update(dt) 
  local player = self.entity
  local speed = player.speed
  local dx, dy = 0, 0

  -- right
  if love.keyboard.isDown(player.keys.RIGHT) then
    dx = speed * dt
    player.direction = DIRECTION.RIGHT
  -- left
  elseif love.keyboard.isDown(player.keys.LEFT) then
    dx = -speed * dt
    player.direction = DIRECTION.LEFT
  -- down
  elseif love.keyboard.isDown(player.keys.DOWN) then
    dy = speed * dt
    player.direction = DIRECTION.DOWN
  -- up
  elseif love.keyboard.isDown(player.keys.UP) then
    dy = -speed * dt
    player.direction = DIRECTION.UP
  end

  if dx ~= 0 or dy ~= 0 then
    -- local move = WalkCommand(self.player, dx, dy)
    -- table.insert(self.commands, move);
    player.x = player.x + dx
    player.y = player.y + dy
    
    self.entity:changeState('walk')
  else
    self.entity:changeState('idle')
  end
end

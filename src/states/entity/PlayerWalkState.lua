PlayerWalkState = Class{__includes=EntityWalkState}

function PlayerWalkState:update(dt) 
  local player = self.entity
  local speed = player.speed
  local dx, dy = 0, 0

  if love.keyboard.isDown(player.keys.FIRE) then
    self.entity:changeState('fire')
    return
  -- right
  elseif love.keyboard.isDown(player.keys.RIGHT) then
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
    local move = WalkCommand(player, dx, dy)
    self.scene:enqueueCommand(move)

    self.entity:changeState('walk')
  else
    self.entity:changeState('idle')
  end
end

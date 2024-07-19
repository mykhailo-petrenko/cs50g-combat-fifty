
PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:update(dt)
  local player = self.entity
  
  if 
    love.keyboard.isDown(player.keys.RIGHT)
    or
    love.keyboard.isDown(player.keys.LEFT)
    or
    love.keyboard.isDown(player.keys.DOWN)
    or
    love.keyboard.isDown(player.keys.UP) 
  then
    self.entity:changeState('walk')
  end
end

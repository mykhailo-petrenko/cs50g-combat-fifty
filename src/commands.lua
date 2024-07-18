Command = Class{}

function Command:init(entity)
  self.entity = entity
end

function Command:execute(receiver)
  print_r(receiver)
end

WalkCommand = Class{__includes=Command}

function WalkCommand:init(player, dx, dy)
  self.entity = player
  self.dx = dx
  self.dy = dy
end

function WalkCommand:execute(scene)
  local player = self.entity
  local newX, newy, cols, cols_len = scene.world:move(
    player,
    player.x + self.dx,
    player.y + self.dy,
    player.filter
  )

  if self.dx > 0 then
    player.direction = 'right'
  elseif self.dx < 0 then
    player.direction = 'left'
  elseif self.dy > 0 then
    player.direction = 'down'
  elseif self.dy < 0 then
    player.direction = 'up'
  end

  player.x = newX
  player.y = newy

  for i=1, cols_len do
    local col = cols[i]
    -- consolePrint(("col.other = %s, col.type = %s, col.normal = %d,%d"):format(col.other, col.type, col.normal.x, col.normal.y))
  end

  player:moved()
end

FireCommand = Class{__includes=Command}

function FireCommand:execute(scene)
  local player = self.entity
  print('fire', player.id)
  
  if player.weapon then
    local direction = player:directionVector()
    local bullet = player.weapon:shoot(direction)

    scene:add(bullet)
  end
end


ChangeWeaponCommand = Class{__includes=Command}

function ChangeWeaponCommand:execute()
  local player = self.entity
  print('change weapon', player.id)
end

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

  player.x = newX
  player.y = newy

  for i=1, cols_len do
    local col = cols[i]
    -- consolePrint(("col.other = %s, col.type = %s, col.normal = %d,%d"):format(col.other, col.type, col.normal.x, col.normal.y))
  end
end

FireCommand = Class{__includes=Command}

function FireCommand:execute(scene)
  local player = self.entity
  print('fire', player.id)
  
  if player.weapon then
    player.weapon:shoot(scene)
  end
end


ChangeWeaponCommand = Class{__includes=Command}

function ChangeWeaponCommand:execute()
  local player = self.entity
  print('change weapon', player.id)
end


FlyCommand = Class{__includes=Command}
function FlyCommand:init(entity, dx, dy)
  self.entity = entity
  self.dx = dx
  self.dy = dy
end

function FlyCommand:execute(scene)
  local entity = self.entity
  local newX, newy, cols, cols_len = scene.world:move(
    entity,
    entity.x + self.dx,
    entity.y + self.dy,
    entity.filter
  )

  entity.x = newX
  entity.y = newy

  for i=1, cols_len do
    local col = cols[i]
    local target = col.other;

    -- print(entity.type, entity.id, col.type, col.other.type, col.other.id)
    if target.isSensor then
      target:onBump(entity)

      if entity.isSensor then
        entity:onBump(target)
      end
    end
  end
end

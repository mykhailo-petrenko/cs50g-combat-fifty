Command = Class{}

function Command:init(scene)
  self.scene = scene
end

function Command:execute(receiver)
  print(receiver.id)
end


FireCommand = Class{__includes=Command}

function FireCommand:execute(player)
  print(player.id)
  
  if player.weapon then
    local direction = {1, 0}
    local bullet = player.weapon:shoot(direction)

    self.scene:add(bullet)
  end
end


ChangeWeaponCommand = Class{__includes=Command}

function ChangeWeaponCommand:execute(player)
  print(player.id)
end

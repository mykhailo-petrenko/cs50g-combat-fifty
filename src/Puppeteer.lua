Puppeteer = Class{}

function Puppeteer:init(player, properties)
  self.player = player

  self.keys = {
    LEFT = properties.controls[1] or 'left',
    UP = properties.controls[2] or 'up',
    RIGHT = properties.controls[3] or 'right',
    DOWN = properties.controls[4] or 'down',
    FIRE = properties.controls[5] or '.',
    NEXT_WEEAPON = properties.controls[6] or ',',
  }

  self.commands = {};
end

function Puppeteer:update(dt)
  local speed = self.player.speed

  self.commands = {};

  local dx, dy = 0, 0
  -- right
  if love.keyboard.isDown(self.keys.RIGHT) then
    dx = speed * dt
  -- left
  elseif love.keyboard.isDown(self.keys.LEFT) then
    dx = -speed * dt
  -- down
  elseif love.keyboard.isDown(self.keys.DOWN) then
    dy = speed * dt
  -- up
  elseif love.keyboard.isDown(self.keys.UP) then
    dy = -speed * dt
  end

  if dx ~= 0 or dy ~= 0 then
    local move = WalkCommand(self.player, dx, dy)
    table.insert(self.commands, move);
  end

  -- Fire
  if love.keyboard.wasPressed(self.keys.FIRE) then
    fire = FireCommand(self.player)
    table.insert(self.commands, fire);
  -- Change Weapon
  elseif love.keyboard.wasPressed(self.keys.NEXT_WEEAPON) then
    changeWeapon = ChangeWeaponCommand(self.player)
    table.insert(self.commands, changeWeapon);
  end
end


function Puppeteer:executeCommands(scene)
  for i = 1, #self.commands, 1 do
    self.commands[i]:execute(scene)
  end
end

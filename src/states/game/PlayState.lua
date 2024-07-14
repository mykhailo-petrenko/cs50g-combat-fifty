PlayState = Class{__includes=BaseState}

function PlayState:init()
  -- gSounds['intro-music']:play()
end

function PlayState:enter()
  print('play enter')

  -- Load a map exported to Lua from Tiled
	self.map = STI("tiled-map/combat-fifty-intro.lua", {"bump"})

  self.world = Bump.newWorld(TILE_SIZE)
  self.scene = Scene(self.world)
  self.map:bump_init(self.world)

  self.player = Player({
    id='uno',
    x = 30 * TILE_SIZE,
    y = 15 * TILE_SIZE,
    width = TILE_SIZE * 0.9,
    height = TILE_SIZE * 1.7,
    color = {1, 0, 0},
  })
  local player = self.player
  self.world:add(player, player.x, player.y, player.width, player.height)

  self.player_2 = Player({
    id='dos',
    x = 10 * TILE_SIZE,
    y = 10 * TILE_SIZE,
    width = TILE_SIZE * 0.9,
    height = TILE_SIZE * 1.7,
    color = {0, 0, 1},
  })
  local player = self.player_2
  self.world:add(player, player.x, player.y, player.width, player.height)
end

function PlayState:exit()
  print('play exit')
end

function PlayState:update(dt)
  self.map:update(dt)
  self.scene:update(dt)

  self:_updatePlayer(dt, self.player, {'a', 'w', 'd', 's', 'q', 'tab'})
  self:_updatePlayer(dt, self.player_2, {'left', 'up', 'right', 'down', '.', ','})
end

function PlayState:draw()
  love.graphics.clear(0.1, 0.8, 0.1, 1)

  self.scene:draw()

  -- love.graphics.setFont(gFonts['medium'])
  love.graphics.setColor(1, 0, 0, 1)
  -- love.graphics.printf('PLAAAAY', 0, WINDOW_HEIGHT / 2 - 72, WINDOW_WIDTH, 'center')


  	-- Draw the map and all objects within
	love.graphics.setColor(1, 1, 1)
	self.map:draw()

	-- Draw Collision Map (useful for debugging)
	-- love.graphics.setColor(1, 0, 0)
	-- self.map:box2d_draw()

  love.graphics.setColor(0, 1, 0)
  self.map:bump_draw()
	-- Please note that map:draw, map:box2d_draw, and map:bump_draw take
	-- translate and scale arguments (tx, ty, sx, sy) for when you want to
	-- grow, shrink, or reposition your map on screen.

  self.player:draw()
  self.player_2:draw()

  love.graphics.setColor(1, 1, 1, 1)
end


-- keys {lefet, up, right, down, fire}
function PlayState:_updatePlayer(dt, player, keys)
  local world = self.world
  local speed = player.speed

  local dx, dy = 0, 0
  -- right
  if love.keyboard.isDown(keys[3]) then
    dx = speed * dt
  -- left
  elseif love.keyboard.isDown(keys[1]) then
    dx = -speed * dt
  end

  -- down
  if love.keyboard.isDown(keys[4]) then
    dy = speed * dt
  -- up
  elseif love.keyboard.isDown(keys[2]) then
    dy = -speed * dt
  end

  if dx ~= 0 or dy ~= 0 then
    local cols
    player.x, player.y, cols, cols_len = world:move(player, player.x + dx, player.y + dy, player.filter)
    for i=1, cols_len do
      local col = cols[i]
      -- consolePrint(("col.other = %s, col.type = %s, col.normal = %d,%d"):format(col.other, col.type, col.normal.x, col.normal.y))
    end
  end

  player:update(dt)

  -- Fire
  if love.keyboard.wasPressed(keys[5]) then
    fire = FireCommand(self.scene)
    fire:execute(player)
  end
  
  -- Change Weapon
  if love.keyboard.wasPressed(keys[6]) then
    changeWeapon = ChangeWeaponCommand(self.scene)
    changeWeapon:execute(player)
  end

end

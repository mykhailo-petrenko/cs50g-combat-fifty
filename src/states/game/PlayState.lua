PlayState = Class{__includes=BaseState}

function PlayState:init()
  -- gSounds['intro-music']:play()
end

function PlayState:enter()
  print('play enter')

  -- Load a map exported to Lua from Tiled
	self.map = STI("tiled-map/combat-fifty-intro.lua", {"bump"})

  self.world = Bump.newWorld(TILE_SIZE)
  self.map:bump_init(self.world)

  self.player = Player({
    x = 30 * TILE_SIZE,
    y = 15 * TILE_SIZE,
    w = TILE_SIZE * 0.9,
    h = TILE_SIZE * 1.7,
    speed = TILE_SIZE * 3,
    color = 'red',
  })
  local player = self.player
  self.world:add(player, player.x, player.y, player.w, player.h)

  self.player_2 = Player({
    x = 10 * TILE_SIZE,
    y = 10 * TILE_SIZE,
    w = TILE_SIZE * 0.9,
    h = TILE_SIZE * 1.7,
    speed = TILE_SIZE * 3,
    color = 'blue',
  })
  local player = self.player_2
  self.world:add(player, player.x, player.y, player.w, player.h)
end

function PlayState:exit()
  print('play exit')
end

function PlayState:update(dt)
  self.map:update(dt)
  self:_updatePlayer(dt)
  self:_updatePlayer_2(dt)
end

function PlayState:render()
  love.graphics.clear(0.1, 0.8, 0.1, 1)

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


function PlayState:_updatePlayer(dt)
  local player = self.player
  local world = self.world
  local speed = player.speed

  local dx, dy = 0, 0
  if love.keyboard.isDown('right') then
    dx = speed * dt
  elseif love.keyboard.isDown('left') then
    dx = -speed * dt
  end
  if love.keyboard.isDown('down') then
    dy = speed * dt
  elseif love.keyboard.isDown('up') then
    dy = -speed * dt
  end

  if dx ~= 0 or dy ~= 0 then
    local cols
    player.x, player.y, cols, cols_len = world:move(player, player.x + dx, player.y + dy)
    for i=1, cols_len do
      local col = cols[i]
      -- consolePrint(("col.other = %s, col.type = %s, col.normal = %d,%d"):format(col.other, col.type, col.normal.x, col.normal.y))
    end
  end
end

function PlayState:_updatePlayer_2(dt)
  local player = self.player_2
  local world = self.world
  local speed = player.speed

  local dx, dy = 0, 0
  if love.keyboard.isDown('d') then
    dx = speed * dt
  elseif love.keyboard.isDown('a') then
    dx = -speed * dt
  end
  if love.keyboard.isDown('s') then
    dy = speed * dt
  elseif love.keyboard.isDown('w') then
    dy = -speed * dt
  end

  if dx ~= 0 or dy ~= 0 then
    local cols
    player.x, player.y, cols, cols_len = world:move(player, player.x + dx, player.y + dy)
    for i=1, cols_len do
      local col = cols[i]
      -- consolePrint(("col.other = %s, col.type = %s, col.normal = %d,%d"):format(col.other, col.type, col.normal.x, col.normal.y))
    end
  end
end
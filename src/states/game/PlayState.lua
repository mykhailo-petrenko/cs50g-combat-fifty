PlayState = Class{__includes=BaseState}

function PlayState:init()
  -- gSounds['intro-music']:play()
end

function PlayState:enter()
  print('play enter')

  -- Load a map exported to Lua from Tiled
	self.map = sti("tiled-map/combat-fifty-intro.lua", { "box2d" })
  -- Prepare physics world with horizontal and vertical gravity
	world = love.physics.newWorld(0, 0)
  -- Prepare collision objects
	self.map:box2d_init(world)
end

function PlayState:exit()
  print('play exit')
end

function PlayState:update(dt)
  self.map:update(dt)
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
	love.graphics.setColor(1, 0, 0)
	self.map:box2d_draw()

	-- Please note that map:draw, map:box2d_draw, and map:bump_draw take
	-- translate and scale arguments (tx, ty, sx, sy) for when you want to
	-- grow, shrink, or reposition your map on screen.

  love.graphics.setColor(1, 1, 1, 1)
end
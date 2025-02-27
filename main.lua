--[[
    CS50G Combat Fifty

    Author: Mykhailo Petrenko
    mikael.petrenko@gmail.com
]]

-- if pcall(require, "lldebugger") then require("lldebugger").start() end
-- if pcall(require, "mobdebug") then require("mobdebug").start() end

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
  require("lldebugger").start()
end

require 'src/dependencies'

function love.load() 
  love.window.setTitle('Combat Fifty')
  love.graphics.setDefaultFilter('nearest', 'nearest')
  math.randomseed(os.time())

  local gameWidth, gameHeight = WINDOW_WIDTH, WINDOW_HEIGHT --fixed game resolution
  local windowWidth, windowHeight =  WINDOW_WIDTH*2, WINDOW_HEIGHT*2
  -- local windowWidth, windowHeight = love.window.getDesktopDimensions()
  push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {
    fullscreen = false,
    vsync = true,
    resizable = true,
    highdpi = true,
  })

  love.keyboard.keysPressed = {}

  -- Set world meter size (in pixels)
	love.physics.setMeter(TILE_SIZE)

  gameStateStack = StateStack()
  gameStateStack:push(StartState())
  -- gameStateStack:push(PlayState())
end

function love.resize(w, h)
  push:resize(w, h)
end

-- update pressed key table for current update loop
function love.keypressed(key)
  if key == 'escape' then
      love.event.quit()
  end

  love.keyboard.keysPressed[key] = true
end

-- Key pressed getter
function love.keyboard.wasPressed(key)
  return love.keyboard.keysPressed[key]
end

function love.update(dt)
  Timer.update(dt)

  -- update all entities in State Stack
  gameStateStack:update(dt)

  -- reeset info about pressed keys (in prev update loop)
  love.keyboard.keysPressed = {}
end

function love.draw()
  push:start()

  -- draw all entities in the State Stack
  gameStateStack:draw()

  push:finish()
end

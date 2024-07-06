require 'dependencies'

function love.load() 
  love.window.setTitle('Combat Fifty')
  love.graphics.setDefaultFilter('nearest', 'nearest')
  math.randomseed(os.time())

  local gameWidth, gameHeight = WINDOW_WIDTH, WINDOW_HEIGHT --fixed game resolution
  local windowWidth, windowHeight =  WINDOW_WIDTH, WINDOW_HEIGHT
  -- local windowWidth, windowHeight = love.window.getDesktopDimensions()
  push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {
    fullscreen = false,
    vsync = true,
    resizable = true
  })

  love.keyboard.keysPressed = {}

  -- gStateStack = StateStack()
  -- gStateStack:push(StartState())
end

function love.resize(w, h)
  push:resize(w, h)
end


function love.keypressed(key)
  if key == 'escape' then
      love.event.quit()
  end

  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  return love.keyboard.keysPressed[key]
end

function love.update(dt)
  Timer.update(dt)
  -- gStateStack:update(dt)

  love.keyboard.keysPressed = {}
end

function love.draw()
  push:start()

  --draw here
  -- gStateStack:render()

  push:finish()
end

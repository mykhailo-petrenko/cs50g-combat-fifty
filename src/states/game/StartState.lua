StartState = Class{__includes=BaseState}

function StartState:init()
  -- gSounds['intro-music']:play()
end

function StartState:update(dt)
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gameStateStack:push(FadeInState({
      r = 1, g = 1, b = 1
    }, 1,
    function()
        -- gSounds['intro-music']:stop()
        gameStateStack:pop()
        
        gameStateStack:push(PlayState())
    end))
  end
end

function StartState:draw()
  love.graphics.clear(0.1, 0.1, 0.1, 1)

  -- love.graphics.setFont(gFonts['medium'])
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf('Combat Fifty', 0, WINDOW_HEIGHT / 2 - 72, WINDOW_WIDTH, 'center')

  love.graphics.setColor(45/255, 45/255, 184/255, 124/255)
  love.graphics.rectangle('fill', WINDOW_WIDTH / 2 - 100, WINDOW_HEIGHT / 2 + 53, 200, 42)

  love.graphics.setColor(1, 1, 1, 1)
  -- love.graphics.setFont(gFonts['small'])
  love.graphics.printf('Press Enter', 0, WINDOW_HEIGHT / 2 + 68, WINDOW_WIDTH, 'center')

  love.graphics.setColor(1, 1, 1, 1)
end
PlayState = Class{__includes=BaseState}

function PlayState:init()
  -- gSounds['intro-music']:play()
end

function PlayState:update(dt)

end

function PlayState:render()
  love.graphics.clear(0.1, 0.8, 0.1, 1)

  -- love.graphics.setFont(gFonts['medium'])
  love.graphics.setColor(1, 0, 0, 1)
  love.graphics.printf('PLAAAAY', 0, WINDOW_HEIGHT / 2 - 72, WINDOW_WIDTH, 'center')

  love.graphics.setColor(1, 1, 1, 1)
end
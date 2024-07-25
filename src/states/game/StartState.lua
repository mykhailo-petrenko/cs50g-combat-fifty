StartState = Class{__includes=BaseState}

function StartState:init()
  -- gSounds['intro-music']:play()

  self.configurator = LevelConfigurator()
end

function StartState:update(dt)
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return')then

    local transition = FadeInState(
      { r = 0, g = 0, b = 0 },
      1,
      function()
        -- gSounds['intro-music']:stop()
        gameStateStack:pop()
        
        gameStateStack:push(PlayState(self.configurator:getStartState()))
      end
    )

    gameStateStack:push(transition)
  else 
    self.configurator:update(dt)
  end
end

function StartState:draw()
  love.graphics.clear(0.0, 0.0, 0.2, 1)

  love.graphics.setFont(globalFonts['title'])
  love.graphics.setColor(0.3, 0.2, 0.2, 1)
  love.graphics.printf('Combat Fifty', 2, 32, WINDOW_WIDTH, 'center')

  love.graphics.setColor(1, 1, 0.5, 1)
  love.graphics.printf('Combat Fifty', 0, 30, WINDOW_WIDTH, 'center')


  self.configurator:draw()


  love.graphics.setColor(45/255, 45/255, 184/255, 124/255)
  love.graphics.rectangle('fill', WINDOW_WIDTH / 2 - 100, WINDOW_HEIGHT - 72, 200, 42)

  love.graphics.setColor(1, 1, 0.8, 1)
  love.graphics.setFont(globalFonts['subtitle'])
  love.graphics.printf('Press Enter', 0, WINDOW_HEIGHT - 68, WINDOW_WIDTH, 'center')

  love.graphics.setColor(1, 1, 1, 1)
end

function StartState:draw_players()
end

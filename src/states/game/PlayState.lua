PlayState = Class{__includes=BaseState}

function PlayState:init()
  -- gSounds['intro-music']:play()
end

function PlayState:enter()
  print('play enter')

  self.scene = Scene("tiled-map/combat-fifty-intro.lua")

  local player1 = playerFactory({
    id='uno',
    x = 10 * TILE_SIZE,
    y = 13 * TILE_SIZE,
    skinNumber = 1,
  })

  self.scene:addPlayer(
    player1,
    {
      controls = {'a', 'w', 'd', 's', 'q', 'tab'}
    }
  )

  local player2 = playerFactory({
    id='dos',
    x = 30 * TILE_SIZE,
    y = 14 * TILE_SIZE,
    skinNumber = 4,
  })
  
  self.scene:addPlayer(
    player2,
    {
      controls = {'left', 'up', 'right', 'down', '.', ','}
    }
  )
end

function PlayState:exit()
  print('play exit')
end

function PlayState:update(dt)
  self.scene:update(dt)
end

function PlayState:draw()
  love.graphics.clear(1, 1, 1, 1)

  self.scene:draw()

  love.graphics.setColor(1, 1, 1, 1)
end


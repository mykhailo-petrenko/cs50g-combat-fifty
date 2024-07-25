PlayState = Class{__includes=BaseState}

function PlayState:init(playersConfig)
  -- gSounds['intro-music']:play()
  print_r(playersConfig)
  self.playersConfig = playersConfig
end

function PlayState:enter()
  print('play enter')

  self.scene = Scene("tiled-map/combat-fifty-intro.lua")

  local player1 = playerFactory({
    id='uno',
    x = 10 * TILE_SIZE,
    y = 13 * TILE_SIZE,
    skinNumber = self.playersConfig[1].skinNumber or 1,
    controls = {'a', 'w', 'd', 's', 'q', 'tab'}
  }, self.scene)

  self.scene:addPlayer(player1)

  local player2 = playerFactory({
    id='dos',
    x = 30 * TILE_SIZE,
    y = 14 * TILE_SIZE,
    skinNumber = self.playersConfig[2].skinNumber or 4,
    controls = {'left', 'up', 'right', 'down', '.', ','}
  }, self.scene)
  
  self.scene:addPlayer(player2)
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


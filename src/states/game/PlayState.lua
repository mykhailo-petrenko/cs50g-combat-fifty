PlayState = Class{__includes=BaseState}

function PlayState:init(playersConfig)
  -- gSounds['intro-music']:play()
  print_r(playersConfig)
  self.playersConfig = playersConfig
end

function PlayState:enter()
  print('play enter')

  self.scene = Scene("tiled-map/combat-fifty-intro.lua")

  for i = 1, #self.playersConfig, 1 do
    local newPlayer = playerFactory({
      id=self.playersConfig[i].id,
      x = (2*i + 1) * TILE_SIZE,
      y = 3 * TILE_SIZE,
      skinNumber = self.playersConfig[i].skinNumber or 1,
      controls = self.playersConfig[i].controls
    }, self.scene)

    self.scene:addPlayer(newPlayer)
  end
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


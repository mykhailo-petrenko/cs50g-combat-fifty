
LevelConfigurator = Class{}

function LevelConfigurator:init()
  self.maxSkinNumber = 4

  self.playersConfig = {
    {
      id='Brimo',
      isHuman = true,
      skinNumber = 1,
      controls = {'a', 'w', 'd', 's', 'q', 'tab'}
    },
    {
      id='Macho',
      isHuman = true,
      skinNumber = 2,
      controls = {'left', 'up', 'right', 'down', '.', ','}
    },
  }

  self.playerAnimation = {

  }

  self:updateAnimations()
end

function LevelConfigurator:updateAnimations()
  for i=1, #self.playersConfig, 1 do
    self.playerAnimation[i] = Animation.animationsFactory(
      ENTITY_DEFS.player.animations,
      (self.playersConfig[i].skinNumber - 1) * globalQuadProperties.characters.shift
    )['walk-down']
  end
end

function LevelConfigurator:listenPlayerControls(i) 
  local controls = self.playersConfig[i].controls
  local left = controls[1]
  local right = controls[3]

  local skinNumber = self.playersConfig[i].skinNumber

  if love.keyboard.wasPressed(left) then
    skinNumber = skinNumber - 1

    if skinNumber < 1 then
      skinNumber = self.maxSkinNumber
    end
  elseif love.keyboard.wasPressed(right) then
    skinNumber = 1 + skinNumber
    if skinNumber > self.maxSkinNumber then
      skinNumber = 1
    end
  end

  if self.playersConfig[i].skinNumber ~= skinNumber then
    self.playersConfig[i].skinNumber = skinNumber
    self:updateAnimations()
  end
end

function LevelConfigurator:update(dt)

  for i=1, #self.playerAnimation, 1 do
    self:listenPlayerControls(i) 
    self.playerAnimation[i]:update(dt)
  end

end

function LevelConfigurator:draw()
  local y = 111
  local x = 0
  for i=1, #self.playerAnimation, 1 do
    local animation = self.playerAnimation[i]
    local quad = globalQuads[animation.texture][animation:getCurrentFrame()]
    x = 100 * i
    love.graphics.draw( globalTextures[animation.texture], quad, x, y )
  end
end

function LevelConfigurator:getStartState()
  return self.playersConfig
end
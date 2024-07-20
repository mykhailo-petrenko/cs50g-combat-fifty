Player = Class{__includes=Entity}


function Player:init(properties)
  Entity.init(self, properties)

  self.type = 'player'
  self.color = properties.color or {0, 1, 0}

  self.speed = 48
  self.isSensor = true

  self.weapon = Weapon({
    x = self.x,
    y = self.y
  })

  self.keys = {
    LEFT = properties.controls[1] or 'left',
    UP = properties.controls[2] or 'up',
    RIGHT = properties.controls[3] or 'right',
    DOWN = properties.controls[4] or 'down',
    FIRE = properties.controls[5] or '.',
    NEXT_WEEAPON = properties.controls[6] or ',',
  }
end

function Player:update(dt)
  self.stateMachine:update(dt)
  self:updateAnimation(dt)

  if self.weapon then
    self.weapon.x = self.x
    self.weapon.y = self.y
    self.weapon:update(dt)
  end
end


function Player:draw() 
  -- love.graphics.setColor(self.color[1], self.color[2], self.color[3])
  -- love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
  self.stateMachine:draw()

  self:drawAnimation()

  -- love.graphics.setColor(1, 1, 1, 1)
end

function Player:filter(other)
  -- print(self.id);
  -- print(other);

  return 'slide'
end

function playerFactory(properties, scene)
  local id = properties.id
  local x = properties.x
  local y = properties.y
  local skinNumber = properties.skinNumber or 1

  local player = Player({
    id=id,
    x = x,
    y = y,
    width = math.floor(TILE_SIZE),
    height = math.floor(TILE_SIZE * 1.7),
    color = {1, 0, 0},
    controls = properties.controls
  })

  player.stateMachine = StateMachine({
    ['walk'] = function() return PlayerWalkState(player, scene) end,
    ['idle'] = function() return PlayerIdleState(player, scene) end,
    ['fire'] = function() return PlayerFireState(player, scene) end,
    ['reload'] = function() return PlayerReloadState(player, scene) end,
  })

  local shift = (skinNumber - 1) * globalQuadProperties.characters.shift

  local animations = Animation.animationsFactory(
    ENTITY_DEFS.player.animations,
    shift
  )

  player:setAnimations(animations)
  player:changeState('idle')

  return player;
end
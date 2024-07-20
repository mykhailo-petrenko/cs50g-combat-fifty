Weapon = Class{__includes=Asset}

function Weapon:init(properties)
  Asset.init(self, properties)
  self.direction = {0, 0}
  self.type = 'weapon'
end

function Weapon:shoot(scene)
  local BULLET_W = 10
  local BULLET_H = 10
  local x = self.x - (BULLET_W / 2)
  local y = self.y - (BULLET_H / 2)
  x = x + (self.direction[1] * BULLET_W)
  y = y + (self.direction[2] * BULLET_H)

  local bullet = Bullet({
    x = x,
    y = y,
    direction = self.direction,
  })

  -- local animations = Animation.animationsFactory(
  --   ENTITY_DEFS.player.animations,
  --   shift
  -- )
  -- player:setAnimations(animations)

  bullet.stateMachine = StateMachine({
    ['fly'] = function() return BulletFlyState(bullet, scene) end,
    ['destroy'] = function() return BulletDestroyState(bullet, scene) end,
  })

  bullet:changeState('fly')

  scene:add(bullet)
end

function Weapon:update(dt) 
end

function Weapon:draw() 
end

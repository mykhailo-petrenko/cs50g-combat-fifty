Weapon = Class{__includes=Asset}

function Weapon:init(properties)
  Asset.init(self, properties)

  self.type = 'weapon'
end

function Weapon:shoot(direction, scene)
  local bullet = Bullet({
    x = self.x,
    y = self.y,
    direction = direction,
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

BulletFlyState = Class{__includes = BaseState}

function BulletFlyState:init(entity, scene)
    self.entity = entity
    self.scene = scene

    self.life_time = 4
    -- self.entity:changeAnimation('idle-' .. self.entity.direction)
end

function BulletFlyState:enter()
  Timer.after(self.life_time, function ()
    self.entity:changeState('destroy')
  end)
end

function BulletFlyState:update(dt)
  local bullet = self.entity;
  local dx = (bullet.direection[1] * bullet.speed * dt)
  local dy = (bullet.direection[2] * bullet.speed * dt)
  local move = FlyCommand(bullet, dx, dy)

  self.scene:enqueueCommand(move)
end

BulletDestroyState = Class{__includes=BaseState}

function BulletDestroyState:init(entity, scene)
  self.entity = entity
  self.scene = scene
  self.animation_duration = 0.3

  -- self.entity:changeAnimation('idle-' .. self.entity.direction)
end

function BulletDestroyState:enter()
  print('BulletDestroyState:enter')
  local bullet = self.entity
  local scene = self.scene

  bullet:fadeOut(self.animation_duration)

  Timer.after(self.animation_duration, function()
    scene:remove(bullet)
  end);
end
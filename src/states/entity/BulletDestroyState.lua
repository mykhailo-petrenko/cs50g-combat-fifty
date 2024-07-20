BulletDestroyState = Class{__includes=BaseState}

function BulletDestroyState:init(entity, scene)
  self.entity = entity
  self.scene = scene

  -- self.entity:changeAnimation('idle-' .. self.entity.direction)
end

function BulletDestroyState:enter()
  local bullet = self.entity

  self.scene:remove(bullet)
end
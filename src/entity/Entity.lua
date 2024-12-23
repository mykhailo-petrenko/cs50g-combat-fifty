
Entity = Class{}

local entity_id = 1

function Entity:init(properties) 
  self.type = 'entity'
  self.id = properties.id or ('entity' .. entity_id)
  entity_id = entity_id + 1
  self.x = properties.x
  self.y = properties.y
  self.width = properties.width or 0
  self.height = properties.height or 0
  self.speed = properties.speed or 0
  self.isSensor = properties.isSensor or false

  self.direction = DIRECTION.DOWN

  self.animations = nil
  self.currentAnimation = nil

  self.stateMachine = nil

  self.hp = 100

  self.movedLastTime = 0
  self.targetX = nil
  self.targetY = nil
end

function Entity:update(dt)
  self.stateMachine:update(dt)
  self:updateAnimation(dt)
end

function Entity:draw()
  self.stateMachine:draw()
  
  -- love.graphics.setColor(0, 1, 0)
  -- love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
  -- love.graphics.setColor(1, 1, 1, 1)
end

function Entity:filter(other)
  return 'slide'
end

function Entity:onBump(opposite)
  print('onBump', self.type, self.id, opposite.type, opposite.id)
  -- print_r(collisions);
end

function Entity:changeState(state)
  self.stateMachine:change(state, nil)
end

function Entity:changeAnimation(name)
  -- so not change animation to itself
  -- just to prevent constant reseting of animation while walking
  if self.currentAnimation and self.currentAnimation.name == name then
    return
  end

  self.currentAnimation = self.animations[name]
  self.currentAnimation:refresh()
end

function Entity:setAnimations(animations)
  self.animations = animations
end

function Entity:updateAnimation(dt)
  if not self.currentAnimation then
    return
  end

  self.currentAnimation:update(dt)
end

function Entity:drawAnimation()
  if not self.currentAnimation then
    return
  end

  local animation = self.currentAnimation
  love.graphics.setColor(1, 1, 1, 1)

  local quad = globalQuads[animation.texture][animation:getCurrentFrame()]
  local x, y, qw, qh = quad:getViewport()
  local sx = self.width / qw
  local sy = self.height / qh

  local drawX = math.floor(self.x)
  local drawY = math.floor(self.y)

  if animation.mirrorX then
    drawX = drawX + self.width
    sx = -1 * sx
  end

  love.graphics.draw(
    globalTextures[animation.texture],
    quad,
    drawX,
    drawY,
    0,
    sx,
    sy
  )
end

local VECTOR_FROM_DIRECTION = {
  [DIRECTION.LEFT] = {-1, 0},
  [DIRECTION.UP] = {0, -1},
  [DIRECTION.RIGHT] = {1, 0},
  [DIRECTION.DOWN] = {0, 1},
}

function Entity:directionVector()
  return VECTOR_FROM_DIRECTION[self.direction] or {0, 0}
end

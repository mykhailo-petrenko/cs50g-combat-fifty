
Entity = Class{}

function Entity:init(properties) 
  self.id = properties.id or 'undefined'
  self.x = properties.x
  self.y = properties.y
  self.width = properties.width or 0
  self.height = properties.height or 0
  self.speed = properties.speed or 0
  self.isSensor = properties.isSensor or false

  self.direction = 'down'

  self.animations = nil
  self.currentAnimation = nil

  self.stateMachine = nil
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

function Entity:changeState(state)
  self.stateMachine:change(state, nil)
end

function Entity:changeAnimation(name)
  print('changeAnimation', name)
  self.currentAnimation = self.animations[name]
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

  love.graphics.draw(
    globalTextures[animation.texture],
    quad,
    math.floor(self.x),
    math.floor(self.y),
    0,
    sx,
    sy
  )
    
end
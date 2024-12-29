Scene = Class{}

function Scene:init(map_config)
  self.is_debug = false

  self.world = Bump.newWorld(TILE_SIZE)

    -- Load a map exported to Lua from Tiled
	self.map = STI(map_config, {"bump"})
  self.map:bump_init(self.world)
  
  self.entities = {}
  self.players = {}
  self.commands = {}
end

function Scene:update(dt)
  self.map:update(dt)

  for i = #self.players, 1, -1 do
    local player = self.players[i]
    player:update(dt)
  end

  for i = #self.entities, 1, -1 do
    local entity = self.entities[i]
    entity:update(dt)
  end

  for i = 1, #self.commands, 1 do
    self.commands[i]:execute(self)
  end

  self.commands = {}
end

function Scene:draw()
  -- Draw the map and all objects
  -- love.graphics.setFont(globalFonts['medium'])
  self.map:draw()

  -- Draw entities
  for i = #self.entities, 1, -1 do
    local entity = self.entities[i]

    entity:draw()
  end

  -- Draw players
  for i = #self.players, 1, -1 do
    local player = self.players[i]
    player:draw()
  end

  if self.is_debug then
    -- deebug: draw bboxes (bump map)
    love.graphics.setColor(0, 1, 0)
    self.map:bump_draw()
  end
end

function Scene:enqueueCommand(command) 
  table.insert(self.commands, command);
end

function Scene:add(entity)
  self.world:add(entity, entity.x, entity.y, entity.width, entity.height)
  table.insert(self.entities, entity)
end

function Scene:remove(entity)
  if not self.world:hasItem(entity) then
    return
  end

  self.world:remove(entity)

  local index = -1

  for i = 1, #self.entities, 1 do
    if self.entities[i] == entity then
      index = i
      break
    end
  end

  if index ~= -1 then
    table.remove(self.entities, index)
  end
end

function Scene:addPlayer(player)
  self.world:add(player, player.x, player.y, player.width, player.height)
  table.insert(self.players, player)
end


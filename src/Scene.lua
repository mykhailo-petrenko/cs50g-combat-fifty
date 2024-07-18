Scene = Class{}

function Scene:init(map_config)
  self.world = Bump.newWorld(TILE_SIZE)

    -- Load a map exported to Lua from Tiled
	self.map = STI(map_config, {"bump"})
  self.map:bump_init(self.world)
  
  self.entities = {}
end

function Scene:update(dt)
  self.map:update(dt)
  
  -- print()
  for i = #self.entities, 1, -1 do
    local entity = self.entities[i]

    entity:update(dt)
    entity.x, entity.y, cols, cols_len = self.world:move(entity, entity.x, entity.y, entity.filter)

    for j = 1, cols_len, 1 do
      -- print('collided with ' .. tostring(cols[j].other))
    end
  end
end

function Scene:draw()
  for i = #self.entities, 1, -1 do
    local entity = self.entities[i]

    entity:draw()
  end
end

function Scene:add(entity)
  self.world:add(entity, entity.x, entity.y, entity.width, entity.height)
  table.insert(self.entities, entity)
end

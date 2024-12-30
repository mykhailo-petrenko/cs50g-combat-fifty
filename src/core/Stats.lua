Stats = Class{}

function Stats:init(map)
  self.map = map

  self.players = {}

  self.names = {}
  self.kills = {}
  self.frags = {0, 0, 0, 0}

  self:bindPortals()
  self:updatePlayers({})
end

function Stats:bindPortals()
  -- Get player spawn object
	local player
	for k, object in pairs(self.map.objects) do
		if object.properties and object.properties.score_name then
      self.names[object.properties.score_name] = object
		end

    if object.properties and object.properties.score_kills then
      self.kills[object.properties.score_kills] = object
		end
	end
end

function Stats:incrementFrag(entityId)
  for i = 1, #self.players, 1 do
    if self.players[i].id == entityId then
      self.frags[i] = self.frags[i] + 1
      break
    end
  end

  self:update()
end

function Stats:update()
  for i = 1, #self.players, 1 do
    self.kills[i].text = self.frags[i]
  end
end

function Stats:updatePlayers(players) 
  self.players = players

  self:update()

  for i = 1, #self.names, 1 do
    if i <= #self.players then
      self.names[i].text = self.players[i].id
      self.names[i].visible = true
    else
      self.names[i].visible = false
    end    
  end

  for i = 1, #self.kills, 1 do
    if i <= #self.players then
      self.kills[i].visible = true
    else
      self.kills[i].visible = false
    end    
  end

end

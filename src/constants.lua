TILE_SIZE = 16

WINDOW_WIDTH = TILE_SIZE * 32
WINDOW_HEIGHT = TILE_SIZE * 24

-- VIRTUAL_WIDTH = 384
-- VIRTUAL_HEIGHT = 216

DIRECTION = {
  LEFT = 'left',
  UP = 'up',
  RIGHT = 'right',
  DOWN = 'down',
}

globalTextures = {
  ['characters'] = love.graphics.newImage('graphics/characters.png'),
}

globalQuads = {
  ['characters'] = generateQuadsFrames(globalTextures.characters, 16, 16),
}

globalQuadProperties = {
  ['characters'] = {
    ['shift'] = 4,
    ['length'] = 8,
  }
}

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
  ['characters'] = love.graphics.newImage('graphics/rpg_32x32.png'),
  -- ['characters'] = love.graphics.newImage('graphics/characters.png'),
}

globalQuads = {
  ['characters'] = generateQuadsFrames(globalTextures.characters, 32, 32),
}

globalQuadProperties = {
  ['characters'] = {
    ['shift'] = 4,
    ['length'] = 8,
  }
}

globalFonts = {
  ['small'] = love.graphics.newFont('fonts/ugly-byte-font/UglyByte.otf', 8),
  ['medium'] = love.graphics.newFont('fonts/ugly-byte-font/UglyByte.otf', 16),
  ['large'] = love.graphics.newFont('fonts/ugly-byte-font/UglyByte.otf', 32),
  ['title'] = love.graphics.newFont('fonts/love-glitch-font/LoveGlitch.ttf', 64),
  ['subtitle'] = love.graphics.newFont('fonts/love-glitch-font/LoveGlitch.ttf', 32)
}

-- globalSounds = {
--   ['music'] = love.audio.newSource('sounds/music.mp3', 'static'),
-- }

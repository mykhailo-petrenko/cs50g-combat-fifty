
function generateQuadsFrames(texture, tilewidth, tileheight)
  local sheetWidth = texture:getWidth() / tilewidth
  local sheetHeight = texture:getHeight() / tileheight

  local sheetCounter = 1
  local sprites = {}

  for y = 0, sheetHeight - 1 do
      for x = 0, sheetWidth - 1 do
        sprites[sheetCounter] = love.graphics.newQuad(
          x * tilewidth,
          y * tileheight,
          tilewidth,
          tileheight,
          texture:getDimensions()
        )

        sheetCounter = sheetCounter + 1
      end
  end

  return sprites
end
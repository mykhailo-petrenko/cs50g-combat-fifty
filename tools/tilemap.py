import os, sys
from PIL import Image, ImageDraw

infile = str(sys.argv[1])
cell_size = int(sys.argv[2])

with Image.open(infile).convert('RGBA') as img:
  (w, h) = img.size
  scale = 2
  (new_width, new_height) = (w*scale, h*scale)
  img = img.resize((new_width, new_height), Image.Resampling.LANCZOS)

  canvas = ImageDraw.Draw(img)   
  
  cell_size = cell_size * scale
  (w, h) = img.size

  cols = int(w / cell_size)
  rows = int(h / cell_size)
  
  for y in range(1, rows):
    canvas.line([(0, y*cell_size), (w, y*cell_size)], fill ="red", width = 0) 

  for x in range(1, cols):
    canvas.line([(x*cell_size, 0), (x*cell_size, h)], fill ="red", width = 0)   

  padding = 5

  for y in range(0, rows):
    for x in range(0, cols):
      coords = (x * cell_size + padding, y*cell_size + padding)
      text = str(1 + x + y*cell_size)
      canvas.text(
        coords, 
        text, 
        fill ="black", 
        align ="left", 
        font_size=14,
        stroke_width=1, 
        stroke_fill='white'
      )

  img.show() 
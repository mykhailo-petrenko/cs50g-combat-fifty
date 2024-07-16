import os, sys
from PIL import Image, ImageDraw

infile = str(sys.argv[1])
cell_size = int(sys.argv[2])

with Image.open(infile) as img:
  canvas = ImageDraw.Draw(img)   

  (w, h) = img.size
  cols = int(w / cell_size)
  rows = int(h / cell_size)
  
  for y in range(1, rows):
    canvas.line([(0, y*cell_size), (w, y*cell_size)], fill ="red", width = 0) 

  for x in range(1, cols):
    canvas.line([(x*cell_size, 0), (x*cell_size, h)], fill ="red", width = 0) 

  for y in range(0, rows):
    for x in range(0, cols):
      canvas.text(
        (x*cell_size, y*cell_size),
        str(1 + x + y*cell_size),
        font_size=10
      )

  img.show() 
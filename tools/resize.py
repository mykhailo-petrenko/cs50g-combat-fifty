import sys
from PIL import Image, ImageDraw


def main():
  '''Resize {IN} by {SCALE} factor and save into {OUT}'''

  if len(sys.argv) < 4:
    print("Please provide 3 arguments: [INPUT_FILE] [SCALE_FACTOR] [OUTPUT_FILE]")

  input_file = str(sys.argv[1])
  scale_factor = int(sys.argv[2])
  target_file = str(sys.argv[3])

  with Image.open(input_file).convert('RGBA') as img:
    (w, h) = img.size
    (new_width, new_height) = (w*scale_factor, h*scale_factor)
    img = img.resize((new_width, new_height), Image.Resampling.NEAREST)

    img.save(target_file)

    print(f"({w}x{h}) -> ({new_width}x{new_height}): {target_file}")

if __name__ == "__main__":
  main()
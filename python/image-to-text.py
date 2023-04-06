import pytesseract
from PIL import Image

# Path to the image file
image_path = '/Users/harithanneeru/Desktop/Screenshots/1.jpeg'
# Open the image using PIL
image = Image.open(image_path)

# Convert the image to grayscale
image = image.convert('L')

# Use Tesseract to convert the image to text
text = pytesseract.image_to_string(image)

# Print the extracted text
print(text)

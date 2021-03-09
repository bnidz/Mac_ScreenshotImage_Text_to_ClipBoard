#!/usr/bin/env python
from PIL import ImageGrab, Image

import pytesseract
import subprocess

def write_to_clipboard(output):
    process = subprocess.Popen(
        'pbcopy', env={'LANG': 'en_US.UTF-8'}, stdin=subprocess.PIPE)
    process.communicate(output.encode('utf-8'))

# Grab clipboard and save to disk
clip = ImageGrab.grabclipboard()
clip.save('clip.png')

text = pytesseract.image_to_string(Image.open('clip.png'))
#image = Image.open('clip.png', mode='r')
print("Copied to clipboard!! \n" + text)
write_to_clipboard(text)

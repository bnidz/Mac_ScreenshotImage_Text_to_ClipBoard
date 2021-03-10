#!/usr/bin/env python
from PIL import ImageGrab, Image

import pytesseract
import subprocess
import os

# this script is easily used with MacOS screenshot functionality
# command + shift + 4
# then box select screen area with text in it 
# image is saved on clipboard: run the script
# you have now the contained text on your clipboard, just paste it somewhere

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
os.remove('clip.png')

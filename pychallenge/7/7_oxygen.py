#!/usr/bin/env python2.7

#http://www.pythonchallenge.com/pc/def/oxygen.html

from __future__ import print_function
from PIL import Image

Y = 45
step = 7
width = 608

img = Image.open('oxygen.png') 
for X in xrange(0, width, step):
    pixel = img.getpixel((X,Y))
    print(chr(pixel[0]), end='')

# print(''.join(map(chr, [105, 110, 116, 101, 103, 114, 105, 116, 121])))

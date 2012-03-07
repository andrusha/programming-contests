#!/usr/bin/env python2.7

# http://www.pythonchallenge.com/pc/return/good.html

import Image, ImageDraw

def parse(str):
    return eval('['+str.replace('\n', '').replace(' ', '')+']')

first = parse(open('9_first.in').read())
second = parse(open('9_second.in').read())

im = Image.new("RGB", (640, 480))
draw = ImageDraw.Draw(im)

draw.line(first)
draw.line(second)

im.save('9_result.png')

# bull

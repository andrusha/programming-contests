#!/usr/bin/env python3

#http://www.pythonchallenge.com/pc/def/ocr.html

import string

data = open('2_ocr.input').read()
rare = filter(lambda x: x in string.ascii_letters, data)
print(''.join(rare))

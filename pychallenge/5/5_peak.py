#!/usr/bin/env python3

# http://www.pythonchallenge.com/pc/def/peak.html

import pickle

data = pickle.load(open('banner.p', 'rb'))

print('\n'.join(map(lambda x: ''.join(map(lambda y: y[0]*y[1], x)), data)))
#channel

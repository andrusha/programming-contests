#!/usr/bin/env python

#11
#83128
#1
#99
#112
#199
#999
#1999
#4572
#18992
#1000000
#1239999321

import psyco
psyco.full()
T = int(raw_input())
#import time
from array import array
#tm = time.clock()

def polyAdd(pos, pal, start = 0):
    carry = 1
    for add in xrange(start, pos+1):
        x = pal[pos - add] + carry 
        carry = 0
        if x > 57:
            x = 48
            carry = 1
        pal[pos + (1 - start) + add] = x
        pal[pos - add] = x
        
        if not carry:
            copy(pal, pos, add, start)
            break
    if carry:
        pal[pos + (1 - start) + add] = 49
        pal.insert(0, 49)
        
def copy(pal, pos, start, chet):
    for add in xrange(start, pos+1):
        pal[pos + (1 - chet) + add] = pal[pos - add] 
        
def compare(pal, size):
    start = size % 2
    pos = size / 2 + (start-1)
    for add in xrange(start, pos+1):
        right = pal[pos + (1 - start) + add]
        left = pal[pos - add]
        if right < left:
            return add + 1
        elif right > left:
            return -1
    return 0

for _ in xrange(T):
    pal = array('B', raw_input())
    size = len(pal)
    comp = compare(pal, size)
    if comp >= 1:
        copy(pal, size/2, size%2+comp-2, size%2)
    else:
        pos = size/2
        if not size % 2:
            polyAdd(pos-1, pal)
        else:
            pal[pos] += 1
            if pal[pos] > 57:
                pal[pos] = 48
                polyAdd(pos, pal, 1)
            else:
                copy(pal, size/2, 1, 1)
        
    print pal.tostring()

#print time.clock() - tm
#!/usr/bin/env python
from array import array
size = int(raw_input())
while size:
    line = array('c', ' '+raw_input())
    res = ''
    down = 1
    max = len(line) - 1
    up = max / size
    twsize = size*2
    for _ in xrange(size):
        pos = twsize + 1
        res += line[down]
        for _ in xrange(up):
            if pos - down > max:
                break
            res += line[pos - down]
            if pos + down - 1 <= max:
                res += line[pos + down - 1]
            pos += twsize
        down += 1
        
    print res
        
    size = int(raw_input())
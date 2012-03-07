#!/usr/bin/env python
import sys
from cStringIO import StringIO
import gc
gc.disable()

nums = {'S': 0, '.': 1, '..': 2, '...': 3, '....': 4, '-': 5, '.-': 6, '..-': 7, '...-': 8, '....-': 9, '--': 10,
        '.--': 11, '..--': 12, '...--': 13, '....--': 14, '---': 15, '.---': 16, '..---': 17, '...---': 18, '....---': 19}
pows = [0, 1, 20, 360, 7200, 144000, 2880000, 57600000, 1152000000]

def main():
    out = StringIO()
    size = int(sys.stdin.readline())
    while size:
        res = 0
        for pow in xrange(size, 0, -1):
            num = nums[ sys.stdin.readline().replace(' ', '').strip() ]
            res += num*pows[pow]                   
        out.write(str(res)+'\n')
        sys.stdin.readline()
        size = int(sys.stdin.readline())
    print out.getvalue()
        
main()
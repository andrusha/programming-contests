#!/usr/bin/env python
import sys
from cStringIO import StringIO
import psyco
psyco.full()

def main():
    out = StringIO()
    sys.stdin.readline()
    sum = 0
    for t in sys.stdin.readlines():
        x, y = map(int, t.split(' '))
        if (y == x or y + 2 == x ):
            out.write( str( x * 2 - (x - y) - (x % 2) ) + '\n')
        else:
            out.write('No Number\n')
    print out.getvalue()

main()
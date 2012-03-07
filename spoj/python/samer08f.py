#!/usr/bin/env python
import sys
from cStringIO import StringIO
#import psyco
#psyco.full()

def pairs(x):
    result = 1
    for n in xrange(1, x):
        result += (x - n + 1)**2
    return result

def main():
    out = StringIO()
    x = int(sys.stdin.readline())
    while x:
        out.write(str(pairs(x))+'\n')
        x = int(sys.stdin.readline())
    print out.getvalue()

main()
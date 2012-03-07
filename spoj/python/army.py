#!/usr/bin/env python
import sys
from cStringIO import StringIO
#import psyco
#psyco.full()
import gc
gc.disable()

def main():
    out = StringIO()
    T = int(sys.stdin.readline())
    for _ in xrange(T):
        sys.stdin.readline()
        sys.stdin.readline()
        if max(map(int, sys.stdin.readline().split(' '))) < max(map(int, sys.stdin.readline().split(' '))):
            out.write('MechaGodzilla\n')
        else:
            out.write('Godzilla\n')
    print out.getvalue()

main()
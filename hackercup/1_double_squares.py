#!/bin/env python
import math
import sys

def factorize(x):
    #upper bound
    up = int(math.sqrt(x))
    count = 0

    for a in xrange(up+1):
        a2 = a**2
        for b in xrange(a+1):
            b2 = b**2
            if a2 + b2 == x:
                #print '%i^2 + %i^2 = %i' % (a, b, x)
                count += 1

    return count

if __name__ == '__main__':
    f = open(sys.argv[1], 'r')
    N = int(f.readline())

    for _ in xrange(N):
        x = int(f.readline())
        #print '%i: %i' % (x, factorize(x))
        print factorize(x)

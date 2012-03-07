#!/bin/env python

import sys

f = open(sys.argv[1], 'r')
n = int(f.readline())
for _ in xrange(n):
    print ''.join(sorted(f.readline().strip().split(' ')[1:]))

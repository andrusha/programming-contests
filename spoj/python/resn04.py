#!/usr/bin/env python

T = int(raw_input())
for _ in xrange(T):
    N = int(raw_input())
    piles = raw_input().split(' ')
    print ['BOB', 'ALICE'][ sum( [x / int(y) for x, y in enumerate(piles, start = 1)] ) % 2 ]
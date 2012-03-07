#!/usr/bin/env python
pows = [5**x for x in xrange(1, 15)]
T = int(raw_input())
for _ in xrange(T):
    N = int(raw_input())
    res = 0
    for pow in pows:
        res += N / pow
    print(res)
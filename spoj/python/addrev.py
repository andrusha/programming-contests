#!/usr/bin/env python
N = int(raw_input())
for _ in xrange(N):
    x, y = raw_input().split(' ')
    print(int(str(int(x[::-1]) + int(y[::-1]))[::-1]))
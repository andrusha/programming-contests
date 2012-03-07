#!/usr/bin/env python2.7

import Image
from itertools import product, imap, izip, ifilter

def write(data, size, fname):
    im = Image.new("RGB", size)
    im.putdata(list(data))
    im.save(fname)

def main():
    orig = Image.open("11_cave.jpg")
    H, W = orig.size
    size = (H//2, W//2)

    flip = lambda x: (x[1], x[0])
    #flip = lambda x: x
    odd = lambda x: x[0][0] % 2 == 0 and x[0][1] % 2 == 0
    even = lambda x: x[0][0] % 2 == 1 and x[0][1] % 2 == 1
    snd = lambda x: x[1]
    part = lambda f, p: imap(snd, ifilter(f, p))

    points = izip(imap(flip, product(xrange(W), xrange(H))), orig.getdata())
    write(part(odd, points), size, '11_odd.png')
    write(part(even, points), size, '11_even.png')

main()

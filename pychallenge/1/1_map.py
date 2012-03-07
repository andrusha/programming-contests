#!/usr/bin/env python3

import sys

# http://www.pythonchallenge.com/pc/def/map.html

# Mapping symbol from one to another
def shift(symbol):
    if 'a' <= symbol <= 'z':
        relative = lambda x: ord(x) - ord('a')
        real     = lambda x: ord('a') + x
        tochr    = lambda x: chr(real(x))

        return tochr((relative(symbol) + 2) % (relative('z') + 1))
    else:
        return symbol

string = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
url = "pc/def/map.html"

if len(sys.argv) == 1:
    print ('Usage: 1_map.py "string"')
    sys.exit()

print(''.join(map(shift, sys.argv[1])))

#!/usr/bin/env python3

# http://www.pythonchallenge.com/pc/def/linkedlist.php

import re
from urllib.request import urlopen

def nexturl(cur_id, counter = 0):
    pattern = re.compile(r'and the next nothing is ([0-9]*)', re.I)
    url = "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=%i" % cur_id

    counter += 1
    resp = urlopen(url).read().decode('utf-8')
    print(resp)

    match = pattern.search(resp)
    end = match is None
    if not end:
        next_id = int(match.group(1))

    if counter >= 400 or end:
        return
    else:
        nexturl(next_id, counter)

if __name__ == '__main__':
    # nexturl(12345)
    nexturl(46059)

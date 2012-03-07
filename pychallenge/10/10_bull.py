#!/usr/bin/env python2.7

# http://www.pythonchallenge.com/pc/return/bull.html

import re

a = '1'
for _ in xrange(30):
    a = ''.join( map(lambda x: str(len(x.group(0)))+x.group(0)[0], re.finditer(r"(\d)\1*", a)))

print(len(a)) #5808

#!/usr/bin/env python3

# http://www.pythonchallenge.com/pc/def/channel.html

import re
from zipfile import ZipFile

num = 90052

pattern = re.compile(r'next nothing is ([0-9]*)', re.I)
with ZipFile('channel.zip', 'r') as z:

    match = True
    while match is not None and num:
        name = '%i.txt' % num

        comment = z.getinfo(name).comment.decode('utf-8')
        print(comment, end='')

        text = z.read(name).decode('utf-8')
        match = pattern.search(text)
        if match is not None:
            num = int(match.group(1))

# hockey
# oxygen
